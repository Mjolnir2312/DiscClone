//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Universal Render Pipeline/Lit" {
Properties {
_WorkflowMode ("WorkflowMode", Float) = 1
_BaseMap ("Albedo", 2D) = "white" { }
_BaseColor ("Color", Color) = (1,1,1,1)
_Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
_Smoothness ("Smoothness", Range(0, 1)) = 0.5
_GlossMapScale ("Smoothness Scale", Range(0, 1)) = 1
_SmoothnessTextureChannel ("Smoothness texture channel", Float) = 0
_Metallic ("Metallic", Range(0, 1)) = 0
_MetallicGlossMap ("Metallic", 2D) = "white" { }
_SpecColor ("Specular", Color) = (0.2,0.2,0.2,1)
_SpecGlossMap ("Specular", 2D) = "white" { }
[ToggleOff] _SpecularHighlights ("Specular Highlights", Float) = 1
[ToggleOff] _EnvironmentReflections ("Environment Reflections", Float) = 1
_BumpScale ("Scale", Float) = 1
_BumpMap ("Normal Map", 2D) = "bump" { }
_Parallax ("Scale", Range(0.005, 0.08)) = 0.005
_ParallaxMap ("Height Map", 2D) = "black" { }
_OcclusionStrength ("Strength", Range(0, 1)) = 1
_OcclusionMap ("Occlusion", 2D) = "white" { }
_EmissionColor ("Color", Color) = (0,0,0,1)
_EmissionMap ("Emission", 2D) = "white" { }
_DetailMask ("Detail Mask", 2D) = "white" { }
_DetailAlbedoMapScale ("Scale", Range(0, 2)) = 1
_DetailAlbedoMap ("Detail Albedo x2", 2D) = "linearGrey" { }
_DetailNormalMapScale ("Scale", Range(0, 2)) = 1
_DetailNormalMap ("Normal Map", 2D) = "bump" { }
_ClearCoatMask ("_ClearCoatMask", Float) = 0
_ClearCoatSmoothness ("_ClearCoatSmoothness", Float) = 0
_Surface ("__surface", Float) = 0
_Blend ("__blend", Float) = 0
_AlphaClip ("__clip", Float) = 0
_SrcBlend ("__src", Float) = 1
_DstBlend ("__dst", Float) = 0
_ZWrite ("__zw", Float) = 1
_Cull ("__cull", Float) = 2
_ReceiveShadows ("Receive Shadows", Float) = 1
_QueueOffset ("Queue offset", Float) = 0
_MainTex ("BaseMap", 2D) = "white" { }
_Color ("Base Color", Color) = (1,1,1,1)
_GlossMapScale ("Smoothness", Float) = 0
_Glossiness ("Smoothness", Float) = 0
_GlossyReflections ("EnvironmentReflections", Float) = 0
unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" { }
unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" { }
unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" { }
}
SubShader {
 LOD 300
 Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "Lit" }
 Pass {
  Name "ForwardLit"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalForward" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "Lit" }
  Blend Zero Zero, Zero Zero
  ZWrite Off
  Cull Off
  GpuProgramID 48450
}
 Pass {
  Name "ShadowCaster"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "Lit" }
  ColorMask 0 0
  Cull Off
  GpuProgramID 108339
}
 Pass {
  Name "GBuffer"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalGBuffer" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "Lit" }
  ZWrite Off
  Cull Off
  GpuProgramID 156315
}
 Pass {
  Name "DepthOnly"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthOnly" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "Lit" }
  ColorMask 0 0
  Cull Off
  GpuProgramID 235670
}
 Pass {
  Name "DepthNormals"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthNormals" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "Lit" }
  Cull Off
  GpuProgramID 306752
}
 Pass {
  Name "Universal2D"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Universal2D" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "Lit" }
  Blend Zero Zero, Zero Zero
  ZWrite Off
  Cull Off
  GpuProgramID 436783
}
}
SubShader {
 LOD 300
 Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "Lit" }
 Pass {
  Name "ForwardLit"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalForward" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "Lit" }
  Blend Zero Zero, Zero Zero
  ZWrite Off
  Cull Off
  GpuProgramID 472412
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb0.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb0.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat4.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb15 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD5.x = (u_xlatb15) ? u_xlat4.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD5.y = (u_xlatb15) ? u_xlat4.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD5.z = (u_xlatb15) ? u_xlat4.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Smoothness;
uniform 	mediump float _Metallic;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
uniform lowp samplerCube unity_SpecCube0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat16;
mediump float u_xlat16_17;
mediump float u_xlat16_22;
float u_xlat23;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = vs_TEXCOORD5.xyz * u_xlat16_1.xxx + _MainLightPosition.xyz;
    u_xlat16_1.x = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_1.xyz = vs_TEXCOORD3.xyz * (-u_xlat16_1.xxx) + (-u_xlat0.xyz);
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_22 = (-u_xlat16_22) + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_3.x = (-_Smoothness) + 1.0;
    u_xlat16_10.x = (-u_xlat16_3.x) * 0.699999988 + 1.70000005;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * 6.0;
    u_xlat10_0 = textureCube(unity_SpecCube0, u_xlat16_1.xyz, u_xlat16_10.x);
    u_xlat16_1.x = u_xlat10_0.w + -1.0;
    u_xlat16_1.x = unity_SpecCube0_HDR.w * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * unity_SpecCube0_HDR.y;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * unity_SpecCube0_HDR.x;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xxx;
    u_xlat16_10.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_17 = (-u_xlat16_10.x) + _Smoothness;
    u_xlat16_17 = u_xlat16_17 + 1.0;
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0 = u_xlat10_0.wxyz * _BaseColor.wxyz;
    u_xlat16_4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_5.xyz = vec3(u_xlat16_17) + (-u_xlat16_4.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_22 = u_xlat16_3.x * u_xlat16_3.x + 1.0;
    u_xlat16_22 = float(1.0) / u_xlat16_22;
    u_xlat6.xyz = u_xlat16_5.xyz * vec3(u_xlat16_22);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_0.yzw;
    u_xlat16_1.xyz = vs_TEXCOORD1.xyz * u_xlat16_10.xyz + u_xlat16_1.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_22 = u_xlat16_22 * unity_LightData.z;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * _MainLightColor.xyz;
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat16_22 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat16_22) * u_xlat2.xyz;
    u_xlat23 = dot(_MainLightPosition.xyz, u_xlat2.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_22 = u_xlat23 * u_xlat23;
    u_xlat9 = max(u_xlat16_22, 0.100000001);
    u_xlat16 = u_xlat16_3.x * u_xlat16_3.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat16 + 1.00001001;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat9 * u_xlat2.x;
    u_xlat9 = u_xlat16_3.x * 4.0 + 2.0;
    u_xlat16_22 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat2.x = u_xlat9 * u_xlat2.x;
    u_xlat2.x = u_xlat16_22 / u_xlat2.x;
    u_xlat16_22 = u_xlat2.x + -6.10351562e-05;
    u_xlat16_22 = max(u_xlat16_22, 0.0);
    u_xlat16_22 = min(u_xlat16_22, 100.0);
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_22) + u_xlat16_10.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.x : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM vec4 _DetailAlbedoMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Smoothness;
	UNITY_UNIFORM mediump float _Metallic;
	UNITY_UNIFORM mediump float _BumpScale;
	UNITY_UNIFORM mediump float _Parallax;
	UNITY_UNIFORM mediump float _OcclusionStrength;
	UNITY_UNIFORM mediump float _ClearCoatMask;
	UNITY_UNIFORM mediump float _ClearCoatSmoothness;
	UNITY_UNIFORM mediump float _DetailAlbedoMapScale;
	UNITY_UNIFORM mediump float _DetailNormalMapScale;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb0.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb0.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat4.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb15 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD5.x = (u_xlatb15) ? u_xlat4.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD5.y = (u_xlatb15) ? u_xlat4.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD5.z = (u_xlatb15) ? u_xlat4.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM vec4 _DetailAlbedoMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Smoothness;
	UNITY_UNIFORM mediump float _Metallic;
	UNITY_UNIFORM mediump float _BumpScale;
	UNITY_UNIFORM mediump float _Parallax;
	UNITY_UNIFORM mediump float _OcclusionStrength;
	UNITY_UNIFORM mediump float _ClearCoatMask;
	UNITY_UNIFORM mediump float _ClearCoatSmoothness;
	UNITY_UNIFORM mediump float _DetailAlbedoMapScale;
	UNITY_UNIFORM mediump float _DetailNormalMapScale;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(1) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat16;
mediump float u_xlat16_17;
mediump float u_xlat16_22;
float u_xlat23;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = vs_TEXCOORD5.xyz * u_xlat16_1.xxx + _MainLightPosition.xyz;
    u_xlat16_1.x = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_1.xyz = vs_TEXCOORD3.xyz * (-u_xlat16_1.xxx) + (-u_xlat0.xyz);
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_22 = (-u_xlat16_22) + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_3.x = (-_Smoothness) + 1.0;
    u_xlat16_10.x = (-u_xlat16_3.x) * 0.699999988 + 1.70000005;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * 6.0;
    u_xlat16_0 = textureLod(unity_SpecCube0, u_xlat16_1.xyz, u_xlat16_10.x);
    u_xlat16_1.x = u_xlat16_0.w + -1.0;
    u_xlat16_1.x = unity_SpecCube0_HDR.w * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * unity_SpecCube0_HDR.y;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * unity_SpecCube0_HDR.x;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xxx;
    u_xlat16_10.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_17 = (-u_xlat16_10.x) + _Smoothness;
    u_xlat16_17 = u_xlat16_17 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0 = u_xlat16_0.wxyz * _BaseColor.wxyz;
    u_xlat16_4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_5.xyz = vec3(u_xlat16_17) + (-u_xlat16_4.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_22 = u_xlat16_3.x * u_xlat16_3.x + 1.0;
    u_xlat16_22 = float(1.0) / u_xlat16_22;
    u_xlat6.xyz = u_xlat16_5.xyz * vec3(u_xlat16_22);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_0.yzw;
    u_xlat16_1.xyz = vs_TEXCOORD1.xyz * u_xlat16_10.xyz + u_xlat16_1.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_22 = u_xlat16_22 * unity_LightData.z;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * _MainLightColor.xyz;
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat16_22 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat16_22) * u_xlat2.xyz;
    u_xlat23 = dot(_MainLightPosition.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_22 = u_xlat23 * u_xlat23;
    u_xlat9 = max(u_xlat16_22, 0.100000001);
    u_xlat16 = u_xlat16_3.x * u_xlat16_3.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat16 + 1.00001001;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat9 * u_xlat2.x;
    u_xlat9 = u_xlat16_3.x * 4.0 + 2.0;
    u_xlat16_22 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat2.x = u_xlat9 * u_xlat2.x;
    u_xlat2.x = u_xlat16_22 / u_xlat2.x;
    u_xlat16_22 = u_xlat2.x + -6.10351562e-05;
    u_xlat16_22 = max(u_xlat16_22, 0.0);
    u_xlat16_22 = min(u_xlat16_22, 100.0);
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_22) + u_xlat16_10.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.x : 1.0;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "DepthOnly"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthOnly" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "Lit" }
  ColorMask 0 0
  Cull Off
  GpuProgramID 624191
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM vec4 _DetailAlbedoMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Smoothness;
	UNITY_UNIFORM mediump float _Metallic;
	UNITY_UNIFORM mediump float _BumpScale;
	UNITY_UNIFORM mediump float _Parallax;
	UNITY_UNIFORM mediump float _OcclusionStrength;
	UNITY_UNIFORM mediump float _ClearCoatMask;
	UNITY_UNIFORM mediump float _ClearCoatSmoothness;
	UNITY_UNIFORM mediump float _DetailAlbedoMapScale;
	UNITY_UNIFORM mediump float _DetailNormalMapScale;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
}
 Pass {
  Name "DepthNormals"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthNormals" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "Lit" }
  Cull Off
  GpuProgramID 712143
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2.x = inversesqrt(u_xlat9);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
varying highp vec3 vs_TEXCOORD2;
#define SV_TARGET0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_1.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_1.y = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.z = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(abs(u_xlat0.xyz), vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = u_xlat0.xyz / u_xlat16_1.xxx;
    u_xlat16_7 = (-u_xlat16_1.x) * 0.5 + 0.5;
    u_xlat16_7 = u_xlat16_1.y * 0.5 + u_xlat16_7;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlatb0 = u_xlat16_1.z>=0.0;
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    SV_TARGET0.y = u_xlat16_1.x;
    SV_TARGET0.x = (u_xlatb0) ? u_xlat16_7 : (-u_xlat16_7);
    SV_TARGET0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM vec4 _DetailAlbedoMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Smoothness;
	UNITY_UNIFORM mediump float _Metallic;
	UNITY_UNIFORM mediump float _BumpScale;
	UNITY_UNIFORM mediump float _Parallax;
	UNITY_UNIFORM mediump float _OcclusionStrength;
	UNITY_UNIFORM mediump float _ClearCoatMask;
	UNITY_UNIFORM mediump float _ClearCoatSmoothness;
	UNITY_UNIFORM mediump float _DetailAlbedoMapScale;
	UNITY_UNIFORM mediump float _DetailNormalMapScale;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2.x = inversesqrt(u_xlat9);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_1.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_1.y = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.z = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(abs(u_xlat0.xyz), vec3(1.0, 1.0, 1.0));
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_7 = (-u_xlat16_1.x) * 0.5 + 0.5;
    u_xlat16_7 = u_xlat16_1.y * 0.5 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.z>=0.0);
#else
    u_xlatb0 = u_xlat16_1.z>=0.0;
#endif
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    SV_TARGET0.y = u_xlat16_1.x;
    SV_TARGET0.x = (u_xlatb0) ? u_xlat16_7 : (-u_xlat16_7);
    SV_TARGET0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Universal2D"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Universal2D" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "Lit" }
  Blend Zero Zero, Zero Zero
  ZWrite Off
  Cull Off
  GpuProgramID 819563
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _BaseColor;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * _BaseColor;
    return;
}

#endif
"
}
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM vec4 _DetailAlbedoMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Smoothness;
	UNITY_UNIFORM mediump float _Metallic;
	UNITY_UNIFORM mediump float _BumpScale;
	UNITY_UNIFORM mediump float _Parallax;
	UNITY_UNIFORM mediump float _OcclusionStrength;
	UNITY_UNIFORM mediump float _ClearCoatMask;
	UNITY_UNIFORM mediump float _ClearCoatSmoothness;
	UNITY_UNIFORM mediump float _DetailAlbedoMapScale;
	UNITY_UNIFORM mediump float _DetailNormalMapScale;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM vec4 _DetailAlbedoMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Smoothness;
	UNITY_UNIFORM mediump float _Metallic;
	UNITY_UNIFORM mediump float _BumpScale;
	UNITY_UNIFORM mediump float _Parallax;
	UNITY_UNIFORM mediump float _OcclusionStrength;
	UNITY_UNIFORM mediump float _ClearCoatMask;
	UNITY_UNIFORM mediump float _ClearCoatSmoothness;
	UNITY_UNIFORM mediump float _DetailAlbedoMapScale;
	UNITY_UNIFORM mediump float _DetailNormalMapScale;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * _BaseColor;
    return;
}

#endif
"
}
}
}
}
Fallback "Hidden/Universal Render Pipeline/FallbackError"
CustomEditor "UnityEditor.Rendering.Universal.ShaderGUI.LitShader"
}