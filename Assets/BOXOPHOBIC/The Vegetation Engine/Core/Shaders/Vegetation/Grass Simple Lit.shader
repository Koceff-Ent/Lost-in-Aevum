// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Vegetation/Grass Simple Lit"
{
	Properties
	{
		[StyledBanner(Grass Simple Lit)]_Banner("Banner", Float) = 0
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
		[Space(10)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_ObjectSmoothnessValue("Object Smoothness", Range( 0 , 1)) = 0
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
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector]_MotionScale_32("Flutter Elasticity", Float) = 30
		[HideInInspector] _tex4coord( "", 2D ) = "white" {}
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
		[HideInInspector]_IsSimpleShader("_IsSimpleShader", Float) = 1
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

		uniform half _material_batching;
		uniform half _IsLitShader;
		uniform half _Banner;
		uniform half _IsSimpleShader;
		uniform half _material_pivots;
		uniform half _IsAnyPathShader;
		uniform half _IsGrassShader;
		uniform half _MainMaskValue;
		uniform half _BatchingMessage;
		uniform half _RenderingCat;
		uniform half _MiscSpace;
		uniform half _ObjectThicknessValue;
		uniform half _MotionVertical_20;
		uniform half _MotionVariation_20;
		uniform half _render_normals;
		uniform float _MotionVariation_30;
		uniform float _MotionSpeed_30;
		uniform half _render_dst;
		uniform half _render_cull;
		uniform float _MotionScale_20;
		uniform half _MotionAmplitude_30;
		uniform float _MotionSpeed_20;
		uniform half _MotionAmplitude_20;
		uniform float _MotionScale_30;
		uniform half _render_src;
		uniform half _MainColorMode;
		uniform half _IsTVEShader;
		uniform half _VertexOcclusion;
		uniform half _render_blend;
		uniform half _MainCat;
		uniform half _render_clip;
		uniform float4 _SubsurfaceDiffusion_asset;
		uniform float4 _Color;
		uniform half _render_zw;
		uniform half _IsVersion;
		uniform half _GlobalCat;
		uniform float _SubsurfaceMode;
		uniform half _render_mode;
		uniform half _MiscCat;
		uniform half _AdvancedCat;
		uniform half _render_priority;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform half _PivotsMessage;
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
		uniform half _SubsurfaceAngleValue;
		uniform half _SubsurfaceViewValue;
		uniform half4 TVE_OverlayColor;
		uniform half _OverlayContrast;
		uniform half TVE_OverlayIntensity;
		uniform half _GlobalOverlay;
		uniform half _OverlayVariation;
		uniform half _render_premul;
		uniform float _ObjectSmoothnessValue;
		uniform float TVE_Wetness;
		uniform half _GlobalWetness;
		uniform half _ObjectOcclusionValue;
		uniform half _LeavesVariationValue;
		uniform half _GlobalLeaves;
		uniform half _LocalLeaves;
		uniform half _Cutoff;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			half3 Off19_g23606 = half3(0,0,0);
			float3 appendResult60_g23629 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			half3 On20_g23606 = ( appendResult60_g23629 * _VertexPivotMode );
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23606 = On20_g23606;
			#else
				float3 staticSwitch14_g23606 = Off19_g23606;
			#endif
			half3 ObjectData20_g23607 = staticSwitch14_g23606;
			half3 WorldData19_g23607 = Off19_g23606;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23607 = WorldData19_g23607;
			#else
				float3 staticSwitch14_g23607 = ObjectData20_g23607;
			#endif
			float3 Mesh_PivotsOS2291_g23588 = staticSwitch14_g23607;
			float3 temp_output_2283_0_g23588 = ( ase_vertex3Pos - Mesh_PivotsOS2291_g23588 );
			half3 VertexPos40_g23639 = temp_output_2283_0_g23588;
			float3 appendResult74_g23639 = (float3(VertexPos40_g23639.x , 0.0 , 0.0));
			half3 VertexPosRotationAxis50_g23639 = appendResult74_g23639;
			float3 break84_g23639 = VertexPos40_g23639;
			float3 appendResult81_g23639 = (float3(0.0 , break84_g23639.y , break84_g23639.z));
			half3 VertexPosOtherAxis82_g23639 = appendResult81_g23639;
			float ObjectData20_g23608 = 3.14;
			float Bounds_Height374_g23588 = _MaxBoundsInfo.y;
			float WorldData19_g23608 = ( Bounds_Height374_g23588 * 3.14 );
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23608 = WorldData19_g23608;
			#else
				float staticSwitch14_g23608 = ObjectData20_g23608;
			#endif
			float Motion_Max_Bending1133_g23588 = staticSwitch14_g23608;
			float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
			float4x4 break19_g23668 = unity_ObjectToWorld;
			float3 appendResult20_g23668 = (float3(break19_g23668[ 0 ][ 3 ] , break19_g23668[ 1 ][ 3 ] , break19_g23668[ 2 ][ 3 ]));
			half3 Off19_g23670 = appendResult20_g23668;
			float4 ase_vertex4Pos = v.vertex;
			float4 transform68_g23668 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23669 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g23668 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23669 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23668 = ( (transform68_g23668).xyz - (transform62_g23668).xyz );
			half3 On20_g23670 = ObjectPositionWithPivots28_g23668;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23670 = On20_g23670;
			#else
				float3 staticSwitch14_g23670 = Off19_g23670;
			#endif
			half3 ObjectData20_g23671 = staticSwitch14_g23670;
			half3 WorldData19_g23671 = Off19_g23670;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23671 = WorldData19_g23671;
			#else
				float3 staticSwitch14_g23671 = ObjectData20_g23671;
			#endif
			float3 temp_output_42_0_g23668 = staticSwitch14_g23671;
			half3 ObjectData20_g23674 = temp_output_42_0_g23668;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			half3 WorldData19_g23674 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23674 = WorldData19_g23674;
			#else
				float3 staticSwitch14_g23674 = ObjectData20_g23674;
			#endif
			float2 panner73_g23667 = ( _Time.y * temp_cast_0 + ( (staticSwitch14_g23674).xz * TVE_NoiseSize ));
			float4 temp_cast_2 = (TVE_NoiseContrast).xxxx;
			float4 break142_g23667 = pow( abs( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g23667, 0.0 ) ) , temp_cast_2 );
			half Global_NoiseTex_R34_g23588 = break142_g23667.r;
			float4x4 break19_g23652 = unity_ObjectToWorld;
			float3 appendResult20_g23652 = (float3(break19_g23652[ 0 ][ 3 ] , break19_g23652[ 1 ][ 3 ] , break19_g23652[ 2 ][ 3 ]));
			half3 Off19_g23654 = appendResult20_g23652;
			float4 transform68_g23652 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23653 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g23652 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23653 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23652 = ( (transform68_g23652).xyz - (transform62_g23652).xyz );
			half3 On20_g23654 = ObjectPositionWithPivots28_g23652;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23654 = On20_g23654;
			#else
				float3 staticSwitch14_g23654 = Off19_g23654;
			#endif
			half3 ObjectData20_g23655 = staticSwitch14_g23654;
			half3 WorldData19_g23655 = Off19_g23654;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23655 = WorldData19_g23655;
			#else
				float3 staticSwitch14_g23655 = ObjectData20_g23655;
			#endif
			float3 temp_output_42_0_g23652 = staticSwitch14_g23655;
			half3 ObjectData20_g23650 = temp_output_42_0_g23652;
			half3 WorldData19_g23650 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23650 = WorldData19_g23650;
			#else
				float3 staticSwitch14_g23650 = ObjectData20_g23650;
			#endif
			float4 break322_g23591 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23650).xz ) ), 0.0 );
			float3 appendResult323_g23591 = (float3(break322_g23591.x , 0.0 , break322_g23591.y));
			float3 temp_output_324_0_g23591 = (appendResult323_g23591*2.0 + -1.0);
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			half3 ObjectData20_g23592 = ( mul( unity_WorldToObject, float4( temp_output_324_0_g23591 , 0.0 ) ).xyz * ase_parentObjectScale );
			half3 WorldData19_g23592 = temp_output_324_0_g23591;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23592 = WorldData19_g23592;
			#else
				float3 staticSwitch14_g23592 = ObjectData20_g23592;
			#endif
			half2 Motion_DirectionOS39_g23588 = (staticSwitch14_g23592).xz;
			half Motion_Power2223_g23588 = break322_g23591.z;
			half Motion_Use1056_g23588 = ( _Motion_10 + _MotionCat );
			half Input_Speed62_g23658 = _MotionSpeed_10;
			float mulTime373_g23658 = _Time.y * Input_Speed62_g23658;
			float temp_output_349_0_g23658 = ( _MotionVariation_10 * v.color.r );
			float4x4 break19_g23659 = unity_ObjectToWorld;
			float3 appendResult20_g23659 = (float3(break19_g23659[ 0 ][ 3 ] , break19_g23659[ 1 ][ 3 ] , break19_g23659[ 2 ][ 3 ]));
			half3 Off19_g23661 = appendResult20_g23659;
			float4 transform68_g23659 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23660 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g23659 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23660 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23659 = ( (transform68_g23659).xyz - (transform62_g23659).xyz );
			half3 On20_g23661 = ObjectPositionWithPivots28_g23659;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23661 = On20_g23661;
			#else
				float3 staticSwitch14_g23661 = Off19_g23661;
			#endif
			half3 ObjectData20_g23662 = staticSwitch14_g23661;
			half3 WorldData19_g23662 = Off19_g23661;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23662 = WorldData19_g23662;
			#else
				float3 staticSwitch14_g23662 = ObjectData20_g23662;
			#endif
			float3 temp_output_42_0_g23659 = staticSwitch14_g23662;
			float3 break9_g23659 = temp_output_42_0_g23659;
			float ObjectData20_g23665 = ( temp_output_349_0_g23658 + ( break9_g23659.x + break9_g23659.z ) );
			float WorldData19_g23665 = temp_output_349_0_g23658;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23665 = WorldData19_g23665;
			#else
				float staticSwitch14_g23665 = ObjectData20_g23665;
			#endif
			half Motion_Variation284_g23658 = staticSwitch14_g23665;
			float2 appendResult344_g23658 = (float2(ase_worldPos.x , ase_worldPos.z));
			float2 Motion_Scale287_g23658 = ( _MotionScale_10 * appendResult344_g23658 );
			half2 Sine_MinusOneToOne281_g23658 = sin( ( mulTime373_g23658 + Motion_Variation284_g23658 + Motion_Scale287_g23658 ) );
			float2 temp_cast_8 = (1.0).xx;
			half Input_Turbulence327_g23658 = Global_NoiseTex_R34_g23588;
			float2 lerpResult321_g23658 = lerp( Sine_MinusOneToOne281_g23658 , temp_cast_8 , Input_Turbulence327_g23658);
			half2 Motion_Bending2258_g23588 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g23588 ) * TVE_MotionAmplitude_10 * Global_NoiseTex_R34_g23588 * Motion_DirectionOS39_g23588 * Motion_Power2223_g23588 * Motion_Use1056_g23588 * lerpResult321_g23658 );
			half Motion_UseInteraction2097_g23588 = _Motion_Interaction;
			half Motion_InteractionMask66_g23588 = break322_g23591.w;
			half2 Motion_Interaction53_g23588 = ( _InteractionAmplitude * Motion_Max_Bending1133_g23588 * Motion_UseInteraction2097_g23588 * Motion_InteractionMask66_g23588 * Motion_InteractionMask66_g23588 * Motion_DirectionOS39_g23588 );
			float2 lerpResult109_g23588 = lerp( Motion_Bending2258_g23588 , Motion_Interaction53_g23588 , Motion_InteractionMask66_g23588);
			half Mesh_Motion_182_g23588 = v.texcoord3.x;
			float2 break143_g23588 = ( lerpResult109_g23588 * Mesh_Motion_182_g23588 );
			half Motion_Z190_g23588 = break143_g23588.y;
			half Angle44_g23639 = Motion_Z190_g23588;
			half3 VertexPos40_g23604 = ( VertexPosRotationAxis50_g23639 + ( VertexPosOtherAxis82_g23639 * cos( Angle44_g23639 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g23639 ) * sin( Angle44_g23639 ) ) );
			float3 appendResult74_g23604 = (float3(0.0 , 0.0 , VertexPos40_g23604.z));
			half3 VertexPosRotationAxis50_g23604 = appendResult74_g23604;
			float3 break84_g23604 = VertexPos40_g23604;
			float3 appendResult81_g23604 = (float3(break84_g23604.x , break84_g23604.y , 0.0));
			half3 VertexPosOtherAxis82_g23604 = appendResult81_g23604;
			half Motion_X216_g23588 = break143_g23588.x;
			half Angle44_g23604 = -Motion_X216_g23588;
			half Motion_Scale321_g23609 = ( _MotionScale_32 * 10.0 );
			half Input_Speed62_g23609 = _MotionSpeed_32;
			float mulTime349_g23609 = _Time.y * Input_Speed62_g23609;
			float Motion_Variation330_g23609 = ( _MotionVariation_32 * v.color.r );
			float Bounds_Radius121_g23588 = _MaxBoundsInfo.x;
			half Input_Amplitude58_g23609 = ( _MotionAmplitude_32 * Bounds_Radius121_g23588 * 0.2 );
			float3 appendResult345_g23609 = (float3(v.color.r , ( 1.0 - v.color.r ) , v.color.r));
			half Global_NoiseTex_A139_g23588 = break142_g23667.a;
			half Mesh_Motion_3144_g23588 = v.texcoord3.z;
			half Motion_Use322013_g23588 = _Motion_32;
			half3 Motion_Flutter263_g23588 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g23609 ) + mulTime349_g23609 + Motion_Variation330_g23609 ) ) * Input_Amplitude58_g23609 * appendResult345_g23609 ) * ( Global_NoiseTex_R34_g23588 + Global_NoiseTex_A139_g23588 ) * Mesh_Motion_3144_g23588 * Motion_Use322013_g23588 * TVE_MotionAmplitude_32 * Motion_Power2223_g23588 );
			float3 Vertex_Motion_Object833_g23588 = ( ( VertexPosRotationAxis50_g23604 + ( VertexPosOtherAxis82_g23604 * cos( Angle44_g23604 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g23604 ) * sin( Angle44_g23604 ) ) ) + Motion_Flutter263_g23588 );
			half3 ObjectData20_g23614 = Vertex_Motion_Object833_g23588;
			float3 appendResult2043_g23588 = (float3(Motion_X216_g23588 , 0.0 , Motion_Z190_g23588));
			float3 Vertex_Motion_World1118_g23588 = ( ( ase_vertex3Pos + mul( unity_WorldToObject, float4( appendResult2043_g23588 , 0.0 ) ).xyz ) + Motion_Flutter263_g23588 );
			half3 WorldData19_g23614 = Vertex_Motion_World1118_g23588;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23614 = WorldData19_g23614;
			#else
				float3 staticSwitch14_g23614 = ObjectData20_g23614;
			#endif
			float4x4 break19_g23675 = unity_ObjectToWorld;
			float3 appendResult20_g23675 = (float3(break19_g23675[ 0 ][ 3 ] , break19_g23675[ 1 ][ 3 ] , break19_g23675[ 2 ][ 3 ]));
			half3 Off19_g23677 = appendResult20_g23675;
			float4 transform68_g23675 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23676 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g23675 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23676 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23675 = ( (transform68_g23675).xyz - (transform62_g23675).xyz );
			half3 On20_g23677 = ObjectPositionWithPivots28_g23675;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23677 = On20_g23677;
			#else
				float3 staticSwitch14_g23677 = Off19_g23677;
			#endif
			half3 ObjectData20_g23678 = staticSwitch14_g23677;
			half3 WorldData19_g23678 = Off19_g23677;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23678 = WorldData19_g23678;
			#else
				float3 staticSwitch14_g23678 = ObjectData20_g23678;
			#endif
			float3 temp_output_42_0_g23675 = staticSwitch14_g23678;
			float temp_output_7_0_g23640 = TVE_SizeFadeEnd;
			float ObjectData20_g23627 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g23675 ) * _GlobalSizeFade ) - temp_output_7_0_g23640 ) / ( TVE_SizeFadeStart - temp_output_7_0_g23640 ) ) );
			float WorldData19_g23627 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23627 = WorldData19_g23627;
			#else
				float staticSwitch14_g23627 = ObjectData20_g23627;
			#endif
			float Vertex_SizeFade1740_g23588 = staticSwitch14_g23627;
			float4x4 break19_g23618 = unity_ObjectToWorld;
			float3 appendResult20_g23618 = (float3(break19_g23618[ 0 ][ 3 ] , break19_g23618[ 1 ][ 3 ] , break19_g23618[ 2 ][ 3 ]));
			half3 Off19_g23620 = appendResult20_g23618;
			float4 transform68_g23618 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23619 = (float3(v.texcoord.z , 0.0 , v.texcoord.w));
			float4 transform62_g23618 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23619 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23618 = ( (transform68_g23618).xyz - (transform62_g23618).xyz );
			half3 On20_g23620 = ObjectPositionWithPivots28_g23618;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23620 = On20_g23620;
			#else
				float3 staticSwitch14_g23620 = Off19_g23620;
			#endif
			half3 ObjectData20_g23621 = staticSwitch14_g23620;
			half3 WorldData19_g23621 = Off19_g23620;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23621 = WorldData19_g23621;
			#else
				float3 staticSwitch14_g23621 = ObjectData20_g23621;
			#endif
			float3 temp_output_42_0_g23618 = staticSwitch14_g23621;
			half3 ObjectData20_g23624 = temp_output_42_0_g23618;
			half3 WorldData19_g23624 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23624 = WorldData19_g23624;
			#else
				float3 staticSwitch14_g23624 = ObjectData20_g23624;
			#endif
			float4 tex2DNode7_g23617 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23624).xz ) ), 0.0 );
			half Global_ExtrasTex_G305_g23588 = tex2DNode7_g23617.g;
			float lerpResult346_g23588 = lerp( 1.0 , Global_ExtrasTex_G305_g23588 , _GlobalSize);
			float ObjectData20_g23612 = ( lerpResult346_g23588 * _LocalSize );
			float WorldData19_g23612 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23612 = WorldData19_g23612;
			#else
				float staticSwitch14_g23612 = ObjectData20_g23612;
			#endif
			half Vertex_Size1741_g23588 = staticSwitch14_g23612;
			float3 normalizeResult2696_g23588 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float3 break2709_g23588 = cross( normalizeResult2696_g23588 , half3(0,1,0) );
			float3 appendResult2710_g23588 = (float3(-break2709_g23588.z , 0.0 , break2709_g23588.x));
			float3 appendResult2667_g23588 = (float3(frac( ase_worldPos.x ) , 0.5 , frac( ase_worldPos.z )));
			float3 normalizeResult2210_g23588 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float dotResult2212_g23588 = dot( normalizeResult2210_g23588 , float3(0,1,0) );
			half Mask_HView2656_g23588 = abs( dotResult2212_g23588 );
			float saferPower2652_g23588 = max( Mask_HView2656_g23588 , 0.0001 );
			half3 Grass_Coverage2661_g23588 = ( ( ( mul( unity_WorldToObject, float4( appendResult2710_g23588 , 0.0 ) ).xyz * ( _GrassPerspectivePushValue + _GrassCat ) ) + ( (appendResult2667_g23588*2.0 + -1.0) * _GrassPerspectiveNoiseValue ) ) * v.color.a * pow( saferPower2652_g23588 , _GrassPerspectiveAngleValue ) );
			float3 Final_VertexPosition890_g23588 = ( ( ( staticSwitch14_g23614 * Vertex_SizeFade1740_g23588 * Vertex_Size1741_g23588 ) + Mesh_PivotsOS2291_g23588 + Grass_Coverage2661_g23588 ) + ( _IsStandardPipeline * 0.0 ) );
			v.vertex.xyz = Final_VertexPosition890_g23588;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			half2 Main_UVs15_g23588 = ( ( i.uv_texcoord * (_MainUVs).xy ) + (_MainUVs).zw );
			float4 tex2DNode117_g23588 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g23588 );
			float2 appendResult88_g23611 = (float2(tex2DNode117_g23588.a , tex2DNode117_g23588.g));
			float2 temp_output_90_0_g23611 = ( (appendResult88_g23611*2.0 + -1.0) * _MainNormalValue );
			float3 appendResult91_g23611 = (float3(temp_output_90_0_g23611 , 1.0));
			float3 Main_Normal137_g23588 = appendResult91_g23611;
			float3 temp_output_13_0_g23615 = Main_Normal137_g23588;
			float3 switchResult12_g23615 = (((i.ASEVFace>0)?(temp_output_13_0_g23615):(( temp_output_13_0_g23615 * _render_normals_options ))));
			half3 Blend_Normal312_g23588 = switchResult12_g23615;
			half3 Final_Normal366_g23588 = Blend_Normal312_g23588;
			o.Normal = Final_Normal366_g23588;
			float4 tex2DNode29_g23588 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g23588 );
			float4 temp_output_51_0_g23588 = ( _MainColor * tex2DNode29_g23588 );
			half3 Main_AlbedoRaw99_g23588 = (temp_output_51_0_g23588).rgb;
			float4x4 break19_g23632 = unity_ObjectToWorld;
			float3 appendResult20_g23632 = (float3(break19_g23632[ 0 ][ 3 ] , break19_g23632[ 1 ][ 3 ] , break19_g23632[ 2 ][ 3 ]));
			half3 Off19_g23634 = appendResult20_g23632;
			float4 ase_vertex4Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 transform68_g23632 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 appendResult60_g23633 = (float3(i.uv_tex4coord.z , 0.0 , i.uv_tex4coord.w));
			float4 transform62_g23632 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23633 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23632 = ( (transform68_g23632).xyz - (transform62_g23632).xyz );
			half3 On20_g23634 = ObjectPositionWithPivots28_g23632;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23634 = On20_g23634;
			#else
				float3 staticSwitch14_g23634 = Off19_g23634;
			#endif
			half3 ObjectData20_g23635 = staticSwitch14_g23634;
			half3 WorldData19_g23635 = Off19_g23634;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23635 = WorldData19_g23635;
			#else
				float3 staticSwitch14_g23635 = ObjectData20_g23635;
			#endif
			float3 temp_output_42_0_g23632 = staticSwitch14_g23635;
			half3 ObjectData20_g23631 = temp_output_42_0_g23632;
			float3 ase_worldPos = i.worldPos;
			half3 WorldData19_g23631 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23631 = WorldData19_g23631;
			#else
				float3 staticSwitch14_g23631 = ObjectData20_g23631;
			#endif
			float4 tex2DNode7_g23630 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23631).xz ) ) );
			half3 Global_ColorsTex_RGB1700_g23588 = (tex2DNode7_g23630).rgb;
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g23613 = 2.0;
			#else
				float staticSwitch1_g23613 = 4.594794;
			#endif
			float lerpResult2103_g23588 = lerp( 1.0 , ( 1.0 - i.vertexColor.a ) , _ColorsMaskValue);
			float3 lerpResult108_g23588 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g23588 * staticSwitch1_g23613 ) ) , ( _GlobalColors * lerpResult2103_g23588 ));
			half3 Global_Colors1954_g23588 = lerpResult108_g23588;
			float3 temp_output_123_0_g23588 = ( Main_AlbedoRaw99_g23588 * Global_Colors1954_g23588 );
			half3 Main_AlbedoColored863_g23588 = temp_output_123_0_g23588;
			half3 Blend_Albedo265_g23588 = Main_AlbedoColored863_g23588;
			float3 temp_cast_1 = (0.5).xxx;
			float3 temp_output_799_0_g23588 = (_SubsurfaceColor).rgb;
			half Global_ColorsTex_A1701_g23588 = tex2DNode7_g23630.a;
			half Global_HealthinessValue1780_g23588 = _GlobalHealthiness;
			float lerpResult1720_g23588 = lerp( 1.0 , Global_ColorsTex_A1701_g23588 , Global_HealthinessValue1780_g23588);
			float3 lerpResult1698_g23588 = lerp( temp_cast_1 , temp_output_799_0_g23588 , lerpResult1720_g23588);
			half3 Subsurface_Color1722_g23588 = lerpResult1698_g23588;
			float lerpResult1779_g23588 = lerp( 1.0 , Global_ColorsTex_A1701_g23588 , Global_HealthinessValue1780_g23588);
			half Autoregister_SubsurfaceSpace2238_g23588 = _SubsurfaceCat;
			half Subsurface_Intensity1752_g23588 = ( ( _SubsurfaceValue * lerpResult1779_g23588 ) + Autoregister_SubsurfaceSpace2238_g23588 );
			half Subsurface_Mask1557_g23588 = 1.0;
			half Overlay_Mask_Subsurface1492_g23588 = 0.0;
			half3 Subsurface_Transmission884_g23588 = ( Subsurface_Color1722_g23588 * Subsurface_Intensity1752_g23588 * Subsurface_Mask1557_g23588 * ( 1.0 - Overlay_Mask_Subsurface1492_g23588 ) );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 normalizeResult1983_g23588 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float dotResult785_g23588 = dot( -ase_worldlightDir , normalizeResult1983_g23588 );
			float saferPower1624_g23588 = max( (dotResult785_g23588*0.5 + 0.5) , 0.0001 );
			#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g23588 = 0.0;
			#else
				float staticSwitch1602_g23588 = ( pow( saferPower1624_g23588 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
			#endif
			half Mask_Subsurface_View782_g23588 = staticSwitch1602_g23588;
			half3 Subsurface_Deferred1693_g23588 = ( Subsurface_Transmission884_g23588 * Mask_Subsurface_View782_g23588 );
			half3 Blend_AlbedoAndSubsurface149_g23588 = ( Blend_Albedo265_g23588 + Subsurface_Deferred1693_g23588 );
			half3 Global_OverlayColor1758_g23588 = (TVE_OverlayColor).rgb;
			float2 break93_g23611 = temp_output_90_0_g23611;
			half Main_NormalY2095_g23588 = break93_g23611.y;
			half Overlay_Contrast1405_g23588 = _OverlayContrast;
			half Global_OverlayIntensity154_g23588 = TVE_OverlayIntensity;
			float4x4 break19_g23618 = unity_ObjectToWorld;
			float3 appendResult20_g23618 = (float3(break19_g23618[ 0 ][ 3 ] , break19_g23618[ 1 ][ 3 ] , break19_g23618[ 2 ][ 3 ]));
			half3 Off19_g23620 = appendResult20_g23618;
			float4 transform68_g23618 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23619 = (float3(i.uv_tex4coord.z , 0.0 , i.uv_tex4coord.w));
			float4 transform62_g23618 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23619 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23618 = ( (transform68_g23618).xyz - (transform62_g23618).xyz );
			half3 On20_g23620 = ObjectPositionWithPivots28_g23618;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23620 = On20_g23620;
			#else
				float3 staticSwitch14_g23620 = Off19_g23620;
			#endif
			half3 ObjectData20_g23621 = staticSwitch14_g23620;
			half3 WorldData19_g23621 = Off19_g23620;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23621 = WorldData19_g23621;
			#else
				float3 staticSwitch14_g23621 = ObjectData20_g23621;
			#endif
			float3 temp_output_42_0_g23618 = staticSwitch14_g23621;
			half3 ObjectData20_g23624 = temp_output_42_0_g23618;
			half3 WorldData19_g23624 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23624 = WorldData19_g23624;
			#else
				float3 staticSwitch14_g23624 = ObjectData20_g23624;
			#endif
			float4 tex2DNode7_g23617 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23624).xz ) ) );
			half Global_ExtrasTex_B156_g23588 = tex2DNode7_g23617.b;
			float temp_output_1025_0_g23588 = ( Global_OverlayIntensity154_g23588 * _GlobalOverlay * Global_ExtrasTex_B156_g23588 );
			float Mesh_Variation16_g23588 = i.vertexColor.r;
			float lerpResult1065_g23588 = lerp( 1.0 , Mesh_Variation16_g23588 , _OverlayVariation);
			half Overlay_Commons1365_g23588 = ( temp_output_1025_0_g23588 * lerpResult1065_g23588 );
			half Overlay_Mask269_g23588 = saturate( ( saturate( ( i.vertexColor.a + ( Main_NormalY2095_g23588 * Overlay_Contrast1405_g23588 ) ) ) - ( 1.0 - Overlay_Commons1365_g23588 ) ) );
			float3 lerpResult336_g23588 = lerp( Blend_AlbedoAndSubsurface149_g23588 , Global_OverlayColor1758_g23588 , Overlay_Mask269_g23588);
			half3 Final_Albedo359_g23588 = lerpResult336_g23588;
			half Main_Alpha316_g23588 = (temp_output_51_0_g23588).a;
			float lerpResult354_g23588 = lerp( 1.0 , Main_Alpha316_g23588 , _render_premul);
			half Final_Premultiply355_g23588 = lerpResult354_g23588;
			o.Albedo = ( Final_Albedo359_g23588 * Final_Premultiply355_g23588 );
			half Global_Wetness1016_g23588 = ( TVE_Wetness * _GlobalWetness );
			half Global_ExtrasTex_A1033_g23588 = tex2DNode7_g23617.a;
			float lerpResult1037_g23588 = lerp( _ObjectSmoothnessValue , saturate( ( _ObjectSmoothnessValue + Global_Wetness1016_g23588 ) ) , Global_ExtrasTex_A1033_g23588);
			o.Smoothness = lerpResult1037_g23588;
			half Mesh_Occlusion318_g23588 = i.vertexColor.g;
			float saferPower1201_g23588 = max( Mesh_Occlusion318_g23588 , 0.0001 );
			half Vertex_Occlusion648_g23588 = pow( saferPower1201_g23588 , _ObjectOcclusionValue );
			o.Occlusion = Vertex_Occlusion648_g23588;
			o.Alpha = Main_Alpha316_g23588;
			half Main_AlphaRaw1203_g23588 = tex2DNode29_g23588.a;
			float lerpResult2262_g23588 = lerp( 0.9 , Mesh_Variation16_g23588 , _LeavesVariationValue);
			half Global_ExtrasTex_R174_g23588 = tex2DNode7_g23617.r;
			float lerpResult2624_g23588 = lerp( 1.0 , Global_ExtrasTex_R174_g23588 , _GlobalLeaves);
			half AlphaTreshold2132_g23588 = _Cutoff;
			half Mask_Leaves315_g23588 = ( ( (lerpResult2262_g23588*0.5 + 0.5) - ( 1.0 - ( lerpResult2624_g23588 * _LocalLeaves ) ) ) + AlphaTreshold2132_g23588 );
			half Alpha5_g23596 = ( Main_AlphaRaw1203_g23588 * Mask_Leaves315_g23588 );
			#ifdef _ALPHATEST_ON
				float staticSwitch2_g23596 = Alpha5_g23596;
			#else
				float staticSwitch2_g23596 = 1.0;
			#endif
			half Final_Clip914_g23588 = staticSwitch2_g23596;
			clip( Final_Clip914_g23588 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=18500
1927;7;1906;1014;2710.349;992.4984;1;True;False
Node;AmplifyShaderEditor.FunctionNode;529;-1856,256;Inherit;False;Feature Pivots Support;178;;23587;8da5867b3f9f1834693af40d3eff73f4;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;525;-2176,256;Inherit;False;Feature Batching Support;176;;23586;d914b3a554b05ab4da8c1d2a8ce94c0a;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;271;-1584,-896;Half;False;Property;_IsLitShader;_IsLitShader;183;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;530;-2176,-384;Inherit;False;Base Shader;1;;23588;856f7164d1c579d43a5cf4968a75ca43;52,1271,0,1300,0,1298,0,1962,1,1708,1,1712,1,1964,1,1969,1,1723,1,1719,1,893,1,1745,1,1742,1,1715,1,1728,1,1714,1,1718,1,1717,1,1732,0,916,0,1949,1,1762,0,1763,0,1776,1,1646,1,1690,1,1757,0,1669,0,1981,0,1759,1,2172,0,2658,1,1734,0,1966,0,1735,0,1968,0,1737,0,1733,0,1736,0,1550,0,878,0,860,1,2260,1,2261,1,2032,0,2054,0,2033,0,2057,0,2060,0,2036,0,2062,1,2039,1;0;16;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534;FLOAT3;2075
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Grass Simple Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-1792,-896;Half;False;Property;_IsSimpleShader;_IsSimpleShader;181;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;526;-1408,-896;Half;False;Property;_IsAnyPathShader;_IsAnyPathShader;182;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;168;-1984,-896;Half;False;Property;_IsGrassShader;_IsGrassShader;180;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;188;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1536,-768;Half;False;Property;_render_dst;_render_dst;187;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1728,-768;Half;False;Property;_render_src;_render_src;186;0;Fetch;True;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-768;Half;False;Property;_render_cull;_render_cull;185;0;Fetch;True;3;Both;0;Back;1;Front;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-768;Half;False;Property;_Cutoff;_Cutoff;184;1;[HideInInspector];Fetch;True;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;0;Standard;BOXOPHOBIC/The Vegetation Engine/Vegetation/Grass Simple Lit;False;False;False;False;False;True;False;True;False;False;False;False;True;True;True;False;True;False;False;False;True;Back;0;True;17;0;False;-1;True;0;False;-1;-1;False;-1;False;0;Custom;0.5;True;True;0;True;Opaque;;Geometry;All;11;d3d11;glcore;gles3;metal;vulkan;xbox360;xboxone;ps4;psp2;n3ds;wiiu;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;1;0;True;20;0;True;7;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Absolute;0;;-1;-1;-1;-1;0;False;0;0;True;10;-1;0;True;21;0;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;408;-2176,128;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1024.392;100;Final;0;;0,1,0.5,1;0;0
WireConnection;0;0;530;0
WireConnection;0;1;530;528
WireConnection;0;4;530;530
WireConnection;0;5;530;531
WireConnection;0;9;530;532
WireConnection;0;10;530;653
WireConnection;0;11;530;534
ASEEND*/
//CHKSM=5E0953AA6D03FBE79242F30A7CE3D00D088D2B78
