#version 440
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shading_language_420pack : require

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
precise vec4 u_xlat_precise_vec4;
precise ivec4 u_xlat_precise_ivec4;
precise bvec4 u_xlat_precise_bvec4;
precise uvec4 u_xlat_precise_uvec4;
layout(set = 0, binding = 18, std140) uniform VGlobals {
	vec4 _Time;
	vec4 _ProjectionParams;
	mat4x4 unity_ObjectToWorld;
	mat4x4 unity_WorldToObject;
	vec4 unity_WorldTransformParams;
	mat4x4 unity_MatrixVP;
	float _Cutoff;
	float _DisplaceAmount;
	vec4 _Noise_ST;
	vec4 _MainTex_ST;
};
layout(set = 0, binding = 1) uniform mediump texture2D _Noise;
layout(set = 0, binding = 19) uniform mediump texture2D _Gradient;
layout(location = 0) in highp vec4 in_POSITION0;
layout(location = 1) in highp vec4 in_TANGENT0;
layout(location = 2) in highp vec3 in_NORMAL0;
layout(location = 3) in highp vec4 in_TEXCOORD0;
layout(location = 0) out highp vec4 vs_TEXCOORD0;
layout(location = 1) out highp vec4 vs_TEXCOORD1;
layout(location = 2) out highp vec4 vs_TEXCOORD2;
layout(location = 3) out highp vec4 vs_TEXCOORD3;
layout(location = 4) out highp vec4 vs_TEXCOORD6;
highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
layout(set = 0, binding = 14) uniform mediump  sampler sampler_Noise;
layout(set = 0, binding = 20) uniform mediump  sampler sampler_Gradient;
void main()
{
    u_xlat0.x = textureLod(sampler2D(_Gradient, sampler_Gradient), in_TEXCOORD0.xy, 0.0).x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_Cutoff);
    u_xlat0.x = u_xlat0.x * -3.33333325;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xy;
    u_xlat5.xy = unity_ObjectToWorld[0].xy * in_POSITION0.xx + u_xlat5.xy;
    u_xlat1.yz = unity_ObjectToWorld[2].xy * in_POSITION0.zz + u_xlat5.xy;
    u_xlat1.x = _Time.x * 30.0 + u_xlat1.y;
    u_xlat5.xy = u_xlat1.xz * vec2(0.5, 0.5);
    u_xlat5.xyz = textureLod(sampler2D(_Noise, sampler_Noise), u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = u_xlat5.xyz * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Cutoff, _Cutoff, _Cutoff));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_DisplaceAmount, _DisplaceAmount, _DisplaceAmount)) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Noise_ST.xy + _Noise_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    vs_TEXCOORD1.y = u_xlat4.x;
    vs_TEXCOORD1.x = u_xlat3.z;
    vs_TEXCOORD1.z = u_xlat2.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.x = u_xlat3.x;
    vs_TEXCOORD3.x = u_xlat3.y;
    vs_TEXCOORD2.z = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat2.x;
    vs_TEXCOORD2.y = u_xlat4.y;
    vs_TEXCOORD3.y = u_xlat4.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

