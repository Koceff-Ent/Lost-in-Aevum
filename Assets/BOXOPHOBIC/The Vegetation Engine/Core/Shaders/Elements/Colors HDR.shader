// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Elements/Default/Colors HDR"
{
	Properties
	{
		[StyledBanner(Color HDR Element)]_Banner("Banner", Float) = 0
		[StyledMessage(Info, Use the Colors HDR elements to add fake lighting to vegetation or props. Element Texture R is used as alpha mask. Particle Color RGB is used as values multiplier and Alpha as Element Intensity multiplier., 0,0)]_Message("Message", Float) = 0
		[StyledCategory(Element)]_ElementCat("[ Element Cat ]", Float) = 0
		_ElementIntensity("Element Intensity", Range( 0 , 1)) = 1
		[NoScaleOffset][Space(10)]_MainTex("Element Texture", 2D) = "white" {}
		_MainTexMinValue("Element Min", Range( 0 , 1)) = 0
		_MainTexMaxValue("Element Max", Range( 0 , 1)) = 1
		[Space(10)]_MainUVs("Element UVs", Vector) = (1,1,0,0)
		[HDR]_MainColorHDR("Color HDR", Color) = (1,0.5,0,1)
		[StyledCategory(Advanced)]_AdvancedCat("[ Advanced Cat ]", Float) = 0
		[HideInInspector][IntRange]_render_priority("Priority", Range( -50 , 50)) = 0
		[StyledMessage(Warning, Use this feature to fade out elements that are outside the Global Volume bounds to avoid rendering issues when the volume is not static. The distance fade out is based on the camera position and it is only available in play mode., _ElementFadeSupport, 1, 5, 5)]_ElementFadeMessage("Enable Fade Message", Float) = 0
		[Toggle]_ElementFadeSupport("Enable Fade Support", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 160
		[HideInInspector]_IsTVEElement("_IsTVEElement", Float) = 1
		[HideInInspector]_IsColorsShader("_IsColorsShader", Float) = 1

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
		ColorMask RGB
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
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsColorsShader;
			uniform half _Banner;
			uniform half _Message;
			uniform half _IsVersion;
			uniform half _ElementFadeMessage;
			uniform half _IsTVEElement;
			uniform half _AdvancedCat;
			uniform half _render_priority;
			uniform half _ElementCat;
			uniform half4 _MainColorHDR;
			uniform sampler2D _MainTex;
			uniform half4 _MainUVs;
			uniform half _MainTexMinValue;
			uniform half _MainTexMaxValue;
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

				o.ase_color = v.color;
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
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
				float3 Final_ColorsHDR_RGB204_g18450 = ( (_MainColorHDR).rgb * (i.ase_color).rgb );
				half4 tex2DNode17_g18450 = tex2D( _MainTex, ( ( i.ase_texcoord1.xy * (_MainUVs).xy ) + (_MainUVs).zw ) );
				half temp_output_7_0_g18454 = _MainTexMinValue;
				half4 temp_cast_0 = (temp_output_7_0_g18454).xxxx;
				half4 break469_g18450 = saturate( ( ( tex2DNode17_g18450 - temp_cast_0 ) / ( _MainTexMaxValue - temp_output_7_0_g18454 ) ) );
				half MainTex_R73_g18450 = break469_g18450.r;
				half temp_output_7_0_g18451 = TVE_ElementFadeEnd;
				half Enable_Fade_Support454_g18450 = _ElementFadeSupport;
				half lerpResult462_g18450 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_7_0_g18451 ) / ( TVE_ElementFadeStart - temp_output_7_0_g18451 ) ) ) , Enable_Fade_Support454_g18450);
				half Element_Intensity56_g18450 = ( ( _ElementIntensity * i.ase_color.a ) * lerpResult462_g18450 );
				float Final_ColorsHDR_A205_g18450 = ( MainTex_R73_g18450 * Element_Intensity56_g18450 );
				half4 appendResult471_g18450 = (half4(Final_ColorsHDR_RGB204_g18450 , Final_ColorsHDR_A205_g18450));
				
				
				finalColor = appendResult471_g18450;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "TVEShaderElementGUI"
	
	
}
/*ASEBEGIN
Version=18400
1927;1;1906;1020;1601.908;1822.261;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;99;-480,-1408;Half;False;Property;_Message;Message;1;0;Create;True;0;0;True;1;StyledMessage(Info, Use the Colors HDR elements to add fake lighting to vegetation or props. Element Texture R is used as alpha mask. Particle Color RGB is used as values multiplier and Alpha as Element Intensity multiplier., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;102;-640,-1152;Inherit;False;Base Element;2;;18450;0e972c73cae2ee54ea51acc9738801d0;6,477,1,478,1,145,1,481,0,576,1,491,1;0;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;101;-304,-1408;Inherit;False;Is Colors Shader;33;;18449;378049ebac362e14aae08c2daa8ed737;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;96;-640,-1408;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Color HDR Element);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-304,-1152;Half;False;True;-1;2;TVEShaderElementGUI;0;1;BOXOPHOBIC/The Vegetation Engine/Elements/Default/Colors HDR;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;2;5;False;-1;10;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;True;0;False;-1;True;2;False;-1;True;True;True;True;False;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;0;False;-1;True;False;0;False;-1;0;False;-1;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;PreviewType=Plane;True;0;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;0;0;102;0
ASEEND*/
//CHKSM=79B6F507BAA7DCC4D5E6630E78A76CD98A1EF8FA