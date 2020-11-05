// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Helpers/Debug Globals"
{
	Properties
	{
		[StyledBanner(Debug Globals)]_Banner("Banner", Float) = 0
		[StyledMessage(Info, Use this shader on a big plane to debug the element and noise textures used in the scene., 0,0)]_Message("Message", Float) = 0
		[StyledCategory(Debug Mode)]_DebugCategory("[ Debug Category ]", Float) = 0
		[Enum(Motion Texture,100,Colors Texture,200,Extras Texture,300,Noise Texture,400)]_DebugMode("Debug Mode", Float) = 100
		[Enum(Direction XZ,0,Wind Power,1,Interaction Mask,2)][Space(10)]_MotionTexture("Motion Texture", Float) = 0
		[Enum(Color Tinting,0,Healthiness,1)]_ColorsTexture("Colors Texture", Float) = 0
		[Enum(Leaves,0,Size,1,Overlay,2,Wetness,3)]_ExtrasTexture("Extras Texture", Float) = 0
		[Enum(Red,0,Green,1,Blue,2,Alpha,3)]_NoiseTexture("Noise Texture", Float) = 0
		[StyledCategory(Advanced)]_AdvancedCategory("[ Advanced Category ]", Float) = 0

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend Off
		AlphaToMask Off
		Cull Off
		ColorMask RGBA
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		
		
		
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
			#define MATERIAL_USE_WORLD_DATA


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _AdvancedCategory;
			uniform half _Message;
			uniform half _Banner;
			uniform half _DebugCategory;
			uniform half _DebugMode;
			uniform half _MotionTexture;
			uniform half _ColorsTexture;
			uniform half _ExtrasTexture;
			uniform half _NoiseTexture;
			uniform sampler2D TVE_MotionTex;
			uniform half4 TVE_VolumeCoord;
			uniform sampler2D TVE_ColorsTex;
			SamplerState samplerTVE_ColorsTex;
			uniform sampler2D TVE_ExtrasTex;
			SamplerState samplerTVE_ExtrasTex;
			uniform sampler2D TVE_NoiseTex;
			uniform half TVE_NoiseSpeed;
			uniform half TVE_NoiseSize;
			uniform half TVE_NoiseContrast;
			float3 ObjectPosition_unity_ObjectToWorld(  )
			{
				return float3(unity_ObjectToWorld[0].w, unity_ObjectToWorld[1].w, unity_ObjectToWorld[2].w );
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				
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
				float Debug_Mode1865 = _DebugMode;
				float ifLocalVar1857 = 0;
				UNITY_BRANCH 
				if( Debug_Mode1865 == 100.0 )
				ifLocalVar1857 = ( Debug_Mode1865 + _MotionTexture );
				float ifLocalVar1872 = 0;
				UNITY_BRANCH 
				if( Debug_Mode1865 == 200.0 )
				ifLocalVar1872 = ( Debug_Mode1865 + _ColorsTexture );
				float ifLocalVar1884 = 0;
				UNITY_BRANCH 
				if( Debug_Mode1865 == 300.0 )
				ifLocalVar1884 = ( Debug_Mode1865 + _ExtrasTexture );
				float ifLocalVar1936 = 0;
				UNITY_BRANCH 
				if( Debug_Mode1865 == 400.0 )
				ifLocalVar1936 = ( Debug_Mode1865 + _NoiseTexture );
				half Debug_Out1487 = ( ifLocalVar1857 + ifLocalVar1872 + ifLocalVar1884 + ifLocalVar1936 );
				float3 localObjectPosition_unity_ObjectToWorld8_g1759 = ObjectPosition_unity_ObjectToWorld();
				half3 ObjectData20_g1756 = localObjectPosition_unity_ObjectToWorld8_g1759;
				half3 WorldData19_g1756 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g1756 = WorldData19_g1756;
				#else
				float3 staticSwitch14_g1756 = ObjectData20_g1756;
				#endif
				float4 break1927 = tex2D( TVE_MotionTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g1756).xz ) ) );
				float3 appendResult1956 = (float3(break1927.r , break1927.g , 0.0));
				float3 ifLocalVar1374 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 100.0 )
				ifLocalVar1374 = appendResult1956;
				float3 appendResult1957 = (float3(0.0 , 0.0 , break1927.b));
				float3 ifLocalVar1355 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 101.0 )
				ifLocalVar1355 = appendResult1957;
				float3 appendResult1958 = (float3(break1927.a , break1927.a , break1927.a));
				float3 ifLocalVar1407 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 102.0 )
				ifLocalVar1407 = appendResult1958;
				float3 Debug_Motion1842 = ( ifLocalVar1374 + ifLocalVar1355 + ifLocalVar1407 );
				float3 localObjectPosition_unity_ObjectToWorld8_g1816 = ObjectPosition_unity_ObjectToWorld();
				half3 ObjectData20_g1815 = localObjectPosition_unity_ObjectToWorld8_g1816;
				half3 WorldData19_g1815 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g1815 = WorldData19_g1815;
				#else
				float3 staticSwitch14_g1815 = ObjectData20_g1815;
				#endif
				float4 tex2DNode7_g1814 = tex2D( TVE_ColorsTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g1815).xz ) ) );
				float3 ifLocalVar1911 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 200.0 )
				ifLocalVar1911 = (tex2DNode7_g1814).rgb;
				float ifLocalVar1912 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 201.0 )
				ifLocalVar1912 = tex2DNode7_g1814.a;
				float3 Debug_Colors1922 = ( ifLocalVar1911 + ifLocalVar1912 );
				float3 localObjectPosition_unity_ObjectToWorld8_g1811 = ObjectPosition_unity_ObjectToWorld();
				half3 ObjectData20_g1812 = localObjectPosition_unity_ObjectToWorld8_g1811;
				half3 WorldData19_g1812 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g1812 = WorldData19_g1812;
				#else
				float3 staticSwitch14_g1812 = ObjectData20_g1812;
				#endif
				float4 tex2DNode7_g1810 = tex2D( TVE_ExtrasTex, ( (TVE_VolumeCoord).zw + ( (TVE_VolumeCoord).xy * (staticSwitch14_g1812).xz ) ) );
				float ifLocalVar1657 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 300.0 )
				ifLocalVar1657 = tex2DNode7_g1810.r;
				float ifLocalVar1656 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 301.0 )
				ifLocalVar1656 = tex2DNode7_g1810.g;
				float ifLocalVar1655 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 302.0 )
				ifLocalVar1655 = tex2DNode7_g1810.b;
				float ifLocalVar1931 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 303.0 )
				ifLocalVar1931 = tex2DNode7_g1810.a;
				float Debug_Extras1368 = ( ifLocalVar1657 + ifLocalVar1656 + ifLocalVar1655 + ifLocalVar1931 );
				float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
				float3 localObjectPosition_unity_ObjectToWorld8_g1819 = ObjectPosition_unity_ObjectToWorld();
				half3 ObjectData20_g1820 = localObjectPosition_unity_ObjectToWorld8_g1819;
				half3 WorldData19_g1820 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g1820 = WorldData19_g1820;
				#else
				float3 staticSwitch14_g1820 = ObjectData20_g1820;
				#endif
				float2 panner73_g1818 = ( _Time.y * temp_cast_0 + ( (staticSwitch14_g1820).xz * TVE_NoiseSize ));
				float4 temp_cast_1 = (TVE_NoiseContrast).xxxx;
				float4 break142_g1818 = pow( abs( tex2D( TVE_NoiseTex, panner73_g1818 ) ) , temp_cast_1 );
				float ifLocalVar1948 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 400.0 )
				ifLocalVar1948 = break142_g1818.r;
				float ifLocalVar1949 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 401.0 )
				ifLocalVar1949 = break142_g1818.g;
				float ifLocalVar1947 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 402.0 )
				ifLocalVar1947 = break142_g1818.b;
				float ifLocalVar1950 = 0;
				UNITY_BRANCH 
				if( Debug_Out1487 == 403.0 )
				ifLocalVar1950 = break142_g1818.a;
				float Debug_Noise1952 = ( ifLocalVar1948 + ifLocalVar1949 + ifLocalVar1947 + ifLocalVar1950 );
				
				
				finalColor = float4( ( Debug_Motion1842 + Debug_Colors1922 + Debug_Extras1368 + Debug_Noise1952 ) , 0.0 );
				return finalColor;
			}
			ENDCG
		}
	}
	
	
	
}
/*ASEBEGIN
Version=18400
1927;1;1906;1020;2227.499;3965.275;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;1480;-1792,-5888;Half;False;Property;_DebugMode;Debug Mode;9;1;[Enum];Create;True;4;Motion Texture;100;Colors Texture;200;Extras Texture;300;Noise Texture;400;0;True;0;False;100;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1865;-1536,-5888;Inherit;False;Debug_Mode;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1886;-1792,-4480;Half;False;Property;_ExtrasTexture;Extras Texture;14;1;[Enum];Create;True;4;Leaves;0;Size;1;Overlay;2;Wetness;3;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1874;-1792,-4800;Inherit;False;1865;Debug_Mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1881;-1792,-4544;Inherit;False;1865;Debug_Mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1937;-1792,-4224;Half;False;Property;_NoiseTexture;Noise Texture;15;1;[Enum];Create;True;4;Red;0;Green;1;Blue;2;Alpha;3;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1933;-1792,-4288;Inherit;False;1865;Debug_Mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1873;-1792,-4736;Half;False;Property;_ColorsTexture;Colors Texture;13;1;[Enum];Create;True;2;Color Tinting;0;Healthiness;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1854;-1792,-4992;Half;False;Property;_MotionTexture;Motion Texture;12;1;[Enum];Create;True;3;Direction XZ;0;Wind Power;1;Interaction Mask;2;0;True;1;Space(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1868;-1792,-5056;Inherit;False;1865;Debug_Mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1885;-1792,-4608;Inherit;False;1865;Debug_Mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1871;-1792,-4864;Inherit;False;1865;Debug_Mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1935;-1536,-4288;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1875;-1536,-4800;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1934;-1792,-4352;Inherit;False;1865;Debug_Mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1883;-1536,-4544;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1869;-1536,-5056;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1866;-1792,-5120;Inherit;False;1865;Debug_Mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1936;-1280,-4352;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;400;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1857;-1280,-5120;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;100;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1872;-1280,-4864;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;200;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1884;-1280,-4608;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;300;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1877;-896,-5120;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1926;-1792,-3712;Inherit;False;Get Global Tex Motion;6;;1;bf9f22898fbdc044d83d042fd0f99232;0;0;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1487;-640,-5120;Half;False;Debug_Out;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1927;-1536,-3712;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;1646;-1088,-1152;Float;False;Constant;_Float4;Float 4;31;0;Create;True;0;0;False;0;False;301;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1910;-1088,-2432;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1929;-1088,-768;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1941;-1088,384;Float;False;Constant;_Float10;Float 5;31;0;Create;True;0;0;False;0;False;402;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1928;-1792,-2432;Inherit;False;Get Global Tex Colors;2;;1814;2c21b5ce1449c5a47981c1b0527685e0;0;0;2;FLOAT3;0;FLOAT;34
Node;AmplifyShaderEditor.GetLocalVarNode;1386;-1088,-3456;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1339;-1088,-3200;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1908;-1088,-2176;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1956;-1280,-3712;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1943;-1088,-256;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1958;-1280,-3392;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;1957;-1280,-3552;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1944;-1088,-128;Float;False;Constant;_Float11;Float 7;31;0;Create;True;0;0;False;0;False;400;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1953;-1792,-256;Inherit;False;Get Global Tex Noise;10;;1818;04d4237c6f1a31e419b48d242465f453;0;0;4;FLOAT;85;FLOAT;140;FLOAT;141;FLOAT;147
Node;AmplifyShaderEditor.GetLocalVarNode;1938;-1088,256;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1942;-1088,512;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1930;-1088,-640;Float;False;Constant;_Float6;Float 5;31;0;Create;True;0;0;False;0;False;303;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1653;-1088,-1408;Float;False;Constant;_Float7;Float 7;31;0;Create;True;0;0;False;0;False;300;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1945;-1088,0;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1359;-1088,-3072;Float;False;Constant;_Float21;Float 21;31;0;Create;True;0;0;False;0;False;102;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1329;-1088,-3328;Float;False;Constant;_Float9;Float 9;31;0;Create;True;0;0;False;0;False;101;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1648;-1088,-1280;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1283;-1088,-3712;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1939;-1088,640;Float;False;Constant;_Float8;Float 5;31;0;Create;True;0;0;False;0;False;403;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1907;-1088,-2304;Float;False;Constant;_Float2;Float 2;31;0;Create;True;0;0;False;0;False;200;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1647;-1088,-1536;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1946;-1088,128;Float;False;Constant;_Float12;Float 4;31;0;Create;True;0;0;False;0;False;401;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1858;-1088,-3584;Float;False;Constant;_Float3;Float 3;31;0;Create;True;0;0;False;0;False;100;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1645;-1088,-1024;Inherit;False;1487;Debug_Out;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1650;-1088,-896;Float;False;Constant;_Float5;Float 5;31;0;Create;True;0;0;False;0;False;302;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1932;-1792,-1536;Inherit;False;Get Global Tex Extras;4;;1810;35728de760029a6459b976c78935d00f;0;0;4;FLOAT;19;FLOAT;21;FLOAT;22;FLOAT;33
Node;AmplifyShaderEditor.RangedFloatNode;1909;-1088,-2048;Float;False;Constant;_Float1;Float 1;31;0;Create;True;0;0;False;0;False;201;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1948;-880,-256;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1656;-880,-1280;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1950;-880,512;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;3;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1949;-880,0;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1657;-880,-1536;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1374;-880,-3712;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;1355;-880,-3456;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;1931;-880,-768;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;3;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1407;-880,-3200;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;3;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;1947;-880,256;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;3;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1912;-880,-2176;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1655;-880,-1024;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;3;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1911;-880,-2432;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1311;-512,-3328;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1913;-512,-2176;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1951;-512,0;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1659;-512,-1280;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1368;-256,-1280;Float;False;Debug_Extras;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1842;-256,-3328;Inherit;False;Debug_Motion;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1922;-256,-2176;Inherit;False;Debug_Colors;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1952;-256,0;Float;False;Debug_Noise;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1849;-1792,-5504;Inherit;False;1842;Debug_Motion;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1923;-1792,-5440;Inherit;False;1922;Debug_Colors;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1848;-1792,-5376;Inherit;False;1368;Debug_Extras;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1954;-1792,-5312;Inherit;False;1952;Debug_Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1880;-1408,-6144;Half;False;Property;_DebugCategory;[ Debug Category ];8;0;Create;True;0;0;True;1;StyledCategory(Debug Mode);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1878;-1792,-6144;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Debug Globals);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1955;-896,-6144;Inherit;False;Define Use World Data;-1;;1821;749c61e1189c7f8408d9e6db94560d1d;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1850;-1152,-5504;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1879;-1184,-6144;Half;False;Property;_AdvancedCategory;[ Advanced Category ];16;0;Create;True;0;0;True;1;StyledCategory(Advanced);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1925;-1600,-6144;Half;False;Property;_Message;Message;1;0;Create;True;0;0;True;1;StyledMessage(Info, Use this shader on a big plane to debug the element and noise textures used in the scene., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1853;-640,-5504;Float;False;True;-1;2;;100;1;BOXOPHOBIC/The Vegetation Engine/Helpers/Debug Globals;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;True;0;False;-1;True;2;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;1865;0;1480;0
WireConnection;1935;0;1933;0
WireConnection;1935;1;1937;0
WireConnection;1875;0;1874;0
WireConnection;1875;1;1873;0
WireConnection;1883;0;1881;0
WireConnection;1883;1;1886;0
WireConnection;1869;0;1868;0
WireConnection;1869;1;1854;0
WireConnection;1936;0;1934;0
WireConnection;1936;3;1935;0
WireConnection;1857;0;1866;0
WireConnection;1857;3;1869;0
WireConnection;1872;0;1871;0
WireConnection;1872;3;1875;0
WireConnection;1884;0;1885;0
WireConnection;1884;3;1883;0
WireConnection;1877;0;1857;0
WireConnection;1877;1;1872;0
WireConnection;1877;2;1884;0
WireConnection;1877;3;1936;0
WireConnection;1487;0;1877;0
WireConnection;1927;0;1926;0
WireConnection;1956;0;1927;0
WireConnection;1956;1;1927;1
WireConnection;1958;0;1927;3
WireConnection;1958;1;1927;3
WireConnection;1958;2;1927;3
WireConnection;1957;2;1927;2
WireConnection;1948;0;1943;0
WireConnection;1948;1;1944;0
WireConnection;1948;3;1953;85
WireConnection;1656;0;1648;0
WireConnection;1656;1;1646;0
WireConnection;1656;3;1932;21
WireConnection;1950;0;1942;0
WireConnection;1950;1;1939;0
WireConnection;1950;3;1953;147
WireConnection;1949;0;1945;0
WireConnection;1949;1;1946;0
WireConnection;1949;3;1953;140
WireConnection;1657;0;1647;0
WireConnection;1657;1;1653;0
WireConnection;1657;3;1932;19
WireConnection;1374;0;1283;0
WireConnection;1374;1;1858;0
WireConnection;1374;3;1956;0
WireConnection;1355;0;1386;0
WireConnection;1355;1;1329;0
WireConnection;1355;3;1957;0
WireConnection;1931;0;1929;0
WireConnection;1931;1;1930;0
WireConnection;1931;3;1932;33
WireConnection;1407;0;1339;0
WireConnection;1407;1;1359;0
WireConnection;1407;3;1958;0
WireConnection;1947;0;1938;0
WireConnection;1947;1;1941;0
WireConnection;1947;3;1953;141
WireConnection;1912;0;1908;0
WireConnection;1912;1;1909;0
WireConnection;1912;3;1928;34
WireConnection;1655;0;1645;0
WireConnection;1655;1;1650;0
WireConnection;1655;3;1932;22
WireConnection;1911;0;1910;0
WireConnection;1911;1;1907;0
WireConnection;1911;3;1928;0
WireConnection;1311;0;1374;0
WireConnection;1311;1;1355;0
WireConnection;1311;2;1407;0
WireConnection;1913;0;1911;0
WireConnection;1913;1;1912;0
WireConnection;1951;0;1948;0
WireConnection;1951;1;1949;0
WireConnection;1951;2;1947;0
WireConnection;1951;3;1950;0
WireConnection;1659;0;1657;0
WireConnection;1659;1;1656;0
WireConnection;1659;2;1655;0
WireConnection;1659;3;1931;0
WireConnection;1368;0;1659;0
WireConnection;1842;0;1311;0
WireConnection;1922;0;1913;0
WireConnection;1952;0;1951;0
WireConnection;1850;0;1849;0
WireConnection;1850;1;1923;0
WireConnection;1850;2;1848;0
WireConnection;1850;3;1954;0
WireConnection;1853;0;1850;0
ASEEND*/
//CHKSM=C38E00C3043CEA4BCB6872E02F414D1D22B2EAEA