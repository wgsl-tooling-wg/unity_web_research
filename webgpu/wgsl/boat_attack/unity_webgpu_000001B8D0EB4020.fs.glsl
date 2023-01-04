#version 440
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shading_language_420pack : require

layout(origin_upper_left) in vec4 gl_FragCoord;
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
layout(set = 1, binding = 0, std140) uniform PGlobals {
	float _Level;
	float _Texel;
	float _Scale;
};
layout(set = 0, binding = 0) uniform mediump textureCube _MainTex;
layout(location = 0) in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 1) uniform mediump  sampler sampler_MainTex;
void main()
{
vec3 u_xlat0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
float u_xlat34;
float u_xlat51;
float u_xlat52;
    u_xlat0.x = _Scale;
    u_xlat0.y = float(3.0);
    u_xlat0.z = float(5.0);
    u_xlatb1.xyz = equal(abs(vs_TEXCOORD0.xyzx), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat1.xyz = u_xlat1.xyz * vs_TEXCOORD0.xyz;
    u_xlat2.xyz = -abs(u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD0.xyz;
    u_xlat51 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat52 = u_xlat51 * u_xlat51;
    u_xlat2.x = u_xlat51 * u_xlat52;
    u_xlat2.yz = u_xlat2.xx * vec2(vec2(_Scale, _Scale));
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat0.zzz * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat1.zxy * vec3(vec3(_Texel, _Texel, _Texel));
    u_xlat4.xyz = (-u_xlat3.xyz) * vec3(1.5, 1.5, 1.5) + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (-u_xlat3.zxy) * vec3(2.5, 2.5, 2.5) + u_xlat4.xyz;
    u_xlat6.xyz = max(u_xlat5.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat6.xyz = min(u_xlat6.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat51 = max(abs(u_xlat5.y), abs(u_xlat5.x));
    u_xlat51 = max(abs(u_xlat5.z), u_xlat51);
    u_xlat5.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat6.xyz;
    u_xlat5 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat5.xyz, _Level);
    u_xlat5 = max(u_xlat5, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat6.xyz = u_xlat3.xyz * vec3(1.5, 1.5, 1.5) + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (-u_xlat3.zxy) * vec3(2.5, 2.5, 2.5) + u_xlat6.xyz;
    u_xlat8.xyz = max(u_xlat7.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat8.xyz = min(u_xlat8.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat7.xyz = u_xlat7.xyz + (-u_xlat8.xyz);
    u_xlat51 = max(abs(u_xlat7.y), abs(u_xlat7.x));
    u_xlat51 = max(abs(u_xlat7.z), u_xlat51);
    u_xlat7.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat7 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat7.xyz, _Level);
    u_xlat7 = max(u_xlat7, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat5 = u_xlat5 + u_xlat7;
    u_xlat5 = u_xlat2.yyyy * u_xlat5;
    u_xlat7.xyz = (-u_xlat3.zxy) * vec3(2.5, 2.5, 2.5) + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = max(u_xlat7.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat8.xyz = min(u_xlat8.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat7.xyz = u_xlat7.xyz + (-u_xlat8.xyz);
    u_xlat51 = max(abs(u_xlat7.y), abs(u_xlat7.x));
    u_xlat51 = max(abs(u_xlat7.z), u_xlat51);
    u_xlat7.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat7.xyz;
    u_xlat7 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat7.xyz, _Level);
    u_xlat7 = max(u_xlat7, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat8 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat8.xyz, _Level);
    u_xlat8 = max(u_xlat8, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat7 = u_xlat7 + u_xlat8;
    u_xlat5 = u_xlat2.xxxx * u_xlat7 + u_xlat5;
    u_xlat7.xyz = (-u_xlat3.xyz) * vec3(2.5, 2.5, 2.5) + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = (-u_xlat3.zxy) * vec3(2.5, 2.5, 2.5) + u_xlat7.xyz;
    u_xlat9.xyz = max(u_xlat8.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat9.xyz = min(u_xlat9.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat8.xyz = u_xlat8.xyz + (-u_xlat9.xyz);
    u_xlat51 = max(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat51 = max(abs(u_xlat8.z), u_xlat51);
    u_xlat8.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat8 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat8.xyz, _Level);
    u_xlat8 = max(u_xlat8, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat9.xyz = u_xlat3.xyz * vec3(2.5, 2.5, 2.5) + vs_TEXCOORD0.xyz;
    u_xlat10.xyz = (-u_xlat3.zxy) * vec3(2.5, 2.5, 2.5) + u_xlat9.xyz;
    u_xlat11.xyz = max(u_xlat10.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat10.xyz = u_xlat10.xyz + (-u_xlat11.xyz);
    u_xlat51 = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat51 = max(abs(u_xlat10.z), u_xlat51);
    u_xlat10.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat10 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat10.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat8 = u_xlat8 + u_xlat10;
    u_xlat5 = u_xlat2.zzzz * u_xlat8 + u_xlat5;
    u_xlat8.xyz = u_xlat0.yyy * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat0.xyz;
    u_xlat10.xyz = (-u_xlat3.zxy) * vec3(1.5, 1.5, 1.5) + u_xlat9.xyz;
    u_xlat11.xyz = max(u_xlat10.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat10.xyz = u_xlat10.xyz + (-u_xlat11.xyz);
    u_xlat51 = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat51 = max(abs(u_xlat10.z), u_xlat51);
    u_xlat10.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat10 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat10.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11.xyz = (-u_xlat3.zxy) * vec3(1.5, 1.5, 1.5) + u_xlat7.xyz;
    u_xlat12.xyz = max(u_xlat11.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat11.xyz = u_xlat11.xyz + (-u_xlat12.xyz);
    u_xlat51 = max(abs(u_xlat11.y), abs(u_xlat11.x));
    u_xlat51 = max(abs(u_xlat11.z), u_xlat51);
    u_xlat11.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat11 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat10 = u_xlat10 + u_xlat11;
    u_xlat5 = u_xlat8.zzzz * u_xlat10 + u_xlat5;
    u_xlat10.xyz = (-u_xlat3.zxy) * vec3(1.5, 1.5, 1.5) + u_xlat6.xyz;
    u_xlat11.xyz = max(u_xlat10.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat10.xyz = u_xlat10.xyz + (-u_xlat11.xyz);
    u_xlat51 = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat51 = max(abs(u_xlat10.z), u_xlat51);
    u_xlat10.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat10 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat10.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11.xyz = (-u_xlat3.zxy) * vec3(1.5, 1.5, 1.5) + u_xlat4.xyz;
    u_xlat12.xyz = max(u_xlat11.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat11.xyz = u_xlat11.xyz + (-u_xlat12.xyz);
    u_xlat51 = max(abs(u_xlat11.y), abs(u_xlat11.x));
    u_xlat51 = max(abs(u_xlat11.z), u_xlat51);
    u_xlat11.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat11 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat10 = u_xlat10 + u_xlat11;
    u_xlat10 = u_xlat8.yyyy * u_xlat10;
    u_xlat11.xyz = (-u_xlat3.zxy) * vec3(1.5, 1.5, 1.5) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = max(u_xlat11.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat11.xyz = u_xlat11.xyz + (-u_xlat12.xyz);
    u_xlat51 = max(abs(u_xlat11.y), abs(u_xlat11.x));
    u_xlat51 = max(abs(u_xlat11.z), u_xlat51);
    u_xlat11.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat12.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat11.xyz;
    u_xlat11.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat11.xyz;
    u_xlat11 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat12 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat12.xyz, _Level);
    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = u_xlat11 + u_xlat12;
    u_xlat10 = u_xlat8.xxxx * u_xlat11 + u_xlat10;
    u_xlat5 = u_xlat5 + u_xlat10;
    u_xlat10.xyz = max(u_xlat7.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat10.xyz = min(u_xlat10.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat11.xyz = u_xlat7.xyz + (-u_xlat10.xyz);
    u_xlat51 = max(abs(u_xlat11.y), abs(u_xlat11.x));
    u_xlat51 = max(abs(u_xlat11.z), u_xlat51);
    u_xlat10.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat10.xyz;
    u_xlat11.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat10.xyz;
    u_xlat10 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat10.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat12.xyz = max(u_xlat9.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat13.xyz = u_xlat9.xyz + (-u_xlat12.xyz);
    u_xlat51 = max(abs(u_xlat13.y), abs(u_xlat13.x));
    u_xlat51 = max(abs(u_xlat13.z), u_xlat51);
    u_xlat12.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat13.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat12.xyz;
    u_xlat12.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat12.xyz;
    u_xlat12 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat12.xyz, _Level);
    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat10 = u_xlat10 + u_xlat12;
    u_xlat12 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat13.xyz, _Level);
    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = u_xlat11 + u_xlat12;
    u_xlat5 = u_xlat0.zzzz * u_xlat11 + u_xlat5;
    u_xlat11.xyz = max(u_xlat4.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat12.xyz = u_xlat4.xyz + (-u_xlat11.xyz);
    u_xlat51 = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat51 = max(abs(u_xlat12.z), u_xlat51);
    u_xlat11.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat12.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat11.xyz;
    u_xlat11 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat12 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat12.xyz, _Level);
    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat13.xyz = max(u_xlat6.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat13.xyz = min(u_xlat13.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat14.xyz = u_xlat6.xyz + (-u_xlat13.xyz);
    u_xlat51 = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat51 = max(abs(u_xlat14.z), u_xlat51);
    u_xlat13.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat13.xyz;
    u_xlat14.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat13.xyz;
    u_xlat13 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat13.xyz, _Level);
    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = u_xlat11 + u_xlat13;
    u_xlat11 = u_xlat0.yyyy * u_xlat11;
    u_xlat13 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat14.xyz, _Level);
    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat12 = u_xlat12 + u_xlat13;
    u_xlat12 = u_xlat0.yyyy * u_xlat12;
    u_xlat13.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + vs_TEXCOORD0.xyz;
    u_xlat14.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat13.xyz;
    u_xlat13 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat13.xyz, _Level);
    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat14 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat14.xyz, _Level);
    u_xlat14 = max(u_xlat14, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat15.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vs_TEXCOORD0.xyz;
    u_xlat16.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat15.xyz;
    u_xlat15 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat15.xyz, _Level);
    u_xlat15 = max(u_xlat15, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat13 = u_xlat13 + u_xlat15;
    u_xlat11 = u_xlat0.xxxx * u_xlat13 + u_xlat11;
    u_xlat13 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat16.xyz, _Level);
    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat13 = u_xlat13 + u_xlat14;
    u_xlat12 = u_xlat0.xxxx * u_xlat13 + u_xlat12;
    u_xlat5 = u_xlat5 + u_xlat12;
    u_xlat5 = u_xlat0.zzzz * u_xlat10 + u_xlat5;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(2.0, 2.0, 2.0));
    u_xlat5 = u_xlat11 + u_xlat5;
    u_xlat17.xyz = u_xlat3.zxy * vec3(1.5, 1.5, 1.5) + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat3.zxy * vec3(2.5, 2.5, 2.5) + u_xlat7.xyz;
    u_xlat10.xyz = max(u_xlat17.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat10.xyz = min(u_xlat10.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat17.xyz = u_xlat17.xyz + (-u_xlat10.xyz);
    u_xlat17.x = max(abs(u_xlat17.y), abs(u_xlat17.x));
    u_xlat17.x = max(abs(u_xlat17.z), u_xlat17.x);
    u_xlat17.xyz = (-u_xlat17.xxx) * u_xlat1.xyz + u_xlat10.xyz;
    u_xlat10 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat17.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat17.xyz = u_xlat3.zxy * vec3(1.5, 1.5, 1.5) + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat3.zxy * vec3(2.5, 2.5, 2.5) + u_xlat9.xyz;
    u_xlat11.xyz = max(u_xlat17.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat17.xyz = u_xlat17.xyz + (-u_xlat11.xyz);
    u_xlat17.x = max(abs(u_xlat17.y), abs(u_xlat17.x));
    u_xlat17.x = max(abs(u_xlat17.z), u_xlat17.x);
    u_xlat17.xyz = (-u_xlat17.xxx) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat11 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat17.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat10 = u_xlat10 + u_xlat11;
    u_xlat5 = u_xlat8.zzzz * u_xlat10 + u_xlat5;
    u_xlat17.xyz = u_xlat3.zxy * vec3(1.5, 1.5, 1.5) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat3.zxy * vec3(2.5, 2.5, 2.5) + u_xlat4.xyz;
    u_xlat10.xyz = max(u_xlat17.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat10.xyz = min(u_xlat10.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat17.xyz = u_xlat17.xyz + (-u_xlat10.xyz);
    u_xlat17.x = max(abs(u_xlat17.y), abs(u_xlat17.x));
    u_xlat17.x = max(abs(u_xlat17.z), u_xlat17.x);
    u_xlat17.xyz = (-u_xlat17.xxx) * u_xlat1.xyz + u_xlat10.xyz;
    u_xlat10 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat17.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat17.xyz = u_xlat3.zxy * vec3(1.5, 1.5, 1.5) + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat3.zxy * vec3(2.5, 2.5, 2.5) + u_xlat6.xyz;
    u_xlat11.xyz = max(u_xlat17.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat17.xyz = u_xlat17.xyz + (-u_xlat11.xyz);
    u_xlat17.x = max(abs(u_xlat17.y), abs(u_xlat17.x));
    u_xlat17.x = max(abs(u_xlat17.z), u_xlat17.x);
    u_xlat17.xyz = (-u_xlat17.xxx) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat11 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat17.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat10 = u_xlat10 + u_xlat11;
    u_xlat10 = u_xlat8.yyyy * u_xlat10;
    u_xlat17.xyz = u_xlat3.zxy * vec3(1.5, 1.5, 1.5) + vs_TEXCOORD0.xyz;
    u_xlat11.xyz = max(u_xlat17.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat17.xyz = u_xlat17.xyz + (-u_xlat11.xyz);
    u_xlat17.x = max(abs(u_xlat17.y), abs(u_xlat17.x));
    u_xlat17.x = max(abs(u_xlat17.z), u_xlat17.x);
    u_xlat17.xyz = (-u_xlat17.xxx) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat11.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat17.xyz;
    u_xlat17.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat17.xyz;
    u_xlat12 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat17.xyz, _Level);
    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = u_xlat12 + u_xlat11;
    u_xlat10 = u_xlat8.xxxx * u_xlat11 + u_xlat10;
    u_xlat17.x = dot(u_xlat8.xyz, vec3(2.0, 2.0, 2.0));
    u_xlat5 = u_xlat5 + u_xlat10;
    u_xlat8.xyz = max(u_xlat9.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat8.xyz = min(u_xlat8.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat9.xyz = (-u_xlat8.xyz) + u_xlat9.xyz;
    u_xlat34 = max(abs(u_xlat9.y), abs(u_xlat9.x));
    u_xlat34 = max(abs(u_xlat9.z), u_xlat34);
    u_xlat8.xyz = (-vec3(u_xlat34)) * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat8 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat8.xyz, _Level);
    u_xlat8 = max(u_xlat8, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat9.xyz = max(u_xlat7.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat9.xyz = min(u_xlat9.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat7.xyz = u_xlat7.xyz + (-u_xlat9.xyz);
    u_xlat34 = max(abs(u_xlat7.y), abs(u_xlat7.x));
    u_xlat34 = max(abs(u_xlat7.z), u_xlat34);
    u_xlat7.xyz = (-vec3(u_xlat34)) * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat7 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat7.xyz, _Level);
    u_xlat7 = max(u_xlat7, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat7 = u_xlat7 + u_xlat8;
    u_xlat5 = u_xlat2.zzzz * u_xlat7 + u_xlat5;
    u_xlat7.xyz = u_xlat3.zxy * vec3(2.5, 2.5, 2.5) + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = max(u_xlat7.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat8.xyz = min(u_xlat8.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat7.xyz = u_xlat7.xyz + (-u_xlat8.xyz);
    u_xlat34 = max(abs(u_xlat7.y), abs(u_xlat7.x));
    u_xlat34 = max(abs(u_xlat7.z), u_xlat34);
    u_xlat7.xyz = (-vec3(u_xlat34)) * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat7.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat7.xyz;
    u_xlat3 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat3.xyz, _Level);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat7 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat8.xyz, _Level);
    u_xlat7 = max(u_xlat7, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = u_xlat3 + u_xlat7;
    u_xlat7.xyz = max(u_xlat6.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat7.xyz = min(u_xlat7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat6.xyz = u_xlat6.xyz + (-u_xlat7.xyz);
    u_xlat34 = max(abs(u_xlat6.y), abs(u_xlat6.x));
    u_xlat34 = max(abs(u_xlat6.z), u_xlat34);
    u_xlat6.xyz = (-vec3(u_xlat34)) * u_xlat1.xyz + u_xlat7.xyz;
    u_xlat6 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat6.xyz, _Level);
    u_xlat6 = max(u_xlat6, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat7.xyz = max(u_xlat4.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat7.xyz = min(u_xlat7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat4.xyz = u_xlat4.xyz + (-u_xlat7.xyz);
    u_xlat34 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat34 = max(abs(u_xlat4.z), u_xlat34);
    u_xlat1.xyz = (-vec3(u_xlat34)) * u_xlat1.xyz + u_xlat7.xyz;
    u_xlat1 = textureLod(samplerCube(_MainTex, sampler_MainTex), u_xlat1.xyz, _Level);
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 + u_xlat6;
    u_xlat1 = u_xlat1 * u_xlat2.yyyy;
    u_xlat1 = u_xlat2.xxxx * u_xlat3 + u_xlat1;
    u_xlat34 = dot(u_xlat2.xyz, vec3(2.0, 2.0, 2.0));
    u_xlat1 = u_xlat1 + u_xlat5;
    u_xlat51 = u_xlat17.x + u_xlat34;
    u_xlat0.x = u_xlat0.x * 2.0 + u_xlat51;
    u_xlat0.x = u_xlat17.x + u_xlat0.x;
    u_xlat0.x = u_xlat34 + u_xlat0.x;
    SV_Target0 = u_xlat1 / u_xlat0.xxxx;
    return;
}

