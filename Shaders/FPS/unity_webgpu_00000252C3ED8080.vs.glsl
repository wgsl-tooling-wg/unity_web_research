#version 440
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shading_language_420pack : require
const int UNITY_RUNTIME_INSTANCING_ARRAY_SIZE = 2;

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
layout(set = 0, binding = 14, std140) uniform VGlobals {
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
	vec4 unity_WorldTransformParams;
	mat4x4 unity_MatrixVP;
	vec4 _MainTex_ST;
};
layout(set = 0, binding = 15, std140) uniform UnityDrawCallInfo {
	int unity_BaseInstanceID;
	int unity_InstanceCount;
};
struct unity_Builtins0Array_Type {
	mat4x4 unity_ObjectToWorldArray;
	mat4x4 unity_WorldToObjectArray;
};
layout(set = 0, binding = 16, std140) uniform UnityInstancing_PerDraw0 {
	unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
};
layout(location = 0) in highp vec4 in_POSITION0;
layout(location = 1) in highp vec3 in_NORMAL0;
layout(location = 2) in highp vec4 in_COLOR0;
layout(location = 3) in highp vec2 in_TEXCOORD0;
layout(location = 4) in highp vec4 in_TANGENT0;
layout(location = 0) out highp vec4 vs_TEXCOORD0;
layout(location = 1) out highp vec4 vs_TEXCOORD1;
layout(location = 2) out highp vec4 vs_TEXCOORD2;
layout(location = 3) out highp vec4 vs_COLOR0;
layout(location = 4) out highp vec2 vs_TEXCOORD3;
layout(location = 5) out highp vec3 vs_TEXCOORD4;
layout(location = 6) out highp vec4 vs_TEXCOORD6;
highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat18;
float u_xlat20;
void main()
{
    u_xlati0 = gl_InstanceIndex + unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 3;
    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].unity_ObjectToWorldArray[1];
    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].unity_ObjectToWorldArray[3];
    u_xlat6.xyz = unity_Builtins0Array[u_xlati0 / 8].unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = u_xlat2.yyyy * unity_MatrixVP[1];
    u_xlat1 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * unity_Builtins0Array[u_xlati0 / 8].unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = unity_Builtins0Array[u_xlati0 / 8].unity_ObjectToWorldArray[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = unity_Builtins0Array[u_xlati0 / 8].unity_ObjectToWorldArray[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    u_xlat3.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    vs_TEXCOORD0.y = u_xlat4.x;
    vs_TEXCOORD0.x = u_xlat2.z;
    vs_TEXCOORD0.z = u_xlat3.x;
    vs_TEXCOORD0.w = u_xlat6.x;
    vs_TEXCOORD1.x = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat2.y;
    vs_TEXCOORD1.w = u_xlat6.y;
    vs_TEXCOORD1.y = u_xlat4.y;
    vs_TEXCOORD2.y = u_xlat4.z;
    vs_TEXCOORD1.z = u_xlat3.y;
    vs_TEXCOORD2.w = u_xlat6.z;
    vs_TEXCOORD2.z = u_xlat3.w;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat6.xxxx) + unity_4LightPosX0;
    u_xlat4 = (-u_xlat6.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat6.zzzz) + unity_4LightPosZ0;
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
    vs_SV_InstanceID0 =  uint(gl_InstanceIndex);
    return;
}

