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
	vec3 _WorldSpaceCameraPos;
	vec4 _WorldSpaceLightPos0;
	vec4 unity_OcclusionMaskSelector;
	vec4 unity_ProbeVolumeParams;
	mat4x4 unity_ProbeVolumeWorldToObject;
	vec3 unity_ProbeVolumeSizeInv;
	vec3 unity_ProbeVolumeMin;
	vec4 _LightColor0;
	mat4x4 unity_WorldToLight;
	float _Glossiness;
	float _Metallic;
	float _Cutoff;
	float _EdgeSize;
	vec4 _Color;
};
layout(set = 0, binding = 1) uniform mediump texture2D _Noise;
layout(set = 0, binding = 2) uniform mediump texture2D _MetallicSmooth;
layout(set = 0, binding = 3) uniform mediump texture2D _MainTex;
layout(set = 0, binding = 4) uniform mediump texture2D _Normal;
layout(set = 0, binding = 5) uniform highp texture2D _LightTexture0;
layout(set = 0, binding = 6) uniform highp texture2D _LightTextureB0;
layout(set = 0, binding = 7) uniform highp texture3D unity_ProbeVolumeSH;
layout(location = 0) in highp vec4 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD1;
layout(location = 2) in highp vec3 vs_TEXCOORD2;
layout(location = 3) in highp vec3 vs_TEXCOORD3;
layout(location = 4) in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
float u_xlat10;
float u_xlat11;
float u_xlat18;
vec2 u_xlat21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat29;
bool u_xlatb29;
layout(set = 0, binding = 8) uniform highp  sampler samplerunity_ProbeVolumeSH;
layout(set = 0, binding = 9) uniform highp  sampler sampler_LightTexture0;
layout(set = 0, binding = 10) uniform highp  sampler sampler_LightTextureB0;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_MainTex;
layout(set = 0, binding = 12) uniform mediump  sampler sampler_Noise;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_Normal;
layout(set = 0, binding = 14) uniform mediump  sampler sampler_MetallicSmooth;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat28 = texture(sampler2D(_Noise, sampler_Noise), vs_TEXCOORD0.xy).x;
    u_xlat3.xy = texture(sampler2D(_MetallicSmooth, sampler_MetallicSmooth), vs_TEXCOORD0.zw).xw;
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 + (-_Cutoff);
    u_xlat29 = float(1.0) / (-_EdgeSize);
    u_xlat28 = u_xlat28 * u_xlat29;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat29 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat4.xyz = texture(sampler2D(_MainTex, sampler_MainTex), vs_TEXCOORD0.zw).xyz;
    u_xlat5.xyz = u_xlat4.xyz * _Color.xyz;
    u_xlat6.xyz = texture(sampler2D(_Normal, sampler_Normal), vs_TEXCOORD0.zw).xyw;
    u_xlat6.x = u_xlat6.z * u_xlat6.x;
    u_xlat6.xy = u_xlat6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat21.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat21.x = min(u_xlat21.x, 1.0);
    u_xlat21.x = (-u_xlat21.x) + 1.0;
    u_xlat6.z = sqrt(u_xlat21.x);
    u_xlat3.x = u_xlat3.x * _Metallic;
    u_xlat28 = (-u_xlat29) * u_xlat28 + (-_Cutoff);
    u_xlat28 = u_xlat28 + 1.0;
    u_xlatb28 = u_xlat28<0.0;
    if(((int(u_xlatb28) * int(0xffffffffu)))!=0){discard;}
    u_xlat7 = vs_TEXCOORD4.yyyy * unity_WorldToLight[1];
    u_xlat7 = unity_WorldToLight[0] * vs_TEXCOORD4.xxxx + u_xlat7;
    u_xlat7 = unity_WorldToLight[2] * vs_TEXCOORD4.zzzz + u_xlat7;
    u_xlat7 = u_xlat7 + unity_WorldToLight[3];
    u_xlatb28 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb28){
        u_xlatb28 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD4.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD4.xxx + u_xlat8.xyz;
        u_xlat8.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.zzz + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb28)) ? u_xlat8.xyz : vs_TEXCOORD4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat8.yzw = u_xlat8.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat28 = u_xlat8.y * 0.25 + 0.75;
        u_xlat29 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat8.x = max(u_xlat28, u_xlat29);
        u_xlat8 = texture(sampler3D(unity_ProbeVolumeSH, samplerunity_ProbeVolumeSH), u_xlat8.xzw);
    } else {
        u_xlat8.x = float(1.0);
        u_xlat8.y = float(1.0);
        u_xlat8.z = float(1.0);
        u_xlat8.w = float(1.0);
    }
    u_xlat28 = dot(u_xlat8, unity_OcclusionMaskSelector);
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlatb29 = 0.0<u_xlat7.z;
    u_xlat29 = u_xlatb29 ? 1.0 : float(0.0);
    u_xlat21.xy = u_xlat7.xy / u_xlat7.ww;
    u_xlat21.xy = u_xlat21.xy + vec2(0.5, 0.5);
    u_xlat21.x = texture(sampler2D(_LightTexture0, sampler_LightTexture0), u_xlat21.xy).w;
    u_xlat29 = u_xlat29 * u_xlat21.x;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat21.x = texture(sampler2D(_LightTextureB0, sampler_LightTextureB0), u_xlat21.xx).x;
    u_xlat29 = u_xlat29 * u_xlat21.x;
    u_xlat28 = u_xlat28 * u_xlat29;
    u_xlat7.x = dot(vs_TEXCOORD1.xyz, u_xlat6.xyz);
    u_xlat7.y = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
    u_xlat7.z = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
    u_xlat29 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat6.xyz = vec3(u_xlat29) * u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat28) * _LightColor0.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _Color.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat28 = (-u_xlat3.x) * 0.959999979 + 0.959999979;
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat28 = (-u_xlat3.y) * _Glossiness + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27) + u_xlat2.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 0.00100000005);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat27 = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat11 = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = u_xlat0.x * u_xlat0.x;
    u_xlat9.x = dot(u_xlat9.xx, vec2(u_xlat28));
    u_xlat9.x = u_xlat9.x + -0.5;
    u_xlat18 = (-u_xlat2.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat9.x * u_xlat18 + 1.0;
    u_xlat1.x = -abs(u_xlat27) + 1.0;
    u_xlat10 = u_xlat1.x * u_xlat1.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat1.x = u_xlat1.x * u_xlat10;
    u_xlat9.x = u_xlat9.x * u_xlat1.x + 1.0;
    u_xlat9.x = u_xlat9.x * u_xlat18;
    u_xlat18 = u_xlat28 * u_xlat28;
    u_xlat18 = max(u_xlat18, 0.00200000009);
    u_xlat1.x = (-u_xlat18) + 1.0;
    u_xlat10 = abs(u_xlat27) * u_xlat1.x + u_xlat18;
    u_xlat1.x = u_xlat2.x * u_xlat1.x + u_xlat18;
    u_xlat27 = abs(u_xlat27) * u_xlat1.x;
    u_xlat27 = u_xlat2.x * u_xlat10 + u_xlat27;
    u_xlat27 = u_xlat27 + 9.99999975e-06;
    u_xlat27 = 0.5 / u_xlat27;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat11 * u_xlat18 + (-u_xlat11);
    u_xlat1.x = u_xlat1.x * u_xlat11 + 1.0;
    u_xlat18 = u_xlat18 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.00000001e-07;
    u_xlat18 = u_xlat18 / u_xlat1.x;
    u_xlat9.y = u_xlat18 * u_xlat27;
    u_xlat9.xy = u_xlat2.xx * u_xlat9.xy;
    u_xlat18 = u_xlat9.y * 3.14159274;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb27 = u_xlat27!=0.0;
    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat27 * u_xlat18;
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat7.xyz * vec3(u_xlat18);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat28 = u_xlat0.x * u_xlat0.x;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat0.x = u_xlat0.x * u_xlat28;
    u_xlat2.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat9.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat3.xzw * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

