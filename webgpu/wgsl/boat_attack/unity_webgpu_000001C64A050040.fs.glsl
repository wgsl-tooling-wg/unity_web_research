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
layout(set = 0, binding = 0) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 1) uniform mediump texture2D _BaseMap;
layout(set = 0, binding = 2) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightShadowmapTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD1;
layout(location = 2) in highp vec3 vs_TEXCOORD2;
layout(location = 3) in highp vec4 vs_TEXCOORD6;
layout(location = 4) in highp vec2 vs_TEXCOORD7;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 4) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 5) uniform mediump  sampler sampler_BaseMap;
layout(set = 0, binding = 6) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 7) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
void main()
{
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
int u_xlati5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec2 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
vec3 u_xlat18;
bool u_xlatb18;
vec3 u_xlat21;
bool u_xlatb21;
vec2 u_xlat23;
float u_xlat39;
bool u_xlatb39;
vec2 u_xlat40;
vec2 u_xlat42;
vec2 u_xlat43;
vec2 u_xlat46;
float u_xlat55;
uint u_xlatu55;
float u_xlat56;
float u_xlat57;
uint u_xlatu57;
float u_xlat58;
int u_xlati58;
uint u_xlatu58;
bool u_xlatb58;
float u_xlat59;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_BaseMap, sampler_BaseMap), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat0 = u_xlat0.wxyz * _BaseColor.wxyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat2.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_TEXCOORD7.xy, _GlobalMipBias.x).xyz;
    u_xlat3.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat3.xy = u_xlat3.xy * hlslcc_FragCoord.xy;
    u_xlat55 = u_xlat3.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat3.z = (-u_xlat55) + 1.0;
    u_xlat55 = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat3.xz, _GlobalMipBias.x).x;
    u_xlat56 = u_xlat55 + -1.0;
    u_xlat56 = _AmbientOcclusionParam.w * u_xlat56 + 1.0;
    u_xlat55 = min(u_xlat55, 1.0);
    u_xlatb3 = 0.0<_MainLightShadowParams.y;
    if(u_xlatb3){
        u_xlatb3 = _MainLightShadowParams.y==1.0;
        if(u_xlatb3){
            u_xlat3 = vs_TEXCOORD6.xyxy + _MainLightShadowOffset0;
            vec3 txVec0 = vec3(u_xlat3.xy,vs_TEXCOORD6.z);
            u_xlat4.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
            vec3 txVec1 = vec3(u_xlat3.zw,vs_TEXCOORD6.z);
            u_xlat4.y = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
            u_xlat3 = vs_TEXCOORD6.xyxy + _MainLightShadowOffset1;
            vec3 txVec2 = vec3(u_xlat3.xy,vs_TEXCOORD6.z);
            u_xlat4.z = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec2, 0.0);
            vec3 txVec3 = vec3(u_xlat3.zw,vs_TEXCOORD6.z);
            u_xlat4.w = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec3, 0.0);
            u_xlat3.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb21 = _MainLightShadowParams.y==2.0;
            if(u_xlatb21){
                u_xlat21.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat21.xy = floor(u_xlat21.xy);
                u_xlat4.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + (-u_xlat21.xy);
                u_xlat5 = u_xlat4.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat6 = u_xlat5.xxzz * u_xlat5.xxzz;
                u_xlat40.xy = u_xlat6.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat5.xz = u_xlat6.xz * vec2(0.5, 0.5) + (-u_xlat4.xy);
                u_xlat6.xy = (-u_xlat4.xy) + vec2(1.0, 1.0);
                u_xlat42.xy = min(u_xlat4.xy, vec2(0.0, 0.0));
                u_xlat42.xy = (-u_xlat42.xy) * u_xlat42.xy + u_xlat6.xy;
                u_xlat4.xy = max(u_xlat4.xy, vec2(0.0, 0.0));
                u_xlat4.xy = (-u_xlat4.xy) * u_xlat4.xy + u_xlat5.yw;
                u_xlat42.xy = u_xlat42.xy + vec2(1.0, 1.0);
                u_xlat4.xy = u_xlat4.xy + vec2(1.0, 1.0);
                u_xlat7.xy = u_xlat5.xz * vec2(0.159999996, 0.159999996);
                u_xlat8.xy = u_xlat6.xy * vec2(0.159999996, 0.159999996);
                u_xlat6.xy = u_xlat42.xy * vec2(0.159999996, 0.159999996);
                u_xlat9.xy = u_xlat4.xy * vec2(0.159999996, 0.159999996);
                u_xlat4.xy = u_xlat5.yw * vec2(0.159999996, 0.159999996);
                u_xlat7.z = u_xlat6.x;
                u_xlat7.w = u_xlat4.x;
                u_xlat8.z = u_xlat9.x;
                u_xlat8.w = u_xlat40.x;
                u_xlat5 = u_xlat7.zwxz + u_xlat8.zwxz;
                u_xlat6.z = u_xlat7.y;
                u_xlat6.w = u_xlat4.y;
                u_xlat9.z = u_xlat8.y;
                u_xlat9.w = u_xlat40.y;
                u_xlat4.xyz = u_xlat6.zyw + u_xlat9.zyw;
                u_xlat6.xyz = u_xlat8.xzw / u_xlat5.zwy;
                u_xlat6.xyz = u_xlat6.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat7.xyz = u_xlat9.zyw / u_xlat4.xyz;
                u_xlat7.xyz = u_xlat7.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat6.xyz = u_xlat6.yxz * _MainLightShadowmapSize.xxx;
                u_xlat7.xyz = u_xlat7.xyz * _MainLightShadowmapSize.yyy;
                u_xlat6.w = u_xlat7.x;
                u_xlat8 = u_xlat21.xyxy * _MainLightShadowmapSize.xyxy + u_xlat6.ywxw;
                u_xlat9.xy = u_xlat21.xy * _MainLightShadowmapSize.xy + u_xlat6.zw;
                u_xlat7.w = u_xlat6.y;
                u_xlat6.yw = u_xlat7.yz;
                u_xlat10 = u_xlat21.xyxy * _MainLightShadowmapSize.xyxy + u_xlat6.xyzy;
                u_xlat7 = u_xlat21.xyxy * _MainLightShadowmapSize.xyxy + u_xlat7.wywz;
                u_xlat6 = u_xlat21.xyxy * _MainLightShadowmapSize.xyxy + u_xlat6.xwzw;
                u_xlat11 = u_xlat4.xxxy * u_xlat5.zwyz;
                u_xlat12 = u_xlat4.yyzz * u_xlat5;
                u_xlat21.x = u_xlat4.z * u_xlat5.y;
                vec3 txVec4 = vec3(u_xlat8.xy,vs_TEXCOORD6.z);
                u_xlat39 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat8.zw,vs_TEXCOORD6.z);
                u_xlat57 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec5, 0.0);
                u_xlat57 = u_xlat57 * u_xlat11.y;
                u_xlat39 = u_xlat11.x * u_xlat39 + u_xlat57;
                vec3 txVec6 = vec3(u_xlat9.xy,vs_TEXCOORD6.z);
                u_xlat57 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec6, 0.0);
                u_xlat39 = u_xlat11.z * u_xlat57 + u_xlat39;
                vec3 txVec7 = vec3(u_xlat7.xy,vs_TEXCOORD6.z);
                u_xlat57 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec7, 0.0);
                u_xlat39 = u_xlat11.w * u_xlat57 + u_xlat39;
                vec3 txVec8 = vec3(u_xlat10.xy,vs_TEXCOORD6.z);
                u_xlat57 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec8, 0.0);
                u_xlat39 = u_xlat12.x * u_xlat57 + u_xlat39;
                vec3 txVec9 = vec3(u_xlat10.zw,vs_TEXCOORD6.z);
                u_xlat57 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec9, 0.0);
                u_xlat39 = u_xlat12.y * u_xlat57 + u_xlat39;
                vec3 txVec10 = vec3(u_xlat7.zw,vs_TEXCOORD6.z);
                u_xlat57 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec10, 0.0);
                u_xlat39 = u_xlat12.z * u_xlat57 + u_xlat39;
                vec3 txVec11 = vec3(u_xlat6.xy,vs_TEXCOORD6.z);
                u_xlat57 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec11, 0.0);
                u_xlat39 = u_xlat12.w * u_xlat57 + u_xlat39;
                vec3 txVec12 = vec3(u_xlat6.zw,vs_TEXCOORD6.z);
                u_xlat57 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec12, 0.0);
                u_xlat3.x = u_xlat21.x * u_xlat57 + u_xlat39;
            } else {
                u_xlat21.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat21.xy = floor(u_xlat21.xy);
                u_xlat4.xy = vs_TEXCOORD6.xy * _MainLightShadowmapSize.zw + (-u_xlat21.xy);
                u_xlat5 = u_xlat4.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat6 = u_xlat5.xxzz * u_xlat5.xxzz;
                u_xlat7.yw = u_xlat6.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat40.xy = u_xlat6.xz * vec2(0.5, 0.5) + (-u_xlat4.xy);
                u_xlat5.xz = (-u_xlat4.xy) + vec2(1.0, 1.0);
                u_xlat6.xy = min(u_xlat4.xy, vec2(0.0, 0.0));
                u_xlat5.xz = (-u_xlat6.xy) * u_xlat6.xy + u_xlat5.xz;
                u_xlat6.xy = max(u_xlat4.xy, vec2(0.0, 0.0));
                u_xlat5.yw = (-u_xlat6.xy) * u_xlat6.xy + u_xlat5.yw;
                u_xlat5 = u_xlat5 + vec4(2.0, 2.0, 2.0, 2.0);
                u_xlat6.z = u_xlat5.y * 0.0816320032;
                u_xlat8.xy = u_xlat40.yx * vec2(0.0816320032, 0.0816320032);
                u_xlat40.xy = u_xlat5.xz * vec2(0.0816320032, 0.0816320032);
                u_xlat8.z = u_xlat5.w * 0.0816320032;
                u_xlat6.x = u_xlat8.y;
                u_xlat6.yw = u_xlat4.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat5.xz = u_xlat4.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat5.y = u_xlat40.x;
                u_xlat5.w = u_xlat7.y;
                u_xlat6 = u_xlat5 + u_xlat6;
                u_xlat8.yw = u_xlat4.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat7.xz = u_xlat4.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat7.y = u_xlat40.y;
                u_xlat4 = u_xlat7 + u_xlat8;
                u_xlat5 = u_xlat5 / u_xlat6;
                u_xlat5 = u_xlat5 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat7 = u_xlat7 / u_xlat4;
                u_xlat7 = u_xlat7 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat5 = u_xlat5.wxyz * _MainLightShadowmapSize.xxxx;
                u_xlat7 = u_xlat7.xwyz * _MainLightShadowmapSize.yyyy;
                u_xlat8.xzw = u_xlat5.yzw;
                u_xlat8.y = u_xlat7.x;
                u_xlat9 = u_xlat21.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyzy;
                u_xlat10.xy = u_xlat21.xy * _MainLightShadowmapSize.xy + u_xlat8.wy;
                u_xlat5.y = u_xlat8.y;
                u_xlat8.y = u_xlat7.z;
                u_xlat11 = u_xlat21.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyzy;
                u_xlat46.xy = u_xlat21.xy * _MainLightShadowmapSize.xy + u_xlat8.wy;
                u_xlat5.z = u_xlat8.y;
                u_xlat12 = u_xlat21.xyxy * _MainLightShadowmapSize.xyxy + u_xlat5.xyxz;
                u_xlat8.y = u_xlat7.w;
                u_xlat13 = u_xlat21.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyzy;
                u_xlat23.xy = u_xlat21.xy * _MainLightShadowmapSize.xy + u_xlat8.wy;
                u_xlat5.w = u_xlat8.y;
                u_xlat14.xy = u_xlat21.xy * _MainLightShadowmapSize.xy + u_xlat5.xw;
                u_xlat7.xzw = u_xlat8.xzw;
                u_xlat8 = u_xlat21.xyxy * _MainLightShadowmapSize.xyxy + u_xlat7.xyzy;
                u_xlat43.xy = u_xlat21.xy * _MainLightShadowmapSize.xy + u_xlat7.wy;
                u_xlat7.x = u_xlat5.x;
                u_xlat21.xy = u_xlat21.xy * _MainLightShadowmapSize.xy + u_xlat7.xy;
                u_xlat15 = u_xlat4.xxxx * u_xlat6;
                u_xlat16 = u_xlat4.yyyy * u_xlat6;
                u_xlat17 = u_xlat4.zzzz * u_xlat6;
                u_xlat4 = u_xlat4.wwww * u_xlat6;
                vec3 txVec13 = vec3(u_xlat9.xy,vs_TEXCOORD6.z);
                u_xlat57 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat9.zw,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec14, 0.0);
                u_xlat5.x = u_xlat5.x * u_xlat15.y;
                u_xlat57 = u_xlat15.x * u_xlat57 + u_xlat5.x;
                vec3 txVec15 = vec3(u_xlat10.xy,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec15, 0.0);
                u_xlat57 = u_xlat15.z * u_xlat5.x + u_xlat57;
                vec3 txVec16 = vec3(u_xlat12.xy,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec16, 0.0);
                u_xlat57 = u_xlat15.w * u_xlat5.x + u_xlat57;
                vec3 txVec17 = vec3(u_xlat11.xy,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec17, 0.0);
                u_xlat57 = u_xlat16.x * u_xlat5.x + u_xlat57;
                vec3 txVec18 = vec3(u_xlat11.zw,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec18, 0.0);
                u_xlat57 = u_xlat16.y * u_xlat5.x + u_xlat57;
                vec3 txVec19 = vec3(u_xlat46.xy,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec19, 0.0);
                u_xlat57 = u_xlat16.z * u_xlat5.x + u_xlat57;
                vec3 txVec20 = vec3(u_xlat12.zw,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec20, 0.0);
                u_xlat57 = u_xlat16.w * u_xlat5.x + u_xlat57;
                vec3 txVec21 = vec3(u_xlat13.xy,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec21, 0.0);
                u_xlat57 = u_xlat17.x * u_xlat5.x + u_xlat57;
                vec3 txVec22 = vec3(u_xlat13.zw,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec22, 0.0);
                u_xlat57 = u_xlat17.y * u_xlat5.x + u_xlat57;
                vec3 txVec23 = vec3(u_xlat23.xy,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec23, 0.0);
                u_xlat57 = u_xlat17.z * u_xlat5.x + u_xlat57;
                vec3 txVec24 = vec3(u_xlat14.xy,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec24, 0.0);
                u_xlat57 = u_xlat17.w * u_xlat5.x + u_xlat57;
                vec3 txVec25 = vec3(u_xlat8.xy,vs_TEXCOORD6.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec25, 0.0);
                u_xlat57 = u_xlat4.x * u_xlat5.x + u_xlat57;
                vec3 txVec26 = vec3(u_xlat8.zw,vs_TEXCOORD6.z);
                u_xlat4.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec26, 0.0);
                u_xlat57 = u_xlat4.y * u_xlat4.x + u_xlat57;
                vec3 txVec27 = vec3(u_xlat43.xy,vs_TEXCOORD6.z);
                u_xlat4.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec27, 0.0);
                u_xlat57 = u_xlat4.z * u_xlat4.x + u_xlat57;
                vec3 txVec28 = vec3(u_xlat21.xy,vs_TEXCOORD6.z);
                u_xlat21.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec28, 0.0);
                u_xlat3.x = u_xlat4.w * u_xlat21.x + u_xlat57;
            }
        }
    } else {
        vec3 txVec29 = vec3(vs_TEXCOORD6.xy,vs_TEXCOORD6.z);
        u_xlat3.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec29, 0.0);
    }
    u_xlat21.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat3.x = u_xlat3.x * _MainLightShadowParams.x + u_xlat21.x;
    u_xlatb21 = 0.0>=vs_TEXCOORD6.z;
    u_xlatb39 = vs_TEXCOORD6.z>=1.0;
    u_xlatb21 = u_xlatb39 || u_xlatb21;
    u_xlat3.x = (u_xlatb21) ? 1.0 : u_xlat3.x;
    u_xlat21.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat21.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat21.x = u_xlat21.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
    u_xlat39 = (-u_xlat3.x) + 1.0;
    u_xlat3.x = u_xlat21.x * u_xlat39 + u_xlat3.x;
    u_xlat21.xyz = vec3(u_xlat56) * _MainLightColor.xyz;
    u_xlat2.xyz = vec3(u_xlat55) * u_xlat2.xyz;
    u_xlat55 = u_xlat3.x * unity_LightData.z;
    u_xlat3.xyz = vec3(u_xlat55) * u_xlat21.xyz;
    u_xlat55 = dot(u_xlat1.xyz, _MainLightPosition.xyz);
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat55) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzw * u_xlat3.xyz;
    u_xlat55 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu55 =  uint(int(u_xlat55));
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu55 ; u_xlatu_loop_1++)
    {
        u_xlatu58 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati5 = int(u_xlatu_loop_1 & 3u);
        u_xlat58 = dot(unity_LightIndices[int(u_xlatu58)], uintBitsToFloat(ImmCB_0[u_xlati5]));
        u_xlati58 = int(u_xlat58);
        u_xlat5.xyz = (-vs_TEXCOORD1.xyz) * _AdditionalLightsPosition[u_xlati58].www + _AdditionalLightsPosition[u_xlati58].xyz;
        u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat59 = max(u_xlat59, 6.10351562e-05);
        u_xlat6.x = inversesqrt(u_xlat59);
        u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xxx;
        u_xlat6.x = float(1.0) / float(u_xlat59);
        u_xlat59 = u_xlat59 * _AdditionalLightsAttenuation[u_xlati58].x;
        u_xlat59 = (-u_xlat59) * u_xlat59 + 1.0;
        u_xlat59 = max(u_xlat59, 0.0);
        u_xlat59 = u_xlat59 * u_xlat59;
        u_xlat59 = u_xlat59 * u_xlat6.x;
        u_xlat6.x = dot(_AdditionalLightsSpotDir[u_xlati58].xyz, u_xlat5.xyz);
        u_xlat6.x = u_xlat6.x * _AdditionalLightsAttenuation[u_xlati58].z + _AdditionalLightsAttenuation[u_xlati58].w;
        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
        u_xlat6.x = u_xlat6.x * u_xlat6.x;
        u_xlat59 = u_xlat59 * u_xlat6.x;
        u_xlat6.xyz = vec3(u_xlat56) * _AdditionalLightsColor[u_xlati58].xyz;
        u_xlat6.xyz = vec3(u_xlat59) * u_xlat6.xyz;
        u_xlat58 = dot(u_xlat1.xyz, u_xlat5.xyz);
        u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
        u_xlat5.xyz = vec3(u_xlat58) * u_xlat6.xyz;
        u_xlat4.xyz = u_xlat5.xyz * u_xlat0.yzw + u_xlat4.xyz;
    }
    u_xlat18.xyz = u_xlat2.xyz * u_xlat0.yzw + u_xlat3.xyz;
    SV_Target0.xyz = u_xlat4.xyz + u_xlat18.xyz;
    u_xlatb18 = _Surface==1.0;
    SV_Target0.w = (u_xlatb18) ? u_xlat0.x : 1.0;
    return;
}

