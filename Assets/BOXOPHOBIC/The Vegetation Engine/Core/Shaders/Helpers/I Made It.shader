// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Helpers/I Made It"
{
	Properties
	{
		[StyledBanner(I Made It)]_Banner("Banner", Float) = 0
		[StyledMessage(Info, Use this helper shader to set your maps and the converter will pack them to be used with the vegetation shaders. All the other parameters will be set on the vegetation materials., 5, 5 )]_MainMessage("!!! Main Message !!!", Float) = 0
		[StyledCategory(Settings)]_SettingsCategory("[ Settings Category ]", Float) = 0
		[Enum(Leaf,0,Bark,1)]_ShaderMode("Shader Mode", Float) = 0
		[Enum(Subsurface Map,0,Thickness Map,1)]_SubsurfaceMode("Subsurface Mode", Float) = 0
		[StyledCategory(Base Maps)]_BaseCategory("[ Base Category ]", Float) = 0
		[NoScaleOffset]_AlbedoTex("Albedo (RGB) Alpha (A)", 2D) = "white" {}
		[NoScaleOffset]_NormalTex("Normal", 2D) = "bump" {}
		[StyledCategory(Surface Maps)]_SurfaceCategory("[ Surface Category ]", Float) = 0
		[StyledMessage(Info, Use a Mask Map for the surface shading. If any separate map is added the converter will pack that specific map., 5, 10 )]_SurfaceMessage("!!! Surface Message !!!", Float) = 0
		[HideInInspector]_Float6("Float 6", Float) = 0.5
		[NoScaleOffset]_MaskTex("Mask Metallic (R) Occlusion (G) Smoothness (A)", 2D) = "gray" {}
		[NoScaleOffset]_MetallicTex("Metallic", 2D) = "gray" {}
		[NoScaleOffset]_OcclusionTex("Occlusion", 2D) = "gray" {}
		[NoScaleOffset]_SmoothnessTex("Smoothness", 2D) = "gray" {}
		[StyledCategory(Leaf Maps)]_LeafCategory("[ Leaf Category ]", Float) = 0
		[StyledMessage(Info, The Subsurface will be packed in the Main Mask blue channel for foliage shaders. Add this map only for leaf materials., 5, 10 )]_LeafMessage("!!! Leaf Message !!!", Float) = 0
		[NoScaleOffset]_SubsurfaceTex("Subsurface or Thickness", 2D) = "gray" {}
		[StyledCategory(Bark Maps)]_BarkCategory("[ Bark Category ]", Float) = 0
		[StyledMessage(Info, The Height or Detail Mask will be packed in the Main Mask blue channel for bark shaders. Add this map only for bark materials., 5, 10 )]_BarkMessage("!!! Bark Message !!!", Float) = 0
		[NoScaleOffset]_HeightTex("Height or Detail Mask", 2D) = "gray" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "AlphaTest+0" "IgnoreProjector" = "True" "DisableBatching" = "True" }
		Cull Off
		Offset  0 , 1
		CGPROGRAM
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma exclude_renderers d3d9 d3d11_9x gles 
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows novertexlights nodynlightmap dithercrossfade 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform half _Banner;
		uniform float _SubsurfaceMode;
		uniform sampler2D _SubsurfaceTex;
		uniform sampler2D _SmoothnessTex;
		uniform sampler2D _OcclusionTex;
		uniform sampler2D _HeightTex;
		uniform sampler2D _MaskTex;
		uniform sampler2D _MetallicTex;
		uniform float _MainMessage;
		uniform float _LeafMessage;
		uniform half _BaseCategory;
		uniform half _SurfaceCategory;
		uniform half _LeafCategory;
		uniform half _BarkCategory;
		uniform half _SettingsCategory;
		uniform float _SurfaceMessage;
		uniform float _ShaderMode;
		uniform float _BarkMessage;
		uniform sampler2D _NormalTex;
		uniform sampler2D _AlbedoTex;
		uniform float _Float6;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_NormalTex438 = i.uv_texcoord;
			o.Normal = UnpackNormal( tex2D( _NormalTex, uv_NormalTex438 ) );
			float2 uv_AlbedoTex437 = i.uv_texcoord;
			float4 tex2DNode437 = tex2D( _AlbedoTex, uv_AlbedoTex437 );
			o.Albedo = tex2DNode437.rgb;
			o.Alpha = 1;
			clip( tex2DNode437.a - _Float6 );
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18103
1927;1;1906;1021;2874.886;968.3409;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-768;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(I Made It);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;451;-1728,-512;Inherit;False;Property;_LeafMessage;!!! Leaf Message !!!;15;0;Create;True;0;0;True;1;StyledMessage(Info, The Subsurface will be packed in the Main Mask blue channel for foliage shaders. Add this map only for leaf materials., 5, 10 );False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;445;-2176,832;Inherit;True;Property;_OcclusionTex;Occlusion;12;1;[NoScaleOffset];Create;False;0;0;True;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;443;-2016,-768;Inherit;False;Constant;_Float6;Float 6;9;1;[HideInInspector];Create;True;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;440;-2176,384;Inherit;True;Property;_MaskTex;Mask Metallic (R) Occlusion (G) Smoothness (A);10;1;[NoScaleOffset];Create;False;0;0;True;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;450;-1328,-768;Inherit;False;Property;_SubsurfaceMode;Subsurface Mode;4;1;[Enum];Create;False;2;Subsurface Map;0;Thickness Map;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;449;-2176,1376;Inherit;True;Property;_SubsurfaceTex;Subsurface or Thickness;16;1;[NoScaleOffset];Create;False;0;0;True;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;446;-2176,1024;Inherit;True;Property;_SmoothnessTex;Smoothness;13;1;[NoScaleOffset];Create;False;0;0;True;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;438;-2176,128;Inherit;True;Property;_NormalTex;Normal;7;1;[NoScaleOffset];Create;False;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;455;-2176,-640;Half;False;Property;_SettingsCategory;[ Settings Category ];2;0;Create;True;0;0;True;1;StyledCategory(Settings);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;437;-2176,-128;Inherit;True;Property;_AlbedoTex;Albedo (RGB) Alpha (A);6;1;[NoScaleOffset];Create;False;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;435;-1952,-640;Half;False;Property;_BaseCategory;[ Base Category ];5;0;Create;True;0;0;True;1;StyledCategory(Base Maps);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;453;-1504,-512;Inherit;False;Property;_BarkMessage;!!! Bark Message !!!;18;0;Create;True;0;0;True;1;StyledMessage(Info, The Height or Detail Mask will be packed in the Main Mask blue channel for bark shaders. Add this map only for bark materials., 5, 10 );False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;447;-1536,-640;Half;False;Property;_LeafCategory;[ Leaf Category ];14;0;Create;True;0;0;True;1;StyledCategory(Leaf Maps);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;441;-1760,-640;Half;False;Property;_SurfaceCategory;[ Surface Category ];8;0;Create;True;0;0;True;1;StyledCategory(Surface Maps);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;452;-1312,-640;Half;False;Property;_BarkCategory;[ Bark Category ];17;0;Create;True;0;0;True;1;StyledCategory(Bark Maps);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;444;-1968,-512;Inherit;False;Property;_SurfaceMessage;!!! Surface Message !!!;9;0;Create;True;0;0;True;1;StyledMessage(Info, Use a Mask Map for the surface shading. If any separate map is added the converter will pack that specific map., 5, 10 );False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;454;-1520,-768;Inherit;False;Property;_ShaderMode;Shader Mode;3;1;[Enum];Create;False;2;Leaf;0;Bark;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;448;-2176,1568;Inherit;True;Property;_HeightTex;Height or Detail Mask;19;1;[NoScaleOffset];Create;False;0;0;True;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;357;-2176,-512;Inherit;False;Property;_MainMessage;!!! Main Message !!!;1;0;Create;True;0;0;True;1;StyledMessage(Info, Use this helper shader to set your maps and the converter will pack them to be used with the vegetation shaders. All the other parameters will be set on the vegetation materials., 5, 5 );False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;442;-2176,640;Inherit;True;Property;_MetallicTex;Metallic;11;1;[NoScaleOffset];Create;False;0;0;True;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-1376,-128;Float;False;True;-1;2;;0;0;Standard;BOXOPHOBIC/The Vegetation Engine/Helpers/I Made It;False;False;False;False;False;True;False;True;False;False;False;False;True;True;True;False;True;False;False;False;True;Off;0;False;17;0;False;-1;True;0;False;-1;1;False;-1;False;0;Custom;0.5;True;True;0;True;Opaque;;AlphaTest;All;11;d3d11;glcore;gles3;metal;vulkan;xbox360;xboxone;ps4;psp2;n3ds;wiiu;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;1;False;20;0;False;7;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;10;-1;0;True;443;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-256;Inherit;False;1024.392;100;Final;0;;0.3439424,0.5960785,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-896;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
WireConnection;0;0;437;0
WireConnection;0;1;438;0
WireConnection;0;10;437;4
ASEEND*/
//CHKSM=A0FD0ED2823C0ABE2ADC56682B90F0CF9DC66CF3