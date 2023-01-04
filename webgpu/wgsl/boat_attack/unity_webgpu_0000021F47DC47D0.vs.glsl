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
layout(set = 1, binding = 1, std140) uniform VGlobals {
	vec3 _WorldSpaceCameraPos;
	vec4 _ScreenParams;
	mat4x4 unity_ObjectToWorld;
	mat4x4 unity_WorldToObject;
	vec4 unity_WorldTransformParams;
	mat4x4 glstate_matrix_projection;
	mat4x4 unity_MatrixVP;
	float _FaceDilate;
	mat4x4 _EnvMatrix;
	float _WeightNormal;
	float _WeightBold;
	float _ScaleRatioA;
	float _VertexOffsetX;
	float _VertexOffsetY;
	float _GradientScale;
	float _ScaleX;
	float _ScaleY;
	float _PerspectiveFilter;
	float _Sharpness;
	vec4 _MainTex_ST;
	vec4 _FaceTex_ST;
	vec4 _OutlineTex_ST;
};
layout(location = 0) in highp vec4 in_POSITION0;
layout(location = 1) in highp vec4 in_TANGENT0;
layout(location = 2) in highp vec3 in_NORMAL0;
layout(location = 3) in highp vec4 in_TEXCOORD0;
layout(location = 4) in highp vec4 in_TEXCOORD1;
layout(location = 5) in highp vec4 in_COLOR0;
layout(location = 0) out highp vec4 vs_TEXCOORD0;
layout(location = 1) out highp vec2 vs_TEXCOORD1;
layout(location = 2) out highp vec2 vs_TEXCOORD6;
layout(location = 3) out highp vec3 vs_TEXCOORD2;
layout(location = 4) out highp float vs_TEXCOORD9;
layout(location = 5) out highp vec3 vs_TEXCOORD3;
layout(location = 6) out highp vec3 vs_TEXCOORD4;
layout(location = 7) out highp vec3 vs_TEXCOORD5;
layout(location = 8) out highp vec4 vs_COLOR0;
highp vec3 vs_TEXCOORD7;
void main()
{
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
vec3 u_xlat6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat3 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat3;
    vs_TEXCOORD9 = u_xlat3.z;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * unity_MatrixVP[1].w;
    u_xlat12 = unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
    u_xlat2.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat2.x = u_xlat12 * u_xlat13;
    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat6.x * u_xlat2.x;
    u_xlat12 = u_xlat12 * u_xlat13 + (-u_xlat2.x);
    u_xlat6.xyz = _WorldSpaceCameraPos.yyy * unity_WorldToObject[1].xyz;
    u_xlat6.xyz = unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat6.xyz;
    u_xlat6.xyz = unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz + unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat6.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat2.x;
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat6.yyy * _EnvMatrix[1].xyz;
    u_xlat0.xyz = _EnvMatrix[0].xyz * u_xlat6.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = _EnvMatrix[2].xyz * u_xlat6.zzz + u_xlat0.xyz;
    return;
}

