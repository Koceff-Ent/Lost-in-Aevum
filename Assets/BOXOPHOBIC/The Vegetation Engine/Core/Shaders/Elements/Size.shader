// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Elements/Default/Size"
{
	Properties
	{
		[StyledBanner(Size Element)]_Banner1("Banner", Float) = 0
		[StyledMessage(Info, Use the Size elements to add scale variation or combine it with seasons to add dynamic vegetation growing. Element Texture R is used as alpha mask. Particle Color R is used as values multiplier and Alpha as Element Intensity multiplier., 0,0)]_Message1("Message", Float) = 0
		[StyledCategory(Element)]_ElementCat("[ Element Cat ]", Float) = 0
		_ElementIntensity("Element Intensity", Range( 0 , 1)) = 1
		[NoScaleOffset][Space(10)]_MainTex("Element Texture", 2D) = "white" {}
		_MainTexMinValue("Element Min", Range( 0 , 1)) = 0
		_MainTexMaxValue("Element Max", Range( 0 , 1)) = 1
		[Space(10)]_MainUVs("Element UVs", Vector) = (1,1,0,0)
		[Enum(Main,0,Seasons,1)]_ElementMode("Element Mode", Float) = 0
		[Space(10)]_MainValue("Main", Range( 0 , 1)) = 1
		[Space(10)]_WinterValue("Winter", Range( 0 , 1)) = 1
		_SpringValue("Spring", Range( 0 , 1)) = 1
		_SummerValue("Summer", Range( 0 , 1)) = 1
		_AutumnValue("Autumn", Range( 0 , 1)) = 1
		[StyledCategory(Advanced)]_AdvancedCat("[ Advanced Cat ]", Float) = 0
		[HideInInspector][IntRange]_render_priority("Priority", Range( -50 , 50)) = 0
		[StyledMessage(Warning, Use this feature to fade out elements that are outside the Global Volume bounds to avoid rendering issues when the volume is not static. The distance fade out is based on the camera position and it is only available in play mode., _ElementFadeSupport, 1, 5, 5)]_ElementFadeMessage("Enable Fade Message", Float) = 0
		[Toggle]_ElementFadeSupport("Enable Fade Support", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 160
		[HideInInspector]_IsTVEElement("_IsTVEElement", Float) = 1
		[HideInInspector]_IsExtrasShader("_IsExtrasShader", Float) = 1

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" "PreviewType"="Plane" }
	LOD 0

		CGINCLUDE
		#pragma target 2.0
		ENDCG
		Blend SrcAlpha OneMinusSrcAlpha
		AlphaToMask Off
		Cull Off
		ColorMask G
		ZWrite Off
		ZTest LEqual
		
		
		
		Pass
		{
			Name "Unlit"
			//Tags { "LightMode"="ForwardBase" }
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsVersion;
			uniform half _ElementFadeMessage;
			uniform half _IsTVEElement;
			uniform half _AdvancedCat;
			uniform half _render_priority;
			uniform half _ElementCat;
			uniform half _Message1;
			uniform half _Banner1;
			uniform half _IsExtrasShader;
			uniform half _MainValue;
			uniform sampler2D _MainTex;
			uniform half4 _MainUVs;
			uniform half _MainTexMinValue;
			uniform half _MainTexMaxValue;
			uniform half4 TVE_SeasonOptions;
			uniform half _WinterValue;
			uniform half _SpringValue;
			uniform half TVE_SeasonLerp;
			uniform half _SummerValue;
			uniform half _AutumnValue;
			uniform half _ElementMode;
			uniform half _ElementIntensity;
			uniform half TVE_ElementFadeEnd;
			uniform half TVE_ElementFadeStart;
			uniform half _ElementFadeSupport;

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				half Value_Main157_g18439 = _MainValue;
				half4 tex2DNode17_g18439 = tex2D( _MainTex, ( ( i.ase_texcoord1.xy * (_MainUVs).xy ) + (_MainUVs).zw ) );
				half temp_output_7_0_g18451 = _MainTexMinValue;
				half4 temp_cast_0 = (temp_output_7_0_g18451).xxxx;
				half4 break469_g18439 = saturate( ( ( tex2DNode17_g18439 - temp_cast_0 ) / ( _MainTexMaxValue - temp_output_7_0_g18451 ) ) );
				half MainTex_R73_g18439 = break469_g18439.r;
				half TVE_SeasonOptions_X50_g18439 = TVE_SeasonOptions.x;
				half Value_Winter158_g18439 = _WinterValue;
				half Value_Spring159_g18439 = _SpringValue;
				half TVE_SeasonLerp54_g18439 = TVE_SeasonLerp;
				half lerpResult168_g18439 = lerp( Value_Winter158_g18439 , Value_Spring159_g18439 , TVE_SeasonLerp54_g18439);
				half TVE_SeasonOptions_Y51_g18439 = TVE_SeasonOptions.y;
				half Value_Summer160_g18439 = _SummerValue;
				half lerpResult167_g18439 = lerp( Value_Spring159_g18439 , Value_Summer160_g18439 , TVE_SeasonLerp54_g18439);
				half TVE_SeasonOptions_Z52_g18439 = TVE_SeasonOptions.z;
				half Value_Autumn161_g18439 = _AutumnValue;
				half lerpResult166_g18439 = lerp( Value_Summer160_g18439 , Value_Autumn161_g18439 , TVE_SeasonLerp54_g18439);
				half TVE_SeasonOptions_W53_g18439 = TVE_SeasonOptions.w;
				half lerpResult165_g18439 = lerp( Value_Autumn161_g18439 , Value_Winter158_g18439 , TVE_SeasonLerp54_g18439);
				half Element_Mode55_g18439 = _ElementMode;
				half lerpResult181_g18439 = lerp( ( Value_Main157_g18439 * MainTex_R73_g18439 ) , ( MainTex_R73_g18439 * ( ( TVE_SeasonOptions_X50_g18439 * lerpResult168_g18439 ) + ( TVE_SeasonOptions_Y51_g18439 * lerpResult167_g18439 ) + ( TVE_SeasonOptions_Z52_g18439 * lerpResult166_g18439 ) + ( TVE_SeasonOptions_W53_g18439 * lerpResult165_g18439 ) ) ) , Element_Mode55_g18439);
				half Base_Extras_RGB213_g18439 = ( lerpResult181_g18439 * i.ase_color.r );
				half temp_output_7_0_g18448 = TVE_ElementFadeEnd;
				half Enable_Fade_Support454_g18439 = _ElementFadeSupport;
				half lerpResult462_g18439 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_7_0_g18448 ) / ( TVE_ElementFadeStart - temp_output_7_0_g18448 ) ) ) , Enable_Fade_Support454_g18439);
				half Element_Intensity56_g18439 = ( ( _ElementIntensity * i.ase_color.a ) * lerpResult462_g18439 );
				half lerpResult224_g18439 = lerp( 1.0 , Base_Extras_RGB213_g18439 , Element_Intensity56_g18439);
				half3 appendResult232_g18439 = (half3(0.0 , lerpResult224_g18439 , 0.0));
				half3 Final_Size_RGB228_g18439 = appendResult232_g18439;
				half Final_Size_A229_g18439 = MainTex_R73_g18439;
				half4 appendResult473_g18439 = (half4(Final_Size_RGB228_g18439 , Final_Size_A229_g18439));
				
				
				finalColor = appendResult473_g18439;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "TVEShaderElementGUI"
	
	
}
/*ASEBEGIN
Version=18400
1927;1;1906;1020;1281.264;1655.089;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;109;-768,-1408;Half;False;Property;_Banner1;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Size Element);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;117;-432,-1408;Inherit;False;Is Extras Shader;33;;18458;adca672cb6779794dba5f669b4c5f8e3;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;116;-768,-1024;Inherit;False;Base Element;2;;18439;0e972c73cae2ee54ea51acc9738801d0;6,477,2,478,0,145,1,481,0,576,1,491,1;0;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-608,-1408;Half;False;Property;_Message1;Message;1;0;Create;True;0;0;True;1;StyledMessage(Info, Use the Size elements to add scale variation or combine it with seasons to add dynamic vegetation growing. Element Texture R is used as alpha mask. Particle Color R is used as values multiplier and Alpha as Element Intensity multiplier., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-432,-1024;Half;False;True;-1;2;TVEShaderElementGUI;0;1;BOXOPHOBIC/The Vegetation Engine/Elements/Default/Size;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;2;5;False;-1;10;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;True;0;False;-1;True;2;False;-1;True;False;True;False;False;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;0;False;-1;True;False;0;False;-1;0;False;-1;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;PreviewType=Plane;True;0;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;0;0;116;0
ASEEND*/
//CHKSM=7C449E5217C7F70193FE38B8902D5761AC065148