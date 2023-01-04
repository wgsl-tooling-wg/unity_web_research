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
layout(set = 0, binding = 0) uniform mediump textureCube unity_SpecCube0;
layout(set = 0, binding = 1) uniform mediump texture2D _BaseMap;
layout(set = 0, binding = 2) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _DitheringTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD1;
layout(location = 2) in highp vec3 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 5) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 6) uniform mediump  sampler sampler_BaseMap;
layout(set = 0, binding = 7) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 8) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 9) uniform mediump  sampler sampler_DitheringTexture;
void main()
{
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec4 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat12;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
float u_xlat26;
bool u_xlatb26;
vec2 u_xlat28;
float u_xlat33;
int u_xlati33;
uint u_xlatu33;
bool u_xlatb33;
float u_xlat35;
uint u_xlatu35;
float u_xlat36;
int u_xlati36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
float u_xlat39;
int u_xlati39;
float u_xlat40;
float u_xlat41;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_BaseMap, sampler_BaseMap), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat1 = u_xlat0.wxyz * _BaseColor.wxyz;
    u_xlat2.xy = hlslcc_FragCoord.xy * vec2(_DitheringTextureInvSize);
    u_xlat33 = texture(sampler2D(_DitheringTexture, sampler_DitheringTexture), u_xlat2.xy, _GlobalMipBias.x).w;
    u_xlatb2 = unity_LODFade.x>=0.0;
    u_xlat33 = (u_xlatb2) ? abs(u_xlat33) : -abs(u_xlat33);
    u_xlat33 = (-u_xlat33) + unity_LODFade.x;
    u_xlatb33 = u_xlat33<0.0;
    if(((int(u_xlatb33) * int(0xffffffffu)))!=0){discard;}
    u_xlatb33 = unity_OrthoParams.w==0.0;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat35 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat2.xyz = vec3(u_xlat35) * u_xlat2.xyz;
    u_xlat3.x = (u_xlatb33) ? u_xlat2.x : unity_MatrixV[0].z;
    u_xlat3.y = (u_xlatb33) ? u_xlat2.y : unity_MatrixV[1].z;
    u_xlat3.z = (u_xlatb33) ? u_xlat2.z : unity_MatrixV[2].z;
    u_xlat33 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * vs_TEXCOORD2.xyz;
    u_xlat4.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat5.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat6.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.y = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat4.z = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.w = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb4 = lessThan(u_xlat4, _CascadeShadowSplitSphereRadii);
    u_xlat5.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat5.w = u_xlatb4.w ? float(1.0) : 0.0;
;
    u_xlat4.x = (u_xlatb4.x) ? float(-1.0) : float(-0.0);
    u_xlat4.y = (u_xlatb4.y) ? float(-1.0) : float(-0.0);
    u_xlat4.z = (u_xlatb4.z) ? float(-1.0) : float(-0.0);
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.yzw;
    u_xlat5.yzw = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat33 = dot(u_xlat5, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat33 = (-u_xlat33) + 4.0;
    u_xlatu33 = uint(u_xlat33);
    u_xlati33 = int(u_xlatu33) << (2 & int(0x1F));
    u_xlat4.xyz = vs_TEXCOORD1.yyy * _MainLightWorldToShadow[(u_xlati33 + 1) / 4][(u_xlati33 + 1) % 4].xyz;
    u_xlat4.xyz = _MainLightWorldToShadow[u_xlati33 / 4][u_xlati33 % 4].xyz * vs_TEXCOORD1.xxx + u_xlat4.xyz;
    u_xlat4.xyz = _MainLightWorldToShadow[(u_xlati33 + 2) / 4][(u_xlati33 + 2) % 4].xyz * vs_TEXCOORD1.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + _MainLightWorldToShadow[(u_xlati33 + 3) / 4][(u_xlati33 + 3) % 4].xyz;
    u_xlat2.w = 1.0;
    u_xlat5.x = dot(unity_SHAr, u_xlat2);
    u_xlat5.y = dot(unity_SHAg, u_xlat2);
    u_xlat5.z = dot(unity_SHAb, u_xlat2);
    u_xlat6 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat7.x = dot(unity_SHBr, u_xlat6);
    u_xlat7.y = dot(unity_SHBg, u_xlat6);
    u_xlat7.z = dot(unity_SHBb, u_xlat6);
    u_xlat33 = u_xlat2.y * u_xlat2.y;
    u_xlat33 = u_xlat2.x * u_xlat2.x + (-u_xlat33);
    u_xlat6.xyz = unity_SHC.xyz * vec3(u_xlat33) + u_xlat7.xyz;
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat6.xy = u_xlat6.xy * hlslcc_FragCoord.xy;
    u_xlat33 = u_xlat6.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat6.z = (-u_xlat33) + 1.0;
    u_xlat33 = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat35 = (-u_xlat33) + 1.0;
    u_xlat12.xyz = vec3(u_xlat33) * u_xlat1.yzw;
    u_xlat0.xyz = u_xlat0.xyz * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat33 = (-_Smoothness) + 1.0;
    u_xlat36 = u_xlat33 * u_xlat33;
    u_xlat36 = max(u_xlat36, 0.0078125);
    u_xlat37 = u_xlat36 * u_xlat36;
    u_xlat35 = u_xlat35 + _Smoothness;
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat38 = u_xlat36 * 4.0 + 2.0;
    u_xlat6.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat6.xz, _GlobalMipBias.x).x;
    u_xlat17 = u_xlat6.x + -1.0;
    u_xlat17 = _AmbientOcclusionParam.w * u_xlat17 + 1.0;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat15 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat4.x = u_xlat4.x * _MainLightShadowParams.x + u_xlat15;
    u_xlatb15 = 0.0>=u_xlat4.z;
    u_xlatb26 = u_xlat4.z>=1.0;
    u_xlatb15 = u_xlatb26 || u_xlatb15;
    u_xlat4.x = (u_xlatb15) ? 1.0 : u_xlat4.x;
    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat15 = u_xlat15 * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat26 = (-u_xlat4.x) + 1.0;
    u_xlat4.x = u_xlat15 * u_xlat26 + u_xlat4.x;
    u_xlat7.xyz = vec3(u_xlat17) * _MainLightColor.xyz;
    u_xlat15 = dot((-u_xlat3.xyz), u_xlat2.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat8.xyz = u_xlat2.xyz * (-vec3(u_xlat15)) + (-u_xlat3.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat26 = (-u_xlat33) * 0.699999988 + 1.70000005;
    u_xlat33 = u_xlat33 * u_xlat26;
    u_xlat33 = u_xlat33 * 6.0;
    u_xlat8 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat8.xyz, u_xlat33);
    u_xlat33 = u_xlat8.w + -1.0;
    u_xlat33 = unity_SpecCube0_HDR.w * u_xlat33 + 1.0;
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * unity_SpecCube0_HDR.y;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = u_xlat33 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat33);
    u_xlat28.xy = vec2(u_xlat36) * vec2(u_xlat36) + vec2(-1.0, 1.0);
    u_xlat33 = float(1.0) / u_xlat28.y;
    u_xlat9.xyz = (-u_xlat0.xyz) + vec3(u_xlat35);
    u_xlat9.xyz = vec3(u_xlat15) * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat9.xyz = vec3(u_xlat33) * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat12.xyz + u_xlat8.xyz;
    u_xlat33 = u_xlat4.x * unity_LightData.z;
    u_xlat35 = dot(u_xlat2.xyz, _MainLightPosition.xyz);
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat33 = u_xlat33 * u_xlat35;
    u_xlat4.xyz = vec3(u_xlat33) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat3.xyz + _MainLightPosition.xyz;
    u_xlat33 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat33 = max(u_xlat33, 1.17549435e-37);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat7.xyz = vec3(u_xlat33) * u_xlat7.xyz;
    u_xlat33 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
    u_xlat35 = dot(_MainLightPosition.xyz, u_xlat7.xyz);
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat33 = u_xlat33 * u_xlat28.x + 1.00001001;
    u_xlat35 = u_xlat35 * u_xlat35;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat35 = max(u_xlat35, 0.100000001);
    u_xlat33 = u_xlat33 * u_xlat35;
    u_xlat33 = u_xlat38 * u_xlat33;
    u_xlat33 = u_xlat37 / u_xlat33;
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat33) + u_xlat12.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat33 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu33 =  uint(int(u_xlat33));
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu33 ; u_xlatu_loop_1++)
    {
        u_xlatu36 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati39 = int(u_xlatu_loop_1 & 3u);
        u_xlat36 = dot(unity_LightIndices[int(u_xlatu36)], uintBitsToFloat(ImmCB_0[u_xlati39]));
        u_xlati36 = int(u_xlat36);
        u_xlat8.xyz = (-vs_TEXCOORD1.xyz) * _AdditionalLightsPosition[u_xlati36].www + _AdditionalLightsPosition[u_xlati36].xyz;
        u_xlat39 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat39 = max(u_xlat39, 6.10351562e-05);
        u_xlat40 = inversesqrt(u_xlat39);
        u_xlat9.xyz = vec3(u_xlat40) * u_xlat8.xyz;
        u_xlat41 = float(1.0) / float(u_xlat39);
        u_xlat39 = u_xlat39 * _AdditionalLightsAttenuation[u_xlati36].x;
        u_xlat39 = (-u_xlat39) * u_xlat39 + 1.0;
        u_xlat39 = max(u_xlat39, 0.0);
        u_xlat39 = u_xlat39 * u_xlat39;
        u_xlat39 = u_xlat39 * u_xlat41;
        u_xlat41 = dot(_AdditionalLightsSpotDir[u_xlati36].xyz, u_xlat9.xyz);
        u_xlat41 = u_xlat41 * _AdditionalLightsAttenuation[u_xlati36].z + _AdditionalLightsAttenuation[u_xlati36].w;
        u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
        u_xlat41 = u_xlat41 * u_xlat41;
        u_xlat39 = u_xlat39 * u_xlat41;
        u_xlat10.xyz = vec3(u_xlat17) * _AdditionalLightsColor[u_xlati36].xyz;
        u_xlat36 = dot(u_xlat2.xyz, u_xlat9.xyz);
        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
        u_xlat36 = u_xlat36 * u_xlat39;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat40) + u_xlat3.xyz;
        u_xlat36 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat36 = max(u_xlat36, 1.17549435e-37);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat8.xyz;
        u_xlat36 = dot(u_xlat2.xyz, u_xlat8.xyz);
        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
        u_xlat39 = dot(u_xlat9.xyz, u_xlat8.xyz);
        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
        u_xlat36 = u_xlat36 * u_xlat36;
        u_xlat36 = u_xlat36 * u_xlat28.x + 1.00001001;
        u_xlat39 = u_xlat39 * u_xlat39;
        u_xlat36 = u_xlat36 * u_xlat36;
        u_xlat39 = max(u_xlat39, 0.100000001);
        u_xlat36 = u_xlat36 * u_xlat39;
        u_xlat36 = u_xlat38 * u_xlat36;
        u_xlat36 = u_xlat37 / u_xlat36;
        u_xlat8.xyz = u_xlat0.xyz * vec3(u_xlat36) + u_xlat12.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat7.xyz;
    }
    u_xlat0.xyz = u_xlat5.xyz * u_xlat6.xxx + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat7.xyz + u_xlat0.xyz;
    u_xlatb0 = _Surface==1.0;
    SV_Target0.w = (u_xlatb0) ? u_xlat1.x : 1.0;
    return;
}

