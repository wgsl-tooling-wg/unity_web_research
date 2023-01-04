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
	mat4x4 unity_WorldToShadow[4];
	vec4 _LightShadowData;
	vec4 unity_ShadowFadeCenterAndType;
	mat4x4 unity_MatrixV;
	vec4 unity_ProbeVolumeParams;
	mat4x4 unity_ProbeVolumeWorldToObject;
	vec3 unity_ProbeVolumeSizeInv;
	vec3 unity_ProbeVolumeMin;
	vec4 _LightColor0;
	vec4 _ShadowMapTexture_TexelSize;
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
layout(set = 0, binding = 8) uniform highp texture2D _ShadowMapTexture;
layout(location = 0) in highp vec4 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD1;
layout(location = 2) in highp vec3 vs_TEXCOORD2;
layout(location = 3) in highp vec3 vs_TEXCOORD3;
layout(location = 4) in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
vec3 u_xlat13;
float u_xlat14;
vec3 u_xlat15;
bool u_xlatb15;
float u_xlat26;
float u_xlat28;
vec2 u_xlat37;
float u_xlat39;
bool u_xlatb39;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
layout(set = 0, binding = 9) uniform highp  sampler samplerunity_ProbeVolumeSH;
layout(set = 0, binding = 10) uniform highp  samplerShadow sampler_ShadowMapTexture;
layout(set = 0, binding = 11) uniform highp  sampler sampler_LightTexture0;
layout(set = 0, binding = 12) uniform highp  sampler sampler_LightTextureB0;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_MainTex;
layout(set = 0, binding = 14) uniform mediump  sampler sampler_Noise;
layout(set = 0, binding = 15) uniform mediump  sampler sampler_Normal;
layout(set = 0, binding = 16) uniform mediump  sampler sampler_MetallicSmooth;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat40 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * u_xlat2.xyz;
    u_xlat40 = texture(sampler2D(_Noise, sampler_Noise), vs_TEXCOORD0.xy).x;
    u_xlat4.xy = texture(sampler2D(_MetallicSmooth, sampler_MetallicSmooth), vs_TEXCOORD0.zw).xw;
    u_xlat40 = (-u_xlat40) + 1.0;
    u_xlat40 = u_xlat40 + (-_Cutoff);
    u_xlat41 = float(1.0) / (-_EdgeSize);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat5.xyz = texture(sampler2D(_MainTex, sampler_MainTex), vs_TEXCOORD0.zw).xyz;
    u_xlat6.xyz = u_xlat5.xyz * _Color.xyz;
    u_xlat7.xyz = texture(sampler2D(_Normal, sampler_Normal), vs_TEXCOORD0.zw).xyw;
    u_xlat7.x = u_xlat7.z * u_xlat7.x;
    u_xlat7.xy = u_xlat7.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat42 = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat42 = min(u_xlat42, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat7.z = sqrt(u_xlat42);
    u_xlat42 = u_xlat4.x * _Metallic;
    u_xlat40 = (-u_xlat41) * u_xlat40 + (-_Cutoff);
    u_xlat40 = u_xlat40 + 1.0;
    u_xlatb40 = u_xlat40<0.0;
    if(((int(u_xlatb40) * int(0xffffffffu)))!=0){discard;}
    u_xlat8 = vs_TEXCOORD4.yyyy * unity_WorldToLight[1];
    u_xlat8 = unity_WorldToLight[0] * vs_TEXCOORD4.xxxx + u_xlat8;
    u_xlat8 = unity_WorldToLight[2] * vs_TEXCOORD4.zzzz + u_xlat8;
    u_xlat8 = u_xlat8 + unity_WorldToLight[3];
    u_xlat9.x = unity_MatrixV[0].z;
    u_xlat9.y = unity_MatrixV[1].z;
    u_xlat9.z = unity_MatrixV[2].z;
    u_xlat40 = dot(u_xlat2.xyz, u_xlat9.xyz);
    u_xlat2.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat40) + u_xlat2.x;
    u_xlat40 = unity_ShadowFadeCenterAndType.w * u_xlat2.x + u_xlat40;
    u_xlat40 = u_xlat40 * _LightShadowData.z + _LightShadowData.w;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = unity_ProbeVolumeParams.y==1.0;
        u_xlat15.xyz = vs_TEXCOORD4.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat15.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD4.xxx + u_xlat15.xyz;
        u_xlat15.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.zzz + u_xlat15.xyz;
        u_xlat15.xyz = u_xlat15.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat15.xyz : vs_TEXCOORD4.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat15.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat15.x, u_xlat4.x);
        u_xlat2 = texture(sampler3D(unity_ProbeVolumeSH, samplerunity_ProbeVolumeSH), u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    }
    u_xlat2.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlatb15 = u_xlat40<0.99000001;
    if(u_xlatb15){
        u_xlat9 = vs_TEXCOORD4.yyyy * unity_WorldToShadow[1 / 4][1 % 4];
        u_xlat9 = unity_WorldToShadow[0 / 4][0 % 4] * vs_TEXCOORD4.xxxx + u_xlat9;
        u_xlat9 = unity_WorldToShadow[2 / 4][2 % 4] * vs_TEXCOORD4.zzzz + u_xlat9;
        u_xlat9 = u_xlat9 + unity_WorldToShadow[3 / 4][3 % 4];
        u_xlat15.xyz = u_xlat9.xyz / u_xlat9.www;
        u_xlat4.xz = u_xlat15.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
        u_xlat4.xz = floor(u_xlat4.xz);
        u_xlat15.xy = u_xlat15.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat4.xz);
        u_xlat9 = u_xlat15.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
        u_xlat10.xw = u_xlat9.xz * u_xlat9.xz;
        u_xlat9.xz = u_xlat10.xw * vec2(0.5, 0.5) + (-u_xlat15.xy);
        u_xlat11.xy = (-u_xlat15.xy) + vec2(1.0, 1.0);
        u_xlat37.xy = min(u_xlat15.xy, vec2(0.0, 0.0));
        u_xlat11.xy = (-u_xlat37.xy) * u_xlat37.xy + u_xlat11.xy;
        u_xlat15.xy = max(u_xlat15.xy, vec2(0.0, 0.0));
        u_xlat15.xy = (-u_xlat15.xy) * u_xlat15.xy + u_xlat9.yw;
        u_xlat12.x = u_xlat9.x;
        u_xlat12.y = u_xlat11.x;
        u_xlat12.z = u_xlat15.x;
        u_xlat12.w = u_xlat10.x;
        u_xlat12 = u_xlat12 * vec4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
        u_xlat10.x = u_xlat9.z;
        u_xlat10.y = u_xlat11.y;
        u_xlat10.z = u_xlat15.y;
        u_xlat9 = u_xlat10 * vec4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
        u_xlat10 = u_xlat12.ywyw + u_xlat12.xzxz;
        u_xlat11 = u_xlat9.yyww + u_xlat9.xxzz;
        u_xlat15.xy = u_xlat12.yw / u_xlat10.zw;
        u_xlat15.xy = u_xlat15.xy + vec2(-1.5, 0.5);
        u_xlat9.xy = u_xlat9.yw / u_xlat11.yw;
        u_xlat9.xy = u_xlat9.xy + vec2(-1.5, 0.5);
        u_xlat12.xy = u_xlat15.xy * _ShadowMapTexture_TexelSize.xx;
        u_xlat12.zw = u_xlat9.xy * _ShadowMapTexture_TexelSize.yy;
        u_xlat9 = u_xlat10 * u_xlat11;
        u_xlat10 = u_xlat4.xzxz * _ShadowMapTexture_TexelSize.xyxy + u_xlat12.xzyz;
        vec3 txVec0 = vec3(u_xlat10.xy,u_xlat15.z);
        u_xlat15.x = textureLod(sampler2DShadow(_ShadowMapTexture, sampler_ShadowMapTexture), txVec0, 0.0);
        vec3 txVec1 = vec3(u_xlat10.zw,u_xlat15.z);
        u_xlat28 = textureLod(sampler2DShadow(_ShadowMapTexture, sampler_ShadowMapTexture), txVec1, 0.0);
        u_xlat28 = u_xlat28 * u_xlat9.y;
        u_xlat15.x = u_xlat9.x * u_xlat15.x + u_xlat28;
        u_xlat10 = u_xlat4.xzxz * _ShadowMapTexture_TexelSize.xyxy + u_xlat12.xwyw;
        vec3 txVec2 = vec3(u_xlat10.xy,u_xlat15.z);
        u_xlat28 = textureLod(sampler2DShadow(_ShadowMapTexture, sampler_ShadowMapTexture), txVec2, 0.0);
        u_xlat15.x = u_xlat9.z * u_xlat28 + u_xlat15.x;
        vec3 txVec3 = vec3(u_xlat10.zw,u_xlat15.z);
        u_xlat28 = textureLod(sampler2DShadow(_ShadowMapTexture, sampler_ShadowMapTexture), txVec3, 0.0);
        u_xlat15.x = u_xlat9.w * u_xlat28 + u_xlat15.x;
        u_xlat28 = (-_LightShadowData.x) + 1.0;
        u_xlat15.x = u_xlat15.x * u_xlat28 + _LightShadowData.x;
    } else {
        u_xlat15.x = 1.0;
    }
    u_xlat2.x = (-u_xlat15.x) + u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x + u_xlat15.x;
    u_xlatb2 = 0.0<u_xlat8.z;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat15.xy = u_xlat8.xy / u_xlat8.ww;
    u_xlat15.xy = u_xlat15.xy + vec2(0.5, 0.5);
    u_xlat15.x = texture(sampler2D(_LightTexture0, sampler_LightTexture0), u_xlat15.xy).w;
    u_xlat2.x = u_xlat15.x * u_xlat2.x;
    u_xlat15.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat15.x = texture(sampler2D(_LightTextureB0, sampler_LightTextureB0), u_xlat15.xx).x;
    u_xlat2.x = u_xlat15.x * u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat7.xyz);
    u_xlat2.y = dot(vs_TEXCOORD2.xyz, u_xlat7.xyz);
    u_xlat2.z = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat4.xzw = vec3(u_xlat40) * _LightColor0.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _Color.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat5.xyz = vec3(u_xlat42) * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat40 = (-u_xlat42) * 0.959999979 + 0.959999979;
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat6.xyz;
    u_xlat40 = (-u_xlat4.y) * _Glossiness + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat39) + u_xlat3.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = max(u_xlat39, 0.00100000005);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = dot(u_xlat13.xx, vec2(u_xlat40));
    u_xlat13.x = u_xlat13.x + -0.5;
    u_xlat26 = (-u_xlat41) + 1.0;
    u_xlat1.x = u_xlat26 * u_xlat26;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat26 = u_xlat26 * u_xlat1.x;
    u_xlat26 = u_xlat13.x * u_xlat26 + 1.0;
    u_xlat1.x = -abs(u_xlat39) + 1.0;
    u_xlat14 = u_xlat1.x * u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat1.x * u_xlat14;
    u_xlat13.x = u_xlat13.x * u_xlat1.x + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat26;
    u_xlat26 = u_xlat40 * u_xlat40;
    u_xlat26 = max(u_xlat26, 0.00200000009);
    u_xlat1.x = (-u_xlat26) + 1.0;
    u_xlat14 = abs(u_xlat39) * u_xlat1.x + u_xlat26;
    u_xlat1.x = u_xlat41 * u_xlat1.x + u_xlat26;
    u_xlat39 = abs(u_xlat39) * u_xlat1.x;
    u_xlat39 = u_xlat41 * u_xlat14 + u_xlat39;
    u_xlat39 = u_xlat39 + 9.99999975e-06;
    u_xlat39 = 0.5 / u_xlat39;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat1.x = u_xlat2.x * u_xlat26 + (-u_xlat2.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x + 1.0;
    u_xlat26 = u_xlat26 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.00000001e-07;
    u_xlat26 = u_xlat26 / u_xlat1.x;
    u_xlat13.y = u_xlat26 * u_xlat39;
    u_xlat13.xy = vec2(u_xlat41) * u_xlat13.xy;
    u_xlat26 = u_xlat13.y * 3.14159274;
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlatb39 = u_xlat39!=0.0;
    u_xlat39 = u_xlatb39 ? 1.0 : float(0.0);
    u_xlat26 = u_xlat39 * u_xlat26;
    u_xlat1.xyz = u_xlat13.xxx * u_xlat4.xzw;
    u_xlat13.xyz = u_xlat4.xzw * vec3(u_xlat26);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat40 = u_xlat0.x * u_xlat0.x;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat0.x = u_xlat0.x * u_xlat40;
    u_xlat2.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat13.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat6.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

