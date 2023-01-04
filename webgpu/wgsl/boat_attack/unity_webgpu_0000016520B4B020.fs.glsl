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
layout(set = 0, binding = 0) uniform mediump textureCube unity_SpecCube0;
layout(set = 0, binding = 1) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 2) uniform mediump texture2D _BaseMap;
layout(set = 0, binding = 3) uniform mediump texture2D _BumpMap;
layout(set = 0, binding = 4) uniform mediump texture2D _OcclusionMap;
layout(set = 0, binding = 5) uniform mediump texture2D _MetallicGlossMap;
layout(set = 0, binding = 6) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 7) uniform mediump texture2D _MainLightShadowmapTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD1;
layout(location = 2) in highp vec3 vs_TEXCOORD2;
layout(location = 3) in highp vec4 vs_TEXCOORD3;
layout(location = 4) in highp vec2 vs_TEXCOORD8;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 8) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 9) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 10) uniform mediump  sampler sampler_BaseMap;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_BumpMap;
layout(set = 0, binding = 12) uniform mediump  sampler sampler_OcclusionMap;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_MetallicGlossMap;
layout(set = 0, binding = 14) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 15) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
void main()
{
vec4 u_xlat0;
bool u_xlatb0;
vec2 u_xlat1;
uint u_xlatu1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
bvec4 u_xlatb4;
vec3 u_xlat5;
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
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
float u_xlat22;
vec3 u_xlat23;
vec3 u_xlat24;
bool u_xlatb24;
vec3 u_xlat25;
bool u_xlatb25;
float u_xlat28;
vec3 u_xlat29;
vec2 u_xlat30;
vec2 u_xlat43;
int u_xlati43;
uint u_xlatu43;
bool u_xlatb43;
float u_xlat45;
float u_xlat46;
bool u_xlatb46;
vec2 u_xlat49;
vec2 u_xlat51;
vec2 u_xlat52;
vec2 u_xlat57;
float u_xlat63;
int u_xlati63;
uint u_xlatu63;
float u_xlat64;
float u_xlat67;
int u_xlati67;
bool u_xlatb67;
float u_xlat68;
float u_xlat69;
bool u_xlatb69;
float u_xlat70;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_BaseMap, sampler_BaseMap), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat1.xy = texture(sampler2D(_MetallicGlossMap, sampler_MetallicGlossMap), vs_TEXCOORD0.xy, _GlobalMipBias.x).xw;
    u_xlat2 = u_xlat0.wxyz * _BaseColor.wxyz;
    u_xlat3.xyz = texture(sampler2D(_BumpMap, sampler_BumpMap), vs_TEXCOORD0.xy, _GlobalMipBias.x).xyw;
    u_xlat3.x = u_xlat3.x * u_xlat3.z;
    u_xlat43.xy = u_xlat3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat63 = dot(u_xlat43.xy, u_xlat43.xy);
    u_xlat63 = min(u_xlat63, 1.0);
    u_xlat63 = (-u_xlat63) + 1.0;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = max(u_xlat63, 1.00000002e-16);
    u_xlat43.xy = u_xlat43.xy * vec2(vec2(_BumpScale, _BumpScale));
    u_xlat3.x = texture(sampler2D(_OcclusionMap, sampler_OcclusionMap), vs_TEXCOORD0.xy, _GlobalMipBias.x).y;
    u_xlat24.x = (-_OcclusionStrength) + 1.0;
    u_xlat3.x = u_xlat3.x * _OcclusionStrength + u_xlat24.x;
    u_xlatb24 = unity_OrthoParams.w==0.0;
    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat45 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz;
    u_xlat5.x = (u_xlatb24) ? u_xlat4.x : unity_MatrixV[0].z;
    u_xlat5.y = (u_xlatb24) ? u_xlat4.y : unity_MatrixV[1].z;
    u_xlat5.z = (u_xlatb24) ? u_xlat4.z : unity_MatrixV[2].z;
    u_xlat24.xyz = vs_TEXCOORD2.zxy * vs_TEXCOORD3.yzx;
    u_xlat24.xyz = vs_TEXCOORD2.yzx * vs_TEXCOORD3.zxy + (-u_xlat24.xyz);
    u_xlat24.xyz = u_xlat24.xyz * vs_TEXCOORD3.www;
    u_xlat24.xyz = u_xlat43.yyy * u_xlat24.xyz;
    u_xlat24.xyz = u_xlat43.xxx * vs_TEXCOORD3.xyz + u_xlat24.xyz;
    u_xlat24.xyz = vec3(u_xlat63) * vs_TEXCOORD2.xyz + u_xlat24.xyz;
    u_xlat63 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat24.xyz = vec3(u_xlat63) * u_xlat24.xyz;
    u_xlat4.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat6.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres3.xyz);
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
    u_xlat63 = dot(u_xlat6, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat63 = (-u_xlat63) + 4.0;
    u_xlatu63 = uint(u_xlat63);
    u_xlati63 = int(u_xlatu63) << (2 & int(0x1F));
    u_xlat4.xyz = vs_TEXCOORD1.yyy * _MainLightWorldToShadow[(u_xlati63 + 1) / 4][(u_xlati63 + 1) % 4].xyz;
    u_xlat4.xyz = _MainLightWorldToShadow[u_xlati63 / 4][u_xlati63 % 4].xyz * vs_TEXCOORD1.xxx + u_xlat4.xyz;
    u_xlat4.xyz = _MainLightWorldToShadow[(u_xlati63 + 2) / 4][(u_xlati63 + 2) % 4].xyz * vs_TEXCOORD1.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + _MainLightWorldToShadow[(u_xlati63 + 3) / 4][(u_xlati63 + 3) % 4].xyz;
    u_xlat6.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_TEXCOORD8.xy, _GlobalMipBias.x).xyz;
    u_xlat43.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat7.xy = u_xlat43.xy * hlslcc_FragCoord.xy;
    u_xlat63 = u_xlat7.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat7.z = (-u_xlat63) + 1.0;
    u_xlat63 = (-u_xlat1.x) * 0.959999979 + 0.959999979;
    u_xlat43.x = u_xlat1.y * _Smoothness + (-u_xlat63);
    u_xlat23.xyz = vec3(u_xlat63) * u_xlat2.yzw;
    u_xlat0.xyz = u_xlat0.xyz * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat63 = (-u_xlat1.y) * _Smoothness + 1.0;
    u_xlat1.x = u_xlat63 * u_xlat63;
    u_xlat1.x = max(u_xlat1.x, 0.0078125);
    u_xlat22 = u_xlat1.x * u_xlat1.x;
    u_xlat43.x = u_xlat43.x + 1.0;
    u_xlat43.x = clamp(u_xlat43.x, 0.0, 1.0);
    u_xlat64 = u_xlat1.x * 4.0 + 2.0;
    u_xlat67 = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat7.xz, _GlobalMipBias.x).x;
    u_xlat68 = u_xlat67 + -1.0;
    u_xlat68 = _AmbientOcclusionParam.w * u_xlat68 + 1.0;
    u_xlat3.x = min(u_xlat3.x, u_xlat67);
    u_xlatb67 = 0.0<_MainLightShadowParams.y;
    if(u_xlatb67){
        u_xlatb67 = _MainLightShadowParams.y==1.0;
        if(u_xlatb67){
            u_xlat7 = u_xlat4.xyxy + _MainLightShadowOffset0;
            vec3 txVec0 = vec3(u_xlat7.xy,u_xlat4.z);
            u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
            vec3 txVec1 = vec3(u_xlat7.zw,u_xlat4.z);
            u_xlat8.y = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
            u_xlat7 = u_xlat4.xyxy + _MainLightShadowOffset1;
            vec3 txVec2 = vec3(u_xlat7.xy,u_xlat4.z);
            u_xlat8.z = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec2, 0.0);
            vec3 txVec3 = vec3(u_xlat7.zw,u_xlat4.z);
            u_xlat8.w = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec3, 0.0);
            u_xlat67 = dot(u_xlat8, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb69 = _MainLightShadowParams.y==2.0;
            if(u_xlatb69){
                u_xlat7.xy = u_xlat4.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat7.xy = floor(u_xlat7.xy);
                u_xlat49.xy = u_xlat4.xy * _MainLightShadowmapSize.zw + (-u_xlat7.xy);
                u_xlat8 = u_xlat49.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat9 = u_xlat8.xxzz * u_xlat8.xxzz;
                u_xlat8.xz = u_xlat9.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat9.xy = u_xlat9.xz * vec2(0.5, 0.5) + (-u_xlat49.xy);
                u_xlat51.xy = (-u_xlat49.xy) + vec2(1.0, 1.0);
                u_xlat10.xy = min(u_xlat49.xy, vec2(0.0, 0.0));
                u_xlat10.xy = (-u_xlat10.xy) * u_xlat10.xy + u_xlat51.xy;
                u_xlat49.xy = max(u_xlat49.xy, vec2(0.0, 0.0));
                u_xlat49.xy = (-u_xlat49.xy) * u_xlat49.xy + u_xlat8.yw;
                u_xlat10.xy = u_xlat10.xy + vec2(1.0, 1.0);
                u_xlat49.xy = u_xlat49.xy + vec2(1.0, 1.0);
                u_xlat11.xy = u_xlat9.xy * vec2(0.159999996, 0.159999996);
                u_xlat9.xy = u_xlat51.xy * vec2(0.159999996, 0.159999996);
                u_xlat10.xy = u_xlat10.xy * vec2(0.159999996, 0.159999996);
                u_xlat12.xy = u_xlat49.xy * vec2(0.159999996, 0.159999996);
                u_xlat49.xy = u_xlat8.yw * vec2(0.159999996, 0.159999996);
                u_xlat11.z = u_xlat10.x;
                u_xlat11.w = u_xlat49.x;
                u_xlat9.z = u_xlat12.x;
                u_xlat9.w = u_xlat8.x;
                u_xlat13 = u_xlat9.zwxz + u_xlat11.zwxz;
                u_xlat10.z = u_xlat11.y;
                u_xlat10.w = u_xlat49.y;
                u_xlat12.z = u_xlat9.y;
                u_xlat12.w = u_xlat8.z;
                u_xlat8.xyz = u_xlat10.zyw + u_xlat12.zyw;
                u_xlat9.xyz = u_xlat9.xzw / u_xlat13.zwy;
                u_xlat9.xyz = u_xlat9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat10.xyz = u_xlat12.zyw / u_xlat8.xyz;
                u_xlat10.xyz = u_xlat10.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat9.xyz = u_xlat9.yxz * _MainLightShadowmapSize.xxx;
                u_xlat10.xyz = u_xlat10.xyz * _MainLightShadowmapSize.yyy;
                u_xlat9.w = u_xlat10.x;
                u_xlat11 = u_xlat7.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.ywxw;
                u_xlat49.xy = u_xlat7.xy * _MainLightShadowmapSize.xy + u_xlat9.zw;
                u_xlat10.w = u_xlat9.y;
                u_xlat9.yw = u_xlat10.yz;
                u_xlat12 = u_xlat7.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xyzy;
                u_xlat10 = u_xlat7.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.wywz;
                u_xlat9 = u_xlat7.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xwzw;
                u_xlat14 = u_xlat8.xxxy * u_xlat13.zwyz;
                u_xlat15 = u_xlat8.yyzz * u_xlat13;
                u_xlat69 = u_xlat8.z * u_xlat13.y;
                vec3 txVec4 = vec3(u_xlat11.xy,u_xlat4.z);
                u_xlat7.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat11.zw,u_xlat4.z);
                u_xlat28 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec5, 0.0);
                u_xlat28 = u_xlat28 * u_xlat14.y;
                u_xlat7.x = u_xlat14.x * u_xlat7.x + u_xlat28;
                vec3 txVec6 = vec3(u_xlat49.xy,u_xlat4.z);
                u_xlat28 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec6, 0.0);
                u_xlat7.x = u_xlat14.z * u_xlat28 + u_xlat7.x;
                vec3 txVec7 = vec3(u_xlat10.xy,u_xlat4.z);
                u_xlat28 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec7, 0.0);
                u_xlat7.x = u_xlat14.w * u_xlat28 + u_xlat7.x;
                vec3 txVec8 = vec3(u_xlat12.xy,u_xlat4.z);
                u_xlat28 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec8, 0.0);
                u_xlat7.x = u_xlat15.x * u_xlat28 + u_xlat7.x;
                vec3 txVec9 = vec3(u_xlat12.zw,u_xlat4.z);
                u_xlat28 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec9, 0.0);
                u_xlat7.x = u_xlat15.y * u_xlat28 + u_xlat7.x;
                vec3 txVec10 = vec3(u_xlat10.zw,u_xlat4.z);
                u_xlat28 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec10, 0.0);
                u_xlat7.x = u_xlat15.z * u_xlat28 + u_xlat7.x;
                vec3 txVec11 = vec3(u_xlat9.xy,u_xlat4.z);
                u_xlat28 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec11, 0.0);
                u_xlat7.x = u_xlat15.w * u_xlat28 + u_xlat7.x;
                vec3 txVec12 = vec3(u_xlat9.zw,u_xlat4.z);
                u_xlat28 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec12, 0.0);
                u_xlat67 = u_xlat69 * u_xlat28 + u_xlat7.x;
            } else {
                u_xlat7.xy = u_xlat4.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat7.xy = floor(u_xlat7.xy);
                u_xlat49.xy = u_xlat4.xy * _MainLightShadowmapSize.zw + (-u_xlat7.xy);
                u_xlat8 = u_xlat49.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat9 = u_xlat8.xxzz * u_xlat8.xxzz;
                u_xlat10.yw = u_xlat9.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat8.xz = u_xlat9.xz * vec2(0.5, 0.5) + (-u_xlat49.xy);
                u_xlat9.xy = (-u_xlat49.xy) + vec2(1.0, 1.0);
                u_xlat51.xy = min(u_xlat49.xy, vec2(0.0, 0.0));
                u_xlat9.xy = (-u_xlat51.xy) * u_xlat51.xy + u_xlat9.xy;
                u_xlat51.xy = max(u_xlat49.xy, vec2(0.0, 0.0));
                u_xlat29.xz = (-u_xlat51.xy) * u_xlat51.xy + u_xlat8.yw;
                u_xlat9.xy = u_xlat9.xy + vec2(2.0, 2.0);
                u_xlat8.yw = u_xlat29.xz + vec2(2.0, 2.0);
                u_xlat11.z = u_xlat8.y * 0.0816320032;
                u_xlat12.xyz = u_xlat8.zxw * vec3(0.0816320032, 0.0816320032, 0.0816320032);
                u_xlat8.xy = u_xlat9.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat11.x = u_xlat12.y;
                u_xlat11.yw = u_xlat49.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat9.xz = u_xlat49.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat9.y = u_xlat8.x;
                u_xlat9.w = u_xlat10.y;
                u_xlat11 = u_xlat9 + u_xlat11;
                u_xlat12.yw = u_xlat49.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat10.xz = u_xlat49.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat10.y = u_xlat8.y;
                u_xlat8 = u_xlat10 + u_xlat12;
                u_xlat9 = u_xlat9 / u_xlat11;
                u_xlat9 = u_xlat9 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat10 = u_xlat10 / u_xlat8;
                u_xlat10 = u_xlat10 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat9 = u_xlat9.wxyz * _MainLightShadowmapSize.xxxx;
                u_xlat10 = u_xlat10.xwyz * _MainLightShadowmapSize.yyyy;
                u_xlat12.xzw = u_xlat9.yzw;
                u_xlat12.y = u_xlat10.x;
                u_xlat13 = u_xlat7.xyxy * _MainLightShadowmapSize.xyxy + u_xlat12.xyzy;
                u_xlat49.xy = u_xlat7.xy * _MainLightShadowmapSize.xy + u_xlat12.wy;
                u_xlat9.y = u_xlat12.y;
                u_xlat12.y = u_xlat10.z;
                u_xlat14 = u_xlat7.xyxy * _MainLightShadowmapSize.xyxy + u_xlat12.xyzy;
                u_xlat15.xy = u_xlat7.xy * _MainLightShadowmapSize.xy + u_xlat12.wy;
                u_xlat9.z = u_xlat12.y;
                u_xlat16 = u_xlat7.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xyxz;
                u_xlat12.y = u_xlat10.w;
                u_xlat17 = u_xlat7.xyxy * _MainLightShadowmapSize.xyxy + u_xlat12.xyzy;
                u_xlat30.xy = u_xlat7.xy * _MainLightShadowmapSize.xy + u_xlat12.wy;
                u_xlat9.w = u_xlat12.y;
                u_xlat57.xy = u_xlat7.xy * _MainLightShadowmapSize.xy + u_xlat9.xw;
                u_xlat10.xzw = u_xlat12.xzw;
                u_xlat12 = u_xlat7.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.xyzy;
                u_xlat52.xy = u_xlat7.xy * _MainLightShadowmapSize.xy + u_xlat10.wy;
                u_xlat10.x = u_xlat9.x;
                u_xlat7.xy = u_xlat7.xy * _MainLightShadowmapSize.xy + u_xlat10.xy;
                u_xlat18 = u_xlat8.xxxx * u_xlat11;
                u_xlat19 = u_xlat8.yyyy * u_xlat11;
                u_xlat20 = u_xlat8.zzzz * u_xlat11;
                u_xlat8 = u_xlat8.wwww * u_xlat11;
                vec3 txVec13 = vec3(u_xlat13.xy,u_xlat4.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat13.zw,u_xlat4.z);
                u_xlat9.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec14, 0.0);
                u_xlat9.x = u_xlat9.x * u_xlat18.y;
                u_xlat69 = u_xlat18.x * u_xlat69 + u_xlat9.x;
                vec3 txVec15 = vec3(u_xlat49.xy,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec15, 0.0);
                u_xlat69 = u_xlat18.z * u_xlat49.x + u_xlat69;
                vec3 txVec16 = vec3(u_xlat16.xy,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec16, 0.0);
                u_xlat69 = u_xlat18.w * u_xlat49.x + u_xlat69;
                vec3 txVec17 = vec3(u_xlat14.xy,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec17, 0.0);
                u_xlat69 = u_xlat19.x * u_xlat49.x + u_xlat69;
                vec3 txVec18 = vec3(u_xlat14.zw,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec18, 0.0);
                u_xlat69 = u_xlat19.y * u_xlat49.x + u_xlat69;
                vec3 txVec19 = vec3(u_xlat15.xy,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec19, 0.0);
                u_xlat69 = u_xlat19.z * u_xlat49.x + u_xlat69;
                vec3 txVec20 = vec3(u_xlat16.zw,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec20, 0.0);
                u_xlat69 = u_xlat19.w * u_xlat49.x + u_xlat69;
                vec3 txVec21 = vec3(u_xlat17.xy,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec21, 0.0);
                u_xlat69 = u_xlat20.x * u_xlat49.x + u_xlat69;
                vec3 txVec22 = vec3(u_xlat17.zw,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec22, 0.0);
                u_xlat69 = u_xlat20.y * u_xlat49.x + u_xlat69;
                vec3 txVec23 = vec3(u_xlat30.xy,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec23, 0.0);
                u_xlat69 = u_xlat20.z * u_xlat49.x + u_xlat69;
                vec3 txVec24 = vec3(u_xlat57.xy,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec24, 0.0);
                u_xlat69 = u_xlat20.w * u_xlat49.x + u_xlat69;
                vec3 txVec25 = vec3(u_xlat12.xy,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec25, 0.0);
                u_xlat69 = u_xlat8.x * u_xlat49.x + u_xlat69;
                vec3 txVec26 = vec3(u_xlat12.zw,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec26, 0.0);
                u_xlat69 = u_xlat8.y * u_xlat49.x + u_xlat69;
                vec3 txVec27 = vec3(u_xlat52.xy,u_xlat4.z);
                u_xlat49.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec27, 0.0);
                u_xlat69 = u_xlat8.z * u_xlat49.x + u_xlat69;
                vec3 txVec28 = vec3(u_xlat7.xy,u_xlat4.z);
                u_xlat7.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec28, 0.0);
                u_xlat67 = u_xlat8.w * u_xlat7.x + u_xlat69;
            }
        }
    } else {
        vec3 txVec29 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat67 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec29, 0.0);
    }
    u_xlat4.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat4.x = u_xlat67 * _MainLightShadowParams.x + u_xlat4.x;
    u_xlatb25 = 0.0>=u_xlat4.z;
    u_xlatb46 = u_xlat4.z>=1.0;
    u_xlatb25 = u_xlatb46 || u_xlatb25;
    u_xlat4.x = (u_xlatb25) ? 1.0 : u_xlat4.x;
    u_xlat25.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat25.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat25.x = u_xlat25.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
    u_xlat46 = (-u_xlat4.x) + 1.0;
    u_xlat4.x = u_xlat25.x * u_xlat46 + u_xlat4.x;
    u_xlat25.xyz = vec3(u_xlat68) * _MainLightColor.xyz;
    u_xlat69 = dot((-u_xlat5.xyz), u_xlat24.xyz);
    u_xlat69 = u_xlat69 + u_xlat69;
    u_xlat7.xyz = u_xlat24.xyz * (-vec3(u_xlat69)) + (-u_xlat5.xyz);
    u_xlat69 = dot(u_xlat24.xyz, u_xlat5.xyz);
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
    u_xlat69 = (-u_xlat69) + 1.0;
    u_xlat69 = u_xlat69 * u_xlat69;
    u_xlat69 = u_xlat69 * u_xlat69;
    u_xlat70 = (-u_xlat63) * 0.699999988 + 1.70000005;
    u_xlat63 = u_xlat63 * u_xlat70;
    u_xlat63 = u_xlat63 * 6.0;
    u_xlat7 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat7.xyz, u_xlat63);
    u_xlat63 = u_xlat7.w + -1.0;
    u_xlat63 = unity_SpecCube0_HDR.w * u_xlat63 + 1.0;
    u_xlat63 = max(u_xlat63, 0.0);
    u_xlat63 = log2(u_xlat63);
    u_xlat63 = u_xlat63 * unity_SpecCube0_HDR.y;
    u_xlat63 = exp2(u_xlat63);
    u_xlat63 = u_xlat63 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat63);
    u_xlat8.xy = u_xlat1.xx * u_xlat1.xx + vec2(-1.0, 1.0);
    u_xlat63 = float(1.0) / u_xlat8.y;
    u_xlat29.xyz = (-u_xlat0.xyz) + u_xlat43.xxx;
    u_xlat29.xyz = vec3(u_xlat69) * u_xlat29.xyz + u_xlat0.xyz;
    u_xlat29.xyz = vec3(u_xlat63) * u_xlat29.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat29.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat23.xyz + u_xlat7.xyz;
    u_xlat63 = u_xlat4.x * unity_LightData.z;
    u_xlat1.x = dot(u_xlat24.xyz, _MainLightPosition.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat63 = u_xlat63 * u_xlat1.x;
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat25.xyz;
    u_xlat7.xyz = u_xlat5.xyz + _MainLightPosition.xyz;
    u_xlat63 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat63 = max(u_xlat63, 1.17549435e-37);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat7.xyz = vec3(u_xlat63) * u_xlat7.xyz;
    u_xlat63 = dot(u_xlat24.xyz, u_xlat7.xyz);
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
    u_xlat1.x = dot(_MainLightPosition.xyz, u_xlat7.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat63 = u_xlat63 * u_xlat63;
    u_xlat63 = u_xlat63 * u_xlat8.x + 1.00001001;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat63 = u_xlat63 * u_xlat63;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat63 = u_xlat63 * u_xlat1.x;
    u_xlat63 = u_xlat64 * u_xlat63;
    u_xlat63 = u_xlat22 / u_xlat63;
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat63) + u_xlat23.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat63 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu63 =  uint(int(u_xlat63));
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu63 ; u_xlatu_loop_1++)
    {
        u_xlatu43 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati67 = int(u_xlatu_loop_1 & 3u);
        u_xlat43.x = dot(unity_LightIndices[int(u_xlatu43)], uintBitsToFloat(ImmCB_0[u_xlati67]));
        u_xlati43 = int(u_xlat43.x);
        u_xlat29.xyz = (-vs_TEXCOORD1.xyz) * _AdditionalLightsPosition[u_xlati43].www + _AdditionalLightsPosition[u_xlati43].xyz;
        u_xlat67 = dot(u_xlat29.xyz, u_xlat29.xyz);
        u_xlat67 = max(u_xlat67, 6.10351562e-05);
        u_xlat69 = inversesqrt(u_xlat67);
        u_xlat9.xyz = vec3(u_xlat69) * u_xlat29.xyz;
        u_xlat70 = float(1.0) / float(u_xlat67);
        u_xlat67 = u_xlat67 * _AdditionalLightsAttenuation[u_xlati43].x;
        u_xlat67 = (-u_xlat67) * u_xlat67 + 1.0;
        u_xlat67 = max(u_xlat67, 0.0);
        u_xlat67 = u_xlat67 * u_xlat67;
        u_xlat67 = u_xlat67 * u_xlat70;
        u_xlat70 = dot(_AdditionalLightsSpotDir[u_xlati43].xyz, u_xlat9.xyz);
        u_xlat70 = u_xlat70 * _AdditionalLightsAttenuation[u_xlati43].z + _AdditionalLightsAttenuation[u_xlati43].w;
        u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
        u_xlat70 = u_xlat70 * u_xlat70;
        u_xlat67 = u_xlat67 * u_xlat70;
        u_xlat10.xyz = vec3(u_xlat68) * _AdditionalLightsColor[u_xlati43].xyz;
        u_xlat43.x = dot(u_xlat24.xyz, u_xlat9.xyz);
        u_xlat43.x = clamp(u_xlat43.x, 0.0, 1.0);
        u_xlat43.x = u_xlat43.x * u_xlat67;
        u_xlat10.xyz = u_xlat43.xxx * u_xlat10.xyz;
        u_xlat29.xyz = u_xlat29.xyz * vec3(u_xlat69) + u_xlat5.xyz;
        u_xlat43.x = dot(u_xlat29.xyz, u_xlat29.xyz);
        u_xlat43.x = max(u_xlat43.x, 1.17549435e-37);
        u_xlat43.x = inversesqrt(u_xlat43.x);
        u_xlat29.xyz = u_xlat43.xxx * u_xlat29.xyz;
        u_xlat43.x = dot(u_xlat24.xyz, u_xlat29.xyz);
        u_xlat43.x = clamp(u_xlat43.x, 0.0, 1.0);
        u_xlat67 = dot(u_xlat9.xyz, u_xlat29.xyz);
        u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
        u_xlat43.x = u_xlat43.x * u_xlat43.x;
        u_xlat43.x = u_xlat43.x * u_xlat8.x + 1.00001001;
        u_xlat67 = u_xlat67 * u_xlat67;
        u_xlat43.x = u_xlat43.x * u_xlat43.x;
        u_xlat67 = max(u_xlat67, 0.100000001);
        u_xlat43.x = u_xlat43.x * u_xlat67;
        u_xlat43.x = u_xlat64 * u_xlat43.x;
        u_xlat43.x = u_xlat22 / u_xlat43.x;
        u_xlat29.xyz = u_xlat0.xyz * u_xlat43.xxx + u_xlat23.xyz;
        u_xlat7.xyz = u_xlat29.xyz * u_xlat10.xyz + u_xlat7.xyz;
    }
    u_xlat0.xyz = u_xlat6.xyz * u_xlat3.xxx + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat7.xyz + u_xlat0.xyz;
    u_xlatb0 = _Surface==1.0;
    SV_Target0.w = (u_xlatb0) ? u_xlat2.x : 1.0;
    return;
}

