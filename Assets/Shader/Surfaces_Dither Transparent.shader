//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Surfaces/Dither Transparent" {
Properties {
[Enum(Two Sided,0, Back,1, Front,2)] _CullMode ("Culling Mode", Float) = 0
_Color ("Main Color", Color) = (1,1,1,1)
_Brightness ("Brightness", Float) = 1
_Visibility ("Visibility", Range(0, 1)) = 1
_MainTex ("Base (RGB)", 2D) = "white" { }
[Header(Lighting)] _SunlightColor ("Light Color", Color) = (1,1,1,1)
_SunlightDirection ("Light Direction", Vector) = (-0.5,1,-0.5,0)
[Toggle] _DirLighting ("Directional", Float) = 1
[Toggle] _AmbLighting ("Ambient", Float) = 1
[Header(Effects)] _Grayscale ("Grayscale", Range(0, 1)) = 0
}
SubShader {
 LOD 200
 Tags { "RenderPipeline" = "LightweightPipeline" "RenderType" = "Opaque" }
 Pass {
  LOD 200
  Tags { "RenderPipeline" = "LightweightPipeline" "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 14124
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _DirLighting;
uniform 	float _AmbLighting;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SunlightColor;
uniform 	vec4 _SunlightDirection;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_COLOR0;
varying mediump vec4 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1 = vec4(u_xlat19) * u_xlat1.xyzz;
    u_xlat16_2.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_2.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_2.x);
    u_xlat16_3 = u_xlat1.yzwx * u_xlat1.xywz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
    u_xlat5 = dot(u_xlat1.xyz, _SunlightDirection.xyz);
    u_xlat5 = max(u_xlat5, 0.0);
    u_xlat3 = vec4(u_xlat5) * _SunlightColor;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb19 = _DirLighting==1.0;
    u_xlat16_2 = (bool(u_xlatb19)) ? u_xlat3 : vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat1.xyz + u_xlat16_2.xyz;
    u_xlatb1 = _AmbLighting==1.0;
    vs_COLOR1.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    vs_COLOR1.w = u_xlat16_2.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	float _Grayscale;
uniform 	float _Brightness;
uniform 	float _Visibility;
uniform 	vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_COLOR0;
varying mediump vec4 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb3;
vec2 u_xlat5;
ivec2 u_xlatu5;
bool u_xlatb5;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _Color;
    u_xlat0 = u_xlat0 * vec4(vec4(_Brightness, _Brightness, _Brightness, _Brightness));
    u_xlat16_0 = u_xlat0 * vs_COLOR1;
    u_xlatb1.x = 0.00999999978<_Grayscale;
    u_xlat16_2.x = dot(u_xlat16_0, u_xlat16_0);
    u_xlat16_2.xyz = sqrt(u_xlat16_2.xxx);
    u_xlat16_2.w = u_xlat16_0.w;
    u_xlat2 = u_xlat16_2 * vec4(0.5, 0.5, 0.5, 0.5) + (-u_xlat16_0);
    u_xlat2 = vec4(_Grayscale) * u_xlat2 + u_xlat16_0;
    u_xlat16_0 = (u_xlatb1.x) ? u_xlat2 : u_xlat16_0;
    u_xlat1.x = vs_COLOR0.w * _Color.w;
    u_xlat1.x = u_xlat1.x * _Visibility;
    u_xlatb5 = u_xlat1.x<1.0;
    if(u_xlatb5){
        u_xlat5.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
        u_xlat5.xy = u_xlat5.xy * _ScreenParams.xy;
        u_xlat5.xy = u_xlat5.xy * vec2(0.25, 0.25);
        u_xlatb3.xy = greaterThanEqual(u_xlat5.xyxx, (-u_xlat5.xyxx)).xy;
        u_xlat5.xy = fract(abs(u_xlat5.xy));
        {
            vec2 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat5.x : (-u_xlat5.x);
            hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat5.y : (-u_xlat5.y);
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat5.xy = u_xlat5.xy * vec2(4.0, 4.0);
        u_xlatu5.xy = ivec2(u_xlat5.xy);
        u_xlat2.x = dot(vec4(0.0588235296, 0.764705896, 0.235294119, 0.941176474), ImmCB_0DynamicIndex(int(u_xlatu5.x)));
        u_xlat2.y = dot(vec4(0.529411793, 0.294117659, 0.70588237, 0.470588237), ImmCB_0DynamicIndex(int(u_xlatu5.x)));
        u_xlat2.z = dot(vec4(0.176470593, 0.882352948, 0.117647059, 0.823529422), ImmCB_0DynamicIndex(int(u_xlatu5.x)));
        u_xlat2.w = dot(vec4(0.647058845, 0.411764711, 0.588235319, 0.352941185), ImmCB_0DynamicIndex(int(u_xlatu5.x)));
        u_xlat1 = (-u_xlat2) * ImmCB_0DynamicIndex(int(u_xlatu5.y)) + u_xlat1.xxxx;
        u_xlatb1 = lessThan(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
        {
            bvec4 hlslcc_orTemp = u_xlatb1;
            hlslcc_orTemp.x = u_xlatb1.z || u_xlatb1.x;
            hlslcc_orTemp.y = u_xlatb1.w || u_xlatb1.y;
            u_xlatb1 = hlslcc_orTemp;
        }
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
        if(u_xlatb1.x){discard;}
    }
    SV_Target0 = u_xlat16_0;
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
uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _DirLighting;
uniform 	float _AmbLighting;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _SunlightColor;
uniform 	vec4 _SunlightDirection;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1 = vec4(u_xlat19) * u_xlat1.xyzz;
    u_xlat16_2.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_2.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_2.x);
    u_xlat16_3 = u_xlat1.yzwx * u_xlat1.xywz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
    u_xlat5 = dot(u_xlat1.xyz, _SunlightDirection.xyz);
    u_xlat5 = max(u_xlat5, 0.0);
    u_xlat3 = vec4(u_xlat5) * _SunlightColor;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_DirLighting==1.0);
#else
    u_xlatb19 = _DirLighting==1.0;
#endif
    u_xlat16_2 = (bool(u_xlatb19)) ? u_xlat3 : vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_AmbLighting==1.0);
#else
    u_xlatb1 = _AmbLighting==1.0;
#endif
    vs_COLOR1.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    vs_COLOR1.w = u_xlat16_2.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	float _Grayscale;
uniform 	float _Brightness;
uniform 	float _Visibility;
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_COLOR1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb3;
vec2 u_xlat5;
uvec2 u_xlatu5;
bool u_xlatb5;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _Color;
    u_xlat0 = u_xlat0 * vec4(vec4(_Brightness, _Brightness, _Brightness, _Brightness));
    u_xlat16_0 = u_xlat0 * vs_COLOR1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.00999999978<_Grayscale);
#else
    u_xlatb1.x = 0.00999999978<_Grayscale;
#endif
    u_xlat16_2.x = dot(u_xlat16_0, u_xlat16_0);
    u_xlat16_2.xyz = sqrt(u_xlat16_2.xxx);
    u_xlat16_2.w = u_xlat16_0.w;
    u_xlat2 = u_xlat16_2 * vec4(0.5, 0.5, 0.5, 0.5) + (-u_xlat16_0);
    u_xlat2 = vec4(_Grayscale) * u_xlat2 + u_xlat16_0;
    u_xlat16_0 = (u_xlatb1.x) ? u_xlat2 : u_xlat16_0;
    u_xlat1.x = vs_COLOR0.w * _Color.w;
    u_xlat1.x = u_xlat1.x * _Visibility;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.x<1.0);
#else
    u_xlatb5 = u_xlat1.x<1.0;
#endif
    if(u_xlatb5){
        u_xlat5.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
        u_xlat5.xy = u_xlat5.xy * _ScreenParams.xy;
        u_xlat5.xy = u_xlat5.xy * vec2(0.25, 0.25);
        u_xlatb3.xy = greaterThanEqual(u_xlat5.xyxx, (-u_xlat5.xyxx)).xy;
        u_xlat5.xy = fract(abs(u_xlat5.xy));
        {
            vec2 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat5.x : (-u_xlat5.x);
            hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat5.y : (-u_xlat5.y);
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat5.xy = u_xlat5.xy * vec2(4.0, 4.0);
        u_xlatu5.xy = uvec2(u_xlat5.xy);
        u_xlat2.x = dot(vec4(0.0588235296, 0.764705896, 0.235294119, 0.941176474), ImmCB_0[int(u_xlatu5.x)]);
        u_xlat2.y = dot(vec4(0.529411793, 0.294117659, 0.70588237, 0.470588237), ImmCB_0[int(u_xlatu5.x)]);
        u_xlat2.z = dot(vec4(0.176470593, 0.882352948, 0.117647059, 0.823529422), ImmCB_0[int(u_xlatu5.x)]);
        u_xlat2.w = dot(vec4(0.647058845, 0.411764711, 0.588235319, 0.352941185), ImmCB_0[int(u_xlatu5.x)]);
        u_xlat1 = (-u_xlat2) * ImmCB_0[int(u_xlatu5.y)] + u_xlat1.xxxx;
        u_xlatb1 = lessThan(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
        {
            bvec4 hlslcc_orTemp = u_xlatb1;
            hlslcc_orTemp.x = u_xlatb1.z || u_xlatb1.x;
            hlslcc_orTemp.y = u_xlatb1.w || u_xlatb1.y;
            u_xlatb1 = hlslcc_orTemp;
        }
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
        if(u_xlatb1.x){discard;}
    }
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
}
}
}
}