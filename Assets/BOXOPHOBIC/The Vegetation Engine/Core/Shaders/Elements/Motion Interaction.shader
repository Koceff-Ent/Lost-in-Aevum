// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Elements/Motion/Interaction"
{
	Properties
	{
		[StyledBanner(Motion Interaction Element)]_Banner("Banner", Float) = 0
		[StyledMessage(Info, Use the Motion Interaction elements to add touch bending to the vegetation objects. Element Texture XY is used a World XZ bending and Texture A is used as interaction mask. Particle Color A is used as Element Intensity multiplier., 0,0)]_Message("Message", Float) = 0
		[StyledCategory(Element)]_ElementCat("[ Element Cat ]", Float) = 0
		_ElementIntensity("Element Intensity", Range( 0 , 1)) = 1
		[NoScaleOffset][Space(10)]_MainTex("Element Texture", 2D) = "white" {}
		[Toggle]_InvertX("Invert Texture X", Float) = 0
		[Toggle]_InvertY("Invert Texture Y", Float) = 0
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
		Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
		AlphaToMask Off
		Cull Off
		ColorMask RGA
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

			uniform half _Banner;
			uniform half _IsVersion;
			uniform half _ElementFadeMessage;
			uniform half _IsTVEElement;
			uniform half _AdvancedCat;
			uniform half _ElementCat;
			uniform half _render_priority;
			uniform half _IsMotionShader;
			uniform half _Message;
			uniform sampler2D _MainTex;
			uniform float _InvertX;
			uniform float _InvertY;
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
				float4 tex2DNode17_g18521 = tex2D( _MainTex, i.ase_texcoord1.xy );
				float4 break469_g18521 = tex2DNode17_g18521;
				half MainTex_R73_g18521 = break469_g18521.r;
				half MainTex_G265_g18521 = break469_g18521.g;
				float3 appendResult274_g18521 = (float3(-(MainTex_R73_g18521*2.0 + -1.0) , 0.0 , -(MainTex_G265_g18521*2.0 + -1.0)));
				float3 temp_output_275_0_g18521 = mul( unity_ObjectToWorld, float4( appendResult274_g18521 , 0.0 ) ).xyz;
				float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
				float temp_output_7_0_g18529 = -ase_objectScale.x;
				half normalX_WS284_g18521 = ( ( temp_output_275_0_g18521.x - temp_output_7_0_g18529 ) / ( ase_objectScale.x - temp_output_7_0_g18529 ) );
				half Invert_Texture_X489_g18521 = _InvertX;
				float lerpResult353_g18521 = lerp( normalX_WS284_g18521 , ( 1.0 - normalX_WS284_g18521 ) , Invert_Texture_X489_g18521);
				float temp_output_7_0_g18528 = -ase_objectScale.z;
				half normalZ_WS285_g18521 = ( ( temp_output_275_0_g18521.z - temp_output_7_0_g18528 ) / ( ase_objectScale.z - temp_output_7_0_g18528 ) );
				half Invert_Texture_Y545_g18521 = _InvertY;
				float lerpResult354_g18521 = lerp( normalZ_WS285_g18521 , ( 1.0 - normalZ_WS285_g18521 ) , Invert_Texture_Y545_g18521);
				float3 appendResult292_g18521 = (float3(lerpResult353_g18521 , lerpResult354_g18521 , 1.0));
				half3 Final_MotionInteraction_RGB303_g18521 = appendResult292_g18521;
				half MainTex_A74_g18521 = break469_g18521.a;
				float temp_output_7_0_g18523 = TVE_ElementFadeEnd;
				half Enable_Fade_Support454_g18521 = _ElementFadeSupport;
				float lerpResult462_g18521 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_7_0_g18523 ) / ( TVE_ElementFadeStart - temp_output_7_0_g18523 ) ) ) , Enable_Fade_Support454_g18521);
				half Element_Intensity56_g18521 = ( ( _ElementIntensity * i.ase_color.a ) * lerpResult462_g18521 );
				half Final_MotionInteraction_A305_g18521 = ( MainTex_A74_g18521 * Element_Intensity56_g18521 );
				float4 appendResult479_g18521 = (float4(Final_MotionInteraction_RGB303_g18521 , Final_MotionInteraction_A305_g18521));
				
				
				finalColor = appendResult479_g18521;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "TVEShaderElementGUI"
	
	
}
/*ASEBEGIN
Version=18400
1927;7;1906;1014;1236.803;1665.791;1;True;False
Node;AmplifyShaderEditor.FunctionNode;117;-304,-1280;Inherit;False;Is Motion Shader;33;;18531;6eebc31017d99e84e811285e6a5d199d;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;115;-480,-1280;Half;False;Property;_Message;Message;1;0;Create;True;0;0;True;1;StyledMessage(Info, Use the Motion Interaction elements to add touch bending to the vegetation objects. Element Texture XY is used a World XZ bending and Texture A is used as interaction mask. Particle Color A is used as Element Intensity multiplier., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;95;-640,-1280;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Motion Interaction Element);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;143;-640,-1024;Inherit;False;Base Element;2;;18521;0e972c73cae2ee54ea51acc9738801d0;6,477,0,478,0,145,3,481,0,576,0,491,0;0;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-320,-1024;Float;False;True;-1;2;TVEShaderElementGUI;0;1;BOXOPHOBIC/The Vegetation Engine/Elements/Motion/Interaction;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;2;5;False;-1;10;False;-1;2;5;False;-1;10;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;True;0;False;-1;True;2;False;-1;True;True;True;False;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;0;False;-1;True;False;0;False;-1;0;False;-1;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;PreviewType=Plane;True;0;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;0;0;143;0
ASEEND*/
//CHKSM=DB46A6E6E1AF6C69B1EF67C10B5025B6BF64BADB