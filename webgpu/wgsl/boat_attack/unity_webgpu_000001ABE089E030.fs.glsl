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
	vec4 unity_OrthoParams;
	vec4 _ScaleBiasRt;
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
layout(set = 0, binding = 1) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 2) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _MainLightCookieTexture;
layout(set = 0, binding = 5) uniform mediump texture2D _AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 6) uniform mediump texture2D Texture2D_52571568;
layout(set = 0, binding = 7) uniform mediump texture2D Texture2D_F0A81025;
layout(set = 0, binding = 8) uniform mediump texture2D Texture2D_8BA53EED;
layout(set = 0, binding = 9) uniform mediump texture2D Texture2D_AB84E4D0;
layout(location = 0) in highp vec3 vs_INTERP0;
layout(location = 1) in highp vec3 vs_INTERP1;
layout(location = 2) in highp vec4 vs_INTERP2;
layout(location = 3) in highp vec4 vs_INTERP3;
layout(location = 4) in highp vec2 vs_INTERP4;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 10) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 11) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 12) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 13) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 14) uniform mediump  sampler sampler_MainLightCookieTexture;
layout(set = 0, binding = 15) uniform mediump  sampler sampler_AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 16) uniform mediump  sampler samplerTexture2D_52571568;
layout(set = 0, binding = 17) uniform mediump  sampler samplerTexture2D_F0A81025;
layout(set = 0, binding = 18) uniform mediump  sampler samplerTexture2D_8BA53EED;
layout(set = 0, binding = 19) uniform mediump  sampler samplerTexture2D_AB84E4D0;
void main()
{
vec3 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
uint u_xlatu3;
bool u_xlatb3;
vec4 u_xlat4;
bvec4 u_xlatb4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
vec2 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
float u_xlat18;
vec3 u_xlat19;
bvec2 u_xlatb19;
vec3 u_xlat24;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
float u_xlat34;
bool u_xlatb34;
vec2 u_xlat37;
int u_xlati37;
uint u_xlatu37;
bool u_xlatb37;
vec2 u_xlat42;
bvec2 u_xlatb42;
float u_xlat45;
int u_xlati45;
uint u_xlatu45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
uint u_xlatu47;
bool u_xlatb47;
float u_xlat48;
float u_xlat49;
int u_xlati49;
float u_xlat50;
float u_xlat51;
float u_xlat52;
int u_xlati52;
int u_xlati53;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xyz = texture(sampler2D(Texture2D_52571568, samplerTexture2D_52571568), vs_INTERP3.xy, _GlobalMipBias.x).xyz;
    u_xlat1.xyz = texture(sampler2D(Texture2D_8BA53EED, samplerTexture2D_8BA53EED), vs_INTERP3.xy, _GlobalMipBias.x).xyw;
    u_xlat1.x = u_xlat1.x * u_xlat1.z;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat45 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = max(u_xlat45, 1.00000002e-16);
    u_xlat2.xyz = texture(sampler2D(Texture2D_AB84E4D0, samplerTexture2D_AB84E4D0), vs_INTERP3.xy, _GlobalMipBias.x).xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(14.0, 14.0, 14.0);
    u_xlat31 = dot(unity_ObjectToWorld[3].xyz, unity_ObjectToWorld[3].xyz);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = fract(u_xlat31);
    u_xlat31 = u_xlat31 + _NightFade;
    u_xlatb31 = u_xlat31>=1.0;
    u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat3.xyz = texture(sampler2D(Texture2D_F0A81025, samplerTexture2D_F0A81025), vs_INTERP3.xy, _GlobalMipBias.x).xwy;
    u_xlatb46 = 0.0<vs_INTERP2.w;
    u_xlat46 = (u_xlatb46) ? 1.0 : -1.0;
    u_xlatb47 = unity_WorldTransformParams.w>=0.0;
    u_xlat47 = (u_xlatb47) ? 1.0 : -1.0;
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat4.xyz = vs_INTERP1.zxy * vs_INTERP2.yzx;
    u_xlat4.xyz = vs_INTERP1.yzx * vs_INTERP2.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat46) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.yyy * u_xlat4.xyz;
    u_xlat1.xyw = u_xlat1.xxx * vs_INTERP2.xyz + u_xlat4.xyz;
    u_xlat1.xyw = vec3(u_xlat45) * vs_INTERP1.xyz + u_xlat1.xyw;
    u_xlat45 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat1.xyw = vec3(u_xlat45) * u_xlat1.xyw;
    u_xlatb45 = unity_OrthoParams.w==0.0;
    u_xlat4.xyz = (-vs_INTERP0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat47 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat47 = inversesqrt(u_xlat47);
    u_xlat4.xyz = vec3(u_xlat47) * u_xlat4.xyz;
    u_xlat5.x = (u_xlatb45) ? u_xlat4.x : unity_MatrixV[0].z;
    u_xlat5.y = (u_xlatb45) ? u_xlat4.y : unity_MatrixV[1].z;
    u_xlat5.z = (u_xlatb45) ? u_xlat4.z : unity_MatrixV[2].z;
    u_xlat4.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat6.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat7.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat8.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.y = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.z = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.w = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb4 = lessThan(u_xlat4, _CascadeShadowSplitSphereRadii);
    u_xlat6.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat6.z = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat6.w = u_xlatb4.w ? float(1.0) : 0.0;
;
    u_xlat4.x = (u_xlatb4.x) ? float(-1.0) : float(-0.0);
    u_xlat4.y = (u_xlatb4.y) ? float(-1.0) : float(-0.0);
    u_xlat4.z = (u_xlatb4.z) ? float(-1.0) : float(-0.0);
    u_xlat4.xyz = u_xlat4.xyz + u_xlat6.yzw;
    u_xlat6.yzw = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat45 = dot(u_xlat6, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat45 = (-u_xlat45) + 4.0;
    u_xlatu45 = uint(u_xlat45);
    u_xlati45 = int(u_xlatu45) << (2 & int(0x1F));
    u_xlat4.xyz = vs_INTERP0.yyy * _MainLightWorldToShadow[(u_xlati45 + 1) / 4][(u_xlati45 + 1) % 4].xyz;
    u_xlat4.xyz = _MainLightWorldToShadow[u_xlati45 / 4][u_xlati45 % 4].xyz * vs_INTERP0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = _MainLightWorldToShadow[(u_xlati45 + 2) / 4][(u_xlati45 + 2) % 4].xyz * vs_INTERP0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + _MainLightWorldToShadow[(u_xlati45 + 3) / 4][(u_xlati45 + 3) % 4].xyz;
    u_xlat6.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_INTERP4.xy, _GlobalMipBias.x).xyz;
    u_xlat7.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat7.xy = u_xlat7.xy * hlslcc_FragCoord.xy;
    u_xlat45 = u_xlat7.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat7.z = (-u_xlat45) + 1.0;
    u_xlat3.xy = u_xlat3.xy;
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat45 = (-u_xlat3.x) * 0.959999979 + 0.959999979;
    u_xlat47 = (-u_xlat45) + u_xlat3.y;
    u_xlat8.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = u_xlat3.xxx * u_xlat0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat45 = (-u_xlat3.y) + 1.0;
    u_xlat3.x = u_xlat45 * u_xlat45;
    u_xlat3.x = max(u_xlat3.x, 0.0078125);
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat47 = u_xlat47 + 1.0;
    u_xlat47 = min(u_xlat47, 1.0);
    u_xlat48 = u_xlat3.x * 4.0 + 2.0;
    u_xlat49 = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat7.xz, _GlobalMipBias.x).x;
    u_xlat50 = u_xlat49 + -1.0;
    u_xlat50 = _AmbientOcclusionParam.w * u_xlat50 + 1.0;
    u_xlat33 = min(u_xlat3.z, u_xlat49);
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat19.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat4.x = u_xlat4.x * _MainLightShadowParams.x + u_xlat19.x;
    u_xlatb19.x = 0.0>=u_xlat4.z;
    u_xlatb34 = u_xlat4.z>=1.0;
    u_xlatb19.x = u_xlatb34 || u_xlatb19.x;
    u_xlat4.x = (u_xlatb19.x) ? 1.0 : u_xlat4.x;
    u_xlat19.xyz = vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat19.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat19.x = u_xlat19.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
    u_xlat34 = (-u_xlat4.x) + 1.0;
    u_xlat4.x = u_xlat19.x * u_xlat34 + u_xlat4.x;
    u_xlatb19.x = _MainLightCookieTextureFormat!=-1.0;
    if(u_xlatb19.x){
        u_xlat19.xy = vs_INTERP0.yy * _MainLightWorldToLight[1].xy;
        u_xlat19.xy = _MainLightWorldToLight[0].xy * vs_INTERP0.xx + u_xlat19.xy;
        u_xlat19.xy = _MainLightWorldToLight[2].xy * vs_INTERP0.zz + u_xlat19.xy;
        u_xlat19.xy = u_xlat19.xy + _MainLightWorldToLight[3].xy;
        u_xlat19.xy = u_xlat19.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat7 = texture(sampler2D(_MainLightCookieTexture, sampler_MainLightCookieTexture), u_xlat19.xy, _GlobalMipBias.x);
        u_xlatb19.xy = equal(vec4(vec4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat34 = (u_xlatb19.y) ? u_xlat7.w : u_xlat7.x;
        u_xlat19.xyz = (u_xlatb19.x) ? u_xlat7.xyz : vec3(u_xlat34);
    } else {
        u_xlat19.x = float(1.0);
        u_xlat19.y = float(1.0);
        u_xlat19.z = float(1.0);
    }
    u_xlat19.xyz = u_xlat19.xyz * _MainLightColor.xyz;
    u_xlat19.xyz = vec3(u_xlat50) * u_xlat19.xyz;
    u_xlat51 = dot((-u_xlat5.xyz), u_xlat1.xyw);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat7.xyz = u_xlat1.xyw * (-vec3(u_xlat51)) + (-u_xlat5.xyz);
    u_xlat51 = dot(u_xlat1.xyw, u_xlat5.xyz);
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat52 = (-u_xlat45) * 0.699999988 + 1.70000005;
    u_xlat45 = u_xlat45 * u_xlat52;
    u_xlat45 = u_xlat45 * 6.0;
    u_xlat7 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat7.xyz, u_xlat45);
    u_xlat45 = u_xlat7.w + -1.0;
    u_xlat45 = unity_SpecCube0_HDR.w * u_xlat45 + 1.0;
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat45 = log2(u_xlat45);
    u_xlat45 = u_xlat45 * unity_SpecCube0_HDR.y;
    u_xlat45 = exp2(u_xlat45);
    u_xlat45 = u_xlat45 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat45);
    u_xlat9.xy = u_xlat3.xx * u_xlat3.xx + vec2(-1.0, 1.0);
    u_xlat45 = float(1.0) / u_xlat9.y;
    u_xlat24.xyz = (-u_xlat0.xyz) + vec3(u_xlat47);
    u_xlat24.xyz = vec3(u_xlat51) * u_xlat24.xyz + u_xlat0.xyz;
    u_xlat24.xyz = vec3(u_xlat45) * u_xlat24.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat24.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat45 = u_xlat4.x * unity_LightData.z;
    u_xlat47 = dot(u_xlat1.xyw, _MainLightPosition.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat45 = u_xlat45 * u_xlat47;
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat19.xyz;
    u_xlat7.xyz = u_xlat5.xyz + _MainLightPosition.xyz;
    u_xlat45 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat45 = max(u_xlat45, 1.17549435e-37);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat7.xyz = vec3(u_xlat45) * u_xlat7.xyz;
    u_xlat45 = dot(u_xlat1.xyw, u_xlat7.xyz);
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat47 = dot(_MainLightPosition.xyz, u_xlat7.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat9.x + 1.00001001;
    u_xlat47 = u_xlat47 * u_xlat47;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat47 = max(u_xlat47, 0.100000001);
    u_xlat45 = u_xlat45 * u_xlat47;
    u_xlat45 = u_xlat48 * u_xlat45;
    u_xlat45 = u_xlat18 / u_xlat45;
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat45) + u_xlat8.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat45 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu45 =  uint(int(u_xlat45));
    u_xlatb7.xy = equal(vec4(vec4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat24.x = float(0.0);
    u_xlat24.y = float(0.0);
    u_xlat24.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu45 ; u_xlatu_loop_1++)
    {
        u_xlatu3 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati49 = int(u_xlatu_loop_1 & 3u);
        u_xlat3.x = dot(unity_LightIndices[int(u_xlatu3)], uintBitsToFloat(ImmCB_0[u_xlati49]));
        u_xlatu3 =  uint(int(u_xlat3.x));
        u_xlat10.xyz = (-vs_INTERP0.xyz) * _AdditionalLightsPosition[int(u_xlatu3)].www + _AdditionalLightsPosition[int(u_xlatu3)].xyz;
        u_xlat49 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat49 = max(u_xlat49, 6.10351562e-05);
        u_xlat51 = inversesqrt(u_xlat49);
        u_xlat11.xyz = vec3(u_xlat51) * u_xlat10.xyz;
        u_xlat37.x = float(1.0) / float(u_xlat49);
        u_xlat49 = u_xlat49 * _AdditionalLightsAttenuation[int(u_xlatu3)].x;
        u_xlat49 = (-u_xlat49) * u_xlat49 + 1.0;
        u_xlat49 = max(u_xlat49, 0.0);
        u_xlat49 = u_xlat49 * u_xlat49;
        u_xlat49 = u_xlat49 * u_xlat37.x;
        u_xlat37.x = dot(_AdditionalLightsSpotDir[int(u_xlatu3)].xyz, u_xlat11.xyz);
        u_xlat37.x = u_xlat37.x * _AdditionalLightsAttenuation[int(u_xlatu3)].z + _AdditionalLightsAttenuation[int(u_xlatu3)].w;
        u_xlat37.x = clamp(u_xlat37.x, 0.0, 1.0);
        u_xlat37.x = u_xlat37.x * u_xlat37.x;
        u_xlat49 = u_xlat49 * u_xlat37.x;
        u_xlatu37 = u_xlatu3 >> (5u & uint(0x1F));
        u_xlati52 = 1 << (int(u_xlatu3) & int(0x1F));
        u_xlati37 = int(uint(u_xlati52) & floatBitsToUint(_AdditionalLightsCookieEnableBits[int(u_xlatu37)]));
        if(u_xlati37 != 0) {
            u_xlati37 = int(_AdditionalLightsLightTypes[int(u_xlatu3)]);
            u_xlati52 = (u_xlati37 != 0) ? 0 : 1;
            u_xlati53 = int(u_xlatu3) << (2 & int(0x1F));
            if(u_xlati52 != 0) {
                u_xlat12.xyz = vs_INTERP0.yyy * _AdditionalLightsWorldToLights[(u_xlati53 + 1) / 4][(u_xlati53 + 1) % 4].xyw;
                u_xlat12.xyz = _AdditionalLightsWorldToLights[u_xlati53 / 4][u_xlati53 % 4].xyw * vs_INTERP0.xxx + u_xlat12.xyz;
                u_xlat12.xyz = _AdditionalLightsWorldToLights[(u_xlati53 + 2) / 4][(u_xlati53 + 2) % 4].xyw * vs_INTERP0.zzz + u_xlat12.xyz;
                u_xlat12.xyz = u_xlat12.xyz + _AdditionalLightsWorldToLights[(u_xlati53 + 3) / 4][(u_xlati53 + 3) % 4].xyw;
                u_xlat12.xy = u_xlat12.xy / u_xlat12.zz;
                u_xlat12.xy = u_xlat12.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                u_xlat12.xy = clamp(u_xlat12.xy, 0.0, 1.0);
                u_xlat12.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu3)].xy * u_xlat12.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu3)].zw;
            } else {
                u_xlatb37 = u_xlati37==1;
                u_xlati37 = u_xlatb37 ? 1 : int(0);
                if(u_xlati37 != 0) {
                    u_xlat37.xy = vs_INTERP0.yy * _AdditionalLightsWorldToLights[(u_xlati53 + 1) / 4][(u_xlati53 + 1) % 4].xy;
                    u_xlat37.xy = _AdditionalLightsWorldToLights[u_xlati53 / 4][u_xlati53 % 4].xy * vs_INTERP0.xx + u_xlat37.xy;
                    u_xlat37.xy = _AdditionalLightsWorldToLights[(u_xlati53 + 2) / 4][(u_xlati53 + 2) % 4].xy * vs_INTERP0.zz + u_xlat37.xy;
                    u_xlat37.xy = u_xlat37.xy + _AdditionalLightsWorldToLights[(u_xlati53 + 3) / 4][(u_xlati53 + 3) % 4].xy;
                    u_xlat37.xy = u_xlat37.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat37.xy = fract(u_xlat37.xy);
                    u_xlat12.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu3)].xy * u_xlat37.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu3)].zw;
                } else {
                    u_xlat13 = vs_INTERP0.yyyy * _AdditionalLightsWorldToLights[(u_xlati53 + 1) / 4][(u_xlati53 + 1) % 4];
                    u_xlat13 = _AdditionalLightsWorldToLights[u_xlati53 / 4][u_xlati53 % 4] * vs_INTERP0.xxxx + u_xlat13;
                    u_xlat13 = _AdditionalLightsWorldToLights[(u_xlati53 + 2) / 4][(u_xlati53 + 2) % 4] * vs_INTERP0.zzzz + u_xlat13;
                    u_xlat13 = u_xlat13 + _AdditionalLightsWorldToLights[(u_xlati53 + 3) / 4][(u_xlati53 + 3) % 4];
                    u_xlat13.xyz = u_xlat13.xyz / u_xlat13.www;
                    u_xlat37.x = dot(u_xlat13.xyz, u_xlat13.xyz);
                    u_xlat37.x = inversesqrt(u_xlat37.x);
                    u_xlat13.xyz = u_xlat37.xxx * u_xlat13.xyz;
                    u_xlat37.x = dot(abs(u_xlat13.xyz), vec3(1.0, 1.0, 1.0));
                    u_xlat37.x = max(u_xlat37.x, 9.99999997e-07);
                    u_xlat37.x = float(1.0) / float(u_xlat37.x);
                    u_xlat14.xyz = u_xlat37.xxx * u_xlat13.zxy;
                    u_xlat14.x = (-u_xlat14.x);
                    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
                    u_xlatb42.xy = greaterThanEqual(u_xlat14.yzyz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
                    u_xlat42.x = (u_xlatb42.x) ? u_xlat14.x : (-u_xlat14.x);
                    u_xlat42.y = (u_xlatb42.y) ? u_xlat14.x : (-u_xlat14.x);
                    u_xlat37.xy = u_xlat13.xy * u_xlat37.xx + u_xlat42.xy;
                    u_xlat37.xy = u_xlat37.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat37.xy = clamp(u_xlat37.xy, 0.0, 1.0);
                    u_xlat12.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu3)].xy * u_xlat37.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu3)].zw;
                }
            }
            u_xlat12 = texture(sampler2D(_AdditionalLightsCookieAtlasTexture, sampler_AdditionalLightsCookieAtlasTexture), u_xlat12.xy, _GlobalMipBias.x);
            u_xlat37.x = (u_xlatb7.y) ? u_xlat12.w : u_xlat12.x;
            u_xlat12.xyz = (u_xlatb7.x) ? u_xlat12.xyz : u_xlat37.xxx;
        } else {
            u_xlat12.x = float(1.0);
            u_xlat12.y = float(1.0);
            u_xlat12.z = float(1.0);
        }
        u_xlat12.xyz = u_xlat12.xyz * _AdditionalLightsColor[int(u_xlatu3)].xyz;
        u_xlat12.xyz = vec3(u_xlat50) * u_xlat12.xyz;
        u_xlat3.x = dot(u_xlat1.xyw, u_xlat11.xyz);
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.x = u_xlat3.x * u_xlat49;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat12.xyz;
        u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat51) + u_xlat5.xyz;
        u_xlat3.x = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat3.x = max(u_xlat3.x, 1.17549435e-37);
        u_xlat3.x = inversesqrt(u_xlat3.x);
        u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xyz;
        u_xlat3.x = dot(u_xlat1.xyw, u_xlat10.xyz);
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat49 = dot(u_xlat11.xyz, u_xlat10.xyz);
        u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
        u_xlat3.x = u_xlat3.x * u_xlat3.x;
        u_xlat3.x = u_xlat3.x * u_xlat9.x + 1.00001001;
        u_xlat49 = u_xlat49 * u_xlat49;
        u_xlat3.x = u_xlat3.x * u_xlat3.x;
        u_xlat49 = max(u_xlat49, 0.100000001);
        u_xlat3.x = u_xlat3.x * u_xlat49;
        u_xlat3.x = u_xlat48 * u_xlat3.x;
        u_xlat3.x = u_xlat18 / u_xlat3.x;
        u_xlat10.xyz = u_xlat0.xyz * u_xlat3.xxx + u_xlat8.xyz;
        u_xlat24.xyz = u_xlat10.xyz * u_xlat12.xyz + u_xlat24.xyz;
    }
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat33) + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat24.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat31) + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

