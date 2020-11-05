// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Billboards/Cross Subsurface Lit"
{
	Properties
	{
		[StyledBanner(Cross Subsurface Lit)]_Banner("Banner", Float) = 0
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
		[StyledCategory(Billboard Settings)]_BillboardCat("[ Billboard Cat ]", Float) = 0
		_BillboardFadeHValue("Billboard Fade Horizontal", Range( 0 , 4)) = 0
		_BillboardFadeVValue("Billboard Fade Verical", Range( 0 , 4)) = 0
		[StyledCategory(Main Settings)]_MainCat("[ Main Cat ]", Float) = 0
		_MainColor("Main Color", Color) = (1,1,1,1)
		[NoScaleOffset]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset]_MainNormalTex("Main Normal", 2D) = "gray" {}
		[NoScaleOffset]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainOcclusionValue("Main Occlusion (G)", Range( 0 , 1)) = 1
		_MainSmoothnessValue("Main Smoothness (A)", Range( 0 , 1)) = 1
		[StyledCategory(Misc Settings)]_MiscCat("[ Misc Cat ]", Float) = 0
		[HDR]_LocalColors("Local Colors", Color) = (1,1,1,1)
		_LocalSize("Local Size", Range( 0 , 1)) = 1
		[StyledSpace(10)]_MiscSpace("# Misc Space", Float) = 0
		_ColorsMaskValue("Colors Use Mask", Range( 0 , 1)) = 1
		_OverlayContrast("Overlay Contrast", Range( 0 , 10)) = 1
		[StyledCategory(Motion Settings)]_MotionCat("[ Motion Cat ]", Float) = 0
		_Motion_10("Motion Bending", Range( 0 , 1)) = 1
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
		[StyledMessage(Warning, When batching support is enabled the object position is lost and some features will not work as expected. Check the documentation for more information., _material_batching, 1 , 0,5)]_BatchingMessage("# Batching Message", Float) = 0
		[HideInInspector] _tex4coord2( "", 2D ) = "white" {}
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
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsLitShader("_IsLitShader", Float) = 1
		[HideInInspector]_IsForwardPathShader("_IsForwardPathShader", Float) = 1
		[HideInInspector]_IsCrossShader("_IsCrossShader", Float) = 1
		[HideInInspector]_Cutoff("_Cutoff", Float) = 0.5
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" "DisableBatching" = "True" }
		Cull [_render_cull]
		ZWrite [_render_zw]
		Blend [_render_src] [_render_dst]
		
		CGINCLUDE
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma shader_feature_local _ALPHATEST_ON
		#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA
		  
		//SHADER INJECTION POINT BEGIN
		//SHADER INJECTION POINT END
		    
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
		#endif//ASE Sampling Macros

		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
			half ASEVFace : VFACE;
			float4 uv2_tex4coord2;
			float4 vertexColor : COLOR;
			float3 worldNormal;
			INTERNAL_DATA
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

		uniform half _IsForwardPathShader;
		uniform half _material_batching;
		uniform half _IsStandardShader;
		uniform half _ObjectThicknessValue;
		uniform half _MiscSpace;
		uniform float _SubsurfaceMode;
		uniform half _render_dst;
		uniform float _MotionSpeed_32;
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
		uniform float _MotionScale_20;
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
		uniform half _IsLitShader;
		uniform half _Banner;
		uniform half _IsCrossShader;
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
		uniform half _OverlayContrast;
		uniform half TVE_OverlayIntensity;
		uniform half _GlobalOverlay;
		uniform half _render_premul;
		uniform half _MainSmoothnessValue;
		uniform half TVE_OverlaySmoothness;
		uniform float TVE_Wetness;
		uniform half _GlobalWetness;
		uniform half _MainOcclusionValue;
		uniform half _BillboardFadeHValue;
		uniform half _BillboardFadeVValue;
		uniform half _BillboardCat;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			half3 Off19_g23844 = half3(0,0,0);
			float3 appendResult60_g23859 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			half3 On20_g23844 = ( appendResult60_g23859 * _VertexPivotMode );
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23844 = On20_g23844;
			#else
				float3 staticSwitch14_g23844 = Off19_g23844;
			#endif
			half3 ObjectData20_g23845 = staticSwitch14_g23844;
			half3 WorldData19_g23845 = Off19_g23844;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23845 = WorldData19_g23845;
			#else
				float3 staticSwitch14_g23845 = ObjectData20_g23845;
			#endif
			float3 Mesh_PivotsOS2291_g23832 = staticSwitch14_g23845;
			float3 temp_output_2283_0_g23832 = ( ase_vertex3Pos - Mesh_PivotsOS2291_g23832 );
			half3 VertexPos40_g23871 = temp_output_2283_0_g23832;
			float3 appendResult74_g23871 = (float3(VertexPos40_g23871.x , 0.0 , 0.0));
			half3 VertexPosRotationAxis50_g23871 = appendResult74_g23871;
			float3 break84_g23871 = VertexPos40_g23871;
			float3 appendResult81_g23871 = (float3(0.0 , break84_g23871.y , break84_g23871.z));
			half3 VertexPosOtherAxis82_g23871 = appendResult81_g23871;
			float ObjectData20_g23856 = 3.14;
			float Bounds_Height374_g23832 = _MaxBoundsInfo.y;
			float WorldData19_g23856 = ( Bounds_Height374_g23832 * 3.14 );
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23856 = WorldData19_g23856;
			#else
				float staticSwitch14_g23856 = ObjectData20_g23856;
			#endif
			float Motion_Max_Bending1133_g23832 = staticSwitch14_g23856;
			float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
			float4x4 break19_g23884 = unity_ObjectToWorld;
			float3 appendResult20_g23884 = (float3(break19_g23884[ 0 ][ 3 ] , break19_g23884[ 1 ][ 3 ] , break19_g23884[ 2 ][ 3 ]));
			half3 Off19_g23886 = appendResult20_g23884;
			float4 ase_vertex4Pos = v.vertex;
			float4 transform68_g23884 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23885 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g23884 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23885 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23884 = ( (transform68_g23884).xyz - (transform62_g23884).xyz );
			half3 On20_g23886 = ObjectPositionWithPivots28_g23884;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23886 = On20_g23886;
			#else
				float3 staticSwitch14_g23886 = Off19_g23886;
			#endif
			half3 ObjectData20_g23887 = staticSwitch14_g23886;
			half3 WorldData19_g23887 = Off19_g23886;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23887 = WorldData19_g23887;
			#else
				float3 staticSwitch14_g23887 = ObjectData20_g23887;
			#endif
			float3 temp_output_42_0_g23884 = staticSwitch14_g23887;
			half3 ObjectData20_g23890 = temp_output_42_0_g23884;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			half3 WorldData19_g23890 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23890 = WorldData19_g23890;
			#else
				float3 staticSwitch14_g23890 = ObjectData20_g23890;
			#endif
			float2 panner73_g23883 = ( _Time.y * temp_cast_0 + ( (staticSwitch14_g23890).xz * TVE_NoiseSize ));
			float4 temp_cast_2 = (TVE_NoiseContrast).xxxx;
			float4 break142_g23883 = pow( abs( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, samplerTVE_NoiseTex, panner73_g23883, 0.0 ) ) , temp_cast_2 );
			half Global_NoiseTex_R34_g23832 = break142_g23883.r;
			float4x4 break19_g23910 = unity_ObjectToWorld;
			float3 appendResult20_g23910 = (float3(break19_g23910[ 0 ][ 3 ] , break19_g23910[ 1 ][ 3 ] , break19_g23910[ 2 ][ 3 ]));
			half3 Off19_g23912 = appendResult20_g23910;
			float4 transform68_g23910 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23911 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g23910 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23911 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23910 = ( (transform68_g23910).xyz - (transform62_g23910).xyz );
			half3 On20_g23912 = ObjectPositionWithPivots28_g23910;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23912 = On20_g23912;
			#else
				float3 staticSwitch14_g23912 = Off19_g23912;
			#endif
			half3 ObjectData20_g23913 = staticSwitch14_g23912;
			half3 WorldData19_g23913 = Off19_g23912;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23913 = WorldData19_g23913;
			#else
				float3 staticSwitch14_g23913 = ObjectData20_g23913;
			#endif
			float3 temp_output_42_0_g23910 = staticSwitch14_g23913;
			half3 ObjectData20_g23908 = temp_output_42_0_g23910;
			half3 WorldData19_g23908 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23908 = WorldData19_g23908;
			#else
				float3 staticSwitch14_g23908 = ObjectData20_g23908;
			#endif
			float4 break322_g23846 = SAMPLE_TEXTURE2D_LOD( TVE_MotionTex, samplerTVE_MotionTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23908).xz ) ), 0.0 );
			float3 appendResult323_g23846 = (float3(break322_g23846.x , 0.0 , break322_g23846.y));
			float3 temp_output_324_0_g23846 = (appendResult323_g23846*2.0 + -1.0);
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			half3 ObjectData20_g23847 = ( mul( unity_WorldToObject, float4( temp_output_324_0_g23846 , 0.0 ) ).xyz * ase_parentObjectScale );
			half3 WorldData19_g23847 = temp_output_324_0_g23846;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23847 = WorldData19_g23847;
			#else
				float3 staticSwitch14_g23847 = ObjectData20_g23847;
			#endif
			half2 Motion_DirectionOS39_g23832 = (staticSwitch14_g23847).xz;
			half Motion_Power2223_g23832 = break322_g23846.z;
			half Motion_Use1056_g23832 = ( _Motion_10 + _MotionCat );
			half Input_Speed62_g23925 = _MotionSpeed_10;
			float mulTime373_g23925 = _Time.y * Input_Speed62_g23925;
			float temp_output_349_0_g23925 = ( _MotionVariation_10 * v.color.r );
			float4x4 break19_g23926 = unity_ObjectToWorld;
			float3 appendResult20_g23926 = (float3(break19_g23926[ 0 ][ 3 ] , break19_g23926[ 1 ][ 3 ] , break19_g23926[ 2 ][ 3 ]));
			half3 Off19_g23928 = appendResult20_g23926;
			float4 transform68_g23926 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23927 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g23926 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23927 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23926 = ( (transform68_g23926).xyz - (transform62_g23926).xyz );
			half3 On20_g23928 = ObjectPositionWithPivots28_g23926;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23928 = On20_g23928;
			#else
				float3 staticSwitch14_g23928 = Off19_g23928;
			#endif
			half3 ObjectData20_g23929 = staticSwitch14_g23928;
			half3 WorldData19_g23929 = Off19_g23928;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23929 = WorldData19_g23929;
			#else
				float3 staticSwitch14_g23929 = ObjectData20_g23929;
			#endif
			float3 temp_output_42_0_g23926 = staticSwitch14_g23929;
			float3 break9_g23926 = temp_output_42_0_g23926;
			float ObjectData20_g23932 = ( temp_output_349_0_g23925 + ( break9_g23926.x + break9_g23926.z ) );
			float WorldData19_g23932 = temp_output_349_0_g23925;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23932 = WorldData19_g23932;
			#else
				float staticSwitch14_g23932 = ObjectData20_g23932;
			#endif
			half Motion_Variation284_g23925 = staticSwitch14_g23932;
			float2 appendResult344_g23925 = (float2(ase_worldPos.x , ase_worldPos.z));
			float2 Motion_Scale287_g23925 = ( _MotionScale_10 * appendResult344_g23925 );
			half2 Sine_MinusOneToOne281_g23925 = sin( ( mulTime373_g23925 + Motion_Variation284_g23925 + Motion_Scale287_g23925 ) );
			float2 temp_cast_8 = (1.0).xx;
			half Input_Turbulence327_g23925 = Global_NoiseTex_R34_g23832;
			float2 lerpResult321_g23925 = lerp( Sine_MinusOneToOne281_g23925 , temp_cast_8 , Input_Turbulence327_g23925);
			half2 Motion_Bending2258_g23832 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g23832 ) * TVE_MotionAmplitude_10 * Global_NoiseTex_R34_g23832 * Motion_DirectionOS39_g23832 * Motion_Power2223_g23832 * Motion_Use1056_g23832 * lerpResult321_g23925 );
			half Motion_UseInteraction2097_g23832 = _Motion_Interaction;
			half Motion_InteractionMask66_g23832 = break322_g23846.w;
			half2 Motion_Interaction53_g23832 = ( _InteractionAmplitude * Motion_Max_Bending1133_g23832 * Motion_UseInteraction2097_g23832 * Motion_InteractionMask66_g23832 * Motion_InteractionMask66_g23832 * Motion_DirectionOS39_g23832 );
			float2 lerpResult109_g23832 = lerp( Motion_Bending2258_g23832 , Motion_Interaction53_g23832 , Motion_InteractionMask66_g23832);
			half Mesh_Motion_182_g23832 = v.texcoord3.x;
			float2 break143_g23832 = ( lerpResult109_g23832 * Mesh_Motion_182_g23832 );
			half Motion_Z190_g23832 = break143_g23832.y;
			half Angle44_g23871 = Motion_Z190_g23832;
			half3 VertexPos40_g23858 = ( VertexPosRotationAxis50_g23871 + ( VertexPosOtherAxis82_g23871 * cos( Angle44_g23871 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g23871 ) * sin( Angle44_g23871 ) ) );
			float3 appendResult74_g23858 = (float3(0.0 , 0.0 , VertexPos40_g23858.z));
			half3 VertexPosRotationAxis50_g23858 = appendResult74_g23858;
			float3 break84_g23858 = VertexPos40_g23858;
			float3 appendResult81_g23858 = (float3(break84_g23858.x , break84_g23858.y , 0.0));
			half3 VertexPosOtherAxis82_g23858 = appendResult81_g23858;
			half Motion_X216_g23832 = break143_g23832.x;
			half Angle44_g23858 = -Motion_X216_g23832;
			float3 Vertex_Motion_Object833_g23832 = ( VertexPosRotationAxis50_g23858 + ( VertexPosOtherAxis82_g23858 * cos( Angle44_g23858 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g23858 ) * sin( Angle44_g23858 ) ) );
			half3 ObjectData20_g23865 = Vertex_Motion_Object833_g23832;
			float3 appendResult2043_g23832 = (float3(Motion_X216_g23832 , 0.0 , Motion_Z190_g23832));
			float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
			float3 Vertex_Motion_World1118_g23832 = ( mul( unity_WorldToObject, float4( ( ase_vertex3Pos + appendResult2043_g23832 ) , 0.0 ) ).xyz * ase_objectScale );
			half3 WorldData19_g23865 = Vertex_Motion_World1118_g23832;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23865 = WorldData19_g23865;
			#else
				float3 staticSwitch14_g23865 = ObjectData20_g23865;
			#endif
			float4x4 break19_g23837 = unity_ObjectToWorld;
			float3 appendResult20_g23837 = (float3(break19_g23837[ 0 ][ 3 ] , break19_g23837[ 1 ][ 3 ] , break19_g23837[ 2 ][ 3 ]));
			half3 Off19_g23839 = appendResult20_g23837;
			float4 transform68_g23837 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23838 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g23837 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23838 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23837 = ( (transform68_g23837).xyz - (transform62_g23837).xyz );
			half3 On20_g23839 = ObjectPositionWithPivots28_g23837;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23839 = On20_g23839;
			#else
				float3 staticSwitch14_g23839 = Off19_g23839;
			#endif
			half3 ObjectData20_g23840 = staticSwitch14_g23839;
			half3 WorldData19_g23840 = Off19_g23839;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23840 = WorldData19_g23840;
			#else
				float3 staticSwitch14_g23840 = ObjectData20_g23840;
			#endif
			float3 temp_output_42_0_g23837 = staticSwitch14_g23840;
			float temp_output_7_0_g23873 = TVE_SizeFadeEnd;
			float ObjectData20_g23872 = saturate( ( ( ( distance( _WorldSpaceCameraPos , temp_output_42_0_g23837 ) * _GlobalSizeFade ) - temp_output_7_0_g23873 ) / ( TVE_SizeFadeStart - temp_output_7_0_g23873 ) ) );
			float WorldData19_g23872 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23872 = WorldData19_g23872;
			#else
				float staticSwitch14_g23872 = ObjectData20_g23872;
			#endif
			float Vertex_SizeFade1740_g23832 = staticSwitch14_g23872;
			float4x4 break19_g23875 = unity_ObjectToWorld;
			float3 appendResult20_g23875 = (float3(break19_g23875[ 0 ][ 3 ] , break19_g23875[ 1 ][ 3 ] , break19_g23875[ 2 ][ 3 ]));
			half3 Off19_g23877 = appendResult20_g23875;
			float4 transform68_g23875 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23876 = (float3(v.texcoord1.z , 0.0 , v.texcoord1.w));
			float4 transform62_g23875 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23876 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23875 = ( (transform68_g23875).xyz - (transform62_g23875).xyz );
			half3 On20_g23877 = ObjectPositionWithPivots28_g23875;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23877 = On20_g23877;
			#else
				float3 staticSwitch14_g23877 = Off19_g23877;
			#endif
			half3 ObjectData20_g23878 = staticSwitch14_g23877;
			half3 WorldData19_g23878 = Off19_g23877;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23878 = WorldData19_g23878;
			#else
				float3 staticSwitch14_g23878 = ObjectData20_g23878;
			#endif
			float3 temp_output_42_0_g23875 = staticSwitch14_g23878;
			half3 ObjectData20_g23881 = temp_output_42_0_g23875;
			half3 WorldData19_g23881 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23881 = WorldData19_g23881;
			#else
				float3 staticSwitch14_g23881 = ObjectData20_g23881;
			#endif
			float4 tex2DNode7_g23874 = SAMPLE_TEXTURE2D_LOD( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23881).xz ) ), 0.0 );
			half Global_ExtrasTex_G305_g23832 = tex2DNode7_g23874.g;
			float lerpResult346_g23832 = lerp( 1.0 , Global_ExtrasTex_G305_g23832 , _GlobalSize);
			float ObjectData20_g23868 = ( lerpResult346_g23832 * _LocalSize );
			float WorldData19_g23868 = 1.0;
			#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g23868 = WorldData19_g23868;
			#else
				float staticSwitch14_g23868 = ObjectData20_g23868;
			#endif
			half Vertex_Size1741_g23832 = staticSwitch14_g23868;
			float3 Final_VertexPosition890_g23832 = ( ( ( staticSwitch14_g23865 * Vertex_SizeFade1740_g23832 * Vertex_Size1741_g23832 ) + Mesh_PivotsOS2291_g23832 ) + ( _IsStandardPipeline * 0.0 ) );
			v.vertex.xyz = Final_VertexPosition890_g23832;
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
			half2 Main_UVs15_g23832 = ( ( i.uv_texcoord * (_MainUVs).xy ) + (_MainUVs).zw );
			float4 tex2DNode117_g23832 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainAlbedoTex, Main_UVs15_g23832 );
			float2 appendResult88_g23863 = (float2(tex2DNode117_g23832.a , tex2DNode117_g23832.g));
			float2 temp_output_90_0_g23863 = ( (appendResult88_g23863*2.0 + -1.0) * _MainNormalValue );
			float3 appendResult91_g23863 = (float3(temp_output_90_0_g23863 , 1.0));
			float3 Main_Normal137_g23832 = appendResult91_g23863;
			float3 temp_output_13_0_g23866 = Main_Normal137_g23832;
			float3 switchResult12_g23866 = (((i.ASEVFace>0)?(temp_output_13_0_g23866):(( temp_output_13_0_g23866 * _render_normals_options ))));
			half3 Blend_Normal312_g23832 = switchResult12_g23866;
			half3 Final_Normal366_g23832 = Blend_Normal312_g23832;
			o.Normal = Final_Normal366_g23832;
			float4 tex2DNode29_g23832 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g23832 );
			float4 temp_output_51_0_g23832 = ( _MainColor * tex2DNode29_g23832 );
			half3 Main_AlbedoRaw99_g23832 = (temp_output_51_0_g23832).rgb;
			float4x4 break19_g23918 = unity_ObjectToWorld;
			float3 appendResult20_g23918 = (float3(break19_g23918[ 0 ][ 3 ] , break19_g23918[ 1 ][ 3 ] , break19_g23918[ 2 ][ 3 ]));
			half3 Off19_g23920 = appendResult20_g23918;
			float4 ase_vertex4Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 transform68_g23918 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 appendResult60_g23919 = (float3(i.uv2_tex4coord2.z , 0.0 , i.uv2_tex4coord2.w));
			float4 transform62_g23918 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23919 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23918 = ( (transform68_g23918).xyz - (transform62_g23918).xyz );
			half3 On20_g23920 = ObjectPositionWithPivots28_g23918;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23920 = On20_g23920;
			#else
				float3 staticSwitch14_g23920 = Off19_g23920;
			#endif
			half3 ObjectData20_g23921 = staticSwitch14_g23920;
			half3 WorldData19_g23921 = Off19_g23920;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23921 = WorldData19_g23921;
			#else
				float3 staticSwitch14_g23921 = ObjectData20_g23921;
			#endif
			float3 temp_output_42_0_g23918 = staticSwitch14_g23921;
			half3 ObjectData20_g23917 = temp_output_42_0_g23918;
			float3 ase_worldPos = i.worldPos;
			half3 WorldData19_g23917 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23917 = WorldData19_g23917;
			#else
				float3 staticSwitch14_g23917 = ObjectData20_g23917;
			#endif
			float4 tex2DNode7_g23916 = SAMPLE_TEXTURE2D( TVE_ColorsTex, samplerTVE_ColorsTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23917).xz ) ) );
			half3 Global_ColorsTex_RGB1700_g23832 = (tex2DNode7_g23916).rgb;
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g23864 = 2.0;
			#else
				float staticSwitch1_g23864 = 4.594794;
			#endif
			float4 tex2DNode35_g23832 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainAlbedoTex, Main_UVs15_g23832 );
			half Main_Mask57_g23832 = tex2DNode35_g23832.b;
			float temp_output_7_0_g23853 = _SubsurfaceMinValue;
			half Subsurface_Mask1557_g23832 = saturate( ( ( Main_Mask57_g23832 - temp_output_7_0_g23853 ) / ( _SubsurfaceMaxValue - temp_output_7_0_g23853 ) ) );
			float lerpResult2105_g23832 = lerp( 1.0 , Subsurface_Mask1557_g23832 , _ColorsMaskValue);
			float3 lerpResult108_g23832 = lerp( float3( 1,1,1 ) , ( (_LocalColors).rgb * ( Global_ColorsTex_RGB1700_g23832 * staticSwitch1_g23864 ) ) , ( _GlobalColors * lerpResult2105_g23832 ));
			half3 Global_Colors1954_g23832 = lerpResult108_g23832;
			float3 temp_output_123_0_g23832 = ( Main_AlbedoRaw99_g23832 * Global_Colors1954_g23832 );
			half3 Main_AlbedoColored863_g23832 = temp_output_123_0_g23832;
			half3 Blend_Albedo265_g23832 = Main_AlbedoColored863_g23832;
			float3 temp_cast_1 = (0.5).xxx;
			float3 temp_output_799_0_g23832 = (_SubsurfaceColor).rgb;
			half Global_ColorsTex_A1701_g23832 = tex2DNode7_g23916.a;
			half Global_HealthinessValue1780_g23832 = _GlobalHealthiness;
			float lerpResult1720_g23832 = lerp( 1.0 , Global_ColorsTex_A1701_g23832 , Global_HealthinessValue1780_g23832);
			float3 lerpResult1698_g23832 = lerp( temp_cast_1 , temp_output_799_0_g23832 , lerpResult1720_g23832);
			half3 Subsurface_Color1722_g23832 = lerpResult1698_g23832;
			float lerpResult1779_g23832 = lerp( 1.0 , Global_ColorsTex_A1701_g23832 , Global_HealthinessValue1780_g23832);
			half Autoregister_SubsurfaceSpace2238_g23832 = _SubsurfaceCat;
			half Subsurface_Intensity1752_g23832 = ( ( _SubsurfaceValue * lerpResult1779_g23832 ) + Autoregister_SubsurfaceSpace2238_g23832 );
			half Overlay_Mask_Subsurface1492_g23832 = 0.0;
			half3 Subsurface_Transmission884_g23832 = ( Subsurface_Color1722_g23832 * Subsurface_Intensity1752_g23832 * Subsurface_Mask1557_g23832 * ( 1.0 - Overlay_Mask_Subsurface1492_g23832 ) );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 normalizeResult1983_g23832 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float dotResult785_g23832 = dot( -ase_worldlightDir , normalizeResult1983_g23832 );
			float saferPower1624_g23832 = max( (dotResult785_g23832*0.5 + 0.5) , 0.0001 );
			#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g23832 = 0.0;
			#else
				float staticSwitch1602_g23832 = ( pow( saferPower1624_g23832 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
			#endif
			half Mask_Subsurface_View782_g23832 = staticSwitch1602_g23832;
			half3 Subsurface_Forward1691_g23832 = ( Subsurface_Transmission884_g23832 * Mask_Subsurface_View782_g23832 );
			half3 Blend_AlbedoAndSubsurface149_g23832 = ( Blend_Albedo265_g23832 + Subsurface_Forward1691_g23832 );
			half3 Global_OverlayColor1758_g23832 = (TVE_OverlayColor).rgb;
			float2 break93_g23863 = temp_output_90_0_g23863;
			half Main_NormalY2095_g23832 = break93_g23863.y;
			half Overlay_Contrast1405_g23832 = _OverlayContrast;
			half Global_OverlayIntensity154_g23832 = TVE_OverlayIntensity;
			float4x4 break19_g23875 = unity_ObjectToWorld;
			float3 appendResult20_g23875 = (float3(break19_g23875[ 0 ][ 3 ] , break19_g23875[ 1 ][ 3 ] , break19_g23875[ 2 ][ 3 ]));
			half3 Off19_g23877 = appendResult20_g23875;
			float4 transform68_g23875 = mul(unity_ObjectToWorld,ase_vertex4Pos);
			float3 appendResult60_g23876 = (float3(i.uv2_tex4coord2.z , 0.0 , i.uv2_tex4coord2.w));
			float4 transform62_g23875 = mul(unity_ObjectToWorld,float4( ( ase_vertex3Pos - ( appendResult60_g23876 * _VertexPivotMode ) ) , 0.0 ));
			float3 ObjectPositionWithPivots28_g23875 = ( (transform68_g23875).xyz - (transform62_g23875).xyz );
			half3 On20_g23877 = ObjectPositionWithPivots28_g23875;
			#ifdef MATERIAL_USE_PIVOT_DATA
				float3 staticSwitch14_g23877 = On20_g23877;
			#else
				float3 staticSwitch14_g23877 = Off19_g23877;
			#endif
			half3 ObjectData20_g23878 = staticSwitch14_g23877;
			half3 WorldData19_g23878 = Off19_g23877;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23878 = WorldData19_g23878;
			#else
				float3 staticSwitch14_g23878 = ObjectData20_g23878;
			#endif
			float3 temp_output_42_0_g23875 = staticSwitch14_g23878;
			half3 ObjectData20_g23881 = temp_output_42_0_g23875;
			half3 WorldData19_g23881 = ase_worldPos;
			#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g23881 = WorldData19_g23881;
			#else
				float3 staticSwitch14_g23881 = ObjectData20_g23881;
			#endif
			float4 tex2DNode7_g23874 = SAMPLE_TEXTURE2D( TVE_ExtrasTex, samplerTVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g23881).xz ) ) );
			half Global_ExtrasTex_B156_g23832 = tex2DNode7_g23874.b;
			float temp_output_1025_0_g23832 = ( Global_OverlayIntensity154_g23832 * _GlobalOverlay * Global_ExtrasTex_B156_g23832 );
			half Overlay_Commons1365_g23832 = temp_output_1025_0_g23832;
			half Overlay_Mask269_g23832 = saturate( ( saturate( ( i.vertexColor.a + ( Main_NormalY2095_g23832 * Overlay_Contrast1405_g23832 ) ) ) - ( 1.0 - Overlay_Commons1365_g23832 ) ) );
			float3 lerpResult336_g23832 = lerp( Blend_AlbedoAndSubsurface149_g23832 , Global_OverlayColor1758_g23832 , Overlay_Mask269_g23832);
			half3 Final_Albedo359_g23832 = lerpResult336_g23832;
			half Main_Alpha316_g23832 = (temp_output_51_0_g23832).a;
			float lerpResult354_g23832 = lerp( 1.0 , Main_Alpha316_g23832 , _render_premul);
			half Final_Premultiply355_g23832 = lerpResult354_g23832;
			o.Albedo = ( Final_Albedo359_g23832 * Final_Premultiply355_g23832 );
			half Main_Smoothness227_g23832 = ( tex2DNode35_g23832.a * _MainSmoothnessValue );
			half Blend_Smoothness314_g23832 = Main_Smoothness227_g23832;
			half Global_OverlaySmoothness311_g23832 = TVE_OverlaySmoothness;
			float lerpResult343_g23832 = lerp( Blend_Smoothness314_g23832 , Global_OverlaySmoothness311_g23832 , Overlay_Mask269_g23832);
			half Final_Smoothness371_g23832 = lerpResult343_g23832;
			half Global_Wetness1016_g23832 = ( TVE_Wetness * _GlobalWetness );
			half Global_ExtrasTex_A1033_g23832 = tex2DNode7_g23874.a;
			float lerpResult1037_g23832 = lerp( Final_Smoothness371_g23832 , saturate( ( Final_Smoothness371_g23832 + Global_Wetness1016_g23832 ) ) , Global_ExtrasTex_A1033_g23832);
			o.Smoothness = lerpResult1037_g23832;
			float lerpResult240_g23832 = lerp( 1.0 , tex2DNode35_g23832.g , _MainOcclusionValue);
			half Main_Occlusion247_g23832 = lerpResult240_g23832;
			half Blend_Occlusion323_g23832 = Main_Occlusion247_g23832;
			o.Occlusion = Blend_Occlusion323_g23832;
			o.Transmission = Subsurface_Transmission884_g23832;
			o.Alpha = Main_Alpha316_g23832;
			half Main_AlphaRaw1203_g23832 = tex2DNode29_g23832.a;
			float3 normalizeResult2169_g23832 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float dotResult2161_g23832 = dot( normalizeResult2169_g23832 , (WorldNormalVector( i , half3(0.001,0.001,1) )) );
			float3 normalizeResult2210_g23832 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float dotResult2212_g23832 = dot( normalizeResult2210_g23832 , float3(0,1,0) );
			float lerpResult2221_g23832 = lerp( _BillboardFadeHValue , _BillboardFadeVValue , abs( dotResult2212_g23832 ));
			half Autoregister_BillboardSpace2239_g23832 = _BillboardCat;
			half BillboardFade2175_g23832 = ( pow( ( dotResult2161_g23832 * dotResult2161_g23832 ) , lerpResult2221_g23832 ) + Autoregister_BillboardSpace2239_g23832 );
			half Alpha5_g23852 = ( Main_AlphaRaw1203_g23832 * BillboardFade2175_g23832 );
			#ifdef _ALPHATEST_ON
				float staticSwitch2_g23852 = Alpha5_g23852;
			#else
				float staticSwitch2_g23852 = 1.0;
			#endif
			half Final_Clip914_g23832 = staticSwitch2_g23852;
			clip( Final_Clip914_g23832 - _Cutoff );
		}

		ENDCG
		CGPROGRAM
		#pragma exclude_renderers d3d9 d3d11_9x gles 
		#pragma surface surf StandardCustom keepalpha fullforwardshadows exclude_path:deferred novertexlights nodynlightmap dithercrossfade vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
		#pragma multi_compile_instancing
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			sampler3D _DitherMaskLOD;
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float4 customPack2 : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				half4 color : COLOR0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.customPack2.xyzw = customInputData.uv2_tex4coord2;
				o.customPack2.xyzw = v.texcoord1;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				o.color = v.color;
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				surfIN.uv2_tex4coord2 = IN.customPack2.xyzw;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				surfIN.vertexColor = IN.color;
				SurfaceOutputStandardCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandardCustom, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				half alphaRef = tex3D( _DitherMaskLOD, float3( vpos.xy * 0.25, o.Alpha * 0.9375 ) ).a;
				clip( alphaRef - 0.01 );
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=18500
1927;7;1906;1014;2897.271;1002.8;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;7;-1536,-768;Half;False;Property;_render_dst;_render_dst;181;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;182;0;Fetch;True;2;Opaque;0;Transparent;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-1984,-896;Half;False;Property;_IsCrossShader;_IsCrossShader;177;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-767;Half;False;Property;_Cutoff;_Cutoff;178;1;[HideInInspector];Fetch;True;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.719;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-768;Half;False;Property;_render_cull;_render_cull;179;0;Fetch;True;3;Both;0;Back;1;Front;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1728,-769;Half;False;Property;_render_src;_render_src;180;0;Fetch;True;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;129;-1792,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;174;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;267;-2176,256;Inherit;False;Feature Batching Support;172;;23831;d914b3a554b05ab4da8c1d2a8ce94c0a;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;268;-1392,-896;Half;False;Property;_IsForwardPathShader;_IsForwardPathShader;176;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Cross Subsurface Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;141;-1568,-896;Half;False;Property;_IsLitShader;_IsLitShader;175;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;353;-2176,-384;Inherit;False;Base Shader;1;;23832;856f7164d1c579d43a5cf4968a75ca43;51,1271,1,1300,1,1298,1,1962,1,1708,1,1712,3,1964,1,1969,1,1723,1,1719,1,893,0,1745,1,1742,1,1715,1,1714,1,1717,1,1728,1,1718,1,916,0,1732,0,1949,1,1763,0,1762,0,1776,0,1646,1,1690,0,1757,0,1669,1,1981,0,1759,0,2172,1,1733,0,1734,0,1736,0,1968,0,1735,0,1737,0,1966,0,1550,0,878,0,860,1,2261,1,2260,1,2032,0,2054,0,2057,0,2033,0,2036,0,2060,0,2062,0,2039,0;0;16;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534;FLOAT3;2075
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;0;Standard;BOXOPHOBIC/The Vegetation Engine/Billboards/Cross Subsurface Lit;False;False;False;False;False;True;False;True;False;False;False;False;True;True;True;False;True;False;False;False;False;Back;0;True;17;0;False;-1;False;0;False;-1;-10;False;-1;False;0;Custom;0.719;True;True;0;True;Opaque;;Geometry;ForwardOnly;11;d3d11;glcore;gles3;metal;vulkan;xbox360;xboxone;ps4;psp2;n3ds;wiiu;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;1;0;True;20;0;True;7;0;5;False;-1;10;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Absolute;0;;-1;-1;-1;-1;0;False;0;0;True;10;-1;0;True;21;0;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;266;-2176,128;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1024.392;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
WireConnection;0;0;353;0
WireConnection;0;1;353;528
WireConnection;0;4;353;530
WireConnection;0;5;353;531
WireConnection;0;6;353;1230
WireConnection;0;9;353;532
WireConnection;0;10;353;653
WireConnection;0;11;353;534
ASEEND*/
//CHKSM=1881B85427F88F24FE93713D517E654B2E7B70F7
