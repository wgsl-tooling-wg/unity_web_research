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
layout(set = 0, binding = 8, std140) uniform VGlobals {
	vec4 unity_SHBr;
	vec4 unity_SHBg;
	vec4 unity_SHBb;
	vec4 unity_SHC;
	mat4x4 unity_MatrixVP;
	vec4 unity_ParticleUVShiftData;
	float unity_ParticleUseMeshColors;
	vec4 _MainTex_ST;
};
layout(set = 0, binding = 9, std140) uniform UnityDrawCallInfo {
	int unity_BaseInstanceID;
	int unity_InstanceCount;
};
 struct unity_ParticleInstanceData_type {
	uint[14] value;
};

layout(set = 0, binding = 10, std430) readonly buffer unity_ParticleInstanceData {
	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
};
layout(location = 0) in highp vec4 in_POSITION0;
layout(location = 1) in highp vec3 in_NORMAL0;
layout(location = 2) in highp vec4 in_COLOR0;
layout(location = 3) in highp vec2 in_TEXCOORD0;
layout(location = 0) out highp vec3 vs_TEXCOORD0;
layout(location = 1) out highp vec3 vs_TEXCOORD1;
layout(location = 2) out highp vec4 vs_COLOR0;
layout(location = 3) out highp vec2 vs_TEXCOORD2;
layout(location = 4) out highp vec3 vs_TEXCOORD3;
highp vec4 vs_TEXCOORD5;
highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat8;
uvec2 u_xlatu8;
float u_xlat15;
float u_xlat21;
uint u_xlatu21;
bool u_xlatb21;
uint uint_bitfieldExtract(uint value, int offset, int bits) { return (value >> uint(offset)) & ~(uint(0xffffffffu) << uint(bits)); }

void main()
{
    u_xlat0.xyz = in_POSITION0.xyz;
    u_xlat0.w = 1.0;
    u_xlati1 = gl_InstanceIndex + unity_BaseInstanceID;
    u_xlat2 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
    u_xlat3.w = u_xlat2.y;
    u_xlat8.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
    u_xlat3.y = u_xlat8.y;
    u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]));
    u_xlat3.z = u_xlat4.x;
    u_xlat5.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
    u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat3.x = u_xlat5.z;
    u_xlat15 = dot(u_xlat3, u_xlat0);
    vs_TEXCOORD1.y = dot(u_xlat3, in_POSITION0);
    u_xlat6 = vec4(u_xlat15) * unity_MatrixVP[1];
    u_xlat4.w = u_xlat2.x;
    u_xlat5.z = u_xlat4.y;
    u_xlat4.x = u_xlat5.y;
    u_xlat4.y = u_xlat8.x;
    u_xlat5.y = u_xlat8.z;
    u_xlat8.x = dot(u_xlat4, u_xlat0);
    vs_TEXCOORD1.x = dot(u_xlat4, in_POSITION0);
    u_xlat6 = unity_MatrixVP[0] * u_xlat8.xxxx + u_xlat6;
    u_xlat5.w = u_xlat2.z;
    u_xlat0.x = dot(u_xlat5, u_xlat0);
    vs_TEXCOORD1.z = dot(u_xlat5, in_POSITION0);
    u_xlat0 = unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat6;
    gl_Position = u_xlat0 + unity_MatrixVP[3];
    u_xlat0.xyz = u_xlat4.yzx * u_xlat5.zxy;
    u_xlat0.xyz = u_xlat4.zxy * u_xlat5.yzx + (-u_xlat0.xyz);
    u_xlat8.xyz = u_xlat3.zxy * u_xlat5.yzx;
    u_xlat8.xyz = u_xlat3.yzx * u_xlat5.zxy + (-u_xlat8.xyz);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat8.xyz);
    u_xlat21 = float(1.0) / float(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
    u_xlat2.xyz = u_xlat3.yzx * u_xlat4.zxy;
    u_xlat2.xyz = u_xlat4.yzx * u_xlat3.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat8.xyz = vec3(u_xlat21) * u_xlat8.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat8.xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat2.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat3 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = vec4(unity_ParticleUseMeshColors) * u_xlat3 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatu21 = floatBitsToUint(u_xlat2.w) & 255u;
    u_xlat4.x = float(u_xlatu21);
    u_xlatu8.xy = uvec2(uint_bitfieldExtract(floatBitsToUint(u_xlat2.w), int(8), int(8)), uint_bitfieldExtract(floatBitsToUint(u_xlat2.w), int(16), int(8)));
    u_xlatu21 = floatBitsToUint(u_xlat2.w) >> 24u;
    u_xlat4.w = float(u_xlatu21);
    u_xlat4.yz = vec2(u_xlatu8.xy);
    u_xlat2 = u_xlat3 * u_xlat4;
    vs_COLOR0 = u_xlat2 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
    u_xlat21 = u_xlat1.x / unity_ParticleUVShiftData.y;
    u_xlat21 = floor(u_xlat21);
    u_xlat1.x = (-u_xlat21) * unity_ParticleUVShiftData.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * unity_ParticleUVShiftData.z;
    u_xlat15 = (-unity_ParticleUVShiftData.w) + 1.0;
    u_xlat1.y = (-u_xlat21) * unity_ParticleUVShiftData.w + u_xlat15;
    u_xlat1.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
    u_xlatb21 = unity_ParticleUVShiftData.x!=0.0;
    u_xlat1.xy = (bool(u_xlatb21)) ? u_xlat1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat21 = u_xlat0.y * u_xlat0.y;
    u_xlat21 = u_xlat0.x * u_xlat0.x + (-u_xlat21);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceIndex);
    return;
}

