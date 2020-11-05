// Cristian Pop - https://boxophobic.com/

using System.Collections.Generic;
using UnityEngine;

namespace TheVegetationEngine
{
    [System.Serializable]
    public class TVEElementMaterialData
    {
        public Shader shader;
        public List<TVEElementPropertyData> props;

        public TVEElementMaterialData()
        {

        }
    }

    [System.Serializable]
    public class TVEElementPropertyData
    {
        public PropertyType type;
        public string prop;
        public Texture texture;
        public Vector4 vector;
        public float value;

        public TVEElementPropertyData(PropertyType type, string prop, Texture texture)
        {
            this.type = type;
            this.prop = prop;
            this.texture = texture;
        }

        public TVEElementPropertyData(PropertyType type, string prop, Vector4 vector)
        {
            this.type = type;
            this.prop = prop;
            this.vector = vector;
        }

        public TVEElementPropertyData(PropertyType type, string prop, float value)
        {
            this.type = type;
            this.prop = prop;
            this.value = value;
        }
    }

    [System.Serializable]
    public class TVEElementDrawerData
    {
        public ElementType elementType;
        public RendererType rendererType;
        public GameObject gameobject;
        public Mesh mesh;
        public Renderer renderer;

        public TVEElementDrawerData(ElementType elementType, RendererType rendererType, GameObject gameobject, Mesh mesh, Renderer renderer)
        {
            this.elementType = elementType;
            this.rendererType = rendererType;
            this.gameobject = gameobject;
            this.mesh = mesh;
            this.renderer = renderer;
        }
    }

    // Legacy Data
    [System.Serializable]
    public class TVEElementData
    {
        public Shader elementShader;

        public float elementIntensity = 1;
        public float elementMode = 0;

        public Texture mainTex;
        public Vector4 mainUVs = new Vector4(1, 1, 0, 0);

        public Vector4 main = new Vector4(0.5f, 0.5f, 0.5f, 1f);
        public Vector4 winter = new Vector4(0.5f, 0.5f, 0.5f, 1f);
        public Vector4 spring = new Vector4(0.5f, 0.5f, 0.5f, 1f);
        public Vector4 summer = new Vector4(0.5f, 0.5f, 0.5f, 1f);
        public Vector4 autumn = new Vector4(0.5f, 0.5f, 0.5f, 1f);

        public float priority = 0;

        public TVEElementData()
        {

        }
    }
}