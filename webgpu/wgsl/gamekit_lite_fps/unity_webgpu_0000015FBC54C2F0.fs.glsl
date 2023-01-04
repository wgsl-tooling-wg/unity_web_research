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
layout(set = 0, binding = 0, std140) uniform PGlobals {
	vec4 _Color;
};
layout(set = 0, binding = 1) uniform mediump texture2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
layout(set = 0, binding = 2) uniform mediump  sampler sampler_MainTex;
void main()
{
    u_xlat0.x = texture(sampler2D(_MainTex, sampler_MainTex), vs_TEXCOORD0.xy).x;
    u_xlat0 = u_xlat0.xxxx * _Color;
    u_xlat1.xy = texture(sampler2D(_MainTex, sampler_MainTex), vs_TEXCOORD2.xy).yz;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    SV_Target0 = u_xlat1.yyyy * u_xlat0;
    return;
}

