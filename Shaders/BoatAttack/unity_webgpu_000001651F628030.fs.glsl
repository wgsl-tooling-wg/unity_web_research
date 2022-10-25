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
	vec4 _ScaledScreenParams;
	vec2 _GlobalMipBias;
	float _AlphaToMaskAvailable;
	vec4 _MainLightPosition;
	vec4 _MainLightColor;
	vec4 _AmbientOcclusionParam;
	vec4 _AdditionalLightsCount;
	vec3 _WorldSpaceCameraPos;
	vec4 _ScreenParams;
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
layout(set = 1, binding = 4, std140) uniform UnityPerMaterial {
	vec4 Texture2D_B222E8F_TexelSize;
	vec4 Color_C30C7CA3;
	vec4 Texture2D_D9BFD5F1_TexelSize;
};
layout(set = 0, binding = 0) uniform mediump textureCube unity_SpecCube0;
layout(set = 0, binding = 1) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 2) uniform mediump texture2D unity_LightmapInd;
layout(set = 0, binding = 3) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 5) uniform mediump texture2D Texture2D_B222E8F;
layout(set = 0, binding = 6) uniform mediump texture2D Texture2D_D9BFD5F1;
layout(location = 0) in highp vec3 vs_INTERP0;
layout(location = 1) in highp vec3 vs_INTERP1;
layout(location = 2) in highp vec4 vs_INTERP2;
layout(location = 3) in highp vec4 vs_INTERP3;
layout(location = 4) in highp vec4 vs_INTERP4;
layout(location = 5) in highp vec2 vs_INTERP5;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 7) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 8) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 9) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 10) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 11) uniform mediump  sampler samplerTexture2D_B222E8F;
layout(set = 0, binding = 12) uniform mediump  sampler samplerTexture2D_D9BFD5F1;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffffu) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec3 u_xlat0;
vec3 u_xlat1;
int u_xlati1;
uvec3 u_xlatu1;
vec3 u_xlat2;
vec4 u_xlat3;
uint u_xlatu3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
bvec4 u_xlatb6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
bool u_xlatb12;
vec3 u_xlat16;
vec3 u_xlat17;
vec2 u_xlat23;
int u_xlati23;
uint u_xlatu23;
bvec2 u_xlatb23;
float u_xlat28;
float u_xlat33;
int u_xlati33;
uint u_xlatu33;
bool u_xlatb33;
float u_xlat34;
uint u_xlatu34;
bool u_xlatb34;
float u_xlat35;
bool u_xlatb35;
float u_xlat36;
int u_xlati36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
float u_xlat40;
int u_xlati40;
float u_xlat41;
float u_xlat42;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.x = dot(vs_INTERP1.xyz, vs_INTERP1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * vs_INTERP1.xyz;
    u_xlatb33 = unity_OrthoParams.w==0.0;
    u_xlat1.xyz = (-vs_INTERP0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat2.x = (u_xlatb33) ? u_xlat1.x : unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb33) ? u_xlat1.y : unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb33) ? u_xlat1.z : unity_MatrixV[2].z;
    u_xlat1.xyz = u_xlat2.yyy * unity_WorldToObject[1].xyz;
    u_xlat1.xyz = unity_WorldToObject[0].xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = unity_WorldToObject[2].xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3 = texture(sampler2D(Texture2D_B222E8F, samplerTexture2D_B222E8F), vs_INTERP3.xy, _GlobalMipBias.x);
    u_xlat4.xyz = u_xlat3.xyz * Color_C30C7CA3.xyz;
    u_xlat5 = texture(sampler2D(Texture2D_D9BFD5F1, samplerTexture2D_D9BFD5F1), vs_INTERP3.xy, _GlobalMipBias.x).wxyz;
    u_xlat6 = u_xlat5.yzwx * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat33 = dot(u_xlat6, u_xlat6);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16.xyz = vec3(u_xlat33) * u_xlat6.xyz;
    u_xlat33 = vs_INTERP4.y * 200.0;
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat3.xyz;
    u_xlat6.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat7.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat8.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat9.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat6.y = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat6.z = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat6.w = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlatb6 = lessThan(u_xlat6, _CascadeShadowSplitSphereRadii);
    u_xlat7.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat7.y = u_xlatb6.y ? float(1.0) : 0.0;
    u_xlat7.z = u_xlatb6.z ? float(1.0) : 0.0;
    u_xlat7.w = u_xlatb6.w ? float(1.0) : 0.0;
;
    u_xlat6.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
    u_xlat6.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
    u_xlat6.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
    u_xlat6.xyz = u_xlat6.xyz + u_xlat7.yzw;
    u_xlat7.yzw = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat33 = dot(u_xlat7, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat33 = (-u_xlat33) + 4.0;
    u_xlatu33 = uint(u_xlat33);
    u_xlati33 = int(u_xlatu33) << (2 & int(0x1F));
    u_xlat6.xyz = vs_INTERP0.yyy * _MainLightWorldToShadow[(u_xlati33 + 1) / 4][(u_xlati33 + 1) % 4].xyz;
    u_xlat6.xyz = _MainLightWorldToShadow[u_xlati33 / 4][u_xlati33 % 4].xyz * vs_INTERP0.xxx + u_xlat6.xyz;
    u_xlat6.xyz = _MainLightWorldToShadow[(u_xlati33 + 2) / 4][(u_xlati33 + 2) % 4].xyz * vs_INTERP0.zzz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz + _MainLightWorldToShadow[(u_xlati33 + 3) / 4][(u_xlati33 + 3) % 4].xyz;
    vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
    u_xlat33 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat34 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat33 = u_xlat33 * _MainLightShadowParams.x + u_xlat34;
    u_xlatb34 = 0.0>=u_xlat6.z;
    u_xlatb35 = u_xlat6.z>=1.0;
    u_xlatb34 = u_xlatb34 || u_xlatb35;
    u_xlat33 = (u_xlatb34) ? 1.0 : u_xlat33;
    u_xlat0.x = dot(u_xlat0.xyz, (-_MainLightPosition.xyz));
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat33) * _MainLightColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlatb34 = unity_LODFade.x<0.0;
    u_xlat35 = unity_LODFade.x + 1.0;
    u_xlat34 = (u_xlatb34) ? u_xlat35 : unity_LODFade.x;
    u_xlatb35 = 0.5>=u_xlat34;
    u_xlat1.xyz = abs(u_xlat1.xyz) * _ScreenParams.xyx;
    u_xlatu1.xyz = uvec3(u_xlat1.xyz);
    u_xlatu23 = u_xlatu1.z * 1025u;
    u_xlatu3 = u_xlatu23 >> (6u & uint(0x1F));
    u_xlati23 = int(u_xlatu23 ^ u_xlatu3);
    u_xlatu23 = uint(u_xlati23) * 9u;
    u_xlatu3 = u_xlatu23 >> (11u & uint(0x1F));
    u_xlati23 = int(u_xlatu23 ^ u_xlatu3);
    u_xlati23 = u_xlati23 * 32769;
    u_xlati12 = int(uint(u_xlati23) ^ u_xlatu1.y);
    u_xlatu12 = uint(u_xlati12) * 1025u;
    u_xlatu23 = u_xlatu12 >> (6u & uint(0x1F));
    u_xlati12 = int(u_xlatu23 ^ u_xlatu12);
    u_xlatu12 = uint(u_xlati12) * 9u;
    u_xlatu23 = u_xlatu12 >> (11u & uint(0x1F));
    u_xlati12 = int(u_xlatu23 ^ u_xlatu12);
    u_xlati12 = u_xlati12 * 32769;
    u_xlati1 = int(uint(u_xlati12) ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1) * 1025u;
    u_xlatu12 = u_xlatu1.x >> (6u & uint(0x1F));
    u_xlati1 = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1) * 9u;
    u_xlatu12 = u_xlatu1.x >> (11u & uint(0x1F));
    u_xlati1 = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlati1 = u_xlati1 * 32769;
    u_xlat1.x = intBitsToFloat(int(int_bitfieldInsert(1065353216, u_xlati1, 0 & int(0x1F), 23)));
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (u_xlatb35) ? u_xlat1.x : u_xlat12;
    u_xlat1.x = u_xlat34 * 2.0 + (-u_xlat1.x);
    u_xlat12 = u_xlat1.x * u_xlat3.w;
    u_xlatb23.x = u_xlat12>=0.400000006;
    u_xlat23.x = u_xlatb23.x ? u_xlat12 : float(0.0);
    u_xlat1.x = u_xlat3.w * u_xlat1.x + -0.400000006;
    u_xlat34 = dFdxCoarse(u_xlat12);
    u_xlat12 = dFdyCoarse(u_xlat12);
    u_xlat12 = abs(u_xlat12) + abs(u_xlat34);
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat1.x = u_xlat1.x / u_xlat12;
    u_xlat1.x = u_xlat1.x + 0.5;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb12 = _AlphaToMaskAvailable!=0.0;
    u_xlat1.x = (u_xlatb12) ? u_xlat1.x : u_xlat23.x;
    u_xlat23.x = u_xlat1.x + -9.99999975e-05;
    u_xlatb23.x = u_xlat23.x<0.0;
    if(((int(u_xlatb23.x) * int(0xffffffffu)))!=0){discard;}
    u_xlatb23.x = 0.0<vs_INTERP2.w;
    u_xlatb23.y = unity_WorldTransformParams.w>=0.0;
    u_xlat23.x = (u_xlatb23.x) ? float(1.0) : float(-1.0);
    u_xlat23.y = (u_xlatb23.y) ? float(1.0) : float(-1.0);
    u_xlat23.x = u_xlat23.y * u_xlat23.x;
    u_xlat3.xyz = vs_INTERP1.zxy * vs_INTERP2.yzx;
    u_xlat3.xyz = vs_INTERP1.yzx * vs_INTERP2.zxy + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat23.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16.yyy;
    u_xlat3.xyz = u_xlat16.xxx * vs_INTERP2.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16.zzz * vs_INTERP1.xyz + u_xlat3.xyz;
    u_xlat23.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23.x = inversesqrt(u_xlat23.x);
    u_xlat3.xyz = u_xlat23.xxx * u_xlat3.xyz;
    u_xlat6 = texture(sampler2D(unity_LightmapInd, samplerunity_Lightmap), vs_INTERP5.xy, _GlobalMipBias.x);
    u_xlat16.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_INTERP5.xy, _GlobalMipBias.x).xyz;
    u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat23.x = dot(u_xlat3.xyz, u_xlat6.xyz);
    u_xlat23.x = u_xlat23.x + 0.5;
    u_xlat16.xyz = u_xlat23.xxx * u_xlat16.xyz;
    u_xlat23.x = max(u_xlat6.w, 9.99999975e-05);
    u_xlat16.xyz = u_xlat16.xyz / u_xlat23.xxx;
    u_xlat23.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat6.xy = u_xlat23.xy * hlslcc_FragCoord.xy;
    u_xlat23.x = u_xlat6.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat6.z = (-u_xlat23.x) + 1.0;
    u_xlat5.x = u_xlat5.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat23.x = (-u_xlat5.x) + 1.0;
    u_xlat34 = u_xlat23.x * u_xlat23.x;
    u_xlat34 = max(u_xlat34, 0.0078125);
    u_xlat35 = u_xlat34 * u_xlat34;
    u_xlat36 = u_xlat5.x + 0.0400000215;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat37 = u_xlat34 * 4.0 + 2.0;
    u_xlat5.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat6.xz, _GlobalMipBias.x).x;
    u_xlat6.x = u_xlat5.x + -1.0;
    u_xlat6.x = _AmbientOcclusionParam.w * u_xlat6.x + 1.0;
    u_xlat5.x = min(u_xlat5.x, vs_INTERP4.w);
    u_xlat17.xyz = vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = u_xlat17.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat28 = (-u_xlat33) + 1.0;
    u_xlat33 = u_xlat17.x * u_xlat28 + u_xlat33;
    u_xlat17.xyz = u_xlat6.xxx * _MainLightColor.xyz;
    u_xlat7.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat7.x = u_xlat7.x + u_xlat7.x;
    u_xlat7.xyz = u_xlat3.xyz * (-u_xlat7.xxx) + (-u_xlat2.xyz);
    u_xlat40 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat40 = (-u_xlat40) + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat8.x = (-u_xlat23.x) * 0.699999988 + 1.70000005;
    u_xlat23.x = u_xlat23.x * u_xlat8.x;
    u_xlat23.x = u_xlat23.x * 6.0;
    u_xlat8 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat7.xyz, u_xlat23.x);
    u_xlat23.x = u_xlat8.w + -1.0;
    u_xlat23.x = unity_SpecCube0_HDR.w * u_xlat23.x + 1.0;
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat23.x = log2(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * unity_SpecCube0_HDR.y;
    u_xlat23.x = exp2(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat8.xyz * u_xlat23.xxx;
    u_xlat23.xy = vec2(u_xlat34) * vec2(u_xlat34) + vec2(-1.0, 1.0);
    u_xlat34 = float(1.0) / u_xlat23.y;
    u_xlat36 = u_xlat36 + -0.0399999991;
    u_xlat36 = u_xlat40 * u_xlat36 + 0.0399999991;
    u_xlat34 = u_xlat34 * u_xlat36;
    u_xlat7.xyz = vec3(u_xlat34) * u_xlat7.xyz;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat4.xyz + u_xlat7.xyz;
    u_xlat33 = u_xlat33 * unity_LightData.z;
    u_xlat34 = dot(u_xlat3.xyz, _MainLightPosition.xyz);
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat33 = u_xlat33 * u_xlat34;
    u_xlat17.xyz = vec3(u_xlat33) * u_xlat17.xyz;
    u_xlat7.xyz = u_xlat2.xyz + _MainLightPosition.xyz;
    u_xlat33 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat33 = max(u_xlat33, 1.17549435e-37);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat7.xyz = vec3(u_xlat33) * u_xlat7.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat7.xyz);
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
    u_xlat34 = dot(_MainLightPosition.xyz, u_xlat7.xyz);
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat33 = u_xlat33 * u_xlat23.x + 1.00001001;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat34 = max(u_xlat34, 0.100000001);
    u_xlat33 = u_xlat33 * u_xlat34;
    u_xlat33 = u_xlat37 * u_xlat33;
    u_xlat33 = u_xlat35 / u_xlat33;
    u_xlat7.xyz = vec3(u_xlat33) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat4.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat7.xyz;
    u_xlat33 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu33 =  uint(int(u_xlat33));
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu33 ; u_xlatu_loop_1++)
    {
        u_xlatu36 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati40 = int(u_xlatu_loop_1 & 3u);
        u_xlat36 = dot(unity_LightIndices[int(u_xlatu36)], uintBitsToFloat(ImmCB_0[u_xlati40]));
        u_xlati36 = int(u_xlat36);
        u_xlat8.xyz = (-vs_INTERP0.xyz) * _AdditionalLightsPosition[u_xlati36].www + _AdditionalLightsPosition[u_xlati36].xyz;
        u_xlat40 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat40 = max(u_xlat40, 6.10351562e-05);
        u_xlat41 = inversesqrt(u_xlat40);
        u_xlat9.xyz = vec3(u_xlat41) * u_xlat8.xyz;
        u_xlat42 = float(1.0) / float(u_xlat40);
        u_xlat40 = u_xlat40 * _AdditionalLightsAttenuation[u_xlati36].x;
        u_xlat40 = (-u_xlat40) * u_xlat40 + 1.0;
        u_xlat40 = max(u_xlat40, 0.0);
        u_xlat40 = u_xlat40 * u_xlat40;
        u_xlat40 = u_xlat40 * u_xlat42;
        u_xlat42 = dot(_AdditionalLightsSpotDir[u_xlati36].xyz, u_xlat9.xyz);
        u_xlat42 = u_xlat42 * _AdditionalLightsAttenuation[u_xlati36].z + _AdditionalLightsAttenuation[u_xlati36].w;
        u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
        u_xlat42 = u_xlat42 * u_xlat42;
        u_xlat40 = u_xlat40 * u_xlat42;
        u_xlat10.xyz = u_xlat6.xxx * _AdditionalLightsColor[u_xlati36].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat9.xyz);
        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
        u_xlat36 = u_xlat36 * u_xlat40;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat41) + u_xlat2.xyz;
        u_xlat36 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat36 = max(u_xlat36, 1.17549435e-37);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat8.xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat8.xyz);
        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
        u_xlat40 = dot(u_xlat9.xyz, u_xlat8.xyz);
        u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
        u_xlat36 = u_xlat36 * u_xlat36;
        u_xlat36 = u_xlat36 * u_xlat23.x + 1.00001001;
        u_xlat40 = u_xlat40 * u_xlat40;
        u_xlat36 = u_xlat36 * u_xlat36;
        u_xlat40 = max(u_xlat40, 0.100000001);
        u_xlat36 = u_xlat36 * u_xlat40;
        u_xlat36 = u_xlat37 * u_xlat36;
        u_xlat36 = u_xlat35 / u_xlat36;
        u_xlat8.xyz = vec3(u_xlat36) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat4.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat7.xyz;
    }
    u_xlat2.xyz = u_xlat16.xyz * u_xlat5.xxx + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat7.xyz + u_xlat2.xyz;
    SV_Target0.xyz = vs_INTERP4.www * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = (u_xlatb12) ? u_xlat1.x : 1.0;
    return;
}

