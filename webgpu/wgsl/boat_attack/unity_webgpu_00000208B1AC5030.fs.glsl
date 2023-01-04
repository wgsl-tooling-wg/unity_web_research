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
	vec4 _MainTex_ST;
	vec4 _BaseColor;
	vec4 _SpecColor;
	vec4 _EmissionColor;
	float _Cutoff;
	float _Shininess;
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
layout(set = 1, binding = 5, std140) uniform LightCookies {
	mat4x4 _MainLightWorldToLight;
	float _AdditionalLightsCookieEnableBits[8];
	float _MainLightCookieTextureFormat;
	float _AdditionalLightsCookieAtlasTextureFormat;
};
layout(set = 1, binding = 6, std140) uniform AdditionalLightsCookies {
	mat4x4 _AdditionalLightsWorldToLights[256];
	vec4 _AdditionalLightsCookieAtlasUVRects[256];
	float _AdditionalLightsLightTypes[256];
};
layout(set = 0, binding = 0) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 1) uniform mediump texture2D _MainTex;
layout(set = 0, binding = 2) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _MainLightCookieTexture;
layout(set = 0, binding = 5) uniform mediump texture2D _AdditionalLightsCookieAtlasTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec2 vs_TEXCOORD1;
layout(location = 2) in highp vec4 vs_TEXCOORD2;
layout(location = 3) in highp vec3 vs_TEXCOORD3;
layout(location = 4) in highp vec4 vs_TEXCOORD7;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 6) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 7) uniform mediump  sampler sampler_MainTex;
layout(set = 0, binding = 8) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 9) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 10) uniform mediump  sampler sampler_MainLightCookieTexture;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_AdditionalLightsCookieAtlasTexture;
void main()
{
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
bvec4 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
bvec2 u_xlatb5;
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
float u_xlat19;
vec3 u_xlat25;
vec2 u_xlat26;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat43;
int u_xlati43;
bvec2 u_xlatb43;
vec2 u_xlat45;
vec2 u_xlat46;
vec2 u_xlat51;
float u_xlat57;
float u_xlat58;
uint u_xlatu58;
bool u_xlatb58;
float u_xlat59;
uint u_xlatu59;
bool u_xlatb59;
float u_xlat60;
int u_xlati60;
float u_xlat61;
int u_xlati61;
uint u_xlatu61;
bool u_xlatb61;
int u_xlati62;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_MainTex, sampler_MainTex), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat1 = u_xlat0 * vs_TEXCOORD7;
    u_xlatb0 = u_xlat1.w>=_Cutoff;
    u_xlat0.x = u_xlatb0 ? u_xlat1.w : float(0.0);
    u_xlat19 = u_xlat0.w * vs_TEXCOORD7.w + (-_Cutoff);
    u_xlat38 = dFdxCoarse(u_xlat1.w);
    u_xlat57 = dFdyCoarse(u_xlat1.w);
    u_xlat38 = abs(u_xlat57) + abs(u_xlat38);
    u_xlat38 = max(u_xlat38, 9.99999975e-05);
    u_xlat19 = u_xlat19 / u_xlat38;
    u_xlat19 = u_xlat19 + 0.5;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb38 = _AlphaToMaskAvailable!=0.0;
    u_xlat0.x = (u_xlatb38) ? u_xlat19 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat5.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat6.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat3.y = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat3.z = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat3.w = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb3 = lessThan(u_xlat3, _CascadeShadowSplitSphereRadii);
    u_xlat4.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb3.y ? float(1.0) : 0.0;
    u_xlat4.z = u_xlatb3.z ? float(1.0) : 0.0;
    u_xlat4.w = u_xlatb3.w ? float(1.0) : 0.0;
;
    u_xlat3.x = (u_xlatb3.x) ? float(-1.0) : float(-0.0);
    u_xlat3.y = (u_xlatb3.y) ? float(-1.0) : float(-0.0);
    u_xlat3.z = (u_xlatb3.z) ? float(-1.0) : float(-0.0);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.yzw;
    u_xlat4.yzw = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = dot(u_xlat4, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat0.x = (-u_xlat0.x) + 4.0;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati0 = int(u_xlatu0) << (2 & int(0x1F));
    u_xlat3.xyz = vs_TEXCOORD2.yyy * _MainLightWorldToShadow[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].xyz;
    u_xlat3.xyz = _MainLightWorldToShadow[u_xlati0 / 4][u_xlati0 % 4].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = _MainLightWorldToShadow[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + _MainLightWorldToShadow[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xyz;
    u_xlat4.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_TEXCOORD1.xy, _GlobalMipBias.x).xyz;
    u_xlat0.xw = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat5.xy = u_xlat0.xw * hlslcc_FragCoord.xy;
    u_xlat0.x = u_xlat5.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat5.z = (-u_xlat0.x) + 1.0;
    u_xlat0.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat5.xz, _GlobalMipBias.x).x;
    u_xlat57 = u_xlat0.x + -1.0;
    u_xlat57 = _AmbientOcclusionParam.w * u_xlat57 + 1.0;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlatb58 = 0.0<_MainLightShadowParams.y;
    if(u_xlatb58){
        u_xlatb58 = _MainLightShadowParams.y==1.0;
        if(u_xlatb58){
            u_xlat5 = u_xlat3.xyxy + _MainLightShadowOffset0;
            vec3 txVec0 = vec3(u_xlat5.xy,u_xlat3.z);
            u_xlat6.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
            vec3 txVec1 = vec3(u_xlat5.zw,u_xlat3.z);
            u_xlat6.y = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
            u_xlat5 = u_xlat3.xyxy + _MainLightShadowOffset1;
            vec3 txVec2 = vec3(u_xlat5.xy,u_xlat3.z);
            u_xlat6.z = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec2, 0.0);
            vec3 txVec3 = vec3(u_xlat5.zw,u_xlat3.z);
            u_xlat6.w = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec3, 0.0);
            u_xlat58 = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb59 = _MainLightShadowParams.y==2.0;
            if(u_xlatb59){
                u_xlat5.xy = u_xlat3.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat5.xy = floor(u_xlat5.xy);
                u_xlat43.xy = u_xlat3.xy * _MainLightShadowmapSize.zw + (-u_xlat5.xy);
                u_xlat6 = u_xlat43.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat7 = u_xlat6.xxzz * u_xlat6.xxzz;
                u_xlat6.xz = u_xlat7.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat7.xy = u_xlat7.xz * vec2(0.5, 0.5) + (-u_xlat43.xy);
                u_xlat45.xy = (-u_xlat43.xy) + vec2(1.0, 1.0);
                u_xlat8.xy = min(u_xlat43.xy, vec2(0.0, 0.0));
                u_xlat8.xy = (-u_xlat8.xy) * u_xlat8.xy + u_xlat45.xy;
                u_xlat43.xy = max(u_xlat43.xy, vec2(0.0, 0.0));
                u_xlat43.xy = (-u_xlat43.xy) * u_xlat43.xy + u_xlat6.yw;
                u_xlat8.xy = u_xlat8.xy + vec2(1.0, 1.0);
                u_xlat43.xy = u_xlat43.xy + vec2(1.0, 1.0);
                u_xlat9.xy = u_xlat7.xy * vec2(0.159999996, 0.159999996);
                u_xlat7.xy = u_xlat45.xy * vec2(0.159999996, 0.159999996);
                u_xlat8.xy = u_xlat8.xy * vec2(0.159999996, 0.159999996);
                u_xlat10.xy = u_xlat43.xy * vec2(0.159999996, 0.159999996);
                u_xlat43.xy = u_xlat6.yw * vec2(0.159999996, 0.159999996);
                u_xlat9.z = u_xlat8.x;
                u_xlat9.w = u_xlat43.x;
                u_xlat7.z = u_xlat10.x;
                u_xlat7.w = u_xlat6.x;
                u_xlat11 = u_xlat7.zwxz + u_xlat9.zwxz;
                u_xlat8.z = u_xlat9.y;
                u_xlat8.w = u_xlat43.y;
                u_xlat10.z = u_xlat7.y;
                u_xlat10.w = u_xlat6.z;
                u_xlat6.xyz = u_xlat8.zyw + u_xlat10.zyw;
                u_xlat7.xyz = u_xlat7.xzw / u_xlat11.zwy;
                u_xlat7.xyz = u_xlat7.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat8.xyz = u_xlat10.zyw / u_xlat6.xyz;
                u_xlat8.xyz = u_xlat8.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat7.xyz = u_xlat7.yxz * _MainLightShadowmapSize.xxx;
                u_xlat8.xyz = u_xlat8.xyz * _MainLightShadowmapSize.yyy;
                u_xlat7.w = u_xlat8.x;
                u_xlat9 = u_xlat5.xyxy * _MainLightShadowmapSize.xyxy + u_xlat7.ywxw;
                u_xlat43.xy = u_xlat5.xy * _MainLightShadowmapSize.xy + u_xlat7.zw;
                u_xlat8.w = u_xlat7.y;
                u_xlat7.yw = u_xlat8.yz;
                u_xlat10 = u_xlat5.xyxy * _MainLightShadowmapSize.xyxy + u_xlat7.xyzy;
                u_xlat8 = u_xlat5.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.wywz;
                u_xlat7 = u_xlat5.xyxy * _MainLightShadowmapSize.xyxy + u_xlat7.xwzw;
                u_xlat12 = u_xlat6.xxxy * u_xlat11.zwyz;
                u_xlat13 = u_xlat6.yyzz * u_xlat11;
                u_xlat59 = u_xlat6.z * u_xlat11.y;
                vec3 txVec4 = vec3(u_xlat9.xy,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat9.zw,u_xlat3.z);
                u_xlat61 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec5, 0.0);
                u_xlat61 = u_xlat61 * u_xlat12.y;
                u_xlat60 = u_xlat12.x * u_xlat60 + u_xlat61;
                vec3 txVec6 = vec3(u_xlat43.xy,u_xlat3.z);
                u_xlat61 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec6, 0.0);
                u_xlat60 = u_xlat12.z * u_xlat61 + u_xlat60;
                vec3 txVec7 = vec3(u_xlat8.xy,u_xlat3.z);
                u_xlat61 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec7, 0.0);
                u_xlat60 = u_xlat12.w * u_xlat61 + u_xlat60;
                vec3 txVec8 = vec3(u_xlat10.xy,u_xlat3.z);
                u_xlat61 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec8, 0.0);
                u_xlat60 = u_xlat13.x * u_xlat61 + u_xlat60;
                vec3 txVec9 = vec3(u_xlat10.zw,u_xlat3.z);
                u_xlat61 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec9, 0.0);
                u_xlat60 = u_xlat13.y * u_xlat61 + u_xlat60;
                vec3 txVec10 = vec3(u_xlat8.zw,u_xlat3.z);
                u_xlat61 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec10, 0.0);
                u_xlat60 = u_xlat13.z * u_xlat61 + u_xlat60;
                vec3 txVec11 = vec3(u_xlat7.xy,u_xlat3.z);
                u_xlat61 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec11, 0.0);
                u_xlat60 = u_xlat13.w * u_xlat61 + u_xlat60;
                vec3 txVec12 = vec3(u_xlat7.zw,u_xlat3.z);
                u_xlat61 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec12, 0.0);
                u_xlat58 = u_xlat59 * u_xlat61 + u_xlat60;
            } else {
                u_xlat5.xy = u_xlat3.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat5.xy = floor(u_xlat5.xy);
                u_xlat43.xy = u_xlat3.xy * _MainLightShadowmapSize.zw + (-u_xlat5.xy);
                u_xlat6 = u_xlat43.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat7 = u_xlat6.xxzz * u_xlat6.xxzz;
                u_xlat8.yw = u_xlat7.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat6.xz = u_xlat7.xz * vec2(0.5, 0.5) + (-u_xlat43.xy);
                u_xlat7.xy = (-u_xlat43.xy) + vec2(1.0, 1.0);
                u_xlat45.xy = min(u_xlat43.xy, vec2(0.0, 0.0));
                u_xlat7.xy = (-u_xlat45.xy) * u_xlat45.xy + u_xlat7.xy;
                u_xlat45.xy = max(u_xlat43.xy, vec2(0.0, 0.0));
                u_xlat25.xz = (-u_xlat45.xy) * u_xlat45.xy + u_xlat6.yw;
                u_xlat7.xy = u_xlat7.xy + vec2(2.0, 2.0);
                u_xlat6.yw = u_xlat25.xz + vec2(2.0, 2.0);
                u_xlat9.z = u_xlat6.y * 0.0816320032;
                u_xlat10.xyz = u_xlat6.zxw * vec3(0.0816320032, 0.0816320032, 0.0816320032);
                u_xlat6.xy = u_xlat7.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat9.x = u_xlat10.y;
                u_xlat9.yw = u_xlat43.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat7.xz = u_xlat43.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat7.y = u_xlat6.x;
                u_xlat7.w = u_xlat8.y;
                u_xlat9 = u_xlat7 + u_xlat9;
                u_xlat10.yw = u_xlat43.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat8.xz = u_xlat43.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat8.y = u_xlat6.y;
                u_xlat6 = u_xlat8 + u_xlat10;
                u_xlat7 = u_xlat7 / u_xlat9;
                u_xlat7 = u_xlat7 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat8 = u_xlat8 / u_xlat6;
                u_xlat8 = u_xlat8 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat7 = u_xlat7.wxyz * _MainLightShadowmapSize.xxxx;
                u_xlat8 = u_xlat8.xwyz * _MainLightShadowmapSize.yyyy;
                u_xlat10.xzw = u_xlat7.yzw;
                u_xlat10.y = u_xlat8.x;
                u_xlat11 = u_xlat5.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.xyzy;
                u_xlat43.xy = u_xlat5.xy * _MainLightShadowmapSize.xy + u_xlat10.wy;
                u_xlat7.y = u_xlat10.y;
                u_xlat10.y = u_xlat8.z;
                u_xlat12 = u_xlat5.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.xyzy;
                u_xlat13.xy = u_xlat5.xy * _MainLightShadowmapSize.xy + u_xlat10.wy;
                u_xlat7.z = u_xlat10.y;
                u_xlat14 = u_xlat5.xyxy * _MainLightShadowmapSize.xyxy + u_xlat7.xyxz;
                u_xlat10.y = u_xlat8.w;
                u_xlat15 = u_xlat5.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.xyzy;
                u_xlat26.xy = u_xlat5.xy * _MainLightShadowmapSize.xy + u_xlat10.wy;
                u_xlat7.w = u_xlat10.y;
                u_xlat51.xy = u_xlat5.xy * _MainLightShadowmapSize.xy + u_xlat7.xw;
                u_xlat8.xzw = u_xlat10.xzw;
                u_xlat10 = u_xlat5.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyzy;
                u_xlat46.xy = u_xlat5.xy * _MainLightShadowmapSize.xy + u_xlat8.wy;
                u_xlat8.x = u_xlat7.x;
                u_xlat5.xy = u_xlat5.xy * _MainLightShadowmapSize.xy + u_xlat8.xy;
                u_xlat16 = u_xlat6.xxxx * u_xlat9;
                u_xlat17 = u_xlat6.yyyy * u_xlat9;
                u_xlat18 = u_xlat6.zzzz * u_xlat9;
                u_xlat6 = u_xlat6.wwww * u_xlat9;
                vec3 txVec13 = vec3(u_xlat11.xy,u_xlat3.z);
                u_xlat59 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat11.zw,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec14, 0.0);
                u_xlat60 = u_xlat60 * u_xlat16.y;
                u_xlat59 = u_xlat16.x * u_xlat59 + u_xlat60;
                vec3 txVec15 = vec3(u_xlat43.xy,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec15, 0.0);
                u_xlat59 = u_xlat16.z * u_xlat60 + u_xlat59;
                vec3 txVec16 = vec3(u_xlat14.xy,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec16, 0.0);
                u_xlat59 = u_xlat16.w * u_xlat60 + u_xlat59;
                vec3 txVec17 = vec3(u_xlat12.xy,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec17, 0.0);
                u_xlat59 = u_xlat17.x * u_xlat60 + u_xlat59;
                vec3 txVec18 = vec3(u_xlat12.zw,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec18, 0.0);
                u_xlat59 = u_xlat17.y * u_xlat60 + u_xlat59;
                vec3 txVec19 = vec3(u_xlat13.xy,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec19, 0.0);
                u_xlat59 = u_xlat17.z * u_xlat60 + u_xlat59;
                vec3 txVec20 = vec3(u_xlat14.zw,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec20, 0.0);
                u_xlat59 = u_xlat17.w * u_xlat60 + u_xlat59;
                vec3 txVec21 = vec3(u_xlat15.xy,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec21, 0.0);
                u_xlat59 = u_xlat18.x * u_xlat60 + u_xlat59;
                vec3 txVec22 = vec3(u_xlat15.zw,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec22, 0.0);
                u_xlat59 = u_xlat18.y * u_xlat60 + u_xlat59;
                vec3 txVec23 = vec3(u_xlat26.xy,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec23, 0.0);
                u_xlat59 = u_xlat18.z * u_xlat60 + u_xlat59;
                vec3 txVec24 = vec3(u_xlat51.xy,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec24, 0.0);
                u_xlat59 = u_xlat18.w * u_xlat60 + u_xlat59;
                vec3 txVec25 = vec3(u_xlat10.xy,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec25, 0.0);
                u_xlat59 = u_xlat6.x * u_xlat60 + u_xlat59;
                vec3 txVec26 = vec3(u_xlat10.zw,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec26, 0.0);
                u_xlat59 = u_xlat6.y * u_xlat60 + u_xlat59;
                vec3 txVec27 = vec3(u_xlat46.xy,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec27, 0.0);
                u_xlat59 = u_xlat6.z * u_xlat60 + u_xlat59;
                vec3 txVec28 = vec3(u_xlat5.xy,u_xlat3.z);
                u_xlat60 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec28, 0.0);
                u_xlat58 = u_xlat6.w * u_xlat60 + u_xlat59;
            }
        }
    } else {
        vec3 txVec29 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat58 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec29, 0.0);
    }
    u_xlat59 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat58 = u_xlat58 * _MainLightShadowParams.x + u_xlat59;
    u_xlatb59 = 0.0>=u_xlat3.z;
    u_xlatb3.x = u_xlat3.z>=1.0;
    u_xlatb59 = u_xlatb59 || u_xlatb3.x;
    u_xlat58 = (u_xlatb59) ? 1.0 : u_xlat58;
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat59 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat59 = u_xlat59 * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
    u_xlat3.x = (-u_xlat58) + 1.0;
    u_xlat58 = u_xlat59 * u_xlat3.x + u_xlat58;
    u_xlatb59 = _MainLightCookieTextureFormat!=-1.0;
    if(u_xlatb59){
        u_xlat3.xy = vs_TEXCOORD2.yy * _MainLightWorldToLight[1].xy;
        u_xlat3.xy = _MainLightWorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat3.xy;
        u_xlat3.xy = _MainLightWorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat3.xy;
        u_xlat3.xy = u_xlat3.xy + _MainLightWorldToLight[3].xy;
        u_xlat3.xy = u_xlat3.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat3 = texture(sampler2D(_MainLightCookieTexture, sampler_MainLightCookieTexture), u_xlat3.xy, _GlobalMipBias.x);
        u_xlatb5.xy = equal(vec4(vec4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat59 = (u_xlatb5.y) ? u_xlat3.w : u_xlat3.x;
        u_xlat3.xyz = (u_xlatb5.x) ? u_xlat3.xyz : vec3(u_xlat59);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
    }
    u_xlat3.xyz = u_xlat3.xyz * _MainLightColor.xyz;
    u_xlat3.xyz = vec3(u_xlat57) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.x = u_xlat58 * unity_LightData.z;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, _MainLightPosition.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz;
    u_xlat0.x = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu0 =  uint(int(u_xlat0.x));
    u_xlatb5.xy = equal(vec4(vec4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat6.x = float(0.0);
    u_xlat6.y = float(0.0);
    u_xlat6.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu0 ; u_xlatu_loop_1++)
    {
        u_xlatu59 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati60 = int(u_xlatu_loop_1 & 3u);
        u_xlat59 = dot(unity_LightIndices[int(u_xlatu59)], uintBitsToFloat(ImmCB_0[u_xlati60]));
        u_xlatu59 =  uint(int(u_xlat59));
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[int(u_xlatu59)].www + _AdditionalLightsPosition[int(u_xlatu59)].xyz;
        u_xlat60 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat60 = max(u_xlat60, 6.10351562e-05);
        u_xlat61 = inversesqrt(u_xlat60);
        u_xlat7.xyz = vec3(u_xlat61) * u_xlat7.xyz;
        u_xlat61 = float(1.0) / float(u_xlat60);
        u_xlat60 = u_xlat60 * _AdditionalLightsAttenuation[int(u_xlatu59)].x;
        u_xlat60 = (-u_xlat60) * u_xlat60 + 1.0;
        u_xlat60 = max(u_xlat60, 0.0);
        u_xlat60 = u_xlat60 * u_xlat60;
        u_xlat60 = u_xlat60 * u_xlat61;
        u_xlat61 = dot(_AdditionalLightsSpotDir[int(u_xlatu59)].xyz, u_xlat7.xyz);
        u_xlat61 = u_xlat61 * _AdditionalLightsAttenuation[int(u_xlatu59)].z + _AdditionalLightsAttenuation[int(u_xlatu59)].w;
        u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
        u_xlat61 = u_xlat61 * u_xlat61;
        u_xlat60 = u_xlat60 * u_xlat61;
        u_xlatu61 = u_xlatu59 >> (5u & uint(0x1F));
        u_xlati43 = 1 << (int(u_xlatu59) & int(0x1F));
        u_xlati61 = int(uint(u_xlati43) & floatBitsToUint(_AdditionalLightsCookieEnableBits[int(u_xlatu61)]));
        if(u_xlati61 != 0) {
            u_xlati61 = int(_AdditionalLightsLightTypes[int(u_xlatu59)]);
            u_xlati43 = (u_xlati61 != 0) ? 0 : 1;
            u_xlati62 = int(u_xlatu59) << (2 & int(0x1F));
            if(u_xlati43 != 0) {
                u_xlat8.xyz = vs_TEXCOORD2.yyy * _AdditionalLightsWorldToLights[(u_xlati62 + 1) / 4][(u_xlati62 + 1) % 4].xyw;
                u_xlat8.xyz = _AdditionalLightsWorldToLights[u_xlati62 / 4][u_xlati62 % 4].xyw * vs_TEXCOORD2.xxx + u_xlat8.xyz;
                u_xlat8.xyz = _AdditionalLightsWorldToLights[(u_xlati62 + 2) / 4][(u_xlati62 + 2) % 4].xyw * vs_TEXCOORD2.zzz + u_xlat8.xyz;
                u_xlat8.xyz = u_xlat8.xyz + _AdditionalLightsWorldToLights[(u_xlati62 + 3) / 4][(u_xlati62 + 3) % 4].xyw;
                u_xlat8.xy = u_xlat8.xy / u_xlat8.zz;
                u_xlat8.xy = u_xlat8.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
                u_xlat8.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu59)].xy * u_xlat8.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu59)].zw;
            } else {
                u_xlatb61 = u_xlati61==1;
                u_xlati61 = u_xlatb61 ? 1 : int(0);
                if(u_xlati61 != 0) {
                    u_xlat46.xy = vs_TEXCOORD2.yy * _AdditionalLightsWorldToLights[(u_xlati62 + 1) / 4][(u_xlati62 + 1) % 4].xy;
                    u_xlat46.xy = _AdditionalLightsWorldToLights[u_xlati62 / 4][u_xlati62 % 4].xy * vs_TEXCOORD2.xx + u_xlat46.xy;
                    u_xlat46.xy = _AdditionalLightsWorldToLights[(u_xlati62 + 2) / 4][(u_xlati62 + 2) % 4].xy * vs_TEXCOORD2.zz + u_xlat46.xy;
                    u_xlat46.xy = u_xlat46.xy + _AdditionalLightsWorldToLights[(u_xlati62 + 3) / 4][(u_xlati62 + 3) % 4].xy;
                    u_xlat46.xy = u_xlat46.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat46.xy = fract(u_xlat46.xy);
                    u_xlat8.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu59)].xy * u_xlat46.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu59)].zw;
                } else {
                    u_xlat9 = vs_TEXCOORD2.yyyy * _AdditionalLightsWorldToLights[(u_xlati62 + 1) / 4][(u_xlati62 + 1) % 4];
                    u_xlat9 = _AdditionalLightsWorldToLights[u_xlati62 / 4][u_xlati62 % 4] * vs_TEXCOORD2.xxxx + u_xlat9;
                    u_xlat9 = _AdditionalLightsWorldToLights[(u_xlati62 + 2) / 4][(u_xlati62 + 2) % 4] * vs_TEXCOORD2.zzzz + u_xlat9;
                    u_xlat9 = u_xlat9 + _AdditionalLightsWorldToLights[(u_xlati62 + 3) / 4][(u_xlati62 + 3) % 4];
                    u_xlat9.xyz = u_xlat9.xyz / u_xlat9.www;
                    u_xlat61 = dot(u_xlat9.xyz, u_xlat9.xyz);
                    u_xlat61 = inversesqrt(u_xlat61);
                    u_xlat9.xyz = vec3(u_xlat61) * u_xlat9.xyz;
                    u_xlat61 = dot(abs(u_xlat9.xyz), vec3(1.0, 1.0, 1.0));
                    u_xlat61 = max(u_xlat61, 9.99999997e-07);
                    u_xlat61 = float(1.0) / float(u_xlat61);
                    u_xlat10.xyz = vec3(u_xlat61) * u_xlat9.zxy;
                    u_xlat10.x = (-u_xlat10.x);
                    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
                    u_xlatb43.xy = greaterThanEqual(u_xlat10.yzyz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
                    u_xlat43.x = (u_xlatb43.x) ? u_xlat10.x : (-u_xlat10.x);
                    u_xlat43.y = (u_xlatb43.y) ? u_xlat10.x : (-u_xlat10.x);
                    u_xlat43.xy = u_xlat9.xy * vec2(u_xlat61) + u_xlat43.xy;
                    u_xlat43.xy = u_xlat43.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat43.xy = clamp(u_xlat43.xy, 0.0, 1.0);
                    u_xlat8.xy = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu59)].xy * u_xlat43.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu59)].zw;
                }
            }
            u_xlat8 = texture(sampler2D(_AdditionalLightsCookieAtlasTexture, sampler_AdditionalLightsCookieAtlasTexture), u_xlat8.xy, _GlobalMipBias.x);
            u_xlat61 = (u_xlatb5.y) ? u_xlat8.w : u_xlat8.x;
            u_xlat8.xyz = (u_xlatb5.x) ? u_xlat8.xyz : vec3(u_xlat61);
        } else {
            u_xlat8.x = float(1.0);
            u_xlat8.y = float(1.0);
            u_xlat8.z = float(1.0);
        }
        u_xlat8.xyz = u_xlat8.xyz * _AdditionalLightsColor[int(u_xlatu59)].xyz;
        u_xlat8.xyz = vec3(u_xlat57) * u_xlat8.xyz;
        u_xlat8.xyz = vec3(u_xlat60) * u_xlat8.xyz;
        u_xlat59 = dot(u_xlat2.xyz, u_xlat7.xyz);
        u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
        u_xlat7.xyz = vec3(u_xlat59) * u_xlat8.xyz;
        u_xlat6.xyz = u_xlat7.xyz * u_xlat1.xyz + u_xlat6.xyz;
    }
    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.xyz + u_xlat3.xyz;
    SV_Target0.xyz = u_xlat6.xyz + u_xlat1.xyz;
    SV_Target0.w = (u_xlatb38) ? u_xlat19 : 1.0;
    return;
}

