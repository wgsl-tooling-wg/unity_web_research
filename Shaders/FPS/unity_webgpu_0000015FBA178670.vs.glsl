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
layout(set = 0, binding = 16, std140) uniform VGlobals {
	vec4 _ProjectionParams;
	vec4 unity_4LightPosX0;
	vec4 unity_4LightPosY0;
	vec4 unity_4LightPosZ0;
	vec4 unity_4LightAtten0;
	vec4 unity_LightColor[8];
	vec4 unity_SHBr;
	vec4 unity_SHBg;
	vec4 unity_SHBb;
	vec4 unity_SHC;
	mat4x4 unity_ObjectToWorld;
	mat4x4 unity_WorldToObject;
	vec4 unity_WorldTransformParams;
	mat4x4 unity_MatrixVP;
	vec4 _MainTex_ST;
};
layout(location = 0) in highp vec4 in_POSITION0;
layout(location = 1) in highp vec4 in_TANGENT0;
layout(location = 2) in highp vec3 in_NORMAL0;
layout(location = 3) in highp vec4 in_TEXCOORD0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 1) out highp vec4 vs_TEXCOORD1;
layout(location = 2) out highp vec4 vs_TEXCOORD2;
layout(location = 3) out highp vec4 vs_TEXCOORD3;
layout(location = 4) out highp vec3 vs_TEXCOORD4;
layout(location = 5) out highp vec4 vs_TEXCOORD6;
highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
float u_xlat20;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TEXCOORD1.x = u_xlat2.z;
    u_xlat18 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
    u_xlat20 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat3 = vec4(u_xlat20) * u_xlat3.xyzz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
    vs_TEXCOORD1.y = u_xlat4.x;
    vs_TEXCOORD1.w = u_xlat0.x;
    vs_TEXCOORD1.z = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.y = u_xlat4.y;
    vs_TEXCOORD3.y = u_xlat4.z;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD2.z = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat3.w;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat4 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat3.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = u_xlat2 * u_xlat2 + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat3.xxxx + u_xlat5;
    u_xlat2 = u_xlat0 * u_xlat3.wwzw + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat4;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat4;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat18 = u_xlat3.y * u_xlat3.y;
    u_xlat18 = u_xlat3.x * u_xlat3.x + (-u_xlat18);
    u_xlat2 = u_xlat3.ywzx * u_xlat3;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

