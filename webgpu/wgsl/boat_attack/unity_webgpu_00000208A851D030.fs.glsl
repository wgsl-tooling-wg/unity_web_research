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
const uvec4 ImmCB_0[] = uvec4[4] (
	uvec4(0x3F800000, 0x0, 0x0, 0x0),
	uvec4(0x0, 0x3F800000, 0x0, 0x0),
	uvec4(0x0, 0x0, 0x3F800000, 0x0),
	uvec4(0x0, 0x0, 0x0, 0x3F800000));
layout(set = 1, binding = 0, std140) uniform PGlobals {
	vec4 _ScaledScreenParams;
	vec2 _GlobalMipBias;
	vec4 _MainLightPosition;
	vec4 _MainLightColor;
	vec4 _AmbientOcclusionParam;
	vec4 _AdditionalLightsCount;
	uint _RenderingLayerMaxInt;
	float _RenderingLayerRcpMaxInt;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 unity_OrthoParams;
	vec4 _ScaleBiasRt;
	vec4 unity_FogParams;
	vec4 unity_FogColor;
	mat4x4 unity_MatrixV;
	float _NightFade;
};
layout(set = 1, binding = 1, std140) uniform AdditionalLights {
	vec4 _AdditionalLightsPosition[256];
	vec4 _AdditionalLightsColor[256];
	vec4 _AdditionalLightsAttenuation[256];
	vec4 _AdditionalLightsSpotDir[256];
	vec4 _AdditionalLightsOcclusionProbes[256];
	float _AdditionalLightsLayerMasks[256];
};
layout(set = 1, binding = 2, std140) uniform UnityPerDraw {
	mat4x4 unity_ObjectToWorld;
	mat4x4 unity_WorldToObject;
	vec4 unity_LODFade;
	vec4 unity_WorldTransformParams;
	vec4 unity_RenderingLayer;
	vec4 unity_LightData;
	vec4 unity_LightIndices[2];
	vec4 unity_ProbesOcclusion;
	vec4 unity_SpecCube0_HDR;
	vec4 unity_SpecCube1_HDR;
	vec4 unity_SpecCube0_BoxMax;
	vec4 unity_SpecCube0_BoxMin;
	vec4 unity_SpecCube0_ProbePosition;
	vec4 unity_SpecCube1_BoxMax;
	vec4 unity_SpecCube1_BoxMin;
	vec4 unity_SpecCube1_ProbePosition;
	vec4 unity_LightmapST;
	vec4 unity_DynamicLightmapST;
	vec4 unity_SHAr;
	vec4 unity_SHAg;
	vec4 unity_SHAb;
	vec4 unity_SHBr;
	vec4 unity_SHBg;
	vec4 unity_SHBb;
	vec4 unity_SHC;
	vec4 unity_RendererBounds_Min;
	vec4 unity_RendererBounds_Max;
	mat4x4 unity_MatrixPreviousM;
	mat4x4 unity_MatrixPreviousMI;
	vec4 unity_MotionVectorsParams;
	vec4 unity_SpriteColor;
	vec4 unity_SpriteProps;
};
layout(set = 1, binding = 3, std140) uniform MainLightShadows {
	mat4x4 _MainLightWorldToShadow[5];
	vec4 _CascadeShadowSplitSpheres0;
	vec4 _CascadeShadowSplitSpheres1;
	vec4 _CascadeShadowSplitSpheres2;
	vec4 _CascadeShadowSplitSpheres3;
	vec4 _CascadeShadowSplitSphereRadii;
	vec4 _MainLightShadowOffset0;
	vec4 _MainLightShadowOffset1;
	vec4 _MainLightShadowParams;
	vec4 _MainLightShadowmapSize;
};
layout(set = 0, binding = 0) uniform mediump textureCube unity_SpecCube0;
layout(set = 0, binding = 1) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 2) uniform mediump texture2D unity_LightmapInd;
layout(set = 0, binding = 3) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 5) uniform mediump texture2D Texture2D_52571568;
layout(set = 0, binding = 6) uniform mediump texture2D Texture2D_F0A81025;
layout(set = 0, binding = 7) uniform mediump texture2D Texture2D_8BA53EED;
layout(set = 0, binding = 8) uniform mediump texture2D Texture2D_AB84E4D0;
layout(location = 0) in highp vec3 vs_INTERP0;
layout(location = 1) in highp vec3 vs_INTERP1;
layout(location = 2) in highp vec4 vs_INTERP2;
layout(location = 3) in highp vec4 vs_INTERP3;
layout(location = 4) in highp vec2 vs_INTERP4;
layout(location = 5) in highp vec4 vs_INTERP8;
layout(location = 0) out highp vec4 SV_Target0;
layout(location = 1) out highp vec4 SV_Target1;
layout(set = 0, binding = 9) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 10) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 12) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 13) uniform mediump  sampler samplerTexture2D_52571568;
layout(set = 0, binding = 14) uniform mediump  sampler samplerTexture2D_F0A81025;
layout(set = 0, binding = 15) uniform mediump  sampler samplerTexture2D_8BA53EED;
layout(set = 0, binding = 16) uniform mediump  sampler samplerTexture2D_AB84E4D0;
void main()
{
vec3 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
uint u_xlatu3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
vec2 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat15;
vec3 u_xlat18;
bool u_xlatb18;
vec3 u_xlat21;
float u_xlat25;
bool u_xlatb25;
float u_xlat27;
float u_xlat30;
bool u_xlatb30;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
bool u_xlatb37;
float u_xlat38;
uint u_xlatu38;
bool u_xlatb38;
float u_xlat39;
int u_xlati39;
uint u_xlatu39;
bool u_xlatb39;
float u_xlat40;
float u_xlat41;
int u_xlati41;
float u_xlat43;
float u_xlat44;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xyz = texture(sampler2D(Texture2D_52571568, samplerTexture2D_52571568), vs_INTERP3.xy, _GlobalMipBias.x).xyz;
    u_xlat1.xyz = texture(sampler2D(Texture2D_8BA53EED, samplerTexture2D_8BA53EED), vs_INTERP3.xy, _GlobalMipBias.x).xyw;
    u_xlat1.x = u_xlat1.x * u_xlat1.z;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat36 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat36 = (-u_xlat36) + 1.0;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = max(u_xlat36, 1.00000002e-16);
    u_xlat2.xyz = texture(sampler2D(Texture2D_AB84E4D0, samplerTexture2D_AB84E4D0), vs_INTERP3.xy, _GlobalMipBias.x).xyz;
    u_xlat25 = dot(unity_ObjectToWorld[3].xyz, unity_ObjectToWorld[3].xyz);
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = fract(u_xlat25);
    u_xlat25 = u_xlat25 + _NightFade;
    u_xlatb25 = u_xlat25>=1.0;
    u_xlat25 = u_xlatb25 ? 1.0 : float(0.0);
    u_xlat3.xyz = texture(sampler2D(Texture2D_F0A81025, samplerTexture2D_F0A81025), vs_INTERP3.xy, _GlobalMipBias.x).xwy;
    u_xlatb37 = 0.0<vs_INTERP2.w;
    u_xlat37 = (u_xlatb37) ? 1.0 : -1.0;
    u_xlatb38 = unity_WorldTransformParams.w>=0.0;
    u_xlat38 = (u_xlatb38) ? 1.0 : -1.0;
    u_xlat37 = u_xlat37 * u_xlat38;
    u_xlat4.xyz = vs_INTERP1.zxy * vs_INTERP2.yzx;
    u_xlat4.xyz = vs_INTERP1.yzx * vs_INTERP2.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.yyy * u_xlat4.xyz;
    u_xlat1.xyw = u_xlat1.xxx * vs_INTERP2.xyz + u_xlat4.xyz;
    u_xlat1.xyw = vec3(u_xlat36) * vs_INTERP1.xyz + u_xlat1.xyw;
    u_xlat36 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyw = vec3(u_xlat36) * u_xlat1.xyw;
    u_xlatb36 = unity_OrthoParams.w==0.0;
    u_xlat4.xyz = (-vs_INTERP0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat38 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat4.xyz = vec3(u_xlat38) * u_xlat4.xyz;
    u_xlat5.x = unity_MatrixV[0].z;
    u_xlat5.y = unity_MatrixV[1].z;
    u_xlat5.z = unity_MatrixV[2].z;
    u_xlat4.xyz = (bool(u_xlatb36)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat36 = vs_INTERP0.y * unity_MatrixV[1].z;
    u_xlat36 = unity_MatrixV[0].z * vs_INTERP0.x + u_xlat36;
    u_xlat36 = unity_MatrixV[2].z * vs_INTERP0.z + u_xlat36;
    u_xlat36 = u_xlat36 + unity_MatrixV[3].z;
    u_xlat36 = (-u_xlat36) + (-_ProjectionParams.y);
    u_xlat36 = max(u_xlat36, 0.0);
    u_xlat36 = u_xlat36 * unity_FogParams.x;
    u_xlat5 = texture(sampler2D(unity_LightmapInd, samplerunity_Lightmap), vs_INTERP4.xy, _GlobalMipBias.x);
    u_xlat6.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_INTERP4.xy, _GlobalMipBias.x).xyz;
    u_xlat5.xyz = u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat38 = dot(u_xlat1.xyw, u_xlat5.xyz);
    u_xlat38 = u_xlat38 + 0.5;
    u_xlat5.xyz = vec3(u_xlat38) * u_xlat6.xyz;
    u_xlat38 = max(u_xlat5.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat5.xyz / vec3(u_xlat38);
    u_xlat6.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat6.xy = u_xlat6.xy * hlslcc_FragCoord.xy;
    u_xlat38 = u_xlat6.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat6.z = (-u_xlat38) + 1.0;
    u_xlat3.xy = u_xlat3.xy;
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat38 = (-u_xlat3.x) * 0.959999979 + 0.959999979;
    u_xlat39 = (-u_xlat38) + u_xlat3.y;
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat38);
    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = u_xlat3.xxx * u_xlat0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat38 = (-u_xlat3.y) + 1.0;
    u_xlat3.x = u_xlat38 * u_xlat38;
    u_xlat3.x = max(u_xlat3.x, 0.0078125);
    u_xlat15 = u_xlat3.x * u_xlat3.x;
    u_xlat39 = u_xlat39 + 1.0;
    u_xlat39 = min(u_xlat39, 1.0);
    u_xlat40 = u_xlat3.x * 4.0 + 2.0;
    u_xlat41 = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat6.xz, _GlobalMipBias.x).x;
    u_xlat6.x = u_xlat41 + -1.0;
    u_xlat6.x = _AmbientOcclusionParam.w * u_xlat6.x + 1.0;
    u_xlat27 = min(u_xlat3.z, u_xlat41);
    vec3 txVec0 = vec3(vs_INTERP8.xy,vs_INTERP8.z);
    u_xlat41 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat18.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat41 = u_xlat41 * _MainLightShadowParams.x + u_xlat18.x;
    u_xlatb18 = 0.0>=vs_INTERP8.z;
    u_xlatb30 = vs_INTERP8.z>=1.0;
    u_xlatb18 = u_xlatb30 || u_xlatb18;
    u_xlat41 = (u_xlatb18) ? 1.0 : u_xlat41;
    u_xlat18.xyz = vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat18.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat18.x = u_xlat18.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat30 = (-u_xlat41) + 1.0;
    u_xlat41 = u_xlat18.x * u_xlat30 + u_xlat41;
    u_xlat18.xyz = u_xlat6.xxx * _MainLightColor.xyz;
    u_xlat43 = dot((-u_xlat4.xyz), u_xlat1.xyw);
    u_xlat43 = u_xlat43 + u_xlat43;
    u_xlat8.xyz = u_xlat1.xyw * (-vec3(u_xlat43)) + (-u_xlat4.xyz);
    u_xlat43 = dot(u_xlat1.xyw, u_xlat4.xyz);
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat44 = (-u_xlat38) * 0.699999988 + 1.70000005;
    u_xlat2.w = u_xlat38 * u_xlat44;
    u_xlat2 = u_xlat2 * vec4(14.0, 14.0, 14.0, 6.0);
    u_xlat8 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat8.xyz, u_xlat2.w);
    u_xlat38 = u_xlat8.w + -1.0;
    u_xlat38 = unity_SpecCube0_HDR.w * u_xlat38 + 1.0;
    u_xlat38 = max(u_xlat38, 0.0);
    u_xlat38 = log2(u_xlat38);
    u_xlat38 = u_xlat38 * unity_SpecCube0_HDR.y;
    u_xlat38 = exp2(u_xlat38);
    u_xlat38 = u_xlat38 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat38);
    u_xlat9.xy = u_xlat3.xx * u_xlat3.xx + vec2(-1.0, 1.0);
    u_xlat38 = float(1.0) / u_xlat9.y;
    u_xlat21.xyz = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat21.xyz = vec3(u_xlat43) * u_xlat21.xyz + u_xlat0.xyz;
    u_xlat21.xyz = vec3(u_xlat38) * u_xlat21.xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat21.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz + u_xlat8.xyz;
    u_xlat38 = u_xlat41 * unity_LightData.z;
    u_xlat3.x = dot(u_xlat1.xyw, _MainLightPosition.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat38 = u_xlat38 * u_xlat3.x;
    u_xlat18.xyz = vec3(u_xlat38) * u_xlat18.xyz;
    u_xlat8.xyz = u_xlat4.xyz + _MainLightPosition.xyz;
    u_xlat38 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-37);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat8.xyz;
    u_xlat38 = dot(u_xlat1.xyw, u_xlat8.xyz);
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
    u_xlat3.x = dot(_MainLightPosition.xyz, u_xlat8.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = u_xlat38 * u_xlat9.x + 1.00001001;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat3.x = max(u_xlat3.x, 0.100000001);
    u_xlat38 = u_xlat38 * u_xlat3.x;
    u_xlat38 = u_xlat40 * u_xlat38;
    u_xlat38 = u_xlat15 / u_xlat38;
    u_xlat8.xyz = u_xlat0.xyz * vec3(u_xlat38) + u_xlat7.xyz;
    u_xlat18.xyz = u_xlat18.xyz * u_xlat8.xyz;
    u_xlat38 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu38 =  uint(int(u_xlat38));
    u_xlat8.x = float(0.0);
    u_xlat8.y = float(0.0);
    u_xlat8.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu38 ; u_xlatu_loop_1++)
    {
        u_xlatu39 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati41 = int(u_xlatu_loop_1 & 3u);
        u_xlat39 = dot(unity_LightIndices[int(u_xlatu39)], uintBitsToFloat(ImmCB_0[u_xlati41]));
        u_xlati39 = int(u_xlat39);
        u_xlat21.xyz = (-vs_INTERP0.xyz) * _AdditionalLightsPosition[u_xlati39].www + _AdditionalLightsPosition[u_xlati39].xyz;
        u_xlat41 = dot(u_xlat21.xyz, u_xlat21.xyz);
        u_xlat41 = max(u_xlat41, 6.10351562e-05);
        u_xlat43 = inversesqrt(u_xlat41);
        u_xlat10.xyz = vec3(u_xlat43) * u_xlat21.xyz;
        u_xlat44 = float(1.0) / float(u_xlat41);
        u_xlat41 = u_xlat41 * _AdditionalLightsAttenuation[u_xlati39].x;
        u_xlat41 = (-u_xlat41) * u_xlat41 + 1.0;
        u_xlat41 = max(u_xlat41, 0.0);
        u_xlat41 = u_xlat41 * u_xlat41;
        u_xlat41 = u_xlat41 * u_xlat44;
        u_xlat44 = dot(_AdditionalLightsSpotDir[u_xlati39].xyz, u_xlat10.xyz);
        u_xlat44 = u_xlat44 * _AdditionalLightsAttenuation[u_xlati39].z + _AdditionalLightsAttenuation[u_xlati39].w;
        u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
        u_xlat44 = u_xlat44 * u_xlat44;
        u_xlat41 = u_xlat41 * u_xlat44;
        u_xlat11.xyz = u_xlat6.xxx * _AdditionalLightsColor[u_xlati39].xyz;
        u_xlat39 = dot(u_xlat1.xyw, u_xlat10.xyz);
        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
        u_xlat39 = u_xlat39 * u_xlat41;
        u_xlat11.xyz = vec3(u_xlat39) * u_xlat11.xyz;
        u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat43) + u_xlat4.xyz;
        u_xlat39 = dot(u_xlat21.xyz, u_xlat21.xyz);
        u_xlat39 = max(u_xlat39, 1.17549435e-37);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat21.xyz = vec3(u_xlat39) * u_xlat21.xyz;
        u_xlat39 = dot(u_xlat1.xyw, u_xlat21.xyz);
        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
        u_xlat41 = dot(u_xlat10.xyz, u_xlat21.xyz);
        u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
        u_xlat39 = u_xlat39 * u_xlat39;
        u_xlat39 = u_xlat39 * u_xlat9.x + 1.00001001;
        u_xlat41 = u_xlat41 * u_xlat41;
        u_xlat39 = u_xlat39 * u_xlat39;
        u_xlat41 = max(u_xlat41, 0.100000001);
        u_xlat39 = u_xlat39 * u_xlat41;
        u_xlat39 = u_xlat40 * u_xlat39;
        u_xlat39 = u_xlat15 / u_xlat39;
        u_xlat21.xyz = u_xlat0.xyz * vec3(u_xlat39) + u_xlat7.xyz;
        u_xlat8.xyz = u_xlat21.xyz * u_xlat11.xyz + u_xlat8.xyz;
    }
    u_xlat0.xyz = u_xlat5.xyz * vec3(u_xlat27) + u_xlat18.xyz;
    u_xlat0.xyz = u_xlat8.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat25) + u_xlat0.xyz;
    u_xlat36 = u_xlat36 * (-u_xlat36);
    u_xlat36 = exp2(u_xlat36);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(u_xlat36) * u_xlat0.xyz + unity_FogColor.xyz;
    u_xlatu0 = _RenderingLayerMaxInt & floatBitsToUint(unity_RenderingLayer.x);
    u_xlat0.x = float(u_xlatu0);
    SV_Target1.x = u_xlat0.x * _RenderingLayerRcpMaxInt;
    SV_Target1.x = clamp(SV_Target1.x, 0.0, 1.0);
    SV_Target0.w = 1.0;
    SV_Target1.yzw = vec3(0.0, 0.0, 0.0);
    return;
}

