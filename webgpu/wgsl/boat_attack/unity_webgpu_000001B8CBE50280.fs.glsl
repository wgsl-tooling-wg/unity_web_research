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
	vec4 _SourceSize;
	vec4 _CoCParams;
};
layout(set = 0, binding = 0) uniform mediump texture2D _BlitTexture;
layout(set = 0, binding = 1) uniform mediump texture2D _DofTexture;
layout(set = 0, binding = 2) uniform mediump texture2D _FullCoCTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 3) uniform mediump  sampler sampler_LinearClamp;
void main()
{
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat6;
    u_xlat0 = texture(sampler2D(_FullCoCTexture, sampler_LinearClamp), vs_TEXCOORD0.xy, _GlobalMipBias.x).x;
    u_xlat0 = u_xlat0 + -0.5;
    u_xlat0 = dot(vec2(u_xlat0), _CoCParams.zz);
    u_xlat0 = (-_SourceSize.w) * 2.0 + u_xlat0;
    u_xlat3 = _SourceSize.w + _SourceSize.w;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat3 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat6 = u_xlat0 * u_xlat3;
    u_xlat1 = texture(sampler2D(_DofTexture, sampler_LinearClamp), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat0 = u_xlat3 * u_xlat0 + u_xlat1.w;
    u_xlat0 = (-u_xlat6) * u_xlat1.w + u_xlat0;
    u_xlat3 = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.w = max(u_xlat1.z, u_xlat3);
    u_xlat2 = texture(sampler2D(_BlitTexture, sampler_LinearClamp), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat1 = u_xlat1 + (-u_xlat2);
    SV_Target0 = vec4(u_xlat0) * u_xlat1 + u_xlat2;
    return;
}

