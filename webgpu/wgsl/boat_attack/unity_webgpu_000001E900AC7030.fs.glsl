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
vec3 u_xlat0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat17;
bool u_xlatb17;
float u_xlat23;
float u_xlat25;
float u_xlat26;
float u_xlat28;
bool u_xlatb28;
float u_xlat33;
bool u_xlatb33;
float u_xlat35;
uint u_xlatu35;
float u_xlat36;
uint u_xlatu36;
float u_xlat37;
int u_xlati37;
uint u_xlatu37;
bool u_xlatb37;
float u_xlat38;
float u_xlat40;
int u_xlati40;
float u_xlat41;
float u_xlat42;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.x = dot(vs_INTERP1.xyz, vs_INTERP1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * vs_INTERP1.xyz;
    u_xlat1 = texture(sampler2D(Texture2D_B222E8F, samplerTexture2D_B222E8F), vs_INTERP3.xy, _GlobalMipBias.x);
    u_xlat2.xyz = u_xlat1.xyz * Color_C30C7CA3.xyz;
    u_xlat3 = texture(sampler2D(Texture2D_D9BFD5F1, samplerTexture2D_D9BFD5F1), vs_INTERP3.xy, _GlobalMipBias.x).wxyz;
    u_xlat4 = u_xlat3.yzwx * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat33 = dot(u_xlat4, u_xlat4);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat14.xyz = vec3(u_xlat33) * u_xlat4.xyz;
    u_xlat33 = vs_INTERP4.y * 200.0;
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat4.xyz = vs_INTERP0.yyy * _MainLightWorldToShadow[1 / 4][1 % 4].xyz;
    u_xlat4.xyz = _MainLightWorldToShadow[0 / 4][0 % 4].xyz * vs_INTERP0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = _MainLightWorldToShadow[2 / 4][2 % 4].xyz * vs_INTERP0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + _MainLightWorldToShadow[3 / 4][3 % 4].xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat33 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat35 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat33 = u_xlat33 * _MainLightShadowParams.x + u_xlat35;
    u_xlatb4 = 0.0>=u_xlat4.z;
    u_xlatb15 = u_xlat4.z>=1.0;
    u_xlatb4 = u_xlatb15 || u_xlatb4;
    u_xlat33 = (u_xlatb4) ? 1.0 : u_xlat33;
    u_xlat0.x = dot(u_xlat0.xyz, (-_MainLightPosition.xyz));
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11.xyz = vec3(u_xlat33) * _MainLightColor.xyz;
    u_xlat0.xyz = u_xlat11.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlatb33 = u_xlat1.w>=0.400000006;
    u_xlat33 = u_xlatb33 ? u_xlat1.w : float(0.0);
    u_xlat1.x = u_xlat1.w + -0.400000006;
    u_xlat12 = dFdxCoarse(u_xlat1.w);
    u_xlat23 = dFdyCoarse(u_xlat1.w);
    u_xlat12 = abs(u_xlat23) + abs(u_xlat12);
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat1.x = u_xlat1.x / u_xlat12;
    u_xlat1.x = u_xlat1.x + 0.5;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb12 = _AlphaToMaskAvailable!=0.0;
    u_xlat33 = (u_xlatb12) ? u_xlat1.x : u_xlat33;
    u_xlat1.x = u_xlat33 + -9.99999975e-05;
    u_xlatb1.x = u_xlat1.x<0.0;
    if(((int(u_xlatb1.x) * int(0xffffffffu)))!=0){discard;}
    u_xlatb1.x = 0.0<vs_INTERP2.w;
    u_xlatb1.z = unity_WorldTransformParams.w>=0.0;
    u_xlat1.x = (u_xlatb1.x) ? float(1.0) : float(-1.0);
    u_xlat1.z = (u_xlatb1.z) ? float(1.0) : float(-1.0);
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat4.xyz = vs_INTERP1.zxy * vs_INTERP2.yzx;
    u_xlat4.xyz = vs_INTERP1.yzx * vs_INTERP2.zxy + (-u_xlat4.xyz);
    u_xlat1.xzw = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat14.yyy;
    u_xlat1.xzw = u_xlat14.xxx * vs_INTERP2.xyz + u_xlat1.xzw;
    u_xlat1.xzw = u_xlat14.zzz * vs_INTERP1.xyz + u_xlat1.xzw;
    u_xlat14.x = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat1.xzw = u_xlat1.xzw * u_xlat14.xxx;
    u_xlatb14 = unity_OrthoParams.w==0.0;
    u_xlat4.xyz = (-vs_INTERP0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat4.xyz = vec3(u_xlat25) * u_xlat4.xyz;
    u_xlat5.x = (u_xlatb14) ? u_xlat4.x : unity_MatrixV[0].z;
    u_xlat5.y = (u_xlatb14) ? u_xlat4.y : unity_MatrixV[1].z;
    u_xlat5.z = (u_xlatb14) ? u_xlat4.z : unity_MatrixV[2].z;
    u_xlat14.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_INTERP5.xy, _GlobalMipBias.x).xyz;
    u_xlat4.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat4.xy = u_xlat4.xy * hlslcc_FragCoord.xy;
    u_xlat15.x = u_xlat4.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat4.z = (-u_xlat15.x) + 1.0;
    u_xlat3.x = u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat15.x = (-u_xlat3.x) + 1.0;
    u_xlat37 = u_xlat15.x * u_xlat15.x;
    u_xlat37 = max(u_xlat37, 0.0078125);
    u_xlat38 = u_xlat37 * u_xlat37;
    u_xlat3.x = u_xlat3.x + 0.0400000215;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat6 = u_xlat37 * 4.0 + 2.0;
    u_xlat4.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat4.xz, _GlobalMipBias.x).x;
    u_xlat26 = u_xlat4.x + -1.0;
    u_xlat26 = _AmbientOcclusionParam.w * u_xlat26 + 1.0;
    u_xlat4.x = min(u_xlat4.x, vs_INTERP4.w);
    vec3 txVec1 = vec3(vs_INTERP9.xy,vs_INTERP9.z);
    u_xlat17.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
    u_xlat35 = u_xlat17.x * _MainLightShadowParams.x + u_xlat35;
    u_xlatb17 = 0.0>=vs_INTERP9.z;
    u_xlatb28 = vs_INTERP9.z>=1.0;
    u_xlatb17 = u_xlatb28 || u_xlatb17;
    u_xlat35 = (u_xlatb17) ? 1.0 : u_xlat35;
    u_xlat17.xyz = vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = u_xlat17.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat28 = (-u_xlat35) + 1.0;
    u_xlat35 = u_xlat17.x * u_xlat28 + u_xlat35;
    u_xlat17.xyz = vec3(u_xlat26) * _MainLightColor.xyz;
    u_xlat7.x = dot((-u_xlat5.xyz), u_xlat1.xzw);
    u_xlat7.x = u_xlat7.x + u_xlat7.x;
    u_xlat7.xyz = u_xlat1.xzw * (-u_xlat7.xxx) + (-u_xlat5.xyz);
    u_xlat40 = dot(u_xlat1.xzw, u_xlat5.xyz);
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat40 = (-u_xlat40) + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat8.x = (-u_xlat15.x) * 0.699999988 + 1.70000005;
    u_xlat15.x = u_xlat15.x * u_xlat8.x;
    u_xlat15.x = u_xlat15.x * 6.0;
    u_xlat8 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat7.xyz, u_xlat15.x);
    u_xlat15.x = u_xlat8.w + -1.0;
    u_xlat15.x = unity_SpecCube0_HDR.w * u_xlat15.x + 1.0;
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * unity_SpecCube0_HDR.y;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat8.xyz * u_xlat15.xxx;
    u_xlat15.xz = vec2(u_xlat37) * vec2(u_xlat37) + vec2(-1.0, 1.0);
    u_xlat37 = float(1.0) / u_xlat15.z;
    u_xlat3.x = u_xlat3.x + -0.0399999991;
    u_xlat3.x = u_xlat40 * u_xlat3.x + 0.0399999991;
    u_xlat3.x = u_xlat3.x * u_xlat37;
    u_xlat7.xyz = u_xlat3.xxx * u_xlat7.xyz;
    u_xlat3.xyz = u_xlat14.xyz * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat35 = u_xlat35 * unity_LightData.z;
    u_xlat36 = dot(u_xlat1.xzw, _MainLightPosition.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat35 = u_xlat35 * u_xlat36;
    u_xlat17.xyz = vec3(u_xlat35) * u_xlat17.xyz;
    u_xlat7.xyz = u_xlat5.xyz + _MainLightPosition.xyz;
    u_xlat35 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat35 = max(u_xlat35, 1.17549435e-37);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat7.xyz = vec3(u_xlat35) * u_xlat7.xyz;
    u_xlat35 = dot(u_xlat1.xzw, u_xlat7.xyz);
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat36 = dot(_MainLightPosition.xyz, u_xlat7.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat35 = u_xlat35 * u_xlat35;
    u_xlat35 = u_xlat35 * u_xlat15.x + 1.00001001;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat35 = u_xlat35 * u_xlat35;
    u_xlat36 = max(u_xlat36, 0.100000001);
    u_xlat35 = u_xlat35 * u_xlat36;
    u_xlat35 = u_xlat6 * u_xlat35;
    u_xlat35 = u_xlat38 / u_xlat35;
    u_xlat7.xyz = vec3(u_xlat35) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat7.xyz;
    u_xlat35 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu35 =  uint(int(u_xlat35));
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu35 ; u_xlatu_loop_1++)
    {
        u_xlatu37 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati40 = int(u_xlatu_loop_1 & 3u);
        u_xlat37 = dot(unity_LightIndices[int(u_xlatu37)], uintBitsToFloat(ImmCB_0[u_xlati40]));
        u_xlati37 = int(u_xlat37);
        u_xlat8.xyz = (-vs_INTERP0.xyz) * _AdditionalLightsPosition[u_xlati37].www + _AdditionalLightsPosition[u_xlati37].xyz;
        u_xlat40 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat40 = max(u_xlat40, 6.10351562e-05);
        u_xlat41 = inversesqrt(u_xlat40);
        u_xlat9.xyz = vec3(u_xlat41) * u_xlat8.xyz;
        u_xlat42 = float(1.0) / float(u_xlat40);
        u_xlat40 = u_xlat40 * _AdditionalLightsAttenuation[u_xlati37].x;
        u_xlat40 = (-u_xlat40) * u_xlat40 + 1.0;
        u_xlat40 = max(u_xlat40, 0.0);
        u_xlat40 = u_xlat40 * u_xlat40;
        u_xlat40 = u_xlat40 * u_xlat42;
        u_xlat42 = dot(_AdditionalLightsSpotDir[u_xlati37].xyz, u_xlat9.xyz);
        u_xlat42 = u_xlat42 * _AdditionalLightsAttenuation[u_xlati37].z + _AdditionalLightsAttenuation[u_xlati37].w;
        u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
        u_xlat42 = u_xlat42 * u_xlat42;
        u_xlat40 = u_xlat40 * u_xlat42;
        u_xlat10.xyz = vec3(u_xlat26) * _AdditionalLightsColor[u_xlati37].xyz;
        u_xlat37 = dot(u_xlat1.xzw, u_xlat9.xyz);
        u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
        u_xlat37 = u_xlat37 * u_xlat40;
        u_xlat10.xyz = vec3(u_xlat37) * u_xlat10.xyz;
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat41) + u_xlat5.xyz;
        u_xlat37 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat37 = max(u_xlat37, 1.17549435e-37);
        u_xlat37 = inversesqrt(u_xlat37);
        u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
        u_xlat37 = dot(u_xlat1.xzw, u_xlat8.xyz);
        u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
        u_xlat40 = dot(u_xlat9.xyz, u_xlat8.xyz);
        u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
        u_xlat37 = u_xlat37 * u_xlat37;
        u_xlat37 = u_xlat37 * u_xlat15.x + 1.00001001;
        u_xlat40 = u_xlat40 * u_xlat40;
        u_xlat37 = u_xlat37 * u_xlat37;
        u_xlat40 = max(u_xlat40, 0.100000001);
        u_xlat37 = u_xlat37 * u_xlat40;
        u_xlat37 = u_xlat6 * u_xlat37;
        u_xlat37 = u_xlat38 / u_xlat37;
        u_xlat8.xyz = vec3(u_xlat37) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat7.xyz;
    }
    u_xlat1.xzw = u_xlat3.xyz * u_xlat4.xxx + u_xlat17.xyz;
    u_xlat1.xzw = u_xlat7.xyz + u_xlat1.xzw;
    SV_Target0.xyz = vs_INTERP4.www * u_xlat0.xyz + u_xlat1.xzw;
    SV_Target0.w = (u_xlatb12) ? u_xlat33 : 1.0;
    return;
}

