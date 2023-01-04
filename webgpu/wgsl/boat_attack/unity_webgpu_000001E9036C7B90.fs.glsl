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
layout(set = 1, binding = 4, std140) uniform LightCookies {
	mat4x4 _MainLightWorldToLight;
	float _AdditionalLightsCookieEnableBits[8];
	float _MainLightCookieTextureFormat;
	float _AdditionalLightsCookieAtlasTextureFormat;
};
layout(set = 1, binding = 5, std140) uniform AdditionalLightsCookies {
	mat4x4 _AdditionalLightsWorldToLights[256];
	vec4 _AdditionalLightsCookieAtlasUVRects[256];
	float _AdditionalLightsLightTypes[256];
};
layout(set = 0, binding = 0) uniform mediump textureCube unity_SpecCube0;
layout(set = 0, binding = 1) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 2) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightCookieTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 5) uniform mediump texture2D Texture2D_52571568;
layout(set = 0, binding = 6) uniform mediump texture2D Texture2D_F0A81025;
layout(set = 0, binding = 7) uniform mediump texture2D Texture2D_8BA53EED;
layout(set = 0, binding = 8) uniform mediump texture2D Texture2D_AB84E4D0;
layout(location = 0) in highp vec3 vs_INTERP0;
layout(location = 1) in highp vec3 vs_INTERP1;
layout(location = 2) in highp vec4 vs_INTERP2;
layout(location = 3) in highp vec4 vs_INTERP3;
layout(location = 4) in highp vec4 vs_INTERP8;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 9) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 10) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 11) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 12) uniform mediump  sampler sampler_MainLightCookieTexture;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 14) uniform mediump  sampler samplerTexture2D_52571568;
layout(set = 0, binding = 15) uniform mediump  sampler samplerTexture2D_F0A81025;
layout(set = 0, binding = 16) uniform mediump  sampler samplerTexture2D_8BA53EED;
layout(set = 0, binding = 17) uniform mediump  sampler samplerTexture2D_AB84E4D0;
void main()
{
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bvec4 u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
vec2 u_xlat9;
float u_xlat10;
vec4 u_xlat11;
int u_xlati11;
uint u_xlatu11;
bool u_xlatb11;
vec4 u_xlat12;
vec3 u_xlat13;
float u_xlat17;
vec3 u_xlat20;
bvec2 u_xlatb20;
vec3 u_xlat23;
vec3 u_xlat24;
vec3 u_xlat25;
int u_xlati25;
float u_xlat29;
bool u_xlatb29;
float u_xlat31;
float u_xlat34;
bool u_xlatb34;
int u_xlati39;
vec2 u_xlat40;
bvec2 u_xlatb40;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
bool u_xlatb43;
float u_xlat44;
uint u_xlatu44;
bool u_xlatb44;
float u_xlat45;
float u_xlat46;
float u_xlat47;
uint u_xlatu47;
float u_xlat49;
uint u_xlatu49;
bool u_xlatb49;
float u_xlat50;
int u_xlati50;
float u_xlat53;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xyz = texture(sampler2D(Texture2D_52571568, samplerTexture2D_52571568), vs_INTERP3.xy, _GlobalMipBias.x).xyz;
    u_xlat1.xyz = texture(sampler2D(Texture2D_8BA53EED, samplerTexture2D_8BA53EED), vs_INTERP3.xy, _GlobalMipBias.x).xyw;
    u_xlat1.x = u_xlat1.x * u_xlat1.z;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat42 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat42 = min(u_xlat42, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = max(u_xlat42, 1.00000002e-16);
    u_xlat2.xyz = texture(sampler2D(Texture2D_AB84E4D0, samplerTexture2D_AB84E4D0), vs_INTERP3.xy, _GlobalMipBias.x).xyz;
    u_xlat29 = dot(unity_ObjectToWorld[3].xyz, unity_ObjectToWorld[3].xyz);
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = fract(u_xlat29);
    u_xlat29 = u_xlat29 + _NightFade;
    u_xlatb29 = u_xlat29>=1.0;
    u_xlat29 = u_xlatb29 ? 1.0 : float(0.0);
    u_xlat3.xyz = texture(sampler2D(Texture2D_F0A81025, samplerTexture2D_F0A81025), vs_INTERP3.xy, _GlobalMipBias.x).xwy;
    u_xlatb43 = 0.0<vs_INTERP2.w;
    u_xlat43 = (u_xlatb43) ? 1.0 : -1.0;
    u_xlatb44 = unity_WorldTransformParams.w>=0.0;
    u_xlat44 = (u_xlatb44) ? 1.0 : -1.0;
    u_xlat43 = u_xlat43 * u_xlat44;
    u_xlat4.xyz = vs_INTERP1.zxy * vs_INTERP2.yzx;
    u_xlat4.xyz = vs_INTERP1.yzx * vs_INTERP2.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat43) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.yyy * u_xlat4.xyz;
    u_xlat1.xyw = u_xlat1.xxx * vs_INTERP2.xyz + u_xlat4.xyz;
    u_xlat1.xyw = vec3(u_xlat42) * vs_INTERP1.xyz + u_xlat1.xyw;
    u_xlat42 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat1.xyw;
    u_xlatb42 = unity_OrthoParams.w==0.0;
    u_xlat1.xyw = (-vs_INTERP0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat44 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat1.xyw = u_xlat1.xyw * vec3(u_xlat44);
    u_xlat5.x = unity_MatrixV[0].z;
    u_xlat5.y = unity_MatrixV[1].z;
    u_xlat5.z = unity_MatrixV[2].z;
    u_xlat1.xyw = (bool(u_xlatb42)) ? u_xlat1.xyw : u_xlat5.xyz;
    u_xlat42 = vs_INTERP0.y * unity_MatrixV[1].z;
    u_xlat42 = unity_MatrixV[0].z * vs_INTERP0.x + u_xlat42;
    u_xlat42 = unity_MatrixV[2].z * vs_INTERP0.z + u_xlat42;
    u_xlat42 = u_xlat42 + unity_MatrixV[3].z;
    u_xlat42 = (-u_xlat42) + (-_ProjectionParams.y);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat42 = u_xlat42 * unity_FogParams.x;
    u_xlat4.w = 1.0;
    u_xlat5.x = dot(unity_SHAr, u_xlat4);
    u_xlat5.y = dot(unity_SHAg, u_xlat4);
    u_xlat5.z = dot(unity_SHAb, u_xlat4);
    u_xlat6 = u_xlat4.yzzx * u_xlat4.xyzz;
    u_xlat7.x = dot(unity_SHBr, u_xlat6);
    u_xlat7.y = dot(unity_SHBg, u_xlat6);
    u_xlat7.z = dot(unity_SHBb, u_xlat6);
    u_xlat44 = u_xlat4.y * u_xlat4.y;
    u_xlat44 = u_xlat4.x * u_xlat4.x + (-u_xlat44);
    u_xlat6.xyz = unity_SHC.xyz * vec3(u_xlat44) + u_xlat7.xyz;
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat6.xy = u_xlat6.xy * hlslcc_FragCoord.xy;
    u_xlat44 = u_xlat6.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat6.z = (-u_xlat44) + 1.0;
    u_xlat3.xy = u_xlat3.xy;
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat44 = (-u_xlat3.x) * 0.959999979 + 0.959999979;
    u_xlat45 = (-u_xlat44) + u_xlat3.y;
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat44);
    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = u_xlat3.xxx * u_xlat0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat44 = (-u_xlat3.y) + 1.0;
    u_xlat3.x = u_xlat44 * u_xlat44;
    u_xlat3.x = max(u_xlat3.x, 0.0078125);
    u_xlat17 = u_xlat3.x * u_xlat3.x;
    u_xlat45 = u_xlat45 + 1.0;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat46 = u_xlat3.x * 4.0 + 2.0;
    u_xlat47 = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat6.xz, _GlobalMipBias.x).x;
    u_xlat6.x = u_xlat47 + -1.0;
    u_xlat6.x = _AmbientOcclusionParam.w * u_xlat6.x + 1.0;
    u_xlat31 = min(u_xlat3.z, u_xlat47);
    vec3 txVec0 = vec3(vs_INTERP8.xy,vs_INTERP8.z);
    u_xlat47 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat20.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat47 = u_xlat47 * _MainLightShadowParams.x + u_xlat20.x;
    u_xlatb20.x = 0.0>=vs_INTERP8.z;
    u_xlatb34 = vs_INTERP8.z>=1.0;
    u_xlatb20.x = u_xlatb34 || u_xlatb20.x;
    u_xlat47 = (u_xlatb20.x) ? 1.0 : u_xlat47;
    u_xlat20.xyz = vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat20.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat20.x = u_xlat20.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
    u_xlat34 = (-u_xlat47) + 1.0;
    u_xlat47 = u_xlat20.x * u_xlat34 + u_xlat47;
    u_xlatb20.x = _MainLightCookieTextureFormat!=-1.0;
    if(u_xlatb20.x){
        u_xlat20.xy = vs_INTERP0.yy * _MainLightWorldToLight[1].xy;
        u_xlat20.xy = _MainLightWorldToLight[0].xy * vs_INTERP0.xx + u_xlat20.xy;
        u_xlat20.xy = _MainLightWorldToLight[2].xy * vs_INTERP0.zz + u_xlat20.xy;
        u_xlat20.xy = u_xlat20.xy + _MainLightWorldToLight[3].xy;
        u_xlat20.xy = u_xlat20.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat8 = texture(sampler2D(_MainLightCookieTexture, sampler_MainLightCookieTexture), u_xlat20.xy, _GlobalMipBias.x);
        u_xlatb20.xy = equal(vec4(vec4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat34 = (u_xlatb20.y) ? u_xlat8.w : u_xlat8.x;
        u_xlat20.xyz = (u_xlatb20.x) ? u_xlat8.xyz : vec3(u_xlat34);
    } else {
        u_xlat20.x = float(1.0);
        u_xlat20.y = float(1.0);
        u_xlat20.z = float(1.0);
    }
    u_xlat20.xyz = u_xlat20.xyz * _MainLightColor.xyz;
    u_xlat20.xyz = u_xlat6.xxx * u_xlat20.xyz;
    u_xlat49 = dot((-u_xlat1.xyw), u_xlat4.xyz);
    u_xlat49 = u_xlat49 + u_xlat49;
    u_xlat8.xyz = u_xlat4.xyz * (-vec3(u_xlat49)) + (-u_xlat1.xyw);
    u_xlat49 = dot(u_xlat4.xyz, u_xlat1.xyw);
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat50 = (-u_xlat44) * 0.699999988 + 1.70000005;
    u_xlat2.w = u_xlat44 * u_xlat50;
    u_xlat2 = u_xlat2 * vec4(14.0, 14.0, 14.0, 6.0);
    u_xlat8 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat8.xyz, u_xlat2.w);
    u_xlat44 = u_xlat8.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat44 + 1.0;
    u_xlat44 = max(u_xlat44, 0.0);
    u_xlat44 = log2(u_xlat44);
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.y;
    u_xlat44 = exp2(u_xlat44);
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat44);
    u_xlat9.xy = u_xlat3.xx * u_xlat3.xx + vec2(-1.0, 1.0);
    u_xlat44 = float(1.0) / u_xlat9.y;
    u_xlat23.xyz = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat23.xyz = vec3(u_xlat49) * u_xlat23.xyz + u_xlat0.xyz;
    u_xlat23.xyz = vec3(u_xlat44) * u_xlat23.xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat23.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz + u_xlat8.xyz;
    u_xlat44 = u_xlat47 * unity_LightData.z;
    u_xlat3.x = dot(u_xlat4.xyz, _MainLightPosition.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat44 = u_xlat44 * u_xlat3.x;
    u_xlat20.xyz = vec3(u_xlat44) * u_xlat20.xyz;
    u_xlat8.xyz = u_xlat1.xyw + _MainLightPosition.xyz;
    u_xlat44 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat44 = max(u_xlat44, 1.17549435e-37);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat8.xyz = vec3(u_xlat44) * u_xlat8.xyz;
    u_xlat44 = dot(u_xlat4.xyz, u_xlat8.xyz);
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
    u_xlat3.x = dot(_MainLightPosition.xyz, u_xlat8.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat44 * u_xlat9.x + 1.00001001;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat3.x = max(u_xlat3.x, 0.100000001);
    u_xlat44 = u_xlat44 * u_xlat3.x;
    u_xlat44 = u_xlat46 * u_xlat44;
    u_xlat44 = u_xlat17 / u_xlat44;
    u_xlat8.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat7.xyz;
    u_xlat20.xyz = u_xlat20.xyz * u_xlat8.xyz;
    u_xlat44 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu44 =  uint(int(u_xlat44));
    u_xlatb3.xw = equal(vec4(vec4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), vec4(0.0, 0.0, 0.0, 1.0)).xw;
    u_xlat8.x = float(0.0);
    u_xlat8.y = float(0.0);
    u_xlat8.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu44 ; u_xlatu_loop_1++)
    {
        u_xlatu49 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati50 = int(u_xlatu_loop_1 & 3u);
        u_xlat49 = dot(unity_LightIndices[int(u_xlatu49)], uintBitsToFloat(ImmCB_0[u_xlati50]));
        u_xlatu49 =  uint(int(u_xlat49));
        u_xlat23.xyz = (-vs_INTERP0.xyz) * _AdditionalLightsPosition[int(u_xlatu49)].www + _AdditionalLightsPosition[int(u_xlatu49)].xyz;
        u_xlat50 = dot(u_xlat23.xyz, u_xlat23.xyz);
        u_xlat50 = max(u_xlat50, 6.10351562e-05);
        u_xlat10 = inversesqrt(u_xlat50);
        u_xlat24.xyz = u_xlat23.xyz * vec3(u_xlat10);
        u_xlat11.x = float(1.0) / float(u_xlat50);
        u_xlat50 = u_xlat50 * _AdditionalLightsAttenuation[int(u_xlatu49)].x;
        u_xlat50 = (-u_xlat50) * u_xlat50 + 1.0;
        u_xlat50 = max(u_xlat50, 0.0);
        u_xlat50 = u_xlat50 * u_xlat50;
        u_xlat50 = u_xlat50 * u_xlat11.x;
        u_xlat11.x = dot(_AdditionalLightsSpotDir[int(u_xlatu49)].xyz, u_xlat24.xyz);
        u_xlat11.x = u_xlat11.x * _AdditionalLightsAttenuation[int(u_xlatu49)].z + _AdditionalLightsAttenuation[int(u_xlatu49)].w;
        u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
        u_xlat11.x = u_xlat11.x * u_xlat11.x;
        u_xlat50 = u_xlat50 * u_xlat11.x;
        u_xlatu11 = u_xlatu49 >> (5u & uint(0x1F));
        u_xlati25 = 1 << (int(u_xlatu49) & int(0x1F));
        u_xlati11 = int(uint(u_xlati25) & floatBitsToUint(_AdditionalLightsCookieEnableBits[int(u_xlatu11)]));
        if(u_xlati11 != 0) {
            u_xlati11 = int(_AdditionalLightsLightTypes[int(u_xlatu49)]);
            u_xlati25 = (u_xlati11 != 0) ? 0 : 1;
            u_xlati39 = int(u_xlatu49) << (2 & int(0x1F));
            if(u_xlati25 != 0) {
                u_xlat12.xyz = vs_INTERP0.yyy * _AdditionalLightsWorldToLights[(u_xlati39 + 1) / 4][(u_xlati39 + 1) % 4].xyw;
                u_xlat12.xyz = _AdditionalLightsWorldToLights[u_xlati39 / 4][u_xlati39 % 4].xyw * vs_INTERP0.xxx + u_xlat12.xyz;
                u_xlat12.xyz = _AdditionalLightsWorldToLights[(u_xlati39 + 2) / 4][(u_xlati39 + 2) % 4].xyw * vs_INTERP0.zzz + u_xlat12.xyz;
                u_xlat12.xyz = u_xlat12.xyz + _AdditionalLightsWorldToLights[(u_xlati39 + 3) / 4][(u_xlati39 + 3) % 4].xyw;
                u_xlat25.xz = u_xlat12.xy / u_xlat12.zz;
                u_xlat25.xz = u_xlat25.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                u_xlat25.xz = clamp(u_xlat25.xz, 0.0, 1.0);
                u_xlat25.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].xy * u_xlat25.xz + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].zw;
            } else {
                u_xlatb11 = u_xlati11==1;
                u_xlati11 = u_xlatb11 ? 1 : int(0);
                if(u_xlati11 != 0) {
                    u_xlat12.xy = vs_INTERP0.yy * _AdditionalLightsWorldToLights[(u_xlati39 + 1) / 4][(u_xlati39 + 1) % 4].xy;
                    u_xlat12.xy = _AdditionalLightsWorldToLights[u_xlati39 / 4][u_xlati39 % 4].xy * vs_INTERP0.xx + u_xlat12.xy;
                    u_xlat12.xy = _AdditionalLightsWorldToLights[(u_xlati39 + 2) / 4][(u_xlati39 + 2) % 4].xy * vs_INTERP0.zz + u_xlat12.xy;
                    u_xlat12.xy = u_xlat12.xy + _AdditionalLightsWorldToLights[(u_xlati39 + 3) / 4][(u_xlati39 + 3) % 4].xy;
                    u_xlat12.xy = u_xlat12.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat12.xy = fract(u_xlat12.xy);
                    u_xlat25.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].xy * u_xlat12.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].zw;
                } else {
                    u_xlat12 = vs_INTERP0.yyyy * _AdditionalLightsWorldToLights[(u_xlati39 + 1) / 4][(u_xlati39 + 1) % 4];
                    u_xlat12 = _AdditionalLightsWorldToLights[u_xlati39 / 4][u_xlati39 % 4] * vs_INTERP0.xxxx + u_xlat12;
                    u_xlat12 = _AdditionalLightsWorldToLights[(u_xlati39 + 2) / 4][(u_xlati39 + 2) % 4] * vs_INTERP0.zzzz + u_xlat12;
                    u_xlat12 = u_xlat12 + _AdditionalLightsWorldToLights[(u_xlati39 + 3) / 4][(u_xlati39 + 3) % 4];
                    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
                    u_xlat11.x = dot(u_xlat12.xyz, u_xlat12.xyz);
                    u_xlat11.x = inversesqrt(u_xlat11.x);
                    u_xlat12.xyz = u_xlat11.xxx * u_xlat12.xyz;
                    u_xlat11.x = dot(abs(u_xlat12.xyz), vec3(1.0, 1.0, 1.0));
                    u_xlat11.x = max(u_xlat11.x, 9.99999997e-07);
                    u_xlat11.x = float(1.0) / float(u_xlat11.x);
                    u_xlat13.xyz = u_xlat11.xxx * u_xlat12.zxy;
                    u_xlat13.x = (-u_xlat13.x);
                    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
                    u_xlatb40.xy = greaterThanEqual(u_xlat13.yzyz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
                    u_xlat40.x = (u_xlatb40.x) ? u_xlat13.x : (-u_xlat13.x);
                    u_xlat40.y = (u_xlatb40.y) ? u_xlat13.x : (-u_xlat13.x);
                    u_xlat11.xz = u_xlat12.xy * u_xlat11.xx + u_xlat40.xy;
                    u_xlat11.xz = u_xlat11.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat11.xz = clamp(u_xlat11.xz, 0.0, 1.0);
                    u_xlat25.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].xy * u_xlat11.xz + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].zw;
                }
            }
            u_xlat11 = texture(sampler2D(_AdditionalLightsCookieAtlasTexture, sampler_AdditionalLightsCookieAtlasTexture), u_xlat25.xz, _GlobalMipBias.x);
            u_xlat53 = (u_xlatb3.w) ? u_xlat11.w : u_xlat11.x;
            u_xlat11.xyz = (u_xlatb3.x) ? u_xlat11.xyz : vec3(u_xlat53);
        } else {
            u_xlat11.x = float(1.0);
            u_xlat11.y = float(1.0);
            u_xlat11.z = float(1.0);
        }
        u_xlat11.xyz = u_xlat11.xyz * _AdditionalLightsColor[int(u_xlatu49)].xyz;
        u_xlat11.xyz = u_xlat6.xxx * u_xlat11.xyz;
        u_xlat49 = dot(u_xlat4.xyz, u_xlat24.xyz);
        u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
        u_xlat49 = u_xlat49 * u_xlat50;
        u_xlat11.xyz = vec3(u_xlat49) * u_xlat11.xyz;
        u_xlat23.xyz = u_xlat23.xyz * vec3(u_xlat10) + u_xlat1.xyw;
        u_xlat49 = dot(u_xlat23.xyz, u_xlat23.xyz);
        u_xlat49 = max(u_xlat49, 1.17549435e-37);
        u_xlat49 = inversesqrt(u_xlat49);
        u_xlat23.xyz = vec3(u_xlat49) * u_xlat23.xyz;
        u_xlat49 = dot(u_xlat4.xyz, u_xlat23.xyz);
        u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
        u_xlat50 = dot(u_xlat24.xyz, u_xlat23.xyz);
        u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
        u_xlat49 = u_xlat49 * u_xlat49;
        u_xlat49 = u_xlat49 * u_xlat9.x + 1.00001001;
        u_xlat50 = u_xlat50 * u_xlat50;
        u_xlat49 = u_xlat49 * u_xlat49;
        u_xlat50 = max(u_xlat50, 0.100000001);
        u_xlat49 = u_xlat49 * u_xlat50;
        u_xlat49 = u_xlat46 * u_xlat49;
        u_xlat49 = u_xlat17 / u_xlat49;
        u_xlat23.xyz = u_xlat0.xyz * vec3(u_xlat49) + u_xlat7.xyz;
        u_xlat8.xyz = u_xlat23.xyz * u_xlat11.xyz + u_xlat8.xyz;
    }
    u_xlat0.xyz = u_xlat5.xyz * vec3(u_xlat31) + u_xlat20.xyz;
    u_xlat0.xyz = u_xlat8.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat29) + u_xlat0.xyz;
    u_xlat42 = u_xlat42 * (-u_xlat42);
    u_xlat42 = exp2(u_xlat42);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(u_xlat42) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

