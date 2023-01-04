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
layout(set = 0, binding = 0) uniform mediump textureCube unity_SpecCube0;
layout(set = 0, binding = 1) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 2) uniform mediump texture2D _BaseMap;
layout(set = 0, binding = 3) uniform mediump texture2D _EmissionMap;
layout(set = 0, binding = 4) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 5) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 6) uniform mediump texture2D _MainLightCookieTexture;
layout(set = 0, binding = 7) uniform mediump texture2D _AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 8) uniform mediump texture2D _DitheringTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD1;
layout(location = 2) in highp vec3 vs_TEXCOORD2;
layout(location = 3) in highp vec2 vs_TEXCOORD8;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 9) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 10) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_BaseMap;
layout(set = 0, binding = 12) uniform mediump  sampler sampler_EmissionMap;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 14) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 15) uniform mediump  sampler sampler_MainLightCookieTexture;
layout(set = 0, binding = 16) uniform mediump  sampler sampler_AdditionalLightsCookieAtlasTexture;
layout(set = 0, binding = 17) uniform mediump  sampler sampler_DitheringTexture;
void main()
{
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
bvec4 u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
int u_xlati11;
vec4 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
vec2 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
vec3 u_xlat23;
vec2 u_xlat27;
bvec2 u_xlatb27;
vec3 u_xlat29;
bvec2 u_xlatb29;
float u_xlat30;
vec3 u_xlat31;
vec3 u_xlat33;
int u_xlati33;
bvec3 u_xlatb33;
float u_xlat49;
bool u_xlatb49;
vec2 u_xlat51;
bool u_xlatb51;
vec2 u_xlat52;
vec2 u_xlat54;
vec2 u_xlat55;
vec2 u_xlat58;
float u_xlat66;
int u_xlati66;
uint u_xlatu66;
bool u_xlatb66;
float u_xlat68;
uint u_xlatu68;
bool u_xlatb68;
float u_xlat69;
uint u_xlatu69;
bool u_xlatb69;
float u_xlat70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
int u_xlati73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
int u_xlati76;
uint u_xlatu76;
bool u_xlatb76;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_BaseMap, sampler_BaseMap), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat1 = u_xlat0.wxyz * _BaseColor.wxyz;
    u_xlat2.xyz = texture(sampler2D(_EmissionMap, sampler_EmissionMap), vs_TEXCOORD0.xy, _GlobalMipBias.x).xyz;
    u_xlat3.xy = hlslcc_FragCoord.xy * vec2(_DitheringTextureInvSize);
    u_xlat66 = texture(sampler2D(_DitheringTexture, sampler_DitheringTexture), u_xlat3.xy, _GlobalMipBias.x).w;
    u_xlatb68 = unity_LODFade.x>=0.0;
    u_xlat66 = (u_xlatb68) ? abs(u_xlat66) : -abs(u_xlat66);
    u_xlat66 = (-u_xlat66) + unity_LODFade.x;
    u_xlatb66 = u_xlat66<0.0;
    if(((int(u_xlatb66) * int(0xffffffffu)))!=0){discard;}
    u_xlatb66 = unity_OrthoParams.w==0.0;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat68 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat3.xyz = vec3(u_xlat68) * u_xlat3.xyz;
    u_xlat4.x = (u_xlatb66) ? u_xlat3.x : unity_MatrixV[0].z;
    u_xlat4.y = (u_xlatb66) ? u_xlat3.y : unity_MatrixV[1].z;
    u_xlat4.z = (u_xlatb66) ? u_xlat3.z : unity_MatrixV[2].z;
    u_xlat66 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat3.xyz = vec3(u_xlat66) * vs_TEXCOORD2.xyz;
    u_xlat5.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat6.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.y = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat5.z = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat5.w = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb5 = lessThan(u_xlat5, _CascadeShadowSplitSphereRadii);
    u_xlat6.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat6.z = u_xlatb5.z ? float(1.0) : 0.0;
    u_xlat6.w = u_xlatb5.w ? float(1.0) : 0.0;
;
    u_xlat5.x = (u_xlatb5.x) ? float(-1.0) : float(-0.0);
    u_xlat5.y = (u_xlatb5.y) ? float(-1.0) : float(-0.0);
    u_xlat5.z = (u_xlatb5.z) ? float(-1.0) : float(-0.0);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.yzw;
    u_xlat6.yzw = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat66 = dot(u_xlat6, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat66 = (-u_xlat66) + 4.0;
    u_xlatu66 = uint(u_xlat66);
    u_xlati66 = int(u_xlatu66) << (2 & int(0x1F));
    u_xlat5.xyz = vs_TEXCOORD1.yyy * _MainLightWorldToShadow[(u_xlati66 + 1) / 4][(u_xlati66 + 1) % 4].xyz;
    u_xlat5.xyz = _MainLightWorldToShadow[u_xlati66 / 4][u_xlati66 % 4].xyz * vs_TEXCOORD1.xxx + u_xlat5.xyz;
    u_xlat5.xyz = _MainLightWorldToShadow[(u_xlati66 + 2) / 4][(u_xlati66 + 2) % 4].xyz * vs_TEXCOORD1.zzz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + _MainLightWorldToShadow[(u_xlati66 + 3) / 4][(u_xlati66 + 3) % 4].xyz;
    u_xlat6.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_TEXCOORD8.xy, _GlobalMipBias.x).xyz;
    u_xlat7.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat7.xy = u_xlat7.xy * hlslcc_FragCoord.xy;
    u_xlat66 = u_xlat7.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat7.z = (-u_xlat66) + 1.0;
    u_xlat66 = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat68 = (-u_xlat66) + _Smoothness;
    u_xlat23.xyz = vec3(u_xlat66) * u_xlat1.yzw;
    u_xlat0.xyz = u_xlat0.xyz * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat66 = (-_Smoothness) + 1.0;
    u_xlat69 = u_xlat66 * u_xlat66;
    u_xlat69 = max(u_xlat69, 0.0078125);
    u_xlat70 = u_xlat69 * u_xlat69;
    u_xlat68 = u_xlat68 + 1.0;
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
    u_xlat71 = u_xlat69 * 4.0 + 2.0;
    u_xlat72 = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat7.xz, _GlobalMipBias.x).x;
    u_xlat7.x = u_xlat72 + -1.0;
    u_xlat7.x = _AmbientOcclusionParam.w * u_xlat7.x + 1.0;
    u_xlat72 = min(u_xlat72, 1.0);
    u_xlatb29.x = 0.0<_MainLightShadowParams.y;
    if(u_xlatb29.x){
        u_xlatb29.x = _MainLightShadowParams.y==1.0;
        if(u_xlatb29.x){
            u_xlat8 = u_xlat5.xyxy + _MainLightShadowOffset0;
            vec3 txVec0 = vec3(u_xlat8.xy,u_xlat5.z);
            u_xlat9.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
            vec3 txVec1 = vec3(u_xlat8.zw,u_xlat5.z);
            u_xlat9.y = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
            u_xlat8 = u_xlat5.xyxy + _MainLightShadowOffset1;
            vec3 txVec2 = vec3(u_xlat8.xy,u_xlat5.z);
            u_xlat9.z = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec2, 0.0);
            vec3 txVec3 = vec3(u_xlat8.zw,u_xlat5.z);
            u_xlat9.w = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec3, 0.0);
            u_xlat29.x = dot(u_xlat9, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb51 = _MainLightShadowParams.y==2.0;
            if(u_xlatb51){
                u_xlat51.xy = u_xlat5.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat51.xy = floor(u_xlat51.xy);
                u_xlat8.xy = u_xlat5.xy * _MainLightShadowmapSize.zw + (-u_xlat51.xy);
                u_xlat9 = u_xlat8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat10 = u_xlat9.xxzz * u_xlat9.xxzz;
                u_xlat52.xy = u_xlat10.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat9.xz = u_xlat10.xz * vec2(0.5, 0.5) + (-u_xlat8.xy);
                u_xlat10.xy = (-u_xlat8.xy) + vec2(1.0, 1.0);
                u_xlat54.xy = min(u_xlat8.xy, vec2(0.0, 0.0));
                u_xlat54.xy = (-u_xlat54.xy) * u_xlat54.xy + u_xlat10.xy;
                u_xlat8.xy = max(u_xlat8.xy, vec2(0.0, 0.0));
                u_xlat8.xy = (-u_xlat8.xy) * u_xlat8.xy + u_xlat9.yw;
                u_xlat54.xy = u_xlat54.xy + vec2(1.0, 1.0);
                u_xlat8.xy = u_xlat8.xy + vec2(1.0, 1.0);
                u_xlat11.xy = u_xlat9.xz * vec2(0.159999996, 0.159999996);
                u_xlat12.xy = u_xlat10.xy * vec2(0.159999996, 0.159999996);
                u_xlat10.xy = u_xlat54.xy * vec2(0.159999996, 0.159999996);
                u_xlat13.xy = u_xlat8.xy * vec2(0.159999996, 0.159999996);
                u_xlat8.xy = u_xlat9.yw * vec2(0.159999996, 0.159999996);
                u_xlat11.z = u_xlat10.x;
                u_xlat11.w = u_xlat8.x;
                u_xlat12.z = u_xlat13.x;
                u_xlat12.w = u_xlat52.x;
                u_xlat9 = u_xlat11.zwxz + u_xlat12.zwxz;
                u_xlat10.z = u_xlat11.y;
                u_xlat10.w = u_xlat8.y;
                u_xlat13.z = u_xlat12.y;
                u_xlat13.w = u_xlat52.y;
                u_xlat8.xyz = u_xlat10.zyw + u_xlat13.zyw;
                u_xlat10.xyz = u_xlat12.xzw / u_xlat9.zwy;
                u_xlat10.xyz = u_xlat10.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat11.xyz = u_xlat13.zyw / u_xlat8.xyz;
                u_xlat11.xyz = u_xlat11.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat10.xyz = u_xlat10.yxz * _MainLightShadowmapSize.xxx;
                u_xlat11.xyz = u_xlat11.xyz * _MainLightShadowmapSize.yyy;
                u_xlat10.w = u_xlat11.x;
                u_xlat12 = u_xlat51.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.ywxw;
                u_xlat13.xy = u_xlat51.xy * _MainLightShadowmapSize.xy + u_xlat10.zw;
                u_xlat11.w = u_xlat10.y;
                u_xlat10.yw = u_xlat11.yz;
                u_xlat14 = u_xlat51.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.xyzy;
                u_xlat11 = u_xlat51.xyxy * _MainLightShadowmapSize.xyxy + u_xlat11.wywz;
                u_xlat10 = u_xlat51.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.xwzw;
                u_xlat15 = u_xlat8.xxxy * u_xlat9.zwyz;
                u_xlat16 = u_xlat8.yyzz * u_xlat9;
                u_xlat51.x = u_xlat8.z * u_xlat9.y;
                vec3 txVec4 = vec3(u_xlat12.xy,u_xlat5.z);
                u_xlat73 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat12.zw,u_xlat5.z);
                u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec5, 0.0);
                u_xlat8.x = u_xlat8.x * u_xlat15.y;
                u_xlat73 = u_xlat15.x * u_xlat73 + u_xlat8.x;
                vec3 txVec6 = vec3(u_xlat13.xy,u_xlat5.z);
                u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec6, 0.0);
                u_xlat73 = u_xlat15.z * u_xlat8.x + u_xlat73;
                vec3 txVec7 = vec3(u_xlat11.xy,u_xlat5.z);
                u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec7, 0.0);
                u_xlat73 = u_xlat15.w * u_xlat8.x + u_xlat73;
                vec3 txVec8 = vec3(u_xlat14.xy,u_xlat5.z);
                u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec8, 0.0);
                u_xlat73 = u_xlat16.x * u_xlat8.x + u_xlat73;
                vec3 txVec9 = vec3(u_xlat14.zw,u_xlat5.z);
                u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec9, 0.0);
                u_xlat73 = u_xlat16.y * u_xlat8.x + u_xlat73;
                vec3 txVec10 = vec3(u_xlat11.zw,u_xlat5.z);
                u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec10, 0.0);
                u_xlat73 = u_xlat16.z * u_xlat8.x + u_xlat73;
                vec3 txVec11 = vec3(u_xlat10.xy,u_xlat5.z);
                u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec11, 0.0);
                u_xlat73 = u_xlat16.w * u_xlat8.x + u_xlat73;
                vec3 txVec12 = vec3(u_xlat10.zw,u_xlat5.z);
                u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec12, 0.0);
                u_xlat29.x = u_xlat51.x * u_xlat8.x + u_xlat73;
            } else {
                u_xlat51.xy = u_xlat5.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat51.xy = floor(u_xlat51.xy);
                u_xlat8.xy = u_xlat5.xy * _MainLightShadowmapSize.zw + (-u_xlat51.xy);
                u_xlat9 = u_xlat8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat10 = u_xlat9.xxzz * u_xlat9.xxzz;
                u_xlat11.yw = u_xlat10.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat52.xy = u_xlat10.xz * vec2(0.5, 0.5) + (-u_xlat8.xy);
                u_xlat9.xz = (-u_xlat8.xy) + vec2(1.0, 1.0);
                u_xlat10.xy = min(u_xlat8.xy, vec2(0.0, 0.0));
                u_xlat9.xz = (-u_xlat10.xy) * u_xlat10.xy + u_xlat9.xz;
                u_xlat10.xy = max(u_xlat8.xy, vec2(0.0, 0.0));
                u_xlat9.yw = (-u_xlat10.xy) * u_xlat10.xy + u_xlat9.yw;
                u_xlat9 = u_xlat9 + vec4(2.0, 2.0, 2.0, 2.0);
                u_xlat10.z = u_xlat9.y * 0.0816320032;
                u_xlat12.xy = u_xlat52.yx * vec2(0.0816320032, 0.0816320032);
                u_xlat52.xy = u_xlat9.xz * vec2(0.0816320032, 0.0816320032);
                u_xlat12.z = u_xlat9.w * 0.0816320032;
                u_xlat10.x = u_xlat12.y;
                u_xlat10.yw = u_xlat8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat9.xz = u_xlat8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat9.y = u_xlat52.x;
                u_xlat9.w = u_xlat11.y;
                u_xlat10 = u_xlat9 + u_xlat10;
                u_xlat12.yw = u_xlat8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat11.xz = u_xlat8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat11.y = u_xlat52.y;
                u_xlat8 = u_xlat11 + u_xlat12;
                u_xlat9 = u_xlat9 / u_xlat10;
                u_xlat9 = u_xlat9 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat11 = u_xlat11 / u_xlat8;
                u_xlat11 = u_xlat11 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat9 = u_xlat9.wxyz * _MainLightShadowmapSize.xxxx;
                u_xlat11 = u_xlat11.xwyz * _MainLightShadowmapSize.yyyy;
                u_xlat12.xzw = u_xlat9.yzw;
                u_xlat12.y = u_xlat11.x;
                u_xlat13 = u_xlat51.xyxy * _MainLightShadowmapSize.xyxy + u_xlat12.xyzy;
                u_xlat14.xy = u_xlat51.xy * _MainLightShadowmapSize.xy + u_xlat12.wy;
                u_xlat9.y = u_xlat12.y;
                u_xlat12.y = u_xlat11.z;
                u_xlat15 = u_xlat51.xyxy * _MainLightShadowmapSize.xyxy + u_xlat12.xyzy;
                u_xlat58.xy = u_xlat51.xy * _MainLightShadowmapSize.xy + u_xlat12.wy;
                u_xlat9.z = u_xlat12.y;
                u_xlat16 = u_xlat51.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xyxz;
                u_xlat12.y = u_xlat11.w;
                u_xlat17 = u_xlat51.xyxy * _MainLightShadowmapSize.xyxy + u_xlat12.xyzy;
                u_xlat31.xy = u_xlat51.xy * _MainLightShadowmapSize.xy + u_xlat12.wy;
                u_xlat9.w = u_xlat12.y;
                u_xlat18.xy = u_xlat51.xy * _MainLightShadowmapSize.xy + u_xlat9.xw;
                u_xlat11.xzw = u_xlat12.xzw;
                u_xlat12 = u_xlat51.xyxy * _MainLightShadowmapSize.xyxy + u_xlat11.xyzy;
                u_xlat55.xy = u_xlat51.xy * _MainLightShadowmapSize.xy + u_xlat11.wy;
                u_xlat11.x = u_xlat9.x;
                u_xlat51.xy = u_xlat51.xy * _MainLightShadowmapSize.xy + u_xlat11.xy;
                u_xlat19 = u_xlat8.xxxx * u_xlat10;
                u_xlat20 = u_xlat8.yyyy * u_xlat10;
                u_xlat21 = u_xlat8.zzzz * u_xlat10;
                u_xlat8 = u_xlat8.wwww * u_xlat10;
                vec3 txVec13 = vec3(u_xlat13.xy,u_xlat5.z);
                u_xlat9.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat13.zw,u_xlat5.z);
                u_xlat75 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec14, 0.0);
                u_xlat75 = u_xlat75 * u_xlat19.y;
                u_xlat9.x = u_xlat19.x * u_xlat9.x + u_xlat75;
                vec3 txVec15 = vec3(u_xlat14.xy,u_xlat5.z);
                u_xlat75 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec15, 0.0);
                u_xlat9.x = u_xlat19.z * u_xlat75 + u_xlat9.x;
                vec3 txVec16 = vec3(u_xlat16.xy,u_xlat5.z);
                u_xlat75 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec16, 0.0);
                u_xlat9.x = u_xlat19.w * u_xlat75 + u_xlat9.x;
                vec3 txVec17 = vec3(u_xlat15.xy,u_xlat5.z);
                u_xlat75 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec17, 0.0);
                u_xlat9.x = u_xlat20.x * u_xlat75 + u_xlat9.x;
                vec3 txVec18 = vec3(u_xlat15.zw,u_xlat5.z);
                u_xlat75 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec18, 0.0);
                u_xlat9.x = u_xlat20.y * u_xlat75 + u_xlat9.x;
                vec3 txVec19 = vec3(u_xlat58.xy,u_xlat5.z);
                u_xlat75 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec19, 0.0);
                u_xlat9.x = u_xlat20.z * u_xlat75 + u_xlat9.x;
                vec3 txVec20 = vec3(u_xlat16.zw,u_xlat5.z);
                u_xlat75 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec20, 0.0);
                u_xlat9.x = u_xlat20.w * u_xlat75 + u_xlat9.x;
                vec3 txVec21 = vec3(u_xlat17.xy,u_xlat5.z);
                u_xlat75 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec21, 0.0);
                u_xlat9.x = u_xlat21.x * u_xlat75 + u_xlat9.x;
                vec3 txVec22 = vec3(u_xlat17.zw,u_xlat5.z);
                u_xlat75 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec22, 0.0);
                u_xlat9.x = u_xlat21.y * u_xlat75 + u_xlat9.x;
                vec3 txVec23 = vec3(u_xlat31.xy,u_xlat5.z);
                u_xlat31.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec23, 0.0);
                u_xlat9.x = u_xlat21.z * u_xlat31.x + u_xlat9.x;
                vec3 txVec24 = vec3(u_xlat18.xy,u_xlat5.z);
                u_xlat31.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec24, 0.0);
                u_xlat9.x = u_xlat21.w * u_xlat31.x + u_xlat9.x;
                vec3 txVec25 = vec3(u_xlat12.xy,u_xlat5.z);
                u_xlat31.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec25, 0.0);
                u_xlat8.x = u_xlat8.x * u_xlat31.x + u_xlat9.x;
                vec3 txVec26 = vec3(u_xlat12.zw,u_xlat5.z);
                u_xlat9.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec26, 0.0);
                u_xlat8.x = u_xlat8.y * u_xlat9.x + u_xlat8.x;
                vec3 txVec27 = vec3(u_xlat55.xy,u_xlat5.z);
                u_xlat30 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec27, 0.0);
                u_xlat8.x = u_xlat8.z * u_xlat30 + u_xlat8.x;
                vec3 txVec28 = vec3(u_xlat51.xy,u_xlat5.z);
                u_xlat51.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec28, 0.0);
                u_xlat29.x = u_xlat8.w * u_xlat51.x + u_xlat8.x;
            }
        }
    } else {
        vec3 txVec29 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat29.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec29, 0.0);
    }
    u_xlat5.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat5.x = u_xlat29.x * _MainLightShadowParams.x + u_xlat5.x;
    u_xlatb27.x = 0.0>=u_xlat5.z;
    u_xlatb49 = u_xlat5.z>=1.0;
    u_xlatb27.x = u_xlatb49 || u_xlatb27.x;
    u_xlat5.x = (u_xlatb27.x) ? 1.0 : u_xlat5.x;
    u_xlat29.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat27.x = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat27.x = u_xlat27.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
    u_xlat49 = (-u_xlat5.x) + 1.0;
    u_xlat5.x = u_xlat27.x * u_xlat49 + u_xlat5.x;
    u_xlatb27.x = _MainLightCookieTextureFormat!=-1.0;
    if(u_xlatb27.x){
        u_xlat27.xy = vs_TEXCOORD1.yy * _MainLightWorldToLight[1].xy;
        u_xlat27.xy = _MainLightWorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat27.xy;
        u_xlat27.xy = _MainLightWorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat27.xy;
        u_xlat27.xy = u_xlat27.xy + _MainLightWorldToLight[3].xy;
        u_xlat27.xy = u_xlat27.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat8 = texture(sampler2D(_MainLightCookieTexture, sampler_MainLightCookieTexture), u_xlat27.xy, _GlobalMipBias.x);
        u_xlatb27.xy = equal(vec4(vec4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat49 = (u_xlatb27.y) ? u_xlat8.w : u_xlat8.x;
        u_xlat29.xyz = (u_xlatb27.x) ? u_xlat8.xyz : vec3(u_xlat49);
    } else {
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat29.z = float(1.0);
    }
    u_xlat29.xyz = u_xlat29.xyz * _MainLightColor.xyz;
    u_xlat29.xyz = u_xlat7.xxx * u_xlat29.xyz;
    u_xlat27.x = dot((-u_xlat4.xyz), u_xlat3.xyz);
    u_xlat27.x = u_xlat27.x + u_xlat27.x;
    u_xlat8.xyz = u_xlat3.xyz * (-u_xlat27.xxx) + (-u_xlat4.xyz);
    u_xlat27.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat49 = (-u_xlat66) * 0.699999988 + 1.70000005;
    u_xlat66 = u_xlat66 * u_xlat49;
    u_xlat66 = u_xlat66 * 6.0;
    u_xlat8 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat8.xyz, u_xlat66);
    u_xlat66 = u_xlat8.w + -1.0;
    u_xlat66 = unity_SpecCube0_HDR.w * u_xlat66 + 1.0;
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = log2(u_xlat66);
    u_xlat66 = u_xlat66 * unity_SpecCube0_HDR.y;
    u_xlat66 = exp2(u_xlat66);
    u_xlat66 = u_xlat66 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat66);
    u_xlat9.xy = vec2(u_xlat69) * vec2(u_xlat69) + vec2(-1.0, 1.0);
    u_xlat66 = float(1.0) / u_xlat9.y;
    u_xlat31.xyz = (-u_xlat0.xyz) + vec3(u_xlat68);
    u_xlat31.xyz = u_xlat27.xxx * u_xlat31.xyz + u_xlat0.xyz;
    u_xlat31.xyz = vec3(u_xlat66) * u_xlat31.xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat31.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat23.xyz + u_xlat8.xyz;
    u_xlat66 = u_xlat5.x * unity_LightData.z;
    u_xlat68 = dot(u_xlat3.xyz, _MainLightPosition.xyz);
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
    u_xlat66 = u_xlat66 * u_xlat68;
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat29.xyz;
    u_xlat29.xyz = u_xlat4.xyz + _MainLightPosition.xyz;
    u_xlat66 = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-37);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat29.xyz = vec3(u_xlat66) * u_xlat29.xyz;
    u_xlat66 = dot(u_xlat3.xyz, u_xlat29.xyz);
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
    u_xlat68 = dot(_MainLightPosition.xyz, u_xlat29.xyz);
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat9.x + 1.00001001;
    u_xlat68 = u_xlat68 * u_xlat68;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat68 = max(u_xlat68, 0.100000001);
    u_xlat66 = u_xlat66 * u_xlat68;
    u_xlat66 = u_xlat71 * u_xlat66;
    u_xlat66 = u_xlat70 / u_xlat66;
    u_xlat29.xyz = u_xlat0.xyz * vec3(u_xlat66) + u_xlat23.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat29.xyz;
    u_xlat66 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu66 =  uint(int(u_xlat66));
    u_xlatb29.xy = equal(vec4(vec4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat8.x = float(0.0);
    u_xlat8.y = float(0.0);
    u_xlat8.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu66 ; u_xlatu_loop_1++)
    {
        u_xlatu69 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati73 = int(u_xlatu_loop_1 & 3u);
        u_xlat69 = dot(unity_LightIndices[int(u_xlatu69)], uintBitsToFloat(ImmCB_0[u_xlati73]));
        u_xlatu69 =  uint(int(u_xlat69));
        u_xlat31.xyz = (-vs_TEXCOORD1.xyz) * _AdditionalLightsPosition[int(u_xlatu69)].www + _AdditionalLightsPosition[int(u_xlatu69)].xyz;
        u_xlat73 = dot(u_xlat31.xyz, u_xlat31.xyz);
        u_xlat73 = max(u_xlat73, 6.10351562e-05);
        u_xlat74 = inversesqrt(u_xlat73);
        u_xlat10.xyz = vec3(u_xlat74) * u_xlat31.xyz;
        u_xlat76 = float(1.0) / float(u_xlat73);
        u_xlat73 = u_xlat73 * _AdditionalLightsAttenuation[int(u_xlatu69)].x;
        u_xlat73 = (-u_xlat73) * u_xlat73 + 1.0;
        u_xlat73 = max(u_xlat73, 0.0);
        u_xlat73 = u_xlat73 * u_xlat73;
        u_xlat73 = u_xlat73 * u_xlat76;
        u_xlat76 = dot(_AdditionalLightsSpotDir[int(u_xlatu69)].xyz, u_xlat10.xyz);
        u_xlat76 = u_xlat76 * _AdditionalLightsAttenuation[int(u_xlatu69)].z + _AdditionalLightsAttenuation[int(u_xlatu69)].w;
        u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
        u_xlat76 = u_xlat76 * u_xlat76;
        u_xlat73 = u_xlat73 * u_xlat76;
        u_xlatu76 = u_xlatu69 >> (5u & uint(0x1F));
        u_xlati11 = 1 << (int(u_xlatu69) & int(0x1F));
        u_xlati76 = int(uint(u_xlati11) & floatBitsToUint(_AdditionalLightsCookieEnableBits[int(u_xlatu76)]));
        if(u_xlati76 != 0) {
            u_xlati76 = int(_AdditionalLightsLightTypes[int(u_xlatu69)]);
            u_xlati11 = (u_xlati76 != 0) ? 0 : 1;
            u_xlati33 = int(u_xlatu69) << (2 & int(0x1F));
            if(u_xlati11 != 0) {
                u_xlat11.xzw = vs_TEXCOORD1.yyy * _AdditionalLightsWorldToLights[(u_xlati33 + 1) / 4][(u_xlati33 + 1) % 4].xyw;
                u_xlat11.xzw = _AdditionalLightsWorldToLights[u_xlati33 / 4][u_xlati33 % 4].xyw * vs_TEXCOORD1.xxx + u_xlat11.xzw;
                u_xlat11.xzw = _AdditionalLightsWorldToLights[(u_xlati33 + 2) / 4][(u_xlati33 + 2) % 4].xyw * vs_TEXCOORD1.zzz + u_xlat11.xzw;
                u_xlat11.xzw = u_xlat11.xzw + _AdditionalLightsWorldToLights[(u_xlati33 + 3) / 4][(u_xlati33 + 3) % 4].xyw;
                u_xlat11.xz = u_xlat11.xz / u_xlat11.ww;
                u_xlat11.xz = u_xlat11.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                u_xlat11.xz = clamp(u_xlat11.xz, 0.0, 1.0);
                u_xlat11.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu69)].xy * u_xlat11.xz + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu69)].zw;
            } else {
                u_xlatb76 = u_xlati76==1;
                u_xlati76 = u_xlatb76 ? 1 : int(0);
                if(u_xlati76 != 0) {
                    u_xlat12.xy = vs_TEXCOORD1.yy * _AdditionalLightsWorldToLights[(u_xlati33 + 1) / 4][(u_xlati33 + 1) % 4].xy;
                    u_xlat12.xy = _AdditionalLightsWorldToLights[u_xlati33 / 4][u_xlati33 % 4].xy * vs_TEXCOORD1.xx + u_xlat12.xy;
                    u_xlat12.xy = _AdditionalLightsWorldToLights[(u_xlati33 + 2) / 4][(u_xlati33 + 2) % 4].xy * vs_TEXCOORD1.zz + u_xlat12.xy;
                    u_xlat12.xy = u_xlat12.xy + _AdditionalLightsWorldToLights[(u_xlati33 + 3) / 4][(u_xlati33 + 3) % 4].xy;
                    u_xlat12.xy = u_xlat12.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat12.xy = fract(u_xlat12.xy);
                    u_xlat11.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu69)].xy * u_xlat12.xy + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu69)].zw;
                } else {
                    u_xlat12 = vs_TEXCOORD1.yyyy * _AdditionalLightsWorldToLights[(u_xlati33 + 1) / 4][(u_xlati33 + 1) % 4];
                    u_xlat12 = _AdditionalLightsWorldToLights[u_xlati33 / 4][u_xlati33 % 4] * vs_TEXCOORD1.xxxx + u_xlat12;
                    u_xlat12 = _AdditionalLightsWorldToLights[(u_xlati33 + 2) / 4][(u_xlati33 + 2) % 4] * vs_TEXCOORD1.zzzz + u_xlat12;
                    u_xlat12 = u_xlat12 + _AdditionalLightsWorldToLights[(u_xlati33 + 3) / 4][(u_xlati33 + 3) % 4];
                    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
                    u_xlat76 = dot(u_xlat12.xyz, u_xlat12.xyz);
                    u_xlat76 = inversesqrt(u_xlat76);
                    u_xlat12.xyz = vec3(u_xlat76) * u_xlat12.xyz;
                    u_xlat76 = dot(abs(u_xlat12.xyz), vec3(1.0, 1.0, 1.0));
                    u_xlat76 = max(u_xlat76, 9.99999997e-07);
                    u_xlat76 = float(1.0) / float(u_xlat76);
                    u_xlat13.xyz = vec3(u_xlat76) * u_xlat12.zxy;
                    u_xlat13.x = (-u_xlat13.x);
                    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
                    u_xlatb33.xz = greaterThanEqual(u_xlat13.yyzz, vec4(0.0, 0.0, 0.0, 0.0)).xz;
                    u_xlat33.x = (u_xlatb33.x) ? u_xlat13.x : (-u_xlat13.x);
                    u_xlat33.z = (u_xlatb33.z) ? u_xlat13.x : (-u_xlat13.x);
                    u_xlat33.xz = u_xlat12.xy * vec2(u_xlat76) + u_xlat33.xz;
                    u_xlat33.xz = u_xlat33.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
                    u_xlat33.xz = clamp(u_xlat33.xz, 0.0, 1.0);
                    u_xlat11.xz = _AdditionalLightsCookieAtlasUVRects[int(u_xlatu69)].xy * u_xlat33.xz + _AdditionalLightsCookieAtlasUVRects[int(u_xlatu69)].zw;
                }
            }
            u_xlat11 = texture(sampler2D(_AdditionalLightsCookieAtlasTexture, sampler_AdditionalLightsCookieAtlasTexture), u_xlat11.xz, _GlobalMipBias.x);
            u_xlat76 = (u_xlatb29.y) ? u_xlat11.w : u_xlat11.x;
            u_xlat11.xyz = (u_xlatb29.x) ? u_xlat11.xyz : vec3(u_xlat76);
        } else {
            u_xlat11.x = float(1.0);
            u_xlat11.y = float(1.0);
            u_xlat11.z = float(1.0);
        }
        u_xlat11.xyz = u_xlat11.xyz * _AdditionalLightsColor[int(u_xlatu69)].xyz;
        u_xlat11.xyz = u_xlat7.xxx * u_xlat11.xyz;
        u_xlat69 = dot(u_xlat3.xyz, u_xlat10.xyz);
        u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
        u_xlat69 = u_xlat69 * u_xlat73;
        u_xlat11.xyz = vec3(u_xlat69) * u_xlat11.xyz;
        u_xlat31.xyz = u_xlat31.xyz * vec3(u_xlat74) + u_xlat4.xyz;
        u_xlat69 = dot(u_xlat31.xyz, u_xlat31.xyz);
        u_xlat69 = max(u_xlat69, 1.17549435e-37);
        u_xlat69 = inversesqrt(u_xlat69);
        u_xlat31.xyz = vec3(u_xlat69) * u_xlat31.xyz;
        u_xlat69 = dot(u_xlat3.xyz, u_xlat31.xyz);
        u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
        u_xlat73 = dot(u_xlat10.xyz, u_xlat31.xyz);
        u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
        u_xlat69 = u_xlat69 * u_xlat69;
        u_xlat69 = u_xlat69 * u_xlat9.x + 1.00001001;
        u_xlat73 = u_xlat73 * u_xlat73;
        u_xlat69 = u_xlat69 * u_xlat69;
        u_xlat73 = max(u_xlat73, 0.100000001);
        u_xlat69 = u_xlat69 * u_xlat73;
        u_xlat69 = u_xlat71 * u_xlat69;
        u_xlat69 = u_xlat70 / u_xlat69;
        u_xlat31.xyz = u_xlat0.xyz * vec3(u_xlat69) + u_xlat23.xyz;
        u_xlat8.xyz = u_xlat31.xyz * u_xlat11.xyz + u_xlat8.xyz;
    }
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat72) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat8.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    u_xlatb0 = _Surface==1.0;
    SV_Target0.w = (u_xlatb0) ? u_xlat1.x : 1.0;
    return;
}

