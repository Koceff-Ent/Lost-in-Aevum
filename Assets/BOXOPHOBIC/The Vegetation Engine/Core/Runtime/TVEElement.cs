// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using Boxophobic.StyledGUI;
using System.Collections.Generic;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace TheVegetationEngine
{
#if UNITY_EDITOR
    [ExecuteInEditMode]
    [AddComponentMenu("BOXOPHOBIC/The Vegetation Engine/TVE Element")]
#endif
    public class TVEElement : StyledMonoBehaviour
    {
        [StyledBanner(0.890f, 0.745f, 0.309f, "Element", "", "https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#heading=h.fd5y8rbb7aia")]
        public bool styledBanner;

        //[StyledMessage("Info", "Find the element shaders under BOXOPHOBIC > The Vegetation Engine > Elements.")]
        //public bool styledShaderMessage = true;

        [StyledMessage("Info", "Using elements in prefabs or creating elements at runtime is not supported if the material is not saved in the project! Find the element shaders under the BOXOPHOBIC/The Vegetation Engine/Elements category.")]
        public bool styledPrefabMessage;

        //[StyledSpace(5)]
        //public bool styledSpaceMessage;

        [HideInInspector]
        public TVEElementData data;
        [HideInInspector]
        public TVEElementMaterialData materialData;

        Renderer meshRenderer;
        Material material;
        Shader shader;

        void OnEnable()
        {
            meshRenderer = gameObject.GetComponent<Renderer>();

            if (meshRenderer.sharedMaterial == null || meshRenderer.sharedMaterial.name == "Element")
            {
                if (materialData == null)
                {
                    materialData = new TVEElementMaterialData();
                }

                if (materialData.shader == null)
                {
#if UNITY_EDITOR
                    material = new Material(Resources.Load<Material>("Internal Colors"));
                    SaveMaterialData(material);
#endif
                }
                else
                {
                    material = new Material(materialData.shader);
                    LoadMaterialData();
                }

                material.name = "Element";
                gameObject.GetComponent<Renderer>().sharedMaterial = material;
            }

            if (meshRenderer.sharedMaterial != null)
            {
                shader = gameObject.GetComponent<Renderer>().sharedMaterial.shader;
            }

            AddElementToVolume();
        }

        private void OnDestroy()
        {
            RemoveElementFromVolume();
        }

        private void OnDisable()
        {
            RemoveElementFromVolume();
        }

#if UNITY_EDITOR
        void Update()
        {
            if (Application.isPlaying)
            {
                return;
            }

            if (Selection.Contains(gameObject))
            {
                if (meshRenderer.sharedMaterial != null && meshRenderer.sharedMaterial.name == "Element")
                {
                    SaveMaterialData(gameObject.GetComponent<Renderer>().sharedMaterial);

                    styledPrefabMessage = true;
                    //styledSpaceMessage = true;
                }
                else
                {
                    styledPrefabMessage = false;
                    //styledSpaceMessage = false;
                }

                if (gameObject.GetComponent<Renderer>().sharedMaterial.shader != shader)
                {
                    gameObject.SetActive(false);
                    gameObject.SetActive(true);
                }
            }
        }
#endif

#if UNITY_EDITOR
        void SaveMaterialData(Material mat)
        {
            materialData = new TVEElementMaterialData();
            materialData.props = new List<TVEElementPropertyData>();

            materialData.shader = mat.shader;

            for (int i = 0; i < ShaderUtil.GetPropertyCount(mat.shader); i++)
            {
                var type = ShaderUtil.GetPropertyType(mat.shader, i);
                var prop = ShaderUtil.GetPropertyName(mat.shader, i);

                if (type == ShaderUtil.ShaderPropertyType.TexEnv)
                {
                    var propData = new TVEElementPropertyData(PropertyType.Texture, prop, mat.GetTexture(prop));
                    materialData.props.Add(propData);
                }

                if (type == ShaderUtil.ShaderPropertyType.Vector || type == ShaderUtil.ShaderPropertyType.Color)
                {
                    var propData = new TVEElementPropertyData(PropertyType.Vector, prop, mat.GetVector(prop));
                    materialData.props.Add(propData);
                }

                if (type == ShaderUtil.ShaderPropertyType.Float || type == ShaderUtil.ShaderPropertyType.Range)
                {
                    var propData = new TVEElementPropertyData(PropertyType.Value, prop, mat.GetFloat(prop));
                    materialData.props.Add(propData);
                }
            }
        }
#endif

        void LoadMaterialData()
        {
            material.shader = materialData.shader;

            for (int i = 0; i < materialData.props.Count; i++)
            {
                if (materialData.props[i].type == PropertyType.Texture)
                {
                    material.SetTexture(materialData.props[i].prop, materialData.props[i].texture);
                }

                if (materialData.props[i].type == PropertyType.Vector)
                {
                    material.SetVector(materialData.props[i].prop, materialData.props[i].vector);
                }

                if (materialData.props[i].type == PropertyType.Value)
                {
                    material.SetFloat(materialData.props[i].prop, materialData.props[i].value);
                }
            }
        }

        void AddElementToVolume()
        {
            if (TVEManager.Instance == null)
                return;

            if (gameObject.GetComponent<MeshRenderer>() != null && gameObject.GetComponent<MeshRenderer>().sharedMaterial != null)
            {
                var material = gameObject.GetComponent<MeshRenderer>().sharedMaterial;
                var data = new TVEElementDrawerData(ElementType.Undefined, RendererType.Mesh, gameObject, gameObject.GetComponent<MeshFilter>().sharedMesh, gameObject.GetComponent<Renderer>());

                if (material.HasProperty("_IsMotionShader"))
                {
                    data.elementType = ElementType.Motion;
                    TVEManager.Instance.globalVolume.elementsData.Add(data);
                }

                if (material.HasProperty("_IsColorsShader"))
                {
                    data.elementType = ElementType.Colors;
                    TVEManager.Instance.globalVolume.elementsData.Add(data);
                }

                if (material.HasProperty("_IsExtrasShader"))
                {
                    data.elementType = ElementType.Extras;
                    TVEManager.Instance.globalVolume.elementsData.Add(data);
                }

            }
            else if (gameObject.GetComponent<ParticleSystemRenderer>() != null && gameObject.GetComponent<ParticleSystemRenderer>().sharedMaterial != null)
            {
                var material = gameObject.GetComponent<ParticleSystemRenderer>().sharedMaterial;
                var data = new TVEElementDrawerData(ElementType.Undefined, RendererType.Particle, gameObject, new Mesh(), gameObject.GetComponent<Renderer>());

                if (material.HasProperty("_IsMotionShader"))
                {
                    data.elementType = ElementType.Motion;
                    TVEManager.Instance.globalVolume.elementsData.Add(data);
                }

                if (material.HasProperty("_IsColorsShader"))
                {
                    data.elementType = ElementType.Colors;
                    TVEManager.Instance.globalVolume.elementsData.Add(data);
                }

                if (material.HasProperty("_IsExtrasShader"))
                {
                    data.elementType = ElementType.Extras;
                    TVEManager.Instance.globalVolume.elementsData.Add(data);
                }
            }
        }

        void RemoveElementFromVolume()
        {
            if (TVEManager.Instance == null)
                return;

            var elements = TVEManager.Instance.globalVolume.elementsData;

            if (elements != null)
            {
                for (int i = 0; i < elements.Count; i++)
                {
                    if (elements[i].gameobject == gameObject)
                    {
                        elements.RemoveAt(i);
                    }
                }
            }
        }

        void OnDrawGizmosSelected()
        {
            Gizmos.color = new Color(0.890f, 0.745f, 0.309f, 1f);
            Gizmos.DrawWireCube(transform.position, new Vector3(transform.lossyScale.x, 0, transform.lossyScale.z));
        }

        void OnDrawGizmos()
        {
            Gizmos.color = new Color(0.890f, 0.745f, 0.309f, 0.1f);
            Gizmos.DrawWireCube(transform.position, new Vector3(transform.lossyScale.x, 0, transform.lossyScale.z));
        }
    }
}
