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
	float _RenderViewportScaleFactor;
	vec4 _MainTex_TexelSize;
	float _SampleScale;
	vec4 _ColorIntensity;
};
layout(set = 0, binding = 1) uniform mediump texture2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
layout(set = 0, binding = 2) uniform mediump  sampler sampler_MainTex;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat0.xy).xyz;
    u_xlat1.x = 1.0;
    u_xlat1.z = _SampleScale;
    u_xlat1 = u_xlat1.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.0);
    u_xlat2.x = _SampleScale;
    u_xlat3 = (-u_xlat1.xywy) * u_xlat2.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
    u_xlat4.xyz = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat3.xy).xyz;
    u_xlat3.xyz = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat3.zw).xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat4.xyz;
    u_xlat4.xy = (-u_xlat1.zy) * u_xlat2.zx + vs_TEXCOORD0.xy;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(_RenderViewportScaleFactor);
    u_xlat4.xyz = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat4.xy).xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4 = u_xlat1.zwxw * u_xlat2.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
    u_xlat5 = u_xlat1.zywy * u_xlat2.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * u_xlat2.xx + vs_TEXCOORD0.xy;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1.xyz = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat1.xy).xyz;
    u_xlat2 = u_xlat5 * vec4(_RenderViewportScaleFactor);
    u_xlat4 = u_xlat4 * vec4(_RenderViewportScaleFactor);
    u_xlat5.xyz = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat4.xy).xyz;
    u_xlat4.xyz = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat4.zw).xyz;
    u_xlat3.xyz = u_xlat5.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(4.0, 4.0, 4.0) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + u_xlat0.xyz;
    u_xlat3.xyz = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat2.xy).xyz;
    u_xlat2.xyz = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat2.zw).xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat0.xyz = u_xlat0.xyz * _ColorIntensity.www;
    SV_Target0.xyz = u_xlat0.xyz * _ColorIntensity.xyz;
    SV_Target0.w = 1.0;
    return;
}

