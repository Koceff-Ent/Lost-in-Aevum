// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using Boxophobic.StyledGUI;
using System.Collections.Generic;

#if UNITY_EDITOR
using UnityEditor.SceneManagement;
#endif

namespace TheVegetationEngine
{
    [ExecuteInEditMode]
    public class TVEManager : StyledMonoBehaviour
    {
        public static TVEManager Instance;

        [StyledBanner(0.890f, 0.745f, 0.309f, "The Vegetation Engine", "", "https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#heading=h.hbq3w8ae720x")]
        public bool styledBanner;

        int assetVersion = 170;
        [HideInInspector]
        public int userVersion;

        [HideInInspector]
        public bool isInitialized = false;

        [HideInInspector]
        public TVEGlobalMotion globalMotion;
        [HideInInspector]
        public TVEGlobalSeasons globalSeasons;
        [HideInInspector]
        public TVEGlobalOverlay globalOverlay;
        [HideInInspector]
        public TVEGlobalWetness globalWetness;
        [HideInInspector]
        public TVEGlobalSizeFade globalSizeFade;
        [HideInInspector]
        public TVEMotionVolume motionVolume;
        [HideInInspector]
        public TVEColorsVolume colorsVolume;
        [HideInInspector]
        public TVEExtrasVolume extrasVolume;
        [HideInInspector]
        public TVEGlobalVolume globalVolume;

#if !UNITY_2019_3_OR_NEWER
        [StyledSpace(5)]
        public bool styledSpace0;
#endif

        void OnEnable()
        {
            Instance = this;

            if (globalMotion == null)
            {
                GameObject go = new GameObject();

                go.AddComponent<MeshFilter>();
                go.GetComponent<MeshFilter>().mesh = Resources.Load<Mesh>("ArrowMesh");

                go.AddComponent<MeshRenderer>();
                go.GetComponent<MeshRenderer>().sharedMaterial = Resources.Load<Material>("ArrowMotion");

                go.AddComponent<TVEGlobalMotion>();

                SetParent(go);

                go.transform.localPosition = new Vector3(0, 2f, 0);

                globalMotion = go.GetComponent<TVEGlobalMotion>();
                globalMotion.enabled = true;
            }

            if (globalSeasons == null)
            {
                GameObject go = new GameObject();
                go.AddComponent<TVEGlobalSeasons>();
                SetParent(go);

                globalSeasons = go.GetComponent<TVEGlobalSeasons>();
            }

            if (globalOverlay == null)
            {
                GameObject go = new GameObject();
                go.AddComponent<TVEGlobalOverlay>();

                SetParent(go);

                globalOverlay = go.GetComponent<TVEGlobalOverlay>();
            }

            if (globalWetness == null)
            {
                GameObject go = new GameObject();
                go.AddComponent<TVEGlobalWetness>();
                SetParent(go);

                globalWetness = go.GetComponent<TVEGlobalWetness>();
            }

            if (globalSizeFade == null)
            {
                GameObject go = new GameObject();
                go.AddComponent<TVEGlobalSizeFade>();
                SetParent(go);

                globalSizeFade = go.GetComponent<TVEGlobalSizeFade>();
            }

            if (globalVolume == null)
            {
                GameObject go = new GameObject();
                go.AddComponent<TVEGlobalVolume>();
                SetParent(go);

                go.transform.localScale = new Vector3(200, 200, 200);

                globalVolume = go.GetComponent<TVEGlobalVolume>();
                globalVolume.globalMotion = globalMotion.gameObject;
            }

            if (isInitialized == false)
            {
                Debug.Log("[The Vegetation Engine] " + "The Vegetation Engine is set in the current scene! Check the Documentation for the next steps!");
                userVersion = assetVersion;
                isInitialized = true;
            }

            if (userVersion < 150)
            {
                UpdateTo150();
            }
        }

        void Start()
        {
            if (userVersion < 150)
            {
                userVersion = 150;
#if UNITY_EDITOR
                Debug.Log("[The Vegetation Engine] Global Volume and Elements updated to 1.5.0!");

                if (Application.isPlaying == false)
                {
                    EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
                }
#endif
            }
        }

        //void Update()
        //{
        //    if (gameObject.name != "The Vegetation Engine")
        //    {
        //        gameObject.name = "The Vegetation Engine";
        //    }
        //}

        void SetParent(GameObject go)
        {
            go.transform.parent = gameObject.transform;
            go.transform.localPosition = Vector3.zero;
            go.transform.eulerAngles = Vector3.zero;
            go.transform.localScale = Vector3.one;
        }

        void SetParentAndYOffset(GameObject go)
        {
            go.transform.parent = gameObject.transform;
            go.transform.localPosition = new Vector3(0, 25, 0);
            go.transform.eulerAngles = Vector3.zero;
            go.transform.localScale = Vector3.one;
        }

        void UpdateTo150()
        {
            // Update volumes to one global volume
            if (motionVolume != null)
            {
                globalVolume.gameObject.transform.position = motionVolume.transform.position;

                var scale = new Vector3(motionVolume.volumeSize, motionVolume.volumeHeight * 2, motionVolume.volumeSize);
                globalVolume.gameObject.transform.localScale = scale;

                globalVolume.renderResolution = motionVolume.renderResolution;
                globalVolume.renderResolutionOld = motionVolume.renderResolutionOld;
                globalVolume.renderWrapMode = motionVolume.renderWrapMode;
                globalVolume.renderWrapModeOld = motionVolume.renderWrapModeOld;

                if (motionVolume.gameObject != null)
                {
                    DestroyImmediate(motionVolume.gameObject);
                }

                if (colorsVolume.gameObject != null)
                {
                    DestroyImmediate(colorsVolume.gameObject);
                }

                if (extrasVolume.gameObject != null)
                {
                    DestroyImmediate(extrasVolume.gameObject);
                }
            }

            // Update elements to the new save system
            var elements = FindObjectsOfType<TVEElement>();

            for (int i = 0; i < elements.Length; i++)
            {
                var data = elements[i].data;

                if (data != null)
                {
                    if (data.elementShader != null)
                    {
                        var materialData = new TVEElementMaterialData();
                        materialData.props = new List<TVEElementPropertyData>();

                        materialData.shader = data.elementShader;

                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Value, "_ElementIntensity", data.elementIntensity));
                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Value, "_ElementMode", data.elementMode));

                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Texture, "_MainTex", data.mainTex));
                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Vector, "_MainUVs", data.mainUVs));

                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Vector, "_MainColor", data.main));
                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Vector, "_MainColorHDR", data.main));
                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Vector, "_WinterColor", data.winter));
                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Vector, "_SpringColor", data.spring));
                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Vector, "_SummerColor", data.summer));
                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Vector, "_AutumnColor", data.autumn));

                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Value, "_MainValue", data.main.w));
                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Value, "_WinterValue", data.winter.w));
                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Value, "_SpringValue", data.spring.w));
                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Value, "_SummerValue", data.summer.w));
                        materialData.props.Add(new TVEElementPropertyData(PropertyType.Value, "_AutumnValue", data.autumn.w));

                        elements[i].materialData = materialData;
                    }
                }
            }
        }
    }
}