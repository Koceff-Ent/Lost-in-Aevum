//Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;

public class TVEShaderElementGUI : ShaderGUI
{
    public override void AssignNewShaderToMaterial(Material material, Shader oldShader, Shader newShader)
    {
        base.AssignNewShaderToMaterial(material, oldShader, newShader);

        AssignDefaultTexture(material, newShader);
    }

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
    {
        base.OnGUI(materialEditor, props);
    }

    void AssignDefaultTexture(Material material, Shader shader)
    {
        if (shader.name.Contains("Interaction"))
        {
            material.SetTexture("_MainTex", Resources.Load<Material>("Internal Interaction").GetTexture("_MainTex"));
        }
        else if (shader.name.Contains("Flow"))
        {
            material.SetTexture("_MainTex", Resources.Load<Material>("Internal Flow").GetTexture("_MainTex"));
        }
        else
        {
            material.SetTexture("_MainTex", Resources.Load<Material>("Internal Colors").GetTexture("_MainTex"));
        }
    }
}

