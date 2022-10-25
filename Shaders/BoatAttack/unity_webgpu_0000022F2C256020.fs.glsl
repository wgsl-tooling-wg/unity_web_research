#version 440
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shading_language_420pack : require
#ifdef GL_ARB_derivative_control
#extension GL_ARB_derivative_control : enable
#endif

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
	vec2 _GlobalMipBias;
	float _AlphaToMaskAvailable;
	vec4 _MainLightPosition;
	vec4 _MainLightColor;
	vec4 _AdditionalLightsCount;
	vec3 _WorldSpaceCameraPos;
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
layout(set = 0, binding = 0) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 1) uniform mediump texture2D _BaseMap;
layout(set = 0, binding = 2) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightCookieTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 5) uniform mediump texture2D _DitheringTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD1;
layout(location = 2) in highp vec3 vs_TEXCOORD2;
layout(location = 3) in highp vec4 vs_TEXCOORD6;
layout(location = 4) in highp vec2 vs_TEXCOORD7;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 6) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 7) uniform mediump  sampler sampler_BaseMap;
layout(set = 0, binding = 8) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 9) uniform mediump  sampler sampler_MainLightCookieTexture;
layout(set = 0, binding = 10) uniform mediump  sampler sampler_AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_DitheringTexture;
void main()
{
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
uint u_xlatu1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
bvec2 u_xlatb5;
vec4 u_xlat6;
vec4 u_xlat7;
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
vec3 u_xlat18;
uint u_xlatu18;
bool u_xlatb18;
vec3 u_xlat23;
vec2 u_xlat24;
float u_xlat36;
bool u_xlatb36;
vec2 u_xlat40;
vec2 u_xlat41;
int u_xlati41;
bvec2 u_xlatb41;
vec2 u_xlat42;
vec2 u_xlat43;
vec2 u_xlat44;
vec2 u_xlat48;
float u_xlat54;
uint u_xlatu54;
bool u_xlatb54;
float u_xlat56;
int u_xlati56;
float u_xlat57;
int u_xlati57;
uint u_xlatu57;
bool u_xlatb57;
int u_xlati58;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_BaseMap, sampler_BaseMap), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat1 = u_xlat0.wxyz * _BaseColor.wxyz;
    u_xlatb0 = u_xlat1.x>=_Cutoff;
    u_xlat0.x = u_xlatb0 ? u_xlat1.x : float(0.0);
    u_xlat18.x = u_xlat0.w * _BaseColor.w + (-_Cutoff);
    u_xlat36 = dFdxCoarse(u_xlat1.x);
    u_xlat54 = dFdyCoarse(u_xlat1.x);
    u_xlat36 = abs(u_xlat54) + abs(u_xlat36);
    u_xlat36 = max(u_xlat36, 9.99999975e-05);
    u_xlat18.x = u_xlat18.x / u_xlat36;
    u_xlat18.x = u_xlat18.x + 0.5;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlatb36 = _AlphaToMaskAvailable!=0.0;
    u_xlat0.x = (u_xlatb36) ? u_xlat18.x : u_xlat0.x;
    u_xlat18.x = u_xlat0.x + -9.99999975e-05;
    u_xlatb18 = u_xlat18.x<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat18.xz = hlslcc_FragCoord.xy * vec2(_DitheringTextureInvSize);
    u_xlat18.x = texture(sampler2D(_DitheringTexture, sampler_DitheringTexture), u_xlat18.xz, _GlobalMipBias.x).w;
    u_xlatb54 = unity_LODFade.x>=0.0;
    u_xlat18.x = (u_xlatb54) ? abs(u_xlat18.x) : -abs(u_xlat18.x);
    u_xlat18.x = (-u_xlat18.x) + unity_LODFade.x;
    u_xlatb18 = u_xlat18.x<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat18.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat2.xyz = u_xlat18.xxx * vs_TEXCOORD2.xyz;
    u_xlat3.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_TEXCOORD7.xy, _GlobalMipBias.x).xyz;
    u_xlatb18 = 0.0<_MainLightShadowParams.y;
    if(u_xlatb18){
        u_xlatb18 = _MainLightShadowParams.y==1.0;
        if(u_xlatb18){
            u_xlat4 = vs_TEXCOORD6.xyxy + _MainLightShadowOffset0;
            vec3 txVec0 = vec3(u_xlat4.xy,vs_TEXCOORD6.z);
            u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
            vec3 txVec1 = vec3(u_xlat4.zw,vs_TEXCOORD6.z);
            u_xlat5.y = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
            u_xlat4 = vs_TEXCOORD6.xyxy + _MainLightShadowOffset1;
            vec3 txVec2 = vec3(u_xlat4.xy,vs_TEXCOORD6.z);
            u_xlat5.z = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec2, 0.0);
            vec3 txVec3 = vec3(u_xlat4.zw,vs_TEXCOORD6.z);
            u_xlat5.w = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec3, 0.0);
            u_xlat18.x = dot(u_xlat5, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb54 = _MainLightShadowParams.y==2.0;
            if(u_xlatb54){
                u_xlat4.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat4.xy = floor(u_xlat4.xy);
                u_xlat40.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + (-u_xlat4.xy);
                u_xlat5 = u_xlat40.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat6 = u_xlat5.xxzz * u_xlat5.xxzz;
                u_xlat5.xz = u_xlat6.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat6.xy = u_xlat6.xz * vec2(0.5, 0.5) + (-u_xlat40.xy);
                u_xlat42.xy = (-u_xlat40.xy) + vec2(1.0, 1.0);
                u_xlat7.xy = min(u_xlat40.xy, vec2(0.0, 0.0));
                u_xlat7.xy = (-u_xlat7.xy) * u_xlat7.xy + u_xlat42.xy;
                u_xlat40.xy = max(u_xlat40.xy, vec2(0.0, 0.0));
                u_xlat40.xy = (-u_xlat40.xy) * u_xlat40.xy + u_xlat5.yw;
                u_xlat7.xy = u_xlat7.xy + vec2(1.0, 1.0);
                u_xlat40.xy = u_xlat40.xy + vec2(1.0, 1.0);
                u_xlat8.xy = u_xlat6.xy * vec2(0.159999996, 0.159999996);
                u_xlat6.xy = u_xlat42.xy * vec2(0.159999996, 0.159999996);
                u_xlat7.xy = u_xlat7.xy * vec2(0.159999996, 0.159999996);
                u_xlat9.xy = u_xlat40.xy * vec2(0.159999996, 0.159999996);
                u_xlat40.xy = u_xlat5.yw * vec2(0.159999996, 0.159999996);
                u_xlat8.z = u_xlat7.x;
                u_xlat8.w = u_xlat40.x;
                u_xlat6.z = u_xlat9.x;
                u_xlat6.w = u_xlat5.x;
                u_xlat10 = u_xlat6.zwxz + u_xlat8.zwxz;
                u_xlat7.z = u_xlat8.y;
                u_xlat7.w = u_xlat40.y;
                u_xlat9.z = u_xlat6.y;
                u_xlat9.w = u_xlat5.z;
                u_xlat5.xyz = u_xlat7.zyw + u_xlat9.zyw;
                u_xlat6.xyz = u_xlat6.xzw / u_xlat10.zwy;
                u_xlat6.xyz = u_xlat6.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat7.xyz = u_xlat9.zyw / u_xlat5.xyz;
                u_xlat7.xyz = u_xlat7.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat6.xyz = u_xlat6.yxz * _MainLightShadowmapSize.xxx;
                u_xlat7.xyz = u_xlat7.xyz * _MainLightShadowmapSize.yyy;
                u_xlat6.w = u_xlat7.x;
                u_xlat8 = u_xlat4.xyxy * _MainLightShadowmapSize.xyxy + u_xlat6.ywxw;
                u_xlat40.xy = u_xlat4.xy * _MainLightShadowmapSize.xy + u_xlat6.zw;
                u_xlat7.w = u_xlat6.y;
                u_xlat6.yw = u_xlat7.yz;
                u_xlat9 = u_xlat4.xyxy * _MainLightShadowmapSize.xyxy + u_xlat6.xyzy;
                u_xlat7 = u_xlat4.xyxy * _MainLightShadowmapSize.xyxy + u_xlat7.wywz;
                u_xlat6 = u_xlat4.xyxy * _MainLightShadowmapSize.xyxy + u_xlat6.xwzw;
                u_xlat11 = u_xlat5.xxxy * u_xlat10.zwyz;
                u_xlat12 = u_xlat5.yyzz * u_xlat10;
                u_xlat54 = u_xlat5.z * u_xlat10.y;
                vec3 txVec4 = vec3(u_xlat8.xy,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat8.zw,vs_TEXCOORD6.z);
                u_xlat56 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec5, 0.0);
                u_xlat56 = u_xlat56 * u_xlat11.y;
                u_xlat1.x = u_xlat11.x * u_xlat1.x + u_xlat56;
                vec3 txVec6 = vec3(u_xlat40.xy,vs_TEXCOORD6.z);
                u_xlat56 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec6, 0.0);
                u_xlat1.x = u_xlat11.z * u_xlat56 + u_xlat1.x;
                vec3 txVec7 = vec3(u_xlat7.xy,vs_TEXCOORD6.z);
                u_xlat56 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec7, 0.0);
                u_xlat1.x = u_xlat11.w * u_xlat56 + u_xlat1.x;
                vec3 txVec8 = vec3(u_xlat9.xy,vs_TEXCOORD6.z);
                u_xlat56 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec8, 0.0);
                u_xlat1.x = u_xlat12.x * u_xlat56 + u_xlat1.x;
                vec3 txVec9 = vec3(u_xlat9.zw,vs_TEXCOORD6.z);
                u_xlat56 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec9, 0.0);
                u_xlat1.x = u_xlat12.y * u_xlat56 + u_xlat1.x;
                vec3 txVec10 = vec3(u_xlat7.zw,vs_TEXCOORD6.z);
                u_xlat56 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec10, 0.0);
                u_xlat1.x = u_xlat12.z * u_xlat56 + u_xlat1.x;
                vec3 txVec11 = vec3(u_xlat6.xy,vs_TEXCOORD6.z);
                u_xlat56 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec11, 0.0);
                u_xlat1.x = u_xlat12.w * u_xlat56 + u_xlat1.x;
                vec3 txVec12 = vec3(u_xlat6.zw,vs_TEXCOORD6.z);
                u_xlat56 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec12, 0.0);
                u_xlat18.x = u_xlat54 * u_xlat56 + u_xlat1.x;
            } else {
                u_xlat4.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat4.xy = floor(u_xlat4.xy);
                u_xlat40.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + (-u_xlat4.xy);
                u_xlat5 = u_xlat40.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat6 = u_xlat5.xxzz * u_xlat5.xxzz;
                u_xlat7.yw = u_xlat6.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat5.xz = u_xlat6.xz * vec2(0.5, 0.5) + (-u_xlat40.xy);
                u_xlat6.xy = (-u_xlat40.xy) + vec2(1.0, 1.0);
                u_xlat42.xy = min(u_xlat40.xy, vec2(0.0, 0.0));
                u_xlat6.xy = (-u_xlat42.xy) * u_xlat42.xy + u_xlat6.xy;
                u_xlat42.xy = max(u_xlat40.xy, vec2(0.0, 0.0));
                u_xlat23.xz = (-u_xlat42.xy) * u_xlat42.xy + u_xlat5.yw;
                u_xlat6.xy = u_xlat6.xy + vec2(2.0, 2.0);
                u_xlat5.yw = u_xlat23.xz + vec2(2.0, 2.0);
                u_xlat8.z = u_xlat5.y * 0.0816320032;
                u_xlat9.xyz = u_xlat5.zxw * vec3(0.0816320032, 0.0816320032, 0.0816320032);
                u_xlat5.xy = u_xlat6.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat8.x = u_xlat9.y;
                u_xlat8.yw = u_xlat40.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat6.xz = u_xlat40.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat6.y = u_xlat5.x;
                u_xlat6.w = u_xlat7.y;
                u_xlat8 = u_xlat6 + u_xlat8;
                u_xlat9.yw = u_xlat40.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat7.xz = u_xlat40.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat7.y = u_xlat5.y;
                u_xlat5 = u_xlat7 + u_xlat9;
                u_xlat6 = u_xlat6 / u_xlat8;
                u_xlat6 = u_xlat6 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat7 = u_xlat7 / u_xlat5;
                u_xlat7 = u_xlat7 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat6 = u_xlat6.wxyz * _MainLightShadowmapSize.xxxx;
                u_xlat7 = u_xlat7.xwyz * _MainLightShadowmapSize.yyyy;
                u_xlat9.xzw = u_xlat6.yzw;
                u_xlat9.y = u_xlat7.x;
                u_xlat10 = u_xlat4.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xyzy;
                u_xlat40.xy = u_xlat4.xy * _MainLightShadowmapSize.xy + u_xlat9.wy;
                u_xlat6.y = u_xlat9.y;
                u_xlat9.y = u_xlat7.z;
                u_xlat11 = u_xlat4.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xyzy;
                u_xlat12.xy = u_xlat4.xy * _MainLightShadowmapSize.xy + u_xlat9.wy;
                u_xlat6.z = u_xlat9.y;
                u_xlat13 = u_xlat4.xyxy * _MainLightShadowmapSize.xyxy + u_xlat6.xyxz;
                u_xlat9.y = u_xlat7.w;
                u_xlat14 = u_xlat4.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xyzy;
                u_xlat24.xy = u_xlat4.xy * _MainLightShadowmapSize.xy + u_xlat9.wy;
                u_xlat6.w = u_xlat9.y;
                u_xlat48.xy = u_xlat4.xy * _MainLightShadowmapSize.xy + u_xlat6.xw;
                u_xlat7.xzw = u_xlat9.xzw;
                u_xlat9 = u_xlat4.xyxy * _MainLightShadowmapSize.xyxy + u_xlat7.xyzy;
                u_xlat43.xy = u_xlat4.xy * _MainLightShadowmapSize.xy + u_xlat7.wy;
                u_xlat7.x = u_xlat6.x;
                u_xlat4.xy = u_xlat4.xy * _MainLightShadowmapSize.xy + u_xlat7.xy;
                u_xlat15 = u_xlat5.xxxx * u_xlat8;
                u_xlat16 = u_xlat5.yyyy * u_xlat8;
                u_xlat17 = u_xlat5.zzzz * u_xlat8;
                u_xlat5 = u_xlat5.wwww * u_xlat8;
                vec3 txVec13 = vec3(u_xlat10.xy,vs_TEXCOORD6.z);
                u_xlat54 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat10.zw,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec14, 0.0);
                u_xlat1.x = u_xlat1.x * u_xlat15.y;
                u_xlat54 = u_xlat15.x * u_xlat54 + u_xlat1.x;
                vec3 txVec15 = vec3(u_xlat40.xy,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec15, 0.0);
                u_xlat54 = u_xlat15.z * u_xlat1.x + u_xlat54;
                vec3 txVec16 = vec3(u_xlat13.xy,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec16, 0.0);
                u_xlat54 = u_xlat15.w * u_xlat1.x + u_xlat54;
                vec3 txVec17 = vec3(u_xlat11.xy,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec17, 0.0);
                u_xlat54 = u_xlat16.x * u_xlat1.x + u_xlat54;
                vec3 txVec18 = vec3(u_xlat11.zw,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec18, 0.0);
                u_xlat54 = u_xlat16.y * u_xlat1.x + u_xlat54;
                vec3 txVec19 = vec3(u_xlat12.xy,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec19, 0.0);
                u_xlat54 = u_xlat16.z * u_xlat1.x + u_xlat54;
                vec3 txVec20 = vec3(u_xlat13.zw,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec20, 0.0);
                u_xlat54 = u_xlat16.w * u_xlat1.x + u_xlat54;
                vec3 txVec21 = vec3(u_xlat14.xy,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec21, 0.0);
                u_xlat54 = u_xlat17.x * u_xlat1.x + u_xlat54;
                vec3 txVec22 = vec3(u_xlat14.zw,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec22, 0.0);
                u_xlat54 = u_xlat17.y * u_xlat1.x + u_xlat54;
                vec3 txVec23 = vec3(u_xlat24.xy,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec23, 0.0);
                u_xlat54 = u_xlat17.z * u_xlat1.x + u_xlat54;
                vec3 txVec24 = vec3(u_xlat48.xy,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec24, 0.0);
                u_xlat54 = u_xlat17.w * u_xlat1.x + u_xlat54;
                vec3 txVec25 = vec3(u_xlat9.xy,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec25, 0.0);
                u_xlat54 = u_xlat5.x * u_xlat1.x + u_xlat54;
                vec3 txVec26 = vec3(u_xlat9.zw,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec26, 0.0);
                u_xlat54 = u_xlat5.y * u_xlat1.x + u_xlat54;
                vec3 txVec27 = vec3(u_xlat43.xy,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec27, 0.0);
                u_xlat54 = u_xlat5.z * u_xlat1.x + u_xlat54;
                vec3 txVec28 = vec3(u_xlat4.xy,vs_TEXCOORD6.z);
                u_xlat1.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec28, 0.0);
                u_xlat18.x = u_xlat5.w * u_xlat1.x + u_xlat54;
            }
        }
    } else {
        vec3 txVec29 = vec3(vs_TEXCOORD6.xy,vs_TEXCOORD6.z);
        u_xlat18.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec29, 0.0);
    }
    u_xlat54 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat18.x = u_xlat18.x * _MainLightShadowParams.x + u_xlat54;
    u_xlatb54 = 0.0>=vs_TEXCOORD6.z;
    u_xlatb1 = vs_TEXCOORD6.z>=1.0;
    u_xlatb54 = u_xlatb54 || u_xlatb1;
    u_xlat18.x = (u_xlatb54) ? 1.0 : u_xlat18.x;
    u_xlat4.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = u_xlat54 * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
    u_xlat1.x = (-u_xlat18.x) + 1.0;
    u_xlat18.x = u_xlat54 * u_xlat1.x + u_xlat18.x;
    u_xlatb54 = _MainLightCookieTextureFormat!=-1.0;
    if(u_xlatb54){
        u_xlat4.xy = vs_TEXCOORD1.yy * _MainLightWorldToLight[1].xy;
        u_xlat4.xy = _MainLightWorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat4.xy;
        u_xlat4.xy = _MainLightWorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat4.xy;
        u_xlat4.xy = u_xlat4.xy + _MainLightWorldToLight[3].xy;
        u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat4 = texture(sampler2D(_MainLightCookieTexture, sampler_MainLightCookieTexture), u_xlat4.xy, _GlobalMipBias.x);
        u_xlatb5.xy = equal(vec4(vec4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat54 = (u_xlatb5.y) ? u_xlat4.w : u_xlat4.x;
        u_xlat4.xyz = (u_xlatb5.x) ? u_xlat4.xyz : vec3(u_xlat54);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
    }
    u_xlat4.xyz = u_xlat4.xyz * _MainLightColor.xyz;
    u_xlat18.x = u_xlat18.x * unity_LightData.z;
    u_xlat4.xyz = u_xlat18.xxx * u_xlat4.xyz;
    u_xlat18.x = dot(u_xlat2.xyz, _MainLightPosition.xyz);
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat4.xyz = u_xlat18.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.yzw * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat18.x = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu18 =  uint(int(u_xlat18.x));
    u_xlatb5.xy = equal(vec4(vec4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat6.x = float(0.0);
    u_xlat6.y = float(0.0);
    u_xlat6.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu18 ; u_xlatu_loop_1++)
    {
        u_xlatu1 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati56 = int(u_xlatu_loop_1 & 3u);
        u_xlat1.x = dot(unity_LightIndices[int(u_xlatu1)], uintBitsToFloat(ImmCB_0[u_xlati56]));
        u_xlatu1 =  uint(int(u_xlat1.x));
        u_xlat7.xyz = (-vs_TEXCOORD1.xyz) * _AdditionalLightsPosition[int(u_xlatu1)].www + _AdditionalLightsPosition[int(u_xlatu1)].xyz;
        u_xlat56 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat56 = max(u_xlat56, 6.10351562e-05);
        u_xlat57 = inversesqrt(u_xlat56);
        u_xlat7.xyz = vec3(u_xlat57) * u_xlat7.xyz;
        u_xlat57 = float(1.0) / float(u_xlat56);
        u_xlat56 = u_xlat56 * _AdditionalLightsAttenuation[int(u_xlatu1)].x;
        u_xlat56 = (-u_xlat56) * u_xlat56 + 1.0;
        u_xlat56 = max(u_xlat56, 0.0);
        u_xlat56 = u_xlat56 * u_xlat56;
        u_xlat56 = u_xlat56 * u_xlat57;
        u_xlat57 = dot(_AdditionalLightsSpotDir[int(u_xlatu1)].xyz, u_xlat7.xyz);
        u_xlat57 = u_xlat57 * _AdditionalLightsAttenuation[int(u_xlatu1)].z + _AdditionalLightsAttenuation[int(u_xlatu1)].w;
        u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
        u_xlat57 = u_xlat57 * u_xlat57;
        u_xlat56 = u_xlat56 * u_xlat57;
        u_xlatu57 = u_xlatu1 >> (5u & uint(0x1F));
        u_xlati58 = 1 << (int(u_xlatu1) & int(0x1F));
        u_xlati57 = int(uint(u_xlati58) & floatBitsToUint(_AdditionalLightsCookieEnableBits[int(u_xlatu57)]));
        if(u_xlati57 != 0) {
            u_xlati57 = int(_AdditionalLightsLightTypes[int(u_xlatu1)]);
            u_xlati58 = (u_xlati57 != 0) ? 0 : 1;
            u_xlati41 = int(u_xlatu1) << (2 & int(0x1F));
            if(u_xlati58 != 0) {
                u_xlat8.xyz = vs_TEXCOORD1.yyy * _AdditionalLightsWorldToLights[(u_xlati41 + 1) / 4][(u_xlati41 + 1) % 4].xyw;
                u_xlat8.xyz = _AdditionalLightsWorldToLights[u_xlati41 / 4][u_xlati41 % 4].xyw * vs_TEXCOORD1.xxx + u_xlat8.xyz;
                u_xlat8.xyz = _AdditionalLightsWorldToLights[(u_xlati41 + 2) / 4][(u_xlati41 + 2) % 4].xyw * vs_TEXCOORD1.zzz + u_xlat8.xyz;
                u_xlat8.xyz = u_xlat8.xyz + _AdditionalLightsWorldToLights[(u_xlati41 + 3) / 4][(u_xlati41 + 3) % 4].xyw;
                u_xlat8.xy = u_xlat8.xy / u_xlat8.zz;
                u_xlat8.xy = u_xlat8.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
                u_xlat8.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu1)].xy * u_xlat8.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu1)].zw;
            } else {
                u_xlatb57 = u_xlati57==1;
                u_xlati57 = u_xlatb57 ? 1 : int(0);
                if(u_xlati57 != 0) {
                    u_xlat44.xy = vs_TEXCOORD1.yy * _AdditionalLightsWorldToLights[(u_xlati41 + 1) / 4][(u_xlati41 + 1) % 4].xy;
                    u_xlat44.xy = _AdditionalLightsWorldToLights[u_xlati41 / 4][u_xlati41 % 4].xy * vs_TEXCOORD1.xx + u_xlat44.xy;
                    u_xlat44.xy = _AdditionalLightsWorldToLights[(u_xlati41 + 2) / 4][(u_xlati41 + 2) % 4].xy * vs_TEXCOORD1.zz + u_xlat44.xy;
                    u_xlat44.xy = u_xlat44.xy + _AdditionalLightsWorldToLights[(u_xlati41 + 3) / 4][(u_xlati41 + 3) % 4].xy;
                    u_xlat44.xy = u_xlat44.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat44.xy = fract(u_xlat44.xy);
                    u_xlat8.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu1)].xy * u_xlat44.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu1)].zw;
                } else {
                    u_xlat9 = vs_TEXCOORD1.yyyy * _AdditionalLightsWorldToLights[(u_xlati41 + 1) / 4][(u_xlati41 + 1) % 4];
                    u_xlat9 = _AdditionalLightsWorldToLights[u_xlati41 / 4][u_xlati41 % 4] * vs_TEXCOORD1.xxxx + u_xlat9;
                    u_xlat9 = _AdditionalLightsWorldToLights[(u_xlati41 + 2) / 4][(u_xlati41 + 2) % 4] * vs_TEXCOORD1.zzzz + u_xlat9;
                    u_xlat9 = u_xlat9 + _AdditionalLightsWorldToLights[(u_xlati41 + 3) / 4][(u_xlati41 + 3) % 4];
                    u_xlat9.xyz = u_xlat9.xyz / u_xlat9.www;
                    u_xlat57 = dot(u_xlat9.xyz, u_xlat9.xyz);
                    u_xlat57 = inversesqrt(u_xlat57);
                    u_xlat9.xyz = vec3(u_xlat57) * u_xlat9.xyz;
                    u_xlat57 = dot(abs(u_xlat9.xyz), vec3(1.0, 1.0, 1.0));
                    u_xlat57 = max(u_xlat57, 9.99999997e-07);
                    u_xlat57 = float(1.0) / float(u_xlat57);
                    u_xlat10.xyz = vec3(u_xlat57) * u_xlat9.zxy;
                    u_xlat10.x = (-u_xlat10.x);
                    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
                    u_xlatb41.xy = greaterThanEqual(u_xlat10.yzyz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
                    u_xlat41.x = (u_xlatb41.x) ? u_xlat10.x : (-u_xlat10.x);
                    u_xlat41.y = (u_xlatb41.y) ? u_xlat10.x : (-u_xlat10.x);
                    u_xlat41.xy = u_xlat9.xy * vec2(u_xlat57) + u_xlat41.xy;
                    u_xlat41.xy = u_xlat41.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat41.xy = clamp(u_xlat41.xy, 0.0, 1.0);
                    u_xlat8.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu1)].xy * u_xlat41.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu1)].zw;
                }
            }
            u_xlat8 = texture(sampler2D(_AdditionalLightsCookieAtlasTexture, sampler_AdditionalLightsCookieAtlasTexture), u_xlat8.xy, _GlobalMipBias.x);
            u_xlat57 = (u_xlatb5.y) ? u_xlat8.w : u_xlat8.x;
            u_xlat8.xyz = (u_xlatb5.x) ? u_xlat8.xyz : vec3(u_xlat57);
        } else {
            u_xlat8.x = float(1.0);
            u_xlat8.y = float(1.0);
            u_xlat8.z = float(1.0);
        }
        u_xlat8.xyz = u_xlat8.xyz * _AdditionalLightsColor[int(u_xlatu1)].xyz;
        u_xlat8.xyz = vec3(u_xlat56) * u_xlat8.xyz;
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat7.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat7.xyz = u_xlat1.xxx * u_xlat8.xyz;
        u_xlat7.xyz = u_xlat1.yzw * u_xlat7.xyz;
        u_xlat6.xyz = u_xlat7.xyz * u_xlat0.xxx + u_xlat6.xyz;
    }
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.yzw + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat6.xyz + u_xlat1.xyz;
    u_xlatb18 = _Surface==1.0;
    u_xlatb18 = u_xlatb18 || u_xlatb36;
    SV_Target0.w = (u_xlatb18) ? u_xlat0.x : 1.0;
    return;
}

