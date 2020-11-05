// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Objects/Prop Standard Lit"
{
	Properties
	{
		[StyledBanner(Prop Standard Lit)]_Banner("Banner", Float) = 0
		[StyledCategory(Render Settings)]_RenderingCat("[ Rendering Cat ]", Float) = 0
		[Enum(Opaque,0,Transparent,1)]_render_mode("Render Mode", Float) = 0
		[Enum(Both,0,Back,1,Front,2)]_render_cull("Render Faces", Float) = 0
		[Enum(Flip,0,Mirror,1,None,2)]_render_normals("Render Normals", Float) = 0
		[Enum(Alpha,0,Premultiply,1)]_render_blend("Render Blending", Float) = 0
		[Enum(Off,0,On,1)]_render_zw("Render ZWrite", Float) = 1
		[IntRange]_render_priority("Render Priority", Range( -100 , 100)) = 0
		[Enum(Off,0,On,1)][Space(10)]_render_clip("Alpha Clipping", Float) = 0
		_Cutoff("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledCategory(Global Settings)]_GlobalCat("[ Global Cat ]", Float) = 0
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		[HideInInspector][ASEDiffusionProfile(_SubsurfaceDiffusion)]_SubsurfaceDiffusion_asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledCategory(Main Settings)]_MainCat("[ Main Cat ]", Float) = 0
		_MainColor("Main Color", Color) = (1,1,1,1)
		[NoScaleOffset]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset]_MainNormalTex("Main Normal", 2D) = "gray" {}
		[NoScaleOffset]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainMetallicValue("Main Metallic (R)", Range( 0 , 1)) = 0
		_MainOcclusionValue("Main Occlusion (G)", Range( 0 , 1)) = 1
		_MainSmoothnessValue("Main Smoothness (A)", Range( 0 , 1)) = 1
		[StyledCategory(Detail Settings)]_DetailShadingCat("[ Detail Cat ]", Float) = 0
		[Enum(Off,0,Overlay,1,Height,2)]_DetailMode("Detail Mode", Float) = 0
		[Enum(Main Mask,0,Detail Mask,1)]_MaskMode("Detail Mask", Float) = 0
		[Enum(UV 0,0,UV 2,1)]_DetailCoordMode("Detail Coord", Float) = 0
		[Space(10)]_SecondColor("Detail Color", Color) = (1,1,1,1)
		[NoScaleOffset]_SecondAlbedoTex("Detail Albedo", 2D) = "white" {}
		[NoScaleOffset]_SecondNormalTex("Detail Normal", 2D) = "gray" {}
		[NoScaleOffset]_SecondMaskTex("Detail Mask", 2D) = "white" {}
		[Space(10)]_SecondUVs("Detail UVs", Vector) = (1,1,0,0)
		_SecondNormalValue("Detail Normal", Range( -8 , 8)) = 1
		_SecondMetallicValue("Detail Metallic (R)", Range( 0 , 1)) = 0
		_SecondOcclusionValue("Detail Occlusion (G)", Range( 0 , 1)) = 1
		_SecondSmoothnessValue("Detail Smoothness (A)", Range( 0 , 1)) = 1
		[Space(10)]_DetailMeshValue("Detail Mask Offset", Range( -1 , 1)) = 0
		_DetailMaskValue("Detail Mask Power", Range( -1 , 1)) = 0
		_DetailMaskContrast("Detail Mask Contrast", Range( 0 , 1)) = 0.25
		[StyledCategory(Misc Settings)]_MiscCat("[ Misc Cat ]", Float) = 0
		[StyledSpace(10)]_MiscSpace("# Misc Space", Float) = 0
		_OverlayContrast("Overlay Contrast", Range( 0 , 10)) = 1
		[HideInInspector]_MotionAmplitude_10("Primary Bending", Float) = 0
		[HideInInspector]_MotionSpeed_10("Primary Speed", Float) = 2
		[HideInInspector]_MotionScale_10("Primary Elasticity", Float) = 0
		[HideInInspector]_MotionVariation_10("Primary Variation", Float) = 0
		[HideInInspector]_MotionAmplitude_20("Secundary Rolling", Float) = 0
		[HideInInspector]_MotionVertical_20("Secundary Vertical", Float) = 0
		[HideInInspector]_MotionSpeed_20("Secundary Speed", Float) = 5
		[HideInInspector]_MotionScale_20("Secundary Elasticity", Float) = 0
		[HideInInspector]_MotionVariation_20("Secundary Variation", Range( 0 , 5)) = 0
		[HideInInspector]_MotionAmplitude_30("Leaves Amplitude", Float) = 0
		[HideInInspector]_MotionSpeed_30("Leaves Speed", Float) = 15
		[HideInInspector]_MotionScale_30("Leaves Scale", Float) = 30
		[HideInInspector]_MotionVariation_30("Leaves Variation", Float) = 30
		[HideInInspector]_MotionAmplitude_32("Flutter Amplitude", Float) = 0
		[HideInInspector]_MotionSpeed_32("Flutter Speed", Float) = 30
		[HideInInspector]_MotionScale_32("Flutter Elasticity", Float) = 30
		[HideInInspector]_MotionVariation_32("Flutter Variation", Float) = 30
		[HideInInspector]_InteractionAmplitude("Interaction Bending", Float) = 0
		[StyledCategory(Advanced)]_AdvancedCat("[ Advanced Cat]", Float) = 0
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[StyledMessage(Warning, When batching support is enabled the object position is lost and some features will not work as expected. Check the documentation for more information., _material_batching, 1 , 0,5)]_BatchingMessage("# Batching Message", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _tex4coord2( "", 2D ) = "white" {}
		[StyledMessage(Warning, The Pivots Support feature is designed to work with large grass meshes where the object pivot cannot be used for bending motion and interaction. This feature requires per elements baked pivots data. Baked pivots are not supported with Static Batching., _material_pivots, 1 , 0, 5)]_PivotsMessage("# Pivots Message", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 1
		[HideInInspector]_render_dst("_render_dst", Float) = 0
		[HideInInspector]_render_premul("_render_premul", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_Color("_Color", Color) = (0,0,0,0)
		[HideInInspector]_MainTex("_MainTex", 2D) = "white" {}
		[HideInInspector]_VertexOcclusion("_VertexOcclusion", Float) = 0
		[HideInInspector]_MainMaskValue("_MainMaskValue", Float) = 0
		[HideInInspector][Enum(Translucency,0,Thickness,1)]_SubsurfaceMode("_SubsurfaceMode", Float) = 0
		[HideInInspector]_ObjectThicknessValue("_ObjectThicknessValue", Float) = 0
		[HideInInspector][Enum(Constant,0,Variation,1)]_MainColorMode("_MainColorMode", Float) = 1
		[HideInInspector]_VertexPivotMode("Vertex Pivot Mode", Float) = 0
		[HideInInspector]_render_normals_options("_render_normals_options", Vector) = (1,1,1,0)
		[HideInInspector]_IsVersion("_IsVersion", Float) = 170
		[HideInInspector]_IsStandardPipeline("_IsStandardPipeline", Float) = 1
		[HideInInspector]_IsPropShader("_IsPropShader", Float) = 1
		[HideInInspector]_IsAnyPathShader("_IsAnyPathShader", Float) = 1
		[HideInInspector]_IsLitShader("_IsLitShader", Float) = 1
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_Cutoff("_Cutoff", Float) = 0.5
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" }
		Cull [_render_cull]
		ZWrite [_render_zw]
		Offset  0 , -1
		Blend [_render_src] [_render_dst]
		
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma shader_feature_local _ALPHATEST_ON
		#pragma shader_feature_local MATERIAL_USE_DETAIL_OFF MATERIAL_USE_DETAIL_OVERLAY MATERIAL_USE_DETAIL_HEIGHT
		  
		//SHADER INJECTION POINT BEGIN
		//SHADER INJECTION POINT END
		    
		#define MATERIAL_USE_WORLD_DATA
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#endif//ASE Sampling Macros

		#pragma exclude_renderers d3d9 d3d11_9x gles 
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows novertexlights nodynlightmap dithercrossfade vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float2 uv_texcoord;
			float2 uv2_texcoord2;
			float4 vertexColor : COLOR;
			half ASEVFace : VFACE;
			float3 worldNormal;
			INTERNAL_DATA
			float3 worldPos;
			float4 uv2_tex4coord2;
		};

		uniform half _IsAnyPathShader;
		uniform half _ObjectThicknessValue;
		uniform half _MiscSpace;
		uniform float _SubsurfaceMode;
		uniform half _render_dst;
		uniform float _MotionSpeed_32;
		uniform half _InteractionAmplitude;
		uniform half _render_cull;
		uniform float _MotionScale_32;
		uniform half _MotionAmplitude_32;
		uniform half _MotionVertical_20;
		uniform half _MotionAmplitude_30;
		uniform float _MotionSpeed_20;
		uniform half _MotionAmplitude_20;
		uniform half _MotionVariation_20;
		uniform float _MotionVariation_30;
		uniform float _MotionScale_30;
		uniform float _MotionVariation_32;
		uniform float _MotionSpeed_30;
		uniform half _MotionVariation_10;
		uniform half _MotionAmplitude_10;
		uniform float _MotionScale_10;
		uniform float _MotionScale_20;
		uniform half _PivotsMessage;
		uniform float _MotionSpeed_10;
		uniform half _render_normals;
		uniform half _RenderingCat;
		uniform half _BatchingMessage;
		uniform half _MainMaskValue;
		uniform half _render_mode;
		uniform half _render_src;
		uniform half _MainColorMode;
		uniform half _VertexOcclusion;
		uniform half _render_blend;
		uniform half _Cutoff;
		uniform half _render_clip;
		uniform half _IsVersion;
		uniform half _render_priority;
		uniform half _render_zw;
		uniform half _IsTVEShader;
		uniform half _MiscCat;
		uniform half _GlobalCat;
		uniform float4 _Color;
		uniform float4 _SubsurfaceDiffusion_asset;
		uniform half _MainCat;
		uniform half _AdvancedCat;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform half _Banner;
		uniform half _IsPropShader;
		uniform half _IsStandardShader;
		uniform half _IsLitShader;
		uniform half _VertexPivotMode;
		uniform half _IsStandardPipeline;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
		SamplerState sampler_MainNormalTex;
		uniform half4 _MainUVs;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
		SamplerState sampler_MainAlbedoTex;
		uniform half _MainNormalValue;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
		SamplerState sampler_SecondNormalTex;
		uniform half _DetailCoordMode;
		uniform half4 _SecondUVs;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondAlbedoTex);
		SamplerState sampler_SecondAlbedoTex;
		uniform half _SecondNormalValue;
		uniform half _DetailMeshValue;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
		SamplerState sampler_MainMaskTex;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondMaskTex);
		SamplerState sampler_SecondMaskTex;
		uniform half _MaskMode;
		uniform half _DetailMaskValue;
		uniform half _DetailMaskContrast;
		uniform half _DetailMode;
		uniform half _DetailShadingCat;
		uniform half3 _render_normals_options;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_OverlayNormalTex);
		SamplerState samplerTVE_OverlayNormalTex;
		uniform half TVE_OverlayUVTilling;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_OverlayAlbedoTex);
		SamplerState samplerTVE_OverlayAlbedoTex;
		uniform half TVE_OverlayNormalValue;
		uniform half _OverlayContrast;
		uniform half TVE_OverlayIntensity;
		uniform half _GlobalOverlay;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_ExtrasTex);
		SamplerState samplerTVE_ExtrasTex;
		uniform half4 TVE_VolumeCoord;
		uniform half4 _MainColor;
		uniform half4 _SecondColor;
		uniform half4 TVE_OverlayColor;
		uniform half _render_premul;
		uniform half _MainMetallicValue;
		uniform half _SecondMetallicValue;
		uniform half _MainSmoothnessValue;
		uniform half _SecondSmoothnessValue;
		uniform half TVE_OverlaySmoothness;
		uniform float TVE_Wetness;
		uniform half _GlobalWetness;
		uniform half _MainOcclusionValue;
		uniform half _SecondOcclusionValue;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			half3 Off19_g23098 = half3(0,0,0);
			float3 appendResult60_g23113 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			half3 On20_g23098 = ( appendResult60_g23113 * _VertexPivotMode );
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23098 = On20_g23098;
			#else
				float3 staticSwitch14_g23098 = Off19_g23098;
			#endif
			half3 ObjectData20_g23099 = staticSwitch14_g23098;
			half3 WorldData19_g23099 = Off19_g23098;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23099 = WorldData19_g23099;
			#else
				float3 staticSwitch14_g23099 = ObjectData20_g23099;
			#endif
			float3 Mesh_PivotsOS2291_g18705 = staticSwitch14_g23099;
			float Vertex_SizeFade1740_g18705 = 1.0;
			half Vertex_Size1741_g18705 = 1.0;
			float3 Final_VertexPosition890_g18705 = ( ( ( ( ase_vertex3Pos - Mesh_PivotsOS2291_g18705 ) * Vertex_SizeFade1740_g18705 * Vertex_Size1741_g18705 ) + Mesh_PivotsOS2291_g18705 ) + ( _IsStandardPipeline * 0.0 ) );
			v.vertex.xyz = Final_VertexPosition890_g18705;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			half2 Main_UVs15_g18705 = ( ( i.uv_texcoord * (_MainUVs).xy ) + (_MainUVs).zw );
			float4 tex2DNode117_g18705 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g18705 );
			float2 appendResult88_g23117 = (float2(tex2DNode117_g18705.a , tex2DNode117_g18705.g));
			float2 temp_output_90_0_g23117 = ( (appendResult88_g23117*2.0 + -1.0) * _MainNormalValue );
			float3 appendResult91_g23117 = (float3(temp_output_90_0_g23117 , 1.0));
			float3 Main_Normal137_g18705 = appendResult91_g23117;
			float2 lerpResult1545_g18705 = lerp( i.uv_texcoord , i.uv2_texcoord2 , _DetailCoordMode);
			half2 Second_UVs17_g18705 = ( ( lerpResult1545_g18705 * (_SecondUVs).xy ) + (_SecondUVs).zw );
			float4 tex2DNode145_g18705 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondAlbedoTex, Second_UVs17_g18705 );
			float2 appendResult88_g23080 = (float2(tex2DNode145_g18705.a , tex2DNode145_g18705.g));
			float2 temp_output_90_0_g23080 = ( (appendResult88_g23080*2.0 + -1.0) * _SecondNormalValue );
			float3 appendResult91_g23080 = (float3(temp_output_90_0_g23080 , 1.0));
			float3 Second_Normal179_g18705 = appendResult91_g23080;
			half Mesh_DetailMask90_g18705 = i.vertexColor.b;
			float temp_output_989_0_g18705 = ( ( Mesh_DetailMask90_g18705 - 0.5 ) + _DetailMeshValue );
			half Blend_Source1540_g18705 = temp_output_989_0_g18705;
			float4 tex2DNode35_g18705 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g18705 );
			half Main_Mask57_g18705 = tex2DNode35_g18705.b;
			float4 tex2DNode33_g18705 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondAlbedoTex, Second_UVs17_g18705 );
			half Second_Mask81_g18705 = tex2DNode33_g18705.b;
			float lerpResult1327_g18705 = lerp( Main_Mask57_g18705 , Second_Mask81_g18705 , _MaskMode);
			float temp_output_7_0_g23111 = _DetailMaskContrast;
			half Autoregister_DetailMode667_g18705 = ( _DetailMode * _DetailShadingCat );
			half Mask_Detail147_g18705 = ( saturate( ( ( saturate( ( Blend_Source1540_g18705 + ( Blend_Source1540_g18705 * ( ( ( 1.0 - lerpResult1327_g18705 ) - 0.5 ) + _DetailMaskValue ) ) ) ) - temp_output_7_0_g23111 ) / ( ( 1.0 - _DetailMaskContrast ) - temp_output_7_0_g23111 ) ) ) + Autoregister_DetailMode667_g18705 );
			float3 lerpResult230_g18705 = lerp( float3( 0,0,1 ) , Second_Normal179_g18705 , Mask_Detail147_g18705);
			float3 lerpResult249_g18705 = lerp( Main_Normal137_g18705 , Second_Normal179_g18705 , Mask_Detail147_g18705);
			#if defined(MATERIAL_USE_DETAIL_OFF)
				float3 staticSwitch267_g18705 = Main_Normal137_g18705;
			#elif defined(MATERIAL_USE_DETAIL_OVERLAY)
				float3 staticSwitch267_g18705 = BlendNormals( Main_Normal137_g18705 , lerpResult230_g18705 );
			#elif defined(MATERIAL_USE_DETAIL_HEIGHT)
				float3 staticSwitch267_g18705 = lerpResult249_g18705;
			#else
				float3 staticSwitch267_g18705 = Main_Normal137_g18705;
			#endif
			float3 temp_output_13_0_g23120 = staticSwitch267_g18705;
			float3 switchResult12_g23120 = (((i.ASEVFace>0)?(temp_output_13_0_g23120):(( temp_output_13_0_g23120 * _render_normals_options ))));
			half3 Blend_Normal312_g18705 = switchResult12_g23120;
			float2 temp_output_38_0_g23102 = ( i.uv2_texcoord2 * TVE_OverlayUVTilling );
			float4 tex2DNode33_g23102 = SAMPLE_TEXTURE2D( TVE_OverlayNormalTex, samplerTVE_OverlayAlbedoTex, temp_output_38_0_g23102 );
			float2 appendResult88_g23103 = (float2(tex2DNode33_g23102.a , tex2DNode33_g23102.g));
			float2 temp_output_90_0_g23103 = ( (appendResult88_g23103*2.0 + -1.0) * TVE_OverlayNormalValue );
			float3 appendResult91_g23103 = (float3(temp_output_90_0_g23103 , 1.0));
			float3 temp_output_84_19_g23102 = appendResult91_g23103;
			half3 Global_OverlayNormal313_g18705 = temp_output_84_19_g23102;
			float3 Blend_NormalRaw1051_g18705 = staticSwitch267_g18705;
			float3 switchResult1063_g18705 = (((i.ASEVFace>0)?(Blend_NormalRaw1051_g18705):(( Blend_NormalRaw1051_g18705 * float3(-1,-1,-1) ))));
			half Overlay_Contrast1405_g18705 = _OverlayContrast;
			float3 appendResult1439_g18705 = (float3(Overlay_Contrast1405_g18705 , Overlay_Contrast1405_g18705 , 1.0));
			half Global_OverlayIntensity154_g18705 = TVE_OverlayIntensity;
			float4x4 break19_g23129 = unity_ObjectToWorld;
			float3 appendResult20_g23129 = (float3(break19_g23129[ 0 ][ 3 ] , break19_g23129[ 1 ][ 3 ] , break19_g23129[ 2 ][ 3 ]));
			half3 Off19_g23131 = appendResult20_g23129;
			float4 ase_vertex4Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 transform68_g23129 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 appendResult60_g23130 = (float3(i.uv2_tex4coord2.z , 0.0 , i.uv2_tex4coord2.w));
			float4 transform62_g23129 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23130 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23129 = ( (transform68_g23129).xyz - (transform62_g23129).xyz );
			half3 On20_g23131 = ObjectPositionWithPivots28_g23129;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23131 = On20_g23131;
			#else
				float3 staticSwitch14_g23131 = Off19_g23131;
			#endif
			half3 ObjectData20_g23132 = staticSwitch14_g23131;
			half3 WorldData19_g23132 = Off19_g23131;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23132 = WorldData19_g23132;
			#else
				float3 staticSwitch14_g23132 = ObjectData20_g23132;
			#endif
			float3 temp_output_42_0_g23129 = staticSwitch14_g23132;
			half3 ObjectData20_g23135 = temp_output_42_0_g23129;
			float3 ase_worldPos = i.worldPos;
			half3 WorldData19_g23135 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23135 = WorldData19_g23135;
			#else
				float3 staticSwitch14_g23135 = ObjectData20_g23135;
			#endif
			float4 tex2DNode7_g23128 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23135).xz ) ) );
			half Global_ExtrasTex_B156_g18705 = tex2DNode7_g23128.b;
			float temp_output_1025_0_g18705 = ( Global_OverlayIntensity154_g18705 * _GlobalOverlay * Global_ExtrasTex_B156_g18705 );
			half Overlay_Commons1365_g18705 = temp_output_1025_0_g18705;
			half Overlay_Mask269_g18705 = saturate( ( saturate( (WorldNormalVector( i , ( switchResult1063_g18705 * appendResult1439_g18705 ) )).y ) - ( 1.0 - Overlay_Commons1365_g18705 ) ) );
			float3 lerpResult349_g18705 = lerp( Blend_Normal312_g18705 , Global_OverlayNormal313_g18705 , Overlay_Mask269_g18705);
			half3 Final_Normal366_g18705 = lerpResult349_g18705;
			o.Normal = Final_Normal366_g18705;
			float4 tex2DNode29_g18705 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g18705 );
			float4 temp_output_51_0_g18705 = ( _MainColor * tex2DNode29_g18705 );
			half3 Main_AlbedoRaw99_g18705 = (temp_output_51_0_g18705).rgb;
			half3 Main_AlbedoColored863_g18705 = Main_AlbedoRaw99_g18705;
			half3 Second_Albedo153_g18705 = (( _SecondColor * SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g18705 ) )).rgb;
			half3 Second_AlbedoColored1963_g18705 = Second_Albedo153_g18705;
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g23121 = 2.0;
			#else
				float staticSwitch1_g23121 = 4.594794;
			#endif
			float3 lerpResult235_g18705 = lerp( Main_AlbedoColored863_g18705 , ( Main_AlbedoColored863_g18705 * Second_AlbedoColored1963_g18705 * staticSwitch1_g23121 ) , Mask_Detail147_g18705);
			float3 lerpResult208_g18705 = lerp( Main_AlbedoColored863_g18705 , Second_AlbedoColored1963_g18705 , Mask_Detail147_g18705);
			#if defined(MATERIAL_USE_DETAIL_OFF)
				float3 staticSwitch255_g18705 = Main_AlbedoColored863_g18705;
			#elif defined(MATERIAL_USE_DETAIL_OVERLAY)
				float3 staticSwitch255_g18705 = lerpResult235_g18705;
			#elif defined(MATERIAL_USE_DETAIL_HEIGHT)
				float3 staticSwitch255_g18705 = lerpResult208_g18705;
			#else
				float3 staticSwitch255_g18705 = Main_AlbedoColored863_g18705;
			#endif
			half3 Blend_Albedo265_g18705 = staticSwitch255_g18705;
			half3 Blend_AlbedoAndSubsurface149_g18705 = Blend_Albedo265_g18705;
			half3 Global_OverlayColor1758_g18705 = (TVE_OverlayColor).rgb;
			half3 Global_OverlayAlbedo277_g18705 = (SAMPLE_TEXTURE2D( TVE_OverlayAlbedoTex, samplerTVE_OverlayAlbedoTex, temp_output_38_0_g23102 )).rgb;
			float3 lerpResult336_g18705 = lerp( Blend_AlbedoAndSubsurface149_g18705 , ( Global_OverlayColor1758_g18705 * Global_OverlayAlbedo277_g18705 ) , Overlay_Mask269_g18705);
			half3 Final_Albedo359_g18705 = lerpResult336_g18705;
			half Main_Alpha316_g18705 = (temp_output_51_0_g18705).a;
			float lerpResult354_g18705 = lerp( 1.0 , Main_Alpha316_g18705 , _render_premul);
			half Final_Premultiply355_g18705 = lerpResult354_g18705;
			o.Albedo = ( Final_Albedo359_g18705 * Final_Premultiply355_g18705 );
			half Main_Metallic237_g18705 = ( tex2DNode35_g18705.r * _MainMetallicValue );
			half Second_Metallic226_g18705 = ( tex2DNode33_g18705.r * _SecondMetallicValue );
			float lerpResult278_g18705 = lerp( Main_Metallic237_g18705 , Second_Metallic226_g18705 , Mask_Detail147_g18705);
			#if defined(MATERIAL_USE_DETAIL_OFF)
				float staticSwitch299_g18705 = Main_Metallic237_g18705;
			#elif defined(MATERIAL_USE_DETAIL_OVERLAY)
				float staticSwitch299_g18705 = Main_Metallic237_g18705;
			#elif defined(MATERIAL_USE_DETAIL_HEIGHT)
				float staticSwitch299_g18705 = lerpResult278_g18705;
			#else
				float staticSwitch299_g18705 = Main_Metallic237_g18705;
			#endif
			half Blend_Metallic306_g18705 = staticSwitch299_g18705;
			float lerpResult342_g18705 = lerp( Blend_Metallic306_g18705 , 0.0 , Overlay_Mask269_g18705);
			half Final_Metallic367_g18705 = lerpResult342_g18705;
			o.Metallic = Final_Metallic367_g18705;
			half Main_Smoothness227_g18705 = ( tex2DNode35_g18705.a * _MainSmoothnessValue );
			half Second_Smoothness236_g18705 = ( tex2DNode33_g18705.a * _SecondSmoothnessValue );
			float lerpResult266_g18705 = lerp( Main_Smoothness227_g18705 , Second_Smoothness236_g18705 , Mask_Detail147_g18705);
			#if defined(MATERIAL_USE_DETAIL_OFF)
				float staticSwitch297_g18705 = Main_Smoothness227_g18705;
			#elif defined(MATERIAL_USE_DETAIL_OVERLAY)
				float staticSwitch297_g18705 = Main_Smoothness227_g18705;
			#elif defined(MATERIAL_USE_DETAIL_HEIGHT)
				float staticSwitch297_g18705 = lerpResult266_g18705;
			#else
				float staticSwitch297_g18705 = Main_Smoothness227_g18705;
			#endif
			half Blend_Smoothness314_g18705 = staticSwitch297_g18705;
			half Global_OverlaySmoothness311_g18705 = TVE_OverlaySmoothness;
			float lerpResult343_g18705 = lerp( Blend_Smoothness314_g18705 , Global_OverlaySmoothness311_g18705 , Overlay_Mask269_g18705);
			half Final_Smoothness371_g18705 = lerpResult343_g18705;
			half Global_Wetness1016_g18705 = ( TVE_Wetness * _GlobalWetness );
			half Global_ExtrasTex_A1033_g18705 = tex2DNode7_g23128.a;
			float lerpResult1037_g18705 = lerp( Final_Smoothness371_g18705 , saturate( ( Final_Smoothness371_g18705 + Global_Wetness1016_g18705 ) ) , Global_ExtrasTex_A1033_g18705);
			o.Smoothness = lerpResult1037_g18705;
			float lerpResult240_g18705 = lerp( 1.0 , tex2DNode35_g18705.g , _MainOcclusionValue);
			half Main_Occlusion247_g18705 = lerpResult240_g18705;
			float lerpResult239_g18705 = lerp( 1.0 , tex2DNode33_g18705.g , _SecondOcclusionValue);
			half Second_Occlusion251_g18705 = lerpResult239_g18705;
			float lerpResult294_g18705 = lerp( Main_Occlusion247_g18705 , Second_Occlusion251_g18705 , Mask_Detail147_g18705);
			#if defined(MATERIAL_USE_DETAIL_OFF)
				float staticSwitch310_g18705 = Main_Occlusion247_g18705;
			#elif defined(MATERIAL_USE_DETAIL_OVERLAY)
				float staticSwitch310_g18705 = ( Main_Occlusion247_g18705 * Second_Occlusion251_g18705 );
			#elif defined(MATERIAL_USE_DETAIL_HEIGHT)
				float staticSwitch310_g18705 = lerpResult294_g18705;
			#else
				float staticSwitch310_g18705 = Main_Occlusion247_g18705;
			#endif
			half Blend_Occlusion323_g18705 = staticSwitch310_g18705;
			o.Occlusion = Blend_Occlusion323_g18705;
			o.Alpha = Main_Alpha316_g18705;
			half Main_AlphaRaw1203_g18705 = tex2DNode29_g18705.a;
			half Alpha5_g23106 = Main_AlphaRaw1203_g18705;
			#ifdef _ALPHATEST_ON
				float staticSwitch2_g23106 = Alpha5_g23106;
			#else
				float staticSwitch2_g23106 = 1.0;
			#endif
			half Final_Clip914_g18705 = staticSwitch2_g23106;
			clip( Final_Clip914_g18705 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=18500
1927;7;1906;1014;2819.561;1120.999;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;7;-1536,-768;Half;False;Property;_render_dst;_render_dst;179;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;180;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;341;-2176,256;Inherit;False;Feature Use World Position Data;-1;;23187;749c61e1189c7f8408d9e6db94560d1d;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-768;Half;False;Property;_Cutoff;_Cutoff;176;1;[HideInInspector];Fetch;True;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.719;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-769;Half;False;Property;_render_cull;_render_cull;177;0;Fetch;True;3;Both;0;Back;1;Front;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1728,-768;Half;False;Property;_render_src;_render_src;178;0;Fetch;True;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Prop Standard Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;334;-2176,-384;Inherit;False;Base Shader;1;;18705;856f7164d1c579d43a5cf4968a75ca43;51,1271,1,1300,1,1298,1,1962,0,1708,0,1712,0,1964,1,1969,1,1723,0,1719,0,893,0,1745,0,1742,0,1715,1,1714,1,1717,1,1728,1,1718,1,916,1,1732,1,1949,1,1763,1,1762,1,1776,0,1646,0,1690,0,1757,0,1669,0,1981,0,1759,0,2172,0,1733,1,1734,1,1736,1,1968,1,1735,1,1737,1,1966,1,1550,1,878,1,860,0,2261,1,2260,1,2032,1,2054,1,2057,1,2033,1,2036,1,2060,1,2062,1,2039,1;0;16;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534;FLOAT3;2075
Node;AmplifyShaderEditor.RangedFloatNode;342;-1376,-896;Half;False;Property;_IsAnyPathShader;_IsAnyPathShader;173;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-1552,-896;Half;False;Property;_IsLitShader;_IsLitShader;174;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;134;-1776,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;175;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;127;-1984,-896;Half;False;Property;_IsPropShader;_IsPropShader;172;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;0;Standard;BOXOPHOBIC/The Vegetation Engine/Objects/Prop Standard Lit;False;False;False;False;False;True;False;True;False;False;False;False;True;False;True;False;True;False;False;False;True;Back;0;True;17;0;False;-1;True;0;False;-1;-1;False;-1;False;0;Custom;0.719;True;True;0;True;Opaque;;Geometry;All;11;d3d11;glcore;gles3;metal;vulkan;xbox360;xboxone;ps4;psp2;n3ds;wiiu;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;1;0;True;20;0;True;7;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Absolute;0;;-1;-1;-1;-1;0;False;0;0;True;10;-1;0;True;21;0;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1022.896;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;340;-2176,128;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1026.438;100;Internal;0;;1,0.252,0,1;0;0
WireConnection;0;0;334;0
WireConnection;0;1;334;528
WireConnection;0;3;334;529
WireConnection;0;4;334;530
WireConnection;0;5;334;531
WireConnection;0;9;334;532
WireConnection;0;10;334;653
WireConnection;0;11;334;534
ASEEND*/
//CHKSM=A795B42F6AF4A4A3D1A47A73C6C1979D84AE934F
