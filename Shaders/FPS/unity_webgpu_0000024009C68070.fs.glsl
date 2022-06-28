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
	vec4 _ScreenParams;
	float _RenderViewportScaleFactor;
	vec4 _BloomTex_TexelSize;
	vec4 _Bloom_DirtTileOffset;
	vec3 _Bloom_Settings;
	vec3 _Bloom_Color;
	vec2 _Lut3D_Params;
	float _PostExposure;
	vec3 _Vignette_Color;
	vec2 _Vignette_Center;
	vec4 _Vignette_Settings;
	float _Vignette_Opacity;
	float _Vignette_Mode;
	vec2 _Grain_Params1;
	vec4 _Grain_Params2;
	float _LumaInAlpha;
};
layout(set = 0, binding = 1) uniform mediump texture2D _MainTex;
layout(set = 0, binding = 2) uniform mediump texture2D _AutoExposureTex;
layout(set = 0, binding = 3) uniform mediump texture2D _BloomTex;
layout(set = 0, binding = 4) uniform mediump texture2D _Bloom_DirtTex;
layout(set = 0, binding = 5) uniform mediump texture3D _Lut3D;
layout(set = 0, binding = 6) uniform mediump texture2D _Vignette_Mask;
layout(set = 0, binding = 7) uniform mediump texture2D _GrainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat6;
float u_xlat8;
float u_xlat15;
float u_xlat16;
layout(set = 0, binding = 8) uniform mediump  sampler sampler_MainTex;
layout(set = 0, binding = 9) uniform mediump  sampler sampler_AutoExposureTex;
layout(set = 0, binding = 10) uniform mediump  sampler sampler_BloomTex;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_Bloom_DirtTex;
layout(set = 0, binding = 12) uniform mediump  sampler sampler_Lut3D;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_Vignette_Mask;
layout(set = 0, binding = 14) uniform mediump  sampler sampler_GrainTex;
void main()
{
    u_xlat0.x = texture(sampler2D(_AutoExposureTex, sampler_AutoExposureTex), vs_TEXCOORD0.xy).x;
    u_xlat1 = texture(sampler2D(_MainTex, sampler_MainTex), vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0 = _BloomTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat2.x = _Bloom_Settings.x * 0.5;
    u_xlat3 = u_xlat0.xyzy * u_xlat2.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
    u_xlat4 = texture(sampler2D(_BloomTex, sampler_BloomTex), u_xlat3.xy);
    u_xlat3 = texture(sampler2D(_BloomTex, sampler_BloomTex), u_xlat3.zw);
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat0 = u_xlat0.xwzw * u_xlat2.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(_RenderViewportScaleFactor);
    u_xlat2 = texture(sampler2D(_BloomTex, sampler_BloomTex), u_xlat0.xy);
    u_xlat2 = u_xlat2 + u_xlat3;
    u_xlat0 = texture(sampler2D(_BloomTex, sampler_BloomTex), u_xlat0.zw);
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat0 = u_xlat0 * _Bloom_Settings.yyyy;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Bloom_DirtTileOffset.xy + _Bloom_DirtTileOffset.zw;
    u_xlat2.xyz = texture(sampler2D(_Bloom_DirtTex, sampler_Bloom_DirtTex), u_xlat2.xy).xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat2.xyz = u_xlat2.xyz * _Bloom_Settings.zzz;
    u_xlat0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 1.0);
    u_xlat4.xyz = u_xlat0.xyz * _Bloom_Color.xyz;
    u_xlat4.w = u_xlat0.w * 0.25;
    u_xlat0 = u_xlat1 + u_xlat4;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlatb1 = _Vignette_Mode<0.5;
    if(u_xlatb1){
        u_xlat1.xy = vs_TEXCOORD0.xy + (-_Vignette_Center.xy);
        u_xlat1.yz = abs(u_xlat1.yx) * _Vignette_Settings.xx;
        u_xlat16 = _ScreenParams.x / _ScreenParams.y;
        u_xlat16 = u_xlat16 + -1.0;
        u_xlat16 = _Vignette_Settings.w * u_xlat16 + 1.0;
        u_xlat1.x = u_xlat16 * u_xlat1.z;
        u_xlat1.xy = u_xlat1.xy;
        u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
        u_xlat1.xy = log2(u_xlat1.xy);
        u_xlat1.xy = u_xlat1.xy * _Vignette_Settings.zz;
        u_xlat1.xy = exp2(u_xlat1.xy);
        u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
        u_xlat1.x = (-u_xlat1.x) + 1.0;
        u_xlat1.x = max(u_xlat1.x, 0.0);
        u_xlat1.x = log2(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * _Vignette_Settings.y;
        u_xlat1.x = exp2(u_xlat1.x);
        u_xlat6.xyz = (-_Vignette_Color.xyz) + vec3(1.0, 1.0, 1.0);
        u_xlat6.xyz = u_xlat1.xxx * u_xlat6.xyz + _Vignette_Color.xyz;
        u_xlat6.xyz = u_xlat0.xyz * u_xlat6.xyz;
        u_xlat2.x = u_xlat0.w + -1.0;
        u_xlat2.w = u_xlat1.x * u_xlat2.x + 1.0;
    } else {
        u_xlat1.x = texture(sampler2D(_Vignette_Mask, sampler_Vignette_Mask), vs_TEXCOORD0.xy).w;
        u_xlat3.x = u_xlat1.x * 0.0773993805;
        u_xlat8 = u_xlat1.x + 0.0549999997;
        u_xlat8 = u_xlat8 * 0.947867334;
        u_xlat8 = max(abs(u_xlat8), 1.1920929e-07);
        u_xlat8 = log2(u_xlat8);
        u_xlat8 = u_xlat8 * 2.4000001;
        u_xlat8 = exp2(u_xlat8);
        u_xlatb1 = 0.0404499993>=u_xlat1.x;
        u_xlat1.x = (u_xlatb1) ? u_xlat3.x : u_xlat8;
        u_xlat3.xyz = (-_Vignette_Color.xyz) + vec3(1.0, 1.0, 1.0);
        u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz + _Vignette_Color.xyz;
        u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = vec3(_Vignette_Opacity) * u_xlat3.xyz + u_xlat0.xyz;
        u_xlat0.x = u_xlat0.w + -1.0;
        u_xlat2.w = u_xlat1.x * u_xlat0.x + 1.0;
    }
    u_xlat0.xy = vs_TEXCOORD1.xy * _Grain_Params2.xy + _Grain_Params2.zw;
    u_xlat0.xyz = texture(sampler2D(_GrainTex, sampler_GrainTex), u_xlat0.xy).xyz;
    u_xlat3.xyz = u_xlat6.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat15 = dot(u_xlat3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = _Grain_Params1.xxxy.z * (-u_xlat15) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Grain_Params1.y, _Grain_Params1.y, _Grain_Params1.y);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat6.xyz;
    u_xlat0 = u_xlat2.wxyz * vec4(vec4(_PostExposure, _PostExposure, _PostExposure, _PostExposure));
    u_xlat1.xyz = u_xlat0.yzw * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Lut3D_Params.yyy;
    u_xlat16 = _Lut3D_Params.x * 0.5;
    u_xlat1.xyz = u_xlat1.xyz * _Lut3D_Params.xxx + vec3(u_xlat16);
    u_xlat0.yzw = texture(sampler3D(_Lut3D, sampler_Lut3D), u_xlat1.xyz).xyz;
    u_xlatb1 = 0.5<_LumaInAlpha;
    if(u_xlatb1){
        u_xlat1.xyz = u_xlat0.yzw;
        u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
        u_xlat0.x = dot(u_xlat1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    }
    SV_Target0 = u_xlat0.yzwx;
    return;
}

