// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:False,qofs:0,qpre:3,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:5625,x:33129,y:32707,varname:node_5625,prsc:2|normal-2609-RGB,emission-6014-OUT;n:type:ShaderForge.SFN_Tex2d,id:2609,x:32745,y:32570,ptovrint:False,ptlb:Normalmap,ptin:_Normalmap,varname:_Albedo_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:19b8fc1d3dabb4d45b983c3dbc951120,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Fresnel,id:4285,x:32094,y:32874,varname:node_4285,prsc:2|EXP-7812-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7812,x:31912,y:32908,ptovrint:False,ptlb:Fresnel Power,ptin:_FresnelPower,varname:node_3803,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:5963,x:32094,y:33027,ptovrint:False,ptlb:Glow Color,ptin:_GlowColor,varname:node_9444,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.8979106,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7544,x:32458,y:32924,varname:node_7544,prsc:2|A-4285-OUT,B-5963-RGB;n:type:ShaderForge.SFN_Slider,id:162,x:32249,y:32815,ptovrint:False,ptlb:Glow Power,ptin:_GlowPower,varname:node_162,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Multiply,id:6014,x:32699,y:32882,varname:node_6014,prsc:2|A-162-OUT,B-7544-OUT;proporder:2609-7812-5963-162;pass:END;sub:END;*/

Shader "3P0D's Shaders/SRP/Unlit/Unlit FXs/Unlit Ghost wNormals" {
    Properties {
        _Normalmap ("Normalmap", 2D) = "bump" {}
        _FresnelPower ("Fresnel Power", Float ) = 1
        _GlowColor ("Glow Color", Color) = (0,0.8979106,1,1)
        _GlowPower ("Glow Power", Range(0, 2)) = 1
    }
    SubShader {
        Tags {
            "Queue"="Transparent"
            "RenderType"="TransparentCutout"
        }
        LOD 100
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Normalmap; uniform float4 _Normalmap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _GlowColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _GlowPower)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normalmap_var = UnpackNormal(tex2D(_Normalmap,TRANSFORM_TEX(i.uv0, _Normalmap)));
                float3 normalLocal = _Normalmap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
////// Lighting:
////// Emissive:
                float _GlowPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _GlowPower );
                float _FresnelPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPower );
                float4 _GlowColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _GlowColor );
                float3 emissive = (_GlowPower_var*(pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelPower_var)*_GlowColor_var.rgb));
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
