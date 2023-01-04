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
layout(set = 0, binding = 2) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 4) uniform mediump texture2D Texture2D_B222E8F;
layout(set = 0, binding = 5) uniform mediump texture2D Texture2D_D9BFD5F1;
layout(location = 0) in highp vec3 vs_INTERP0;
layout(location = 1) in highp vec3 vs_INTERP1;
layout(location = 2) in highp vec4 vs_INTERP2;
layout(location = 3) in highp vec4 vs_INTERP3;
layout(location = 4) in highp vec4 vs_INTERP4;
layout(location = 5) in highp vec2 vs_INTERP5;
layout(location = 6) in highp vec4 vs_INTERP9;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 6) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 7) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 8) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 9) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 10) uniform mediump  sampler samplerTexture2D_B222E8F;
layout(set = 0, binding = 11) uniform mediump  sampler samplerTexture2D_D9BFD5F1;
void main()
{
float u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
bvec2 u_xlatb11;
float u_xlat13;
bool u_xlatb13;
vec3 u_xlat14;
vec3 u_xlat17;
bool u_xlatb17;
float u_xlat24;
float u_xlat25;
float u_xlat28;
bool u_xlatb28;
float u_xlat34;
uint u_xlatu34;
float u_xlat36;
uint u_xlatu36;
float u_xlat37;
float u_xlat38;
int u_xlati38;
uint u_xlatu38;
bool u_xlatb38;
float u_xlat40;
int u_xlati40;
float u_xlat41;
float u_xlat42;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = dot(vs_INTERP1.xyz, vs_INTERP1.xyz);
    u_xlat0 = sqrt(u_xlat0);
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlatb11.x = 0.0<vs_INTERP2.w;
    u_xlatb11.y = unity_WorldTransformParams.w>=0.0;
    u_xlat11.x = (u_xlatb11.x) ? float(1.0) : float(-1.0);
    u_xlat11.y = (u_xlatb11.y) ? float(1.0) : float(-1.0);
    u_xlat11.x = u_xlat11.y * u_xlat11.x;
    u_xlat1.xyz = vs_INTERP1.zxy * vs_INTERP2.yzx;
    u_xlat1.xyz = vs_INTERP1.yzx * vs_INTERP2.zxy + (-u_xlat1.xyz);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat0) * vs_INTERP1.xyz;
    u_xlat2.xyz = vec3(u_xlat0) * vs_INTERP2.xyz;
    u_xlat3.xyz = u_xlat11.xyz * vec3(u_xlat0);
    u_xlat4 = texture(sampler2D(Texture2D_B222E8F, samplerTexture2D_B222E8F), vs_INTERP3.xy, _GlobalMipBias.x);
    u_xlat5.xyz = u_xlat4.xyz * Color_C30C7CA3.xyz;
    u_xlat6 = texture(sampler2D(Texture2D_D9BFD5F1, samplerTexture2D_D9BFD5F1), vs_INTERP3.xy, _GlobalMipBias.x).wxyz;
    u_xlat7 = u_xlat6.yzwx * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat0 = dot(u_xlat7, u_xlat7);
    u_xlat0 = inversesqrt(u_xlat0);
    u_xlat17.xyz = vec3(u_xlat0) * u_xlat7.xyz;
    u_xlat0 = vs_INTERP4.y * 200.0;
    u_xlat0 = min(u_xlat0, 1.0);
    u_xlat4.xyz = vec3(u_xlat0) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat17.yyy;
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat17.zzz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = max(u_xlat0, 1.17549435e-37);
    u_xlat0 = inversesqrt(u_xlat0);
    u_xlat1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
    u_xlat2.xyz = vs_INTERP0.yyy * _MainLightWorldToShadow[1 / 4][1 % 4].xyz;
    u_xlat2.xyz = _MainLightWorldToShadow[0 / 4][0 % 4].xyz * vs_INTERP0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _MainLightWorldToShadow[2 / 4][2 % 4].xyz * vs_INTERP0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + _MainLightWorldToShadow[3 / 4][3 % 4].xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat0 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat34 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat0 = u_xlat0 * _MainLightShadowParams.x + u_xlat34;
    u_xlatb2 = 0.0>=u_xlat2.z;
    u_xlatb13 = u_xlat2.z>=1.0;
    u_xlatb2 = u_xlatb13 || u_xlatb2;
    u_xlat0 = (u_xlatb2) ? 1.0 : u_xlat0;
    u_xlat1.x = dot(u_xlat1.xyz, (-_MainLightPosition.xyz));
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat0) * _MainLightColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlatb0 = u_xlat4.w>=0.400000006;
    u_xlat0 = u_xlatb0 ? u_xlat4.w : float(0.0);
    u_xlat2.x = u_xlat4.w + -0.400000006;
    u_xlat13 = dFdxCoarse(u_xlat4.w);
    u_xlat24 = dFdyCoarse(u_xlat4.w);
    u_xlat13 = abs(u_xlat24) + abs(u_xlat13);
    u_xlat13 = max(u_xlat13, 9.99999975e-05);
    u_xlat2.x = u_xlat2.x / u_xlat13;
    u_xlat2.x = u_xlat2.x + 0.5;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlatb13 = _AlphaToMaskAvailable!=0.0;
    u_xlat0 = (u_xlatb13) ? u_xlat2.x : u_xlat0;
    u_xlat2.x = u_xlat0 + -9.99999975e-05;
    u_xlatb2 = u_xlat2.x<0.0;
    if(((int(u_xlatb2) * int(0xffffffffu)))!=0){discard;}
    u_xlat11.xyz = u_xlat11.xyz * u_xlat17.yyy;
    u_xlat11.xyz = u_xlat17.xxx * vs_INTERP2.xyz + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat17.zzz * vs_INTERP1.xyz + u_xlat11.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlatb2 = unity_OrthoParams.w==0.0;
    u_xlat3.xyz = (-vs_INTERP0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat4.x = (u_xlatb2) ? u_xlat3.x : unity_MatrixV[0].z;
    u_xlat4.y = (u_xlatb2) ? u_xlat3.y : unity_MatrixV[1].z;
    u_xlat4.z = (u_xlatb2) ? u_xlat3.z : unity_MatrixV[2].z;
    u_xlat2.xzw = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_INTERP5.xy, _GlobalMipBias.x).xyz;
    u_xlat3.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat3.xy = u_xlat3.xy * hlslcc_FragCoord.xy;
    u_xlat14.x = u_xlat3.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat3.z = (-u_xlat14.x) + 1.0;
    u_xlat6.x = u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat0 = min(u_xlat0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat14.x = (-u_xlat6.x) + 1.0;
    u_xlat36 = u_xlat14.x * u_xlat14.x;
    u_xlat36 = max(u_xlat36, 0.0078125);
    u_xlat37 = u_xlat36 * u_xlat36;
    u_xlat38 = u_xlat6.x + 0.0400000215;
    u_xlat38 = min(u_xlat38, 1.0);
    u_xlat6.x = u_xlat36 * 4.0 + 2.0;
    u_xlat3.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat3.xz, _GlobalMipBias.x).x;
    u_xlat25 = u_xlat3.x + -1.0;
    u_xlat25 = _AmbientOcclusionParam.w * u_xlat25 + 1.0;
    u_xlat3.x = min(u_xlat3.x, vs_INTERP4.w);
    vec3 txVec1 = vec3(vs_INTERP9.xy,vs_INTERP9.z);
    u_xlat17.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
    u_xlat34 = u_xlat17.x * _MainLightShadowParams.x + u_xlat34;
    u_xlatb17 = 0.0>=vs_INTERP9.z;
    u_xlatb28 = vs_INTERP9.z>=1.0;
    u_xlatb17 = u_xlatb28 || u_xlatb17;
    u_xlat34 = (u_xlatb17) ? 1.0 : u_xlat34;
    u_xlat17.xyz = vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = u_xlat17.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat28 = (-u_xlat34) + 1.0;
    u_xlat34 = u_xlat17.x * u_xlat28 + u_xlat34;
    u_xlat17.xyz = vec3(u_xlat25) * _MainLightColor.xyz;
    u_xlat7.x = dot((-u_xlat4.xyz), u_xlat11.xyz);
    u_xlat7.x = u_xlat7.x + u_xlat7.x;
    u_xlat7.xyz = u_xlat11.xyz * (-u_xlat7.xxx) + (-u_xlat4.xyz);
    u_xlat40 = dot(u_xlat11.xyz, u_xlat4.xyz);
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat40 = (-u_xlat40) + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat8.x = (-u_xlat14.x) * 0.699999988 + 1.70000005;
    u_xlat14.x = u_xlat14.x * u_xlat8.x;
    u_xlat14.x = u_xlat14.x * 6.0;
    u_xlat8 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat7.xyz, u_xlat14.x);
    u_xlat14.x = u_xlat8.w + -1.0;
    u_xlat14.x = unity_SpecCube0_HDR.w * u_xlat14.x + 1.0;
    u_xlat14.x = max(u_xlat14.x, 0.0);
    u_xlat14.x = log2(u_xlat14.x);
    u_xlat14.x = u_xlat14.x * unity_SpecCube0_HDR.y;
    u_xlat14.x = exp2(u_xlat14.x);
    u_xlat14.x = u_xlat14.x * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat8.xyz * u_xlat14.xxx;
    u_xlat14.xz = vec2(u_xlat36) * vec2(u_xlat36) + vec2(-1.0, 1.0);
    u_xlat36 = float(1.0) / u_xlat14.z;
    u_xlat38 = u_xlat38 + -0.0399999991;
    u_xlat38 = u_xlat40 * u_xlat38 + 0.0399999991;
    u_xlat36 = u_xlat36 * u_xlat38;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat2.xzw = u_xlat2.xzw * u_xlat5.xyz + u_xlat7.xyz;
    u_xlat34 = u_xlat34 * unity_LightData.z;
    u_xlat36 = dot(u_xlat11.xyz, _MainLightPosition.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat34 = u_xlat34 * u_xlat36;
    u_xlat17.xyz = vec3(u_xlat34) * u_xlat17.xyz;
    u_xlat7.xyz = u_xlat4.xyz + _MainLightPosition.xyz;
    u_xlat34 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-37);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat7.xyz = vec3(u_xlat34) * u_xlat7.xyz;
    u_xlat34 = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat36 = dot(_MainLightPosition.xyz, u_xlat7.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat14.x + 1.00001001;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat36 = max(u_xlat36, 0.100000001);
    u_xlat34 = u_xlat34 * u_xlat36;
    u_xlat34 = u_xlat6.x * u_xlat34;
    u_xlat34 = u_xlat37 / u_xlat34;
    u_xlat7.xyz = vec3(u_xlat34) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat5.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat7.xyz;
    u_xlat34 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu34 =  uint(int(u_xlat34));
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu34 ; u_xlatu_loop_1++)
    {
        u_xlatu38 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati40 = int(u_xlatu_loop_1 & 3u);
        u_xlat38 = dot(unity_LightIndices[int(u_xlatu38)], uintBitsToFloat(ImmCB_0[u_xlati40]));
        u_xlati38 = int(u_xlat38);
        u_xlat8.xyz = (-vs_INTERP0.xyz) * _AdditionalLightsPosition[u_xlati38].www + _AdditionalLightsPosition[u_xlati38].xyz;
        u_xlat40 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat40 = max(u_xlat40, 6.10351562e-05);
        u_xlat41 = inversesqrt(u_xlat40);
        u_xlat9.xyz = vec3(u_xlat41) * u_xlat8.xyz;
        u_xlat42 = float(1.0) / float(u_xlat40);
        u_xlat40 = u_xlat40 * _AdditionalLightsAttenuation[u_xlati38].x;
        u_xlat40 = (-u_xlat40) * u_xlat40 + 1.0;
        u_xlat40 = max(u_xlat40, 0.0);
        u_xlat40 = u_xlat40 * u_xlat40;
        u_xlat40 = u_xlat40 * u_xlat42;
        u_xlat42 = dot(_AdditionalLightsSpotDir[u_xlati38].xyz, u_xlat9.xyz);
        u_xlat42 = u_xlat42 * _AdditionalLightsAttenuation[u_xlati38].z + _AdditionalLightsAttenuation[u_xlati38].w;
        u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
        u_xlat42 = u_xlat42 * u_xlat42;
        u_xlat40 = u_xlat40 * u_xlat42;
        u_xlat10.xyz = vec3(u_xlat25) * _AdditionalLightsColor[u_xlati38].xyz;
        u_xlat38 = dot(u_xlat11.xyz, u_xlat9.xyz);
        u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
        u_xlat38 = u_xlat38 * u_xlat40;
        u_xlat10.xyz = vec3(u_xlat38) * u_xlat10.xyz;
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat41) + u_xlat4.xyz;
        u_xlat38 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat38 = max(u_xlat38, 1.17549435e-37);
        u_xlat38 = inversesqrt(u_xlat38);
        u_xlat8.xyz = vec3(u_xlat38) * u_xlat8.xyz;
        u_xlat38 = dot(u_xlat11.xyz, u_xlat8.xyz);
        u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
        u_xlat40 = dot(u_xlat9.xyz, u_xlat8.xyz);
        u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
        u_xlat38 = u_xlat38 * u_xlat38;
        u_xlat38 = u_xlat38 * u_xlat14.x + 1.00001001;
        u_xlat40 = u_xlat40 * u_xlat40;
        u_xlat38 = u_xlat38 * u_xlat38;
        u_xlat40 = max(u_xlat40, 0.100000001);
        u_xlat38 = u_xlat38 * u_xlat40;
        u_xlat38 = u_xlat6.x * u_xlat38;
        u_xlat38 = u_xlat37 / u_xlat38;
        u_xlat8.xyz = vec3(u_xlat38) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat5.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat7.xyz;
    }
    u_xlat11.xyz = u_xlat2.xzw * u_xlat3.xxx + u_xlat17.xyz;
    u_xlat11.xyz = u_xlat7.xyz + u_xlat11.xyz;
    SV_Target0.xyz = vs_INTERP4.www * u_xlat1.xyz + u_xlat11.xyz;
    SV_Target0.w = (u_xlatb13) ? u_xlat0 : 1.0;
    return;
}

