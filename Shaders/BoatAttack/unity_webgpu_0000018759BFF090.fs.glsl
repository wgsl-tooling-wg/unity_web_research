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
layout(set = 0, binding = 1) uniform mediump texture2D unity_LightmapInd;
layout(set = 0, binding = 2) uniform mediump texture2D _BaseMap;
layout(set = 0, binding = 3) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _MainLightShadowmapTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD1;
layout(location = 2) in highp vec3 vs_TEXCOORD2;
layout(location = 3) in highp vec2 vs_TEXCOORD7;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 5) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 6) uniform mediump  sampler sampler_BaseMap;
layout(set = 0, binding = 7) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 8) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
void main()
{
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
int u_xlati5;
vec3 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
float u_xlat16;
bool u_xlatb16;
float u_xlat22;
int u_xlati22;
uint u_xlatu22;
float u_xlat23;
uint u_xlatu24;
float u_xlat25;
int u_xlati25;
uint u_xlatu25;
bool u_xlatb25;
float u_xlat26;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_BaseMap, sampler_BaseMap), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat0 = u_xlat0.wxyz * _BaseColor.wxyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat3.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat4.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat5.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.y = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.z = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat2.w = dot(u_xlat5.xyz, u_xlat5.xyz);
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
    u_xlat22 = dot(u_xlat3, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat22 = (-u_xlat22) + 4.0;
    u_xlatu22 = uint(u_xlat22);
    u_xlati22 = int(u_xlatu22) << (2 & int(0x1F));
    u_xlat2.xyz = vs_TEXCOORD1.yyy * _MainLightWorldToShadow[(u_xlati22 + 1) / 4][(u_xlati22 + 1) % 4].xyz;
    u_xlat2.xyz = _MainLightWorldToShadow[u_xlati22 / 4][u_xlati22 % 4].xyz * vs_TEXCOORD1.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _MainLightWorldToShadow[(u_xlati22 + 2) / 4][(u_xlati22 + 2) % 4].xyz * vs_TEXCOORD1.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + _MainLightWorldToShadow[(u_xlati22 + 3) / 4][(u_xlati22 + 3) % 4].xyz;
    u_xlat3 = texture(sampler2D(unity_LightmapInd, samplerunity_Lightmap), vs_TEXCOORD7.xy, _GlobalMipBias.x);
    u_xlat4.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_TEXCOORD7.xy, _GlobalMipBias.x).xyz;
    u_xlat3.xyz = u_xlat3.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat22 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat22 = u_xlat22 + 0.5;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = max(u_xlat3.w, 9.99999975e-05);
    u_xlat3.xyz = u_xlat3.xyz / vec3(u_xlat22);
    u_xlat4.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat4.xy = u_xlat4.xy * hlslcc_FragCoord.xy;
    u_xlat22 = u_xlat4.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat4.z = (-u_xlat22) + 1.0;
    u_xlat22 = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat4.xz, _GlobalMipBias.x).x;
    u_xlat23 = u_xlat22 + -1.0;
    u_xlat23 = _AmbientOcclusionParam.w * u_xlat23 + 1.0;
    u_xlat22 = min(u_xlat22, 1.0);
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat9 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat2.x = u_xlat2.x * _MainLightShadowParams.x + u_xlat9;
    u_xlatb9 = 0.0>=u_xlat2.z;
    u_xlatb16 = u_xlat2.z>=1.0;
    u_xlatb9 = u_xlatb16 || u_xlatb9;
    u_xlat2.x = (u_xlatb9) ? 1.0 : u_xlat2.x;
    u_xlat4.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat9 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat9 = u_xlat9 * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = (-u_xlat2.x) + 1.0;
    u_xlat2.x = u_xlat9 * u_xlat16 + u_xlat2.x;
    u_xlat4.xyz = vec3(u_xlat23) * _MainLightColor.xyz;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = u_xlat2.x * unity_LightData.z;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat1.xyz, _MainLightPosition.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzw * u_xlat2.xyz;
    u_xlat22 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu22 =  uint(int(u_xlat22));
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu22 ; u_xlatu_loop_1++)
    {
        u_xlatu25 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati5 = int(u_xlatu_loop_1 & 3u);
        u_xlat25 = dot(unity_LightIndices[int(u_xlatu25)], uintBitsToFloat(ImmCB_0[u_xlati5]));
        u_xlati25 = int(u_xlat25);
        u_xlat5.xyz = (-vs_TEXCOORD1.xyz) * _AdditionalLightsPosition[u_xlati25].www + _AdditionalLightsPosition[u_xlati25].xyz;
        u_xlat26 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat26 = max(u_xlat26, 6.10351562e-05);
        u_xlat6.x = inversesqrt(u_xlat26);
        u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xxx;
        u_xlat6.x = float(1.0) / float(u_xlat26);
        u_xlat26 = u_xlat26 * _AdditionalLightsAttenuation[u_xlati25].x;
        u_xlat26 = (-u_xlat26) * u_xlat26 + 1.0;
        u_xlat26 = max(u_xlat26, 0.0);
        u_xlat26 = u_xlat26 * u_xlat26;
        u_xlat26 = u_xlat26 * u_xlat6.x;
        u_xlat6.x = dot(_AdditionalLightsSpotDir[u_xlati25].xyz, u_xlat5.xyz);
        u_xlat6.x = u_xlat6.x * _AdditionalLightsAttenuation[u_xlati25].z + _AdditionalLightsAttenuation[u_xlati25].w;
        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
        u_xlat6.x = u_xlat6.x * u_xlat6.x;
        u_xlat26 = u_xlat26 * u_xlat6.x;
        u_xlat6.xyz = vec3(u_xlat23) * _AdditionalLightsColor[u_xlati25].xyz;
        u_xlat6.xyz = vec3(u_xlat26) * u_xlat6.xyz;
        u_xlat25 = dot(u_xlat1.xyz, u_xlat5.xyz);
        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
        u_xlat5.xyz = vec3(u_xlat25) * u_xlat6.xyz;
        u_xlat4.xyz = u_xlat5.xyz * u_xlat0.yzw + u_xlat4.xyz;
    }
    u_xlat7.xyz = u_xlat3.xyz * u_xlat0.yzw + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat4.xyz + u_xlat7.xyz;
    u_xlatb7 = _Surface==1.0;
    SV_Target0.w = (u_xlatb7) ? u_xlat0.x : 1.0;
    return;
}

