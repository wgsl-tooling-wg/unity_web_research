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
	vec4 _Distortion_Amount;
	vec4 _Distortion_CenterScale;
	vec4 _Dithering_Coords;
	vec4 _BloomTex_TexelSize;
	vec4 _Bloom_DirtTileOffset;
	vec3 _Bloom_Settings;
	vec3 _Bloom_Color;
	vec3 _Lut2D_Params;
	float _PostExposure;
	vec3 _Vignette_Color;
	vec2 _Vignette_Center;
	vec4 _Vignette_Settings;
	float _Vignette_Opacity;
	float _Vignette_Mode;
};
layout(set = 0, binding = 1) uniform mediump texture2D _DitheringTex;
layout(set = 0, binding = 2) uniform mediump texture2D _MainTex;
layout(set = 0, binding = 3) uniform mediump texture2D _AutoExposureTex;
layout(set = 0, binding = 4) uniform mediump texture2D _BloomTex;
layout(set = 0, binding = 5) uniform mediump texture2D _Bloom_DirtTex;
layout(set = 0, binding = 6) uniform mediump texture2D _Lut2D;
layout(set = 0, binding = 7) uniform mediump texture2D _Vignette_Mask;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_1;
layout(location = 1) in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
float u_xlat9;
bool u_xlatb9;
float u_xlat13;
vec2 u_xlat14;
float u_xlat15;
float u_xlat19;
float u_xlat20;
float u_xlat21;
layout(set = 0, binding = 8) uniform mediump  sampler sampler_DitheringTex;
layout(set = 0, binding = 9) uniform mediump  sampler sampler_MainTex;
layout(set = 0, binding = 10) uniform mediump  sampler sampler_AutoExposureTex;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_BloomTex;
layout(set = 0, binding = 12) uniform mediump  sampler sampler_Bloom_DirtTex;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_Lut2D;
layout(set = 0, binding = 14) uniform mediump  sampler sampler_Vignette_Mask;
void main()
{
    phase0_Input0_1 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0 = phase0_Input0_1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1 = u_xlat0 * _Distortion_Amount.zzzz + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat0 * _Distortion_Amount.zzzz + (-_Distortion_CenterScale.xyxy);
    u_xlat0 = u_xlat0 * _Distortion_CenterScale.zwzw;
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb8 = 0.0<_Distortion_Amount.w;
    if(u_xlatb8){
        u_xlat14.xy = u_xlat2.xx * _Distortion_Amount.xy;
        u_xlat3.x = sin(u_xlat14.x);
        u_xlat4.x = cos(u_xlat14.x);
        u_xlat14.x = u_xlat3.x / u_xlat4.x;
        u_xlat20 = float(1.0) / u_xlat14.y;
        u_xlat14.x = u_xlat14.x * u_xlat20 + -1.0;
        u_xlat14.xy = u_xlat0.xy * u_xlat14.xx + u_xlat1.xy;
    } else {
        u_xlat3.x = float(1.0) / u_xlat2.x;
        u_xlat3.x = u_xlat3.x * _Distortion_Amount.x;
        u_xlat2.x = u_xlat2.x * _Distortion_Amount.y;
        u_xlat9 = min(abs(u_xlat2.x), 1.0);
        u_xlat15 = max(abs(u_xlat2.x), 1.0);
        u_xlat15 = float(1.0) / u_xlat15;
        u_xlat9 = u_xlat15 * u_xlat9;
        u_xlat15 = u_xlat9 * u_xlat9;
        u_xlat21 = u_xlat15 * 0.0208350997 + -0.0851330012;
        u_xlat21 = u_xlat15 * u_xlat21 + 0.180141002;
        u_xlat21 = u_xlat15 * u_xlat21 + -0.330299497;
        u_xlat15 = u_xlat15 * u_xlat21 + 0.999866009;
        u_xlat21 = u_xlat15 * u_xlat9;
        u_xlatb4 = 1.0<abs(u_xlat2.x);
        u_xlat21 = u_xlat21 * -2.0 + 1.57079637;
        u_xlat21 = u_xlatb4 ? u_xlat21 : float(0.0);
        u_xlat9 = u_xlat9 * u_xlat15 + u_xlat21;
        u_xlat2.x = min(u_xlat2.x, 1.0);
        u_xlatb2 = u_xlat2.x<(-u_xlat2.x);
        u_xlat2.x = (u_xlatb2) ? (-u_xlat9) : u_xlat9;
        u_xlat2.x = u_xlat3.x * u_xlat2.x + -1.0;
        u_xlat14.xy = u_xlat0.xy * u_xlat2.xx + u_xlat1.xy;
    }
    u_xlat0.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = sqrt(u_xlat0.x);
    if(u_xlatb8){
        u_xlat1.xy = u_xlat0.xx * _Distortion_Amount.xy;
        u_xlat2.x = cos(u_xlat1.x);
        u_xlat1.x = sin(u_xlat1.x);
        u_xlat6 = u_xlat1.x / u_xlat2.x;
        u_xlat1.x = float(1.0) / u_xlat1.y;
        u_xlat6 = u_xlat6 * u_xlat1.x + -1.0;
        u_xlat1.xy = u_xlat0.zw * vec2(u_xlat6) + u_xlat1.zw;
    } else {
        u_xlat6 = float(1.0) / u_xlat0.x;
        u_xlat6 = u_xlat6 * _Distortion_Amount.x;
        u_xlat0.x = u_xlat0.x * _Distortion_Amount.y;
        u_xlat2.x = min(abs(u_xlat0.x), 1.0);
        u_xlat8 = max(abs(u_xlat0.x), 1.0);
        u_xlat8 = float(1.0) / u_xlat8;
        u_xlat2.x = u_xlat8 * u_xlat2.x;
        u_xlat8 = u_xlat2.x * u_xlat2.x;
        u_xlat3.x = u_xlat8 * 0.0208350997 + -0.0851330012;
        u_xlat3.x = u_xlat8 * u_xlat3.x + 0.180141002;
        u_xlat3.x = u_xlat8 * u_xlat3.x + -0.330299497;
        u_xlat8 = u_xlat8 * u_xlat3.x + 0.999866009;
        u_xlat3.x = u_xlat8 * u_xlat2.x;
        u_xlatb9 = 1.0<abs(u_xlat0.x);
        u_xlat3.x = u_xlat3.x * -2.0 + 1.57079637;
        u_xlat3.x = u_xlatb9 ? u_xlat3.x : float(0.0);
        u_xlat2.x = u_xlat2.x * u_xlat8 + u_xlat3.x;
        u_xlat0.x = min(u_xlat0.x, 1.0);
        u_xlatb0.x = u_xlat0.x<(-u_xlat0.x);
        u_xlat0.x = (u_xlatb0.x) ? (-u_xlat2.x) : u_xlat2.x;
        u_xlat0.x = u_xlat6 * u_xlat0.x + -1.0;
        u_xlat1.xy = u_xlat0.zw * u_xlat0.xx + u_xlat1.zw;
    }
    u_xlat0.x = texture(sampler2D(_AutoExposureTex, sampler_AutoExposureTex), phase0_Input0_1.xy).x;
    u_xlat1 = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat1.xy);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0 = _BloomTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat2.x = _Bloom_Settings.x * 0.5;
    u_xlat3 = u_xlat0.xyzy * u_xlat2.xxxx + u_xlat14.xyxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
    u_xlat4 = texture(sampler2D(_BloomTex, sampler_BloomTex), u_xlat3.xy);
    u_xlat3 = texture(sampler2D(_BloomTex, sampler_BloomTex), u_xlat3.zw);
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat0 = u_xlat0.xwzw * u_xlat2.xxxx + u_xlat14.xyxy;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(_RenderViewportScaleFactor);
    u_xlat4 = texture(sampler2D(_BloomTex, sampler_BloomTex), u_xlat0.xy);
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat0 = texture(sampler2D(_BloomTex, sampler_BloomTex), u_xlat0.zw);
    u_xlat0 = u_xlat0 + u_xlat3;
    u_xlat0 = u_xlat0 * _Bloom_Settings.yyyy;
    u_xlat2.xy = u_xlat14.xy * _Bloom_DirtTileOffset.xy + _Bloom_DirtTileOffset.zw;
    u_xlat3.xyz = texture(sampler2D(_Bloom_DirtTex, sampler_Bloom_DirtTex), u_xlat2.xy).xyz;
    u_xlat4 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat3.xyz = u_xlat3.xyz * _Bloom_Settings.zzz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 1.0);
    u_xlat5.xyz = u_xlat0.xyz * _Bloom_Color.xyz;
    u_xlat5.w = u_xlat0.w * 0.25;
    u_xlat0 = u_xlat1 + u_xlat5;
    u_xlat0 = u_xlat3 * u_xlat4 + u_xlat0;
    u_xlatb1 = _Vignette_Mode<0.5;
    if(u_xlatb1){
        u_xlat1.xy = u_xlat14.xy + (-_Vignette_Center.xy);
        u_xlat1.yz = abs(u_xlat1.yx) * _Vignette_Settings.xx;
        u_xlat19 = _ScreenParams.x / _ScreenParams.y;
        u_xlat19 = u_xlat19 + -1.0;
        u_xlat19 = _Vignette_Settings.w * u_xlat19 + 1.0;
        u_xlat1.x = u_xlat19 * u_xlat1.z;
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
        u_xlat7.xyz = (-_Vignette_Color.xyz) + vec3(1.0, 1.0, 1.0);
        u_xlat7.xyz = u_xlat1.xxx * u_xlat7.xyz + _Vignette_Color.xyz;
        u_xlat3.xyz = u_xlat0.xyz * u_xlat7.xyz;
        u_xlat7.x = u_xlat0.w + -1.0;
        u_xlat3.w = u_xlat1.x * u_xlat7.x + 1.0;
    } else {
        u_xlat1.x = texture(sampler2D(_Vignette_Mask, sampler_Vignette_Mask), u_xlat14.xy).w;
        u_xlat1.z = u_xlat1.x + 0.0549999997;
        u_xlat7.xy = u_xlat1.xz * vec2(0.0773993805, 0.947867334);
        u_xlat13 = max(abs(u_xlat7.y), 1.1920929e-07);
        u_xlat13 = log2(u_xlat13);
        u_xlat13 = u_xlat13 * 2.4000001;
        u_xlat13 = exp2(u_xlat13);
        u_xlatb1 = 0.0404499993>=u_xlat1.x;
        u_xlat1.x = (u_xlatb1) ? u_xlat7.x : u_xlat13;
        u_xlat7.xyz = (-_Vignette_Color.xyz) + vec3(1.0, 1.0, 1.0);
        u_xlat7.xyz = u_xlat1.xxx * u_xlat7.xyz + _Vignette_Color.xyz;
        u_xlat7.xyz = u_xlat0.xyz * u_xlat7.xyz + (-u_xlat0.xyz);
        u_xlat3.xyz = vec3(_Vignette_Opacity) * u_xlat7.xyz + u_xlat0.xyz;
        u_xlat0.x = u_xlat0.w + -1.0;
        u_xlat3.w = u_xlat1.x * u_xlat0.x + 1.0;
    }
    u_xlat0 = u_xlat3 * vec4(vec4(_PostExposure, _PostExposure, _PostExposure, _PostExposure));
    u_xlat0.xyz = u_xlat0.zxy * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat6 = floor(u_xlat1.x);
    u_xlat1.xw = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat1.yz * _Lut2D_Params.xy + u_xlat1.xw;
    u_xlat1.x = u_xlat6 * _Lut2D_Params.y + u_xlat1.y;
    u_xlat2.xyz = texture(sampler2D(_Lut2D, sampler_Lut2D), u_xlat1.xz).xyz;
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat1.xy = u_xlat1.xz + u_xlat3.xy;
    u_xlat1.xyz = texture(sampler2D(_Lut2D, sampler_Lut2D), u_xlat1.xy).xyz;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat6);
    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xy = phase0_Input0_1.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat1.x = texture(sampler2D(_DitheringTex, sampler_DitheringTex), u_xlat1.xy).w;
    u_xlat1.x = u_xlat1.x * 2.0 + -1.0;
    u_xlat7.x = u_xlat1.x * 3.40282347e+38 + 0.5;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat7.x = u_xlat7.x * 2.0 + -1.0;
    u_xlat1.x = -abs(u_xlat1.x) + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat7.x;
    u_xlat7.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlat2.xyz = max(abs(u_xlat0.xyz), vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    u_xlat0.x = (u_xlatb0.x) ? u_xlat7.x : u_xlat2.x;
    u_xlat0.y = (u_xlatb0.y) ? u_xlat7.y : u_xlat2.y;
    u_xlat0.z = (u_xlatb0.z) ? u_xlat7.z : u_xlat2.z;
    u_xlat0.xyz = u_xlat1.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlat2.xyz = u_xlat0.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat2.xyz = max(abs(u_xlat2.xyz), vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.x = (u_xlatb0.x) ? u_xlat1.x : u_xlat2.x;
    SV_Target0.y = (u_xlatb0.y) ? u_xlat1.y : u_xlat2.y;
    SV_Target0.z = (u_xlatb0.z) ? u_xlat1.z : u_xlat2.z;
    SV_Target0.w = u_xlat0.w;
    return;
}

