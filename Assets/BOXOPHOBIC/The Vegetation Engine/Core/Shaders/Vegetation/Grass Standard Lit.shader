// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Vegetation/Grass Standard Lit"
{
	Properties
	{
		[StyledBanner(Grass Standard Lit)]_Banner("Banner", Float) = 0
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
		Offset  0 , -1
		Blend [_render_src] [_render_dst]
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma shader_feature_local _ALPHATEST_ON
		#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA
		#define MATERIAL_USE_PIVOT_DATA
		  
		//SHADER INJECTION POINT BEGIN
		//SHADER INJECTION POINT END
		    
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
			float4 uv_tex4coord;
			float4 vertexColor : COLOR;
		};

		uniform half _IsLitShader;
		uniform half _IsStandardShader;
		uniform half _material_batching;
		uniform half _IsAnyPathShader;
		uniform half _Banner;
		uniform half _material_pivots;
		uniform half _IsGrassShader;
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
			half3 Off19_g23780 = half3(0,0,0);
			float3 appendResult60_g23760 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			half3 On20_g23780 = ( appendResult60_g23760 * _VertexPivotMode );
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23780 = On20_g23780;
			#else
				float3 staticSwitch14_g23780 = Off19_g23780;
			#endif
			half3 ObjectData20_g23781 = staticSwitch14_g23780;
			half3 WorldData19_g23781 = Off19_g23780;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23781 = WorldData19_g23781;
			#else
				float3 staticSwitch14_g23781 = ObjectData20_g23781;
			#endif
			float3 Mesh_PivotsOS2291_g23689 = staticSwitch14_g23781;
			float3 temp_output_2283_0_g23689 = ( ase_vertex3Pos - Mesh_PivotsOS2291_g23689 );
			half3 VertexPos40_g23759 = temp_output_2283_0_g23689;
			float3 appendResult74_g23759 = (float3(VertexPos40_g23759.x , 0.0 , 0.0));
			half3 VertexPosRotationAxis50_g23759 = appendResult74_g23759;
			float3 break84_g23759 = VertexPos40_g23759;
			float3 appendResult81_g23759 = (float3(0.0 , break84_g23759.y , break84_g23759.z));
			half3 VertexPosOtherAxis82_g23759 = appendResult81_g23759;
			float ObjectData20_g23777 = 3.14;
			float Bounds_Height374_g23689 = _MaxBoundsInfo.y;
			float WorldData19_g23777 = ( Bounds_Height374_g23689 * 3.14 );
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23777 = WorldData19_g23777;
			#else
				float staticSwitch14_g23777 = ObjectData20_g23777;
			#endif
			float Motion_Max_Bending1133_g23689 = staticSwitch14_g23777;
			float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
			float4x4 break19_g23750 = unity_ObjectToWorld;
			float3 appendResult20_g23750 = (float3(break19_g23750[ 0 ][ 3 ] , break19_g23750[ 1 ][ 3 ] , break19_g23750[ 2 ][ 3 ]));
			half3 Off19_g23752 = appendResult20_g23750;
			float4 ase_vertex4Pos = v.vertex;
			float4 transform68_g23750 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23751 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g23750 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23751 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23750 = ( (transform68_g23750).xyz - (transform62_g23750).xyz );
			half3 On20_g23752 = ObjectPositionWithPivots28_g23750;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23752 = On20_g23752;
			#else
				float3 staticSwitch14_g23752 = Off19_g23752;
			#endif
			half3 ObjectData20_g23753 = staticSwitch14_g23752;
			half3 WorldData19_g23753 = Off19_g23752;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23753 = WorldData19_g23753;
			#else
				float3 staticSwitch14_g23753 = ObjectData20_g23753;
			#endif
			float3 temp_output_42_0_g23750 = staticSwitch14_g23753;
			half3 ObjectData20_g23756 = temp_output_42_0_g23750;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			half3 WorldData19_g23756 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23756 = WorldData19_g23756;
			#else
				float3 staticSwitch14_g23756 = ObjectData20_g23756;
			#endif
			float2 panner73_g23749 = ( _Time.y * temp_cast_0 + ( (staticSwitch14_g23756).xz * TVE_NoiseSize ));
			float4 temp_cast_2 = (TVE_NoiseContrast).xxxx;
			float4 break142_g23749 = pow( abs( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g23749, 0.0 ) ) , temp_cast_2 );
			half Global_NoiseTex_R34_g23689 = break142_g23749.r;
			float4x4 break19_g23719 = unity_ObjectToWorld;
			float3 appendResult20_g23719 = (float3(break19_g23719[ 0 ][ 3 ] , break19_g23719[ 1 ][ 3 ] , break19_g23719[ 2 ][ 3 ]));
			half3 Off19_g23721 = appendResult20_g23719;
			float4 transform68_g23719 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23720 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g23719 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23720 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23719 = ( (transform68_g23719).xyz - (transform62_g23719).xyz );
			half3 On20_g23721 = ObjectPositionWithPivots28_g23719;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23721 = On20_g23721;
			#else
				float3 staticSwitch14_g23721 = Off19_g23721;
			#endif
			half3 ObjectData20_g23722 = staticSwitch14_g23721;
			half3 WorldData19_g23722 = Off19_g23721;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23722 = WorldData19_g23722;
			#else
				float3 staticSwitch14_g23722 = ObjectData20_g23722;
			#endif
			float3 temp_output_42_0_g23719 = staticSwitch14_g23722;
			half3 ObjectData20_g23717 = temp_output_42_0_g23719;
			half3 WorldData19_g23717 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23717 = WorldData19_g23717;
			#else
				float3 staticSwitch14_g23717 = ObjectData20_g23717;
			#endif
			float4 break322_g23774 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23717).xz ) ), 0.0 );
			float3 appendResult323_g23774 = (float3(break322_g23774.x , 0.0 , break322_g23774.y));
			float3 temp_output_324_0_g23774 = (appendResult323_g23774*2.0 + -1.0);
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			half3 ObjectData20_g23775 = ( mul( unity_WorldToObject, float4( temp_output_324_0_g23774 , 0.0 ) ).xyz * ase_parentObjectScale );
			half3 WorldData19_g23775 = temp_output_324_0_g23774;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23775 = WorldData19_g23775;
			#else
				float3 staticSwitch14_g23775 = ObjectData20_g23775;
			#endif
			half2 Motion_DirectionOS39_g23689 = (staticSwitch14_g23775).xz;
			half Motion_Power2223_g23689 = break322_g23774.z;
			half Motion_Use1056_g23689 = ( _Motion_10 + _MotionCat );
			half Input_Speed62_g23708 = _MotionSpeed_10;
			float mulTime373_g23708 = _Time.y * Input_Speed62_g23708;
			float temp_output_349_0_g23708 = ( _MotionVariation_10 * v.color.r );
			float4x4 break19_g23709 = unity_ObjectToWorld;
			float3 appendResult20_g23709 = (float3(break19_g23709[ 0 ][ 3 ] , break19_g23709[ 1 ][ 3 ] , break19_g23709[ 2 ][ 3 ]));
			half3 Off19_g23711 = appendResult20_g23709;
			float4 transform68_g23709 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23710 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g23709 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23710 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23709 = ( (transform68_g23709).xyz - (transform62_g23709).xyz );
			half3 On20_g23711 = ObjectPositionWithPivots28_g23709;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23711 = On20_g23711;
			#else
				float3 staticSwitch14_g23711 = Off19_g23711;
			#endif
			half3 ObjectData20_g23712 = staticSwitch14_g23711;
			half3 WorldData19_g23712 = Off19_g23711;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23712 = WorldData19_g23712;
			#else
				float3 staticSwitch14_g23712 = ObjectData20_g23712;
			#endif
			float3 temp_output_42_0_g23709 = staticSwitch14_g23712;
			float3 break9_g23709 = temp_output_42_0_g23709;
			float ObjectData20_g23715 = ( temp_output_349_0_g23708 + ( break9_g23709.x + break9_g23709.z ) );
			float WorldData19_g23715 = temp_output_349_0_g23708;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23715 = WorldData19_g23715;
			#else
				float staticSwitch14_g23715 = ObjectData20_g23715;
			#endif
			half Motion_Variation284_g23708 = staticSwitch14_g23715;
			float2 appendResult344_g23708 = (float2(ase_worldPos.x , ase_worldPos.z));
			float2 Motion_Scale287_g23708 = ( _MotionScale_10 * appendResult344_g23708 );
			half2 Sine_MinusOneToOne281_g23708 = sin( ( mulTime373_g23708 + Motion_Variation284_g23708 + Motion_Scale287_g23708 ) );
			float2 temp_cast_8 = (1.0).xx;
			half Input_Turbulence327_g23708 = Global_NoiseTex_R34_g23689;
			float2 lerpResult321_g23708 = lerp( Sine_MinusOneToOne281_g23708 , temp_cast_8 , Input_Turbulence327_g23708);
			half2 Motion_Bending2258_g23689 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g23689 ) * TVE_MotionAmplitude_10 * Global_NoiseTex_R34_g23689 * Motion_DirectionOS39_g23689 * Motion_Power2223_g23689 * Motion_Use1056_g23689 * lerpResult321_g23708 );
			half Motion_UseInteraction2097_g23689 = _Motion_Interaction;
			half Motion_InteractionMask66_g23689 = break322_g23774.w;
			half2 Motion_Interaction53_g23689 = ( _InteractionAmplitude * Motion_Max_Bending1133_g23689 * Motion_UseInteraction2097_g23689 * Motion_InteractionMask66_g23689 * Motion_InteractionMask66_g23689 * Motion_DirectionOS39_g23689 );
			float2 lerpResult109_g23689 = lerp( Motion_Bending2258_g23689 , Motion_Interaction53_g23689 , Motion_InteractionMask66_g23689);
			half Mesh_Motion_182_g23689 = v.texcoord3.x;
			float2 break143_g23689 = ( lerpResult109_g23689 * Mesh_Motion_182_g23689 );
			half Motion_Z190_g23689 = break143_g23689.y;
			half Angle44_g23759 = Motion_Z190_g23689;
			half3 VertexPos40_g23779 = ( VertexPosRotationAxis50_g23759 + ( VertexPosOtherAxis82_g23759 * cos( Angle44_g23759 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g23759 ) * sin( Angle44_g23759 ) ) );
			float3 appendResult74_g23779 = (float3(0.0 , 0.0 , VertexPos40_g23779.z));
			half3 VertexPosRotationAxis50_g23779 = appendResult74_g23779;
			float3 break84_g23779 = VertexPos40_g23779;
			float3 appendResult81_g23779 = (float3(break84_g23779.x , break84_g23779.y , 0.0));
			half3 VertexPosOtherAxis82_g23779 = appendResult81_g23779;
			half Motion_X216_g23689 = break143_g23689.x;
			half Angle44_g23779 = -Motion_X216_g23689;
			half Motion_Scale321_g23782 = ( _MotionScale_32 * 10.0 );
			half Input_Speed62_g23782 = _MotionSpeed_32;
			float mulTime349_g23782 = _Time.y * Input_Speed62_g23782;
			float Motion_Variation330_g23782 = ( _MotionVariation_32 * v.color.r );
			float Bounds_Radius121_g23689 = _MaxBoundsInfo.x;
			half Input_Amplitude58_g23782 = ( _MotionAmplitude_32 * Bounds_Radius121_g23689 * 0.2 );
			float3 appendResult345_g23782 = (float3(v.color.r , ( 1.0 - v.color.r ) , v.color.r));
			half Global_NoiseTex_A139_g23689 = break142_g23749.a;
			half Mesh_Motion_3144_g23689 = v.texcoord3.z;
			half Motion_Use322013_g23689 = _Motion_32;
			half3 Motion_Flutter263_g23689 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g23782 ) + mulTime349_g23782 + Motion_Variation330_g23782 ) ) * Input_Amplitude58_g23782 * appendResult345_g23782 ) * ( Global_NoiseTex_R34_g23689 + Global_NoiseTex_A139_g23689 ) * Mesh_Motion_3144_g23689 * Motion_Use322013_g23689 * TVE_MotionAmplitude_32 * Motion_Power2223_g23689 );
			float3 Vertex_Motion_Object833_g23689 = ( ( VertexPosRotationAxis50_g23779 + ( VertexPosOtherAxis82_g23779 * cos( Angle44_g23779 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g23779 ) * sin( Angle44_g23779 ) ) ) + Motion_Flutter263_g23689 );
			half3 ObjectData20_g23690 = Vertex_Motion_Object833_g23689;
			float3 appendResult2043_g23689 = (float3(Motion_X216_g23689 , 0.0 , Motion_Z190_g23689));
			float3 Vertex_Motion_World1118_g23689 = ( ( ase_vertex3Pos + mul( unity_WorldToObject, float4( appendResult2043_g23689 , 0.0 ) ).xyz ) + Motion_Flutter263_g23689 );
			half3 WorldData19_g23690 = Vertex_Motion_World1118_g23689;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23690 = WorldData19_g23690;
			#else
				float3 staticSwitch14_g23690 = ObjectData20_g23690;
			#endif
			float4x4 break19_g23734 = unity_ObjectToWorld;
			float3 appendResult20_g23734 = (float3(break19_g23734[ 0 ][ 3 ] , break19_g23734[ 1 ][ 3 ] , break19_g23734[ 2 ][ 3 ]));
			half3 Off19_g23736 = appendResult20_g23734;
			float4 transform68_g23734 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23735 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g23734 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23735 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23734 = ( (transform68_g23734).xyz - (transform62_g23734).xyz );
			half3 On20_g23736 = ObjectPositionWithPivots28_g23734;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23736 = On20_g23736;
			#else
				float3 staticSwitch14_g23736 = Off19_g23736;
			#endif
			half3 ObjectData20_g23737 = staticSwitch14_g23736;
			half3 WorldData19_g23737 = Off19_g23736;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23737 = WorldData19_g23737;
			#else
				float3 staticSwitch14_g23737 = ObjectData20_g23737;
			#endif
			float3 temp_output_42_0_g23734 = staticSwitch14_g23737;
			float temp_output_7_0_g23758 = TVE_SizeFadeEnd;
			float ObjectData20_g23702 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g23734 ) * _GlobalSizeFade ) - temp_output_7_0_g23758 ) / ( TVE_SizeFadeStart - temp_output_7_0_g23758 ) ) );
			float WorldData19_g23702 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23702 = WorldData19_g23702;
			#else
				float staticSwitch14_g23702 = ObjectData20_g23702;
			#endif
			float Vertex_SizeFade1740_g23689 = staticSwitch14_g23702;
			float4x4 break19_g23694 = unity_ObjectToWorld;
			float3 appendResult20_g23694 = (float3(break19_g23694[ 0 ][ 3 ] , break19_g23694[ 1 ][ 3 ] , break19_g23694[ 2 ][ 3 ]));
			half3 Off19_g23696 = appendResult20_g23694;
			float4 transform68_g23694 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23695 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g23694 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23695 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23694 = ( (transform68_g23694).xyz - (transform62_g23694).xyz );
			half3 On20_g23696 = ObjectPositionWithPivots28_g23694;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23696 = On20_g23696;
			#else
				float3 staticSwitch14_g23696 = Off19_g23696;
			#endif
			half3 ObjectData20_g23697 = staticSwitch14_g23696;
			half3 WorldData19_g23697 = Off19_g23696;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23697 = WorldData19_g23697;
			#else
				float3 staticSwitch14_g23697 = ObjectData20_g23697;
			#endif
			float3 temp_output_42_0_g23694 = staticSwitch14_g23697;
			half3 ObjectData20_g23700 = temp_output_42_0_g23694;
			half3 WorldData19_g23700 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23700 = WorldData19_g23700;
			#else
				float3 staticSwitch14_g23700 = ObjectData20_g23700;
			#endif
			float4 tex2DNode7_g23693 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23700).xz ) ), 0.0 );
			half Global_ExtrasTex_G305_g23689 = tex2DNode7_g23693.g;
			float lerpResult346_g23689 = lerp( 1.0 , Global_ExtrasTex_G305_g23689 , _GlobalSize);
			float ObjectData20_g23705 = ( lerpResult346_g23689 * _LocalSize );
			float WorldData19_g23705 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23705 = WorldData19_g23705;
			#else
				float staticSwitch14_g23705 = ObjectData20_g23705;
			#endif
			half Vertex_Size1741_g23689 = staticSwitch14_g23705;
			float3 normalizeResult2696_g23689 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float3 break2709_g23689 = cross( normalizeResult2696_g23689 , half3(0,1,0) );
			float3 appendResult2710_g23689 = (float3(-break2709_g23689.z , 0.0 , break2709_g23689.x));
			float3 appendResult2667_g23689 = (float3(frac( ase_worldPos.x ) , 0.5 , frac( ase_worldPos.z )));
			float3 normalizeResult2210_g23689 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float dotResult2212_g23689 = dot( normalizeResult2210_g23689 , float3(0,1,0) );
			half Mask_HView2656_g23689 = abs( dotResult2212_g23689 );
			float saferPower2652_g23689 = max( Mask_HView2656_g23689 , 0.0001 );
			half3 Grass_Coverage2661_g23689 = ( ( ( mul( unity_WorldToObject, float4( appendResult2710_g23689 , 0.0 ) ).xyz * ( _GrassPerspectivePushValue + _GrassCat ) ) + ( (appendResult2667_g23689*2.0 + -1.0) * _GrassPerspectiveNoiseValue ) ) * v.color.a * pow( saferPower2652_g23689 , _GrassPerspectiveAngleValue ) );
			float3 Final_VertexPosition890_g23689 = ( ( ( staticSwitch14_g23690 * Vertex_SizeFade1740_g23689 * Vertex_Size1741_g23689 ) + Mesh_PivotsOS2291_g23689 + Grass_Coverage2661_g23689 ) + ( _IsStandardPipeline * 0.0 ) );
			v.vertex.xyz = Final_VertexPosition890_g23689;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			half2 Main_UVs15_g23689 = ( ( i.uv_texcoord * (_MainUVs).xy ) + (_MainUVs).zw );
			float4 tex2DNode117_g23689 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g23689 );
			float2 appendResult88_g23707 = (float2(tex2DNode117_g23689.a , tex2DNode117_g23689.g));
			float2 temp_output_90_0_g23707 = ( (appendResult88_g23707*2.0 + -1.0) * _MainNormalValue );
			float3 appendResult91_g23707 = (float3(temp_output_90_0_g23707 , 1.0));
			float3 Main_Normal137_g23689 = appendResult91_g23707;
			float3 temp_output_13_0_g23692 = Main_Normal137_g23689;
			float3 switchResult12_g23692 = (((i.ASEVFace>0)?(temp_output_13_0_g23692):(( temp_output_13_0_g23692 * _render_normals_options ))));
			half3 Blend_Normal312_g23689 = switchResult12_g23692;
			half3 Final_Normal366_g23689 = Blend_Normal312_g23689;
			o.Normal = Final_Normal366_g23689;
			float4 tex2DNode29_g23689 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g23689 );
			float4 temp_output_51_0_g23689 = ( _MainColor * tex2DNode29_g23689 );
			half3 Main_AlbedoRaw99_g23689 = (temp_output_51_0_g23689).rgb;
			float4x4 break19_g23763 = unity_ObjectToWorld;
			float3 appendResult20_g23763 = (float3(break19_g23763[ 0 ][ 3 ] , break19_g23763[ 1 ][ 3 ] , break19_g23763[ 2 ][ 3 ]));
			half3 Off19_g23765 = appendResult20_g23763;
			float4 ase_vertex4Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 transform68_g23763 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 appendResult60_g23764 = (float3(i.uv_tex4coord.z , 0.0 , i.uv_tex4coord.w));
			float4 transform62_g23763 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23764 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23763 = ( (transform68_g23763).xyz - (transform62_g23763).xyz );
			half3 On20_g23765 = ObjectPositionWithPivots28_g23763;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23765 = On20_g23765;
			#else
				float3 staticSwitch14_g23765 = Off19_g23765;
			#endif
			half3 ObjectData20_g23766 = staticSwitch14_g23765;
			half3 WorldData19_g23766 = Off19_g23765;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23766 = WorldData19_g23766;
			#else
				float3 staticSwitch14_g23766 = ObjectData20_g23766;
			#endif
			float3 temp_output_42_0_g23763 = staticSwitch14_g23766;
			half3 ObjectData20_g23762 = temp_output_42_0_g23763;
			float3 ase_worldPos = i.worldPos;
			half3 WorldData19_g23762 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23762 = WorldData19_g23762;
			#else
				float3 staticSwitch14_g23762 = ObjectData20_g23762;
			#endif
			float4 tex2DNode7_g23761 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23762).xz ) ) );
			half3 Global_ColorsTex_RGB1700_g23689 = (tex2DNode7_g23761).rgb;
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g23706 = 2.0;
			#else
				float staticSwitch1_g23706 = 4.594794;
			#endif
			float lerpResult2103_g23689 = lerp( 1.0 , ( 1.0 - i.vertexColor.a ) , _ColorsMaskValue);
			float3 lerpResult108_g23689 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g23689 * staticSwitch1_g23706 ) ) , ( _GlobalColors * lerpResult2103_g23689 ));
			half3 Global_Colors1954_g23689 = lerpResult108_g23689;
			float3 temp_output_123_0_g23689 = ( Main_AlbedoRaw99_g23689 * Global_Colors1954_g23689 );
			half3 Main_AlbedoColored863_g23689 = temp_output_123_0_g23689;
			half3 Blend_Albedo265_g23689 = Main_AlbedoColored863_g23689;
			float3 temp_cast_1 = (0.5).xxx;
			float3 temp_output_799_0_g23689 = (_SubsurfaceColor).rgb;
			half Global_ColorsTex_A1701_g23689 = tex2DNode7_g23761.a;
			half Global_HealthinessValue1780_g23689 = _GlobalHealthiness;
			float lerpResult1720_g23689 = lerp( 1.0 , Global_ColorsTex_A1701_g23689 , Global_HealthinessValue1780_g23689);
			float3 lerpResult1698_g23689 = lerp( temp_cast_1 , temp_output_799_0_g23689 , lerpResult1720_g23689);
			half3 Subsurface_Color1722_g23689 = lerpResult1698_g23689;
			float lerpResult1779_g23689 = lerp( 1.0 , Global_ColorsTex_A1701_g23689 , Global_HealthinessValue1780_g23689);
			half Autoregister_SubsurfaceSpace2238_g23689 = _SubsurfaceCat;
			half Subsurface_Intensity1752_g23689 = ( ( _SubsurfaceValue * lerpResult1779_g23689 ) + Autoregister_SubsurfaceSpace2238_g23689 );
			float4 tex2DNode35_g23689 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g23689 );
			half Main_Mask57_g23689 = tex2DNode35_g23689.b;
			float temp_output_7_0_g23789 = _SubsurfaceMinValue;
			half Subsurface_Mask1557_g23689 = saturate( ( ( Main_Mask57_g23689 - temp_output_7_0_g23789 ) / ( _SubsurfaceMaxValue - temp_output_7_0_g23789 ) ) );
			half Overlay_Mask_Subsurface1492_g23689 = 0.0;
			half3 Subsurface_Transmission884_g23689 = ( Subsurface_Color1722_g23689 * Subsurface_Intensity1752_g23689 * Subsurface_Mask1557_g23689 * ( 1.0 - Overlay_Mask_Subsurface1492_g23689 ) );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 normalizeResult1983_g23689 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float dotResult785_g23689 = dot( -ase_worldlightDir , normalizeResult1983_g23689 );
			float saferPower1624_g23689 = max( (dotResult785_g23689*0.5 + 0.5) , 0.0001 );
			#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g23689 = 0.0;
			#else
				float staticSwitch1602_g23689 = ( pow( saferPower1624_g23689 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
			#endif
			half Mask_Subsurface_View782_g23689 = staticSwitch1602_g23689;
			half3 Subsurface_Deferred1693_g23689 = ( Subsurface_Transmission884_g23689 * Mask_Subsurface_View782_g23689 );
			half3 Blend_AlbedoAndSubsurface149_g23689 = ( Blend_Albedo265_g23689 + Subsurface_Deferred1693_g23689 );
			half3 Global_OverlayColor1758_g23689 = (TVE_OverlayColor).rgb;
			float2 break93_g23707 = temp_output_90_0_g23707;
			half Main_NormalY2095_g23689 = break93_g23707.y;
			half Overlay_Contrast1405_g23689 = _OverlayContrast;
			half Global_OverlayIntensity154_g23689 = TVE_OverlayIntensity;
			float4x4 break19_g23694 = unity_ObjectToWorld;
			float3 appendResult20_g23694 = (float3(break19_g23694[ 0 ][ 3 ] , break19_g23694[ 1 ][ 3 ] , break19_g23694[ 2 ][ 3 ]));
			half3 Off19_g23696 = appendResult20_g23694;
			float4 transform68_g23694 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23695 = (float3(i.uv_tex4coord.z , 0.0 , i.uv_tex4coord.w));
			float4 transform62_g23694 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23695 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23694 = ( (transform68_g23694).xyz - (transform62_g23694).xyz );
			half3 On20_g23696 = ObjectPositionWithPivots28_g23694;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23696 = On20_g23696;
			#else
				float3 staticSwitch14_g23696 = Off19_g23696;
			#endif
			half3 ObjectData20_g23697 = staticSwitch14_g23696;
			half3 WorldData19_g23697 = Off19_g23696;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23697 = WorldData19_g23697;
			#else
				float3 staticSwitch14_g23697 = ObjectData20_g23697;
			#endif
			float3 temp_output_42_0_g23694 = staticSwitch14_g23697;
			half3 ObjectData20_g23700 = temp_output_42_0_g23694;
			half3 WorldData19_g23700 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23700 = WorldData19_g23700;
			#else
				float3 staticSwitch14_g23700 = ObjectData20_g23700;
			#endif
			float4 tex2DNode7_g23693 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23700).xz ) ) );
			half Global_ExtrasTex_B156_g23689 = tex2DNode7_g23693.b;
			float temp_output_1025_0_g23689 = ( Global_OverlayIntensity154_g23689 * _GlobalOverlay * Global_ExtrasTex_B156_g23689 );
			float Mesh_Variation16_g23689 = i.vertexColor.r;
			float lerpResult1065_g23689 = lerp( 1.0 , Mesh_Variation16_g23689 , _OverlayVariation);
			half Overlay_Commons1365_g23689 = ( temp_output_1025_0_g23689 * lerpResult1065_g23689 );
			half Overlay_Mask269_g23689 = saturate( ( saturate( ( i.vertexColor.a + ( Main_NormalY2095_g23689 * Overlay_Contrast1405_g23689 ) ) ) - ( 1.0 - Overlay_Commons1365_g23689 ) ) );
			float3 lerpResult336_g23689 = lerp( Blend_AlbedoAndSubsurface149_g23689 , Global_OverlayColor1758_g23689 , Overlay_Mask269_g23689);
			half3 Final_Albedo359_g23689 = lerpResult336_g23689;
			half Main_Alpha316_g23689 = (temp_output_51_0_g23689).a;
			float lerpResult354_g23689 = lerp( 1.0 , Main_Alpha316_g23689 , _render_premul);
			half Final_Premultiply355_g23689 = lerpResult354_g23689;
			o.Albedo = ( Final_Albedo359_g23689 * Final_Premultiply355_g23689 );
			half Main_Smoothness227_g23689 = ( tex2DNode35_g23689.a * _MainSmoothnessValue );
			half Blend_Smoothness314_g23689 = Main_Smoothness227_g23689;
			half Global_OverlaySmoothness311_g23689 = TVE_OverlaySmoothness;
			float lerpResult343_g23689 = lerp( Blend_Smoothness314_g23689 , Global_OverlaySmoothness311_g23689 , Overlay_Mask269_g23689);
			half Final_Smoothness371_g23689 = lerpResult343_g23689;
			half Global_Wetness1016_g23689 = ( TVE_Wetness * _GlobalWetness );
			half Global_ExtrasTex_A1033_g23689 = tex2DNode7_g23693.a;
			float lerpResult1037_g23689 = lerp( Final_Smoothness371_g23689 , saturate( ( Final_Smoothness371_g23689 + Global_Wetness1016_g23689 ) ) , Global_ExtrasTex_A1033_g23689);
			o.Smoothness = lerpResult1037_g23689;
			half Mesh_Occlusion318_g23689 = i.vertexColor.g;
			float saferPower1201_g23689 = max( Mesh_Occlusion318_g23689 , 0.0001 );
			half Vertex_Occlusion648_g23689 = pow( saferPower1201_g23689 , _ObjectOcclusionValue );
			float lerpResult240_g23689 = lerp( 1.0 , tex2DNode35_g23689.g , _MainOcclusionValue);
			half Main_Occlusion247_g23689 = lerpResult240_g23689;
			half Blend_Occlusion323_g23689 = Main_Occlusion247_g23689;
			o.Occlusion = ( Vertex_Occlusion648_g23689 * Blend_Occlusion323_g23689 );
			o.Alpha = Main_Alpha316_g23689;
			half Main_AlphaRaw1203_g23689 = tex2DNode29_g23689.a;
			float lerpResult2262_g23689 = lerp( 0.9 , Mesh_Variation16_g23689 , _LeavesVariationValue);
			half Global_ExtrasTex_R174_g23689 = tex2DNode7_g23693.r;
			float lerpResult2624_g23689 = lerp( 1.0 , Global_ExtrasTex_R174_g23689 , _GlobalLeaves);
			half AlphaTreshold2132_g23689 = _Cutoff;
			half Mask_Leaves315_g23689 = ( ( (lerpResult2262_g23689*0.5 + 0.5) - ( 1.0 - ( lerpResult2624_g23689 * _LocalLeaves ) ) ) + AlphaTreshold2132_g23689 );
			half Alpha5_g23787 = ( Main_AlphaRaw1203_g23689 * Mask_Leaves315_g23689 );
			#ifdef _ALPHATEST_ON
				float staticSwitch2_g23787 = Alpha5_g23787;
			#else
				float staticSwitch2_g23787 = 1.0;
			#endif
			half Final_Clip914_g23689 = staticSwitch2_g23787;
			clip( Final_Clip914_g23689 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=18500
1927;7;1906;1014;2515.677;954.0322;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;271;-1552,-896;Half;False;Property;_IsLitShader;_IsLitShader;183;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-1792,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;181;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;525;-2176,256;Inherit;False;Feature Batching Support;176;;23322;d914b3a554b05ab4da8c1d2a8ce94c0a;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;533;-2176,-384;Inherit;False;Base Shader;1;;23689;856f7164d1c579d43a5cf4968a75ca43;52,1271,2,1300,1,1298,1,1962,1,1708,1,1712,1,1964,1,1969,1,1719,1,1723,1,893,1,1745,1,1742,1,1718,1,1717,1,1728,1,1715,1,1714,1,916,0,1732,0,1949,1,1763,0,1762,0,1776,1,1646,1,1690,1,1757,0,1669,1,1981,0,1759,0,2172,0,2658,1,1733,0,1734,0,1966,0,1735,0,1736,0,1737,0,1968,0,878,0,1550,0,860,1,2260,1,2261,1,2032,0,2054,0,2033,0,2057,0,2036,0,2060,0,2039,1,2062,1;0;16;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534;FLOAT3;2075
Node;AmplifyShaderEditor.RangedFloatNode;530;-1376,-896;Half;False;Property;_IsAnyPathShader;_IsAnyPathShader;182;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Grass Standard Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;531;-1856,256;Inherit;False;Feature Pivots Support;178;;23586;8da5867b3f9f1834693af40d3eff73f4;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;168;-1984,-896;Half;False;Property;_IsGrassShader;_IsGrassShader;180;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1536,-768;Half;False;Property;_render_dst;_render_dst;187;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1728,-768;Half;False;Property;_render_src;_render_src;186;0;Fetch;True;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;188;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1918.798,-768;Half;False;Property;_render_cull;_render_cull;185;0;Fetch;True;3;Both;0;Back;1;Front;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-768;Half;False;Property;_Cutoff;_Cutoff;184;1;[HideInInspector];Fetch;True;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;0;Standard;BOXOPHOBIC/The Vegetation Engine/Vegetation/Grass Standard Lit;False;False;False;False;False;True;False;True;False;False;False;False;True;True;True;False;True;False;False;False;True;Back;0;True;17;0;False;-1;True;0;False;-1;-1;False;-1;False;0;Custom;0.5;True;True;0;True;Opaque;;Geometry;All;11;d3d11;glcore;gles3;metal;vulkan;xbox360;xboxone;ps4;psp2;n3ds;wiiu;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;1;0;True;20;0;True;7;0;5;False;-1;10;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Absolute;0;;-1;-1;-1;-1;0;False;0;0;True;10;-1;0;True;21;0;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;408;-2176,128;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1024.392;100;Final;0;;0,1,0.5,1;0;0
WireConnection;0;0;533;0
WireConnection;0;1;533;528
WireConnection;0;4;533;530
WireConnection;0;5;533;531
WireConnection;0;9;533;532
WireConnection;0;10;533;653
WireConnection;0;11;533;534
ASEEND*/
//CHKSM=951C451191F5A719DBF3AF6CDF3893C20C25E870
