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
	vec2 _GlobalMipBias;
	vec4 _SSAOParams;
	vec4 _SourceSize;
};
layout(set = 0, binding = 0) uniform mediump texture2D _BlitTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 1) uniform mediump  sampler sampler_BlitTexture;
void main()
{
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
float u_xlat10;
float u_xlat11;
float u_xlat12;
float u_xlat17;
    u_xlat0.x = float(1.0) / float(_SSAOParams.z);
    u_xlat0.x = u_xlat0.x * _SourceSize.z;
    u_xlat0.xz = u_xlat0.xx * vec2(1.38461542, 3.23076916);
    u_xlat0.y = float(0.0);
    u_xlat0.w = float(0.0);
    u_xlat1 = (-u_xlat0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 + vs_TEXCOORD0.xyxy;
    u_xlat2 = texture(sampler2D(_BlitTexture, sampler_BlitTexture), u_xlat1.xy, _GlobalMipBias.x);
    u_xlat1 = texture(sampler2D(_BlitTexture, sampler_BlitTexture), u_xlat1.zw, _GlobalMipBias.x);
    u_xlat7.xyz = u_xlat2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3 = texture(sampler2D(_BlitTexture, sampler_BlitTexture), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat8.xyz = u_xlat3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat7.xyz);
    u_xlat7.x = u_xlat7.x + -0.800000012;
    u_xlat7.x = u_xlat7.x * 5.00000048;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat12 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat12;
    u_xlat7.x = u_xlat7.x * 0.31621623;
    u_xlat2.x = u_xlat7.x * u_xlat2.x;
    u_xlat2.x = u_xlat3.x * 0.227027029 + u_xlat2.x;
    u_xlat4 = texture(sampler2D(_BlitTexture, sampler_BlitTexture), u_xlat0.xy, _GlobalMipBias.x);
    u_xlat0 = texture(sampler2D(_BlitTexture, sampler_BlitTexture), u_xlat0.zw, _GlobalMipBias.x);
    u_xlat9.xyz = u_xlat4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat12 = dot(u_xlat8.xyz, u_xlat9.xyz);
    u_xlat12 = u_xlat12 + -0.800000012;
    u_xlat12 = u_xlat12 * 5.00000048;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat17 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat17;
    u_xlat17 = u_xlat12 * 0.31621623;
    u_xlat7.x = u_xlat12 * 0.31621623 + u_xlat7.x;
    u_xlat2.x = u_xlat4.x * u_xlat17 + u_xlat2.x;
    u_xlat6.xyz = u_xlat1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat8.xyz, u_xlat6.xyz);
    u_xlat6.x = u_xlat6.x + -0.800000012;
    u_xlat6.x = u_xlat6.x * 5.00000048;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat11 = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat11;
    u_xlat11 = u_xlat6.x * 0.0702702701;
    u_xlat6.x = u_xlat6.x * 0.0702702701 + u_xlat7.x;
    u_xlat1.x = u_xlat1.x * u_xlat11 + u_xlat2.x;
    u_xlat5.xyz = u_xlat0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat5.xyz);
    SV_Target0.yzw = u_xlat8.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat5.x = u_xlat5.x + -0.800000012;
    u_xlat5.x = u_xlat5.x * 5.00000048;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat10 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat10;
    u_xlat10 = u_xlat5.x * 0.0702702701;
    u_xlat5.x = u_xlat5.x * 0.0702702701 + u_xlat6.x;
    u_xlat5.x = u_xlat5.x + 0.227027029;
    u_xlat5.x = float(1.0) / float(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * u_xlat10 + u_xlat1.x;
    SV_Target0.x = u_xlat5.x * u_xlat0.x;
    return;
}

