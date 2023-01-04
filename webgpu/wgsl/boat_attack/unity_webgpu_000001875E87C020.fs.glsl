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
layout(set = 0, binding = 2) uniform mediump texture2D _BaseMap;
layout(set = 0, binding = 3) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 5) uniform mediump texture2D _MainLightCookieTexture;
layout(set = 0, binding = 6) uniform mediump texture2D _AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 7) uniform mediump texture2D _DitheringTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD1;
layout(location = 2) in highp vec3 vs_TEXCOORD2;
layout(location = 3) in highp vec4 vs_TEXCOORD6;
layout(location = 4) in highp vec2 vs_TEXCOORD8;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 8) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 9) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 10) uniform mediump  sampler sampler_BaseMap;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 12) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_MainLightCookieTexture;
layout(set = 0, binding = 14) uniform mediump  sampler sampler_AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 15) uniform mediump  sampler sampler_DitheringTexture;
void main()
{
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec4 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec3 u_xlat21;
float u_xlat25;
float u_xlat26;
bool u_xlatb26;
vec3 u_xlat27;
vec3 u_xlat28;
float u_xlat45;
vec2 u_xlat46;
vec2 u_xlat47;
int u_xlati47;
uint u_xlatu47;
bool u_xlatb47;
vec2 u_xlat48;
vec2 u_xlat49;
vec2 u_xlat51;
bvec2 u_xlatb51;
vec2 u_xlat54;
float u_xlat60;
uint u_xlatu60;
bool u_xlatb60;
float u_xlat62;
uint u_xlatu62;
float u_xlat63;
uint u_xlatu63;
bool u_xlatb63;
float u_xlat64;
float u_xlat65;
int u_xlati65;
bool u_xlatb65;
float u_xlat66;
float u_xlat67;
int u_xlati67;
float u_xlat68;
int u_xlati69;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_BaseMap, sampler_BaseMap), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat1 = u_xlat0.wxyz * _BaseColor.wxyz;
    u_xlat2.xy = hlslcc_FragCoord.xy * vec2(_DitheringTextureInvSize);
    u_xlat60 = texture(sampler2D(_DitheringTexture, sampler_DitheringTexture), u_xlat2.xy, _GlobalMipBias.x).w;
    u_xlatb2 = unity_LODFade.x>=0.0;
    u_xlat60 = (u_xlatb2) ? abs(u_xlat60) : -abs(u_xlat60);
    u_xlat60 = (-u_xlat60) + unity_LODFade.x;
    u_xlatb60 = u_xlat60<0.0;
    if(((int(u_xlatb60) * int(0xffffffffu)))!=0){discard;}
    u_xlatb60 = unity_OrthoParams.w==0.0;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat62 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat2.xyz = vec3(u_xlat62) * u_xlat2.xyz;
    u_xlat3.x = (u_xlatb60) ? u_xlat2.x : unity_MatrixV[0].z;
    u_xlat3.y = (u_xlatb60) ? u_xlat2.y : unity_MatrixV[1].z;
    u_xlat3.z = (u_xlatb60) ? u_xlat2.z : unity_MatrixV[2].z;
    u_xlat60 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat2.xyz = vec3(u_xlat60) * vs_TEXCOORD2.xyz;
    u_xlat4.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_TEXCOORD8.xy, _GlobalMipBias.x).xyz;
    u_xlat5.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat5.xy = u_xlat5.xy * hlslcc_FragCoord.xy;
    u_xlat60 = u_xlat5.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat5.z = (-u_xlat60) + 1.0;
    u_xlat60 = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat62 = (-u_xlat60) + _Smoothness;
    u_xlat21.xyz = vec3(u_xlat60) * u_xlat1.yzw;
    u_xlat0.xyz = u_xlat0.xyz * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat60 = (-_Smoothness) + 1.0;
    u_xlat63 = u_xlat60 * u_xlat60;
    u_xlat63 = max(u_xlat63, 0.0078125);
    u_xlat64 = u_xlat63 * u_xlat63;
    u_xlat62 = u_xlat62 + 1.0;
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
    u_xlat25 = u_xlat63 * 4.0 + 2.0;
    u_xlat5.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat5.xz, _GlobalMipBias.x).x;
    u_xlat45 = u_xlat5.x + -1.0;
    u_xlat45 = _AmbientOcclusionParam.w * u_xlat45 + 1.0;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlatb65 = 0.0<_MainLightShadowParams.y;
    if(u_xlatb65){
        u_xlatb65 = _MainLightShadowParams.y==1.0;
        if(u_xlatb65){
            u_xlat6 = vs_TEXCOORD6.xyxy + _MainLightShadowOffset0;
            vec3 txVec0 = vec3(u_xlat6.xy,vs_TEXCOORD6.z);
            u_xlat7.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
            vec3 txVec1 = vec3(u_xlat6.zw,vs_TEXCOORD6.z);
            u_xlat7.y = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
            u_xlat6 = vs_TEXCOORD6.xyxy + _MainLightShadowOffset1;
            vec3 txVec2 = vec3(u_xlat6.xy,vs_TEXCOORD6.z);
            u_xlat7.z = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec2, 0.0);
            vec3 txVec3 = vec3(u_xlat6.zw,vs_TEXCOORD6.z);
            u_xlat7.w = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec3, 0.0);
            u_xlat65 = dot(u_xlat7, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb6 = _MainLightShadowParams.y==2.0;
            if(u_xlatb6){
                u_xlat6.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat6.xy = floor(u_xlat6.xy);
                u_xlat46.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + (-u_xlat6.xy);
                u_xlat7 = u_xlat46.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat8 = u_xlat7.xxzz * u_xlat7.xxzz;
                u_xlat7.xz = u_xlat8.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat8.xy = u_xlat8.xz * vec2(0.5, 0.5) + (-u_xlat46.xy);
                u_xlat48.xy = (-u_xlat46.xy) + vec2(1.0, 1.0);
                u_xlat9.xy = min(u_xlat46.xy, vec2(0.0, 0.0));
                u_xlat9.xy = (-u_xlat9.xy) * u_xlat9.xy + u_xlat48.xy;
                u_xlat46.xy = max(u_xlat46.xy, vec2(0.0, 0.0));
                u_xlat46.xy = (-u_xlat46.xy) * u_xlat46.xy + u_xlat7.yw;
                u_xlat9.xy = u_xlat9.xy + vec2(1.0, 1.0);
                u_xlat46.xy = u_xlat46.xy + vec2(1.0, 1.0);
                u_xlat10.xy = u_xlat8.xy * vec2(0.159999996, 0.159999996);
                u_xlat8.xy = u_xlat48.xy * vec2(0.159999996, 0.159999996);
                u_xlat9.xy = u_xlat9.xy * vec2(0.159999996, 0.159999996);
                u_xlat11.xy = u_xlat46.xy * vec2(0.159999996, 0.159999996);
                u_xlat46.xy = u_xlat7.yw * vec2(0.159999996, 0.159999996);
                u_xlat10.z = u_xlat9.x;
                u_xlat10.w = u_xlat46.x;
                u_xlat8.z = u_xlat11.x;
                u_xlat8.w = u_xlat7.x;
                u_xlat12 = u_xlat8.zwxz + u_xlat10.zwxz;
                u_xlat9.z = u_xlat10.y;
                u_xlat9.w = u_xlat46.y;
                u_xlat11.z = u_xlat8.y;
                u_xlat11.w = u_xlat7.z;
                u_xlat7.xyz = u_xlat9.zyw + u_xlat11.zyw;
                u_xlat8.xyz = u_xlat8.xzw / u_xlat12.zwy;
                u_xlat8.xyz = u_xlat8.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat9.xyz = u_xlat11.zyw / u_xlat7.xyz;
                u_xlat9.xyz = u_xlat9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat8.xyz = u_xlat8.yxz * _MainLightShadowmapSize.xxx;
                u_xlat9.xyz = u_xlat9.xyz * _MainLightShadowmapSize.yyy;
                u_xlat8.w = u_xlat9.x;
                u_xlat10 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.ywxw;
                u_xlat46.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat8.zw;
                u_xlat9.w = u_xlat8.y;
                u_xlat8.yw = u_xlat9.yz;
                u_xlat11 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyzy;
                u_xlat9 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.wywz;
                u_xlat8 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xwzw;
                u_xlat13 = u_xlat7.xxxy * u_xlat12.zwyz;
                u_xlat14 = u_xlat7.yyzz * u_xlat12;
                u_xlat6.x = u_xlat7.z * u_xlat12.y;
                vec3 txVec4 = vec3(u_xlat10.xy,vs_TEXCOORD6.z);
                u_xlat26 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat10.zw,vs_TEXCOORD6.z);
                u_xlat7.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec5, 0.0);
                u_xlat7.x = u_xlat7.x * u_xlat13.y;
                u_xlat26 = u_xlat13.x * u_xlat26 + u_xlat7.x;
                vec3 txVec6 = vec3(u_xlat46.xy,vs_TEXCOORD6.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec6, 0.0);
                u_xlat26 = u_xlat13.z * u_xlat46.x + u_xlat26;
                vec3 txVec7 = vec3(u_xlat9.xy,vs_TEXCOORD6.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec7, 0.0);
                u_xlat26 = u_xlat13.w * u_xlat46.x + u_xlat26;
                vec3 txVec8 = vec3(u_xlat11.xy,vs_TEXCOORD6.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec8, 0.0);
                u_xlat26 = u_xlat14.x * u_xlat46.x + u_xlat26;
                vec3 txVec9 = vec3(u_xlat11.zw,vs_TEXCOORD6.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec9, 0.0);
                u_xlat26 = u_xlat14.y * u_xlat46.x + u_xlat26;
                vec3 txVec10 = vec3(u_xlat9.zw,vs_TEXCOORD6.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec10, 0.0);
                u_xlat26 = u_xlat14.z * u_xlat46.x + u_xlat26;
                vec3 txVec11 = vec3(u_xlat8.xy,vs_TEXCOORD6.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec11, 0.0);
                u_xlat26 = u_xlat14.w * u_xlat46.x + u_xlat26;
                vec3 txVec12 = vec3(u_xlat8.zw,vs_TEXCOORD6.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec12, 0.0);
                u_xlat65 = u_xlat6.x * u_xlat46.x + u_xlat26;
            } else {
                u_xlat6.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat6.xy = floor(u_xlat6.xy);
                u_xlat46.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + (-u_xlat6.xy);
                u_xlat7 = u_xlat46.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat8 = u_xlat7.xxzz * u_xlat7.xxzz;
                u_xlat9.yw = u_xlat8.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat7.xz = u_xlat8.xz * vec2(0.5, 0.5) + (-u_xlat46.xy);
                u_xlat8.xy = (-u_xlat46.xy) + vec2(1.0, 1.0);
                u_xlat48.xy = min(u_xlat46.xy, vec2(0.0, 0.0));
                u_xlat8.xy = (-u_xlat48.xy) * u_xlat48.xy + u_xlat8.xy;
                u_xlat48.xy = max(u_xlat46.xy, vec2(0.0, 0.0));
                u_xlat27.xz = (-u_xlat48.xy) * u_xlat48.xy + u_xlat7.yw;
                u_xlat8.xy = u_xlat8.xy + vec2(2.0, 2.0);
                u_xlat7.yw = u_xlat27.xz + vec2(2.0, 2.0);
                u_xlat10.z = u_xlat7.y * 0.0816320032;
                u_xlat11.xyz = u_xlat7.zxw * vec3(0.0816320032, 0.0816320032, 0.0816320032);
                u_xlat7.xy = u_xlat8.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat10.x = u_xlat11.y;
                u_xlat10.yw = u_xlat46.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat8.xz = u_xlat46.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat8.y = u_xlat7.x;
                u_xlat8.w = u_xlat9.y;
                u_xlat10 = u_xlat8 + u_xlat10;
                u_xlat11.yw = u_xlat46.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat9.xz = u_xlat46.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat9.y = u_xlat7.y;
                u_xlat7 = u_xlat9 + u_xlat11;
                u_xlat8 = u_xlat8 / u_xlat10;
                u_xlat8 = u_xlat8 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat9 = u_xlat9 / u_xlat7;
                u_xlat9 = u_xlat9 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat8 = u_xlat8.wxyz * _MainLightShadowmapSize.xxxx;
                u_xlat9 = u_xlat9.xwyz * _MainLightShadowmapSize.yyyy;
                u_xlat11.xzw = u_xlat8.yzw;
                u_xlat11.y = u_xlat9.x;
                u_xlat12 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat11.xyzy;
                u_xlat46.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat11.wy;
                u_xlat8.y = u_xlat11.y;
                u_xlat11.y = u_xlat9.z;
                u_xlat13 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat11.xyzy;
                u_xlat14.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat11.wy;
                u_xlat8.z = u_xlat11.y;
                u_xlat15 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyxz;
                u_xlat11.y = u_xlat9.w;
                u_xlat16 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat11.xyzy;
                u_xlat28.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat11.wy;
                u_xlat8.w = u_xlat11.y;
                u_xlat54.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat8.xw;
                u_xlat9.xzw = u_xlat11.xzw;
                u_xlat11 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xyzy;
                u_xlat49.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat9.wy;
                u_xlat9.x = u_xlat8.x;
                u_xlat6.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat9.xy;
                u_xlat17 = u_xlat7.xxxx * u_xlat10;
                u_xlat18 = u_xlat7.yyyy * u_xlat10;
                u_xlat19 = u_xlat7.zzzz * u_xlat10;
                u_xlat7 = u_xlat7.wwww * u_xlat10;
                vec3 txVec13 = vec3(u_xlat12.xy,vs_TEXCOORD6.z);
                u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat12.zw,vs_TEXCOORD6.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec14, 0.0);
                u_xlat68 = u_xlat68 * u_xlat17.y;
                u_xlat8.x = u_xlat17.x * u_xlat8.x + u_xlat68;
                vec3 txVec15 = vec3(u_xlat46.xy,vs_TEXCOORD6.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec15, 0.0);
                u_xlat46.x = u_xlat17.z * u_xlat46.x + u_xlat8.x;
                vec3 txVec16 = vec3(u_xlat15.xy,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec16, 0.0);
                u_xlat46.x = u_xlat17.w * u_xlat66 + u_xlat46.x;
                vec3 txVec17 = vec3(u_xlat13.xy,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec17, 0.0);
                u_xlat46.x = u_xlat18.x * u_xlat66 + u_xlat46.x;
                vec3 txVec18 = vec3(u_xlat13.zw,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec18, 0.0);
                u_xlat46.x = u_xlat18.y * u_xlat66 + u_xlat46.x;
                vec3 txVec19 = vec3(u_xlat14.xy,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec19, 0.0);
                u_xlat46.x = u_xlat18.z * u_xlat66 + u_xlat46.x;
                vec3 txVec20 = vec3(u_xlat15.zw,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec20, 0.0);
                u_xlat46.x = u_xlat18.w * u_xlat66 + u_xlat46.x;
                vec3 txVec21 = vec3(u_xlat16.xy,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec21, 0.0);
                u_xlat46.x = u_xlat19.x * u_xlat66 + u_xlat46.x;
                vec3 txVec22 = vec3(u_xlat16.zw,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec22, 0.0);
                u_xlat46.x = u_xlat19.y * u_xlat66 + u_xlat46.x;
                vec3 txVec23 = vec3(u_xlat28.xy,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec23, 0.0);
                u_xlat46.x = u_xlat19.z * u_xlat66 + u_xlat46.x;
                vec3 txVec24 = vec3(u_xlat54.xy,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec24, 0.0);
                u_xlat46.x = u_xlat19.w * u_xlat66 + u_xlat46.x;
                vec3 txVec25 = vec3(u_xlat11.xy,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec25, 0.0);
                u_xlat46.x = u_xlat7.x * u_xlat66 + u_xlat46.x;
                vec3 txVec26 = vec3(u_xlat11.zw,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec26, 0.0);
                u_xlat46.x = u_xlat7.y * u_xlat66 + u_xlat46.x;
                vec3 txVec27 = vec3(u_xlat49.xy,vs_TEXCOORD6.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec27, 0.0);
                u_xlat46.x = u_xlat7.z * u_xlat66 + u_xlat46.x;
                vec3 txVec28 = vec3(u_xlat6.xy,vs_TEXCOORD6.z);
                u_xlat6.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec28, 0.0);
                u_xlat65 = u_xlat7.w * u_xlat6.x + u_xlat46.x;
            }
        }
    } else {
        vec3 txVec29 = vec3(vs_TEXCOORD6.xy,vs_TEXCOORD6.z);
        u_xlat65 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec29, 0.0);
    }
    u_xlat6.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat65 = u_xlat65 * _MainLightShadowParams.x + u_xlat6.x;
    u_xlatb6 = 0.0>=vs_TEXCOORD6.z;
    u_xlatb26 = vs_TEXCOORD6.z>=1.0;
    u_xlatb6 = u_xlatb26 || u_xlatb6;
    u_xlat65 = (u_xlatb6) ? 1.0 : u_xlat65;
    u_xlat6.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat6.x = u_xlat6.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat26 = (-u_xlat65) + 1.0;
    u_xlat65 = u_xlat6.x * u_xlat26 + u_xlat65;
    u_xlatb6 = _MainLightCookieTextureFormat!=-1.0;
    if(u_xlatb6){
        u_xlat6.xy = vs_TEXCOORD1.yy * _MainLightWorldToLight[1].xy;
        u_xlat6.xy = _MainLightWorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat6.xy;
        u_xlat6.xy = _MainLightWorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat6.xy;
        u_xlat6.xy = u_xlat6.xy + _MainLightWorldToLight[3].xy;
        u_xlat6.xy = u_xlat6.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat6 = texture(sampler2D(_MainLightCookieTexture, sampler_MainLightCookieTexture), u_xlat6.xy, _GlobalMipBias.x);
        u_xlatb7.xy = equal(vec4(vec4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat66 = (u_xlatb7.y) ? u_xlat6.w : u_xlat6.x;
        u_xlat6.xyz = (u_xlatb7.x) ? u_xlat6.xyz : vec3(u_xlat66);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
    }
    u_xlat6.xyz = u_xlat6.xyz * _MainLightColor.xyz;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat66 = dot((-u_xlat3.xyz), u_xlat2.xyz);
    u_xlat66 = u_xlat66 + u_xlat66;
    u_xlat7.xyz = u_xlat2.xyz * (-vec3(u_xlat66)) + (-u_xlat3.xyz);
    u_xlat66 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
    u_xlat66 = (-u_xlat66) + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat67 = (-u_xlat60) * 0.699999988 + 1.70000005;
    u_xlat60 = u_xlat60 * u_xlat67;
    u_xlat60 = u_xlat60 * 6.0;
    u_xlat7 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat7.xyz, u_xlat60);
    u_xlat60 = u_xlat7.w + -1.0;
    u_xlat60 = unity_SpecCube0_HDR.w * u_xlat60 + 1.0;
    u_xlat60 = max(u_xlat60, 0.0);
    u_xlat60 = log2(u_xlat60);
    u_xlat60 = u_xlat60 * unity_SpecCube0_HDR.y;
    u_xlat60 = exp2(u_xlat60);
    u_xlat60 = u_xlat60 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat60);
    u_xlat8.xy = vec2(u_xlat63) * vec2(u_xlat63) + vec2(-1.0, 1.0);
    u_xlat60 = float(1.0) / u_xlat8.y;
    u_xlat28.xyz = (-u_xlat0.xyz) + vec3(u_xlat62);
    u_xlat28.xyz = vec3(u_xlat66) * u_xlat28.xyz + u_xlat0.xyz;
    u_xlat28.xyz = vec3(u_xlat60) * u_xlat28.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat28.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat21.xyz + u_xlat7.xyz;
    u_xlat60 = u_xlat65 * unity_LightData.z;
    u_xlat62 = dot(u_xlat2.xyz, _MainLightPosition.xyz);
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
    u_xlat60 = u_xlat60 * u_xlat62;
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat3.xyz + _MainLightPosition.xyz;
    u_xlat60 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat60 = max(u_xlat60, 1.17549435e-37);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat7.xyz = vec3(u_xlat60) * u_xlat7.xyz;
    u_xlat60 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
    u_xlat62 = dot(_MainLightPosition.xyz, u_xlat7.xyz);
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
    u_xlat60 = u_xlat60 * u_xlat60;
    u_xlat60 = u_xlat60 * u_xlat8.x + 1.00001001;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat60 = u_xlat60 * u_xlat60;
    u_xlat62 = max(u_xlat62, 0.100000001);
    u_xlat60 = u_xlat60 * u_xlat62;
    u_xlat60 = u_xlat25 * u_xlat60;
    u_xlat60 = u_xlat64 / u_xlat60;
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat60) + u_xlat21.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat60 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu60 =  uint(int(u_xlat60));
    u_xlatb7.xy = equal(vec4(vec4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat28.x = float(0.0);
    u_xlat28.y = float(0.0);
    u_xlat28.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu60 ; u_xlatu_loop_1++)
    {
        u_xlatu63 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati65 = int(u_xlatu_loop_1 & 3u);
        u_xlat63 = dot(unity_LightIndices[int(u_xlatu63)], uintBitsToFloat(ImmCB_0[u_xlati65]));
        u_xlatu63 =  uint(int(u_xlat63));
        u_xlat9.xyz = (-vs_TEXCOORD1.xyz) * _AdditionalLightsPosition[int(u_xlatu63)].www + _AdditionalLightsPosition[int(u_xlatu63)].xyz;
        u_xlat65 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat65 = max(u_xlat65, 6.10351562e-05);
        u_xlat66 = inversesqrt(u_xlat65);
        u_xlat10.xyz = vec3(u_xlat66) * u_xlat9.xyz;
        u_xlat47.x = float(1.0) / float(u_xlat65);
        u_xlat65 = u_xlat65 * _AdditionalLightsAttenuation[int(u_xlatu63)].x;
        u_xlat65 = (-u_xlat65) * u_xlat65 + 1.0;
        u_xlat65 = max(u_xlat65, 0.0);
        u_xlat65 = u_xlat65 * u_xlat65;
        u_xlat65 = u_xlat65 * u_xlat47.x;
        u_xlat47.x = dot(_AdditionalLightsSpotDir[int(u_xlatu63)].xyz, u_xlat10.xyz);
        u_xlat47.x = u_xlat47.x * _AdditionalLightsAttenuation[int(u_xlatu63)].z + _AdditionalLightsAttenuation[int(u_xlatu63)].w;
        u_xlat47.x = clamp(u_xlat47.x, 0.0, 1.0);
        u_xlat47.x = u_xlat47.x * u_xlat47.x;
        u_xlat65 = u_xlat65 * u_xlat47.x;
        u_xlatu47 = u_xlatu63 >> (5u & uint(0x1F));
        u_xlati67 = 1 << (int(u_xlatu63) & int(0x1F));
        u_xlati47 = int(uint(u_xlati67) & floatBitsToUint(_AdditionalLightsCookieEnableBits[int(u_xlatu47)]));
        if(u_xlati47 != 0) {
            u_xlati47 = int(_AdditionalLightsLightTypes[int(u_xlatu63)]);
            u_xlati67 = (u_xlati47 != 0) ? 0 : 1;
            u_xlati69 = int(u_xlatu63) << (2 & int(0x1F));
            if(u_xlati67 != 0) {
                u_xlat11.xyz = vs_TEXCOORD1.yyy * _AdditionalLightsWorldToLights[(u_xlati69 + 1) / 4][(u_xlati69 + 1) % 4].xyw;
                u_xlat11.xyz = _AdditionalLightsWorldToLights[u_xlati69 / 4][u_xlati69 % 4].xyw * vs_TEXCOORD1.xxx + u_xlat11.xyz;
                u_xlat11.xyz = _AdditionalLightsWorldToLights[(u_xlati69 + 2) / 4][(u_xlati69 + 2) % 4].xyw * vs_TEXCOORD1.zzz + u_xlat11.xyz;
                u_xlat11.xyz = u_xlat11.xyz + _AdditionalLightsWorldToLights[(u_xlati69 + 3) / 4][(u_xlati69 + 3) % 4].xyw;
                u_xlat11.xy = u_xlat11.xy / u_xlat11.zz;
                u_xlat11.xy = u_xlat11.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
                u_xlat11.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu63)].xy * u_xlat11.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu63)].zw;
            } else {
                u_xlatb47 = u_xlati47==1;
                u_xlati47 = u_xlatb47 ? 1 : int(0);
                if(u_xlati47 != 0) {
                    u_xlat47.xy = vs_TEXCOORD1.yy * _AdditionalLightsWorldToLights[(u_xlati69 + 1) / 4][(u_xlati69 + 1) % 4].xy;
                    u_xlat47.xy = _AdditionalLightsWorldToLights[u_xlati69 / 4][u_xlati69 % 4].xy * vs_TEXCOORD1.xx + u_xlat47.xy;
                    u_xlat47.xy = _AdditionalLightsWorldToLights[(u_xlati69 + 2) / 4][(u_xlati69 + 2) % 4].xy * vs_TEXCOORD1.zz + u_xlat47.xy;
                    u_xlat47.xy = u_xlat47.xy + _AdditionalLightsWorldToLights[(u_xlati69 + 3) / 4][(u_xlati69 + 3) % 4].xy;
                    u_xlat47.xy = u_xlat47.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat47.xy = fract(u_xlat47.xy);
                    u_xlat11.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu63)].xy * u_xlat47.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu63)].zw;
                } else {
                    u_xlat12 = vs_TEXCOORD1.yyyy * _AdditionalLightsWorldToLights[(u_xlati69 + 1) / 4][(u_xlati69 + 1) % 4];
                    u_xlat12 = _AdditionalLightsWorldToLights[u_xlati69 / 4][u_xlati69 % 4] * vs_TEXCOORD1.xxxx + u_xlat12;
                    u_xlat12 = _AdditionalLightsWorldToLights[(u_xlati69 + 2) / 4][(u_xlati69 + 2) % 4] * vs_TEXCOORD1.zzzz + u_xlat12;
                    u_xlat12 = u_xlat12 + _AdditionalLightsWorldToLights[(u_xlati69 + 3) / 4][(u_xlati69 + 3) % 4];
                    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
                    u_xlat47.x = dot(u_xlat12.xyz, u_xlat12.xyz);
                    u_xlat47.x = inversesqrt(u_xlat47.x);
                    u_xlat12.xyz = u_xlat47.xxx * u_xlat12.xyz;
                    u_xlat47.x = dot(abs(u_xlat12.xyz), vec3(1.0, 1.0, 1.0));
                    u_xlat47.x = max(u_xlat47.x, 9.99999997e-07);
                    u_xlat47.x = float(1.0) / float(u_xlat47.x);
                    u_xlat13.xyz = u_xlat47.xxx * u_xlat12.zxy;
                    u_xlat13.x = (-u_xlat13.x);
                    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
                    u_xlatb51.xy = greaterThanEqual(u_xlat13.yzyz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
                    u_xlat51.x = (u_xlatb51.x) ? u_xlat13.x : (-u_xlat13.x);
                    u_xlat51.y = (u_xlatb51.y) ? u_xlat13.x : (-u_xlat13.x);
                    u_xlat47.xy = u_xlat12.xy * u_xlat47.xx + u_xlat51.xy;
                    u_xlat47.xy = u_xlat47.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat47.xy = clamp(u_xlat47.xy, 0.0, 1.0);
                    u_xlat11.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu63)].xy * u_xlat47.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu63)].zw;
                }
            }
            u_xlat11 = texture(sampler2D(_AdditionalLightsCookieAtlasTexture, sampler_AdditionalLightsCookieAtlasTexture), u_xlat11.xy, _GlobalMipBias.x);
            u_xlat47.x = (u_xlatb7.y) ? u_xlat11.w : u_xlat11.x;
            u_xlat11.xyz = (u_xlatb7.x) ? u_xlat11.xyz : u_xlat47.xxx;
        } else {
            u_xlat11.x = float(1.0);
            u_xlat11.y = float(1.0);
            u_xlat11.z = float(1.0);
        }
        u_xlat11.xyz = u_xlat11.xyz * _AdditionalLightsColor[int(u_xlatu63)].xyz;
        u_xlat11.xyz = vec3(u_xlat45) * u_xlat11.xyz;
        u_xlat63 = dot(u_xlat2.xyz, u_xlat10.xyz);
        u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
        u_xlat63 = u_xlat63 * u_xlat65;
        u_xlat11.xyz = vec3(u_xlat63) * u_xlat11.xyz;
        u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat66) + u_xlat3.xyz;
        u_xlat63 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat63 = max(u_xlat63, 1.17549435e-37);
        u_xlat63 = inversesqrt(u_xlat63);
        u_xlat9.xyz = vec3(u_xlat63) * u_xlat9.xyz;
        u_xlat63 = dot(u_xlat2.xyz, u_xlat9.xyz);
        u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
        u_xlat65 = dot(u_xlat10.xyz, u_xlat9.xyz);
        u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
        u_xlat63 = u_xlat63 * u_xlat63;
        u_xlat63 = u_xlat63 * u_xlat8.x + 1.00001001;
        u_xlat65 = u_xlat65 * u_xlat65;
        u_xlat63 = u_xlat63 * u_xlat63;
        u_xlat65 = max(u_xlat65, 0.100000001);
        u_xlat63 = u_xlat63 * u_xlat65;
        u_xlat63 = u_xlat25 * u_xlat63;
        u_xlat63 = u_xlat64 / u_xlat63;
        u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat63) + u_xlat21.xyz;
        u_xlat28.xyz = u_xlat9.xyz * u_xlat11.xyz + u_xlat28.xyz;
    }
    u_xlat0.xyz = u_xlat4.xyz * u_xlat5.xxx + u_xlat6.xyz;
    SV_Target0.xyz = u_xlat28.xyz + u_xlat0.xyz;
    u_xlatb0 = _Surface==1.0;
    SV_Target0.w = (u_xlatb0) ? u_xlat1.x : 1.0;
    return;
}

