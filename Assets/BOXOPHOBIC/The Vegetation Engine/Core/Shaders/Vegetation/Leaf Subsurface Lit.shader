// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Vegetation/Leaf Subsurface Lit"
{
	Properties
	{
		[StyledBanner(Leaf Subsurface Lit)]_Banner("Banner", Float) = 0
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
		_GlobalColors("Global Colors", Range( 0 , 1)) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalLeaves("Global Leaves", Range( 0 , 1)) = 1
		_GlobalHealthiness("Global Healthiness", Range( 0 , 1)) = 1
		_GlobalSize("Global Size", Range( 0 , 1)) = 1
		_GlobalSizeFade("Global Size Fade", Range( 0 , 1)) = 0
		[StyledCategory(Subsurface Settings)]_SubsurfaceCat("[ Subsurface Cat ]", Float) = 0
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (0.3315085,0.490566,0,1)
		[HideInInspector][ASEDiffusionProfile(_SubsurfaceDiffusion)]_SubsurfaceDiffusion_asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 1
		_SubsurfaceMinValue("Subsurface Min", Range( 0 , 1)) = 0
		_SubsurfaceMaxValue("Subsurface Max", Range( 0 , 1)) = 1
		_SubsurfaceViewValue("Subsurface View", Range( 0 , 8)) = 1
		_SubsurfaceAngleValue("Subsurface Angle", Range( 0 , 16)) = 8
		[StyledCategory(Main Settings)]_MainCat("[ Main Cat ]", Float) = 0
		_MainColor("Main Color", Color) = (1,1,1,1)
		[NoScaleOffset]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset]_MainNormalTex("Main Normal", 2D) = "gray" {}
		[NoScaleOffset]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainOcclusionValue("Main Occlusion (G)", Range( 0 , 1)) = 1
		_MainSmoothnessValue("Main Smoothness (A)", Range( 0 , 1)) = 1
		_ObjectOcclusionValue("Object Occlusion", Range( 0 , 8)) = 0
		[StyledCategory(Misc Settings)]_MiscCat("[ Misc Cat ]", Float) = 0
		[HDR]_LocalColors("Local Colors", Color) = (1,1,1,1)
		_LocalLeaves("Local Leaves", Range( 0 , 1)) = 1
		_LocalSize("Local Size", Range( 0 , 1)) = 1
		[StyledSpace(10)]_MiscSpace("# Misc Space", Float) = 0
		_ColorsMaskValue("Colors Use Mask", Range( 0 , 1)) = 1
		_OverlayContrast("Overlay Contrast", Range( 0 , 10)) = 1
		_OverlayVariation("Overlay Variation", Range( 0 , 1)) = 0
		_LeavesVariationValue("Leaves Variation", Range( 0 , 1)) = 1
		[StyledCategory(Motion Settings)]_MotionCat("[ Motion Cat ]", Float) = 0
		_Motion_10("Motion Bending", Range( 0 , 1)) = 1
		_Motion_20("Motion Rolling", Range( 0 , 1)) = 1
		_Motion_30("Motion Leaves", Range( 0 , 1)) = 1
		_Motion_32("Motion Flutter", Range( 0 , 1)) = 1
		_Motion_Interaction("Motion Interaction", Range( 0 , 1)) = 1
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
		[HideInInspector] _tex4coord2( "", 2D ) = "white" {}
		[StyledMessage(Warning, When batching support is enabled the object position is lost and some features will not work as expected. Check the documentation for more information., _material_batching, 1 , 0,5)]_BatchingMessage("# Batching Message", Float) = 0
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
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
		[HideInInspector]_MaxBoundsInfo("_MaxBoundsInfo", Vector) = (1,1,1,1)
		[HideInInspector]_render_normals_options("_render_normals_options", Vector) = (1,1,1,0)
		[HideInInspector]_IsVersion("_IsVersion", Float) = 170
		[HideInInspector]_IsStandardPipeline("_IsStandardPipeline", Float) = 1
		[Toggle]_material_batching("Enable Batching Support", Float) = 0
		[HideInInspector]_IsLeafShader("_IsLeafShader", Float) = 1
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsLitShader("_IsLitShader", Float) = 1
		[HideInInspector]_IsForwardPathShader("_IsForwardPathShader", Float) = 1
		[HideInInspector]_Cutoff("_Cutoff", Float) = 0.5
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" "DisableBatching" = "True" }
		Cull [_render_cull]
		ZWrite [_render_zw]
		Offset  0 , 1
		Blend [_render_src] [_render_dst]
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "UnityPBSLighting.cginc"
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma shader_feature_local _ALPHATEST_ON
		  
		//SHADER INJECTION POINT BEGIN
		//SHADER INJECTION POINT END
		    
		#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
		#endif//ASE Sampling Macros

		#pragma exclude_renderers d3d9 d3d11_9x gles 
		#pragma surface surf StandardCustom keepalpha addshadow fullforwardshadows exclude_path:deferred novertexlights nodynlightmap dithercrossfade vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
			half ASEVFace : VFACE;
			float2 uv2_texcoord2;
			float3 worldNormal;
			INTERNAL_DATA
			float4 uv2_tex4coord2;
			float4 vertexColor : COLOR;
		};

		struct SurfaceOutputStandardCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			half3 Transmission;
		};

		uniform half _IsStandardShader;
		uniform half _Banner;
		uniform half _ObjectThicknessValue;
		uniform half _MiscSpace;
		uniform float _SubsurfaceMode;
		uniform half _render_dst;
		uniform half _render_cull;
		uniform half _PivotsMessage;
		uniform half _render_normals;
		uniform half _RenderingCat;
		uniform half _BatchingMessage;
		uniform half _MainMaskValue;
		uniform half _render_mode;
		uniform half _render_src;
		uniform half _MainColorMode;
		uniform half _VertexOcclusion;
		uniform half _render_blend;
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
		uniform half _IsLeafShader;
		uniform half _material_batching;
		uniform half _IsLitShader;
		uniform half _IsForwardPathShader;
		uniform half _VertexPivotMode;
		uniform half _MotionAmplitude_20;
		uniform float4 _MaxBoundsInfo;
		uniform half TVE_MotionAmplitude_20;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_NoiseTex);
		uniform half TVE_NoiseSpeed;
		uniform half TVE_NoiseSize;
		SamplerState samplerTVE_NoiseTex;
		uniform half TVE_NoiseContrast;
		uniform half _Motion_20;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_MotionTex);
		uniform half4 TVE_VolumeCoord;
		SamplerState samplerTVE_MotionTex;
		uniform float _MotionSpeed_20;
		uniform half _MotionVariation_20;
		uniform float _MotionScale_20;
		uniform half _MotionAmplitude_10;
		uniform half TVE_MotionAmplitude_10;
		uniform half _Motion_10;
		uniform half _MotionCat;
		uniform float _MotionSpeed_10;
		uniform half _MotionVariation_10;
		uniform float _MotionScale_10;
		uniform half _InteractionAmplitude;
		uniform half _Motion_Interaction;
		uniform half _MotionVertical_20;
		uniform half TVE_MotionAmplitude_21;
		uniform float _MotionScale_30;
		uniform float _MotionSpeed_30;
		uniform float _MotionVariation_30;
		uniform half _MotionAmplitude_30;
		uniform half _Motion_30;
		uniform half TVE_MotionAmplitude_30;
		uniform float _MotionScale_32;
		uniform float _MotionSpeed_32;
		uniform float _MotionVariation_32;
		uniform half _MotionAmplitude_32;
		uniform half _Motion_32;
		uniform half TVE_MotionAmplitude_32;
		uniform half _GlobalSizeFade;
		uniform half TVE_SizeFadeEnd;
		uniform half TVE_SizeFadeStart;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_ExtrasTex);
		SamplerState samplerTVE_ExtrasTex;
		uniform half _GlobalSize;
		uniform half _LocalSize;
		uniform half _IsStandardPipeline;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
		SamplerState sampler_MainNormalTex;
		uniform half4 _MainUVs;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
		SamplerState sampler_MainAlbedoTex;
		uniform half _MainNormalValue;
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
		uniform half _OverlayVariation;
		uniform half4 _MainColor;
		uniform float4 _LocalColors;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_ColorsTex);
		SamplerState samplerTVE_ColorsTex;
		uniform half _GlobalColors;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
		SamplerState sampler_MainMaskTex;
		uniform half _SubsurfaceMinValue;
		uniform half _SubsurfaceMaxValue;
		uniform half _ColorsMaskValue;
		uniform half4 _SubsurfaceColor;
		uniform half _GlobalHealthiness;
		uniform half _SubsurfaceValue;
		uniform half _SubsurfaceCat;
		uniform half _SubsurfaceAngleValue;
		uniform half _SubsurfaceViewValue;
		uniform half4 TVE_OverlayColor;
		uniform half _render_premul;
		uniform half _MainSmoothnessValue;
		uniform half TVE_OverlaySmoothness;
		uniform float TVE_Wetness;
		uniform half _GlobalWetness;
		uniform half _ObjectOcclusionValue;
		uniform half _MainOcclusionValue;
		uniform half _LeavesVariationValue;
		uniform half _GlobalLeaves;
		uniform half _LocalLeaves;
		uniform half _Cutoff;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			half3 Off19_g24008 = half3(0,0,0);
			float3 appendResult60_g24023 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			half3 On20_g24008 = ( appendResult60_g24023 * _VertexPivotMode );
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g24008 = On20_g24008;
			#else
				float3 staticSwitch14_g24008 = Off19_g24008;
			#endif
			half3 ObjectData20_g24009 = staticSwitch14_g24008;
			half3 WorldData19_g24009 = Off19_g24008;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24009 = WorldData19_g24009;
			#else
				float3 staticSwitch14_g24009 = ObjectData20_g24009;
			#endif
			float3 Mesh_PivotsOS2291_g23996 = staticSwitch14_g24009;
			float3 temp_output_2283_0_g23996 = ( ase_vertex3Pos - Mesh_PivotsOS2291_g23996 );
			half3 VertexPos40_g24024 = temp_output_2283_0_g23996;
			float3 appendResult74_g24024 = (float3(0.0 , VertexPos40_g24024.y , 0.0));
			float3 VertexPosRotationAxis50_g24024 = appendResult74_g24024;
			float3 break84_g24024 = VertexPos40_g24024;
			float3 appendResult81_g24024 = (float3(break84_g24024.x , 0.0 , break84_g24024.z));
			float3 VertexPosOtherAxis82_g24024 = appendResult81_g24024;
			float ObjectData20_g24019 = 3.14;
			float Bounds_Radius121_g23996 = _MaxBoundsInfo.x;
			float WorldData19_g24019 = Bounds_Radius121_g23996;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g24019 = WorldData19_g24019;
			#else
				float staticSwitch14_g24019 = ObjectData20_g24019;
			#endif
			float Motion_Max_Rolling1137_g23996 = staticSwitch14_g24019;
			half Mesh_Motion_260_g23996 = v.texcoord3.y;
			float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
			float4x4 break19_g24048 = unity_ObjectToWorld;
			float3 appendResult20_g24048 = (float3(break19_g24048[ 0 ][ 3 ] , break19_g24048[ 1 ][ 3 ] , break19_g24048[ 2 ][ 3 ]));
			half3 Off19_g24050 = appendResult20_g24048;
			float4 ase_vertex4Pos = v.vertex;
			float4 transform68_g24048 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g24049 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g24048 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g24049 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g24048 = ( (transform68_g24048).xyz - (transform62_g24048).xyz );
			half3 On20_g24050 = ObjectPositionWithPivots28_g24048;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g24050 = On20_g24050;
			#else
				float3 staticSwitch14_g24050 = Off19_g24050;
			#endif
			half3 ObjectData20_g24051 = staticSwitch14_g24050;
			half3 WorldData19_g24051 = Off19_g24050;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24051 = WorldData19_g24051;
			#else
				float3 staticSwitch14_g24051 = ObjectData20_g24051;
			#endif
			float3 temp_output_42_0_g24048 = staticSwitch14_g24051;
			half3 ObjectData20_g24054 = temp_output_42_0_g24048;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			half3 WorldData19_g24054 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24054 = WorldData19_g24054;
			#else
				float3 staticSwitch14_g24054 = ObjectData20_g24054;
			#endif
			float2 panner73_g24047 = ( _Time.y * temp_cast_0 + ( (staticSwitch14_g24054).xz * TVE_NoiseSize ));
			float4 temp_cast_2 = (TVE_NoiseContrast).xxxx;
			float4 break142_g24047 = pow( abs( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g24047, 0.0 ) ) , temp_cast_2 );
			half Global_NoiseTex_R34_g23996 = break142_g24047.r;
			half Global_NoiseTex_G38_g23996 = break142_g24047.g;
			half Motion_Use20162_g23996 = _Motion_20;
			float4x4 break19_g24074 = unity_ObjectToWorld;
			float3 appendResult20_g24074 = (float3(break19_g24074[ 0 ][ 3 ] , break19_g24074[ 1 ][ 3 ] , break19_g24074[ 2 ][ 3 ]));
			half3 Off19_g24076 = appendResult20_g24074;
			float4 transform68_g24074 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g24075 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g24074 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g24075 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g24074 = ( (transform68_g24074).xyz - (transform62_g24074).xyz );
			half3 On20_g24076 = ObjectPositionWithPivots28_g24074;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g24076 = On20_g24076;
			#else
				float3 staticSwitch14_g24076 = Off19_g24076;
			#endif
			half3 ObjectData20_g24077 = staticSwitch14_g24076;
			half3 WorldData19_g24077 = Off19_g24076;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24077 = WorldData19_g24077;
			#else
				float3 staticSwitch14_g24077 = ObjectData20_g24077;
			#endif
			float3 temp_output_42_0_g24074 = staticSwitch14_g24077;
			half3 ObjectData20_g24072 = temp_output_42_0_g24074;
			half3 WorldData19_g24072 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24072 = WorldData19_g24072;
			#else
				float3 staticSwitch14_g24072 = ObjectData20_g24072;
			#endif
			float4 break322_g24010 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g24072).xz ) ), 0.0 );
			half Motion_Power2223_g23996 = break322_g24010.z;
			half MotionSpeed265_g23996 = _MotionSpeed_20;
			half Input_Speed62_g24063 = MotionSpeed265_g23996;
			float mulTime354_g24063 = _Time.y * Input_Speed62_g24063;
			half MotionVariation264_g23996 = _MotionVariation_20;
			float temp_output_342_0_g24063 = ( MotionVariation264_g23996 * v.color.r );
			float4x4 break19_g24064 = unity_ObjectToWorld;
			float3 appendResult20_g24064 = (float3(break19_g24064[ 0 ][ 3 ] , break19_g24064[ 1 ][ 3 ] , break19_g24064[ 2 ][ 3 ]));
			half3 Off19_g24066 = appendResult20_g24064;
			float4 transform68_g24064 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g24065 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g24064 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g24065 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g24064 = ( (transform68_g24064).xyz - (transform62_g24064).xyz );
			half3 On20_g24066 = ObjectPositionWithPivots28_g24064;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g24066 = On20_g24066;
			#else
				float3 staticSwitch14_g24066 = Off19_g24066;
			#endif
			half3 ObjectData20_g24067 = staticSwitch14_g24066;
			half3 WorldData19_g24067 = Off19_g24066;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24067 = WorldData19_g24067;
			#else
				float3 staticSwitch14_g24067 = ObjectData20_g24067;
			#endif
			float3 temp_output_42_0_g24064 = staticSwitch14_g24067;
			float3 break9_g24064 = temp_output_42_0_g24064;
			float ObjectData20_g24070 = ( temp_output_342_0_g24063 + ( break9_g24064.x + break9_g24064.z ) );
			float WorldData19_g24070 = temp_output_342_0_g24063;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g24070 = WorldData19_g24070;
			#else
				float staticSwitch14_g24070 = ObjectData20_g24070;
			#endif
			float Motion_Variation284_g24063 = staticSwitch14_g24070;
			half MotionScale262_g23996 = _MotionScale_20;
			float Motion_Scale287_g24063 = ( MotionScale262_g23996 * ase_worldPos.x );
			half Motion_Rolling138_g23996 = ( ( _MotionAmplitude_20 * Motion_Max_Rolling1137_g23996 ) * TVE_MotionAmplitude_20 * Mesh_Motion_260_g23996 * ( Global_NoiseTex_R34_g23996 + Global_NoiseTex_G38_g23996 ) * Motion_Use20162_g23996 * Motion_Power2223_g23996 * sin( ( mulTime354_g24063 + Motion_Variation284_g24063 + Motion_Scale287_g24063 ) ) );
			half Angle44_g24024 = Motion_Rolling138_g23996;
			half3 VertexPos40_g24035 = ( VertexPosRotationAxis50_g24024 + ( VertexPosOtherAxis82_g24024 * cos( Angle44_g24024 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g24024 ) * sin( Angle44_g24024 ) ) );
			float3 appendResult74_g24035 = (float3(VertexPos40_g24035.x , 0.0 , 0.0));
			half3 VertexPosRotationAxis50_g24035 = appendResult74_g24035;
			float3 break84_g24035 = VertexPos40_g24035;
			float3 appendResult81_g24035 = (float3(0.0 , break84_g24035.y , break84_g24035.z));
			half3 VertexPosOtherAxis82_g24035 = appendResult81_g24035;
			float ObjectData20_g24020 = 3.14;
			float Bounds_Height374_g23996 = _MaxBoundsInfo.y;
			float WorldData19_g24020 = ( Bounds_Height374_g23996 * 3.14 );
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g24020 = WorldData19_g24020;
			#else
				float staticSwitch14_g24020 = ObjectData20_g24020;
			#endif
			float Motion_Max_Bending1133_g23996 = staticSwitch14_g24020;
			float3 appendResult323_g24010 = (float3(break322_g24010.x , 0.0 , break322_g24010.y));
			float3 temp_output_324_0_g24010 = (appendResult323_g24010*2.0 + -1.0);
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			half3 ObjectData20_g24011 = ( mul( unity_WorldToObject, float4( temp_output_324_0_g24010 , 0.0 ) ).xyz * ase_parentObjectScale );
			half3 WorldData19_g24011 = temp_output_324_0_g24010;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24011 = WorldData19_g24011;
			#else
				float3 staticSwitch14_g24011 = ObjectData20_g24011;
			#endif
			half2 Motion_DirectionOS39_g23996 = (staticSwitch14_g24011).xz;
			half Motion_Use1056_g23996 = ( _Motion_10 + _MotionCat );
			half Input_Speed62_g24089 = _MotionSpeed_10;
			float mulTime373_g24089 = _Time.y * Input_Speed62_g24089;
			float temp_output_349_0_g24089 = ( _MotionVariation_10 * v.color.r );
			float4x4 break19_g24090 = unity_ObjectToWorld;
			float3 appendResult20_g24090 = (float3(break19_g24090[ 0 ][ 3 ] , break19_g24090[ 1 ][ 3 ] , break19_g24090[ 2 ][ 3 ]));
			half3 Off19_g24092 = appendResult20_g24090;
			float4 transform68_g24090 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g24091 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g24090 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g24091 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g24090 = ( (transform68_g24090).xyz - (transform62_g24090).xyz );
			half3 On20_g24092 = ObjectPositionWithPivots28_g24090;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g24092 = On20_g24092;
			#else
				float3 staticSwitch14_g24092 = Off19_g24092;
			#endif
			half3 ObjectData20_g24093 = staticSwitch14_g24092;
			half3 WorldData19_g24093 = Off19_g24092;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24093 = WorldData19_g24093;
			#else
				float3 staticSwitch14_g24093 = ObjectData20_g24093;
			#endif
			float3 temp_output_42_0_g24090 = staticSwitch14_g24093;
			float3 break9_g24090 = temp_output_42_0_g24090;
			float ObjectData20_g24096 = ( temp_output_349_0_g24089 + ( break9_g24090.x + break9_g24090.z ) );
			float WorldData19_g24096 = temp_output_349_0_g24089;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g24096 = WorldData19_g24096;
			#else
				float staticSwitch14_g24096 = ObjectData20_g24096;
			#endif
			half Motion_Variation284_g24089 = staticSwitch14_g24096;
			float2 appendResult344_g24089 = (float2(ase_worldPos.x , ase_worldPos.z));
			float2 Motion_Scale287_g24089 = ( _MotionScale_10 * appendResult344_g24089 );
			half2 Sine_MinusOneToOne281_g24089 = sin( ( mulTime373_g24089 + Motion_Variation284_g24089 + Motion_Scale287_g24089 ) );
			float2 temp_cast_9 = (1.0).xx;
			half Input_Turbulence327_g24089 = Global_NoiseTex_R34_g23996;
			float2 lerpResult321_g24089 = lerp( Sine_MinusOneToOne281_g24089 , temp_cast_9 , Input_Turbulence327_g24089);
			half2 Motion_Bending2258_g23996 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g23996 ) * TVE_MotionAmplitude_10 * Global_NoiseTex_R34_g23996 * Motion_DirectionOS39_g23996 * Motion_Power2223_g23996 * Motion_Use1056_g23996 * lerpResult321_g24089 );
			half Motion_UseInteraction2097_g23996 = _Motion_Interaction;
			half Motion_InteractionMask66_g23996 = break322_g24010.w;
			half2 Motion_Interaction53_g23996 = ( _InteractionAmplitude * Motion_Max_Bending1133_g23996 * Motion_UseInteraction2097_g23996 * Motion_InteractionMask66_g23996 * Motion_InteractionMask66_g23996 * Motion_DirectionOS39_g23996 );
			float2 lerpResult109_g23996 = lerp( Motion_Bending2258_g23996 , Motion_Interaction53_g23996 , Motion_InteractionMask66_g23996);
			half Mesh_Motion_182_g23996 = v.texcoord3.x;
			float2 break143_g23996 = ( lerpResult109_g23996 * Mesh_Motion_182_g23996 );
			half Motion_Z190_g23996 = break143_g23996.y;
			half Angle44_g24035 = Motion_Z190_g23996;
			half3 VertexPos40_g24022 = ( VertexPosRotationAxis50_g24035 + ( VertexPosOtherAxis82_g24035 * cos( Angle44_g24035 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g24035 ) * sin( Angle44_g24035 ) ) );
			float3 appendResult74_g24022 = (float3(0.0 , 0.0 , VertexPos40_g24022.z));
			half3 VertexPosRotationAxis50_g24022 = appendResult74_g24022;
			float3 break84_g24022 = VertexPos40_g24022;
			float3 appendResult81_g24022 = (float3(break84_g24022.x , break84_g24022.y , 0.0));
			half3 VertexPosOtherAxis82_g24022 = appendResult81_g24022;
			half Motion_X216_g23996 = break143_g23996.x;
			half Angle44_g24022 = -Motion_X216_g23996;
			half Global_NoiseTex_B132_g23996 = break142_g24047.b;
			half Input_Speed62_g24055 = -MotionSpeed265_g23996;
			float mulTime354_g24055 = _Time.y * Input_Speed62_g24055;
			float temp_output_342_0_g24055 = ( -MotionVariation264_g23996 * v.color.r );
			float4x4 break19_g24056 = unity_ObjectToWorld;
			float3 appendResult20_g24056 = (float3(break19_g24056[ 0 ][ 3 ] , break19_g24056[ 1 ][ 3 ] , break19_g24056[ 2 ][ 3 ]));
			half3 Off19_g24058 = appendResult20_g24056;
			float4 transform68_g24056 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g24057 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g24056 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g24057 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g24056 = ( (transform68_g24056).xyz - (transform62_g24056).xyz );
			half3 On20_g24058 = ObjectPositionWithPivots28_g24056;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g24058 = On20_g24058;
			#else
				float3 staticSwitch14_g24058 = Off19_g24058;
			#endif
			half3 ObjectData20_g24059 = staticSwitch14_g24058;
			half3 WorldData19_g24059 = Off19_g24058;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24059 = WorldData19_g24059;
			#else
				float3 staticSwitch14_g24059 = ObjectData20_g24059;
			#endif
			float3 temp_output_42_0_g24056 = staticSwitch14_g24059;
			float3 break9_g24056 = temp_output_42_0_g24056;
			float ObjectData20_g24062 = ( temp_output_342_0_g24055 + ( break9_g24056.x + break9_g24056.z ) );
			float WorldData19_g24062 = temp_output_342_0_g24055;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g24062 = WorldData19_g24062;
			#else
				float staticSwitch14_g24062 = ObjectData20_g24062;
			#endif
			float Motion_Variation284_g24055 = staticSwitch14_g24062;
			float Motion_Scale287_g24055 = ( MotionScale262_g23996 * ase_worldPos.x );
			float3 appendResult2014_g23996 = (float3(0.0 , ( ( _MotionVertical_20 * Bounds_Radius121_g23996 ) * TVE_MotionAmplitude_21 * Mesh_Motion_260_g23996 * Motion_Use20162_g23996 * ( Global_NoiseTex_R34_g23996 + Global_NoiseTex_B132_g23996 ) * Motion_Power2223_g23996 * sin( ( mulTime354_g24055 + Motion_Variation284_g24055 + Motion_Scale287_g24055 ) ) ) , 0.0));
			half3 Motion_Vertical223_g23996 = appendResult2014_g23996;
			half Motion_Scale321_g24015 = ( _MotionScale_30 * 10.0 );
			half Input_Speed62_g24015 = _MotionSpeed_30;
			float mulTime350_g24015 = _Time.y * Input_Speed62_g24015;
			float Motion_Variation330_g24015 = ( _MotionVariation_30 * v.color.r );
			half Input_Amplitude58_g24015 = ( _MotionAmplitude_30 * Bounds_Radius121_g23996 * 0.2 );
			float3 ase_vertexNormal = v.normal.xyz;
			half Mesh_Motion_3144_g23996 = v.texcoord3.z;
			half Motion_Use302011_g23996 = _Motion_30;
			half3 Motion_Leaves1988_g23996 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g24015 ) + mulTime350_g24015 + Motion_Variation330_g24015 ) ) * Input_Amplitude58_g24015 * ase_vertexNormal ) * ( Global_NoiseTex_R34_g23996 + Global_NoiseTex_G38_g23996 ) * Mesh_Motion_3144_g23996 * Motion_Use302011_g23996 * TVE_MotionAmplitude_30 * Motion_Power2223_g23996 );
			half Motion_Scale321_g24007 = ( _MotionScale_32 * 10.0 );
			half Input_Speed62_g24007 = _MotionSpeed_32;
			float mulTime349_g24007 = _Time.y * Input_Speed62_g24007;
			float Motion_Variation330_g24007 = ( _MotionVariation_32 * v.color.r );
			half Input_Amplitude58_g24007 = ( _MotionAmplitude_32 * Bounds_Radius121_g23996 * 0.2 );
			float3 appendResult345_g24007 = (float3(v.color.r , ( 1.0 - v.color.r ) , v.color.r));
			half Global_NoiseTex_A139_g23996 = break142_g24047.a;
			half Motion_Use322013_g23996 = _Motion_32;
			half3 Motion_Flutter263_g23996 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g24007 ) + mulTime349_g24007 + Motion_Variation330_g24007 ) ) * Input_Amplitude58_g24007 * appendResult345_g24007 ) * ( Global_NoiseTex_R34_g23996 + Global_NoiseTex_A139_g23996 ) * Mesh_Motion_3144_g23996 * Motion_Use322013_g23996 * TVE_MotionAmplitude_32 * Motion_Power2223_g23996 );
			float3 Vertex_Motion_Object833_g23996 = ( ( ( ( VertexPosRotationAxis50_g24022 + ( VertexPosOtherAxis82_g24022 * cos( Angle44_g24022 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g24022 ) * sin( Angle44_g24022 ) ) ) + Motion_Vertical223_g23996 ) + Motion_Leaves1988_g23996 ) + Motion_Flutter263_g23996 );
			half3 ObjectData20_g24029 = Vertex_Motion_Object833_g23996;
			float3 appendResult2047_g23996 = (float3(Motion_Rolling138_g23996 , 0.0 , -Motion_Rolling138_g23996));
			float3 appendResult2043_g23996 = (float3(Motion_X216_g23996 , 0.0 , Motion_Z190_g23996));
			float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
			float3 Vertex_Motion_World1118_g23996 = ( mul( unity_WorldToObject, float4( ( ( ( ( ( ase_vertex3Pos + appendResult2047_g23996 ) + appendResult2043_g23996 ) + Motion_Vertical223_g23996 ) + Motion_Leaves1988_g23996 ) + Motion_Flutter263_g23996 ) , 0.0 ) ).xyz * ase_objectScale );
			half3 WorldData19_g24029 = Vertex_Motion_World1118_g23996;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24029 = WorldData19_g24029;
			#else
				float3 staticSwitch14_g24029 = ObjectData20_g24029;
			#endif
			float4x4 break19_g24001 = unity_ObjectToWorld;
			float3 appendResult20_g24001 = (float3(break19_g24001[ 0 ][ 3 ] , break19_g24001[ 1 ][ 3 ] , break19_g24001[ 2 ][ 3 ]));
			half3 Off19_g24003 = appendResult20_g24001;
			float4 transform68_g24001 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g24002 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g24001 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g24002 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g24001 = ( (transform68_g24001).xyz - (transform62_g24001).xyz );
			half3 On20_g24003 = ObjectPositionWithPivots28_g24001;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g24003 = On20_g24003;
			#else
				float3 staticSwitch14_g24003 = Off19_g24003;
			#endif
			half3 ObjectData20_g24004 = staticSwitch14_g24003;
			half3 WorldData19_g24004 = Off19_g24003;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24004 = WorldData19_g24004;
			#else
				float3 staticSwitch14_g24004 = ObjectData20_g24004;
			#endif
			float3 temp_output_42_0_g24001 = staticSwitch14_g24004;
			float temp_output_7_0_g24037 = TVE_SizeFadeEnd;
			float ObjectData20_g24036 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g24001 ) * _GlobalSizeFade ) - temp_output_7_0_g24037 ) / ( TVE_SizeFadeStart - temp_output_7_0_g24037 ) ) );
			float WorldData19_g24036 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g24036 = WorldData19_g24036;
			#else
				float staticSwitch14_g24036 = ObjectData20_g24036;
			#endif
			float Vertex_SizeFade1740_g23996 = staticSwitch14_g24036;
			float4x4 break19_g24039 = unity_ObjectToWorld;
			float3 appendResult20_g24039 = (float3(break19_g24039[ 0 ][ 3 ] , break19_g24039[ 1 ][ 3 ] , break19_g24039[ 2 ][ 3 ]));
			half3 Off19_g24041 = appendResult20_g24039;
			float4 transform68_g24039 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g24040 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g24039 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g24040 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g24039 = ( (transform68_g24039).xyz - (transform62_g24039).xyz );
			half3 On20_g24041 = ObjectPositionWithPivots28_g24039;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g24041 = On20_g24041;
			#else
				float3 staticSwitch14_g24041 = Off19_g24041;
			#endif
			half3 ObjectData20_g24042 = staticSwitch14_g24041;
			half3 WorldData19_g24042 = Off19_g24041;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24042 = WorldData19_g24042;
			#else
				float3 staticSwitch14_g24042 = ObjectData20_g24042;
			#endif
			float3 temp_output_42_0_g24039 = staticSwitch14_g24042;
			half3 ObjectData20_g24045 = temp_output_42_0_g24039;
			half3 WorldData19_g24045 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24045 = WorldData19_g24045;
			#else
				float3 staticSwitch14_g24045 = ObjectData20_g24045;
			#endif
			float4 tex2DNode7_g24038 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g24045).xz ) ), 0.0 );
			half Global_ExtrasTex_G305_g23996 = tex2DNode7_g24038.g;
			float lerpResult346_g23996 = lerp( 1.0 , Global_ExtrasTex_G305_g23996 , _GlobalSize);
			float ObjectData20_g24032 = ( lerpResult346_g23996 * _LocalSize );
			float WorldData19_g24032 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g24032 = WorldData19_g24032;
			#else
				float staticSwitch14_g24032 = ObjectData20_g24032;
			#endif
			half Vertex_Size1741_g23996 = staticSwitch14_g24032;
			float3 Final_VertexPosition890_g23996 = ( ( ( staticSwitch14_g24029 * Vertex_SizeFade1740_g23996 * Vertex_Size1741_g23996 ) + Mesh_PivotsOS2291_g23996 ) + ( _IsStandardPipeline * 0.0 ) );
			v.vertex.xyz = Final_VertexPosition890_g23996;
			v.vertex.w = 1;
		}

		inline half4 LightingStandardCustom(SurfaceOutputStandardCustom s, half3 viewDir, UnityGI gi )
		{
			half3 transmission = max(0 , -dot(s.Normal, gi.light.dir)) * gi.light.color * s.Transmission;
			half4 d = half4(s.Albedo * transmission , 0);

			SurfaceOutputStandard r;
			r.Albedo = s.Albedo;
			r.Normal = s.Normal;
			r.Emission = s.Emission;
			r.Metallic = s.Metallic;
			r.Smoothness = s.Smoothness;
			r.Occlusion = s.Occlusion;
			r.Alpha = s.Alpha;
			return LightingStandard (r, viewDir, gi) + d;
		}

		inline void LightingStandardCustom_GI(SurfaceOutputStandardCustom s, UnityGIInput data, inout UnityGI gi )
		{
			#if defined(UNITY_PASS_DEFERRED) && UNITY_ENABLE_REFLECTION_BUFFERS
				gi = UnityGlobalIllumination(data, s.Occlusion, s.Normal);
			#else
				UNITY_GLOSSY_ENV_FROM_SURFACE( g, s, data );
				gi = UnityGlobalIllumination( data, s.Occlusion, s.Normal, g );
			#endif
		}

		void surf( Input i , inout SurfaceOutputStandardCustom o )
		{
			half2 Main_UVs15_g23996 = ( ( i.uv_texcoord * (_MainUVs).xy ) + (_MainUVs).zw );
			float4 tex2DNode117_g23996 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g23996 );
			float2 appendResult88_g24027 = (float2(tex2DNode117_g23996.a , tex2DNode117_g23996.g));
			float2 temp_output_90_0_g24027 = ( (appendResult88_g24027*2.0 + -1.0) * _MainNormalValue );
			float3 appendResult91_g24027 = (float3(temp_output_90_0_g24027 , 1.0));
			float3 Main_Normal137_g23996 = appendResult91_g24027;
			float3 temp_output_13_0_g24030 = Main_Normal137_g23996;
			float3 switchResult12_g24030 = (((i.ASEVFace>0)?(temp_output_13_0_g24030):(( temp_output_13_0_g24030 * _render_normals_options ))));
			half3 Blend_Normal312_g23996 = switchResult12_g24030;
			float2 temp_output_38_0_g24012 = ( i.uv2_texcoord2 * TVE_OverlayUVTilling );
			float4 tex2DNode33_g24012 = SAMPLE_TEXTURE2D( TVE_OverlayNormalTex, samplerTVE_OverlayAlbedoTex, temp_output_38_0_g24012 );
			float2 appendResult88_g24013 = (float2(tex2DNode33_g24012.a , tex2DNode33_g24012.g));
			float2 temp_output_90_0_g24013 = ( (appendResult88_g24013*2.0 + -1.0) * TVE_OverlayNormalValue );
			float3 appendResult91_g24013 = (float3(temp_output_90_0_g24013 , 1.0));
			float3 temp_output_84_19_g24012 = appendResult91_g24013;
			half3 Global_OverlayNormal313_g23996 = temp_output_84_19_g24012;
			float3 Blend_NormalRaw1051_g23996 = Main_Normal137_g23996;
			float3 switchResult1063_g23996 = (((i.ASEVFace>0)?(Blend_NormalRaw1051_g23996):(( Blend_NormalRaw1051_g23996 * float3(-1,-1,-1) ))));
			half Overlay_Contrast1405_g23996 = _OverlayContrast;
			float3 appendResult1439_g23996 = (float3(Overlay_Contrast1405_g23996 , Overlay_Contrast1405_g23996 , 1.0));
			half Global_OverlayIntensity154_g23996 = TVE_OverlayIntensity;
			float4x4 break19_g24039 = unity_ObjectToWorld;
			float3 appendResult20_g24039 = (float3(break19_g24039[ 0 ][ 3 ] , break19_g24039[ 1 ][ 3 ] , break19_g24039[ 2 ][ 3 ]));
			half3 Off19_g24041 = appendResult20_g24039;
			float4 ase_vertex4Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 transform68_g24039 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 appendResult60_g24040 = (float3(i.uv2_tex4coord2.z , 0.0 , i.uv2_tex4coord2.w));
			float4 transform62_g24039 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g24040 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g24039 = ( (transform68_g24039).xyz - (transform62_g24039).xyz );
			half3 On20_g24041 = ObjectPositionWithPivots28_g24039;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g24041 = On20_g24041;
			#else
				float3 staticSwitch14_g24041 = Off19_g24041;
			#endif
			half3 ObjectData20_g24042 = staticSwitch14_g24041;
			half3 WorldData19_g24042 = Off19_g24041;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24042 = WorldData19_g24042;
			#else
				float3 staticSwitch14_g24042 = ObjectData20_g24042;
			#endif
			float3 temp_output_42_0_g24039 = staticSwitch14_g24042;
			half3 ObjectData20_g24045 = temp_output_42_0_g24039;
			float3 ase_worldPos = i.worldPos;
			half3 WorldData19_g24045 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24045 = WorldData19_g24045;
			#else
				float3 staticSwitch14_g24045 = ObjectData20_g24045;
			#endif
			float4 tex2DNode7_g24038 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g24045).xz ) ) );
			half Global_ExtrasTex_B156_g23996 = tex2DNode7_g24038.b;
			float temp_output_1025_0_g23996 = ( Global_OverlayIntensity154_g23996 * _GlobalOverlay * Global_ExtrasTex_B156_g23996 );
			float Mesh_Variation16_g23996 = i.vertexColor.r;
			float lerpResult1065_g23996 = lerp( 1.0 , Mesh_Variation16_g23996 , _OverlayVariation);
			half Overlay_Commons1365_g23996 = ( temp_output_1025_0_g23996 * lerpResult1065_g23996 );
			half Overlay_Mask269_g23996 = saturate( ( saturate( (WorldNormalVector( i , ( switchResult1063_g23996 * appendResult1439_g23996 ) )).y ) - ( 1.0 - Overlay_Commons1365_g23996 ) ) );
			float3 lerpResult349_g23996 = lerp( Blend_Normal312_g23996 , Global_OverlayNormal313_g23996 , Overlay_Mask269_g23996);
			half3 Final_Normal366_g23996 = lerpResult349_g23996;
			o.Normal = Final_Normal366_g23996;
			float4 tex2DNode29_g23996 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g23996 );
			float4 temp_output_51_0_g23996 = ( _MainColor * tex2DNode29_g23996 );
			half3 Main_AlbedoRaw99_g23996 = (temp_output_51_0_g23996).rgb;
			float4x4 break19_g24082 = unity_ObjectToWorld;
			float3 appendResult20_g24082 = (float3(break19_g24082[ 0 ][ 3 ] , break19_g24082[ 1 ][ 3 ] , break19_g24082[ 2 ][ 3 ]));
			half3 Off19_g24084 = appendResult20_g24082;
			float4 transform68_g24082 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g24083 = (float3(i.uv2_tex4coord2.z , 0.0 , i.uv2_tex4coord2.w));
			float4 transform62_g24082 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g24083 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g24082 = ( (transform68_g24082).xyz - (transform62_g24082).xyz );
			half3 On20_g24084 = ObjectPositionWithPivots28_g24082;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g24084 = On20_g24084;
			#else
				float3 staticSwitch14_g24084 = Off19_g24084;
			#endif
			half3 ObjectData20_g24085 = staticSwitch14_g24084;
			half3 WorldData19_g24085 = Off19_g24084;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24085 = WorldData19_g24085;
			#else
				float3 staticSwitch14_g24085 = ObjectData20_g24085;
			#endif
			float3 temp_output_42_0_g24082 = staticSwitch14_g24085;
			half3 ObjectData20_g24081 = temp_output_42_0_g24082;
			half3 WorldData19_g24081 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g24081 = WorldData19_g24081;
			#else
				float3 staticSwitch14_g24081 = ObjectData20_g24081;
			#endif
			float4 tex2DNode7_g24080 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g24081).xz ) ) );
			half3 Global_ColorsTex_RGB1700_g23996 = (tex2DNode7_g24080).rgb;
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g24028 = 2.0;
			#else
				float staticSwitch1_g24028 = 4.594794;
			#endif
			float4 tex2DNode35_g23996 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g23996 );
			half Main_Mask57_g23996 = tex2DNode35_g23996.b;
			float temp_output_7_0_g24017 = _SubsurfaceMinValue;
			half Subsurface_Mask1557_g23996 = saturate( ( ( Main_Mask57_g23996 - temp_output_7_0_g24017 ) / ( _SubsurfaceMaxValue - temp_output_7_0_g24017 ) ) );
			float lerpResult2105_g23996 = lerp( 1.0 , Subsurface_Mask1557_g23996 , _ColorsMaskValue);
			float3 lerpResult108_g23996 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g23996 * staticSwitch1_g24028 ) ) , ( _GlobalColors * lerpResult2105_g23996 ));
			half3 Global_Colors1954_g23996 = lerpResult108_g23996;
			float3 temp_output_123_0_g23996 = ( Main_AlbedoRaw99_g23996 * Global_Colors1954_g23996 );
			half3 Main_AlbedoColored863_g23996 = temp_output_123_0_g23996;
			half3 Blend_Albedo265_g23996 = Main_AlbedoColored863_g23996;
			float3 temp_cast_2 = (0.5).xxx;
			float3 temp_output_799_0_g23996 = (_SubsurfaceColor).rgb;
			half Global_ColorsTex_A1701_g23996 = tex2DNode7_g24080.a;
			half Global_HealthinessValue1780_g23996 = _GlobalHealthiness;
			float lerpResult1720_g23996 = lerp( 1.0 , Global_ColorsTex_A1701_g23996 , Global_HealthinessValue1780_g23996);
			float3 lerpResult1698_g23996 = lerp( temp_cast_2 , temp_output_799_0_g23996 , lerpResult1720_g23996);
			half3 Subsurface_Color1722_g23996 = lerpResult1698_g23996;
			float lerpResult1779_g23996 = lerp( 1.0 , Global_ColorsTex_A1701_g23996 , Global_HealthinessValue1780_g23996);
			half Autoregister_SubsurfaceSpace2238_g23996 = _SubsurfaceCat;
			half Subsurface_Intensity1752_g23996 = ( ( _SubsurfaceValue * lerpResult1779_g23996 ) + Autoregister_SubsurfaceSpace2238_g23996 );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			half Overlay_Mask_Subsurface1492_g23996 = saturate( ( saturate( ase_worldNormal.y ) - ( 1.0 - Overlay_Commons1365_g23996 ) ) );
			half3 Subsurface_Transmission884_g23996 = ( Subsurface_Color1722_g23996 * Subsurface_Intensity1752_g23996 * Subsurface_Mask1557_g23996 * ( 1.0 - Overlay_Mask_Subsurface1492_g23996 ) );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 normalizeResult1983_g23996 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float dotResult785_g23996 = dot( -ase_worldlightDir , normalizeResult1983_g23996 );
			float saferPower1624_g23996 = max( (dotResult785_g23996*0.5 + 0.5) , 0.0001 );
			#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g23996 = 0.0;
			#else
				float staticSwitch1602_g23996 = ( pow( saferPower1624_g23996 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
			#endif
			half Mask_Subsurface_View782_g23996 = staticSwitch1602_g23996;
			half3 Subsurface_Forward1691_g23996 = ( Subsurface_Transmission884_g23996 * Mask_Subsurface_View782_g23996 );
			half3 Blend_AlbedoAndSubsurface149_g23996 = ( Blend_Albedo265_g23996 + Subsurface_Forward1691_g23996 );
			half3 Global_OverlayColor1758_g23996 = (TVE_OverlayColor).rgb;
			half3 Global_OverlayAlbedo277_g23996 = (SAMPLE_TEXTURE2D( TVE_OverlayAlbedoTex, samplerTVE_OverlayAlbedoTex, temp_output_38_0_g24012 )).rgb;
			float3 lerpResult336_g23996 = lerp( Blend_AlbedoAndSubsurface149_g23996 , ( Global_OverlayColor1758_g23996 * Global_OverlayAlbedo277_g23996 ) , Overlay_Mask269_g23996);
			half3 Final_Albedo359_g23996 = lerpResult336_g23996;
			half Main_Alpha316_g23996 = (temp_output_51_0_g23996).a;
			float lerpResult354_g23996 = lerp( 1.0 , Main_Alpha316_g23996 , _render_premul);
			half Final_Premultiply355_g23996 = lerpResult354_g23996;
			o.Albedo = ( Final_Albedo359_g23996 * Final_Premultiply355_g23996 );
			half Main_Smoothness227_g23996 = ( tex2DNode35_g23996.a * _MainSmoothnessValue );
			half Blend_Smoothness314_g23996 = Main_Smoothness227_g23996;
			half Global_OverlaySmoothness311_g23996 = TVE_OverlaySmoothness;
			float lerpResult343_g23996 = lerp( Blend_Smoothness314_g23996 , Global_OverlaySmoothness311_g23996 , Overlay_Mask269_g23996);
			half Final_Smoothness371_g23996 = lerpResult343_g23996;
			half Global_Wetness1016_g23996 = ( TVE_Wetness * _GlobalWetness );
			half Global_ExtrasTex_A1033_g23996 = tex2DNode7_g24038.a;
			float lerpResult1037_g23996 = lerp( Final_Smoothness371_g23996 , saturate( ( Final_Smoothness371_g23996 + Global_Wetness1016_g23996 ) ) , Global_ExtrasTex_A1033_g23996);
			o.Smoothness = lerpResult1037_g23996;
			half Mesh_Occlusion318_g23996 = i.vertexColor.g;
			float saferPower1201_g23996 = max( Mesh_Occlusion318_g23996 , 0.0001 );
			half Vertex_Occlusion648_g23996 = pow( saferPower1201_g23996 , _ObjectOcclusionValue );
			float lerpResult240_g23996 = lerp( 1.0 , tex2DNode35_g23996.g , _MainOcclusionValue);
			half Main_Occlusion247_g23996 = lerpResult240_g23996;
			half Blend_Occlusion323_g23996 = Main_Occlusion247_g23996;
			o.Occlusion = ( Vertex_Occlusion648_g23996 * Blend_Occlusion323_g23996 );
			o.Transmission = Subsurface_Transmission884_g23996;
			o.Alpha = Main_Alpha316_g23996;
			half Main_AlphaRaw1203_g23996 = tex2DNode29_g23996.a;
			float lerpResult2262_g23996 = lerp( 0.9 , Mesh_Variation16_g23996 , _LeavesVariationValue);
			half Global_ExtrasTex_R174_g23996 = tex2DNode7_g24038.r;
			float lerpResult2624_g23996 = lerp( 1.0 , Global_ExtrasTex_R174_g23996 , _GlobalLeaves);
			half AlphaTreshold2132_g23996 = _Cutoff;
			half Mask_Leaves315_g23996 = ( ( (lerpResult2262_g23996*0.5 + 0.5) - ( 1.0 - ( lerpResult2624_g23996 * _LocalLeaves ) ) ) + AlphaTreshold2132_g23996 );
			half Alpha5_g24016 = ( Main_AlphaRaw1203_g23996 * Mask_Leaves315_g23996 );
			#ifdef _ALPHATEST_ON
				float staticSwitch2_g24016 = Alpha5_g24016;
			#else
				float staticSwitch2_g24016 = 1.0;
			#endif
			half Final_Clip914_g23996 = staticSwitch2_g24016;
			clip( Final_Clip914_g23996 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=18500
1927;1;1906;1020;2897.732;923.0222;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-640;Half;False;Property;_render_cull;_render_cull;179;0;Fetch;True;3;Both;0;Back;1;Front;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1376,-640;Half;False;Property;_render_zw;_render_zw;182;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;404;-1376,-768;Half;False;Property;_IsForwardPathShader;_IsForwardPathShader;177;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-640;Half;False;Property;_Cutoff;_Cutoff;178;1;[HideInInspector];Fetch;True;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1744,-640;Half;False;Property;_render_src;_render_src;180;0;Fetch;True;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1552,-640;Half;False;Property;_render_dst;_render_dst;181;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;469;-2176,-256;Inherit;False;Base Shader;1;;23996;856f7164d1c579d43a5cf4968a75ca43;51,1271,2,1300,1,1298,1,1962,1,1708,1,1712,3,1964,1,1969,1,1723,1,1719,1,893,1,1745,1,1742,1,1715,1,1714,1,1717,1,1728,1,1718,1,916,1,1732,1,1949,1,1763,1,1762,1,1776,1,1646,1,1690,0,1757,0,1669,1,1981,0,1759,1,2172,0,1733,0,1734,0,1736,0,1968,0,1735,0,1737,0,1966,0,1550,0,878,0,860,1,2261,1,2260,1,2032,1,2054,1,2057,1,2033,1,2036,1,2060,1,2062,1,2039,1;0;16;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534;FLOAT3;2075
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-768;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Leaf Subsurface Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-1776,-768;Half;False;Property;_IsStandardShader;_IsStandardShader;175;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;271;-1552,-768;Half;False;Property;_IsLitShader;_IsLitShader;176;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;433;-2176,384;Inherit;False;Feature Batching Support;172;;24097;d914b3a554b05ab4da8c1d2a8ce94c0a;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;168;-1968,-768;Half;False;Property;_IsLeafShader;_IsLeafShader;174;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-1376,-256;Float;False;True;-1;2;TVEShaderCoreGUI;0;0;Standard;BOXOPHOBIC/The Vegetation Engine/Vegetation/Leaf Subsurface Lit;False;False;False;False;False;True;False;True;False;False;False;False;True;True;True;False;True;False;False;False;True;Back;0;True;17;0;False;-1;True;0;False;-1;1;False;-1;False;0;Custom;0.5;True;True;0;True;Opaque;;Geometry;ForwardOnly;11;d3d11;glcore;gles3;metal;vulkan;xbox360;xboxone;ps4;psp2;n3ds;wiiu;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;1;0;True;20;0;True;7;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Absolute;0;;-1;-1;-1;-1;0;False;0;0;True;10;-1;0;True;21;0;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-896;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;449;-2176,256;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-384;Inherit;False;1024.392;100;Final;0;;0,1,0.5,1;0;0
WireConnection;0;0;469;0
WireConnection;0;1;469;528
WireConnection;0;4;469;530
WireConnection;0;5;469;531
WireConnection;0;6;469;1230
WireConnection;0;9;469;532
WireConnection;0;10;469;653
WireConnection;0;11;469;534
ASEEND*/
//CHKSM=7FB8F07E16CD528A708FCDC85CDA1DC3C82753BF
