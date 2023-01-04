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
	vec4 _ScaleBiasRt;
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
layout(set = 1, binding = 3, std140) uniform _Terrain {
	float _NormalScale0;
	float _NormalScale1;
	float _NormalScale2;
	float _NormalScale3;
	float _Metallic0;
	float _Metallic1;
	float _Metallic2;
	float _Metallic3;
	float _Smoothness0;
	float _Smoothness1;
	float _Smoothness2;
	float _Smoothness3;
	vec4 _DiffuseRemapScale0;
	vec4 _DiffuseRemapScale1;
	vec4 _DiffuseRemapScale2;
	vec4 _DiffuseRemapScale3;
	vec4 _MaskMapRemapOffset0;
	vec4 _MaskMapRemapOffset1;
	vec4 _MaskMapRemapOffset2;
	vec4 _MaskMapRemapOffset3;
	vec4 _MaskMapRemapScale0;
	vec4 _MaskMapRemapScale1;
	vec4 _MaskMapRemapScale2;
	vec4 _MaskMapRemapScale3;
	vec4 _Control_ST;
	vec4 _Control_TexelSize;
	float _DiffuseHasAlpha0;
	float _DiffuseHasAlpha1;
	float _DiffuseHasAlpha2;
	float _DiffuseHasAlpha3;
	float _LayerHasMask0;
	float _LayerHasMask1;
	float _LayerHasMask2;
	float _LayerHasMask3;
	vec4 _Splat0_ST;
	vec4 _Splat1_ST;
	vec4 _Splat2_ST;
	vec4 _Splat3_ST;
	float _HeightTransition;
	float _NumLayersCount;
	vec4 _TerrainHeightmapRecipSize;
	vec4 _TerrainHeightmapScale;
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
layout(set = 0, binding = 3) uniform mediump texture2D _Control;
layout(set = 0, binding = 4) uniform mediump texture2D _Splat0;
layout(set = 0, binding = 5) uniform mediump texture2D _Splat1;
layout(set = 0, binding = 6) uniform mediump texture2D _Splat2;
layout(set = 0, binding = 7) uniform mediump texture2D _Splat3;
layout(set = 0, binding = 8) uniform mediump texture2D _Normal0;
layout(set = 0, binding = 9) uniform mediump texture2D _Normal1;
layout(set = 0, binding = 10) uniform mediump texture2D _Normal2;
layout(set = 0, binding = 11) uniform mediump texture2D _Normal3;
layout(set = 0, binding = 12) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 13) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 14) uniform mediump texture2D _MainLightCookieTexture;
layout(set = 0, binding = 15) uniform mediump texture2D _AdditionalLightsCookieAtlasTexture;
layout(location = 0) in highp vec4 vs_TEXCOORD0;
layout(location = 1) in highp vec4 vs_TEXCOORD1;
layout(location = 2) in highp vec4 vs_TEXCOORD2;
layout(location = 3) in highp vec4 vs_TEXCOORD3;
layout(location = 4) in highp vec4 vs_TEXCOORD4;
layout(location = 5) in highp vec4 vs_TEXCOORD5;
layout(location = 6) in highp vec3 vs_TEXCOORD7;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 16) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 17) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 18) uniform mediump  sampler sampler_Control;
layout(set = 0, binding = 19) uniform mediump  sampler sampler_Splat0;
layout(set = 0, binding = 20) uniform mediump  sampler sampler_Normal0;
layout(set = 0, binding = 21) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 22) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 23) uniform mediump  sampler sampler_MainLightCookieTexture;
layout(set = 0, binding = 24) uniform mediump  sampler sampler_AdditionalLightsCookieAtlasTexture;
void main()
{
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
uint u_xlatu2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
float u_xlat14;
vec3 u_xlat16;
bvec2 u_xlatb16;
float u_xlat18;
float u_xlat28;
uint u_xlatu28;
float u_xlat30;
bool u_xlatb30;
vec2 u_xlat39;
bvec2 u_xlatb39;
float u_xlat42;
float u_xlat43;
int u_xlati43;
uint u_xlatu43;
bool u_xlatb43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
float u_xlat46;
uint u_xlatu46;
bool u_xlatb46;
float u_xlat47;
int u_xlati47;
float u_xlat48;
float u_xlat49;
int u_xlati49;
uint u_xlatu49;
bool u_xlatb49;
int u_xlati50;
int u_xlati51;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xyz = _MaskMapRemapScale0.xyw * vec3(0.5, 0.5, 0.5) + _MaskMapRemapOffset0.xyw;
    u_xlat1.xyz = _MaskMapRemapScale1.xyw * vec3(0.5, 0.5, 0.5) + _MaskMapRemapOffset1.xyw;
    u_xlat2.xyz = _MaskMapRemapScale2.xyw * vec3(0.5, 0.5, 0.5) + _MaskMapRemapOffset2.xyw;
    u_xlat3.xyw = _MaskMapRemapScale3.xwy * vec3(0.5, 0.5, 0.5) + _MaskMapRemapOffset3.xwy;
    u_xlat4.xy = _Control_TexelSize.zw + vec2(-1.0, -1.0);
    u_xlat4.xy = vs_TEXCOORD0.xy * u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = u_xlat4.xy * _Control_TexelSize.xy;
    u_xlat4 = texture(sampler2D(_Control, sampler_Control), u_xlat4.xy, _GlobalMipBias.x);
    u_xlat42 = dot(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat5 = texture(sampler2D(_Splat0, sampler_Splat0), vs_TEXCOORD1.xy, _GlobalMipBias.x);
    u_xlat6 = texture(sampler2D(_Splat1, sampler_Splat0), vs_TEXCOORD1.zw, _GlobalMipBias.x);
    u_xlat7 = texture(sampler2D(_Splat2, sampler_Splat0), vs_TEXCOORD2.xy, _GlobalMipBias.x);
    u_xlat8 = texture(sampler2D(_Splat3, sampler_Splat0), vs_TEXCOORD2.zw, _GlobalMipBias.x);
    u_xlat9.x = u_xlat5.w;
    u_xlat9.y = u_xlat6.w;
    u_xlat9.z = u_xlat7.w;
    u_xlat9.w = u_xlat8.w;
    u_xlat10 = u_xlat9 * vec4(_Smoothness0, _Smoothness1, _Smoothness2, _Smoothness3);
    u_xlatb43 = 4.0>=_NumLayersCount;
    u_xlat11 = (-u_xlat4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11 = u_xlat9 + (-u_xlat11);
    u_xlat11 = u_xlat11 * vec4(20.0, 20.0, 20.0, 20.0);
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat11 = u_xlat4 * vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005) + u_xlat11;
    u_xlat12 = u_xlat4 + (-u_xlat11);
    u_xlat13.x = u_xlat12.x * _DiffuseRemapScale0.w;
    u_xlat13.y = u_xlat12.y * _DiffuseRemapScale1.w;
    u_xlat13.z = u_xlat12.z * _DiffuseRemapScale2.w;
    u_xlat13.w = u_xlat12.w * _DiffuseRemapScale3.w;
    u_xlat11 = u_xlat11 + u_xlat13;
    u_xlat4 = (bool(u_xlatb43)) ? u_xlat11 : u_xlat4;
    u_xlat43 = dot(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlatb44 = 0.00499999989>=u_xlat43;
    if(((int(u_xlatb44) * int(0xffffffffu)))!=0){discard;}
    u_xlat43 = u_xlat43 + 6.10351562e-05;
    u_xlat4 = u_xlat4 / vec4(u_xlat43);
    u_xlat11.xyz = u_xlat4.xxx * _DiffuseRemapScale0.xyz;
    u_xlat12.xyz = u_xlat4.yyy * _DiffuseRemapScale1.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat12.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat11.xyz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat4.zzz * _DiffuseRemapScale2.xyz;
    u_xlat5.xyz = u_xlat7.xyz * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat6.xyz = u_xlat4.www * _DiffuseRemapScale3.xyz;
    u_xlat5.xyz = u_xlat8.xyz * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat6.xyz = texture(sampler2D(_Normal0, sampler_Normal0), vs_TEXCOORD1.xy, _GlobalMipBias.x).xyw;
    u_xlat6.x = u_xlat6.x * u_xlat6.z;
    u_xlat6.xy = u_xlat6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat43 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat7.z = max(u_xlat43, 1.00000002e-16);
    u_xlat7.xy = u_xlat6.xy * vec2(_NormalScale0);
    u_xlat6.xyz = texture(sampler2D(_Normal1, sampler_Normal0), vs_TEXCOORD1.zw, _GlobalMipBias.x).xyw;
    u_xlat6.x = u_xlat6.x * u_xlat6.z;
    u_xlat6.xy = u_xlat6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat43 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat8.z = max(u_xlat43, 1.00000002e-16);
    u_xlat8.xy = u_xlat6.xy * vec2(vec2(_NormalScale1, _NormalScale1));
    u_xlat6.xyz = u_xlat4.yyy * u_xlat8.xyz;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat7.xyz + u_xlat6.xyz;
    u_xlat7.xyz = texture(sampler2D(_Normal2, sampler_Normal0), vs_TEXCOORD2.xy, _GlobalMipBias.x).xyw;
    u_xlat7.x = u_xlat7.x * u_xlat7.z;
    u_xlat7.xy = u_xlat7.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat43 = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat8.z = max(u_xlat43, 1.00000002e-16);
    u_xlat8.xy = u_xlat7.xy * vec2(vec2(_NormalScale2, _NormalScale2));
    u_xlat6.xyz = u_xlat4.zzz * u_xlat8.xyz + u_xlat6.xyz;
    u_xlat7.xyz = texture(sampler2D(_Normal3, sampler_Normal0), vs_TEXCOORD2.zw, _GlobalMipBias.x).xyw;
    u_xlat7.x = u_xlat7.x * u_xlat7.z;
    u_xlat7.xy = u_xlat7.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat43 = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat8.z = max(u_xlat43, 1.00000002e-16);
    u_xlat8.xy = u_xlat7.xy * vec2(vec2(_NormalScale3, _NormalScale3));
    u_xlat6.xyz = u_xlat4.www * u_xlat8.xyz + u_xlat6.xyz;
    u_xlat6.w = u_xlat6.z + 9.99999975e-06;
    u_xlat43 = dot(u_xlat6.xyw, u_xlat6.xyw);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat6.xyz = vec3(u_xlat43) * u_xlat6.xyw;
    u_xlat7.x = _MaskMapRemapScale0.y;
    u_xlat7.y = _MaskMapRemapScale1.y;
    u_xlat7.z = _MaskMapRemapScale2.y;
    u_xlat7.w = _MaskMapRemapScale3.y;
    u_xlat8.x = _MaskMapRemapOffset0.y;
    u_xlat8.y = _MaskMapRemapOffset1.y;
    u_xlat8.z = _MaskMapRemapOffset2.y;
    u_xlat8.w = _MaskMapRemapOffset3.y;
    u_xlat7 = u_xlat7 + u_xlat8;
    u_xlat8.x = u_xlat0.z;
    u_xlat8.y = u_xlat1.z;
    u_xlat8.z = u_xlat2.z;
    u_xlat8.w = u_xlat3.y;
    u_xlat8 = (-u_xlat9) * vec4(_Smoothness0, _Smoothness1, _Smoothness2, _Smoothness3) + u_xlat8;
    u_xlat8 = vec4(_LayerHasMask0, _LayerHasMask1, _LayerHasMask2, _LayerHasMask3) * u_xlat8 + u_xlat10;
    u_xlat28 = dot(u_xlat4, u_xlat8);
    u_xlat8.x = u_xlat0.x;
    u_xlat8.y = u_xlat1.x;
    u_xlat8.z = u_xlat2.x;
    u_xlat8.w = u_xlat3.x;
    u_xlat8 = u_xlat8 + (-vec4(_Metallic0, _Metallic1, _Metallic2, _Metallic3));
    u_xlat8 = vec4(_LayerHasMask0, _LayerHasMask1, _LayerHasMask2, _LayerHasMask3) * u_xlat8 + vec4(_Metallic0, _Metallic1, _Metallic2, _Metallic3);
    u_xlat0.x = dot(u_xlat4, u_xlat8);
    u_xlat3.x = u_xlat0.y;
    u_xlat3.y = u_xlat1.y;
    u_xlat3.z = u_xlat2.y;
    u_xlat1 = (-u_xlat7) + u_xlat3;
    u_xlat1 = vec4(_LayerHasMask0, _LayerHasMask1, _LayerHasMask2, _LayerHasMask3) * u_xlat1 + u_xlat7;
    u_xlat14 = dot(u_xlat4, u_xlat1);
    u_xlat1.xyz = u_xlat6.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat6.xxx * (-vs_TEXCOORD4.xyz) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat6.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat43 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat1.xyz = vec3(u_xlat43) * u_xlat1.xyz;
    u_xlat2.xyz = vs_TEXCOORD7.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat3.xyz = vs_TEXCOORD7.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat4.xyz = vs_TEXCOORD7.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat6.xyz = vs_TEXCOORD7.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.y = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.z = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat2.w = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb2 = lessThan(u_xlat2, _CascadeShadowSplitSphereRadii);
    u_xlat3.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat3.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat2.x = (u_xlatb2.x) ? float(-1.0) : float(-0.0);
    u_xlat2.y = (u_xlatb2.y) ? float(-1.0) : float(-0.0);
    u_xlat2.z = (u_xlatb2.z) ? float(-1.0) : float(-0.0);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.yzw;
    u_xlat3.yzw = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat43 = dot(u_xlat3, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat43 = (-u_xlat43) + 4.0;
    u_xlatu43 = uint(u_xlat43);
    u_xlati43 = int(u_xlatu43) << (2 & int(0x1F));
    u_xlat2.xyz = vs_TEXCOORD7.yyy * _MainLightWorldToShadow[(u_xlati43 + 1) / 4][(u_xlati43 + 1) % 4].xyz;
    u_xlat2.xyz = _MainLightWorldToShadow[u_xlati43 / 4][u_xlati43 % 4].xyz * vs_TEXCOORD7.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _MainLightWorldToShadow[(u_xlati43 + 2) / 4][(u_xlati43 + 2) % 4].xyz * vs_TEXCOORD7.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + _MainLightWorldToShadow[(u_xlati43 + 3) / 4][(u_xlati43 + 3) % 4].xyz;
    u_xlat3 = texture(sampler2D(unity_LightmapInd, samplerunity_Lightmap), vs_TEXCOORD0.zw, _GlobalMipBias.x);
    u_xlat4.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_TEXCOORD0.zw, _GlobalMipBias.x).xyz;
    u_xlat3.xyz = u_xlat3.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat43 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat43 = u_xlat43 + 0.5;
    u_xlat3.xyz = vec3(u_xlat43) * u_xlat4.xyz;
    u_xlat43 = max(u_xlat3.w, 9.99999975e-05);
    u_xlat3.xyz = u_xlat3.xyz / vec3(u_xlat43);
    u_xlat4.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat4.xy = u_xlat4.xy * hlslcc_FragCoord.xy;
    u_xlat43 = u_xlat4.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat4.z = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat0.x) * 0.959999979 + 0.959999979;
    u_xlat44 = u_xlat28 + (-u_xlat43);
    u_xlat6.xyz = vec3(u_xlat43) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat0.x * u_xlat0.x;
    u_xlat28 = max(u_xlat28, 0.0078125);
    u_xlat43 = u_xlat28 * u_xlat28;
    u_xlat44 = u_xlat44 + 1.0;
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
    u_xlat45 = u_xlat28 * 4.0 + 2.0;
    u_xlat4.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat4.xz, _GlobalMipBias.x).x;
    u_xlat18 = u_xlat4.x + -1.0;
    u_xlat18 = _AmbientOcclusionParam.w * u_xlat18 + 1.0;
    u_xlat14 = min(u_xlat14, u_xlat4.x);
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat16.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat2.x = u_xlat2.x * _MainLightShadowParams.x + u_xlat16.x;
    u_xlatb16.x = 0.0>=u_xlat2.z;
    u_xlatb30 = u_xlat2.z>=1.0;
    u_xlatb16.x = u_xlatb30 || u_xlatb16.x;
    u_xlat2.x = (u_xlatb16.x) ? 1.0 : u_xlat2.x;
    u_xlat4.xzw = vs_TEXCOORD7.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat16.x = dot(u_xlat4.xzw, u_xlat4.xzw);
    u_xlat16.x = u_xlat16.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlat30 = (-u_xlat2.x) + 1.0;
    u_xlat2.x = u_xlat16.x * u_xlat30 + u_xlat2.x;
    u_xlatb16.x = _MainLightCookieTextureFormat!=-1.0;
    if(u_xlatb16.x){
        u_xlat16.xy = vs_TEXCOORD7.yy * _MainLightWorldToLight[1].xy;
        u_xlat16.xy = _MainLightWorldToLight[0].xy * vs_TEXCOORD7.xx + u_xlat16.xy;
        u_xlat16.xy = _MainLightWorldToLight[2].xy * vs_TEXCOORD7.zz + u_xlat16.xy;
        u_xlat16.xy = u_xlat16.xy + _MainLightWorldToLight[3].xy;
        u_xlat16.xy = u_xlat16.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat7 = texture(sampler2D(_MainLightCookieTexture, sampler_MainLightCookieTexture), u_xlat16.xy, _GlobalMipBias.x);
        u_xlatb16.xy = equal(vec4(vec4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat30 = (u_xlatb16.y) ? u_xlat7.w : u_xlat7.x;
        u_xlat4.xzw = (u_xlatb16.x) ? u_xlat7.xyz : vec3(u_xlat30);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat4.xzw = u_xlat4.xzw * _MainLightColor.xyz;
    u_xlat4.xzw = vec3(u_xlat18) * u_xlat4.xzw;
    u_xlat7.x = vs_TEXCOORD3.w;
    u_xlat7.y = vs_TEXCOORD4.w;
    u_xlat7.z = vs_TEXCOORD5.w;
    u_xlat16.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat8.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + (-u_xlat7.xyz);
    u_xlat16.x = dot(u_xlat1.xyz, u_xlat7.xyz);
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat30 = (-u_xlat0.x) * 0.699999988 + 1.70000005;
    u_xlat0.x = u_xlat0.x * u_xlat30;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat8 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat8.xyz, u_xlat0.x);
    u_xlat0.x = u_xlat8.w + -1.0;
    u_xlat0.x = unity_SpecCube0_HDR.w * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat0.xz = vec2(u_xlat28) * vec2(u_xlat28) + vec2(-1.0, 1.0);
    u_xlat28 = float(1.0) / u_xlat0.z;
    u_xlat9.xyz = (-u_xlat5.xyz) + vec3(u_xlat44);
    u_xlat16.xyz = u_xlat16.xxx * u_xlat9.xyz + u_xlat5.xyz;
    u_xlat16.xyz = vec3(u_xlat28) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat8.xyz;
    u_xlat16.xyz = u_xlat3.xyz * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat28 = u_xlat2.x * unity_LightData.z;
    u_xlat2.x = dot(u_xlat1.xyz, _MainLightPosition.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat28 = u_xlat28 * u_xlat2.x;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xzw;
    u_xlat4.xzw = u_xlat7.xyz + _MainLightPosition.xyz;
    u_xlat28 = dot(u_xlat4.xzw, u_xlat4.xzw);
    u_xlat28 = max(u_xlat28, 1.17549435e-37);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat4.xzw = vec3(u_xlat28) * u_xlat4.xzw;
    u_xlat28 = dot(u_xlat1.xyz, u_xlat4.xzw);
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat2.x = dot(_MainLightPosition.xyz, u_xlat4.xzw);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat0.x + 1.00001001;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat2.x = max(u_xlat2.x, 0.100000001);
    u_xlat28 = u_xlat28 * u_xlat2.x;
    u_xlat28 = u_xlat45 * u_xlat28;
    u_xlat28 = u_xlat43 / u_xlat28;
    u_xlat4.xzw = u_xlat5.xyz * vec3(u_xlat28) + u_xlat6.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xzw;
    u_xlat28 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu28 =  uint(int(u_xlat28));
    u_xlatb4.xz = equal(vec4(vec4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), vec4(0.0, 0.0, 1.0, 0.0)).xz;
    u_xlat8.x = float(0.0);
    u_xlat8.y = float(0.0);
    u_xlat8.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu28 ; u_xlatu_loop_1++)
    {
        u_xlatu46 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati47 = int(u_xlatu_loop_1 & 3u);
        u_xlat46 = dot(unity_LightIndices[int(u_xlatu46)], uintBitsToFloat(ImmCB_0[u_xlati47]));
        u_xlatu46 =  uint(int(u_xlat46));
        u_xlat9.xyz = (-vs_TEXCOORD7.xyz) * _AdditionalLightsPosition[int(u_xlatu46)].www + _AdditionalLightsPosition[int(u_xlatu46)].xyz;
        u_xlat47 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat47 = max(u_xlat47, 6.10351562e-05);
        u_xlat48 = inversesqrt(u_xlat47);
        u_xlat10.xyz = vec3(u_xlat48) * u_xlat9.xyz;
        u_xlat49 = float(1.0) / float(u_xlat47);
        u_xlat47 = u_xlat47 * _AdditionalLightsAttenuation[int(u_xlatu46)].x;
        u_xlat47 = (-u_xlat47) * u_xlat47 + 1.0;
        u_xlat47 = max(u_xlat47, 0.0);
        u_xlat47 = u_xlat47 * u_xlat47;
        u_xlat47 = u_xlat47 * u_xlat49;
        u_xlat49 = dot(_AdditionalLightsSpotDir[int(u_xlatu46)].xyz, u_xlat10.xyz);
        u_xlat49 = u_xlat49 * _AdditionalLightsAttenuation[int(u_xlatu46)].z + _AdditionalLightsAttenuation[int(u_xlatu46)].w;
        u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
        u_xlat49 = u_xlat49 * u_xlat49;
        u_xlat47 = u_xlat47 * u_xlat49;
        u_xlatu49 = u_xlatu46 >> (5u & uint(0x1F));
        u_xlati50 = 1 << (int(u_xlatu46) & int(0x1F));
        u_xlati49 = int(uint(u_xlati50) & floatBitsToUint(_AdditionalLightsCookieEnableBits[int(u_xlatu49)]));
        if(u_xlati49 != 0) {
            u_xlati49 = int(_AdditionalLightsLightTypes[int(u_xlatu46)]);
            u_xlati50 = (u_xlati49 != 0) ? 0 : 1;
            u_xlati51 = int(u_xlatu46) << (2 & int(0x1F));
            if(u_xlati50 != 0) {
                u_xlat11.xyz = vs_TEXCOORD7.yyy * _AdditionalLightsWorldToLights[(u_xlati51 + 1) / 4][(u_xlati51 + 1) % 4].xyw;
                u_xlat11.xyz = _AdditionalLightsWorldToLights[u_xlati51 / 4][u_xlati51 % 4].xyw * vs_TEXCOORD7.xxx + u_xlat11.xyz;
                u_xlat11.xyz = _AdditionalLightsWorldToLights[(u_xlati51 + 2) / 4][(u_xlati51 + 2) % 4].xyw * vs_TEXCOORD7.zzz + u_xlat11.xyz;
                u_xlat11.xyz = u_xlat11.xyz + _AdditionalLightsWorldToLights[(u_xlati51 + 3) / 4][(u_xlati51 + 3) % 4].xyw;
                u_xlat11.xy = u_xlat11.xy / u_xlat11.zz;
                u_xlat11.xy = u_xlat11.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
                u_xlat11.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu46)].xy * u_xlat11.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu46)].zw;
            } else {
                u_xlatb49 = u_xlati49==1;
                u_xlati49 = u_xlatb49 ? 1 : int(0);
                if(u_xlati49 != 0) {
                    u_xlat39.xy = vs_TEXCOORD7.yy * _AdditionalLightsWorldToLights[(u_xlati51 + 1) / 4][(u_xlati51 + 1) % 4].xy;
                    u_xlat39.xy = _AdditionalLightsWorldToLights[u_xlati51 / 4][u_xlati51 % 4].xy * vs_TEXCOORD7.xx + u_xlat39.xy;
                    u_xlat39.xy = _AdditionalLightsWorldToLights[(u_xlati51 + 2) / 4][(u_xlati51 + 2) % 4].xy * vs_TEXCOORD7.zz + u_xlat39.xy;
                    u_xlat39.xy = u_xlat39.xy + _AdditionalLightsWorldToLights[(u_xlati51 + 3) / 4][(u_xlati51 + 3) % 4].xy;
                    u_xlat39.xy = u_xlat39.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat39.xy = fract(u_xlat39.xy);
                    u_xlat11.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu46)].xy * u_xlat39.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu46)].zw;
                } else {
                    u_xlat12 = vs_TEXCOORD7.yyyy * _AdditionalLightsWorldToLights[(u_xlati51 + 1) / 4][(u_xlati51 + 1) % 4];
                    u_xlat12 = _AdditionalLightsWorldToLights[u_xlati51 / 4][u_xlati51 % 4] * vs_TEXCOORD7.xxxx + u_xlat12;
                    u_xlat12 = _AdditionalLightsWorldToLights[(u_xlati51 + 2) / 4][(u_xlati51 + 2) % 4] * vs_TEXCOORD7.zzzz + u_xlat12;
                    u_xlat12 = u_xlat12 + _AdditionalLightsWorldToLights[(u_xlati51 + 3) / 4][(u_xlati51 + 3) % 4];
                    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
                    u_xlat49 = dot(u_xlat12.xyz, u_xlat12.xyz);
                    u_xlat49 = inversesqrt(u_xlat49);
                    u_xlat12.xyz = vec3(u_xlat49) * u_xlat12.xyz;
                    u_xlat49 = dot(abs(u_xlat12.xyz), vec3(1.0, 1.0, 1.0));
                    u_xlat49 = max(u_xlat49, 9.99999997e-07);
                    u_xlat49 = float(1.0) / float(u_xlat49);
                    u_xlat13.xyz = vec3(u_xlat49) * u_xlat12.zxy;
                    u_xlat13.x = (-u_xlat13.x);
                    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
                    u_xlatb39.xy = greaterThanEqual(u_xlat13.yzyz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
                    u_xlat39.x = (u_xlatb39.x) ? u_xlat13.x : (-u_xlat13.x);
                    u_xlat39.y = (u_xlatb39.y) ? u_xlat13.x : (-u_xlat13.x);
                    u_xlat39.xy = u_xlat12.xy * vec2(u_xlat49) + u_xlat39.xy;
                    u_xlat39.xy = u_xlat39.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat39.xy = clamp(u_xlat39.xy, 0.0, 1.0);
                    u_xlat11.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu46)].xy * u_xlat39.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu46)].zw;
                }
            }
            u_xlat11 = texture(sampler2D(_AdditionalLightsCookieAtlasTexture, sampler_AdditionalLightsCookieAtlasTexture), u_xlat11.xy, _GlobalMipBias.x);
            u_xlat49 = (u_xlatb4.z) ? u_xlat11.w : u_xlat11.x;
            u_xlat11.xyz = (u_xlatb4.x) ? u_xlat11.xyz : vec3(u_xlat49);
        } else {
            u_xlat11.x = float(1.0);
            u_xlat11.y = float(1.0);
            u_xlat11.z = float(1.0);
        }
        u_xlat11.xyz = u_xlat11.xyz * _AdditionalLightsColor[int(u_xlatu46)].xyz;
        u_xlat11.xyz = vec3(u_xlat18) * u_xlat11.xyz;
        u_xlat46 = dot(u_xlat1.xyz, u_xlat10.xyz);
        u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
        u_xlat46 = u_xlat46 * u_xlat47;
        u_xlat11.xyz = vec3(u_xlat46) * u_xlat11.xyz;
        u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat48) + u_xlat7.xyz;
        u_xlat46 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat46 = max(u_xlat46, 1.17549435e-37);
        u_xlat46 = inversesqrt(u_xlat46);
        u_xlat9.xyz = vec3(u_xlat46) * u_xlat9.xyz;
        u_xlat46 = dot(u_xlat1.xyz, u_xlat9.xyz);
        u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
        u_xlat47 = dot(u_xlat10.xyz, u_xlat9.xyz);
        u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
        u_xlat46 = u_xlat46 * u_xlat46;
        u_xlat46 = u_xlat46 * u_xlat0.x + 1.00001001;
        u_xlat47 = u_xlat47 * u_xlat47;
        u_xlat46 = u_xlat46 * u_xlat46;
        u_xlat47 = max(u_xlat47, 0.100000001);
        u_xlat46 = u_xlat46 * u_xlat47;
        u_xlat46 = u_xlat45 * u_xlat46;
        u_xlat46 = u_xlat43 / u_xlat46;
        u_xlat9.xyz = u_xlat5.xyz * vec3(u_xlat46) + u_xlat6.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat11.xyz + u_xlat8.xyz;
    }
    u_xlat0.xyz = u_xlat16.xyz * vec3(u_xlat14) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat8.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

