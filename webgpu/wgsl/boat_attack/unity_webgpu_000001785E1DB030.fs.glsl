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
	vec4 _SampleTexture2D_a490b3241735d68e9ee2d1f1bbfed8dc_Texture_1_TexelSize;
	vec4 _MainTex_TexelSize;
	vec4 Texture2D_DE8BF47E_TexelSize;
	float Vector1_6E11FCEA;
	float Vector1_A492C01C;
	float Vector1_8B35DE98;
	vec4 Texture2D_C005B064_TexelSize;
	vec4 Texture2D_D7D66558_TexelSize;
	float Vector1_90E376AD;
};
layout(set = 0, binding = 0) uniform mediump textureCube unity_SpecCube0;
layout(set = 0, binding = 1) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 2) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _SampleTexture2D_a490b3241735d68e9ee2d1f1bbfed8dc_Texture_1;
layout(set = 0, binding = 5) uniform mediump texture2D _MainTex;
layout(set = 0, binding = 6) uniform mediump texture2D Texture2D_DE8BF47E;
layout(set = 0, binding = 7) uniform mediump texture2D Texture2D_C005B064;
layout(set = 0, binding = 8) uniform mediump texture2D Texture2D_D7D66558;
layout(location = 0) in highp vec3 vs_INTERP0;
layout(location = 1) in highp vec3 vs_INTERP1;
layout(location = 2) in highp vec4 vs_INTERP2;
layout(location = 3) in highp vec4 vs_INTERP3;
layout(location = 4) in highp vec2 vs_INTERP4;
layout(location = 5) in highp vec4 vs_INTERP8;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 9) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 10) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 12) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_SampleTexture2D_a490b3241735d68e9ee2d1f1bbfed8dc_Texture_1;
layout(set = 0, binding = 14) uniform mediump  sampler sampler_MainTex;
layout(set = 0, binding = 15) uniform mediump  sampler samplerTexture2D_DE8BF47E;
layout(set = 0, binding = 16) uniform mediump  sampler samplerTexture2D_C005B064;
layout(set = 0, binding = 17) uniform mediump  sampler samplerTexture2D_D7D66558;
void main()
{
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
vec2 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
bvec2 u_xlatb11;
vec2 u_xlat12;
vec3 u_xlat15;
vec3 u_xlat18;
vec3 u_xlat19;
float u_xlat26;
float u_xlat34;
uint u_xlatu34;
float u_xlat35;
int u_xlati35;
uint u_xlatu35;
bool u_xlatb35;
float u_xlat36;
float u_xlat37;
int u_xlati37;
float u_xlat38;
bool u_xlatb38;
float u_xlat39;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.x = dot(vs_INTERP1.xyz, vs_INTERP1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlatb11.x = 0.0<vs_INTERP2.w;
    u_xlatb11.y = unity_WorldTransformParams.w>=0.0;
    u_xlat11.x = (u_xlatb11.x) ? float(1.0) : float(-1.0);
    u_xlat11.y = (u_xlatb11.y) ? float(1.0) : float(-1.0);
    u_xlat11.x = u_xlat11.y * u_xlat11.x;
    u_xlat1.xyz = vs_INTERP1.zxy * vs_INTERP2.yzx;
    u_xlat1.xyz = vs_INTERP1.yzx * vs_INTERP2.zxy + (-u_xlat1.xyz);
    u_xlat0.yzw = u_xlat11.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_INTERP1.xyz;
    u_xlat2.xyz = u_xlat0.xxx * vs_INTERP2.xyz;
    u_xlat3.xyz = u_xlat0.yzw * u_xlat0.xxx;
    u_xlat4 = texture(sampler2D(_MainTex, sampler_MainTex), vs_INTERP3.xy, _GlobalMipBias.x);
    u_xlat0.x = u_xlat4.w + -0.5;
    u_xlat34 = u_xlat0.x * 4.0 + vs_INTERP0.y;
    u_xlat34 = u_xlat34 * 0.330000013;
    u_xlat35 = vs_INTERP0.y + 1.0;
    u_xlat35 = u_xlat35 * -1.33333337 + 1.0;
    u_xlat34 = max(u_xlat34, u_xlat35);
    u_xlat1.w = max(u_xlat34, 0.100000001);
    u_xlat5.xy = vs_INTERP3.xy * vec2(4.0, 4.0);
    u_xlat6.xyz = texture(sampler2D(Texture2D_D7D66558, samplerTexture2D_D7D66558), u_xlat5.xy, _GlobalMipBias.x).xyz;
    u_xlat35 = (-Vector1_8B35DE98) * 0.0111109996 + 0.949999988;
    u_xlat36 = Vector1_A492C01C + -10.0;
    u_xlat36 = (-u_xlat36) + vs_INTERP0.y;
    u_xlat36 = u_xlat36 * 0.0500000007;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat7 = texture(sampler2D(Texture2D_DE8BF47E, samplerTexture2D_DE8BF47E), vs_INTERP3.xy, _GlobalMipBias.x);
    u_xlat18.xyz = u_xlat7.wyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat18.yyy;
    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat18.zzz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-37);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat1.y;
    u_xlat1.x = u_xlat36 * u_xlat1.x + (-u_xlat35);
    u_xlat1.x = u_xlat1.x * 10.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat12.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat12.x;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 1.0));
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat2.xyz = u_xlat4.xyz + (-u_xlat6.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat6.xyz;
    u_xlat3.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat15.xyz = texture(sampler2D(Texture2D_C005B064, samplerTexture2D_C005B064), u_xlat5.xy, _GlobalMipBias.x).xyw;
    u_xlat15.x = u_xlat15.x * u_xlat15.z;
    u_xlat5.xy = u_xlat15.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat12.x = min(u_xlat12.x, 1.0);
    u_xlat12.x = (-u_xlat12.x) + 1.0;
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat5.z = max(u_xlat12.x, 1.00000002e-16);
    u_xlat12.x = dot(unity_ObjectToWorld[0].xyz, unity_ObjectToWorld[0].xyz);
    u_xlat6.x = sqrt(u_xlat12.x);
    u_xlat12.x = dot(unity_ObjectToWorld[1].xyz, unity_ObjectToWorld[1].xyz);
    u_xlat6.y = sqrt(u_xlat12.x);
    u_xlat12.x = dot(unity_ObjectToWorld[2].xyz, unity_ObjectToWorld[2].xyz);
    u_xlat6.z = sqrt(u_xlat12.x);
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat12.x = u_xlat12.x * Vector1_90E376AD;
    u_xlat12.x = u_xlat12.x * 30.0;
    u_xlat12.xy = u_xlat12.xx * vs_INTERP3.xy;
    u_xlat15.xyz = texture(sampler2D(_SampleTexture2D_a490b3241735d68e9ee2d1f1bbfed8dc_Texture_1, sampler_SampleTexture2D_a490b3241735d68e9ee2d1f1bbfed8dc_Texture_1), u_xlat12.xy, _GlobalMipBias.x).xyw;
    u_xlat15.x = u_xlat15.x * u_xlat15.z;
    u_xlat12.xy = u_xlat15.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat35 = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat35 = min(u_xlat35, 1.0);
    u_xlat35 = (-u_xlat35) + 1.0;
    u_xlat35 = sqrt(u_xlat35);
    u_xlat35 = max(u_xlat35, 1.00000002e-16);
    u_xlat6.xy = u_xlat12.xy + u_xlat18.xy;
    u_xlat6.z = u_xlat35 * u_xlat18.z;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat12.x = max(u_xlat12.x, 1.17549435e-37);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat15.xyz = u_xlat6.xyz * u_xlat12.xxx + (-u_xlat5.xyz);
    u_xlat4.yzw = u_xlat1.xxx * u_xlat15.xyz + u_xlat5.xyz;
    u_xlat0.x = -abs(u_xlat0.x) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.xzzz;
    u_xlat0.x = u_xlat0.x * Vector1_6E11FCEA;
    u_xlat0.x = u_xlat1.x * u_xlat0.x + -0.850000024;
    u_xlat0.x = u_xlat1.w * u_xlat0.x + 0.850000024;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11.xyz = u_xlat4.yyy * vs_INTERP2.xyz + u_xlat0.yzw;
    u_xlat11.xyz = u_xlat4.www * vs_INTERP1.xyz + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat1.xxx;
    u_xlatb1 = unity_OrthoParams.w==0.0;
    u_xlat4.xyz = (-vs_INTERP0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat4.xyz = u_xlat12.xxx * u_xlat4.xyz;
    u_xlat5.x = (u_xlatb1) ? u_xlat4.x : unity_MatrixV[0].z;
    u_xlat5.y = (u_xlatb1) ? u_xlat4.y : unity_MatrixV[1].z;
    u_xlat5.z = (u_xlatb1) ? u_xlat4.z : unity_MatrixV[2].z;
    u_xlat1.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_INTERP4.xy, _GlobalMipBias.x).xyz;
    u_xlat4.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat4.xy = u_xlat4.xy * hlslcc_FragCoord.xy;
    u_xlat35 = u_xlat4.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat4.z = (-u_xlat35) + 1.0;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.863999963, 0.863999963, 0.863999963);
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat34 = (-u_xlat0.x) + 1.0;
    u_xlat35 = u_xlat34 * u_xlat34;
    u_xlat35 = max(u_xlat35, 0.0078125);
    u_xlat36 = u_xlat35 * u_xlat35;
    u_xlat0.x = u_xlat0.x + 0.136000037;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat15.x = u_xlat35 * 4.0 + 2.0;
    u_xlat4.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat4.xz, _GlobalMipBias.x).x;
    u_xlat26 = u_xlat4.x + -1.0;
    u_xlat26 = _AmbientOcclusionParam.w * u_xlat26 + 1.0;
    u_xlat4.x = min(u_xlat7.x, u_xlat4.x);
    vec3 txVec0 = vec3(vs_INTERP8.xy,vs_INTERP8.z);
    u_xlat37 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
    u_xlat38 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat37 = u_xlat37 * _MainLightShadowParams.x + u_xlat38;
    u_xlatb38 = 0.0>=vs_INTERP8.z;
    u_xlatb6 = vs_INTERP8.z>=1.0;
    u_xlatb38 = u_xlatb38 || u_xlatb6;
    u_xlat37 = (u_xlatb38) ? 1.0 : u_xlat37;
    u_xlat6.xyz = vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat38 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat38 = u_xlat38 * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
    u_xlat6.x = (-u_xlat37) + 1.0;
    u_xlat37 = u_xlat38 * u_xlat6.x + u_xlat37;
    u_xlat6.xyz = vec3(u_xlat26) * _MainLightColor.xyz;
    u_xlat38 = dot((-u_xlat5.xyz), u_xlat11.xyz);
    u_xlat38 = u_xlat38 + u_xlat38;
    u_xlat7.xyz = u_xlat11.xyz * (-vec3(u_xlat38)) + (-u_xlat5.xyz);
    u_xlat38 = dot(u_xlat11.xyz, u_xlat5.xyz);
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
    u_xlat38 = (-u_xlat38) + 1.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat39 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat39;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat7 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat7.xyz, u_xlat34);
    u_xlat34 = u_xlat7.w + -1.0;
    u_xlat34 = unity_SpecCube0_HDR.w * u_xlat34 + 1.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat34 = log2(u_xlat34);
    u_xlat34 = u_xlat34 * unity_SpecCube0_HDR.y;
    u_xlat34 = exp2(u_xlat34);
    u_xlat34 = u_xlat34 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat34);
    u_xlat8.xy = vec2(u_xlat35) * vec2(u_xlat35) + vec2(-1.0, 1.0);
    u_xlat34 = float(1.0) / u_xlat8.y;
    u_xlat19.xyz = (-u_xlat2.xyz) + u_xlat0.xxx;
    u_xlat19.xyz = vec3(u_xlat38) * u_xlat19.xyz + u_xlat2.xyz;
    u_xlat19.xyz = vec3(u_xlat34) * u_xlat19.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat19.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat7.xyz;
    u_xlat0.x = u_xlat37 * unity_LightData.z;
    u_xlat34 = dot(u_xlat11.xyz, _MainLightPosition.xyz);
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat34;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat5.xyz + _MainLightPosition.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-37);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat34 = dot(_MainLightPosition.xyz, u_xlat7.xyz);
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + 1.00001001;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat34 = max(u_xlat34, 0.100000001);
    u_xlat0.x = u_xlat0.x * u_xlat34;
    u_xlat0.x = u_xlat15.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 / u_xlat0.x;
    u_xlat7.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat0.x = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu0 =  uint(int(u_xlat0.x));
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu0 ; u_xlatu_loop_1++)
    {
        u_xlatu35 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati37 = int(u_xlatu_loop_1 & 3u);
        u_xlat35 = dot(unity_LightIndices[int(u_xlatu35)], uintBitsToFloat(ImmCB_0[u_xlati37]));
        u_xlati35 = int(u_xlat35);
        u_xlat19.xyz = (-vs_INTERP0.xyz) * _AdditionalLightsPosition[u_xlati35].www + _AdditionalLightsPosition[u_xlati35].xyz;
        u_xlat37 = dot(u_xlat19.xyz, u_xlat19.xyz);
        u_xlat37 = max(u_xlat37, 6.10351562e-05);
        u_xlat38 = inversesqrt(u_xlat37);
        u_xlat9.xyz = vec3(u_xlat38) * u_xlat19.xyz;
        u_xlat39 = float(1.0) / float(u_xlat37);
        u_xlat37 = u_xlat37 * _AdditionalLightsAttenuation[u_xlati35].x;
        u_xlat37 = (-u_xlat37) * u_xlat37 + 1.0;
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat37 = u_xlat37 * u_xlat37;
        u_xlat37 = u_xlat37 * u_xlat39;
        u_xlat39 = dot(_AdditionalLightsSpotDir[u_xlati35].xyz, u_xlat9.xyz);
        u_xlat39 = u_xlat39 * _AdditionalLightsAttenuation[u_xlati35].z + _AdditionalLightsAttenuation[u_xlati35].w;
        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
        u_xlat39 = u_xlat39 * u_xlat39;
        u_xlat37 = u_xlat37 * u_xlat39;
        u_xlat10.xyz = vec3(u_xlat26) * _AdditionalLightsColor[u_xlati35].xyz;
        u_xlat35 = dot(u_xlat11.xyz, u_xlat9.xyz);
        u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
        u_xlat35 = u_xlat35 * u_xlat37;
        u_xlat10.xyz = vec3(u_xlat35) * u_xlat10.xyz;
        u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat38) + u_xlat5.xyz;
        u_xlat35 = dot(u_xlat19.xyz, u_xlat19.xyz);
        u_xlat35 = max(u_xlat35, 1.17549435e-37);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat19.xyz = vec3(u_xlat35) * u_xlat19.xyz;
        u_xlat35 = dot(u_xlat11.xyz, u_xlat19.xyz);
        u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
        u_xlat37 = dot(u_xlat9.xyz, u_xlat19.xyz);
        u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
        u_xlat35 = u_xlat35 * u_xlat35;
        u_xlat35 = u_xlat35 * u_xlat8.x + 1.00001001;
        u_xlat37 = u_xlat37 * u_xlat37;
        u_xlat35 = u_xlat35 * u_xlat35;
        u_xlat37 = max(u_xlat37, 0.100000001);
        u_xlat35 = u_xlat35 * u_xlat37;
        u_xlat35 = u_xlat15.x * u_xlat35;
        u_xlat35 = u_xlat36 / u_xlat35;
        u_xlat19.xyz = u_xlat2.xyz * vec3(u_xlat35) + u_xlat3.xyz;
        u_xlat7.xyz = u_xlat19.xyz * u_xlat10.xyz + u_xlat7.xyz;
    }
    u_xlat0.xyz = u_xlat1.xyz * u_xlat4.xxx + u_xlat6.xyz;
    SV_Target0.xyz = u_xlat7.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

