// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Vegetation/Leaf Standard Lit"
{
	Properties
	{
		[StyledBanner(Leaf Standard Lit)]_Banner("Banner", Float) = 0
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
		[HideInInspector]_IsAnyPathShader("_IsAnyPathShader", Float) = 1
		[HideInInspector]_IsLitShader("_IsLitShader", Float) = 1
		[HideInInspector]_Cutoff("_Cutoff", Float) = 0.5
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" "DisableBatching" = "True" }
		Cull [_render_cull]
		ZWrite [_render_zw]
		Blend [_render_src] [_render_dst]
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
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
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows novertexlights nodynlightmap dithercrossfade vertex:vertexDataFunc 
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
		uniform half _material_batching;
		uniform half _IsAnyPathShader;
		uniform half _IsLeafShader;
		uniform half _IsStandardShader;
		uniform half _IsLitShader;
		uniform half _Banner;
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
			float3 Mesh_PivotsOS2291_g22924 = staticSwitch14_g23099;
			float3 temp_output_2283_0_g22924 = ( ase_vertex3Pos - Mesh_PivotsOS2291_g22924 );
			half3 VertexPos40_g23114 = temp_output_2283_0_g22924;
			float3 appendResult74_g23114 = (float3(0.0 , VertexPos40_g23114.y , 0.0));
			float3 VertexPosRotationAxis50_g23114 = appendResult74_g23114;
			float3 break84_g23114 = VertexPos40_g23114;
			float3 appendResult81_g23114 = (float3(break84_g23114.x , 0.0 , break84_g23114.z));
			float3 VertexPosOtherAxis82_g23114 = appendResult81_g23114;
			float ObjectData20_g23109 = 3.14;
			float Bounds_Radius121_g22924 = _MaxBoundsInfo.x;
			float WorldData19_g23109 = Bounds_Radius121_g22924;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23109 = WorldData19_g23109;
			#else
				float staticSwitch14_g23109 = ObjectData20_g23109;
			#endif
			float Motion_Max_Rolling1137_g22924 = staticSwitch14_g23109;
			half Mesh_Motion_260_g22924 = v.texcoord3.y;
			float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
			float4x4 break19_g23138 = unity_ObjectToWorld;
			float3 appendResult20_g23138 = (float3(break19_g23138[ 0 ][ 3 ] , break19_g23138[ 1 ][ 3 ] , break19_g23138[ 2 ][ 3 ]));
			half3 Off19_g23140 = appendResult20_g23138;
			float4 ase_vertex4Pos = v.vertex;
			float4 transform68_g23138 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23139 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g23138 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23139 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23138 = ( (transform68_g23138).xyz - (transform62_g23138).xyz );
			half3 On20_g23140 = ObjectPositionWithPivots28_g23138;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23140 = On20_g23140;
			#else
				float3 staticSwitch14_g23140 = Off19_g23140;
			#endif
			half3 ObjectData20_g23141 = staticSwitch14_g23140;
			half3 WorldData19_g23141 = Off19_g23140;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23141 = WorldData19_g23141;
			#else
				float3 staticSwitch14_g23141 = ObjectData20_g23141;
			#endif
			float3 temp_output_42_0_g23138 = staticSwitch14_g23141;
			half3 ObjectData20_g23144 = temp_output_42_0_g23138;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			half3 WorldData19_g23144 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23144 = WorldData19_g23144;
			#else
				float3 staticSwitch14_g23144 = ObjectData20_g23144;
			#endif
			float2 panner73_g23137 = ( _Time.y * temp_cast_0 + ( (staticSwitch14_g23144).xz * TVE_NoiseSize ));
			float4 temp_cast_2 = (TVE_NoiseContrast).xxxx;
			float4 break142_g23137 = pow( abs( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g23137, 0.0 ) ) , temp_cast_2 );
			half Global_NoiseTex_R34_g22924 = break142_g23137.r;
			half Global_NoiseTex_G38_g22924 = break142_g23137.g;
			half Motion_Use20162_g22924 = _Motion_20;
			float4x4 break19_g23164 = unity_ObjectToWorld;
			float3 appendResult20_g23164 = (float3(break19_g23164[ 0 ][ 3 ] , break19_g23164[ 1 ][ 3 ] , break19_g23164[ 2 ][ 3 ]));
			half3 Off19_g23166 = appendResult20_g23164;
			float4 transform68_g23164 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23165 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g23164 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23165 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23164 = ( (transform68_g23164).xyz - (transform62_g23164).xyz );
			half3 On20_g23166 = ObjectPositionWithPivots28_g23164;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23166 = On20_g23166;
			#else
				float3 staticSwitch14_g23166 = Off19_g23166;
			#endif
			half3 ObjectData20_g23167 = staticSwitch14_g23166;
			half3 WorldData19_g23167 = Off19_g23166;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23167 = WorldData19_g23167;
			#else
				float3 staticSwitch14_g23167 = ObjectData20_g23167;
			#endif
			float3 temp_output_42_0_g23164 = staticSwitch14_g23167;
			half3 ObjectData20_g23162 = temp_output_42_0_g23164;
			half3 WorldData19_g23162 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23162 = WorldData19_g23162;
			#else
				float3 staticSwitch14_g23162 = ObjectData20_g23162;
			#endif
			float4 break322_g23100 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23162).xz ) ), 0.0 );
			half Motion_Power2223_g22924 = break322_g23100.z;
			half MotionSpeed265_g22924 = _MotionSpeed_20;
			half Input_Speed62_g23153 = MotionSpeed265_g22924;
			float mulTime354_g23153 = _Time.y * Input_Speed62_g23153;
			half MotionVariation264_g22924 = _MotionVariation_20;
			float temp_output_342_0_g23153 = ( MotionVariation264_g22924 * v.color.r );
			float4x4 break19_g23154 = unity_ObjectToWorld;
			float3 appendResult20_g23154 = (float3(break19_g23154[ 0 ][ 3 ] , break19_g23154[ 1 ][ 3 ] , break19_g23154[ 2 ][ 3 ]));
			half3 Off19_g23156 = appendResult20_g23154;
			float4 transform68_g23154 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23155 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g23154 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23155 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23154 = ( (transform68_g23154).xyz - (transform62_g23154).xyz );
			half3 On20_g23156 = ObjectPositionWithPivots28_g23154;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23156 = On20_g23156;
			#else
				float3 staticSwitch14_g23156 = Off19_g23156;
			#endif
			half3 ObjectData20_g23157 = staticSwitch14_g23156;
			half3 WorldData19_g23157 = Off19_g23156;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23157 = WorldData19_g23157;
			#else
				float3 staticSwitch14_g23157 = ObjectData20_g23157;
			#endif
			float3 temp_output_42_0_g23154 = staticSwitch14_g23157;
			float3 break9_g23154 = temp_output_42_0_g23154;
			float ObjectData20_g23160 = ( temp_output_342_0_g23153 + ( break9_g23154.x + break9_g23154.z ) );
			float WorldData19_g23160 = temp_output_342_0_g23153;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23160 = WorldData19_g23160;
			#else
				float staticSwitch14_g23160 = ObjectData20_g23160;
			#endif
			float Motion_Variation284_g23153 = staticSwitch14_g23160;
			half MotionScale262_g22924 = _MotionScale_20;
			float Motion_Scale287_g23153 = ( MotionScale262_g22924 * ase_worldPos.x );
			half Motion_Rolling138_g22924 = ( ( _MotionAmplitude_20 * Motion_Max_Rolling1137_g22924 ) * TVE_MotionAmplitude_20 * Mesh_Motion_260_g22924 * ( Global_NoiseTex_R34_g22924 + Global_NoiseTex_G38_g22924 ) * Motion_Use20162_g22924 * Motion_Power2223_g22924 * sin( ( mulTime354_g23153 + Motion_Variation284_g23153 + Motion_Scale287_g23153 ) ) );
			half Angle44_g23114 = Motion_Rolling138_g22924;
			half3 VertexPos40_g23125 = ( VertexPosRotationAxis50_g23114 + ( VertexPosOtherAxis82_g23114 * cos( Angle44_g23114 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g23114 ) * sin( Angle44_g23114 ) ) );
			float3 appendResult74_g23125 = (float3(VertexPos40_g23125.x , 0.0 , 0.0));
			half3 VertexPosRotationAxis50_g23125 = appendResult74_g23125;
			float3 break84_g23125 = VertexPos40_g23125;
			float3 appendResult81_g23125 = (float3(0.0 , break84_g23125.y , break84_g23125.z));
			half3 VertexPosOtherAxis82_g23125 = appendResult81_g23125;
			float ObjectData20_g23110 = 3.14;
			float Bounds_Height374_g22924 = _MaxBoundsInfo.y;
			float WorldData19_g23110 = ( Bounds_Height374_g22924 * 3.14 );
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23110 = WorldData19_g23110;
			#else
				float staticSwitch14_g23110 = ObjectData20_g23110;
			#endif
			float Motion_Max_Bending1133_g22924 = staticSwitch14_g23110;
			float3 appendResult323_g23100 = (float3(break322_g23100.x , 0.0 , break322_g23100.y));
			float3 temp_output_324_0_g23100 = (appendResult323_g23100*2.0 + -1.0);
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			half3 ObjectData20_g23101 = ( mul( unity_WorldToObject, float4( temp_output_324_0_g23100 , 0.0 ) ).xyz * ase_parentObjectScale );
			half3 WorldData19_g23101 = temp_output_324_0_g23100;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23101 = WorldData19_g23101;
			#else
				float3 staticSwitch14_g23101 = ObjectData20_g23101;
			#endif
			half2 Motion_DirectionOS39_g22924 = (staticSwitch14_g23101).xz;
			half Motion_Use1056_g22924 = ( _Motion_10 + _MotionCat );
			half Input_Speed62_g23179 = _MotionSpeed_10;
			float mulTime373_g23179 = _Time.y * Input_Speed62_g23179;
			float temp_output_349_0_g23179 = ( _MotionVariation_10 * v.color.r );
			float4x4 break19_g23180 = unity_ObjectToWorld;
			float3 appendResult20_g23180 = (float3(break19_g23180[ 0 ][ 3 ] , break19_g23180[ 1 ][ 3 ] , break19_g23180[ 2 ][ 3 ]));
			half3 Off19_g23182 = appendResult20_g23180;
			float4 transform68_g23180 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23181 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g23180 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23181 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23180 = ( (transform68_g23180).xyz - (transform62_g23180).xyz );
			half3 On20_g23182 = ObjectPositionWithPivots28_g23180;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23182 = On20_g23182;
			#else
				float3 staticSwitch14_g23182 = Off19_g23182;
			#endif
			half3 ObjectData20_g23183 = staticSwitch14_g23182;
			half3 WorldData19_g23183 = Off19_g23182;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23183 = WorldData19_g23183;
			#else
				float3 staticSwitch14_g23183 = ObjectData20_g23183;
			#endif
			float3 temp_output_42_0_g23180 = staticSwitch14_g23183;
			float3 break9_g23180 = temp_output_42_0_g23180;
			float ObjectData20_g23186 = ( temp_output_349_0_g23179 + ( break9_g23180.x + break9_g23180.z ) );
			float WorldData19_g23186 = temp_output_349_0_g23179;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23186 = WorldData19_g23186;
			#else
				float staticSwitch14_g23186 = ObjectData20_g23186;
			#endif
			half Motion_Variation284_g23179 = staticSwitch14_g23186;
			float2 appendResult344_g23179 = (float2(ase_worldPos.x , ase_worldPos.z));
			float2 Motion_Scale287_g23179 = ( _MotionScale_10 * appendResult344_g23179 );
			half2 Sine_MinusOneToOne281_g23179 = sin( ( mulTime373_g23179 + Motion_Variation284_g23179 + Motion_Scale287_g23179 ) );
			float2 temp_cast_9 = (1.0).xx;
			half Input_Turbulence327_g23179 = Global_NoiseTex_R34_g22924;
			float2 lerpResult321_g23179 = lerp( Sine_MinusOneToOne281_g23179 , temp_cast_9 , Input_Turbulence327_g23179);
			half2 Motion_Bending2258_g22924 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g22924 ) * TVE_MotionAmplitude_10 * Global_NoiseTex_R34_g22924 * Motion_DirectionOS39_g22924 * Motion_Power2223_g22924 * Motion_Use1056_g22924 * lerpResult321_g23179 );
			half Motion_UseInteraction2097_g22924 = _Motion_Interaction;
			half Motion_InteractionMask66_g22924 = break322_g23100.w;
			half2 Motion_Interaction53_g22924 = ( _InteractionAmplitude * Motion_Max_Bending1133_g22924 * Motion_UseInteraction2097_g22924 * Motion_InteractionMask66_g22924 * Motion_InteractionMask66_g22924 * Motion_DirectionOS39_g22924 );
			float2 lerpResult109_g22924 = lerp( Motion_Bending2258_g22924 , Motion_Interaction53_g22924 , Motion_InteractionMask66_g22924);
			half Mesh_Motion_182_g22924 = v.texcoord3.x;
			float2 break143_g22924 = ( lerpResult109_g22924 * Mesh_Motion_182_g22924 );
			half Motion_Z190_g22924 = break143_g22924.y;
			half Angle44_g23125 = Motion_Z190_g22924;
			half3 VertexPos40_g23112 = ( VertexPosRotationAxis50_g23125 + ( VertexPosOtherAxis82_g23125 * cos( Angle44_g23125 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g23125 ) * sin( Angle44_g23125 ) ) );
			float3 appendResult74_g23112 = (float3(0.0 , 0.0 , VertexPos40_g23112.z));
			half3 VertexPosRotationAxis50_g23112 = appendResult74_g23112;
			float3 break84_g23112 = VertexPos40_g23112;
			float3 appendResult81_g23112 = (float3(break84_g23112.x , break84_g23112.y , 0.0));
			half3 VertexPosOtherAxis82_g23112 = appendResult81_g23112;
			half Motion_X216_g22924 = break143_g22924.x;
			half Angle44_g23112 = -Motion_X216_g22924;
			half Global_NoiseTex_B132_g22924 = break142_g23137.b;
			half Input_Speed62_g23145 = -MotionSpeed265_g22924;
			float mulTime354_g23145 = _Time.y * Input_Speed62_g23145;
			float temp_output_342_0_g23145 = ( -MotionVariation264_g22924 * v.color.r );
			float4x4 break19_g23146 = unity_ObjectToWorld;
			float3 appendResult20_g23146 = (float3(break19_g23146[ 0 ][ 3 ] , break19_g23146[ 1 ][ 3 ] , break19_g23146[ 2 ][ 3 ]));
			half3 Off19_g23148 = appendResult20_g23146;
			float4 transform68_g23146 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23147 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g23146 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23147 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23146 = ( (transform68_g23146).xyz - (transform62_g23146).xyz );
			half3 On20_g23148 = ObjectPositionWithPivots28_g23146;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23148 = On20_g23148;
			#else
				float3 staticSwitch14_g23148 = Off19_g23148;
			#endif
			half3 ObjectData20_g23149 = staticSwitch14_g23148;
			half3 WorldData19_g23149 = Off19_g23148;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23149 = WorldData19_g23149;
			#else
				float3 staticSwitch14_g23149 = ObjectData20_g23149;
			#endif
			float3 temp_output_42_0_g23146 = staticSwitch14_g23149;
			float3 break9_g23146 = temp_output_42_0_g23146;
			float ObjectData20_g23152 = ( temp_output_342_0_g23145 + ( break9_g23146.x + break9_g23146.z ) );
			float WorldData19_g23152 = temp_output_342_0_g23145;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23152 = WorldData19_g23152;
			#else
				float staticSwitch14_g23152 = ObjectData20_g23152;
			#endif
			float Motion_Variation284_g23145 = staticSwitch14_g23152;
			float Motion_Scale287_g23145 = ( MotionScale262_g22924 * ase_worldPos.x );
			float3 appendResult2014_g22924 = (float3(0.0 , ( ( _MotionVertical_20 * Bounds_Radius121_g22924 ) * TVE_MotionAmplitude_21 * Mesh_Motion_260_g22924 * Motion_Use20162_g22924 * ( Global_NoiseTex_R34_g22924 + Global_NoiseTex_B132_g22924 ) * Motion_Power2223_g22924 * sin( ( mulTime354_g23145 + Motion_Variation284_g23145 + Motion_Scale287_g23145 ) ) ) , 0.0));
			half3 Motion_Vertical223_g22924 = appendResult2014_g22924;
			half Motion_Scale321_g23105 = ( _MotionScale_30 * 10.0 );
			half Input_Speed62_g23105 = _MotionSpeed_30;
			float mulTime350_g23105 = _Time.y * Input_Speed62_g23105;
			float Motion_Variation330_g23105 = ( _MotionVariation_30 * v.color.r );
			half Input_Amplitude58_g23105 = ( _MotionAmplitude_30 * Bounds_Radius121_g22924 * 0.2 );
			float3 ase_vertexNormal = v.normal.xyz;
			half Mesh_Motion_3144_g22924 = v.texcoord3.z;
			half Motion_Use302011_g22924 = _Motion_30;
			half3 Motion_Leaves1988_g22924 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g23105 ) + mulTime350_g23105 + Motion_Variation330_g23105 ) ) * Input_Amplitude58_g23105 * ase_vertexNormal ) * ( Global_NoiseTex_R34_g22924 + Global_NoiseTex_G38_g22924 ) * Mesh_Motion_3144_g22924 * Motion_Use302011_g22924 * TVE_MotionAmplitude_30 * Motion_Power2223_g22924 );
			half Motion_Scale321_g23097 = ( _MotionScale_32 * 10.0 );
			half Input_Speed62_g23097 = _MotionSpeed_32;
			float mulTime349_g23097 = _Time.y * Input_Speed62_g23097;
			float Motion_Variation330_g23097 = ( _MotionVariation_32 * v.color.r );
			half Input_Amplitude58_g23097 = ( _MotionAmplitude_32 * Bounds_Radius121_g22924 * 0.2 );
			float3 appendResult345_g23097 = (float3(v.color.r , ( 1.0 - v.color.r ) , v.color.r));
			half Global_NoiseTex_A139_g22924 = break142_g23137.a;
			half Motion_Use322013_g22924 = _Motion_32;
			half3 Motion_Flutter263_g22924 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g23097 ) + mulTime349_g23097 + Motion_Variation330_g23097 ) ) * Input_Amplitude58_g23097 * appendResult345_g23097 ) * ( Global_NoiseTex_R34_g22924 + Global_NoiseTex_A139_g22924 ) * Mesh_Motion_3144_g22924 * Motion_Use322013_g22924 * TVE_MotionAmplitude_32 * Motion_Power2223_g22924 );
			float3 Vertex_Motion_Object833_g22924 = ( ( ( ( VertexPosRotationAxis50_g23112 + ( VertexPosOtherAxis82_g23112 * cos( Angle44_g23112 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g23112 ) * sin( Angle44_g23112 ) ) ) + Motion_Vertical223_g22924 ) + Motion_Leaves1988_g22924 ) + Motion_Flutter263_g22924 );
			half3 ObjectData20_g23119 = Vertex_Motion_Object833_g22924;
			float3 appendResult2047_g22924 = (float3(Motion_Rolling138_g22924 , 0.0 , -Motion_Rolling138_g22924));
			float3 appendResult2043_g22924 = (float3(Motion_X216_g22924 , 0.0 , Motion_Z190_g22924));
			float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
			float3 Vertex_Motion_World1118_g22924 = ( mul( unity_WorldToObject, float4( ( ( ( ( ( ase_vertex3Pos + appendResult2047_g22924 ) + appendResult2043_g22924 ) + Motion_Vertical223_g22924 ) + Motion_Leaves1988_g22924 ) + Motion_Flutter263_g22924 ) , 0.0 ) ).xyz * ase_objectScale );
			half3 WorldData19_g23119 = Vertex_Motion_World1118_g22924;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23119 = WorldData19_g23119;
			#else
				float3 staticSwitch14_g23119 = ObjectData20_g23119;
			#endif
			float4x4 break19_g23091 = unity_ObjectToWorld;
			float3 appendResult20_g23091 = (float3(break19_g23091[ 0 ][ 3 ] , break19_g23091[ 1 ][ 3 ] , break19_g23091[ 2 ][ 3 ]));
			half3 Off19_g23093 = appendResult20_g23091;
			float4 transform68_g23091 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23092 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g23091 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23092 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23091 = ( (transform68_g23091).xyz - (transform62_g23091).xyz );
			half3 On20_g23093 = ObjectPositionWithPivots28_g23091;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23093 = On20_g23093;
			#else
				float3 staticSwitch14_g23093 = Off19_g23093;
			#endif
			half3 ObjectData20_g23094 = staticSwitch14_g23093;
			half3 WorldData19_g23094 = Off19_g23093;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23094 = WorldData19_g23094;
			#else
				float3 staticSwitch14_g23094 = ObjectData20_g23094;
			#endif
			float3 temp_output_42_0_g23091 = staticSwitch14_g23094;
			float temp_output_7_0_g23127 = TVE_SizeFadeEnd;
			float ObjectData20_g23126 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g23091 ) * _GlobalSizeFade ) - temp_output_7_0_g23127 ) / ( TVE_SizeFadeStart - temp_output_7_0_g23127 ) ) );
			float WorldData19_g23126 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23126 = WorldData19_g23126;
			#else
				float staticSwitch14_g23126 = ObjectData20_g23126;
			#endif
			float Vertex_SizeFade1740_g22924 = staticSwitch14_g23126;
			float4x4 break19_g23129 = unity_ObjectToWorld;
			float3 appendResult20_g23129 = (float3(break19_g23129[ 0 ][ 3 ] , break19_g23129[ 1 ][ 3 ] , break19_g23129[ 2 ][ 3 ]));
			half3 Off19_g23131 = appendResult20_g23129;
			float4 transform68_g23129 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23130 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
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
			half3 WorldData19_g23135 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23135 = WorldData19_g23135;
			#else
				float3 staticSwitch14_g23135 = ObjectData20_g23135;
			#endif
			float4 tex2DNode7_g23128 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23135).xz ) ), 0.0 );
			half Global_ExtrasTex_G305_g22924 = tex2DNode7_g23128.g;
			float lerpResult346_g22924 = lerp( 1.0 , Global_ExtrasTex_G305_g22924 , _GlobalSize);
			float ObjectData20_g23122 = ( lerpResult346_g22924 * _LocalSize );
			float WorldData19_g23122 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23122 = WorldData19_g23122;
			#else
				float staticSwitch14_g23122 = ObjectData20_g23122;
			#endif
			half Vertex_Size1741_g22924 = staticSwitch14_g23122;
			float3 Final_VertexPosition890_g22924 = ( ( ( staticSwitch14_g23119 * Vertex_SizeFade1740_g22924 * Vertex_Size1741_g22924 ) + Mesh_PivotsOS2291_g22924 ) + ( _IsStandardPipeline * 0.0 ) );
			v.vertex.xyz = Final_VertexPosition890_g22924;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			half2 Main_UVs15_g22924 = ( ( i.uv_texcoord * (_MainUVs).xy ) + (_MainUVs).zw );
			float4 tex2DNode117_g22924 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g22924 );
			float2 appendResult88_g23117 = (float2(tex2DNode117_g22924.a , tex2DNode117_g22924.g));
			float2 temp_output_90_0_g23117 = ( (appendResult88_g23117*2.0 + -1.0) * _MainNormalValue );
			float3 appendResult91_g23117 = (float3(temp_output_90_0_g23117 , 1.0));
			float3 Main_Normal137_g22924 = appendResult91_g23117;
			float3 temp_output_13_0_g23120 = Main_Normal137_g22924;
			float3 switchResult12_g23120 = (((i.ASEVFace>0)?(temp_output_13_0_g23120):(( temp_output_13_0_g23120 * _render_normals_options ))));
			half3 Blend_Normal312_g22924 = switchResult12_g23120;
			float2 temp_output_38_0_g23102 = ( i.uv2_texcoord2 * TVE_OverlayUVTilling );
			float4 tex2DNode33_g23102 = SAMPLE_TEXTURE2D( TVE_OverlayNormalTex, samplerTVE_OverlayAlbedoTex, temp_output_38_0_g23102 );
			float2 appendResult88_g23103 = (float2(tex2DNode33_g23102.a , tex2DNode33_g23102.g));
			float2 temp_output_90_0_g23103 = ( (appendResult88_g23103*2.0 + -1.0) * TVE_OverlayNormalValue );
			float3 appendResult91_g23103 = (float3(temp_output_90_0_g23103 , 1.0));
			float3 temp_output_84_19_g23102 = appendResult91_g23103;
			half3 Global_OverlayNormal313_g22924 = temp_output_84_19_g23102;
			float3 Blend_NormalRaw1051_g22924 = Main_Normal137_g22924;
			float3 switchResult1063_g22924 = (((i.ASEVFace>0)?(Blend_NormalRaw1051_g22924):(( Blend_NormalRaw1051_g22924 * float3(-1,-1,-1) ))));
			half Overlay_Contrast1405_g22924 = _OverlayContrast;
			float3 appendResult1439_g22924 = (float3(Overlay_Contrast1405_g22924 , Overlay_Contrast1405_g22924 , 1.0));
			half Global_OverlayIntensity154_g22924 = TVE_OverlayIntensity;
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
			half Global_ExtrasTex_B156_g22924 = tex2DNode7_g23128.b;
			float temp_output_1025_0_g22924 = ( Global_OverlayIntensity154_g22924 * _GlobalOverlay * Global_ExtrasTex_B156_g22924 );
			float Mesh_Variation16_g22924 = i.vertexColor.r;
			float lerpResult1065_g22924 = lerp( 1.0 , Mesh_Variation16_g22924 , _OverlayVariation);
			half Overlay_Commons1365_g22924 = ( temp_output_1025_0_g22924 * lerpResult1065_g22924 );
			half Overlay_Mask269_g22924 = saturate( ( saturate( (WorldNormalVector( i , ( switchResult1063_g22924 * appendResult1439_g22924 ) )).y ) - ( 1.0 - Overlay_Commons1365_g22924 ) ) );
			float3 lerpResult349_g22924 = lerp( Blend_Normal312_g22924 , Global_OverlayNormal313_g22924 , Overlay_Mask269_g22924);
			half3 Final_Normal366_g22924 = lerpResult349_g22924;
			o.Normal = Final_Normal366_g22924;
			float4 tex2DNode29_g22924 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g22924 );
			float4 temp_output_51_0_g22924 = ( _MainColor * tex2DNode29_g22924 );
			half3 Main_AlbedoRaw99_g22924 = (temp_output_51_0_g22924).rgb;
			float4x4 break19_g23172 = unity_ObjectToWorld;
			float3 appendResult20_g23172 = (float3(break19_g23172[ 0 ][ 3 ] , break19_g23172[ 1 ][ 3 ] , break19_g23172[ 2 ][ 3 ]));
			half3 Off19_g23174 = appendResult20_g23172;
			float4 transform68_g23172 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23173 = (float3(i.uv2_tex4coord2.z , 0.0 , i.uv2_tex4coord2.w));
			float4 transform62_g23172 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23173 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23172 = ( (transform68_g23172).xyz - (transform62_g23172).xyz );
			half3 On20_g23174 = ObjectPositionWithPivots28_g23172;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23174 = On20_g23174;
			#else
				float3 staticSwitch14_g23174 = Off19_g23174;
			#endif
			half3 ObjectData20_g23175 = staticSwitch14_g23174;
			half3 WorldData19_g23175 = Off19_g23174;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23175 = WorldData19_g23175;
			#else
				float3 staticSwitch14_g23175 = ObjectData20_g23175;
			#endif
			float3 temp_output_42_0_g23172 = staticSwitch14_g23175;
			half3 ObjectData20_g23171 = temp_output_42_0_g23172;
			half3 WorldData19_g23171 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23171 = WorldData19_g23171;
			#else
				float3 staticSwitch14_g23171 = ObjectData20_g23171;
			#endif
			float4 tex2DNode7_g23170 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23171).xz ) ) );
			half3 Global_ColorsTex_RGB1700_g22924 = (tex2DNode7_g23170).rgb;
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g23118 = 2.0;
			#else
				float staticSwitch1_g23118 = 4.594794;
			#endif
			float4 tex2DNode35_g22924 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g22924 );
			half Main_Mask57_g22924 = tex2DNode35_g22924.b;
			float temp_output_7_0_g23107 = _SubsurfaceMinValue;
			half Subsurface_Mask1557_g22924 = saturate( ( ( Main_Mask57_g22924 - temp_output_7_0_g23107 ) / ( _SubsurfaceMaxValue - temp_output_7_0_g23107 ) ) );
			float lerpResult2105_g22924 = lerp( 1.0 , Subsurface_Mask1557_g22924 , _ColorsMaskValue);
			float3 lerpResult108_g22924 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g22924 * staticSwitch1_g23118 ) ) , ( _GlobalColors * lerpResult2105_g22924 ));
			half3 Global_Colors1954_g22924 = lerpResult108_g22924;
			float3 temp_output_123_0_g22924 = ( Main_AlbedoRaw99_g22924 * Global_Colors1954_g22924 );
			half3 Main_AlbedoColored863_g22924 = temp_output_123_0_g22924;
			half3 Blend_Albedo265_g22924 = Main_AlbedoColored863_g22924;
			float3 temp_cast_2 = (0.5).xxx;
			float3 temp_output_799_0_g22924 = (_SubsurfaceColor).rgb;
			half Global_ColorsTex_A1701_g22924 = tex2DNode7_g23170.a;
			half Global_HealthinessValue1780_g22924 = _GlobalHealthiness;
			float lerpResult1720_g22924 = lerp( 1.0 , Global_ColorsTex_A1701_g22924 , Global_HealthinessValue1780_g22924);
			float3 lerpResult1698_g22924 = lerp( temp_cast_2 , temp_output_799_0_g22924 , lerpResult1720_g22924);
			half3 Subsurface_Color1722_g22924 = lerpResult1698_g22924;
			float lerpResult1779_g22924 = lerp( 1.0 , Global_ColorsTex_A1701_g22924 , Global_HealthinessValue1780_g22924);
			half Autoregister_SubsurfaceSpace2238_g22924 = _SubsurfaceCat;
			half Subsurface_Intensity1752_g22924 = ( ( _SubsurfaceValue * lerpResult1779_g22924 ) + Autoregister_SubsurfaceSpace2238_g22924 );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			half Overlay_Mask_Subsurface1492_g22924 = saturate( ( saturate( ase_worldNormal.y ) - ( 1.0 - Overlay_Commons1365_g22924 ) ) );
			half3 Subsurface_Transmission884_g22924 = ( Subsurface_Color1722_g22924 * Subsurface_Intensity1752_g22924 * Subsurface_Mask1557_g22924 * ( 1.0 - Overlay_Mask_Subsurface1492_g22924 ) );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 normalizeResult1983_g22924 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float dotResult785_g22924 = dot( -ase_worldlightDir , normalizeResult1983_g22924 );
			float saferPower1624_g22924 = max( (dotResult785_g22924*0.5 + 0.5) , 0.0001 );
			#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g22924 = 0.0;
			#else
				float staticSwitch1602_g22924 = ( pow( saferPower1624_g22924 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
			#endif
			half Mask_Subsurface_View782_g22924 = staticSwitch1602_g22924;
			float3 temp_output_13_0_g23081 = Main_Normal137_g22924;
			float3 switchResult12_g23081 = (((i.ASEVFace>0)?(temp_output_13_0_g23081):(( temp_output_13_0_g23081 * _render_normals_options ))));
			float dotResult777_g22924 = dot( normalize( (WorldNormalVector( i , switchResult12_g23081 )) ) , ase_worldlightDir );
			#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1604_g22924 = 0.0;
			#else
				float staticSwitch1604_g22924 = max( -dotResult777_g22924 , 0.0 );
			#endif
			half Mask_Subsurface_Normal870_g22924 = staticSwitch1604_g22924;
			half3 Subsurface_Deferred1693_g22924 = ( Subsurface_Transmission884_g22924 * ( Mask_Subsurface_View782_g22924 + Mask_Subsurface_Normal870_g22924 ) );
			half3 Blend_AlbedoAndSubsurface149_g22924 = ( Blend_Albedo265_g22924 + Subsurface_Deferred1693_g22924 );
			half3 Global_OverlayColor1758_g22924 = (TVE_OverlayColor).rgb;
			half3 Global_OverlayAlbedo277_g22924 = (SAMPLE_TEXTURE2D( TVE_OverlayAlbedoTex, samplerTVE_OverlayAlbedoTex, temp_output_38_0_g23102 )).rgb;
			float3 lerpResult336_g22924 = lerp( Blend_AlbedoAndSubsurface149_g22924 , ( Global_OverlayColor1758_g22924 * Global_OverlayAlbedo277_g22924 ) , Overlay_Mask269_g22924);
			half3 Final_Albedo359_g22924 = lerpResult336_g22924;
			half Main_Alpha316_g22924 = (temp_output_51_0_g22924).a;
			float lerpResult354_g22924 = lerp( 1.0 , Main_Alpha316_g22924 , _render_premul);
			half Final_Premultiply355_g22924 = lerpResult354_g22924;
			o.Albedo = ( Final_Albedo359_g22924 * Final_Premultiply355_g22924 );
			half Main_Smoothness227_g22924 = ( tex2DNode35_g22924.a * _MainSmoothnessValue );
			half Blend_Smoothness314_g22924 = Main_Smoothness227_g22924;
			half Global_OverlaySmoothness311_g22924 = TVE_OverlaySmoothness;
			float lerpResult343_g22924 = lerp( Blend_Smoothness314_g22924 , Global_OverlaySmoothness311_g22924 , Overlay_Mask269_g22924);
			half Final_Smoothness371_g22924 = lerpResult343_g22924;
			half Global_Wetness1016_g22924 = ( TVE_Wetness * _GlobalWetness );
			half Global_ExtrasTex_A1033_g22924 = tex2DNode7_g23128.a;
			float lerpResult1037_g22924 = lerp( Final_Smoothness371_g22924 , saturate( ( Final_Smoothness371_g22924 + Global_Wetness1016_g22924 ) ) , Global_ExtrasTex_A1033_g22924);
			o.Smoothness = lerpResult1037_g22924;
			half Mesh_Occlusion318_g22924 = i.vertexColor.g;
			float saferPower1201_g22924 = max( Mesh_Occlusion318_g22924 , 0.0001 );
			half Vertex_Occlusion648_g22924 = pow( saferPower1201_g22924 , _ObjectOcclusionValue );
			float lerpResult240_g22924 = lerp( 1.0 , tex2DNode35_g22924.g , _MainOcclusionValue);
			half Main_Occlusion247_g22924 = lerpResult240_g22924;
			half Blend_Occlusion323_g22924 = Main_Occlusion247_g22924;
			o.Occlusion = ( Vertex_Occlusion648_g22924 * Blend_Occlusion323_g22924 );
			o.Alpha = Main_Alpha316_g22924;
			half Main_AlphaRaw1203_g22924 = tex2DNode29_g22924.a;
			float lerpResult2262_g22924 = lerp( 0.9 , Mesh_Variation16_g22924 , _LeavesVariationValue);
			half Global_ExtrasTex_R174_g22924 = tex2DNode7_g23128.r;
			float lerpResult2624_g22924 = lerp( 1.0 , Global_ExtrasTex_R174_g22924 , _GlobalLeaves);
			half AlphaTreshold2132_g22924 = _Cutoff;
			half Mask_Leaves315_g22924 = ( ( (lerpResult2262_g22924*0.5 + 0.5) - ( 1.0 - ( lerpResult2624_g22924 * _LocalLeaves ) ) ) + AlphaTreshold2132_g22924 );
			half Alpha5_g23106 = ( Main_AlphaRaw1203_g22924 * Mask_Leaves315_g22924 );
			#ifdef _ALPHATEST_ON
				float staticSwitch2_g23106 = Alpha5_g23106;
			#else
				float staticSwitch2_g23106 = 1.0;
			#endif
			half Final_Clip914_g22924 = staticSwitch2_g23106;
			clip( Final_Clip914_g22924 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=18500
1927;1;1906;1020;2473.632;1061.882;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;7;-1534,-768;Half;False;Property;_render_dst;_render_dst;181;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;182;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Leaf Standard Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-768;Half;False;Property;_Cutoff;_Cutoff;178;1;[HideInInspector];Fetch;True;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-768;Half;False;Property;_render_cull;_render_cull;179;0;Fetch;True;3;Both;0;Back;1;Front;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1727,-767;Half;False;Property;_render_src;_render_src;180;0;Fetch;True;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;609;-1376,-896;Half;False;Property;_IsAnyPathShader;_IsAnyPathShader;176;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;606;-2176,256;Inherit;False;Feature Batching Support;172;;23187;d914b3a554b05ab4da8c1d2a8ce94c0a;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;608;-2176,-384;Inherit;False;Base Shader;1;;22924;856f7164d1c579d43a5cf4968a75ca43;51,1271,2,1300,1,1298,1,1962,1,1708,1,1712,3,1964,1,1969,1,1723,1,1719,1,893,1,1745,1,1742,1,1715,1,1714,1,1717,1,1728,1,1718,1,916,1,1732,1,1949,1,1763,1,1762,1,1776,1,1646,1,1690,1,1757,1,1669,1,1981,1,1759,1,2172,0,1733,0,1734,0,1736,0,1968,0,1735,0,1737,0,1966,0,1550,0,878,0,860,1,2261,1,2260,1,2032,1,2054,1,2057,1,2033,1,2036,1,2060,1,2062,1,2039,1;0;16;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534;FLOAT3;2075
Node;AmplifyShaderEditor.RangedFloatNode;271;-1552,-896;Half;False;Property;_IsLitShader;_IsLitShader;177;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-1792,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;175;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;168;-1984,-896;Half;False;Property;_IsLeafShader;_IsLeafShader;174;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;0;Standard;BOXOPHOBIC/The Vegetation Engine/Vegetation/Leaf Standard Lit;False;False;False;False;False;True;False;True;False;False;False;False;True;True;True;False;True;False;False;False;True;Back;0;True;17;0;False;-1;False;0;False;-1;-1;False;-1;False;0;Custom;0.5;True;True;0;True;Opaque;;Geometry;All;11;d3d11;glcore;gles3;metal;vulkan;xbox360;xboxone;ps4;psp2;n3ds;wiiu;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;1;0;True;20;0;True;7;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Absolute;0;;-1;-1;-1;-1;0;False;0;0;True;10;-1;0;True;21;0;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1024.392;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;408;-2176,128;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
WireConnection;0;0;608;0
WireConnection;0;1;608;528
WireConnection;0;4;608;530
WireConnection;0;5;608;531
WireConnection;0;9;608;532
WireConnection;0;10;608;653
WireConnection;0;11;608;534
ASEEND*/
//CHKSM=2BFE60B2EA0D3D591D62B7AC850C866B840327E9
