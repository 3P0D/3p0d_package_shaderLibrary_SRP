// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:5625,x:33189,y:32713,varname:node_5625,prsc:2|emission-6716-OUT;n:type:ShaderForge.SFN_Fresnel,id:1089,x:32383,y:32870,varname:node_1089,prsc:2|EXP-2956-OUT;n:type:ShaderForge.SFN_Multiply,id:5813,x:32541,y:32870,varname:node_5813,prsc:2|A-1089-OUT,B-7262-RGB;n:type:ShaderForge.SFN_Color,id:7262,x:32383,y:33018,ptovrint:False,ptlb:Glow Color,ptin:_GlowColor,varname:node_7262,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.517005,c4:1;n:type:ShaderForge.SFN_Slider,id:4250,x:32541,y:33032,ptovrint:False,ptlb:Glow Power,ptin:_GlowPower,varname:node_4250,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Multiply,id:8243,x:32745,y:32846,varname:node_8243,prsc:2|A-5813-OUT,B-4250-OUT;n:type:ShaderForge.SFN_Tex2d,id:5453,x:32541,y:32705,ptovrint:False,ptlb:Albedo,ptin:_Albedo,varname:node_5453,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7c01a5d963ec7c141b138e182b80c628,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:6716,x:32957,y:32773,varname:node_6716,prsc:2|A-5453-RGB,B-8243-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2956,x:32197,y:32893,ptovrint:False,ptlb:Fresnel Power,ptin:_FresnelPower,varname:node_2956,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:5453-7262-4250-2956;pass:END;sub:END;*/

Shader "3P0D's Shaders/SRP/Unlit/Unlit Basics wGlowing/Unlit wGlowing" {
    Properties {
        _Albedo ("Albedo", 2D) = "white" {}
        _GlowColor ("Glow Color", Color) = (0,1,0.517005,1)
        _GlowPower ("Glow Power", Range(0, 2)) = 1
        _FresnelPower ("Fresnel Power", Float ) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Albedo; uniform float4 _Albedo_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _GlowColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _GlowPower)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPower)
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
                float4 _Albedo_var = tex2D(_Albedo,TRANSFORM_TEX(i.uv0, _Albedo));
                float _FresnelPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPower );
                float4 _GlowColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _GlowColor );
                float _GlowPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _GlowPower );
                float3 emissive = (_Albedo_var.rgb+((pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelPower_var)*_GlowColor_var.rgb)*_GlowPower_var));
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
