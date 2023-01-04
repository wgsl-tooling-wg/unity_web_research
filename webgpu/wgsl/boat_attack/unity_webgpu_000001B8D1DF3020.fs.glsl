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
	float _DitheringTextureInvSize;
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
	vec4 _BaseColor;
	vec4 _SpecColor;
	vec4 _EmissionColor;
	float _Cutoff;
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
layout(set = 0, binding = 0) uniform mediump texture2D _BaseMap;
layout(set = 0, binding = 1) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 2) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightCookieTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 5) uniform mediump texture2D _DitheringTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD1;
layout(location = 2) in highp vec3 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 6) uniform mediump  sampler sampler_BaseMap;
layout(set = 0, binding = 7) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 8) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 9) uniform mediump  sampler sampler_MainLightCookieTexture;
layout(set = 0, binding = 10) uniform mediump  sampler sampler_AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_DitheringTexture;
void main()
{
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
int u_xlati3;
uint u_xlatu3;
bvec4 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
uint u_xlatu5;
vec3 u_xlat6;
vec3 u_xlat7;
int u_xlati7;
vec4 u_xlat8;
int u_xlati8;
uint u_xlatu8;
bool u_xlatb8;
vec4 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
bool u_xlatb11;
vec3 u_xlat12;
bool u_xlatb12;
vec3 u_xlat14;
bvec2 u_xlatb14;
bvec2 u_xlatb16;
vec3 u_xlat19;
int u_xlati19;
float u_xlat25;
bool u_xlatb25;
int u_xlati30;
vec2 u_xlat31;
bvec2 u_xlatb31;
float u_xlat34;
float u_xlat35;
float u_xlat36;
float u_xlat37;
float u_xlat38;
uint u_xlatu38;
float u_xlat39;
uint u_xlatu39;
bool u_xlatb39;
float u_xlat40;
float u_xlat41;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_BaseMap, sampler_BaseMap), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat0 = u_xlat0.wxyz * _BaseColor.wxyz;
    u_xlat1.xy = hlslcc_FragCoord.xy * vec2(_DitheringTextureInvSize);
    u_xlat1.x = texture(sampler2D(_DitheringTexture, sampler_DitheringTexture), u_xlat1.xy, _GlobalMipBias.x).w;
    u_xlatb12 = unity_LODFade.x>=0.0;
    u_xlat1.x = (u_xlatb12) ? abs(u_xlat1.x) : -abs(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + unity_LODFade.x;
    u_xlatb1 = u_xlat1.x<0.0;
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlatb1 = unity_OrthoParams.w==0.0;
    u_xlat12.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat12.xyz * u_xlat2.xxx;
    u_xlat2.x = unity_MatrixV[0].z;
    u_xlat2.y = unity_MatrixV[1].z;
    u_xlat2.z = unity_MatrixV[2].z;
    u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat12.xyz : u_xlat2.xyz;
    u_xlat34 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * vs_TEXCOORD2.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-37);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat4.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat5.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat6.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat3.y = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat3.z = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat3.w = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb3 = lessThan(u_xlat3, _CascadeShadowSplitSphereRadii);
    u_xlat4.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb3.y ? float(1.0) : 0.0;
    u_xlat4.z = u_xlatb3.z ? float(1.0) : 0.0;
    u_xlat4.w = u_xlatb3.w ? float(1.0) : 0.0;
;
    u_xlat3.x = (u_xlatb3.x) ? float(-1.0) : float(-0.0);
    u_xlat3.y = (u_xlatb3.y) ? float(-1.0) : float(-0.0);
    u_xlat3.z = (u_xlatb3.z) ? float(-1.0) : float(-0.0);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.yzw;
    u_xlat4.yzw = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.x = dot(u_xlat4, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat3.x = (-u_xlat3.x) + 4.0;
    u_xlatu3 = uint(u_xlat3.x);
    u_xlati3 = int(u_xlatu3) << (2 & int(0x1F));
    u_xlat14.xyz = vs_TEXCOORD1.yyy * _MainLightWorldToShadow[(u_xlati3 + 1) / 4][(u_xlati3 + 1) % 4].xyz;
    u_xlat14.xyz = _MainLightWorldToShadow[u_xlati3 / 4][u_xlati3 % 4].xyz * vs_TEXCOORD1.xxx + u_xlat14.xyz;
    u_xlat14.xyz = _MainLightWorldToShadow[(u_xlati3 + 2) / 4][(u_xlati3 + 2) % 4].xyz * vs_TEXCOORD1.zzz + u_xlat14.xyz;
    u_xlat3.xyz = u_xlat14.xyz + _MainLightWorldToShadow[(u_xlati3 + 3) / 4][(u_xlati3 + 3) % 4].xyz;
    u_xlat36 = vs_TEXCOORD1.y * unity_MatrixV[1].z;
    u_xlat36 = unity_MatrixV[0].z * vs_TEXCOORD1.x + u_xlat36;
    u_xlat36 = unity_MatrixV[2].z * vs_TEXCOORD1.z + u_xlat36;
    u_xlat36 = u_xlat36 + unity_MatrixV[3].z;
    u_xlat36 = (-u_xlat36) + (-_ProjectionParams.y);
    u_xlat36 = max(u_xlat36, 0.0);
    u_xlat36 = u_xlat36 * unity_FogParams.x;
    u_xlat2.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat2);
    u_xlat4.y = dot(unity_SHAg, u_xlat2);
    u_xlat4.z = dot(unity_SHAb, u_xlat2);
    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat6.x = dot(unity_SHBr, u_xlat5);
    u_xlat6.y = dot(unity_SHBg, u_xlat5);
    u_xlat6.z = dot(unity_SHBb, u_xlat5);
    u_xlat35 = u_xlat2.y * u_xlat2.y;
    u_xlat35 = u_xlat2.x * u_xlat2.x + (-u_xlat35);
    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat5.xy = u_xlat5.xy * hlslcc_FragCoord.xy;
    u_xlat35 = u_xlat5.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat5.z = (-u_xlat35) + 1.0;
    u_xlat35 = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat5.xz, _GlobalMipBias.x).x;
    u_xlat37 = u_xlat35 + -1.0;
    u_xlat37 = _AmbientOcclusionParam.w * u_xlat37 + 1.0;
    u_xlat35 = min(u_xlat35, 1.0);
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat14.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat3.x = u_xlat3.x * _MainLightShadowParams.x + u_xlat14.x;
    u_xlatb14.x = 0.0>=u_xlat3.z;
    u_xlatb25 = u_xlat3.z>=1.0;
    u_xlatb14.x = u_xlatb25 || u_xlatb14.x;
    u_xlat3.x = (u_xlatb14.x) ? 1.0 : u_xlat3.x;
    u_xlat5.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat14.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat14.x = u_xlat14.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat25 = (-u_xlat3.x) + 1.0;
    u_xlat3.x = u_xlat14.x * u_xlat25 + u_xlat3.x;
    u_xlatb14.x = _MainLightCookieTextureFormat!=-1.0;
    if(u_xlatb14.x){
        u_xlat14.xy = vs_TEXCOORD1.yy * _MainLightWorldToLight[1].xy;
        u_xlat14.xy = _MainLightWorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat14.xy;
        u_xlat14.xy = _MainLightWorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat14.xy;
        u_xlat14.xy = u_xlat14.xy + _MainLightWorldToLight[3].xy;
        u_xlat14.xy = u_xlat14.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat5 = texture(sampler2D(_MainLightCookieTexture, sampler_MainLightCookieTexture), u_xlat14.xy, _GlobalMipBias.x);
        u_xlatb14.xy = equal(vec4(vec4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat25 = (u_xlatb14.y) ? u_xlat5.w : u_xlat5.x;
        u_xlat5.xyz = (u_xlatb14.x) ? u_xlat5.xyz : vec3(u_xlat25);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
    }
    u_xlat5.xyz = u_xlat5.xyz * _MainLightColor.xyz;
    u_xlat5.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat35) * u_xlat4.xyz;
    u_xlat35 = u_xlat3.x * unity_LightData.z;
    u_xlat3.xyz = vec3(u_xlat35) * u_xlat5.xyz;
    u_xlat35 = dot(u_xlat2.xyz, _MainLightPosition.xyz);
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat5.xyz = vec3(u_xlat35) * u_xlat3.xyz;
    u_xlat35 = u_xlat0.x * 10.0 + 1.0;
    u_xlat35 = exp2(u_xlat35);
    u_xlat6.xyz = u_xlat1.xyz * vec3(u_xlat34) + _MainLightPosition.xyz;
    u_xlat38 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-37);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat6.xyz = vec3(u_xlat38) * u_xlat6.xyz;
    u_xlat38 = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
    u_xlat38 = log2(u_xlat38);
    u_xlat38 = u_xlat35 * u_xlat38;
    u_xlat38 = exp2(u_xlat38);
    u_xlat6.xyz = vec3(u_xlat38) * _SpecColor.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat5.xyz * u_xlat0.yzw + u_xlat3.xyz;
    u_xlat5.x = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu5 =  uint(int(u_xlat5.x));
    u_xlatb16.xy = equal(vec4(vec4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat6.x = float(0.0);
    u_xlat6.y = float(0.0);
    u_xlat6.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu5 ; u_xlatu_loop_1++)
    {
        u_xlatu39 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati7 = int(u_xlatu_loop_1 & 3u);
        u_xlat39 = dot(unity_LightIndices[int(u_xlatu39)], uintBitsToFloat(ImmCB_0[u_xlati7]));
        u_xlatu39 =  uint(int(u_xlat39));
        u_xlat7.xyz = (-vs_TEXCOORD1.xyz) * _AdditionalLightsPosition[int(u_xlatu39)].www + _AdditionalLightsPosition[int(u_xlatu39)].xyz;
        u_xlat40 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat40 = max(u_xlat40, 6.10351562e-05);
        u_xlat8.x = inversesqrt(u_xlat40);
        u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xxx;
        u_xlat8.x = float(1.0) / float(u_xlat40);
        u_xlat40 = u_xlat40 * _AdditionalLightsAttenuation[int(u_xlatu39)].x;
        u_xlat40 = (-u_xlat40) * u_xlat40 + 1.0;
        u_xlat40 = max(u_xlat40, 0.0);
        u_xlat40 = u_xlat40 * u_xlat40;
        u_xlat40 = u_xlat40 * u_xlat8.x;
        u_xlat8.x = dot(_AdditionalLightsSpotDir[int(u_xlatu39)].xyz, u_xlat7.xyz);
        u_xlat8.x = u_xlat8.x * _AdditionalLightsAttenuation[int(u_xlatu39)].z + _AdditionalLightsAttenuation[int(u_xlatu39)].w;
        u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
        u_xlat8.x = u_xlat8.x * u_xlat8.x;
        u_xlat40 = u_xlat40 * u_xlat8.x;
        u_xlatu8 = u_xlatu39 >> (5u & uint(0x1F));
        u_xlati19 = 1 << (int(u_xlatu39) & int(0x1F));
        u_xlati8 = int(uint(u_xlati19) & floatBitsToUint(_AdditionalLightsCookieEnableBits[int(u_xlatu8)]));
        if(u_xlati8 != 0) {
            u_xlati8 = int(_AdditionalLightsLightTypes[int(u_xlatu39)]);
            u_xlati19 = (u_xlati8 != 0) ? 0 : 1;
            u_xlati30 = int(u_xlatu39) << (2 & int(0x1F));
            if(u_xlati19 != 0) {
                u_xlat9.xyz = vs_TEXCOORD1.yyy * _AdditionalLightsWorldToLights[(u_xlati30 + 1) / 4][(u_xlati30 + 1) % 4].xyw;
                u_xlat9.xyz = _AdditionalLightsWorldToLights[u_xlati30 / 4][u_xlati30 % 4].xyw * vs_TEXCOORD1.xxx + u_xlat9.xyz;
                u_xlat9.xyz = _AdditionalLightsWorldToLights[(u_xlati30 + 2) / 4][(u_xlati30 + 2) % 4].xyw * vs_TEXCOORD1.zzz + u_xlat9.xyz;
                u_xlat9.xyz = u_xlat9.xyz + _AdditionalLightsWorldToLights[(u_xlati30 + 3) / 4][(u_xlati30 + 3) % 4].xyw;
                u_xlat19.xz = u_xlat9.xy / u_xlat9.zz;
                u_xlat19.xz = u_xlat19.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                u_xlat19.xz = clamp(u_xlat19.xz, 0.0, 1.0);
                u_xlat19.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu39)].xy * u_xlat19.xz + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu39)].zw;
            } else {
                u_xlatb8 = u_xlati8==1;
                u_xlati8 = u_xlatb8 ? 1 : int(0);
                if(u_xlati8 != 0) {
                    u_xlat9.xy = vs_TEXCOORD1.yy * _AdditionalLightsWorldToLights[(u_xlati30 + 1) / 4][(u_xlati30 + 1) % 4].xy;
                    u_xlat9.xy = _AdditionalLightsWorldToLights[u_xlati30 / 4][u_xlati30 % 4].xy * vs_TEXCOORD1.xx + u_xlat9.xy;
                    u_xlat9.xy = _AdditionalLightsWorldToLights[(u_xlati30 + 2) / 4][(u_xlati30 + 2) % 4].xy * vs_TEXCOORD1.zz + u_xlat9.xy;
                    u_xlat9.xy = u_xlat9.xy + _AdditionalLightsWorldToLights[(u_xlati30 + 3) / 4][(u_xlati30 + 3) % 4].xy;
                    u_xlat9.xy = u_xlat9.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat9.xy = fract(u_xlat9.xy);
                    u_xlat19.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu39)].xy * u_xlat9.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu39)].zw;
                } else {
                    u_xlat9 = vs_TEXCOORD1.yyyy * _AdditionalLightsWorldToLights[(u_xlati30 + 1) / 4][(u_xlati30 + 1) % 4];
                    u_xlat9 = _AdditionalLightsWorldToLights[u_xlati30 / 4][u_xlati30 % 4] * vs_TEXCOORD1.xxxx + u_xlat9;
                    u_xlat9 = _AdditionalLightsWorldToLights[(u_xlati30 + 2) / 4][(u_xlati30 + 2) % 4] * vs_TEXCOORD1.zzzz + u_xlat9;
                    u_xlat9 = u_xlat9 + _AdditionalLightsWorldToLights[(u_xlati30 + 3) / 4][(u_xlati30 + 3) % 4];
                    u_xlat9.xyz = u_xlat9.xyz / u_xlat9.www;
                    u_xlat8.x = dot(u_xlat9.xyz, u_xlat9.xyz);
                    u_xlat8.x = inversesqrt(u_xlat8.x);
                    u_xlat9.xyz = u_xlat8.xxx * u_xlat9.xyz;
                    u_xlat8.x = dot(abs(u_xlat9.xyz), vec3(1.0, 1.0, 1.0));
                    u_xlat8.x = max(u_xlat8.x, 9.99999997e-07);
                    u_xlat8.x = float(1.0) / float(u_xlat8.x);
                    u_xlat10.xyz = u_xlat8.xxx * u_xlat9.zxy;
                    u_xlat10.x = (-u_xlat10.x);
                    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
                    u_xlatb31.xy = greaterThanEqual(u_xlat10.yzyz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
                    u_xlat31.x = (u_xlatb31.x) ? u_xlat10.x : (-u_xlat10.x);
                    u_xlat31.y = (u_xlatb31.y) ? u_xlat10.x : (-u_xlat10.x);
                    u_xlat8.xz = u_xlat9.xy * u_xlat8.xx + u_xlat31.xy;
                    u_xlat8.xz = u_xlat8.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat8.xz = clamp(u_xlat8.xz, 0.0, 1.0);
                    u_xlat19.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu39)].xy * u_xlat8.xz + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu39)].zw;
                }
            }
            u_xlat8 = texture(sampler2D(_AdditionalLightsCookieAtlasTexture, sampler_AdditionalLightsCookieAtlasTexture), u_xlat19.xz, _GlobalMipBias.x);
            u_xlat41 = (u_xlatb16.y) ? u_xlat8.w : u_xlat8.x;
            u_xlat8.xyz = (u_xlatb16.x) ? u_xlat8.xyz : vec3(u_xlat41);
        } else {
            u_xlat8.x = float(1.0);
            u_xlat8.y = float(1.0);
            u_xlat8.z = float(1.0);
        }
        u_xlat8.xyz = u_xlat8.xyz * _AdditionalLightsColor[int(u_xlatu39)].xyz;
        u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
        u_xlat8.xyz = vec3(u_xlat40) * u_xlat8.xyz;
        u_xlat39 = dot(u_xlat2.xyz, u_xlat7.xyz);
        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
        u_xlat9.xyz = vec3(u_xlat39) * u_xlat8.xyz;
        u_xlat7.xyz = u_xlat1.xyz * vec3(u_xlat34) + u_xlat7.xyz;
        u_xlat39 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat39 = max(u_xlat39, 1.17549435e-37);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat7.xyz = vec3(u_xlat39) * u_xlat7.xyz;
        u_xlat39 = dot(u_xlat2.xyz, u_xlat7.xyz);
        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
        u_xlat39 = log2(u_xlat39);
        u_xlat39 = u_xlat35 * u_xlat39;
        u_xlat39 = exp2(u_xlat39);
        u_xlat7.xyz = vec3(u_xlat39) * _SpecColor.xyz;
        u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
        u_xlat7.xyz = u_xlat9.xyz * u_xlat0.yzw + u_xlat7.xyz;
        u_xlat6.xyz = u_xlat6.xyz + u_xlat7.xyz;
    }
    u_xlat11.xyz = u_xlat4.xyz * u_xlat0.yzw + u_xlat3.xyz;
    u_xlat11.xyz = u_xlat6.xyz + u_xlat11.xyz;
    u_xlat1.x = u_xlat36 * (-u_xlat36);
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat11.xyz = u_xlat11.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = u_xlat1.xxx * u_xlat11.xyz + unity_FogColor.xyz;
    u_xlatb11 = _Surface==1.0;
    SV_Target0.w = (u_xlatb11) ? u_xlat0.x : 1.0;
    return;
}

