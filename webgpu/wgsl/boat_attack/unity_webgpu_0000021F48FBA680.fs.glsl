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
layout(set = 1, binding = 4, std140) uniform LightCookies {
	mat4x4 _MainLightWorldToLight;
	float _AdditionalLightsCookieEnableBits[8];
	float _MainLightCookieTextureFormat;
	float _AdditionalLightsCookieAtlasTextureFormat;
};
layout(set = 1, binding = 5, std140) uniform AdditionalLightsCookies {
	mat4x4 _AdditionalLightsWorldToLights[256];
	vec4 _AdditionalLightsCookieAtlasUVRects[256];
	float _AdditionalLightsLightTypes[256];
};
layout(set = 1, binding = 6, std140) uniform UnityPerMaterial {
	vec4 Texture2D_B222E8F_TexelSize;
	vec4 Color_C30C7CA3;
	vec4 Texture2D_D9BFD5F1_TexelSize;
};
layout(set = 0, binding = 0) uniform mediump textureCube unity_SpecCube0;
layout(set = 0, binding = 1) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 2) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _MainLightCookieTexture;
layout(set = 0, binding = 5) uniform mediump texture2D _AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 6) uniform mediump texture2D Texture2D_B222E8F;
layout(set = 0, binding = 7) uniform mediump texture2D Texture2D_D9BFD5F1;
layout(location = 0) in highp vec3 vs_INTERP0;
layout(location = 1) in highp vec3 vs_INTERP1;
layout(location = 2) in highp vec4 vs_INTERP2;
layout(location = 3) in highp vec4 vs_INTERP3;
layout(location = 4) in highp vec4 vs_INTERP4;
layout(location = 5) in highp vec2 vs_INTERP5;
layout(location = 6) in highp vec4 vs_INTERP9;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 8) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 9) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 10) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 11) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 12) uniform mediump  sampler sampler_MainLightCookieTexture;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 14) uniform mediump  sampler samplerTexture2D_B222E8F;
layout(set = 0, binding = 15) uniform mediump  sampler samplerTexture2D_D9BFD5F1;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffffu) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
float u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
uint u_xlatu3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
bvec2 u_xlatb8;
vec4 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
bvec2 u_xlatb15;
vec3 u_xlat17;
int u_xlati17;
uvec3 u_xlatu17;
bool u_xlatb17;
float u_xlat20;
vec3 u_xlat23;
vec2 u_xlat32;
int u_xlati32;
uint u_xlatu32;
float u_xlat35;
vec2 u_xlat38;
int u_xlati38;
bvec2 u_xlatb38;
vec2 u_xlat42;
float u_xlat46;
uint u_xlatu46;
float u_xlat47;
int u_xlati47;
uint u_xlatu47;
float u_xlat48;
float u_xlat49;
uint u_xlatu49;
bool u_xlatb49;
float u_xlat50;
int u_xlati50;
bool u_xlatb50;
float u_xlat51;
bool u_xlatb51;
float u_xlat52;
int u_xlati52;
uint u_xlatu52;
bool u_xlatb52;
int u_xlati53;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = dot(vs_INTERP1.xyz, vs_INTERP1.xyz);
    u_xlat0 = sqrt(u_xlat0);
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlatb15.x = 0.0<vs_INTERP2.w;
    u_xlatb15.y = unity_WorldTransformParams.w>=0.0;
    u_xlat15.x = (u_xlatb15.x) ? float(1.0) : float(-1.0);
    u_xlat15.y = (u_xlatb15.y) ? float(1.0) : float(-1.0);
    u_xlat15.x = u_xlat15.y * u_xlat15.x;
    u_xlat1.xyz = vs_INTERP1.zxy * vs_INTERP2.yzx;
    u_xlat1.xyz = vs_INTERP1.yzx * vs_INTERP2.zxy + (-u_xlat1.xyz);
    u_xlat15.xyz = u_xlat15.xxx * u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat0) * vs_INTERP1.xyz;
    u_xlat2.xyz = vec3(u_xlat0) * vs_INTERP2.xyz;
    u_xlat3.xyz = u_xlat15.xyz * vec3(u_xlat0);
    u_xlatb0 = unity_OrthoParams.w==0.0;
    u_xlat4.xyz = (-vs_INTERP0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat46 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat4.xyz = vec3(u_xlat46) * u_xlat4.xyz;
    u_xlat5.x = unity_MatrixV[0].z;
    u_xlat5.y = unity_MatrixV[1].z;
    u_xlat5.z = unity_MatrixV[2].z;
    u_xlat4.xyz = (bool(u_xlatb0)) ? u_xlat4.xyz : u_xlat5.xyz;
    u_xlat5.xyz = u_xlat4.yyy * unity_WorldToObject[1].xyz;
    u_xlat5.xyz = unity_WorldToObject[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = unity_WorldToObject[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    u_xlat0 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0 = inversesqrt(u_xlat0);
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat5.xyz;
    u_xlat6 = texture(sampler2D(Texture2D_B222E8F, samplerTexture2D_B222E8F), vs_INTERP3.xy, _GlobalMipBias.x);
    u_xlat7.xyz = u_xlat6.xyz * Color_C30C7CA3.xyz;
    u_xlat8 = texture(sampler2D(Texture2D_D9BFD5F1, samplerTexture2D_D9BFD5F1), vs_INTERP3.xy, _GlobalMipBias.x).wxyz;
    u_xlat9 = u_xlat8.yzwx * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat0 = dot(u_xlat9, u_xlat9);
    u_xlat0 = inversesqrt(u_xlat0);
    u_xlat23.xyz = vec3(u_xlat0) * u_xlat9.xyz;
    u_xlat0 = vs_INTERP4.y * 200.0;
    u_xlat0 = min(u_xlat0, 1.0);
    u_xlat6.xyz = vec3(u_xlat0) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat23.yyy;
    u_xlat2.xyz = u_xlat23.xxx * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat23.zzz * u_xlat1.xyz + u_xlat2.xyz;
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
    u_xlat46 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat0 = u_xlat0 * _MainLightShadowParams.x + u_xlat46;
    u_xlatb2 = 0.0>=u_xlat2.z;
    u_xlatb17 = u_xlat2.z>=1.0;
    u_xlatb2 = u_xlatb17 || u_xlatb2;
    u_xlat0 = (u_xlatb2) ? 1.0 : u_xlat0;
    u_xlat1.x = dot(u_xlat1.xyz, (-_MainLightPosition.xyz));
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat0) * _MainLightColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlatb0 = unity_LODFade.x<0.0;
    u_xlat2.x = unity_LODFade.x + 1.0;
    u_xlat0 = (u_xlatb0) ? u_xlat2.x : unity_LODFade.x;
    u_xlatb2 = 0.5>=u_xlat0;
    u_xlat17.xyz = abs(u_xlat5.xyz) * _ScreenParams.xyx;
    u_xlatu17.xyz = uvec3(u_xlat17.xyz);
    u_xlatu47 = u_xlatu17.z * 1025u;
    u_xlatu3 = u_xlatu47 >> (6u & uint(0x1F));
    u_xlati47 = int(u_xlatu47 ^ u_xlatu3);
    u_xlatu47 = uint(u_xlati47) * 9u;
    u_xlatu3 = u_xlatu47 >> (11u & uint(0x1F));
    u_xlati47 = int(u_xlatu47 ^ u_xlatu3);
    u_xlati47 = u_xlati47 * 32769;
    u_xlati32 = int(uint(u_xlati47) ^ u_xlatu17.y);
    u_xlatu32 = uint(u_xlati32) * 1025u;
    u_xlatu47 = u_xlatu32 >> (6u & uint(0x1F));
    u_xlati32 = int(u_xlatu47 ^ u_xlatu32);
    u_xlatu32 = uint(u_xlati32) * 9u;
    u_xlatu47 = u_xlatu32 >> (11u & uint(0x1F));
    u_xlati32 = int(u_xlatu47 ^ u_xlatu32);
    u_xlati32 = u_xlati32 * 32769;
    u_xlati17 = int(uint(u_xlati32) ^ u_xlatu17.x);
    u_xlatu17.x = uint(u_xlati17) * 1025u;
    u_xlatu32 = u_xlatu17.x >> (6u & uint(0x1F));
    u_xlati17 = int(u_xlatu32 ^ u_xlatu17.x);
    u_xlatu17.x = uint(u_xlati17) * 9u;
    u_xlatu32 = u_xlatu17.x >> (11u & uint(0x1F));
    u_xlati17 = int(u_xlatu32 ^ u_xlatu17.x);
    u_xlati17 = u_xlati17 * 32769;
    u_xlat17.x = intBitsToFloat(int(int_bitfieldInsert(1065353216, u_xlati17, 0 & int(0x1F), 23)));
    u_xlat17.x = u_xlat17.x + -1.0;
    u_xlat32.x = (-u_xlat17.x) + 1.0;
    u_xlat2.x = (u_xlatb2) ? u_xlat17.x : u_xlat32.x;
    u_xlat0 = u_xlat0 * 2.0 + (-u_xlat2.x);
    u_xlat2.x = u_xlat0 * u_xlat6.w;
    u_xlatb17 = u_xlat2.x>=0.400000006;
    u_xlat17.x = u_xlatb17 ? u_xlat2.x : float(0.0);
    u_xlat0 = u_xlat6.w * u_xlat0 + -0.400000006;
    u_xlat32.x = dFdxCoarse(u_xlat2.x);
    u_xlat2.x = dFdyCoarse(u_xlat2.x);
    u_xlat2.x = abs(u_xlat2.x) + abs(u_xlat32.x);
    u_xlat2.x = max(u_xlat2.x, 9.99999975e-05);
    u_xlat0 = u_xlat0 / u_xlat2.x;
    u_xlat0 = u_xlat0 + 0.5;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlatb2 = _AlphaToMaskAvailable!=0.0;
    u_xlat0 = (u_xlatb2) ? u_xlat0 : u_xlat17.x;
    u_xlat17.x = u_xlat0 + -9.99999975e-05;
    u_xlatb17 = u_xlat17.x<0.0;
    if(((int(u_xlatb17) * int(0xffffffffu)))!=0){discard;}
    u_xlat15.xyz = u_xlat15.xyz * u_xlat23.yyy;
    u_xlat15.xyz = u_xlat23.xxx * vs_INTERP2.xyz + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat23.zzz * vs_INTERP1.xyz + u_xlat15.xyz;
    u_xlat17.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat17.xxx;
    u_xlat17.x = vs_INTERP0.y * unity_MatrixV[1].z;
    u_xlat17.x = unity_MatrixV[0].z * vs_INTERP0.x + u_xlat17.x;
    u_xlat17.x = unity_MatrixV[2].z * vs_INTERP0.z + u_xlat17.x;
    u_xlat17.x = u_xlat17.x + unity_MatrixV[3].z;
    u_xlat17.x = (-u_xlat17.x) + (-_ProjectionParams.y);
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = u_xlat17.x * unity_FogParams.x;
    u_xlat3.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_INTERP5.xy, _GlobalMipBias.x).xyz;
    u_xlat32.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat5.xy = u_xlat32.xy * hlslcc_FragCoord.xy;
    u_xlat32.x = u_xlat5.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat5.z = (-u_xlat32.x) + 1.0;
    u_xlat8.x = u_xlat8.x;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat0 = u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6.xyz = u_xlat7.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat32.x = (-u_xlat8.x) + 1.0;
    u_xlat47 = u_xlat32.x * u_xlat32.x;
    u_xlat47 = max(u_xlat47, 0.0078125);
    u_xlat48 = u_xlat47 * u_xlat47;
    u_xlat49 = u_xlat8.x + 0.0400000215;
    u_xlat49 = min(u_xlat49, 1.0);
    u_xlat20 = u_xlat47 * 4.0 + 2.0;
    u_xlat5.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat5.xz, _GlobalMipBias.x).x;
    u_xlat35 = u_xlat5.x + -1.0;
    u_xlat35 = _AmbientOcclusionParam.w * u_xlat35 + 1.0;
    u_xlat5.x = min(u_xlat5.x, vs_INTERP4.w);
    vec3 txVec1 = vec3(vs_INTERP9.xy,vs_INTERP9.z);
    u_xlat50 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
    u_xlat46 = u_xlat50 * _MainLightShadowParams.x + u_xlat46;
    u_xlatb50 = 0.0>=vs_INTERP9.z;
    u_xlatb51 = vs_INTERP9.z>=1.0;
    u_xlatb50 = u_xlatb50 || u_xlatb51;
    u_xlat46 = (u_xlatb50) ? 1.0 : u_xlat46;
    u_xlat7.xyz = vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat50 = u_xlat50 * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
    u_xlat51 = (-u_xlat46) + 1.0;
    u_xlat46 = u_xlat50 * u_xlat51 + u_xlat46;
    u_xlatb50 = _MainLightCookieTextureFormat!=-1.0;
    if(u_xlatb50){
        u_xlat7.xy = vs_INTERP0.yy * _MainLightWorldToLight[1].xy;
        u_xlat7.xy = _MainLightWorldToLight[0].xy * vs_INTERP0.xx + u_xlat7.xy;
        u_xlat7.xy = _MainLightWorldToLight[2].xy * vs_INTERP0.zz + u_xlat7.xy;
        u_xlat7.xy = u_xlat7.xy + _MainLightWorldToLight[3].xy;
        u_xlat7.xy = u_xlat7.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat7 = texture(sampler2D(_MainLightCookieTexture, sampler_MainLightCookieTexture), u_xlat7.xy, _GlobalMipBias.x);
        u_xlatb8.xy = equal(vec4(vec4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat50 = (u_xlatb8.y) ? u_xlat7.w : u_xlat7.x;
        u_xlat7.xyz = (u_xlatb8.x) ? u_xlat7.xyz : vec3(u_xlat50);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
    }
    u_xlat7.xyz = u_xlat7.xyz * _MainLightColor.xyz;
    u_xlat7.xyz = vec3(u_xlat35) * u_xlat7.xyz;
    u_xlat50 = dot((-u_xlat4.xyz), u_xlat15.xyz);
    u_xlat50 = u_xlat50 + u_xlat50;
    u_xlat8.xyz = u_xlat15.xyz * (-vec3(u_xlat50)) + (-u_xlat4.xyz);
    u_xlat50 = dot(u_xlat15.xyz, u_xlat4.xyz);
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat51 = (-u_xlat32.x) * 0.699999988 + 1.70000005;
    u_xlat32.x = u_xlat32.x * u_xlat51;
    u_xlat32.x = u_xlat32.x * 6.0;
    u_xlat8 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat8.xyz, u_xlat32.x);
    u_xlat32.x = u_xlat8.w + -1.0;
    u_xlat32.x = unity_SpecCube0_HDR.w * u_xlat32.x + 1.0;
    u_xlat32.x = max(u_xlat32.x, 0.0);
    u_xlat32.x = log2(u_xlat32.x);
    u_xlat32.x = u_xlat32.x * unity_SpecCube0_HDR.y;
    u_xlat32.x = exp2(u_xlat32.x);
    u_xlat32.x = u_xlat32.x * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat32.xxx;
    u_xlat32.xy = vec2(u_xlat47) * vec2(u_xlat47) + vec2(-1.0, 1.0);
    u_xlat47 = float(1.0) / u_xlat32.y;
    u_xlat49 = u_xlat49 + -0.0399999991;
    u_xlat49 = u_xlat50 * u_xlat49 + 0.0399999991;
    u_xlat47 = u_xlat47 * u_xlat49;
    u_xlat8.xyz = vec3(u_xlat47) * u_xlat8.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz + u_xlat8.xyz;
    u_xlat46 = u_xlat46 * unity_LightData.z;
    u_xlat47 = dot(u_xlat15.xyz, _MainLightPosition.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat7.xyz = vec3(u_xlat46) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat4.xyz + _MainLightPosition.xyz;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat46 = max(u_xlat46, 1.17549435e-37);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat8.xyz = vec3(u_xlat46) * u_xlat8.xyz;
    u_xlat46 = dot(u_xlat15.xyz, u_xlat8.xyz);
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
    u_xlat47 = dot(_MainLightPosition.xyz, u_xlat8.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat46 = u_xlat46 * u_xlat32.x + 1.00001001;
    u_xlat47 = u_xlat47 * u_xlat47;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat47 = max(u_xlat47, 0.100000001);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat46 = u_xlat20 * u_xlat46;
    u_xlat46 = u_xlat48 / u_xlat46;
    u_xlat8.xyz = vec3(u_xlat46) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat46 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu46 =  uint(int(u_xlat46));
    u_xlatb8.xy = equal(vec4(vec4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat9.x = float(0.0);
    u_xlat9.y = float(0.0);
    u_xlat9.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu46 ; u_xlatu_loop_1++)
    {
        u_xlatu49 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati50 = int(u_xlatu_loop_1 & 3u);
        u_xlat49 = dot(unity_LightIndices[int(u_xlatu49)], uintBitsToFloat(ImmCB_0[u_xlati50]));
        u_xlatu49 =  uint(int(u_xlat49));
        u_xlat10.xyz = (-vs_INTERP0.xyz) * _AdditionalLightsPosition[int(u_xlatu49)].www + _AdditionalLightsPosition[int(u_xlatu49)].xyz;
        u_xlat50 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat50 = max(u_xlat50, 6.10351562e-05);
        u_xlat51 = inversesqrt(u_xlat50);
        u_xlat11.xyz = vec3(u_xlat51) * u_xlat10.xyz;
        u_xlat52 = float(1.0) / float(u_xlat50);
        u_xlat50 = u_xlat50 * _AdditionalLightsAttenuation[int(u_xlatu49)].x;
        u_xlat50 = (-u_xlat50) * u_xlat50 + 1.0;
        u_xlat50 = max(u_xlat50, 0.0);
        u_xlat50 = u_xlat50 * u_xlat50;
        u_xlat50 = u_xlat50 * u_xlat52;
        u_xlat52 = dot(_AdditionalLightsSpotDir[int(u_xlatu49)].xyz, u_xlat11.xyz);
        u_xlat52 = u_xlat52 * _AdditionalLightsAttenuation[int(u_xlatu49)].z + _AdditionalLightsAttenuation[int(u_xlatu49)].w;
        u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
        u_xlat52 = u_xlat52 * u_xlat52;
        u_xlat50 = u_xlat50 * u_xlat52;
        u_xlatu52 = u_xlatu49 >> (5u & uint(0x1F));
        u_xlati38 = 1 << (int(u_xlatu49) & int(0x1F));
        u_xlati52 = int(uint(u_xlati38) & floatBitsToUint(_AdditionalLightsCookieEnableBits[int(u_xlatu52)]));
        if(u_xlati52 != 0) {
            u_xlati52 = int(_AdditionalLightsLightTypes[int(u_xlatu49)]);
            u_xlati38 = (u_xlati52 != 0) ? 0 : 1;
            u_xlati53 = int(u_xlatu49) << (2 & int(0x1F));
            if(u_xlati38 != 0) {
                u_xlat12.xyz = vs_INTERP0.yyy * _AdditionalLightsWorldToLights[(u_xlati53 + 1) / 4][(u_xlati53 + 1) % 4].xyw;
                u_xlat12.xyz = _AdditionalLightsWorldToLights[u_xlati53 / 4][u_xlati53 % 4].xyw * vs_INTERP0.xxx + u_xlat12.xyz;
                u_xlat12.xyz = _AdditionalLightsWorldToLights[(u_xlati53 + 2) / 4][(u_xlati53 + 2) % 4].xyw * vs_INTERP0.zzz + u_xlat12.xyz;
                u_xlat12.xyz = u_xlat12.xyz + _AdditionalLightsWorldToLights[(u_xlati53 + 3) / 4][(u_xlati53 + 3) % 4].xyw;
                u_xlat12.xy = u_xlat12.xy / u_xlat12.zz;
                u_xlat12.xy = u_xlat12.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                u_xlat12.xy = clamp(u_xlat12.xy, 0.0, 1.0);
                u_xlat12.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].xy * u_xlat12.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].zw;
            } else {
                u_xlatb52 = u_xlati52==1;
                u_xlati52 = u_xlatb52 ? 1 : int(0);
                if(u_xlati52 != 0) {
                    u_xlat42.xy = vs_INTERP0.yy * _AdditionalLightsWorldToLights[(u_xlati53 + 1) / 4][(u_xlati53 + 1) % 4].xy;
                    u_xlat42.xy = _AdditionalLightsWorldToLights[u_xlati53 / 4][u_xlati53 % 4].xy * vs_INTERP0.xx + u_xlat42.xy;
                    u_xlat42.xy = _AdditionalLightsWorldToLights[(u_xlati53 + 2) / 4][(u_xlati53 + 2) % 4].xy * vs_INTERP0.zz + u_xlat42.xy;
                    u_xlat42.xy = u_xlat42.xy + _AdditionalLightsWorldToLights[(u_xlati53 + 3) / 4][(u_xlati53 + 3) % 4].xy;
                    u_xlat42.xy = u_xlat42.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat42.xy = fract(u_xlat42.xy);
                    u_xlat12.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].xy * u_xlat42.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].zw;
                } else {
                    u_xlat13 = vs_INTERP0.yyyy * _AdditionalLightsWorldToLights[(u_xlati53 + 1) / 4][(u_xlati53 + 1) % 4];
                    u_xlat13 = _AdditionalLightsWorldToLights[u_xlati53 / 4][u_xlati53 % 4] * vs_INTERP0.xxxx + u_xlat13;
                    u_xlat13 = _AdditionalLightsWorldToLights[(u_xlati53 + 2) / 4][(u_xlati53 + 2) % 4] * vs_INTERP0.zzzz + u_xlat13;
                    u_xlat13 = u_xlat13 + _AdditionalLightsWorldToLights[(u_xlati53 + 3) / 4][(u_xlati53 + 3) % 4];
                    u_xlat13.xyz = u_xlat13.xyz / u_xlat13.www;
                    u_xlat52 = dot(u_xlat13.xyz, u_xlat13.xyz);
                    u_xlat52 = inversesqrt(u_xlat52);
                    u_xlat13.xyz = vec3(u_xlat52) * u_xlat13.xyz;
                    u_xlat52 = dot(abs(u_xlat13.xyz), vec3(1.0, 1.0, 1.0));
                    u_xlat52 = max(u_xlat52, 9.99999997e-07);
                    u_xlat52 = float(1.0) / float(u_xlat52);
                    u_xlat14.xyz = vec3(u_xlat52) * u_xlat13.zxy;
                    u_xlat14.x = (-u_xlat14.x);
                    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
                    u_xlatb38.xy = greaterThanEqual(u_xlat14.yzyz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
                    u_xlat38.x = (u_xlatb38.x) ? u_xlat14.x : (-u_xlat14.x);
                    u_xlat38.y = (u_xlatb38.y) ? u_xlat14.x : (-u_xlat14.x);
                    u_xlat38.xy = u_xlat13.xy * vec2(u_xlat52) + u_xlat38.xy;
                    u_xlat38.xy = u_xlat38.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat38.xy = clamp(u_xlat38.xy, 0.0, 1.0);
                    u_xlat12.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].xy * u_xlat38.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu49)].zw;
                }
            }
            u_xlat12 = texture(sampler2D(_AdditionalLightsCookieAtlasTexture, sampler_AdditionalLightsCookieAtlasTexture), u_xlat12.xy, _GlobalMipBias.x);
            u_xlat52 = (u_xlatb8.y) ? u_xlat12.w : u_xlat12.x;
            u_xlat12.xyz = (u_xlatb8.x) ? u_xlat12.xyz : vec3(u_xlat52);
        } else {
            u_xlat12.x = float(1.0);
            u_xlat12.y = float(1.0);
            u_xlat12.z = float(1.0);
        }
        u_xlat12.xyz = u_xlat12.xyz * _AdditionalLightsColor[int(u_xlatu49)].xyz;
        u_xlat12.xyz = vec3(u_xlat35) * u_xlat12.xyz;
        u_xlat49 = dot(u_xlat15.xyz, u_xlat11.xyz);
        u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
        u_xlat49 = u_xlat49 * u_xlat50;
        u_xlat12.xyz = vec3(u_xlat49) * u_xlat12.xyz;
        u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat51) + u_xlat4.xyz;
        u_xlat49 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat49 = max(u_xlat49, 1.17549435e-37);
        u_xlat49 = inversesqrt(u_xlat49);
        u_xlat10.xyz = vec3(u_xlat49) * u_xlat10.xyz;
        u_xlat49 = dot(u_xlat15.xyz, u_xlat10.xyz);
        u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
        u_xlat50 = dot(u_xlat11.xyz, u_xlat10.xyz);
        u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
        u_xlat49 = u_xlat49 * u_xlat49;
        u_xlat49 = u_xlat49 * u_xlat32.x + 1.00001001;
        u_xlat50 = u_xlat50 * u_xlat50;
        u_xlat49 = u_xlat49 * u_xlat49;
        u_xlat50 = max(u_xlat50, 0.100000001);
        u_xlat49 = u_xlat49 * u_xlat50;
        u_xlat49 = u_xlat20 * u_xlat49;
        u_xlat49 = u_xlat48 / u_xlat49;
        u_xlat10.xyz = vec3(u_xlat49) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat6.xyz;
        u_xlat9.xyz = u_xlat10.xyz * u_xlat12.xyz + u_xlat9.xyz;
    }
    u_xlat15.xyz = u_xlat3.xyz * u_xlat5.xxx + u_xlat7.xyz;
    u_xlat15.xyz = u_xlat9.xyz + u_xlat15.xyz;
    u_xlat15.xyz = vs_INTERP4.www * u_xlat1.xyz + u_xlat15.xyz;
    u_xlat1.x = u_xlat17.x * (-u_xlat17.x);
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat15.xyz = u_xlat15.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = u_xlat1.xxx * u_xlat15.xyz + unity_FogColor.xyz;
    SV_Target0.w = (u_xlatb2) ? u_xlat0 : 1.0;
    return;
}

