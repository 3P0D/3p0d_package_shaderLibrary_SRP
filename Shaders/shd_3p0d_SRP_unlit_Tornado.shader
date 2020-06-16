// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9644,x:33972,y:32945,varname:node_9644,prsc:2|emission-107-OUT;n:type:ShaderForge.SFN_Fresnel,id:155,x:32367,y:32516,varname:node_155,prsc:2|EXP-185-OUT;n:type:ShaderForge.SFN_Multiply,id:9302,x:32720,y:32742,varname:node_9302,prsc:2|A-155-OUT,B-4344-OUT;n:type:ShaderForge.SFN_Panner,id:7687,x:32032,y:32824,varname:node_7687,prsc:2,spu:1,spv:0|UVIN-5003-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5003,x:31872,y:32824,varname:node_5003,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ValueProperty,id:185,x:32367,y:32451,ptovrint:False,ptlb:Fresnel Power,ptin:_FresnelPower,varname:node_185,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Tex2d,id:9342,x:32368,y:32890,ptovrint:False,ptlb:Noise1,ptin:_Noise1,varname:node_9342,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ecab6ed28384b6a46aaa29d4c7630d5c,ntxv:0,isnm:False|UVIN-2580-UVOUT;n:type:ShaderForge.SFN_Rotator,id:2580,x:32032,y:32983,varname:node_2580,prsc:2|UVIN-5003-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:4337,x:32368,y:32700,ptovrint:False,ptlb:Noise2,ptin:_Noise2,varname:node_4337,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ecab6ed28384b6a46aaa29d4c7630d5c,ntxv:0,isnm:False|UVIN-7687-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4344,x:32547,y:32742,varname:node_4344,prsc:2|A-4337-RGB,B-9342-RGB;n:type:ShaderForge.SFN_Multiply,id:3467,x:32897,y:32742,varname:node_3467,prsc:2|A-9302-OUT,B-1079-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1079,x:32720,y:32896,ptovrint:False,ptlb:Strength,ptin:_Strength,varname:node_1079,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_Color,id:2552,x:32720,y:33162,ptovrint:False,ptlb:First Color,ptin:_FirstColor,varname:_node_7895_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0.2212214,c4:1;n:type:ShaderForge.SFN_Color,id:8655,x:32720,y:32988,ptovrint:False,ptlb:Second Color,ptin:_SecondColor,varname:_node_7895_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.317647,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:4749,x:32978,y:33024,varname:node_4749,prsc:2|A-2552-RGB,B-8655-RGB,T-4123-OUT;n:type:ShaderForge.SFN_Multiply,id:8266,x:33558,y:32905,varname:node_8266,prsc:2|A-4123-OUT,B-4749-OUT;n:type:ShaderForge.SFN_Add,id:4123,x:33066,y:32742,varname:node_4123,prsc:2|A-3467-OUT,B-7019-OUT;n:type:ShaderForge.SFN_Fresnel,id:7019,x:33066,y:32606,varname:node_7019,prsc:2|EXP-2060-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2060,x:32897,y:32640,ptovrint:False,ptlb:node_2060,ptin:_node_2060,varname:node_2060,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Fresnel,id:2374,x:32863,y:32152,varname:node_2374,prsc:2|EXP-2046-OUT;n:type:ShaderForge.SFN_OneMinus,id:3753,x:33047,y:32152,varname:node_3753,prsc:2|IN-2374-OUT;n:type:ShaderForge.SFN_Vector1,id:9375,x:33047,y:32013,varname:node_9375,prsc:2,v1:5;n:type:ShaderForge.SFN_Vector1,id:2046,x:32642,y:32175,varname:node_2046,prsc:2,v1:1;n:type:ShaderForge.SFN_Power,id:2697,x:33229,y:32152,varname:node_2697,prsc:2|VAL-3753-OUT,EXP-9375-OUT;n:type:ShaderForge.SFN_Multiply,id:685,x:33395,y:32152,varname:node_685,prsc:2|A-2697-OUT,B-2374-OUT;n:type:ShaderForge.SFN_Panner,id:8363,x:33163,y:32408,varname:node_8363,prsc:2,spu:0,spv:-1|UVIN-482-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:4046,x:33331,y:32408,ptovrint:False,ptlb:node_4046,ptin:_node_4046,varname:node_4046,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:21529e9cc0701af4ebda16b9d774f2f1,ntxv:0,isnm:False|UVIN-8363-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:482,x:32954,y:32408,varname:node_482,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:107,x:33759,y:32827,varname:node_107,prsc:2|A-7635-OUT,B-8266-OUT;n:type:ShaderForge.SFN_Add,id:7635,x:33584,y:32534,varname:node_7635,prsc:2|A-4046-RGB,B-4832-OUT;n:type:ShaderForge.SFN_Vector1,id:4832,x:33372,y:32595,varname:node_4832,prsc:2,v1:0.8;proporder:185-9342-4337-1079-2552-8655-2060-4046;pass:END;sub:END;*/

Shader "3P0D's Shaders/SRP/Unlit/Unlit FXs/Unlit Tornado" {
    Properties {
        _FresnelPower ("Fresnel Power", Float ) = 3
        _Noise1 ("Noise1", 2D) = "white" {}
        _Noise2 ("Noise2", 2D) = "white" {}
        _Strength ("Strength", Float ) = 10
        _FirstColor ("First Color", Color) = (1,0,0.2212214,1)
        _SecondColor ("Second Color", Color) = (0,0.317647,1,1)
        _node_2060 ("node_2060", Float ) = 1
        _node_4046 ("node_4046", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Noise1; uniform float4 _Noise1_ST;
            uniform sampler2D _Noise2; uniform float4 _Noise2_ST;
            uniform sampler2D _node_4046; uniform float4 _node_4046_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPower)
                UNITY_DEFINE_INSTANCED_PROP( float, _Strength)
                UNITY_DEFINE_INSTANCED_PROP( float4, _FirstColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SecondColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _node_2060)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_1966 = _Time;
                float2 node_8363 = (i.uv0+node_1966.g*float2(0,-1));
                float4 _node_4046_var = tex2D(_node_4046,TRANSFORM_TEX(node_8363, _node_4046));
                float _FresnelPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPower );
                float2 node_7687 = (i.uv0+node_1966.g*float2(1,0));
                float4 _Noise2_var = tex2D(_Noise2,TRANSFORM_TEX(node_7687, _Noise2));
                float node_2580_ang = node_1966.g;
                float node_2580_spd = 1.0;
                float node_2580_cos = cos(node_2580_spd*node_2580_ang);
                float node_2580_sin = sin(node_2580_spd*node_2580_ang);
                float2 node_2580_piv = float2(0.5,0.5);
                float2 node_2580 = (mul(i.uv0-node_2580_piv,float2x2( node_2580_cos, -node_2580_sin, node_2580_sin, node_2580_cos))+node_2580_piv);
                float4 _Noise1_var = tex2D(_Noise1,TRANSFORM_TEX(node_2580, _Noise1));
                float _Strength_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Strength );
                float _node_2060_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_2060 );
                float3 node_4123 = (((pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelPower_var)*(_Noise2_var.rgb*_Noise1_var.rgb))*_Strength_var)+pow(1.0-max(0,dot(normalDirection, viewDirection)),_node_2060_var));
                float4 _FirstColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FirstColor );
                float4 _SecondColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SecondColor );
                float3 node_8266 = (node_4123*lerp(_FirstColor_var.rgb,_SecondColor_var.rgb,node_4123));
                float3 emissive = ((_node_4046_var.rgb+0.8)*node_8266);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
