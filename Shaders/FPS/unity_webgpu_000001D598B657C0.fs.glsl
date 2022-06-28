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
	vec4 unity_OcclusionMaskSelector;
	vec4 _LightShadowData;
	vec4 unity_ShadowFadeCenterAndType;
	mat4x4 unity_MatrixV;
	vec4 unity_ProbeVolumeParams;
	mat4x4 unity_ProbeVolumeWorldToObject;
	vec3 unity_ProbeVolumeSizeInv;
	vec3 unity_ProbeVolumeMin;
	vec4 _LightColor0;
	vec4 _Color;
	float _BumpScale;
	float _GlossMapScale;
};
layout(set = 0, binding = 1) uniform mediump texture2D _MainTex;
layout(set = 0, binding = 2) uniform mediump texture2D _MetallicGlossMap;
layout(set = 0, binding = 3) uniform mediump texture2D _BumpMap;
layout(set = 0, binding = 4) uniform mediump texture2D _ShadowMapTexture;
layout(set = 0, binding = 5) uniform highp texture3D unity_ProbeVolumeSH;
layout(location = 0) in highp vec4 vs_TEXCOORD0;
layout(location = 1) in highp vec4 vs_TEXCOORD1;
layout(location = 2) in highp vec4 vs_TEXCOORD2;
layout(location = 3) in highp vec4 vs_TEXCOORD3;
layout(location = 4) in highp vec4 vs_TEXCOORD4;
layout(location = 5) in highp vec3 vs_TEXCOORD5;
layout(location = 6) in highp vec4 vs_TEXCOORD7;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec3 u_xlat9;
float u_xlat10;
float u_xlat11;
float u_xlat16;
float u_xlat17;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
float u_xlat24;
bool u_xlatb24;
layout(set = 0, binding = 6) uniform highp  sampler samplerunity_ProbeVolumeSH;
layout(set = 0, binding = 7) uniform mediump  sampler sampler_MainTex;
layout(set = 0, binding = 8) uniform mediump  sampler sampler_BumpMap;
layout(set = 0, binding = 9) uniform mediump  sampler sampler_MetallicGlossMap;
layout(set = 0, binding = 10) uniform mediump  sampler sampler_ShadowMapTexture;
void main()
{
    u_xlat0.xy = texture(sampler2D(_MetallicGlossMap, sampler_MetallicGlossMap), vs_TEXCOORD0.xy).xw;
    u_xlat1.xyz = texture(sampler2D(_MainTex, sampler_MainTex), vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat1.xyz = _Color.xyz * u_xlat1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = (-u_xlat0.x) * 0.959999979 + 0.959999979;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = texture(sampler2D(_BumpMap, sampler_BumpMap), vs_TEXCOORD0.xy).xyw;
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * vec2(_BumpScale);
    u_xlat22 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat22 = min(u_xlat22, 1.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat9.xyz = u_xlat2.yyy * vs_TEXCOORD3.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat9.xyz;
    u_xlat2.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat22) + u_xlat2.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = unity_MatrixV[0].z;
    u_xlat5.y = unity_MatrixV[1].z;
    u_xlat5.z = unity_MatrixV[2].z;
    u_xlat23 = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = vs_TEXCOORD5.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = (-u_xlat23) + u_xlat24;
    u_xlat23 = unity_ShadowFadeCenterAndType.w * u_xlat24 + u_xlat23;
    u_xlat23 = u_xlat23 * _LightShadowData.z + _LightShadowData.w;
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlatb24 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb24){
        u_xlatb24 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD5.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb24)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat24 = u_xlat4.y * 0.25 + 0.75;
        u_xlat11 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat24, u_xlat11);
        u_xlat4 = texture(sampler3D(unity_ProbeVolumeSH, samplerunity_ProbeVolumeSH), u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat24 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat4.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat4.x = texture(sampler2D(_ShadowMapTexture, sampler_ShadowMapTexture), u_xlat4.xy).x;
    u_xlat24 = u_xlat24 + (-u_xlat4.x);
    u_xlat23 = u_xlat23 * u_xlat24 + u_xlat4.x;
    u_xlat4.xyz = vec3(u_xlat23) * _LightColor0.xyz;
    u_xlat7 = (-u_xlat0.y) * _GlossMapScale + 1.0;
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat22) + u_xlat5.xyz;
    u_xlat22 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat6.xyz = vec3(u_xlat22) * u_xlat6.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
    u_xlat16 = u_xlat9.x * u_xlat9.x;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat7));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = max(u_xlat7, 0.00200000009);
    u_xlat3.x = (-u_xlat7) + 1.0;
    u_xlat10 = abs(u_xlat22) * u_xlat3.x + u_xlat7;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat7;
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = u_xlat23 * u_xlat10 + u_xlat22;
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat3.x = u_xlat2.x * u_xlat7 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat7 = u_xlat7 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat7 = u_xlat7 / u_xlat2.x;
    u_xlat7 = u_xlat7 * u_xlat22;
    u_xlat7 = u_xlat23 * u_xlat7;
    u_xlat7 = u_xlat7 * 3.14159274;
    u_xlat7 = max(u_xlat7, 0.0);
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat7 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat7);
    u_xlat7 = (-u_xlat9.x) + 1.0;
    u_xlat22 = u_xlat7 * u_xlat7;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat7 = u_xlat7 * u_xlat22;
    u_xlat4.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * vec3(u_xlat7) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat0.xzw * u_xlat2.xzw + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

