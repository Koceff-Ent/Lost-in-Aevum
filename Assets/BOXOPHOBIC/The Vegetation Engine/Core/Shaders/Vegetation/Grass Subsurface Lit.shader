// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Vegetation/Grass Subsurface Lit"
{
	Properties
	{
		[StyledBanner(Grass Subsurface Lit)]_Banner("Banner", Float) = 0
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
		[StyledCategory(Grass Settings)]_GrassCat("[ Grass Cat ]", Float) = 0
		_GrassPerspectivePushValue("Grass Perspective Push", Range( 0 , 4)) = 0
		_GrassPerspectiveNoiseValue("Grass Perspective Noise", Range( 0 , 4)) = 0
		_GrassPerspectiveAngleValue("Grass Perspective Angle", Range( 0 , 8)) = 1
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
		_OverlayContrast("Overlay Contrast", Range( 0 , 10)) = 4
		_OverlayVariation("Overlay Variation", Range( 0 , 1)) = 0
		_LeavesVariationValue("Leaves Variation", Range( 0 , 1)) = 0
		[StyledCategory(Motion Settings)]_MotionCat("[ Motion Cat ]", Float) = 0
		_Motion_10("Motion Bending", Range( 0 , 1)) = 1
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
		[HideInInspector] _tex4coord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector]_MotionVariation_32("Flutter Variation", Float) = 30
		[HideInInspector]_InteractionAmplitude("Interaction Bending", Float) = 0
		[StyledCategory(Advanced)]_AdvancedCat("[ Advanced Cat]", Float) = 0
		[StyledMessage(Warning, When batching support is enabled the object position is lost and some features will not work as expected. Check the documentation for more information., _material_batching, 1 , 0,5)]_BatchingMessage("# Batching Message", Float) = 0
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
		[Toggle]_material_pivots("Enable Baked Pivots Support", Float) = 0
		[HideInInspector]_IsGrassShader("_IsGrassShader", Float) = 1
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsForwardPathShader("_IsForwardPathShader", Float) = 1
		[HideInInspector]_IsLitShader("_IsLitShader", Float) = 1
		[HideInInspector]_Cutoff("_Cutoff", Float) = 0.5
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" "DisableBatching" = "True" }
		Cull [_render_cull]
		ZWrite [_render_zw]
		Offset  0 , -1
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
		#define MATERIAL_USE_PIVOT_DATA
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
			float4 uv_tex4coord;
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

		uniform half _render_clip;
		uniform half _MainCat;
		uniform half _IsTVEShader;
		uniform half _MainColorMode;
		uniform half _render_src;
		uniform half _render_blend;
		uniform half _VertexOcclusion;
		uniform half _AdvancedCat;
		uniform half _PivotsMessage;
		uniform half _render_priority;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform half _GlobalCat;
		uniform half _IsVersion;
		uniform float4 _Color;
		uniform float4 _SubsurfaceDiffusion_asset;
		uniform half _render_zw;
		uniform half _render_mode;
		uniform float _SubsurfaceMode;
		uniform half _MiscCat;
		uniform half _RenderingCat;
		uniform half _ObjectThicknessValue;
		uniform half _MiscSpace;
		uniform half _BatchingMessage;
		uniform half _MainMaskValue;
		uniform float _MotionScale_20;
		uniform half _MotionAmplitude_30;
		uniform half _render_dst;
		uniform half _render_cull;
		uniform half _MotionAmplitude_20;
		uniform float _MotionSpeed_20;
		uniform float _MotionScale_30;
		uniform half _MotionVariation_20;
		uniform half _render_normals;
		uniform float _MotionVariation_30;
		uniform half _MotionVertical_20;
		uniform float _MotionSpeed_30;
		uniform half _IsGrassShader;
		uniform half _material_batching;
		uniform half _IsForwardPathShader;
		uniform half _IsStandardShader;
		uniform half _Banner;
		uniform half _IsLitShader;
		uniform half _material_pivots;
		uniform half _VertexPivotMode;
		uniform half _MotionAmplitude_10;
		uniform float4 _MaxBoundsInfo;
		uniform half TVE_MotionAmplitude_10;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_NoiseTex);
		uniform half TVE_NoiseSpeed;
		uniform half TVE_NoiseSize;
		SamplerState samplerTVE_NoiseTex;
		uniform half TVE_NoiseContrast;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_MotionTex);
		uniform half4 TVE_VolumeCoord;
		SamplerState samplerTVE_MotionTex;
		uniform half _Motion_10;
		uniform half _MotionCat;
		uniform float _MotionSpeed_10;
		uniform half _MotionVariation_10;
		uniform float _MotionScale_10;
		uniform half _InteractionAmplitude;
		uniform half _Motion_Interaction;
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
		uniform half _GrassPerspectivePushValue;
		uniform half _GrassCat;
		uniform half _GrassPerspectiveNoiseValue;
		uniform half _GrassPerspectiveAngleValue;
		uniform half _IsStandardPipeline;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
		SamplerState sampler_MainNormalTex;
		uniform half4 _MainUVs;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
		SamplerState sampler_MainAlbedoTex;
		uniform half _MainNormalValue;
		uniform half3 _render_normals_options;
		uniform half4 _MainColor;
		uniform float4 _LocalColors;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_ColorsTex);
		SamplerState samplerTVE_ColorsTex;
		uniform half _GlobalColors;
		uniform half _ColorsMaskValue;
		uniform half4 _SubsurfaceColor;
		uniform half _GlobalHealthiness;
		uniform half _SubsurfaceValue;
		uniform half _SubsurfaceCat;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
		SamplerState sampler_MainMaskTex;
		uniform half _SubsurfaceMinValue;
		uniform half _SubsurfaceMaxValue;
		uniform half _SubsurfaceAngleValue;
		uniform half _SubsurfaceViewValue;
		uniform half4 TVE_OverlayColor;
		uniform half _OverlayContrast;
		uniform half TVE_OverlayIntensity;
		uniform half _GlobalOverlay;
		uniform half _OverlayVariation;
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
			half3 Off19_g28685 = half3(0,0,0);
			float3 appendResult60_g28665 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			half3 On20_g28685 = ( appendResult60_g28665 * _VertexPivotMode );
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g28685 = On20_g28685;
			#else
				float3 staticSwitch14_g28685 = Off19_g28685;
			#endif
			half3 ObjectData20_g28686 = staticSwitch14_g28685;
			half3 WorldData19_g28686 = Off19_g28685;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28686 = WorldData19_g28686;
			#else
				float3 staticSwitch14_g28686 = ObjectData20_g28686;
			#endif
			float3 Mesh_PivotsOS2291_g28594 = staticSwitch14_g28686;
			float3 temp_output_2283_0_g28594 = ( ase_vertex3Pos - Mesh_PivotsOS2291_g28594 );
			half3 VertexPos40_g28664 = temp_output_2283_0_g28594;
			float3 appendResult74_g28664 = (float3(VertexPos40_g28664.x , 0.0 , 0.0));
			half3 VertexPosRotationAxis50_g28664 = appendResult74_g28664;
			float3 break84_g28664 = VertexPos40_g28664;
			float3 appendResult81_g28664 = (float3(0.0 , break84_g28664.y , break84_g28664.z));
			half3 VertexPosOtherAxis82_g28664 = appendResult81_g28664;
			float ObjectData20_g28682 = 3.14;
			float Bounds_Height374_g28594 = _MaxBoundsInfo.y;
			float WorldData19_g28682 = ( Bounds_Height374_g28594 * 3.14 );
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g28682 = WorldData19_g28682;
			#else
				float staticSwitch14_g28682 = ObjectData20_g28682;
			#endif
			float Motion_Max_Bending1133_g28594 = staticSwitch14_g28682;
			float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
			float4x4 break19_g28655 = unity_ObjectToWorld;
			float3 appendResult20_g28655 = (float3(break19_g28655[ 0 ][ 3 ] , break19_g28655[ 1 ][ 3 ] , break19_g28655[ 2 ][ 3 ]));
			half3 Off19_g28657 = appendResult20_g28655;
			float4 ase_vertex4Pos = v.vertex;
			float4 transform68_g28655 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g28656 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g28655 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g28656 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g28655 = ( (transform68_g28655).xyz - (transform62_g28655).xyz );
			half3 On20_g28657 = ObjectPositionWithPivots28_g28655;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g28657 = On20_g28657;
			#else
				float3 staticSwitch14_g28657 = Off19_g28657;
			#endif
			half3 ObjectData20_g28658 = staticSwitch14_g28657;
			half3 WorldData19_g28658 = Off19_g28657;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28658 = WorldData19_g28658;
			#else
				float3 staticSwitch14_g28658 = ObjectData20_g28658;
			#endif
			float3 temp_output_42_0_g28655 = staticSwitch14_g28658;
			half3 ObjectData20_g28661 = temp_output_42_0_g28655;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			half3 WorldData19_g28661 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28661 = WorldData19_g28661;
			#else
				float3 staticSwitch14_g28661 = ObjectData20_g28661;
			#endif
			float2 panner73_g28654 = ( _Time.y * temp_cast_0 + ( (staticSwitch14_g28661).xz * TVE_NoiseSize ));
			float4 temp_cast_2 = (TVE_NoiseContrast).xxxx;
			float4 break142_g28654 = pow( abs( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g28654, 0.0 ) ) , temp_cast_2 );
			half Global_NoiseTex_R34_g28594 = break142_g28654.r;
			float4x4 break19_g28624 = unity_ObjectToWorld;
			float3 appendResult20_g28624 = (float3(break19_g28624[ 0 ][ 3 ] , break19_g28624[ 1 ][ 3 ] , break19_g28624[ 2 ][ 3 ]));
			half3 Off19_g28626 = appendResult20_g28624;
			float4 transform68_g28624 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g28625 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g28624 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g28625 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g28624 = ( (transform68_g28624).xyz - (transform62_g28624).xyz );
			half3 On20_g28626 = ObjectPositionWithPivots28_g28624;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g28626 = On20_g28626;
			#else
				float3 staticSwitch14_g28626 = Off19_g28626;
			#endif
			half3 ObjectData20_g28627 = staticSwitch14_g28626;
			half3 WorldData19_g28627 = Off19_g28626;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28627 = WorldData19_g28627;
			#else
				float3 staticSwitch14_g28627 = ObjectData20_g28627;
			#endif
			float3 temp_output_42_0_g28624 = staticSwitch14_g28627;
			half3 ObjectData20_g28622 = temp_output_42_0_g28624;
			half3 WorldData19_g28622 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28622 = WorldData19_g28622;
			#else
				float3 staticSwitch14_g28622 = ObjectData20_g28622;
			#endif
			float4 break322_g28679 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g28622).xz ) ), 0.0 );
			float3 appendResult323_g28679 = (float3(break322_g28679.x , 0.0 , break322_g28679.y));
			float3 temp_output_324_0_g28679 = (appendResult323_g28679*2.0 + -1.0);
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			half3 ObjectData20_g28680 = ( mul( unity_WorldToObject, float4( temp_output_324_0_g28679 , 0.0 ) ).xyz * ase_parentObjectScale );
			half3 WorldData19_g28680 = temp_output_324_0_g28679;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28680 = WorldData19_g28680;
			#else
				float3 staticSwitch14_g28680 = ObjectData20_g28680;
			#endif
			half2 Motion_DirectionOS39_g28594 = (staticSwitch14_g28680).xz;
			half Motion_Power2223_g28594 = break322_g28679.z;
			half Motion_Use1056_g28594 = ( _Motion_10 + _MotionCat );
			half Input_Speed62_g28613 = _MotionSpeed_10;
			float mulTime373_g28613 = _Time.y * Input_Speed62_g28613;
			float temp_output_349_0_g28613 = ( _MotionVariation_10 * v.color.r );
			float4x4 break19_g28614 = unity_ObjectToWorld;
			float3 appendResult20_g28614 = (float3(break19_g28614[ 0 ][ 3 ] , break19_g28614[ 1 ][ 3 ] , break19_g28614[ 2 ][ 3 ]));
			half3 Off19_g28616 = appendResult20_g28614;
			float4 transform68_g28614 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g28615 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g28614 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g28615 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g28614 = ( (transform68_g28614).xyz - (transform62_g28614).xyz );
			half3 On20_g28616 = ObjectPositionWithPivots28_g28614;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g28616 = On20_g28616;
			#else
				float3 staticSwitch14_g28616 = Off19_g28616;
			#endif
			half3 ObjectData20_g28617 = staticSwitch14_g28616;
			half3 WorldData19_g28617 = Off19_g28616;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28617 = WorldData19_g28617;
			#else
				float3 staticSwitch14_g28617 = ObjectData20_g28617;
			#endif
			float3 temp_output_42_0_g28614 = staticSwitch14_g28617;
			float3 break9_g28614 = temp_output_42_0_g28614;
			float ObjectData20_g28620 = ( temp_output_349_0_g28613 + ( break9_g28614.x + break9_g28614.z ) );
			float WorldData19_g28620 = temp_output_349_0_g28613;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g28620 = WorldData19_g28620;
			#else
				float staticSwitch14_g28620 = ObjectData20_g28620;
			#endif
			half Motion_Variation284_g28613 = staticSwitch14_g28620;
			float2 appendResult344_g28613 = (float2(ase_worldPos.x , ase_worldPos.z));
			float2 Motion_Scale287_g28613 = ( _MotionScale_10 * appendResult344_g28613 );
			half2 Sine_MinusOneToOne281_g28613 = sin( ( mulTime373_g28613 + Motion_Variation284_g28613 + Motion_Scale287_g28613 ) );
			float2 temp_cast_8 = (1.0).xx;
			half Input_Turbulence327_g28613 = Global_NoiseTex_R34_g28594;
			float2 lerpResult321_g28613 = lerp( Sine_MinusOneToOne281_g28613 , temp_cast_8 , Input_Turbulence327_g28613);
			half2 Motion_Bending2258_g28594 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g28594 ) * TVE_MotionAmplitude_10 * Global_NoiseTex_R34_g28594 * Motion_DirectionOS39_g28594 * Motion_Power2223_g28594 * Motion_Use1056_g28594 * lerpResult321_g28613 );
			half Motion_UseInteraction2097_g28594 = _Motion_Interaction;
			half Motion_InteractionMask66_g28594 = break322_g28679.w;
			half2 Motion_Interaction53_g28594 = ( _InteractionAmplitude * Motion_Max_Bending1133_g28594 * Motion_UseInteraction2097_g28594 * Motion_InteractionMask66_g28594 * Motion_InteractionMask66_g28594 * Motion_DirectionOS39_g28594 );
			float2 lerpResult109_g28594 = lerp( Motion_Bending2258_g28594 , Motion_Interaction53_g28594 , Motion_InteractionMask66_g28594);
			half Mesh_Motion_182_g28594 = v.texcoord3.x;
			float2 break143_g28594 = ( lerpResult109_g28594 * Mesh_Motion_182_g28594 );
			half Motion_Z190_g28594 = break143_g28594.y;
			half Angle44_g28664 = Motion_Z190_g28594;
			half3 VertexPos40_g28684 = ( VertexPosRotationAxis50_g28664 + ( VertexPosOtherAxis82_g28664 * cos( Angle44_g28664 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g28664 ) * sin( Angle44_g28664 ) ) );
			float3 appendResult74_g28684 = (float3(0.0 , 0.0 , VertexPos40_g28684.z));
			half3 VertexPosRotationAxis50_g28684 = appendResult74_g28684;
			float3 break84_g28684 = VertexPos40_g28684;
			float3 appendResult81_g28684 = (float3(break84_g28684.x , break84_g28684.y , 0.0));
			half3 VertexPosOtherAxis82_g28684 = appendResult81_g28684;
			half Motion_X216_g28594 = break143_g28594.x;
			half Angle44_g28684 = -Motion_X216_g28594;
			half Motion_Scale321_g28687 = ( _MotionScale_32 * 10.0 );
			half Input_Speed62_g28687 = _MotionSpeed_32;
			float mulTime349_g28687 = _Time.y * Input_Speed62_g28687;
			float Motion_Variation330_g28687 = ( _MotionVariation_32 * v.color.r );
			float Bounds_Radius121_g28594 = _MaxBoundsInfo.x;
			half Input_Amplitude58_g28687 = ( _MotionAmplitude_32 * Bounds_Radius121_g28594 * 0.2 );
			float3 appendResult345_g28687 = (float3(v.color.r , ( 1.0 - v.color.r ) , v.color.r));
			half Global_NoiseTex_A139_g28594 = break142_g28654.a;
			half Mesh_Motion_3144_g28594 = v.texcoord3.z;
			half Motion_Use322013_g28594 = _Motion_32;
			half3 Motion_Flutter263_g28594 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g28687 ) + mulTime349_g28687 + Motion_Variation330_g28687 ) ) * Input_Amplitude58_g28687 * appendResult345_g28687 ) * ( Global_NoiseTex_R34_g28594 + Global_NoiseTex_A139_g28594 ) * Mesh_Motion_3144_g28594 * Motion_Use322013_g28594 * TVE_MotionAmplitude_32 * Motion_Power2223_g28594 );
			float3 Vertex_Motion_Object833_g28594 = ( ( VertexPosRotationAxis50_g28684 + ( VertexPosOtherAxis82_g28684 * cos( Angle44_g28684 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g28684 ) * sin( Angle44_g28684 ) ) ) + Motion_Flutter263_g28594 );
			half3 ObjectData20_g28595 = Vertex_Motion_Object833_g28594;
			float3 appendResult2043_g28594 = (float3(Motion_X216_g28594 , 0.0 , Motion_Z190_g28594));
			float3 Vertex_Motion_World1118_g28594 = ( ( ase_vertex3Pos + mul( unity_WorldToObject, float4( appendResult2043_g28594 , 0.0 ) ).xyz ) + Motion_Flutter263_g28594 );
			half3 WorldData19_g28595 = Vertex_Motion_World1118_g28594;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28595 = WorldData19_g28595;
			#else
				float3 staticSwitch14_g28595 = ObjectData20_g28595;
			#endif
			float4x4 break19_g28639 = unity_ObjectToWorld;
			float3 appendResult20_g28639 = (float3(break19_g28639[ 0 ][ 3 ] , break19_g28639[ 1 ][ 3 ] , break19_g28639[ 2 ][ 3 ]));
			half3 Off19_g28641 = appendResult20_g28639;
			float4 transform68_g28639 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g28640 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g28639 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g28640 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g28639 = ( (transform68_g28639).xyz - (transform62_g28639).xyz );
			half3 On20_g28641 = ObjectPositionWithPivots28_g28639;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g28641 = On20_g28641;
			#else
				float3 staticSwitch14_g28641 = Off19_g28641;
			#endif
			half3 ObjectData20_g28642 = staticSwitch14_g28641;
			half3 WorldData19_g28642 = Off19_g28641;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28642 = WorldData19_g28642;
			#else
				float3 staticSwitch14_g28642 = ObjectData20_g28642;
			#endif
			float3 temp_output_42_0_g28639 = staticSwitch14_g28642;
			float temp_output_7_0_g28663 = TVE_SizeFadeEnd;
			float ObjectData20_g28607 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g28639 ) * _GlobalSizeFade ) - temp_output_7_0_g28663 ) / ( TVE_SizeFadeStart - temp_output_7_0_g28663 ) ) );
			float WorldData19_g28607 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g28607 = WorldData19_g28607;
			#else
				float staticSwitch14_g28607 = ObjectData20_g28607;
			#endif
			float Vertex_SizeFade1740_g28594 = staticSwitch14_g28607;
			float4x4 break19_g28599 = unity_ObjectToWorld;
			float3 appendResult20_g28599 = (float3(break19_g28599[ 0 ][ 3 ] , break19_g28599[ 1 ][ 3 ] , break19_g28599[ 2 ][ 3 ]));
			half3 Off19_g28601 = appendResult20_g28599;
			float4 transform68_g28599 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g28600 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g28599 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g28600 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g28599 = ( (transform68_g28599).xyz - (transform62_g28599).xyz );
			half3 On20_g28601 = ObjectPositionWithPivots28_g28599;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g28601 = On20_g28601;
			#else
				float3 staticSwitch14_g28601 = Off19_g28601;
			#endif
			half3 ObjectData20_g28602 = staticSwitch14_g28601;
			half3 WorldData19_g28602 = Off19_g28601;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28602 = WorldData19_g28602;
			#else
				float3 staticSwitch14_g28602 = ObjectData20_g28602;
			#endif
			float3 temp_output_42_0_g28599 = staticSwitch14_g28602;
			half3 ObjectData20_g28605 = temp_output_42_0_g28599;
			half3 WorldData19_g28605 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28605 = WorldData19_g28605;
			#else
				float3 staticSwitch14_g28605 = ObjectData20_g28605;
			#endif
			float4 tex2DNode7_g28598 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g28605).xz ) ), 0.0 );
			half Global_ExtrasTex_G305_g28594 = tex2DNode7_g28598.g;
			float lerpResult346_g28594 = lerp( 1.0 , Global_ExtrasTex_G305_g28594 , _GlobalSize);
			float ObjectData20_g28610 = ( lerpResult346_g28594 * _LocalSize );
			float WorldData19_g28610 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g28610 = WorldData19_g28610;
			#else
				float staticSwitch14_g28610 = ObjectData20_g28610;
			#endif
			half Vertex_Size1741_g28594 = staticSwitch14_g28610;
			float3 normalizeResult2696_g28594 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float3 break2709_g28594 = cross( normalizeResult2696_g28594 , half3(0,1,0) );
			float3 appendResult2710_g28594 = (float3(-break2709_g28594.z , 0.0 , break2709_g28594.x));
			float3 appendResult2667_g28594 = (float3(frac( ase_worldPos.x ) , 0.5 , frac( ase_worldPos.z )));
			float3 normalizeResult2210_g28594 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float dotResult2212_g28594 = dot( normalizeResult2210_g28594 , float3(0,1,0) );
			half Mask_HView2656_g28594 = abs( dotResult2212_g28594 );
			float saferPower2652_g28594 = max( Mask_HView2656_g28594 , 0.0001 );
			half3 Grass_Coverage2661_g28594 = ( ( ( mul( unity_WorldToObject, float4( appendResult2710_g28594 , 0.0 ) ).xyz * ( _GrassPerspectivePushValue + _GrassCat ) ) + ( (appendResult2667_g28594*2.0 + -1.0) * _GrassPerspectiveNoiseValue ) ) * v.color.a * pow( saferPower2652_g28594 , _GrassPerspectiveAngleValue ) );
			float3 Final_VertexPosition890_g28594 = ( ( ( staticSwitch14_g28595 * Vertex_SizeFade1740_g28594 * Vertex_Size1741_g28594 ) + Mesh_PivotsOS2291_g28594 + Grass_Coverage2661_g28594 ) + ( _IsStandardPipeline * 0.0 ) );
			v.vertex.xyz = Final_VertexPosition890_g28594;
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
			half2 Main_UVs15_g28594 = ( ( i.uv_texcoord * (_MainUVs).xy ) + (_MainUVs).zw );
			float4 tex2DNode117_g28594 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g28594 );
			float2 appendResult88_g28612 = (float2(tex2DNode117_g28594.a , tex2DNode117_g28594.g));
			float2 temp_output_90_0_g28612 = ( (appendResult88_g28612*2.0 + -1.0) * _MainNormalValue );
			float3 appendResult91_g28612 = (float3(temp_output_90_0_g28612 , 1.0));
			float3 Main_Normal137_g28594 = appendResult91_g28612;
			float3 temp_output_13_0_g28597 = Main_Normal137_g28594;
			float3 switchResult12_g28597 = (((i.ASEVFace>0)?(temp_output_13_0_g28597):(( temp_output_13_0_g28597 * _render_normals_options ))));
			half3 Blend_Normal312_g28594 = switchResult12_g28597;
			half3 Final_Normal366_g28594 = Blend_Normal312_g28594;
			o.Normal = Final_Normal366_g28594;
			float4 tex2DNode29_g28594 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g28594 );
			float4 temp_output_51_0_g28594 = ( _MainColor * tex2DNode29_g28594 );
			half3 Main_AlbedoRaw99_g28594 = (temp_output_51_0_g28594).rgb;
			float4x4 break19_g28668 = unity_ObjectToWorld;
			float3 appendResult20_g28668 = (float3(break19_g28668[ 0 ][ 3 ] , break19_g28668[ 1 ][ 3 ] , break19_g28668[ 2 ][ 3 ]));
			half3 Off19_g28670 = appendResult20_g28668;
			float4 ase_vertex4Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 transform68_g28668 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 appendResult60_g28669 = (float3(i.uv_tex4coord.z , 0.0 , i.uv_tex4coord.w));
			float4 transform62_g28668 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g28669 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g28668 = ( (transform68_g28668).xyz - (transform62_g28668).xyz );
			half3 On20_g28670 = ObjectPositionWithPivots28_g28668;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g28670 = On20_g28670;
			#else
				float3 staticSwitch14_g28670 = Off19_g28670;
			#endif
			half3 ObjectData20_g28671 = staticSwitch14_g28670;
			half3 WorldData19_g28671 = Off19_g28670;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28671 = WorldData19_g28671;
			#else
				float3 staticSwitch14_g28671 = ObjectData20_g28671;
			#endif
			float3 temp_output_42_0_g28668 = staticSwitch14_g28671;
			half3 ObjectData20_g28667 = temp_output_42_0_g28668;
			float3 ase_worldPos = i.worldPos;
			half3 WorldData19_g28667 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28667 = WorldData19_g28667;
			#else
				float3 staticSwitch14_g28667 = ObjectData20_g28667;
			#endif
			float4 tex2DNode7_g28666 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g28667).xz ) ) );
			half3 Global_ColorsTex_RGB1700_g28594 = (tex2DNode7_g28666).rgb;
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g28611 = 2.0;
			#else
				float staticSwitch1_g28611 = 4.594794;
			#endif
			float lerpResult2103_g28594 = lerp( 1.0 , ( 1.0 - i.vertexColor.a ) , _ColorsMaskValue);
			float3 lerpResult108_g28594 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g28594 * staticSwitch1_g28611 ) ) , ( _GlobalColors * lerpResult2103_g28594 ));
			half3 Global_Colors1954_g28594 = lerpResult108_g28594;
			float3 temp_output_123_0_g28594 = ( Main_AlbedoRaw99_g28594 * Global_Colors1954_g28594 );
			half3 Main_AlbedoColored863_g28594 = temp_output_123_0_g28594;
			half3 Blend_Albedo265_g28594 = Main_AlbedoColored863_g28594;
			float3 temp_cast_1 = (0.5).xxx;
			float3 temp_output_799_0_g28594 = (_SubsurfaceColor).rgb;
			half Global_ColorsTex_A1701_g28594 = tex2DNode7_g28666.a;
			half Global_HealthinessValue1780_g28594 = _GlobalHealthiness;
			float lerpResult1720_g28594 = lerp( 1.0 , Global_ColorsTex_A1701_g28594 , Global_HealthinessValue1780_g28594);
			float3 lerpResult1698_g28594 = lerp( temp_cast_1 , temp_output_799_0_g28594 , lerpResult1720_g28594);
			half3 Subsurface_Color1722_g28594 = lerpResult1698_g28594;
			float lerpResult1779_g28594 = lerp( 1.0 , Global_ColorsTex_A1701_g28594 , Global_HealthinessValue1780_g28594);
			half Autoregister_SubsurfaceSpace2238_g28594 = _SubsurfaceCat;
			half Subsurface_Intensity1752_g28594 = ( ( _SubsurfaceValue * lerpResult1779_g28594 ) + Autoregister_SubsurfaceSpace2238_g28594 );
			float4 tex2DNode35_g28594 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g28594 );
			half Main_Mask57_g28594 = tex2DNode35_g28594.b;
			float temp_output_7_0_g28694 = _SubsurfaceMinValue;
			half Subsurface_Mask1557_g28594 = saturate( ( ( Main_Mask57_g28594 - temp_output_7_0_g28694 ) / ( _SubsurfaceMaxValue - temp_output_7_0_g28694 ) ) );
			half Overlay_Mask_Subsurface1492_g28594 = 0.0;
			half3 Subsurface_Transmission884_g28594 = ( Subsurface_Color1722_g28594 * Subsurface_Intensity1752_g28594 * Subsurface_Mask1557_g28594 * ( 1.0 - Overlay_Mask_Subsurface1492_g28594 ) );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 normalizeResult1983_g28594 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float dotResult785_g28594 = dot( -ase_worldlightDir , normalizeResult1983_g28594 );
			float saferPower1624_g28594 = max( (dotResult785_g28594*0.5 + 0.5) , 0.0001 );
			#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g28594 = 0.0;
			#else
				float staticSwitch1602_g28594 = ( pow( saferPower1624_g28594 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
			#endif
			half Mask_Subsurface_View782_g28594 = staticSwitch1602_g28594;
			half3 Subsurface_Forward1691_g28594 = ( Subsurface_Transmission884_g28594 * Mask_Subsurface_View782_g28594 );
			half3 Blend_AlbedoAndSubsurface149_g28594 = ( Blend_Albedo265_g28594 + Subsurface_Forward1691_g28594 );
			half3 Global_OverlayColor1758_g28594 = (TVE_OverlayColor).rgb;
			float2 break93_g28612 = temp_output_90_0_g28612;
			half Main_NormalY2095_g28594 = break93_g28612.y;
			half Overlay_Contrast1405_g28594 = _OverlayContrast;
			half Global_OverlayIntensity154_g28594 = TVE_OverlayIntensity;
			float4x4 break19_g28599 = unity_ObjectToWorld;
			float3 appendResult20_g28599 = (float3(break19_g28599[ 0 ][ 3 ] , break19_g28599[ 1 ][ 3 ] , break19_g28599[ 2 ][ 3 ]));
			half3 Off19_g28601 = appendResult20_g28599;
			float4 transform68_g28599 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g28600 = (float3(i.uv_tex4coord.z , 0.0 , i.uv_tex4coord.w));
			float4 transform62_g28599 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g28600 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g28599 = ( (transform68_g28599).xyz - (transform62_g28599).xyz );
			half3 On20_g28601 = ObjectPositionWithPivots28_g28599;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g28601 = On20_g28601;
			#else
				float3 staticSwitch14_g28601 = Off19_g28601;
			#endif
			half3 ObjectData20_g28602 = staticSwitch14_g28601;
			half3 WorldData19_g28602 = Off19_g28601;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28602 = WorldData19_g28602;
			#else
				float3 staticSwitch14_g28602 = ObjectData20_g28602;
			#endif
			float3 temp_output_42_0_g28599 = staticSwitch14_g28602;
			half3 ObjectData20_g28605 = temp_output_42_0_g28599;
			half3 WorldData19_g28605 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g28605 = WorldData19_g28605;
			#else
				float3 staticSwitch14_g28605 = ObjectData20_g28605;
			#endif
			float4 tex2DNode7_g28598 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g28605).xz ) ) );
			half Global_ExtrasTex_B156_g28594 = tex2DNode7_g28598.b;
			float temp_output_1025_0_g28594 = ( Global_OverlayIntensity154_g28594 * _GlobalOverlay * Global_ExtrasTex_B156_g28594 );
			float Mesh_Variation16_g28594 = i.vertexColor.r;
			float lerpResult1065_g28594 = lerp( 1.0 , Mesh_Variation16_g28594 , _OverlayVariation);
			half Overlay_Commons1365_g28594 = ( temp_output_1025_0_g28594 * lerpResult1065_g28594 );
			half Overlay_Mask269_g28594 = saturate( ( saturate( ( i.vertexColor.a + ( Main_NormalY2095_g28594 * Overlay_Contrast1405_g28594 ) ) ) - ( 1.0 - Overlay_Commons1365_g28594 ) ) );
			float3 lerpResult336_g28594 = lerp( Blend_AlbedoAndSubsurface149_g28594 , Global_OverlayColor1758_g28594 , Overlay_Mask269_g28594);
			half3 Final_Albedo359_g28594 = lerpResult336_g28594;
			half Main_Alpha316_g28594 = (temp_output_51_0_g28594).a;
			float lerpResult354_g28594 = lerp( 1.0 , Main_Alpha316_g28594 , _render_premul);
			half Final_Premultiply355_g28594 = lerpResult354_g28594;
			o.Albedo = ( Final_Albedo359_g28594 * Final_Premultiply355_g28594 );
			half Main_Smoothness227_g28594 = ( tex2DNode35_g28594.a * _MainSmoothnessValue );
			half Blend_Smoothness314_g28594 = Main_Smoothness227_g28594;
			half Global_OverlaySmoothness311_g28594 = TVE_OverlaySmoothness;
			float lerpResult343_g28594 = lerp( Blend_Smoothness314_g28594 , Global_OverlaySmoothness311_g28594 , Overlay_Mask269_g28594);
			half Final_Smoothness371_g28594 = lerpResult343_g28594;
			half Global_Wetness1016_g28594 = ( TVE_Wetness * _GlobalWetness );
			half Global_ExtrasTex_A1033_g28594 = tex2DNode7_g28598.a;
			float lerpResult1037_g28594 = lerp( Final_Smoothness371_g28594 , saturate( ( Final_Smoothness371_g28594 + Global_Wetness1016_g28594 ) ) , Global_ExtrasTex_A1033_g28594);
			o.Smoothness = lerpResult1037_g28594;
			half Mesh_Occlusion318_g28594 = i.vertexColor.g;
			float saferPower1201_g28594 = max( Mesh_Occlusion318_g28594 , 0.0001 );
			half Vertex_Occlusion648_g28594 = pow( saferPower1201_g28594 , _ObjectOcclusionValue );
			float lerpResult240_g28594 = lerp( 1.0 , tex2DNode35_g28594.g , _MainOcclusionValue);
			half Main_Occlusion247_g28594 = lerpResult240_g28594;
			half Blend_Occlusion323_g28594 = Main_Occlusion247_g28594;
			o.Occlusion = ( Vertex_Occlusion648_g28594 * Blend_Occlusion323_g28594 );
			o.Transmission = Subsurface_Transmission884_g28594;
			o.Alpha = Main_Alpha316_g28594;
			half Main_AlphaRaw1203_g28594 = tex2DNode29_g28594.a;
			float lerpResult2262_g28594 = lerp( 0.9 , Mesh_Variation16_g28594 , _LeavesVariationValue);
			half Global_ExtrasTex_R174_g28594 = tex2DNode7_g28598.r;
			float lerpResult2624_g28594 = lerp( 1.0 , Global_ExtrasTex_R174_g28594 , _GlobalLeaves);
			half AlphaTreshold2132_g28594 = _Cutoff;
			half Mask_Leaves315_g28594 = ( ( (lerpResult2262_g28594*0.5 + 0.5) - ( 1.0 - ( lerpResult2624_g28594 * _LocalLeaves ) ) ) + AlphaTreshold2132_g28594 );
			half Alpha5_g28692 = ( Main_AlphaRaw1203_g28594 * Mask_Leaves315_g28594 );
			#ifdef _ALPHATEST_ON
				float staticSwitch2_g28692 = Alpha5_g28692;
			#else
				float staticSwitch2_g28692 = 1.0;
			#endif
			half Final_Clip914_g28594 = staticSwitch2_g28692;
			clip( Final_Clip914_g28594 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=18500
1927;7;1906;1014;2821.752;846.3242;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;530;-1376,-896;Half;False;Property;_IsForwardPathShader;_IsForwardPathShader;183;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-1792,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;182;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Grass Subsurface Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;688;-562.7104,569.9701;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;168;-1984,-896;Half;False;Property;_IsGrassShader;_IsGrassShader;181;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;525;-2176,256;Inherit;False;Feature Batching Support;177;;28697;d914b3a554b05ab4da8c1d2a8ce94c0a;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;271;-1552,-896;Half;False;Property;_IsLitShader;_IsLitShader;184;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1536,-768;Half;False;Property;_render_dst;_render_dst;188;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1728,-768;Half;False;Property;_render_src;_render_src;187;0;Fetch;True;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;189;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;627;-1856,256;Inherit;False;Feature Pivots Support;179;;28698;8da5867b3f9f1834693af40d3eff73f4;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-768;Half;False;Property;_Cutoff;_Cutoff;185;1;[HideInInspector];Fetch;True;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-768;Half;False;Property;_render_cull;_render_cull;186;0;Fetch;True;3;Both;0;Back;1;Front;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;678;-2156.761,517.5479;Inherit;False;Get Raw ViewDirectionWS;-1;;28696;200b0133ee8f08043abf1202f7343ff5;0;0;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;685;-770.0435,543.6785;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;686;-1024.533,676.3763;Inherit;False;Property;_Float0;Float 0;176;0;Create;True;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldToObjectMatrix;692;-1159.651,388.848;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.Vector3Node;677;-2156.761,613.5479;Half;False;Constant;_Vector1;Vector 1;137;0;Create;True;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalizeNode;679;-1900.761,517.5479;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CrossProductOpNode;680;-1708.761,517.5479;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;682;-1510.959,515.9192;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;-936.0343,439.67;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;684;-1265.783,635.7697;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;689;-702.7104,750.9701;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;683;-1112.701,510.4878;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VertexColorNode;687;-1035.131,784.5498;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;704;-2176,-384;Inherit;False;Base Shader;1;;28594;856f7164d1c579d43a5cf4968a75ca43;52,1271,2,1300,1,1298,1,1962,1,1708,1,1712,1,1964,1,1969,1,1719,1,1723,1,893,1,1745,1,1742,1,1718,1,1717,1,1728,1,1715,1,1714,1,916,0,1732,0,1949,1,1763,0,1762,0,1776,1,1646,1,1690,0,1757,0,1669,1,1981,0,1759,0,2172,0,2658,1,1733,0,1734,0,1966,0,1735,0,1736,0,1737,0,1968,0,878,0,1550,0,860,1,2260,1,2261,1,2032,0,2054,0,2033,0,2057,0,2036,0,2060,0,2039,1,2062,1;0;16;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534;FLOAT3;2075
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;0;Standard;BOXOPHOBIC/The Vegetation Engine/Vegetation/Grass Subsurface Lit;False;False;False;False;False;True;False;True;False;False;False;False;True;True;True;False;True;False;False;False;True;Back;0;True;17;0;False;-1;True;0;False;-1;-1;False;-1;False;0;Custom;0.5;True;True;0;True;Opaque;;Geometry;ForwardOnly;11;d3d11;glcore;gles3;metal;vulkan;xbox360;xboxone;ps4;psp2;n3ds;wiiu;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;1;0;True;20;0;True;7;0;5;False;-1;10;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Absolute;0;;-1;-1;-1;-1;0;False;0;0;True;10;-1;0;True;21;0;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1024.392;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;408;-2176,128;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
WireConnection;688;0;685;0
WireConnection;688;1;689;0
WireConnection;685;0;690;0
WireConnection;685;1;686;0
WireConnection;685;2;687;4
WireConnection;679;0;678;0
WireConnection;680;0;679;0
WireConnection;680;1;677;0
WireConnection;682;0;680;0
WireConnection;690;0;692;0
WireConnection;690;1;683;0
WireConnection;684;0;682;2
WireConnection;683;0;684;0
WireConnection;683;2;682;0
WireConnection;0;0;704;0
WireConnection;0;1;704;528
WireConnection;0;4;704;530
WireConnection;0;5;704;531
WireConnection;0;6;704;1230
WireConnection;0;9;704;532
WireConnection;0;10;704;653
WireConnection;0;11;704;534
ASEEND*/
//CHKSM=258D21AEECDDEB92FD4CE1EA14DC6D1B99F006B0
