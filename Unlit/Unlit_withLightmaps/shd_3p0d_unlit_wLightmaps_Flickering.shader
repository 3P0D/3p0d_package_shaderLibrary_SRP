// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:618,x:32884,y:32712,varname:node_618,prsc:2|diff-5580-OUT,emission-5580-OUT;n:type:ShaderForge.SFN_Tex2d,id:1821,x:31961,y:32585,ptovrint:False,ptlb:Lightmap,ptin:_Lightmap,varname:node_1821,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:804d3817a1097c941ab86d7004e4004e,ntxv:0,isnm:False|UVIN-5792-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5792,x:31791,y:32585,varname:node_5792,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Color,id:8252,x:31961,y:32421,ptovrint:False,ptlb:Multiply,ptin:_Multiply,varname:node_8252,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1,c2:0.1,c3:0.1,c4:1;n:type:ShaderForge.SFN_Time,id:300,x:31791,y:32809,varname:node_300,prsc:2;n:type:ShaderForge.SFN_Lerp,id:6144,x:32321,y:32482,varname:node_6144,prsc:2|A-1821-RGB,B-6417-OUT,T-8172-OUT;n:type:ShaderForge.SFN_Sin,id:8172,x:32120,y:32751,varname:node_8172,prsc:2|IN-8704-OUT;n:type:ShaderForge.SFN_Multiply,id:8704,x:31961,y:32751,varname:node_8704,prsc:2|A-343-OUT,B-300-T;n:type:ShaderForge.SFN_ValueProperty,id:343,x:31791,y:32751,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_343,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:6417,x:32148,y:32482,varname:node_6417,prsc:2|A-8252-RGB,B-1821-RGB;n:type:ShaderForge.SFN_Multiply,id:5580,x:32540,y:32482,varname:node_5580,prsc:2|A-6144-OUT,B-9239-RGB;n:type:ShaderForge.SFN_Tex2d,id:9239,x:32321,y:32631,ptovrint:False,ptlb:Albedo,ptin:_Albedo,varname:_Shadows_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7c01a5d963ec7c141b138e182b80c628,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4588,x:32002,y:32997,varname:node_4588,prsc:2;proporder:9239-1821-8252-343;pass:END;sub:END;*/

Shader "3P0D's Shaders/Unlit/Unlit wLightmaps Flickering" {
    Properties {
        _Albedo ("Albedo", 2D) = "white" {}
        _Lightmap ("Lightmap", 2D) = "white" {}
        _Multiply ("Multiply", Color) = (0.1,0.1,0.1,1)
        _Speed ("Speed", Float ) = 2
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
            uniform sampler2D _Lightmap; uniform float4 _Lightmap_ST;
            uniform sampler2D _Albedo; uniform float4 _Albedo_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Multiply)
                UNITY_DEFINE_INSTANCED_PROP( float, _Speed)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
////// Lighting:
////// Emissive:
                float4 _Lightmap_var = tex2D(_Lightmap,TRANSFORM_TEX(i.uv1, _Lightmap));
                float4 _Multiply_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Multiply );
                float _Speed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Speed );
                float4 node_300 = _Time;
                float4 _Albedo_var = tex2D(_Albedo,TRANSFORM_TEX(i.uv0, _Albedo));
                float3 node_5580 = (lerp(_Lightmap_var.rgb,(_Multiply_var.rgb*_Lightmap_var.rgb),sin((_Speed_var*node_300.g)))*_Albedo_var.rgb);
                float3 emissive = node_5580;
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
