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
layout(set = 0, binding = 11, std140) uniform VGlobals {
	vec4 unity_WorldTransformParams;
	mat4x4 unity_MatrixVP;
	vec4 _MainTex_ST;
};
layout(set = 0, binding = 1, std140) uniform UnityDrawCallInfo {
	int unity_BaseInstanceID;
	int unity_InstanceCount;
};
struct unity_Builtins0Array_Type {
	mat4x4 unity_ObjectToWorldArray;
	mat4x4 unity_WorldToObjectArray;
};
layout(set = 0, binding = 12, std140) uniform UnityInstancing_PerDraw0 {
	unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
};
struct unity_Builtins2Array_Type {
	vec4 unity_SHArArray;
	vec4 unity_SHAgArray;
	vec4 unity_SHAbArray;
	vec4 unity_SHBrArray;
	vec4 unity_SHBgArray;
	vec4 unity_SHBbArray;
	vec4 unity_SHCArray;
};
layout(set = 0, binding = 2, std140) uniform UnityInstancing_PerDraw2 {
	unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
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
highp vec4 vs_TEXCOORD5;
layout(location = 5) out highp vec3 vs_TEXCOORD6;
layout(location = 6) flat out highp uint vs_SV_InstanceID0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
int u_xlati4;
float u_xlat8;
float u_xlat13;
void main()
{
    u_xlati0 = gl_InstanceIndex + unity_BaseInstanceID;
    u_xlati4 = u_xlati0 << 3;
    u_xlati0 = u_xlati0 * 7;
    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati4 / 8].unity_ObjectToWorldArray[1];
    u_xlat1 = unity_Builtins0Array[u_xlati4 / 8].unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = unity_Builtins0Array[u_xlati4 / 8].unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati4 / 8].unity_ObjectToWorldArray[3];
    u_xlat1.xyz = unity_Builtins0Array[u_xlati4 / 8].unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat2.xyz = in_TANGENT0.yyy * unity_Builtins0Array[u_xlati4 / 8].unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = unity_Builtins0Array[u_xlati4 / 8].unity_ObjectToWorldArray[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = unity_Builtins0Array[u_xlati4 / 8].unity_ObjectToWorldArray[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat8 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat2.xyz;
    u_xlat3.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati4 / 8].unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati4 / 8].unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati4 / 8].unity_WorldToObjectArray[2].xyz);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3 = u_xlat4.xxxx * u_xlat3.xyzz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat13 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat13);
    vs_TEXCOORD0.y = u_xlat4.x;
    vs_TEXCOORD0.x = u_xlat2.z;
    vs_TEXCOORD0.z = u_xlat3.x;
    vs_TEXCOORD0.w = u_xlat1.x;
    vs_TEXCOORD1.x = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat2.y;
    vs_TEXCOORD1.w = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat1.z;
    vs_TEXCOORD1.y = u_xlat4.y;
    vs_TEXCOORD2.y = u_xlat4.z;
    vs_TEXCOORD1.z = u_xlat3.y;
    vs_TEXCOORD2.z = u_xlat3.w;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat4.x = u_xlat3.y * u_xlat3.y;
    u_xlat4.x = u_xlat3.x * u_xlat3.x + (-u_xlat4.x);
    u_xlat1 = u_xlat3.ywzx * u_xlat3;
    u_xlat2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat1);
    u_xlat2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat1);
    u_xlat2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat1);
    vs_TEXCOORD6.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat4.xxx + u_xlat2.xyz;
    vs_SV_InstanceID0 =  uint(gl_InstanceIndex);
    return;
}

