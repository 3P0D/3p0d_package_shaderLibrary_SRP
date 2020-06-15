// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:5261,x:33085,y:32670,varname:node_5261,prsc:2|emission-9775-OUT,alpha-4634-A;n:type:ShaderForge.SFN_Tex2d,id:4900,x:32063,y:32592,ptovrint:False,ptlb:Shadows,ptin:_Shadows,varname:node_4900,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:804d3817a1097c941ab86d7004e4004e,ntxv:0,isnm:False|UVIN-9429-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5987,x:32063,y:32788,ptovrint:False,ptlb:Albedo,ptin:_Albedo,varname:_node_4900_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7c01a5d963ec7c141b138e182b80c628,ntxv:0,isnm:False|UVIN-5907-UVOUT;n:type:ShaderForge.SFN_Multiply,id:7451,x:32255,y:32683,varname:node_7451,prsc:2|A-4900-RGB,B-5987-RGB;n:type:ShaderForge.SFN_TexCoord,id:5907,x:31792,y:32799,varname:node_5907,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_TexCoord,id:9429,x:31792,y:32590,varname:node_9429,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Add,id:9987,x:32638,y:32513,varname:node_9987,prsc:2|A-7505-OUT,B-7451-OUT;n:type:ShaderForge.SFN_Tex2d,id:8395,x:32255,y:32510,ptovrint:False,ptlb:Highlights,ptin:_Highlights,varname:node_8395,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:804d3817a1097c941ab86d7004e4004e,ntxv:0,isnm:False|UVIN-9429-UVOUT;n:type:ShaderForge.SFN_Color,id:3930,x:32255,y:32349,ptovrint:False,ptlb:Highlights Tint,ptin:_HighlightsTint,varname:node_3930,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9895096,c2:1,c3:0.7028302,c4:1;n:type:ShaderForge.SFN_Multiply,id:7505,x:32422,y:32426,varname:node_7505,prsc:2|A-3930-RGB,B-8395-RGB;n:type:ShaderForge.SFN_Tex2d,id:4634,x:32620,y:33205,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:node_4634,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2b1a8adf5ffb3794ba0c6a9856cb3b46,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:6794,x:32409,y:33090,ptovrint:False,ptlb:Glow Outline,ptin:_GlowOutline,varname:_GlowOutline_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.05;n:type:ShaderForge.SFN_Slider,id:1817,x:32409,y:32992,ptovrint:False,ptlb:Glow Power,ptin:_GlowPower,varname:_GlowPower_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Color,id:529,x:32251,y:32980,ptovrint:False,ptlb:Glow Color,ptin:_GlowColor,varname:_GlowColor_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.517005,c4:1;n:type:ShaderForge.SFN_Fresnel,id:7833,x:32251,y:32832,varname:node_7833,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7296,x:32409,y:32832,varname:node_7296,prsc:2|A-7833-OUT,B-529-RGB;n:type:ShaderForge.SFN_Multiply,id:7336,x:32613,y:32808,varname:node_7336,prsc:2|A-7296-OUT,B-1817-OUT;n:type:ShaderForge.SFN_Add,id:9775,x:32826,y:32699,varname:node_9775,prsc:2|A-9987-OUT,B-7336-OUT;proporder:5987-4900-8395-3930-4634-1817-529;pass:END;sub:END;*/

Shader "3P0D's Shaders/SRP/Unlit/Unlit wShadowmap wHighlights wAlpha wGlowing" {
    Properties {
        _Albedo ("Albedo", 2D) = "white" {}
        _Shadows ("Shadows", 2D) = "white" {}
        _Highlights ("Highlights", 2D) = "white" {}
        _HighlightsTint ("Highlights Tint", Color) = (0.9895096,1,0.7028302,1)
        _Opacity ("Opacity", 2D) = "white" {}
        _GlowPower ("Glow Power", Range(0, 2)) = 1
        _GlowColor ("Glow Color", Color) = (0,1,0.517005,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Shadows; uniform float4 _Shadows_ST;
            uniform sampler2D _Albedo; uniform float4 _Albedo_ST;
            uniform sampler2D _Highlights; uniform float4 _Highlights_ST;
            uniform sampler2D _Opacity; uniform float4 _Opacity_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighlightsTint)
                UNITY_DEFINE_INSTANCED_PROP( float, _GlowPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _GlowColor)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
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
                float4 _HighlightsTint_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighlightsTint );
                float4 _Highlights_var = tex2D(_Highlights,TRANSFORM_TEX(i.uv1, _Highlights));
                float4 _Shadows_var = tex2D(_Shadows,TRANSFORM_TEX(i.uv1, _Shadows));
                float4 _Albedo_var = tex2D(_Albedo,TRANSFORM_TEX(i.uv0, _Albedo));
                float4 _GlowColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _GlowColor );
                float _GlowPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _GlowPower );
                float3 emissive = (((_HighlightsTint_var.rgb*_Highlights_var.rgb)+(_Shadows_var.rgb*_Albedo_var.rgb))+(((1.0-max(0,dot(normalDirection, viewDirection)))*_GlowColor_var.rgb)*_GlowPower_var));
                float3 finalColor = emissive;
                float4 _Opacity_var = tex2D(_Opacity,TRANSFORM_TEX(i.uv0, _Opacity));
                fixed4 finalRGBA = fixed4(finalColor,_Opacity_var.a);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
