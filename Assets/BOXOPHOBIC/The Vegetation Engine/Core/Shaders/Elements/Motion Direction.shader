// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Elements/Motion/Direction"
{
	Properties
	{
		[StyledBanner(Motion Direction Element)]_Banner("Banner", Float) = 0
		[StyledMessage(Info, Use the Motion Direction elements to change the wind direction. Element Texture R is used as alpha mask. Particle Color A is used as Element Intensity multiplier., 0,0)]_Message("Message", Float) = 0
		[StyledCategory(Element)]_ElementCat("[ Element Cat ]", Float) = 0
		_ElementIntensity("Element Intensity", Range( 0 , 1)) = 1
		[NoScaleOffset][Space(10)]_MainTex("Element Texture", 2D) = "white" {}
		_MotionDirectionX("Motion Direction X", Range( -1 , 1)) = 1
		_MotionDirectionZ("Motion Direction Z", Range( -1 , 1)) = 0
		[StyledCategory(Advanced)]_AdvancedCat("[ Advanced Cat ]", Float) = 0
		[HideInInspector][IntRange]_render_priority("Priority", Range( -50 , 50)) = 0
		[StyledMessage(Warning, Use this feature to fade out elements that are outside the Global Volume bounds to avoid rendering issues when the volume is not static. The distance fade out is based on the camera position and it is only available in play mode., _ElementFadeSupport, 1, 5, 5)]_ElementFadeMessage("Enable Fade Message", Float) = 0
		[Toggle]_ElementFadeSupport("Enable Fade Support", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 160
		[HideInInspector]_IsTVEElement("_IsTVEElement", Float) = 1
		[HideInInspector]_IsMotionShader("_IsMotionShader", Float) = 1

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
		ColorMask RG
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

			uniform half _Message;
			uniform half _AdvancedCat;
			uniform half _IsTVEElement;
			uniform half _render_priority;
			uniform half _ElementCat;
			uniform half _IsVersion;
			uniform half _ElementFadeMessage;
			uniform half _Banner;
			uniform half _IsMotionShader;
			uniform half _MotionDirectionX;
			uniform half _MotionDirectionZ;
			uniform sampler2D _MainTex;
			uniform float _ElementIntensity;
			uniform float TVE_ElementFadeEnd;
			uniform float TVE_ElementFadeStart;
			uniform float _ElementFadeSupport;

			
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
				float3 appendResult521_g18644 = (float3((_MotionDirectionX*0.5 + 0.5) , (_MotionDirectionZ*0.5 + 0.5) , 1.0));
				half3 Final_MotionDirection_RGB522_g18644 = appendResult521_g18644;
				float4 tex2DNode17_g18644 = tex2D( _MainTex, i.ase_texcoord1.xy );
				float4 break469_g18644 = tex2DNode17_g18644;
				half MainTex_R73_g18644 = break469_g18644.r;
				float temp_output_7_0_g18653 = TVE_ElementFadeEnd;
				half Enable_Fade_Support454_g18644 = _ElementFadeSupport;
				float lerpResult462_g18644 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_7_0_g18653 ) / ( TVE_ElementFadeStart - temp_output_7_0_g18653 ) ) ) , Enable_Fade_Support454_g18644);
				half Element_Intensity56_g18644 = ( ( _ElementIntensity * i.ase_color.a ) * lerpResult462_g18644 );
				half Final_MotionDirection_A523_g18644 = ( MainTex_R73_g18644 * Element_Intensity56_g18644 );
				float4 appendResult525_g18644 = (float4(Final_MotionDirection_RGB522_g18644 , Final_MotionDirection_A523_g18644));
				
				
				finalColor = appendResult525_g18644;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "TVEShaderElementGUI"
	
	
}
/*ASEBEGIN
Version=18400
1927;7;1906;1014;1472.441;1660.934;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;95;-640,-1280;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Motion Direction Element);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;117;-304,-1280;Inherit;False;Is Motion Shader;33;;18655;6eebc31017d99e84e811285e6a5d199d;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;115;-480,-1280;Half;False;Property;_Message;Message;1;0;Create;True;0;0;True;1;StyledMessage(Info, Use the Motion Direction elements to change the wind direction. Element Texture R is used as alpha mask. Particle Color A is used as Element Intensity multiplier., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;150;-640,-1024;Inherit;False;Base Element;2;;18644;0e972c73cae2ee54ea51acc9738801d0;6,477,0,478,0,145,3,481,2,576,0,491,0;0;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-320,-1024;Float;False;True;-1;2;TVEShaderElementGUI;0;1;BOXOPHOBIC/The Vegetation Engine/Elements/Motion/Direction;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;2;5;False;-1;10;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;True;0;False;-1;True;2;False;-1;True;True;True;False;False;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;0;False;-1;True;False;0;False;-1;0;False;-1;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;PreviewType=Plane;True;0;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;0;0;150;0
ASEEND*/
//CHKSM=01073A186C0D03AFDE765BC053075ACED99741C1