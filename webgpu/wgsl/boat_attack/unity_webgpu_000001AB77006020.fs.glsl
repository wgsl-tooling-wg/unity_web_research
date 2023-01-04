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
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 unity_OrthoParams;
	vec4 _ScaleBiasRt;
	vec4 unity_FogParams;
	vec4 unity_FogColor;
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
layout(location = 6) in highp vec4 vs_INTERP9;
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
vec3 u_xlat2;
int u_xlati2;
uvec3 u_xlatu2;
bool u_xlatb2;
vec4 u_xlat3;
uint u_xlatu3;
vec4 u_xlat4;
vec4 u_xlat5;
int u_xlati5;
uint u_xlatu5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
vec2 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat14;
int u_xlati14;
uint u_xlatu14;
bvec2 u_xlatb14;
vec3 u_xlat15;
vec3 u_xlat17;
int u_xlati17;
float u_xlat18;
vec3 u_xlat21;
float u_xlat26;
int u_xlati26;
uint u_xlatu26;
float u_xlat29;
float u_xlat30;
bool u_xlatb30;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
uint u_xlatu37;
float u_xlat38;
bool u_xlatb38;
float u_xlat40;
uint u_xlatu40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
bool u_xlatb42;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.x = dot(vs_INTERP1.xyz, vs_INTERP1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * vs_INTERP1.xyz;
    u_xlatb36 = unity_OrthoParams.w==0.0;
    u_xlat1.xyz = (-vs_INTERP0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat2.x = unity_MatrixV[0].z;
    u_xlat2.y = unity_MatrixV[1].z;
    u_xlat2.z = unity_MatrixV[2].z;
    u_xlat1.xyz = (bool(u_xlatb36)) ? u_xlat1.xyz : u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
    u_xlat2.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat36 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * u_xlat2.xyz;
    u_xlat3 = texture(sampler2D(Texture2D_B222E8F, samplerTexture2D_B222E8F), vs_INTERP3.xy, _GlobalMipBias.x);
    u_xlat4.xyz = u_xlat3.xyz * Color_C30C7CA3.xyz;
    u_xlat5 = texture(sampler2D(Texture2D_D9BFD5F1, samplerTexture2D_D9BFD5F1), vs_INTERP3.xy, _GlobalMipBias.x).wxyz;
    u_xlat6 = u_xlat5.yzwx * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat36 = dot(u_xlat6, u_xlat6);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat17.xyz = vec3(u_xlat36) * u_xlat6.xyz;
    u_xlat36 = vs_INTERP4.y * 200.0;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz;
    u_xlat6.xyz = vs_INTERP0.yyy * _MainLightWorldToShadow[1 / 4][1 % 4].xyz;
    u_xlat6.xyz = _MainLightWorldToShadow[0 / 4][0 % 4].xyz * vs_INTERP0.xxx + u_xlat6.xyz;
    u_xlat6.xyz = _MainLightWorldToShadow[2 / 4][2 % 4].xyz * vs_INTERP0.zzz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz + _MainLightWorldToShadow[3 / 4][3 % 4].xyz;
    vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
    u_xlat36 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat37 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat36 = u_xlat36 * _MainLightShadowParams.x + u_xlat37;
    u_xlatb38 = 0.0>=u_xlat6.z;
    u_xlatb40 = u_xlat6.z>=1.0;
    u_xlatb38 = u_xlatb38 || u_xlatb40;
    u_xlat36 = (u_xlatb38) ? 1.0 : u_xlat36;
    u_xlat0.x = dot(u_xlat0.xyz, (-_MainLightPosition.xyz));
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12.xyz = vec3(u_xlat36) * _MainLightColor.xyz;
    u_xlat0.xyz = u_xlat12.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlatb36 = unity_LODFade.x<0.0;
    u_xlat38 = unity_LODFade.x + 1.0;
    u_xlat36 = (u_xlatb36) ? u_xlat38 : unity_LODFade.x;
    u_xlatb38 = 0.5>=u_xlat36;
    u_xlat2.xyz = abs(u_xlat2.xyz) * _ScreenParams.xyx;
    u_xlatu2.xyz = uvec3(u_xlat2.xyz);
    u_xlatu26 = u_xlatu2.z * 1025u;
    u_xlatu3 = u_xlatu26 >> (6u & uint(0x1F));
    u_xlati26 = int(u_xlatu26 ^ u_xlatu3);
    u_xlatu26 = uint(u_xlati26) * 9u;
    u_xlatu3 = u_xlatu26 >> (11u & uint(0x1F));
    u_xlati26 = int(u_xlatu26 ^ u_xlatu3);
    u_xlati26 = u_xlati26 * 32769;
    u_xlati14 = int(uint(u_xlati26) ^ u_xlatu2.y);
    u_xlatu14 = uint(u_xlati14) * 1025u;
    u_xlatu26 = u_xlatu14 >> (6u & uint(0x1F));
    u_xlati14 = int(u_xlatu26 ^ u_xlatu14);
    u_xlatu14 = uint(u_xlati14) * 9u;
    u_xlatu26 = u_xlatu14 >> (11u & uint(0x1F));
    u_xlati14 = int(u_xlatu26 ^ u_xlatu14);
    u_xlati14 = u_xlati14 * 32769;
    u_xlati2 = int(uint(u_xlati14) ^ u_xlatu2.x);
    u_xlatu2.x = uint(u_xlati2) * 1025u;
    u_xlatu14 = u_xlatu2.x >> (6u & uint(0x1F));
    u_xlati2 = int(u_xlatu14 ^ u_xlatu2.x);
    u_xlatu2.x = uint(u_xlati2) * 9u;
    u_xlatu14 = u_xlatu2.x >> (11u & uint(0x1F));
    u_xlati2 = int(u_xlatu14 ^ u_xlatu2.x);
    u_xlati2 = u_xlati2 * 32769;
    u_xlat2.x = intBitsToFloat(int(int_bitfieldInsert(1065353216, u_xlati2, 0 & int(0x1F), 23)));
    u_xlat2.x = u_xlat2.x + -1.0;
    u_xlat14.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (u_xlatb38) ? u_xlat2.x : u_xlat14.x;
    u_xlat36 = u_xlat36 * 2.0 + (-u_xlat2.x);
    u_xlat2.x = u_xlat36 * u_xlat3.w;
    u_xlatb14.x = u_xlat2.x>=0.400000006;
    u_xlat14.x = u_xlatb14.x ? u_xlat2.x : float(0.0);
    u_xlat36 = u_xlat3.w * u_xlat36 + -0.400000006;
    u_xlat26 = dFdxCoarse(u_xlat2.x);
    u_xlat2.x = dFdyCoarse(u_xlat2.x);
    u_xlat2.x = abs(u_xlat2.x) + abs(u_xlat26);
    u_xlat2.x = max(u_xlat2.x, 9.99999975e-05);
    u_xlat36 = u_xlat36 / u_xlat2.x;
    u_xlat36 = u_xlat36 + 0.5;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlatb2 = _AlphaToMaskAvailable!=0.0;
    u_xlat36 = (u_xlatb2) ? u_xlat36 : u_xlat14.x;
    u_xlat14.x = u_xlat36 + -9.99999975e-05;
    u_xlatb14.x = u_xlat14.x<0.0;
    if(((int(u_xlatb14.x) * int(0xffffffffu)))!=0){discard;}
    u_xlatb14.x = 0.0<vs_INTERP2.w;
    u_xlatb14.y = unity_WorldTransformParams.w>=0.0;
    u_xlat14.x = (u_xlatb14.x) ? float(1.0) : float(-1.0);
    u_xlat14.y = (u_xlatb14.y) ? float(1.0) : float(-1.0);
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat3.xyz = vs_INTERP1.zxy * vs_INTERP2.yzx;
    u_xlat3.xyz = vs_INTERP1.yzx * vs_INTERP2.zxy + (-u_xlat3.xyz);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat3.xyz;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat17.yyy;
    u_xlat14.xyz = u_xlat17.xxx * vs_INTERP2.xyz + u_xlat14.xyz;
    u_xlat14.xyz = u_xlat17.zzz * vs_INTERP1.xyz + u_xlat14.xyz;
    u_xlat3.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat14.xyz = u_xlat14.xyz * u_xlat3.xxx;
    u_xlat3.x = vs_INTERP0.y * unity_MatrixV[1].z;
    u_xlat3.x = unity_MatrixV[0].z * vs_INTERP0.x + u_xlat3.x;
    u_xlat3.x = unity_MatrixV[2].z * vs_INTERP0.z + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + unity_MatrixV[3].z;
    u_xlat3.x = (-u_xlat3.x) + (-_ProjectionParams.y);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x * unity_FogParams.x;
    u_xlat6 = texture(sampler2D(unity_LightmapInd, samplerunity_Lightmap), vs_INTERP5.xy, _GlobalMipBias.x);
    u_xlat15.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_INTERP5.xy, _GlobalMipBias.x).xyz;
    u_xlat17.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat40 = dot(u_xlat14.xyz, u_xlat17.xyz);
    u_xlat40 = u_xlat40 + 0.5;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40);
    u_xlat40 = max(u_xlat6.w, 9.99999975e-05);
    u_xlat15.xyz = u_xlat15.xyz / vec3(u_xlat40);
    u_xlat17.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat6.xy = u_xlat17.xy * hlslcc_FragCoord.xy;
    u_xlat40 = u_xlat6.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat6.z = (-u_xlat40) + 1.0;
    u_xlat5.x = u_xlat5.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat36 = u_xlat36;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat40 = (-u_xlat5.x) + 1.0;
    u_xlat17.x = u_xlat40 * u_xlat40;
    u_xlat17.x = max(u_xlat17.x, 0.0078125);
    u_xlat29 = u_xlat17.x * u_xlat17.x;
    u_xlat5.x = u_xlat5.x + 0.0400000215;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat41 = u_xlat17.x * 4.0 + 2.0;
    u_xlat6.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat6.xz, _GlobalMipBias.x).x;
    u_xlat18 = u_xlat6.x + -1.0;
    u_xlat18 = _AmbientOcclusionParam.w * u_xlat18 + 1.0;
    u_xlat6.x = min(u_xlat6.x, vs_INTERP4.w);
    vec3 txVec1 = vec3(vs_INTERP9.xy,vs_INTERP9.z);
    u_xlat30 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
    u_xlat37 = u_xlat30 * _MainLightShadowParams.x + u_xlat37;
    u_xlatb30 = 0.0>=vs_INTERP9.z;
    u_xlatb42 = vs_INTERP9.z>=1.0;
    u_xlatb30 = u_xlatb42 || u_xlatb30;
    u_xlat37 = (u_xlatb30) ? 1.0 : u_xlat37;
    u_xlat7.xyz = vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat30 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat30 = u_xlat30 * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
    u_xlat42 = (-u_xlat37) + 1.0;
    u_xlat37 = u_xlat30 * u_xlat42 + u_xlat37;
    u_xlat7.xyz = vec3(u_xlat18) * _MainLightColor.xyz;
    u_xlat30 = dot((-u_xlat1.xyz), u_xlat14.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat8.xyz = u_xlat14.xyz * (-vec3(u_xlat30)) + (-u_xlat1.xyz);
    u_xlat30 = dot(u_xlat14.xyz, u_xlat1.xyz);
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
    u_xlat30 = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat42 = (-u_xlat40) * 0.699999988 + 1.70000005;
    u_xlat4.w = u_xlat40 * u_xlat42;
    u_xlat4 = u_xlat4 * vec4(0.959999979, 0.959999979, 0.959999979, 6.0);
    u_xlat8 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat8.xyz, u_xlat4.w);
    u_xlat40 = u_xlat8.w + -1.0;
    u_xlat40 = unity_SpecCube0_HDR.w * u_xlat40 + 1.0;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat40 = log2(u_xlat40);
    u_xlat40 = u_xlat40 * unity_SpecCube0_HDR.y;
    u_xlat40 = exp2(u_xlat40);
    u_xlat40 = u_xlat40 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat40);
    u_xlat9.xy = u_xlat17.xx * u_xlat17.xx + vec2(-1.0, 1.0);
    u_xlat40 = float(1.0) / u_xlat9.y;
    u_xlat5.x = u_xlat5.x + -0.0399999991;
    u_xlat5.x = u_xlat30 * u_xlat5.x + 0.0399999991;
    u_xlat40 = u_xlat40 * u_xlat5.x;
    u_xlat8.xyz = vec3(u_xlat40) * u_xlat8.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat4.xyz + u_xlat8.xyz;
    u_xlat37 = u_xlat37 * unity_LightData.z;
    u_xlat40 = dot(u_xlat14.xyz, _MainLightPosition.xyz);
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat37 = u_xlat37 * u_xlat40;
    u_xlat7.xyz = vec3(u_xlat37) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat1.xyz + _MainLightPosition.xyz;
    u_xlat37 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat37 = max(u_xlat37, 1.17549435e-37);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat37 = dot(u_xlat14.xyz, u_xlat8.xyz);
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
    u_xlat40 = dot(_MainLightPosition.xyz, u_xlat8.xyz);
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat9.x + 1.00001001;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat37 = u_xlat37 * u_xlat40;
    u_xlat37 = u_xlat41 * u_xlat37;
    u_xlat37 = u_xlat29 / u_xlat37;
    u_xlat8.xyz = vec3(u_xlat37) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat4.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat37 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu37 =  uint(int(u_xlat37));
    u_xlat8.x = float(0.0);
    u_xlat8.y = float(0.0);
    u_xlat8.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu37 ; u_xlatu_loop_1++)
    {
        u_xlatu5 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati17 = int(u_xlatu_loop_1 & 3u);
        u_xlat5.x = dot(unity_LightIndices[int(u_xlatu5)], uintBitsToFloat(ImmCB_0[u_xlati17]));
        u_xlati5 = int(u_xlat5.x);
        u_xlat21.xyz = (-vs_INTERP0.xyz) * _AdditionalLightsPosition[u_xlati5].www + _AdditionalLightsPosition[u_xlati5].xyz;
        u_xlat17.x = dot(u_xlat21.xyz, u_xlat21.xyz);
        u_xlat17.x = max(u_xlat17.x, 6.10351562e-05);
        u_xlat30 = inversesqrt(u_xlat17.x);
        u_xlat10.xyz = vec3(u_xlat30) * u_xlat21.xyz;
        u_xlat42 = float(1.0) / float(u_xlat17.x);
        u_xlat17.x = u_xlat17.x * _AdditionalLightsAttenuation[u_xlati5].x;
        u_xlat17.x = (-u_xlat17.x) * u_xlat17.x + 1.0;
        u_xlat17.x = max(u_xlat17.x, 0.0);
        u_xlat17.x = u_xlat17.x * u_xlat17.x;
        u_xlat17.x = u_xlat17.x * u_xlat42;
        u_xlat42 = dot(_AdditionalLightsSpotDir[u_xlati5].xyz, u_xlat10.xyz);
        u_xlat42 = u_xlat42 * _AdditionalLightsAttenuation[u_xlati5].z + _AdditionalLightsAttenuation[u_xlati5].w;
        u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
        u_xlat42 = u_xlat42 * u_xlat42;
        u_xlat17.x = u_xlat17.x * u_xlat42;
        u_xlat11.xyz = vec3(u_xlat18) * _AdditionalLightsColor[u_xlati5].xyz;
        u_xlat5.x = dot(u_xlat14.xyz, u_xlat10.xyz);
        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
        u_xlat5.x = u_xlat5.x * u_xlat17.x;
        u_xlat11.xyz = u_xlat5.xxx * u_xlat11.xyz;
        u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat30) + u_xlat1.xyz;
        u_xlat5.x = dot(u_xlat21.xyz, u_xlat21.xyz);
        u_xlat5.x = max(u_xlat5.x, 1.17549435e-37);
        u_xlat5.x = inversesqrt(u_xlat5.x);
        u_xlat21.xyz = u_xlat5.xxx * u_xlat21.xyz;
        u_xlat5.x = dot(u_xlat14.xyz, u_xlat21.xyz);
        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
        u_xlat5.y = dot(u_xlat10.xyz, u_xlat21.xyz);
        u_xlat5.y = clamp(u_xlat5.y, 0.0, 1.0);
        u_xlat5.xy = u_xlat5.xy * u_xlat5.xy;
        u_xlat5.x = u_xlat5.x * u_xlat9.x + 1.00001001;
        u_xlat5.x = u_xlat5.x * u_xlat5.x;
        u_xlat17.x = max(u_xlat5.y, 0.100000001);
        u_xlat5.x = u_xlat17.x * u_xlat5.x;
        u_xlat5.x = u_xlat41 * u_xlat5.x;
        u_xlat5.x = u_xlat29 / u_xlat5.x;
        u_xlat21.xyz = u_xlat5.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat4.xyz;
        u_xlat8.xyz = u_xlat21.xyz * u_xlat11.xyz + u_xlat8.xyz;
    }
    u_xlat1.xyz = u_xlat15.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat8.xyz + u_xlat1.xyz;
    u_xlat0.xyz = vs_INTERP4.www * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = u_xlat3.x * (-u_xlat3.x);
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = (u_xlatb2) ? u_xlat36 : 1.0;
    return;
}

