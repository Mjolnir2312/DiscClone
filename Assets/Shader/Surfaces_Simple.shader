//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Surfaces/Simple" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Color ("Main Color", Color) = (1,1,1,1)
[Header(Effects)] [Toggle(USE_LIGHTING)] _FakeLighting ("Lighting", Float) = 0
[Toggle(TRANSPARENCY)] _Transparency ("Transparency", Float) = 0
_Visibility ("Visibility", Range(0, 1)) = 1
[Toggle(GRAYSCALE)] _GrayscaleToggle ("Grayscale", Float) = 0
_Grayscale ("Grayscale Amount", Range(0, 1)) = 0
[Toggle(BACKGROUND_FILL)] _BackgroundFillToggle ("Background Fill", Float) = 0
[Header(Other)] [Enum(Two Sided,0, Back,1, Front,2)] _CullMode ("Culling Mode", Float) = 0
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 3666
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * _Color;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "BACKGROUND_FILL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	float _BackgroundFill;
uniform 	vec4 _BackgroundFillColor;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat0 = (-u_xlat0) * vs_COLOR0 + _BackgroundFillColor;
    u_xlat0 = vec4(_BackgroundFill) * u_xlat0 + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "BACKGROUND_FILL" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	float _BackgroundFill;
uniform 	vec4 _BackgroundFillColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * _Color;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat0 = (-u_xlat0) * vs_COLOR0 + _BackgroundFillColor;
    u_xlat0 = vec4(_BackgroundFill) * u_xlat0 + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "TRANSPARENCY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _Color;
uniform 	float _Visibility;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat4;
ivec2 u_xlatu4;
bool u_xlatb4;
bool u_xlatb7;
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
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.x = vs_COLOR0.w * _Color.w;
    u_xlat1.x = u_xlat1.x * _Visibility;
    u_xlatb4 = u_xlat1.x<1.0;
    u_xlatb7 = _Visibility<0.99000001;
    u_xlatb4 = u_xlatb7 && u_xlatb4;
    if(u_xlatb4){
        u_xlat4.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
        u_xlat4.xy = u_xlat4.xy * _ScreenParams.xy;
        u_xlat4.xy = u_xlat4.xy * vec2(0.25, 0.25);
        u_xlatb2.xy = greaterThanEqual(u_xlat4.xyxx, (-u_xlat4.xyxx)).xy;
        u_xlat4.xy = fract(abs(u_xlat4.xy));
        {
            vec2 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat4.x : (-u_xlat4.x);
            hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat4.y : (-u_xlat4.y);
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat4.xy = u_xlat4.xy * vec2(4.0, 4.0);
        u_xlatu4.xy = ivec2(u_xlat4.xy);
        u_xlat2.x = dot(vec4(0.0588235296, 0.764705896, 0.235294119, 0.941176474), ImmCB_0DynamicIndex(int(u_xlatu4.x)));
        u_xlat2.y = dot(vec4(0.529411793, 0.294117659, 0.70588237, 0.470588237), ImmCB_0DynamicIndex(int(u_xlatu4.x)));
        u_xlat2.z = dot(vec4(0.176470593, 0.882352948, 0.117647059, 0.823529422), ImmCB_0DynamicIndex(int(u_xlatu4.x)));
        u_xlat2.w = dot(vec4(0.647058845, 0.411764711, 0.588235319, 0.352941185), ImmCB_0DynamicIndex(int(u_xlatu4.x)));
        u_xlat1 = (-u_xlat2) * ImmCB_0DynamicIndex(int(u_xlatu4.y)) + u_xlat1.xxxx;
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
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "TRANSPARENCY" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _Color;
uniform 	float _Visibility;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat4;
uvec2 u_xlatu4;
bool u_xlatb4;
bool u_xlatb7;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * _Color;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.x = vs_COLOR0.w * _Color.w;
    u_xlat1.x = u_xlat1.x * _Visibility;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat1.x<1.0);
#else
    u_xlatb4 = u_xlat1.x<1.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_Visibility<0.99000001);
#else
    u_xlatb7 = _Visibility<0.99000001;
#endif
    u_xlatb4 = u_xlatb7 && u_xlatb4;
    if(u_xlatb4){
        u_xlat4.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
        u_xlat4.xy = u_xlat4.xy * _ScreenParams.xy;
        u_xlat4.xy = u_xlat4.xy * vec2(0.25, 0.25);
        u_xlatb2.xy = greaterThanEqual(u_xlat4.xyxx, (-u_xlat4.xyxx)).xy;
        u_xlat4.xy = fract(abs(u_xlat4.xy));
        {
            vec2 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat4.x : (-u_xlat4.x);
            hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat4.y : (-u_xlat4.y);
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat4.xy = u_xlat4.xy * vec2(4.0, 4.0);
        u_xlatu4.xy = uvec2(u_xlat4.xy);
        u_xlat2.x = dot(vec4(0.0588235296, 0.764705896, 0.235294119, 0.941176474), ImmCB_0[int(u_xlatu4.x)]);
        u_xlat2.y = dot(vec4(0.529411793, 0.294117659, 0.70588237, 0.470588237), ImmCB_0[int(u_xlatu4.x)]);
        u_xlat2.z = dot(vec4(0.176470593, 0.882352948, 0.117647059, 0.823529422), ImmCB_0[int(u_xlatu4.x)]);
        u_xlat2.w = dot(vec4(0.647058845, 0.411764711, 0.588235319, 0.352941185), ImmCB_0[int(u_xlatu4.x)]);
        u_xlat1 = (-u_xlat2) * ImmCB_0[int(u_xlatu4.y)] + u_xlat1.xxxx;
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
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "USE_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * u_xlat0.yz;
    u_xlat0.x = (-u_xlat0.y) * u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.200000003 + 1.0;
    vs_COLOR0 = u_xlat0.xxxx * in_COLOR0;
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
uniform 	vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "USE_LIGHTING" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * u_xlat0.yz;
    u_xlat0.x = (-u_xlat0.y) * u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.200000003 + 1.0;
    vs_COLOR0 = u_xlat0.xxxx * in_COLOR0;
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
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * _Color;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "GRAYSCALE" "USE_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * u_xlat0.yz;
    u_xlat0.x = (-u_xlat0.y) * u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.200000003 + 1.0;
    vs_COLOR0 = u_xlat0.xxxx * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	float _Grayscale;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_2.x = dot(u_xlat1, u_xlat1);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_2.w = u_xlat1.w * 0.400000006;
    u_xlat0 = (-u_xlat0) * vs_COLOR0 + u_xlat16_2;
    u_xlat0 = vec4(_Grayscale) * u_xlat0 + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "GRAYSCALE" "USE_LIGHTING" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * u_xlat0.yz;
    u_xlat0.x = (-u_xlat0.y) * u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.200000003 + 1.0;
    vs_COLOR0 = u_xlat0.xxxx * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	float _Grayscale;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * _Color;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_2.x = dot(u_xlat1, u_xlat1);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_2.w = u_xlat1.w * 0.400000006;
    u_xlat0 = (-u_xlat0) * vs_COLOR0 + u_xlat16_2;
    u_xlat0 = vec4(_Grayscale) * u_xlat0 + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "TRANSPARENCY" "USE_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xy = u_xlat1.xx * u_xlat1.yz;
    u_xlat1.x = (-u_xlat1.y) * u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.200000003 + 1.0;
    vs_COLOR0 = u_xlat1.xxxx * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	float _Visibility;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat4;
ivec2 u_xlatu4;
bool u_xlatb4;
bool u_xlatb7;
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
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.x = vs_COLOR0.w * _Color.w;
    u_xlat1.x = u_xlat1.x * _Visibility;
    u_xlatb4 = u_xlat1.x<1.0;
    u_xlatb7 = _Visibility<0.99000001;
    u_xlatb4 = u_xlatb7 && u_xlatb4;
    if(u_xlatb4){
        u_xlat4.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
        u_xlat4.xy = u_xlat4.xy * _ScreenParams.xy;
        u_xlat4.xy = u_xlat4.xy * vec2(0.25, 0.25);
        u_xlatb2.xy = greaterThanEqual(u_xlat4.xyxx, (-u_xlat4.xyxx)).xy;
        u_xlat4.xy = fract(abs(u_xlat4.xy));
        {
            vec2 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat4.x : (-u_xlat4.x);
            hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat4.y : (-u_xlat4.y);
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat4.xy = u_xlat4.xy * vec2(4.0, 4.0);
        u_xlatu4.xy = ivec2(u_xlat4.xy);
        u_xlat2.x = dot(vec4(0.0588235296, 0.764705896, 0.235294119, 0.941176474), ImmCB_0DynamicIndex(int(u_xlatu4.x)));
        u_xlat2.y = dot(vec4(0.529411793, 0.294117659, 0.70588237, 0.470588237), ImmCB_0DynamicIndex(int(u_xlatu4.x)));
        u_xlat2.z = dot(vec4(0.176470593, 0.882352948, 0.117647059, 0.823529422), ImmCB_0DynamicIndex(int(u_xlatu4.x)));
        u_xlat2.w = dot(vec4(0.647058845, 0.411764711, 0.588235319, 0.352941185), ImmCB_0DynamicIndex(int(u_xlatu4.x)));
        u_xlat1 = (-u_xlat2) * ImmCB_0DynamicIndex(int(u_xlatu4.y)) + u_xlat1.xxxx;
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
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "TRANSPARENCY" "USE_LIGHTING" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xy = u_xlat1.xx * u_xlat1.yz;
    u_xlat1.x = (-u_xlat1.y) * u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.200000003 + 1.0;
    vs_COLOR0 = u_xlat1.xxxx * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	float _Visibility;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat4;
uvec2 u_xlatu4;
bool u_xlatb4;
bool u_xlatb7;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * _Color;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.x = vs_COLOR0.w * _Color.w;
    u_xlat1.x = u_xlat1.x * _Visibility;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat1.x<1.0);
#else
    u_xlatb4 = u_xlat1.x<1.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_Visibility<0.99000001);
#else
    u_xlatb7 = _Visibility<0.99000001;
#endif
    u_xlatb4 = u_xlatb7 && u_xlatb4;
    if(u_xlatb4){
        u_xlat4.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
        u_xlat4.xy = u_xlat4.xy * _ScreenParams.xy;
        u_xlat4.xy = u_xlat4.xy * vec2(0.25, 0.25);
        u_xlatb2.xy = greaterThanEqual(u_xlat4.xyxx, (-u_xlat4.xyxx)).xy;
        u_xlat4.xy = fract(abs(u_xlat4.xy));
        {
            vec2 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat4.x : (-u_xlat4.x);
            hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat4.y : (-u_xlat4.y);
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat4.xy = u_xlat4.xy * vec2(4.0, 4.0);
        u_xlatu4.xy = uvec2(u_xlat4.xy);
        u_xlat2.x = dot(vec4(0.0588235296, 0.764705896, 0.235294119, 0.941176474), ImmCB_0[int(u_xlatu4.x)]);
        u_xlat2.y = dot(vec4(0.529411793, 0.294117659, 0.70588237, 0.470588237), ImmCB_0[int(u_xlatu4.x)]);
        u_xlat2.z = dot(vec4(0.176470593, 0.882352948, 0.117647059, 0.823529422), ImmCB_0[int(u_xlatu4.x)]);
        u_xlat2.w = dot(vec4(0.647058845, 0.411764711, 0.588235319, 0.352941185), ImmCB_0[int(u_xlatu4.x)]);
        u_xlat1 = (-u_xlat2) * ImmCB_0[int(u_xlatu4.y)] + u_xlat1.xxxx;
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
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "GRAYSCALE" "TRANSPARENCY" "USE_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xy = u_xlat1.xx * u_xlat1.yz;
    u_xlat1.x = (-u_xlat1.y) * u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.200000003 + 1.0;
    vs_COLOR0 = u_xlat1.xxxx * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	float _Visibility;
uniform 	float _Grayscale;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb3;
vec2 u_xlat5;
ivec2 u_xlatu5;
bool u_xlatb5;
bool u_xlatb9;
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
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_2.x = dot(u_xlat1, u_xlat1);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_2.w = u_xlat1.w * 0.400000006;
    u_xlat0 = (-u_xlat0) * vs_COLOR0 + u_xlat16_2;
    u_xlat0 = vec4(vec4(_Grayscale, _Grayscale, _Grayscale, _Grayscale)) * u_xlat0 + u_xlat1;
    u_xlat1.x = vs_COLOR0.w * _Color.w;
    u_xlat1.x = u_xlat1.x * _Visibility;
    u_xlatb5 = u_xlat1.x<1.0;
    u_xlatb9 = _Visibility<0.99000001;
    u_xlatb5 = u_xlatb9 && u_xlatb5;
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
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "GRAYSCALE" "TRANSPARENCY" "USE_LIGHTING" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xy = u_xlat1.xx * u_xlat1.yz;
    u_xlat1.x = (-u_xlat1.y) * u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.200000003 + 1.0;
    vs_COLOR0 = u_xlat1.xxxx * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	float _Visibility;
uniform 	float _Grayscale;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
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
bool u_xlatb9;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * _Color;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_2.x = dot(u_xlat1, u_xlat1);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_2.w = u_xlat1.w * 0.400000006;
    u_xlat0 = (-u_xlat0) * vs_COLOR0 + u_xlat16_2;
    u_xlat0 = vec4(vec4(_Grayscale, _Grayscale, _Grayscale, _Grayscale)) * u_xlat0 + u_xlat1;
    u_xlat1.x = vs_COLOR0.w * _Color.w;
    u_xlat1.x = u_xlat1.x * _Visibility;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.x<1.0);
#else
    u_xlatb5 = u_xlat1.x<1.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Visibility<0.99000001);
#else
    u_xlatb9 = _Visibility<0.99000001;
#endif
    u_xlatb5 = u_xlatb9 && u_xlatb5;
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
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "BACKGROUND_FILL" "GRAYSCALE" "TRANSPARENCY" "USE_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xy = u_xlat1.xx * u_xlat1.yz;
    u_xlat1.x = (-u_xlat1.y) * u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.200000003 + 1.0;
    vs_COLOR0 = u_xlat1.xxxx * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	float _Visibility;
uniform 	float _Grayscale;
uniform 	float _BackgroundFill;
uniform 	vec4 _BackgroundFillColor;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb3;
vec2 u_xlat5;
ivec2 u_xlatu5;
bool u_xlatb5;
bool u_xlatb9;
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
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_2.x = dot(u_xlat1, u_xlat1);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_2.w = u_xlat1.w * 0.400000006;
    u_xlat0 = (-u_xlat0) * vs_COLOR0 + u_xlat16_2;
    u_xlat0 = vec4(vec4(_Grayscale, _Grayscale, _Grayscale, _Grayscale)) * u_xlat0 + u_xlat1;
    u_xlat1 = (-u_xlat0) + _BackgroundFillColor;
    u_xlat0 = vec4(vec4(_BackgroundFill, _BackgroundFill, _BackgroundFill, _BackgroundFill)) * u_xlat1 + u_xlat0;
    u_xlat1.x = vs_COLOR0.w * _Color.w;
    u_xlat1.x = u_xlat1.x * _Visibility;
    u_xlatb5 = u_xlat1.x<1.0;
    u_xlatb9 = _Visibility<0.99000001;
    u_xlatb5 = u_xlatb9 && u_xlatb5;
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
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "BACKGROUND_FILL" "GRAYSCALE" "TRANSPARENCY" "USE_LIGHTING" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xy = u_xlat1.xx * u_xlat1.yz;
    u_xlat1.x = (-u_xlat1.y) * u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.200000003 + 1.0;
    vs_COLOR0 = u_xlat1.xxxx * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	float _Visibility;
uniform 	float _Grayscale;
uniform 	float _BackgroundFill;
uniform 	vec4 _BackgroundFillColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
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
bool u_xlatb9;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * _Color;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_2.x = dot(u_xlat1, u_xlat1);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_2.w = u_xlat1.w * 0.400000006;
    u_xlat0 = (-u_xlat0) * vs_COLOR0 + u_xlat16_2;
    u_xlat0 = vec4(vec4(_Grayscale, _Grayscale, _Grayscale, _Grayscale)) * u_xlat0 + u_xlat1;
    u_xlat1 = (-u_xlat0) + _BackgroundFillColor;
    u_xlat0 = vec4(vec4(_BackgroundFill, _BackgroundFill, _BackgroundFill, _BackgroundFill)) * u_xlat1 + u_xlat0;
    u_xlat1.x = vs_COLOR0.w * _Color.w;
    u_xlat1.x = u_xlat1.x * _Visibility;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.x<1.0);
#else
    u_xlatb5 = u_xlat1.x<1.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Visibility<0.99000001);
#else
    u_xlatb9 = _Visibility<0.99000001;
#endif
    u_xlatb5 = u_xlatb9 && u_xlatb5;
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
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
}
}
}