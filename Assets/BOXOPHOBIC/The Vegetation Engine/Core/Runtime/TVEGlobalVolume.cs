// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using Boxophobic.StyledGUI;
using UnityEngine.Rendering;
using System.Collections.Generic;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace TheVegetationEngine
{
    [ExecuteInEditMode]
    [AddComponentMenu("BOXOPHOBIC/The Vegetation Engine/TVE Global Volume")]
    public class TVEGlobalVolume : StyledMonoBehaviour
    {
        [StyledBanner(0.890f, 0.745f, 0.309f, "Global Volume", "", "https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#heading=h.a39m1w5ouu94")]
        public bool styledBanner;

        [Range(0.0f, 1.0f)]
        public float volumeVisibility = 1f;

        [Space(10)]
        public Transform followTransform;
        public int followGridSize = 50;

        [Space(10)]
        public ElementsVisibility elementsVisibility = ElementsVisibility.HiddenInGame;
        [HideInInspector]
        public ElementsVisibility elementsVisibilityOld = ElementsVisibility.HiddenInGame;

        public ElementsSorting elementsSorting = ElementsSorting.Once;

        public float elementsFadeStart = 0;
        public float elementsFadeEnd = 0;

        [Space(10)]
        public TextureSizes renderResolution = TextureSizes._1024;
        [HideInInspector]
        public TextureSizes renderResolutionOld = TextureSizes._1024;

        public TextureWrapMode renderWrapMode = TextureWrapMode.Repeat;
        [HideInInspector]
        public TextureWrapMode renderWrapModeOld = TextureWrapMode.Repeat;

        [Space(10)]
        public RenderPreview renderPreview = RenderPreview.Motion;

        [Space(10)]
        [StyledTexturePreview]
        public Texture previewTex;

        [StyledSpace(10)]
        public bool styledSpace0;

        [HideInInspector]
        public GameObject globalMotion;
        Vector3 motionDirection = new Vector3(0, 0, 1);
        Color motionBufferColor = new Color(0, 1, 1, 0);
        Color colorsBufferColor = new Color(0.5f, 0.5f, 0.5f, 1);
        Color extrasBufferColor = new Color(1f, 1f, 1f, 1);

        [HideInInspector]
        public List<TVEElementDrawerData> elementsData;

        RenderTexture motionRenderTex;
        RenderTexture colorsRenderTex;
        RenderTexture extrasRenderTex;

        Matrix4x4 modelViewMatrix;
        Matrix4x4 projectionMatrix;
        CommandBuffer motionBuffer;
        CommandBuffer colorsBuffer;
        CommandBuffer extrasBuffer;

        Camera mainCamera;

        void Awake()
        {
            elementsData = new List<TVEElementDrawerData>();

            modelViewMatrix = new Matrix4x4
            (
                new Vector4(1f, 0f, 0f, 0f),
                new Vector4(0f, 0f, -1f, 0f),
                new Vector4(0f, -1f, 0f, 0f),
                new Vector4(0f, 0f, 0f, 1f)
            );
        }

        void Start()
        {
            gameObject.name = "Global Volume";

            if (TVEManager.Instance.globalMotion == null)
            {
                Debug.Log("[TVE] The Vegetation Engine is missing from your scene. Make sure setup TVE first!");
            }
            else
            {
                globalMotion = TVEManager.Instance.globalMotion.gameObject;
            }

            if (QualitySettings.activeColorSpace == ColorSpace.Linear)
            {
                colorsBufferColor = new Color(0.5f, 0.5f, 0.5f, 1.0f).linear;
            }
            else
            {
                colorsBufferColor = new Color(0.5f, 0.5f, 0.5f, 1.0f);
            }

            CreateRenderTexture();
            SortElementObjects();
            SetElementsVisibility();

            motionBuffer = new CommandBuffer();
            motionBuffer.name = "TVE Render Motion";
            motionBuffer.ClearRenderTarget(true, true, motionBufferColor);

            colorsBuffer = new CommandBuffer();
            colorsBuffer.name = "TVE Render Colors";
            colorsBuffer.ClearRenderTarget(true, true, colorsBufferColor);

            extrasBuffer = new CommandBuffer();
            extrasBuffer.name = "TVE Render Extras";

            GetMaincamera();

            if (mainCamera == null)
            {
                Debug.Log("[The Vegetation Engine] Main Camera not found! Make sure you have a main camera with Main Camera tag in your scene! Particle elements updating will be skipped without it.");
            }
        }

        void Update()
        {
            UpdateVolumeTransform();

            UpdateDirectionColor();
            SetGlobalShaderParameters();

            if (elementsVisibilityOld != elementsVisibility)
            {
                SetElementsVisibility();

                elementsVisibilityOld = elementsVisibility;
            }

            if (renderResolutionOld != renderResolution || renderWrapModeOld != renderWrapMode)
            {
                ReleaseRenderTexture();
                CreateRenderTexture();

                renderResolutionOld = renderResolution;
                renderWrapModeOld = renderWrapMode;
            }
        }

        void LateUpdate()
        {
            if (Application.isPlaying == false || elementsSorting == ElementsSorting.Realtime)
            {
                SortElementObjects();
            }

            if (motionBuffer == null)
            {
                return;
            }

            DrawElementRenderer();

            if (mainCamera == null)
            {
                GetMaincamera();
            }

            if (mainCamera != null)
            {
                UpdateParticleRenderers();
            }

            ExecuteCommandBuffer();

#if UNITY_EDITOR

            if (renderPreview == RenderPreview.Motion)
            {
                previewTex = motionRenderTex;
            }
            else if (renderPreview == RenderPreview.Colors)
            {
                previewTex = colorsRenderTex;
            }
            else if (renderPreview == RenderPreview.Extras)
            {
                previewTex = extrasRenderTex;
            }

#endif
        }

        void OnDrawGizmos()
        {
            Gizmos.color = new Color(0.890f, 0.745f, 0.309f, volumeVisibility);
            Gizmos.DrawWireCube(new Vector3(gameObject.transform.position.x, gameObject.transform.position.y, gameObject.transform.position.z), new Vector3(gameObject.transform.lossyScale.x, gameObject.transform.lossyScale.y, gameObject.transform.lossyScale.z));
        }

        void GetMaincamera()
        {
            mainCamera = Camera.main;
        }

        void UpdateVolumeTransform()
        {
            gameObject.transform.eulerAngles = Vector3.zero;

            if (followTransform != null)
            {
                var x = Mathf.Round(followTransform.position.x / followGridSize) * followGridSize;
                var z = Mathf.Round(followTransform.position.z / followGridSize) * followGridSize;
                gameObject.transform.position = new Vector3(x, gameObject.transform.position.y, z);
            }
        }

        void UpdateDirectionColor()
        {
            motionDirection = globalMotion.transform.forward;

            motionBufferColor = new Color(motionDirection.x * 0.5f + 0.5f, motionDirection.z * 0.5f + 0.5f, 1.0f, 0.0f);
            //Shader.SetGlobalColor("TVE_MotionDirectionColor", new Color(motionDirection.x * 0.5f + 0.5f, motionDirection.z * 0.5f + 0.5f, 0.0f, 0.0f));
        }

        void CreateRenderTexture()
        {
            motionRenderTex = new RenderTexture((int)renderResolution, (int)renderResolution, 0, RenderTextureFormat.Default);
            motionRenderTex.name = "TVE Motion Tex";
            motionRenderTex.wrapMode = renderWrapMode;

            colorsRenderTex = new RenderTexture((int)renderResolution, (int)renderResolution, 0, RenderTextureFormat.DefaultHDR);
            colorsRenderTex.name = "TVE Colors Tex";
            colorsRenderTex.wrapMode = renderWrapMode;

            extrasRenderTex = new RenderTexture((int)renderResolution, (int)renderResolution, 0, RenderTextureFormat.Default);
            extrasRenderTex.name = "TVE Extras Tex";
            extrasRenderTex.wrapMode = renderWrapMode;

            // Editor fix when rt is created
            SetGlobalShaderParameters();
        }

        void ReleaseRenderTexture()
        {
            motionRenderTex.Release();
            colorsRenderTex.Release();
            extrasRenderTex.Release();
        }

        void SetGlobalShaderParameters()
        {
            var x = 1 / gameObject.transform.lossyScale.x;
            var y = 1 / gameObject.transform.lossyScale.z;
            var z = 1 / gameObject.transform.lossyScale.x * transform.position.x - 0.5f;
            var w = 1 / gameObject.transform.lossyScale.z * transform.position.z - 0.5f;


            Shader.SetGlobalVector("TVE_VolumeCoord", new Vector4(x, y, -z, -w));

            Shader.SetGlobalTexture("TVE_MotionTex", motionRenderTex);
            Shader.SetGlobalTexture("TVE_ColorsTex", colorsRenderTex);
            Shader.SetGlobalTexture("TVE_ExtrasTex", extrasRenderTex);

            if (Application.isPlaying)
            {
                Shader.SetGlobalFloat("TVE_ElementFadeStart", elementsFadeStart);
                Shader.SetGlobalFloat("TVE_ElementFadeEnd", elementsFadeEnd);
            }
            else
            {
                Shader.SetGlobalFloat("TVE_ElementFadeStart", 0);
                Shader.SetGlobalFloat("TVE_ElementFadeEnd", 0);
            }
        }

        void SortElementObjects()
        {
            for (int i = 0; i < elementsData.Count - 1; i++)
            {
                for (int j = 0; j < elementsData.Count - 1; j++)
                {
                    if (elementsData[j] != null && elementsData[j].gameobject.transform.position.y > elementsData[j + 1].gameobject.transform.position.y)
                    {
                        var temp = elementsData[j + 1];
                        elementsData[j + 1] = elementsData[j];
                        elementsData[j] = temp;
                    }
                }
            }
        }

        void DrawElementRenderer()
        {
            motionBuffer.Clear();
            motionBuffer.ClearRenderTarget(true, true, motionBufferColor);

            colorsBuffer.Clear();
            colorsBuffer.ClearRenderTarget(true, true, colorsBufferColor);

            extrasBuffer.Clear();
            extrasBuffer.ClearRenderTarget(true, true, extrasBufferColor);

            for (int i = 0; i < elementsData.Count; i++)
            {
                if (elementsData[i] != null)
                {
                    if (elementsData[i].elementType == ElementType.Motion)
                    {
                        if (elementsData[i].rendererType == RendererType.Mesh)
                        {
                            motionBuffer.DrawMesh(elementsData[i].mesh, elementsData[i].renderer.localToWorldMatrix, elementsData[i].renderer.sharedMaterial);
                        }
                        else
                        {
                            motionBuffer.DrawMesh(elementsData[i].mesh, Matrix4x4.identity, elementsData[i].renderer.sharedMaterial);
                        }
                    }
                    else if (elementsData[i].elementType == ElementType.Colors)
                    {
                        if (elementsData[i].rendererType == RendererType.Mesh)
                        {
                            colorsBuffer.DrawMesh(elementsData[i].mesh, elementsData[i].renderer.localToWorldMatrix, elementsData[i].renderer.sharedMaterial);
                        }
                        else
                        {
                            colorsBuffer.DrawMesh(elementsData[i].mesh, Matrix4x4.identity, elementsData[i].renderer.sharedMaterial);
                        }
                    }
                    else if (elementsData[i].elementType == ElementType.Extras)
                    {
                        if (elementsData[i].rendererType == RendererType.Mesh)
                        {
                            extrasBuffer.DrawMesh(elementsData[i].mesh, elementsData[i].renderer.localToWorldMatrix, elementsData[i].renderer.sharedMaterial);
                        }
                        else
                        {
                            extrasBuffer.DrawMesh(elementsData[i].mesh, Matrix4x4.identity, elementsData[i].renderer.sharedMaterial);
                        }
                    }
                }
            }
        }

        void UpdateParticleRenderers()
        {
            for (int i = 0; i < elementsData.Count; i++)
            {
                if (elementsData[i] != null)
                {
                    if (elementsData[i].rendererType == RendererType.Particle)
                    {
                        var particleRenderer = (ParticleSystemRenderer)elementsData[i].renderer;
                        particleRenderer.BakeMesh(elementsData[i].mesh, true);
                    }
                }
            }
        }

        void ExecuteCommandBuffer()
        {
            var position = gameObject.transform.position;
            var scale = gameObject.transform.lossyScale;

            projectionMatrix = Matrix4x4.Ortho(-scale.x / 2 + position.x, 
                                                scale.x / 2 + position.x, 
                                                scale.z / 2 + -position.z, 
                                                -scale.z / 2 + -position.z, 
                                                -scale.y / 2 + position.y,
                                                scale.y / 2 + position.y);

            GL.PushMatrix();
            RenderTexture currentRenderTexture = RenderTexture.active;

            Graphics.SetRenderTarget(motionRenderTex);
            GL.LoadProjectionMatrix(projectionMatrix);
            GL.modelview = modelViewMatrix;
            Graphics.ExecuteCommandBuffer(motionBuffer);

            Graphics.SetRenderTarget(colorsRenderTex);
            GL.LoadProjectionMatrix(projectionMatrix);
            GL.modelview = modelViewMatrix;
            Graphics.ExecuteCommandBuffer(colorsBuffer);

            Graphics.SetRenderTarget(extrasRenderTex);
            GL.LoadProjectionMatrix(projectionMatrix);
            GL.modelview = modelViewMatrix;
            Graphics.ExecuteCommandBuffer(extrasBuffer);

            RenderTexture.active = currentRenderTexture;
            GL.PopMatrix();
        }

        void SetElementsVisibility()
        {
            if (elementsVisibility == ElementsVisibility.AlwaysHidden)
            {
                DisableElementsVisibility();
            }
            else if (elementsVisibility == ElementsVisibility.AlwaysVisible)
            {
                EnableElementsVisibility();
            }
            else if (elementsVisibility == ElementsVisibility.HiddenInGame)
            {
                if (Application.isPlaying)
                {
                    DisableElementsVisibility();
                }
                else
                {
                    EnableElementsVisibility();
                }
            }
        }

        void EnableElementsVisibility()
        {
            for (int i = 0; i < elementsData.Count; i++)
            {
                if (elementsData[i] != null)
                {
                    elementsData[i].renderer.enabled = true;
                }
            }
        }

        void DisableElementsVisibility()
        {
            for (int i = 0; i < elementsData.Count; i++)
            {
                if (elementsData[i] != null)
                {
                    elementsData[i].renderer.enabled = false;
                }
            }
        }
    }
}
