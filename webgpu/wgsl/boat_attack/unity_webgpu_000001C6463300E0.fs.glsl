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
layout(set = 1, binding = 3, std140) uniform UnityPerMaterial {
	vec4 _BaseMap_ST;
	vec4 _DetailAlbedoMap_ST;
	vec4 _BaseColor;
	vec4 _SpecColor;
	vec4 _EmissionColor;
	float _Cutoff;
	float _Smoothness;
	float _Metallic;
	float _BumpScale;
	float _Parallax;
	float _OcclusionStrength;
	float _ClearCoatMask;
	float _ClearCoatSmoothness;
	float _DetailAlbedoMapScale;
	float _DetailNormalMapScale;
	float _Surface;
};
layout(set = 1, binding = 4, std140) uniform MainLightShadows {
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
layout(set = 1, binding = 5, std140) uniform LightCookies {
	mat4x4 _MainLightWorldToLight;
	float _AdditionalLightsCookieEnableBits[8];
	float _MainLightCookieTextureFormat;
	float _AdditionalLightsCookieAtlasTextureFormat;
};
layout(set = 1, binding = 6, std140) uniform AdditionalLightsCookies {
	mat4x4 _AdditionalLightsWorldToLights[256];
	vec4 _AdditionalLightsCookieAtlasUVRects[256];
	float _AdditionalLightsLightTypes[256];
};
layout(set = 0, binding = 0) uniform mediump textureCube unity_SpecCube0;
layout(set = 0, binding = 1) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 2) uniform mediump texture2D unity_LightmapInd;
layout(set = 0, binding = 3) uniform mediump texture2D _BaseMap;
layout(set = 0, binding = 4) uniform mediump texture2D _BumpMap;
layout(set = 0, binding = 5) uniform mediump texture2D _OcclusionMap;
layout(set = 0, binding = 6) uniform mediump texture2D _MetallicGlossMap;
layout(set = 0, binding = 7) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 8) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 9) uniform mediump texture2D _MainLightCookieTexture;
layout(set = 0, binding = 10) uniform mediump texture2D _AdditionalLightsCookieAtlasTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD1;
layout(location = 2) in highp vec3 vs_TEXCOORD2;
layout(location = 3) in highp vec4 vs_TEXCOORD3;
layout(location = 4) in highp vec4 vs_TEXCOORD6;
layout(location = 5) in highp vec2 vs_TEXCOORD8;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 11) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 12) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_BaseMap;
layout(set = 0, binding = 14) uniform mediump  sampler sampler_BumpMap;
layout(set = 0, binding = 15) uniform mediump  sampler sampler_OcclusionMap;
layout(set = 0, binding = 16) uniform mediump  sampler sampler_MetallicGlossMap;
layout(set = 0, binding = 17) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 18) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 19) uniform mediump  sampler sampler_MainLightCookieTexture;
layout(set = 0, binding = 20) uniform mediump  sampler sampler_AdditionalLightsCookieAtlasTexture;
void main()
{
vec4 u_xlat0;
bool u_xlatb0;
vec2 u_xlat1;
bvec3 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
vec4 u_xlat10;
int u_xlati10;
uint u_xlatu10;
bool u_xlatb10;
vec4 u_xlat11;
vec3 u_xlat12;
float u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat19;
bool u_xlatb19;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
int u_xlati23;
vec2 u_xlat27;
float u_xlat29;
int u_xlati36;
vec2 u_xlat37;
bvec2 u_xlatb37;
float u_xlat39;
uint u_xlatu39;
float u_xlat40;
float u_xlat43;
uint u_xlatu43;
float u_xlat44;
float u_xlat45;
uint u_xlatu45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
float u_xlat49;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_BaseMap, sampler_BaseMap), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat1.xy = texture(sampler2D(_MetallicGlossMap, sampler_MetallicGlossMap), vs_TEXCOORD0.xy, _GlobalMipBias.x).xw;
    u_xlat2 = u_xlat0.wxyz * _BaseColor.wxyz;
    u_xlat3.xyz = texture(sampler2D(_BumpMap, sampler_BumpMap), vs_TEXCOORD0.xy, _GlobalMipBias.x).xyw;
    u_xlat3.x = u_xlat3.x * u_xlat3.z;
    u_xlat27.xy = u_xlat3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat39 = dot(u_xlat27.xy, u_xlat27.xy);
    u_xlat39 = min(u_xlat39, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = max(u_xlat39, 1.00000002e-16);
    u_xlat27.xy = u_xlat27.xy * vec2(vec2(_BumpScale, _BumpScale));
    u_xlat3.x = texture(sampler2D(_OcclusionMap, sampler_OcclusionMap), vs_TEXCOORD0.xy, _GlobalMipBias.x).y;
    u_xlat16.x = (-_OcclusionStrength) + 1.0;
    u_xlat3.x = u_xlat3.x * _OcclusionStrength + u_xlat16.x;
    u_xlatb16 = unity_OrthoParams.w==0.0;
    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat4.xyz = vec3(u_xlat29) * u_xlat4.xyz;
    u_xlat5.x = (u_xlatb16) ? u_xlat4.x : unity_MatrixV[0].z;
    u_xlat5.y = (u_xlatb16) ? u_xlat4.y : unity_MatrixV[1].z;
    u_xlat5.z = (u_xlatb16) ? u_xlat4.z : unity_MatrixV[2].z;
    u_xlat16.xyz = vs_TEXCOORD2.zxy * vs_TEXCOORD3.yzx;
    u_xlat16.xyz = vs_TEXCOORD2.yzx * vs_TEXCOORD3.zxy + (-u_xlat16.xyz);
    u_xlat16.xyz = u_xlat16.xyz * vs_TEXCOORD3.www;
    u_xlat16.xyz = u_xlat27.yyy * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat27.xxx * vs_TEXCOORD3.xyz + u_xlat16.xyz;
    u_xlat16.xyz = vec3(u_xlat39) * vs_TEXCOORD2.xyz + u_xlat16.xyz;
    u_xlat39 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
    u_xlat4 = texture(sampler2D(unity_LightmapInd, samplerunity_Lightmap), vs_TEXCOORD8.xy, _GlobalMipBias.x);
    u_xlat6.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_TEXCOORD8.xy, _GlobalMipBias.x).xyz;
    u_xlat4.xyz = u_xlat4.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat39 = dot(u_xlat16.xyz, u_xlat4.xyz);
    u_xlat39 = u_xlat39 + 0.5;
    u_xlat4.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat39 = max(u_xlat4.w, 9.99999975e-05);
    u_xlat4.xyz = u_xlat4.xyz / vec3(u_xlat39);
    u_xlat27.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat6.xy = u_xlat27.xy * hlslcc_FragCoord.xy;
    u_xlat39 = u_xlat6.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat6.z = (-u_xlat39) + 1.0;
    u_xlat39 = (-u_xlat1.x) * 0.959999979 + 0.959999979;
    u_xlat27.x = u_xlat1.y * _Smoothness + (-u_xlat39);
    u_xlat15.xyz = vec3(u_xlat39) * u_xlat2.yzw;
    u_xlat0.xyz = u_xlat0.xyz * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat39 = (-u_xlat1.y) * _Smoothness + 1.0;
    u_xlat1.x = u_xlat39 * u_xlat39;
    u_xlat1.x = max(u_xlat1.x, 0.0078125);
    u_xlat14 = u_xlat1.x * u_xlat1.x;
    u_xlat27.x = u_xlat27.x + 1.0;
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
    u_xlat40 = u_xlat1.x * 4.0 + 2.0;
    u_xlat43 = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat6.xz, _GlobalMipBias.x).x;
    u_xlat44 = u_xlat43 + -1.0;
    u_xlat44 = _AmbientOcclusionParam.w * u_xlat44 + 1.0;
    u_xlat3.x = min(u_xlat3.x, u_xlat43);
    vec3 txVec0 = vec3(vs_TEXCOORD6.xy,vs_TEXCOORD6.z);
    u_xlat43 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat6.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat43 = u_xlat43 * _MainLightShadowParams.x + u_xlat6.x;
    u_xlatb6 = 0.0>=vs_TEXCOORD6.z;
    u_xlatb19 = vs_TEXCOORD6.z>=1.0;
    u_xlatb6 = u_xlatb19 || u_xlatb6;
    u_xlat43 = (u_xlatb6) ? 1.0 : u_xlat43;
    u_xlat6.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat6.x = u_xlat6.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat19 = (-u_xlat43) + 1.0;
    u_xlat43 = u_xlat6.x * u_xlat19 + u_xlat43;
    u_xlatb6 = _MainLightCookieTextureFormat!=-1.0;
    if(u_xlatb6){
        u_xlat6.xy = vs_TEXCOORD1.yy * _MainLightWorldToLight[1].xy;
        u_xlat6.xy = _MainLightWorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat6.xy;
        u_xlat6.xy = _MainLightWorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat6.xy;
        u_xlat6.xy = u_xlat6.xy + _MainLightWorldToLight[3].xy;
        u_xlat6.xy = u_xlat6.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat6 = texture(sampler2D(_MainLightCookieTexture, sampler_MainLightCookieTexture), u_xlat6.xy, _GlobalMipBias.x);
        u_xlatb7.xy = equal(vec4(vec4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat45 = (u_xlatb7.y) ? u_xlat6.w : u_xlat6.x;
        u_xlat6.xyz = (u_xlatb7.x) ? u_xlat6.xyz : vec3(u_xlat45);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
    }
    u_xlat6.xyz = u_xlat6.xyz * _MainLightColor.xyz;
    u_xlat6.xyz = vec3(u_xlat44) * u_xlat6.xyz;
    u_xlat45 = dot((-u_xlat5.xyz), u_xlat16.xyz);
    u_xlat45 = u_xlat45 + u_xlat45;
    u_xlat7.xyz = u_xlat16.xyz * (-vec3(u_xlat45)) + (-u_xlat5.xyz);
    u_xlat45 = dot(u_xlat16.xyz, u_xlat5.xyz);
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat46 = (-u_xlat39) * 0.699999988 + 1.70000005;
    u_xlat39 = u_xlat39 * u_xlat46;
    u_xlat39 = u_xlat39 * 6.0;
    u_xlat7 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat7.xyz, u_xlat39);
    u_xlat39 = u_xlat7.w + -1.0;
    u_xlat39 = unity_SpecCube0_HDR.w * u_xlat39 + 1.0;
    u_xlat39 = max(u_xlat39, 0.0);
    u_xlat39 = log2(u_xlat39);
    u_xlat39 = u_xlat39 * unity_SpecCube0_HDR.y;
    u_xlat39 = exp2(u_xlat39);
    u_xlat39 = u_xlat39 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat39);
    u_xlat8.xy = u_xlat1.xx * u_xlat1.xx + vec2(-1.0, 1.0);
    u_xlat39 = float(1.0) / u_xlat8.y;
    u_xlat21.xyz = (-u_xlat0.xyz) + u_xlat27.xxx;
    u_xlat21.xyz = vec3(u_xlat45) * u_xlat21.xyz + u_xlat0.xyz;
    u_xlat21.xyz = vec3(u_xlat39) * u_xlat21.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat21.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat15.xyz + u_xlat7.xyz;
    u_xlat39 = u_xlat43 * unity_LightData.z;
    u_xlat1.x = dot(u_xlat16.xyz, _MainLightPosition.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat39 = u_xlat39 * u_xlat1.x;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat5.xyz + _MainLightPosition.xyz;
    u_xlat39 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat39 = max(u_xlat39, 1.17549435e-37);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat7.xyz = vec3(u_xlat39) * u_xlat7.xyz;
    u_xlat39 = dot(u_xlat16.xyz, u_xlat7.xyz);
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat1.x = dot(_MainLightPosition.xyz, u_xlat7.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat8.x + 1.00001001;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat39 = u_xlat39 * u_xlat1.x;
    u_xlat39 = u_xlat40 * u_xlat39;
    u_xlat39 = u_xlat14 / u_xlat39;
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat39) + u_xlat15.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat39 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu39 =  uint(int(u_xlat39));
    u_xlatb1.xz = equal(vec4(vec4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), vec4(0.0, 0.0, 1.0, 0.0)).xz;
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu39 ; u_xlatu_loop_1++)
    {
        u_xlatu45 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati46 = int(u_xlatu_loop_1 & 3u);
        u_xlat45 = dot(unity_LightIndices[int(u_xlatu45)], uintBitsToFloat(ImmCB_0[u_xlati46]));
        u_xlatu45 =  uint(int(u_xlat45));
        u_xlat21.xyz = (-vs_TEXCOORD1.xyz) * _AdditionalLightsPosition[int(u_xlatu45)].www + _AdditionalLightsPosition[int(u_xlatu45)].xyz;
        u_xlat46 = dot(u_xlat21.xyz, u_xlat21.xyz);
        u_xlat46 = max(u_xlat46, 6.10351562e-05);
        u_xlat9 = inversesqrt(u_xlat46);
        u_xlat22.xyz = u_xlat21.xyz * vec3(u_xlat9);
        u_xlat10.x = float(1.0) / float(u_xlat46);
        u_xlat46 = u_xlat46 * _AdditionalLightsAttenuation[int(u_xlatu45)].x;
        u_xlat46 = (-u_xlat46) * u_xlat46 + 1.0;
        u_xlat46 = max(u_xlat46, 0.0);
        u_xlat46 = u_xlat46 * u_xlat46;
        u_xlat46 = u_xlat46 * u_xlat10.x;
        u_xlat10.x = dot(_AdditionalLightsSpotDir[int(u_xlatu45)].xyz, u_xlat22.xyz);
        u_xlat10.x = u_xlat10.x * _AdditionalLightsAttenuation[int(u_xlatu45)].z + _AdditionalLightsAttenuation[int(u_xlatu45)].w;
        u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
        u_xlat10.x = u_xlat10.x * u_xlat10.x;
        u_xlat46 = u_xlat46 * u_xlat10.x;
        u_xlatu10 = u_xlatu45 >> (5u & uint(0x1F));
        u_xlati23 = 1 << (int(u_xlatu45) & int(0x1F));
        u_xlati10 = int(uint(u_xlati23) & floatBitsToUint(_AdditionalLightsCookieEnableBits[int(u_xlatu10)]));
        if(u_xlati10 != 0) {
            u_xlati10 = int(_AdditionalLightsLightTypes[int(u_xlatu45)]);
            u_xlati23 = (u_xlati10 != 0) ? 0 : 1;
            u_xlati36 = int(u_xlatu45) << (2 & int(0x1F));
            if(u_xlati23 != 0) {
                u_xlat11.xyz = vs_TEXCOORD1.yyy * _AdditionalLightsWorldToLights[(u_xlati36 + 1) / 4][(u_xlati36 + 1) % 4].xyw;
                u_xlat11.xyz = _AdditionalLightsWorldToLights[u_xlati36 / 4][u_xlati36 % 4].xyw * vs_TEXCOORD1.xxx + u_xlat11.xyz;
                u_xlat11.xyz = _AdditionalLightsWorldToLights[(u_xlati36 + 2) / 4][(u_xlati36 + 2) % 4].xyw * vs_TEXCOORD1.zzz + u_xlat11.xyz;
                u_xlat11.xyz = u_xlat11.xyz + _AdditionalLightsWorldToLights[(u_xlati36 + 3) / 4][(u_xlati36 + 3) % 4].xyw;
                u_xlat23.xz = u_xlat11.xy / u_xlat11.zz;
                u_xlat23.xz = u_xlat23.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                u_xlat23.xz = clamp(u_xlat23.xz, 0.0, 1.0);
                u_xlat23.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu45)].xy * u_xlat23.xz + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu45)].zw;
            } else {
                u_xlatb10 = u_xlati10==1;
                u_xlati10 = u_xlatb10 ? 1 : int(0);
                if(u_xlati10 != 0) {
                    u_xlat11.xy = vs_TEXCOORD1.yy * _AdditionalLightsWorldToLights[(u_xlati36 + 1) / 4][(u_xlati36 + 1) % 4].xy;
                    u_xlat11.xy = _AdditionalLightsWorldToLights[u_xlati36 / 4][u_xlati36 % 4].xy * vs_TEXCOORD1.xx + u_xlat11.xy;
                    u_xlat11.xy = _AdditionalLightsWorldToLights[(u_xlati36 + 2) / 4][(u_xlati36 + 2) % 4].xy * vs_TEXCOORD1.zz + u_xlat11.xy;
                    u_xlat11.xy = u_xlat11.xy + _AdditionalLightsWorldToLights[(u_xlati36 + 3) / 4][(u_xlati36 + 3) % 4].xy;
                    u_xlat11.xy = u_xlat11.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat11.xy = fract(u_xlat11.xy);
                    u_xlat23.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu45)].xy * u_xlat11.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu45)].zw;
                } else {
                    u_xlat11 = vs_TEXCOORD1.yyyy * _AdditionalLightsWorldToLights[(u_xlati36 + 1) / 4][(u_xlati36 + 1) % 4];
                    u_xlat11 = _AdditionalLightsWorldToLights[u_xlati36 / 4][u_xlati36 % 4] * vs_TEXCOORD1.xxxx + u_xlat11;
                    u_xlat11 = _AdditionalLightsWorldToLights[(u_xlati36 + 2) / 4][(u_xlati36 + 2) % 4] * vs_TEXCOORD1.zzzz + u_xlat11;
                    u_xlat11 = u_xlat11 + _AdditionalLightsWorldToLights[(u_xlati36 + 3) / 4][(u_xlati36 + 3) % 4];
                    u_xlat11.xyz = u_xlat11.xyz / u_xlat11.www;
                    u_xlat10.x = dot(u_xlat11.xyz, u_xlat11.xyz);
                    u_xlat10.x = inversesqrt(u_xlat10.x);
                    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
                    u_xlat10.x = dot(abs(u_xlat11.xyz), vec3(1.0, 1.0, 1.0));
                    u_xlat10.x = max(u_xlat10.x, 9.99999997e-07);
                    u_xlat10.x = float(1.0) / float(u_xlat10.x);
                    u_xlat12.xyz = u_xlat10.xxx * u_xlat11.zxy;
                    u_xlat12.x = (-u_xlat12.x);
                    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
                    u_xlatb37.xy = greaterThanEqual(u_xlat12.yzyz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
                    u_xlat37.x = (u_xlatb37.x) ? u_xlat12.x : (-u_xlat12.x);
                    u_xlat37.y = (u_xlatb37.y) ? u_xlat12.x : (-u_xlat12.x);
                    u_xlat10.xz = u_xlat11.xy * u_xlat10.xx + u_xlat37.xy;
                    u_xlat10.xz = u_xlat10.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat23.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu45)].xy * u_xlat10.xz + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu45)].zw;
                }
            }
            u_xlat10 = texture(sampler2D(_AdditionalLightsCookieAtlasTexture, sampler_AdditionalLightsCookieAtlasTexture), u_xlat23.xz, _GlobalMipBias.x);
            u_xlat49 = (u_xlatb1.z) ? u_xlat10.w : u_xlat10.x;
            u_xlat10.xyz = (u_xlatb1.x) ? u_xlat10.xyz : vec3(u_xlat49);
        } else {
            u_xlat10.x = float(1.0);
            u_xlat10.y = float(1.0);
            u_xlat10.z = float(1.0);
        }
        u_xlat10.xyz = u_xlat10.xyz * _AdditionalLightsColor[int(u_xlatu45)].xyz;
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat45 = dot(u_xlat16.xyz, u_xlat22.xyz);
        u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
        u_xlat45 = u_xlat45 * u_xlat46;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat9) + u_xlat5.xyz;
        u_xlat45 = dot(u_xlat21.xyz, u_xlat21.xyz);
        u_xlat45 = max(u_xlat45, 1.17549435e-37);
        u_xlat45 = inversesqrt(u_xlat45);
        u_xlat21.xyz = vec3(u_xlat45) * u_xlat21.xyz;
        u_xlat45 = dot(u_xlat16.xyz, u_xlat21.xyz);
        u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
        u_xlat46 = dot(u_xlat22.xyz, u_xlat21.xyz);
        u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
        u_xlat45 = u_xlat45 * u_xlat45;
        u_xlat45 = u_xlat45 * u_xlat8.x + 1.00001001;
        u_xlat46 = u_xlat46 * u_xlat46;
        u_xlat45 = u_xlat45 * u_xlat45;
        u_xlat46 = max(u_xlat46, 0.100000001);
        u_xlat45 = u_xlat45 * u_xlat46;
        u_xlat45 = u_xlat40 * u_xlat45;
        u_xlat45 = u_xlat14 / u_xlat45;
        u_xlat21.xyz = u_xlat0.xyz * vec3(u_xlat45) + u_xlat15.xyz;
        u_xlat7.xyz = u_xlat21.xyz * u_xlat10.xyz + u_xlat7.xyz;
    }
    u_xlat0.xyz = u_xlat4.xyz * u_xlat3.xxx + u_xlat6.xyz;
    SV_Target0.xyz = u_xlat7.xyz + u_xlat0.xyz;
    u_xlatb0 = _Surface==1.0;
    SV_Target0.w = (u_xlatb0) ? u_xlat2.x : 1.0;
    return;
}

