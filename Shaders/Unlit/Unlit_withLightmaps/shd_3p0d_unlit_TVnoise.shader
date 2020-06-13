// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2462,x:32719,y:32712,varname:node_2462,prsc:2|emission-5968-OUT;n:type:ShaderForge.SFN_Noise,id:6293,x:32220,y:32739,varname:node_6293,prsc:2|XY-7051-UVOUT;n:type:ShaderForge.SFN_Time,id:3822,x:31703,y:32934,varname:node_3822,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:6149,x:31703,y:32869,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_6149,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:5985,x:31874,y:32869,varname:node_5985,prsc:2|A-6149-OUT,B-3822-T;n:type:ShaderForge.SFN_TexCoord,id:3504,x:31867,y:32628,varname:node_3504,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:7051,x:32051,y:32628,varname:node_7051,prsc:2,spu:-1,spv:0|UVIN-3504-UVOUT,DIST-5985-OUT;n:type:ShaderForge.SFN_Color,id:5374,x:32220,y:32542,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5374,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:5968,x:32456,y:32677,varname:node_5968,prsc:2|A-5374-RGB,B-6293-OUT;n:type:ShaderForge.SFN_Color,id:9097,x:32511,y:32605,ptovrint:False,ptlb:Glow Tint,ptin:_GlowTint,varname:node_3930,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9895096,c2:1,c3:0.7028302,c4:1;n:type:ShaderForge.SFN_Tex2d,id:9081,x:32511,y:32766,ptovrint:False,ptlb:Glowmap,ptin:_Glowmap,varname:node_8395,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8500,x:32678,y:32682,varname:node_8500,prsc:2|A-9097-RGB,B-9081-RGB;proporder:6149-5374;pass:END;sub:END;*/

Shader "3P0D's Shaders/Unlit/TV Noise" {
    Properties {
        _Speed ("Speed", Float ) = 2
        _Color ("Color", Color) = (0,0,0,1)
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
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _Speed)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Color)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
////// Lighting:
////// Emissive:
                float4 _Color_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Color );
                float _Speed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Speed );
                float4 node_3822 = _Time;
                float2 node_7051 = (i.uv0+(_Speed_var*node_3822.g)*float2(-1,0));
                float2 node_6293_skew = node_7051 + 0.2127+node_7051.x*0.3713*node_7051.y;
                float2 node_6293_rnd = 4.789*sin(489.123*(node_6293_skew));
                float node_6293 = frac(node_6293_rnd.x*node_6293_rnd.y*(1+node_6293_skew.x));
                float3 emissive = (_Color_var.rgb+node_6293);
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
