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
layout(set = 1, binding = 3, std140) uniform _Terrain {
	float _NormalScale0;
	float _NormalScale1;
	float _NormalScale2;
	float _NormalScale3;
	float _Metallic0;
	float _Metallic1;
	float _Metallic2;
	float _Metallic3;
	float _Smoothness0;
	float _Smoothness1;
	float _Smoothness2;
	float _Smoothness3;
	vec4 _DiffuseRemapScale0;
	vec4 _DiffuseRemapScale1;
	vec4 _DiffuseRemapScale2;
	vec4 _DiffuseRemapScale3;
	vec4 _MaskMapRemapOffset0;
	vec4 _MaskMapRemapOffset1;
	vec4 _MaskMapRemapOffset2;
	vec4 _MaskMapRemapOffset3;
	vec4 _MaskMapRemapScale0;
	vec4 _MaskMapRemapScale1;
	vec4 _MaskMapRemapScale2;
	vec4 _MaskMapRemapScale3;
	vec4 _Control_ST;
	vec4 _Control_TexelSize;
	float _DiffuseHasAlpha0;
	float _DiffuseHasAlpha1;
	float _DiffuseHasAlpha2;
	float _DiffuseHasAlpha3;
	float _LayerHasMask0;
	float _LayerHasMask1;
	float _LayerHasMask2;
	float _LayerHasMask3;
	vec4 _Splat0_ST;
	vec4 _Splat1_ST;
	vec4 _Splat2_ST;
	vec4 _Splat3_ST;
	float _HeightTransition;
	float _NumLayersCount;
	vec4 _TerrainHeightmapRecipSize;
	vec4 _TerrainHeightmapScale;
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
layout(set = 0, binding = 1) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 2) uniform mediump texture2D unity_LightmapInd;
layout(set = 0, binding = 3) uniform mediump texture2D _Control;
layout(set = 0, binding = 4) uniform mediump texture2D _Splat0;
layout(set = 0, binding = 5) uniform mediump texture2D _Splat1;
layout(set = 0, binding = 6) uniform mediump texture2D _Splat2;
layout(set = 0, binding = 7) uniform mediump texture2D _Splat3;
layout(set = 0, binding = 8) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 9) uniform mediump texture2D _MainLightShadowmapTexture;
layout(location = 0) in highp vec4 vs_TEXCOORD0;
layout(location = 1) in highp vec4 vs_TEXCOORD1;
layout(location = 2) in highp vec4 vs_TEXCOORD2;
layout(location = 3) in highp vec3 vs_TEXCOORD3;
layout(location = 4) in highp vec3 vs_TEXCOORD7;
layout(location = 5) in highp vec4 vs_TEXCOORD8;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 10) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 11) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 12) uniform mediump  sampler sampler_Control;
layout(set = 0, binding = 13) uniform mediump  sampler sampler_Splat0;
layout(set = 0, binding = 14) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 15) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
void main()
{
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
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
vec2 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
float u_xlat21;
vec3 u_xlat22;
float u_xlat25;
vec2 u_xlat29;
float u_xlat42;
uint u_xlatu42;
vec2 u_xlat46;
bool u_xlatb46;
vec2 u_xlat49;
vec2 u_xlat51;
vec2 u_xlat52;
vec2 u_xlat55;
float u_xlat63;
float u_xlat64;
bool u_xlatb64;
float u_xlat65;
uint u_xlatu65;
bool u_xlatb65;
float u_xlat66;
float u_xlat67;
bool u_xlatb67;
float u_xlat68;
int u_xlati68;
uint u_xlatu68;
bool u_xlatb68;
float u_xlat69;
int u_xlati69;
float u_xlat70;
float u_xlat71;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xyz = _MaskMapRemapScale0.xyw * vec3(0.5, 0.5, 0.5) + _MaskMapRemapOffset0.xyw;
    u_xlat1.xyz = _MaskMapRemapScale1.xyw * vec3(0.5, 0.5, 0.5) + _MaskMapRemapOffset1.xyw;
    u_xlat2.xyz = _MaskMapRemapScale2.xyw * vec3(0.5, 0.5, 0.5) + _MaskMapRemapOffset2.xyw;
    u_xlat3.xyw = _MaskMapRemapScale3.xwy * vec3(0.5, 0.5, 0.5) + _MaskMapRemapOffset3.xwy;
    u_xlat4.xy = _Control_TexelSize.zw + vec2(-1.0, -1.0);
    u_xlat4.xy = vs_TEXCOORD0.xy * u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = u_xlat4.xy * _Control_TexelSize.xy;
    u_xlat4 = texture(sampler2D(_Control, sampler_Control), u_xlat4.xy, _GlobalMipBias.x);
    u_xlat63 = dot(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat5 = texture(sampler2D(_Splat0, sampler_Splat0), vs_TEXCOORD1.xy, _GlobalMipBias.x);
    u_xlat6 = texture(sampler2D(_Splat1, sampler_Splat0), vs_TEXCOORD1.zw, _GlobalMipBias.x);
    u_xlat7 = texture(sampler2D(_Splat2, sampler_Splat0), vs_TEXCOORD2.xy, _GlobalMipBias.x);
    u_xlat8 = texture(sampler2D(_Splat3, sampler_Splat0), vs_TEXCOORD2.zw, _GlobalMipBias.x);
    u_xlat9.x = u_xlat5.w;
    u_xlat9.y = u_xlat6.w;
    u_xlat9.z = u_xlat7.w;
    u_xlat9.w = u_xlat8.w;
    u_xlat10 = u_xlat9 * vec4(_Smoothness0, _Smoothness1, _Smoothness2, _Smoothness3);
    u_xlatb64 = 4.0>=_NumLayersCount;
    u_xlat11 = (-u_xlat4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11 = u_xlat9 + (-u_xlat11);
    u_xlat11 = u_xlat11 * vec4(20.0, 20.0, 20.0, 20.0);
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat11 = u_xlat4 * vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005) + u_xlat11;
    u_xlat12 = u_xlat4 + (-u_xlat11);
    u_xlat13.x = u_xlat12.x * _DiffuseRemapScale0.w;
    u_xlat13.y = u_xlat12.y * _DiffuseRemapScale1.w;
    u_xlat13.z = u_xlat12.z * _DiffuseRemapScale2.w;
    u_xlat13.w = u_xlat12.w * _DiffuseRemapScale3.w;
    u_xlat11 = u_xlat11 + u_xlat13;
    u_xlat4 = (bool(u_xlatb64)) ? u_xlat11 : u_xlat4;
    u_xlat64 = dot(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlatb65 = 0.00499999989>=u_xlat64;
    if(((int(u_xlatb65) * int(0xffffffffu)))!=0){discard;}
    u_xlat64 = u_xlat64 + 6.10351562e-05;
    u_xlat4 = u_xlat4 / vec4(u_xlat64);
    u_xlat11.xyz = u_xlat4.xxx * _DiffuseRemapScale0.xyz;
    u_xlat12.xyz = u_xlat4.yyy * _DiffuseRemapScale1.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat12.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat11.xyz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat4.zzz * _DiffuseRemapScale2.xyz;
    u_xlat5.xyz = u_xlat7.xyz * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat6.xyz = u_xlat4.www * _DiffuseRemapScale3.xyz;
    u_xlat5.xyz = u_xlat8.xyz * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat6.x = _MaskMapRemapScale0.y;
    u_xlat6.y = _MaskMapRemapScale1.y;
    u_xlat6.z = _MaskMapRemapScale2.y;
    u_xlat6.w = _MaskMapRemapScale3.y;
    u_xlat7.x = _MaskMapRemapOffset0.y;
    u_xlat7.y = _MaskMapRemapOffset1.y;
    u_xlat7.z = _MaskMapRemapOffset2.y;
    u_xlat7.w = _MaskMapRemapOffset3.y;
    u_xlat6 = u_xlat6 + u_xlat7;
    u_xlat7.x = u_xlat0.z;
    u_xlat7.y = u_xlat1.z;
    u_xlat7.z = u_xlat2.z;
    u_xlat7.w = u_xlat3.y;
    u_xlat7 = (-u_xlat9) * vec4(_Smoothness0, _Smoothness1, _Smoothness2, _Smoothness3) + u_xlat7;
    u_xlat7 = vec4(_LayerHasMask0, _LayerHasMask1, _LayerHasMask2, _LayerHasMask3) * u_xlat7 + u_xlat10;
    u_xlat42 = dot(u_xlat4, u_xlat7);
    u_xlat7.x = u_xlat0.x;
    u_xlat7.y = u_xlat1.x;
    u_xlat7.z = u_xlat2.x;
    u_xlat7.w = u_xlat3.x;
    u_xlat7 = u_xlat7 + (-vec4(_Metallic0, _Metallic1, _Metallic2, _Metallic3));
    u_xlat7 = vec4(_LayerHasMask0, _LayerHasMask1, _LayerHasMask2, _LayerHasMask3) * u_xlat7 + vec4(_Metallic0, _Metallic1, _Metallic2, _Metallic3);
    u_xlat0.x = dot(u_xlat4, u_xlat7);
    u_xlat3.x = u_xlat0.y;
    u_xlat3.y = u_xlat1.y;
    u_xlat3.z = u_xlat2.y;
    u_xlat1 = (-u_xlat6) + u_xlat3;
    u_xlat1 = vec4(_LayerHasMask0, _LayerHasMask1, _LayerHasMask2, _LayerHasMask3) * u_xlat1 + u_xlat6;
    u_xlat21 = dot(u_xlat4, u_xlat1);
    u_xlatb1 = unity_OrthoParams.w==0.0;
    u_xlat22.xyz = (-vs_TEXCOORD7.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat2.xxx;
    u_xlat2.x = (u_xlatb1) ? u_xlat22.x : unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb1) ? u_xlat22.y : unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb1) ? u_xlat22.z : unity_MatrixV[2].z;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat3 = texture(sampler2D(unity_LightmapInd, samplerunity_Lightmap), vs_TEXCOORD0.zw, _GlobalMipBias.x);
    u_xlat4.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_TEXCOORD0.zw, _GlobalMipBias.x).xyz;
    u_xlat3.xyz = u_xlat3.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat64 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat64 = u_xlat64 + 0.5;
    u_xlat3.xyz = vec3(u_xlat64) * u_xlat4.xyz;
    u_xlat64 = max(u_xlat3.w, 9.99999975e-05);
    u_xlat3.xyz = u_xlat3.xyz / vec3(u_xlat64);
    u_xlat4.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat4.xy = u_xlat4.xy * hlslcc_FragCoord.xy;
    u_xlat64 = u_xlat4.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat4.z = (-u_xlat64) + 1.0;
    u_xlat64 = (-u_xlat0.x) * 0.959999979 + 0.959999979;
    u_xlat65 = u_xlat42 + (-u_xlat64);
    u_xlat6.xyz = vec3(u_xlat64) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = (-u_xlat42) + 1.0;
    u_xlat42 = u_xlat0.x * u_xlat0.x;
    u_xlat42 = max(u_xlat42, 0.0078125);
    u_xlat64 = u_xlat42 * u_xlat42;
    u_xlat65 = u_xlat65 + 1.0;
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
    u_xlat66 = u_xlat42 * 4.0 + 2.0;
    u_xlat4.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat4.xz, _GlobalMipBias.x).x;
    u_xlat25 = u_xlat4.x + -1.0;
    u_xlat25 = _AmbientOcclusionParam.w * u_xlat25 + 1.0;
    u_xlat21 = min(u_xlat21, u_xlat4.x);
    u_xlatb4 = 0.0<_MainLightShadowParams.y;
    if(u_xlatb4){
        u_xlatb4 = _MainLightShadowParams.y==1.0;
        if(u_xlatb4){
            u_xlat7 = vs_TEXCOORD8.xyxy + _MainLightShadowOffset0;
            vec3 txVec0 = vec3(u_xlat7.xy,vs_TEXCOORD8.z);
            u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
            vec3 txVec1 = vec3(u_xlat7.zw,vs_TEXCOORD8.z);
            u_xlat8.y = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
            u_xlat7 = vs_TEXCOORD8.xyxy + _MainLightShadowOffset1;
            vec3 txVec2 = vec3(u_xlat7.xy,vs_TEXCOORD8.z);
            u_xlat8.z = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec2, 0.0);
            vec3 txVec3 = vec3(u_xlat7.zw,vs_TEXCOORD8.z);
            u_xlat8.w = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec3, 0.0);
            u_xlat4.x = dot(u_xlat8, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb46 = _MainLightShadowParams.y==2.0;
            if(u_xlatb46){
                u_xlat46.xy = vs_TEXCOORD8.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat46.xy = floor(u_xlat46.xy);
                u_xlat7.xy = vs_TEXCOORD8.xy * _MainLightShadowmapSize.zw + (-u_xlat46.xy);
                u_xlat8 = u_xlat7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat9 = u_xlat8.xxzz * u_xlat8.xxzz;
                u_xlat49.xy = u_xlat9.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat8.xz = u_xlat9.xz * vec2(0.5, 0.5) + (-u_xlat7.xy);
                u_xlat9.xy = (-u_xlat7.xy) + vec2(1.0, 1.0);
                u_xlat51.xy = min(u_xlat7.xy, vec2(0.0, 0.0));
                u_xlat51.xy = (-u_xlat51.xy) * u_xlat51.xy + u_xlat9.xy;
                u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
                u_xlat7.xy = (-u_xlat7.xy) * u_xlat7.xy + u_xlat8.yw;
                u_xlat51.xy = u_xlat51.xy + vec2(1.0, 1.0);
                u_xlat7.xy = u_xlat7.xy + vec2(1.0, 1.0);
                u_xlat10.xy = u_xlat8.xz * vec2(0.159999996, 0.159999996);
                u_xlat11.xy = u_xlat9.xy * vec2(0.159999996, 0.159999996);
                u_xlat9.xy = u_xlat51.xy * vec2(0.159999996, 0.159999996);
                u_xlat12.xy = u_xlat7.xy * vec2(0.159999996, 0.159999996);
                u_xlat7.xy = u_xlat8.yw * vec2(0.159999996, 0.159999996);
                u_xlat10.z = u_xlat9.x;
                u_xlat10.w = u_xlat7.x;
                u_xlat11.z = u_xlat12.x;
                u_xlat11.w = u_xlat49.x;
                u_xlat8 = u_xlat10.zwxz + u_xlat11.zwxz;
                u_xlat9.z = u_xlat10.y;
                u_xlat9.w = u_xlat7.y;
                u_xlat12.z = u_xlat11.y;
                u_xlat12.w = u_xlat49.y;
                u_xlat7.xyz = u_xlat9.zyw + u_xlat12.zyw;
                u_xlat9.xyz = u_xlat11.xzw / u_xlat8.zwy;
                u_xlat9.xyz = u_xlat9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat10.xyz = u_xlat12.zyw / u_xlat7.xyz;
                u_xlat10.xyz = u_xlat10.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat9.xyz = u_xlat9.yxz * _MainLightShadowmapSize.xxx;
                u_xlat10.xyz = u_xlat10.xyz * _MainLightShadowmapSize.yyy;
                u_xlat9.w = u_xlat10.x;
                u_xlat11 = u_xlat46.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.ywxw;
                u_xlat12.xy = u_xlat46.xy * _MainLightShadowmapSize.xy + u_xlat9.zw;
                u_xlat10.w = u_xlat9.y;
                u_xlat9.yw = u_xlat10.yz;
                u_xlat13 = u_xlat46.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xyzy;
                u_xlat10 = u_xlat46.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.wywz;
                u_xlat9 = u_xlat46.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xwzw;
                u_xlat14 = u_xlat7.xxxy * u_xlat8.zwyz;
                u_xlat15 = u_xlat7.yyzz * u_xlat8;
                u_xlat46.x = u_xlat7.z * u_xlat8.y;
                vec3 txVec4 = vec3(u_xlat11.xy,vs_TEXCOORD8.z);
                u_xlat67 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat11.zw,vs_TEXCOORD8.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec5, 0.0);
                u_xlat68 = u_xlat68 * u_xlat14.y;
                u_xlat67 = u_xlat14.x * u_xlat67 + u_xlat68;
                vec3 txVec6 = vec3(u_xlat12.xy,vs_TEXCOORD8.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec6, 0.0);
                u_xlat67 = u_xlat14.z * u_xlat68 + u_xlat67;
                vec3 txVec7 = vec3(u_xlat10.xy,vs_TEXCOORD8.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec7, 0.0);
                u_xlat67 = u_xlat14.w * u_xlat68 + u_xlat67;
                vec3 txVec8 = vec3(u_xlat13.xy,vs_TEXCOORD8.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec8, 0.0);
                u_xlat67 = u_xlat15.x * u_xlat68 + u_xlat67;
                vec3 txVec9 = vec3(u_xlat13.zw,vs_TEXCOORD8.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec9, 0.0);
                u_xlat67 = u_xlat15.y * u_xlat68 + u_xlat67;
                vec3 txVec10 = vec3(u_xlat10.zw,vs_TEXCOORD8.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec10, 0.0);
                u_xlat67 = u_xlat15.z * u_xlat68 + u_xlat67;
                vec3 txVec11 = vec3(u_xlat9.xy,vs_TEXCOORD8.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec11, 0.0);
                u_xlat67 = u_xlat15.w * u_xlat68 + u_xlat67;
                vec3 txVec12 = vec3(u_xlat9.zw,vs_TEXCOORD8.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec12, 0.0);
                u_xlat4.x = u_xlat46.x * u_xlat68 + u_xlat67;
            } else {
                u_xlat46.xy = vs_TEXCOORD8.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat46.xy = floor(u_xlat46.xy);
                u_xlat7.xy = vs_TEXCOORD8.xy * _MainLightShadowmapSize.zw + (-u_xlat46.xy);
                u_xlat8 = u_xlat7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat9 = u_xlat8.xxzz * u_xlat8.xxzz;
                u_xlat10.yw = u_xlat9.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat49.xy = u_xlat9.xz * vec2(0.5, 0.5) + (-u_xlat7.xy);
                u_xlat8.xz = (-u_xlat7.xy) + vec2(1.0, 1.0);
                u_xlat9.xy = min(u_xlat7.xy, vec2(0.0, 0.0));
                u_xlat8.xz = (-u_xlat9.xy) * u_xlat9.xy + u_xlat8.xz;
                u_xlat9.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
                u_xlat8.yw = (-u_xlat9.xy) * u_xlat9.xy + u_xlat8.yw;
                u_xlat8 = u_xlat8 + vec4(2.0, 2.0, 2.0, 2.0);
                u_xlat9.z = u_xlat8.y * 0.0816320032;
                u_xlat11.xy = u_xlat49.yx * vec2(0.0816320032, 0.0816320032);
                u_xlat49.xy = u_xlat8.xz * vec2(0.0816320032, 0.0816320032);
                u_xlat11.z = u_xlat8.w * 0.0816320032;
                u_xlat9.x = u_xlat11.y;
                u_xlat9.yw = u_xlat7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat8.xz = u_xlat7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat8.y = u_xlat49.x;
                u_xlat8.w = u_xlat10.y;
                u_xlat9 = u_xlat8 + u_xlat9;
                u_xlat11.yw = u_xlat7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat10.xz = u_xlat7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat10.y = u_xlat49.y;
                u_xlat7 = u_xlat10 + u_xlat11;
                u_xlat8 = u_xlat8 / u_xlat9;
                u_xlat8 = u_xlat8 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat10 = u_xlat10 / u_xlat7;
                u_xlat10 = u_xlat10 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat8 = u_xlat8.wxyz * _MainLightShadowmapSize.xxxx;
                u_xlat10 = u_xlat10.xwyz * _MainLightShadowmapSize.yyyy;
                u_xlat11.xzw = u_xlat8.yzw;
                u_xlat11.y = u_xlat10.x;
                u_xlat12 = u_xlat46.xyxy * _MainLightShadowmapSize.xyxy + u_xlat11.xyzy;
                u_xlat13.xy = u_xlat46.xy * _MainLightShadowmapSize.xy + u_xlat11.wy;
                u_xlat8.y = u_xlat11.y;
                u_xlat11.y = u_xlat10.z;
                u_xlat14 = u_xlat46.xyxy * _MainLightShadowmapSize.xyxy + u_xlat11.xyzy;
                u_xlat55.xy = u_xlat46.xy * _MainLightShadowmapSize.xy + u_xlat11.wy;
                u_xlat8.z = u_xlat11.y;
                u_xlat15 = u_xlat46.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyxz;
                u_xlat11.y = u_xlat10.w;
                u_xlat16 = u_xlat46.xyxy * _MainLightShadowmapSize.xyxy + u_xlat11.xyzy;
                u_xlat29.xy = u_xlat46.xy * _MainLightShadowmapSize.xy + u_xlat11.wy;
                u_xlat8.w = u_xlat11.y;
                u_xlat17.xy = u_xlat46.xy * _MainLightShadowmapSize.xy + u_xlat8.xw;
                u_xlat10.xzw = u_xlat11.xzw;
                u_xlat11 = u_xlat46.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.xyzy;
                u_xlat52.xy = u_xlat46.xy * _MainLightShadowmapSize.xy + u_xlat10.wy;
                u_xlat10.x = u_xlat8.x;
                u_xlat46.xy = u_xlat46.xy * _MainLightShadowmapSize.xy + u_xlat10.xy;
                u_xlat18 = u_xlat7.xxxx * u_xlat9;
                u_xlat19 = u_xlat7.yyyy * u_xlat9;
                u_xlat20 = u_xlat7.zzzz * u_xlat9;
                u_xlat7 = u_xlat7.wwww * u_xlat9;
                vec3 txVec13 = vec3(u_xlat12.xy,vs_TEXCOORD8.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat12.zw,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec14, 0.0);
                u_xlat69 = u_xlat69 * u_xlat18.y;
                u_xlat68 = u_xlat18.x * u_xlat68 + u_xlat69;
                vec3 txVec15 = vec3(u_xlat13.xy,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec15, 0.0);
                u_xlat68 = u_xlat18.z * u_xlat69 + u_xlat68;
                vec3 txVec16 = vec3(u_xlat15.xy,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec16, 0.0);
                u_xlat68 = u_xlat18.w * u_xlat69 + u_xlat68;
                vec3 txVec17 = vec3(u_xlat14.xy,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec17, 0.0);
                u_xlat68 = u_xlat19.x * u_xlat69 + u_xlat68;
                vec3 txVec18 = vec3(u_xlat14.zw,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec18, 0.0);
                u_xlat68 = u_xlat19.y * u_xlat69 + u_xlat68;
                vec3 txVec19 = vec3(u_xlat55.xy,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec19, 0.0);
                u_xlat68 = u_xlat19.z * u_xlat69 + u_xlat68;
                vec3 txVec20 = vec3(u_xlat15.zw,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec20, 0.0);
                u_xlat68 = u_xlat19.w * u_xlat69 + u_xlat68;
                vec3 txVec21 = vec3(u_xlat16.xy,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec21, 0.0);
                u_xlat68 = u_xlat20.x * u_xlat69 + u_xlat68;
                vec3 txVec22 = vec3(u_xlat16.zw,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec22, 0.0);
                u_xlat68 = u_xlat20.y * u_xlat69 + u_xlat68;
                vec3 txVec23 = vec3(u_xlat29.xy,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec23, 0.0);
                u_xlat68 = u_xlat20.z * u_xlat69 + u_xlat68;
                vec3 txVec24 = vec3(u_xlat17.xy,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec24, 0.0);
                u_xlat68 = u_xlat20.w * u_xlat69 + u_xlat68;
                vec3 txVec25 = vec3(u_xlat11.xy,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec25, 0.0);
                u_xlat68 = u_xlat7.x * u_xlat69 + u_xlat68;
                vec3 txVec26 = vec3(u_xlat11.zw,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec26, 0.0);
                u_xlat68 = u_xlat7.y * u_xlat69 + u_xlat68;
                vec3 txVec27 = vec3(u_xlat52.xy,vs_TEXCOORD8.z);
                u_xlat69 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec27, 0.0);
                u_xlat68 = u_xlat7.z * u_xlat69 + u_xlat68;
                vec3 txVec28 = vec3(u_xlat46.xy,vs_TEXCOORD8.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec28, 0.0);
                u_xlat4.x = u_xlat7.w * u_xlat46.x + u_xlat68;
            }
        }
    } else {
        vec3 txVec29 = vec3(vs_TEXCOORD8.xy,vs_TEXCOORD8.z);
        u_xlat4.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec29, 0.0);
    }
    u_xlat46.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat4.x = u_xlat4.x * _MainLightShadowParams.x + u_xlat46.x;
    u_xlatb46 = 0.0>=vs_TEXCOORD8.z;
    u_xlatb67 = vs_TEXCOORD8.z>=1.0;
    u_xlatb46 = u_xlatb67 || u_xlatb46;
    u_xlat4.x = (u_xlatb46) ? 1.0 : u_xlat4.x;
    u_xlat7.xyz = vs_TEXCOORD7.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat46.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat46.x = u_xlat46.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat46.x = clamp(u_xlat46.x, 0.0, 1.0);
    u_xlat67 = (-u_xlat4.x) + 1.0;
    u_xlat4.x = u_xlat46.x * u_xlat67 + u_xlat4.x;
    u_xlat7.xyz = vec3(u_xlat25) * _MainLightColor.xyz;
    u_xlat46.x = dot((-u_xlat2.xyz), u_xlat1.xyz);
    u_xlat46.x = u_xlat46.x + u_xlat46.x;
    u_xlat8.xyz = u_xlat1.xyz * (-u_xlat46.xxx) + (-u_xlat2.xyz);
    u_xlat46.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat46.x = clamp(u_xlat46.x, 0.0, 1.0);
    u_xlat46.x = (-u_xlat46.x) + 1.0;
    u_xlat46.x = u_xlat46.x * u_xlat46.x;
    u_xlat46.x = u_xlat46.x * u_xlat46.x;
    u_xlat67 = (-u_xlat0.x) * 0.699999988 + 1.70000005;
    u_xlat0.x = u_xlat0.x * u_xlat67;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat8 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat8.xyz, u_xlat0.x);
    u_xlat0.x = u_xlat8.w + -1.0;
    u_xlat0.x = unity_SpecCube0_HDR.w * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat0.xz = vec2(u_xlat42) * vec2(u_xlat42) + vec2(-1.0, 1.0);
    u_xlat42 = float(1.0) / u_xlat0.z;
    u_xlat9.xyz = (-u_xlat5.xyz) + vec3(u_xlat65);
    u_xlat9.xyz = u_xlat46.xxx * u_xlat9.xyz + u_xlat5.xyz;
    u_xlat9.xyz = vec3(u_xlat42) * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz + u_xlat8.xyz;
    u_xlat42 = u_xlat4.x * unity_LightData.z;
    u_xlat65 = dot(u_xlat1.xyz, _MainLightPosition.xyz);
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
    u_xlat42 = u_xlat42 * u_xlat65;
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat2.xyz + _MainLightPosition.xyz;
    u_xlat42 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat42 = max(u_xlat42, 1.17549435e-37);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat42 = dot(u_xlat1.xyz, u_xlat7.xyz);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat65 = dot(_MainLightPosition.xyz, u_xlat7.xyz);
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat42 * u_xlat0.x + 1.00001001;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat65 = max(u_xlat65, 0.100000001);
    u_xlat42 = u_xlat42 * u_xlat65;
    u_xlat42 = u_xlat66 * u_xlat42;
    u_xlat42 = u_xlat64 / u_xlat42;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat42) + u_xlat6.xyz;
    u_xlat4.xzw = u_xlat4.xzw * u_xlat7.xyz;
    u_xlat42 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu42 =  uint(int(u_xlat42));
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu42 ; u_xlatu_loop_1++)
    {
        u_xlatu68 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati69 = int(u_xlatu_loop_1 & 3u);
        u_xlat68 = dot(unity_LightIndices[int(u_xlatu68)], uintBitsToFloat(ImmCB_0[u_xlati69]));
        u_xlati68 = int(u_xlat68);
        u_xlat8.xyz = (-vs_TEXCOORD7.xyz) * _AdditionalLightsPosition[u_xlati68].www + _AdditionalLightsPosition[u_xlati68].xyz;
        u_xlat69 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat69 = max(u_xlat69, 6.10351562e-05);
        u_xlat70 = inversesqrt(u_xlat69);
        u_xlat9.xyz = vec3(u_xlat70) * u_xlat8.xyz;
        u_xlat71 = float(1.0) / float(u_xlat69);
        u_xlat69 = u_xlat69 * _AdditionalLightsAttenuation[u_xlati68].x;
        u_xlat69 = (-u_xlat69) * u_xlat69 + 1.0;
        u_xlat69 = max(u_xlat69, 0.0);
        u_xlat69 = u_xlat69 * u_xlat69;
        u_xlat69 = u_xlat69 * u_xlat71;
        u_xlat71 = dot(_AdditionalLightsSpotDir[u_xlati68].xyz, u_xlat9.xyz);
        u_xlat71 = u_xlat71 * _AdditionalLightsAttenuation[u_xlati68].z + _AdditionalLightsAttenuation[u_xlati68].w;
        u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
        u_xlat71 = u_xlat71 * u_xlat71;
        u_xlat69 = u_xlat69 * u_xlat71;
        u_xlat10.xyz = vec3(u_xlat25) * _AdditionalLightsColor[u_xlati68].xyz;
        u_xlat68 = dot(u_xlat1.xyz, u_xlat9.xyz);
        u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
        u_xlat68 = u_xlat68 * u_xlat69;
        u_xlat10.xyz = vec3(u_xlat68) * u_xlat10.xyz;
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat70) + u_xlat2.xyz;
        u_xlat68 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat68 = max(u_xlat68, 1.17549435e-37);
        u_xlat68 = inversesqrt(u_xlat68);
        u_xlat8.xyz = vec3(u_xlat68) * u_xlat8.xyz;
        u_xlat68 = dot(u_xlat1.xyz, u_xlat8.xyz);
        u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
        u_xlat69 = dot(u_xlat9.xyz, u_xlat8.xyz);
        u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
        u_xlat68 = u_xlat68 * u_xlat68;
        u_xlat68 = u_xlat68 * u_xlat0.x + 1.00001001;
        u_xlat69 = u_xlat69 * u_xlat69;
        u_xlat68 = u_xlat68 * u_xlat68;
        u_xlat69 = max(u_xlat69, 0.100000001);
        u_xlat68 = u_xlat68 * u_xlat69;
        u_xlat68 = u_xlat66 * u_xlat68;
        u_xlat68 = u_xlat64 / u_xlat68;
        u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat68) + u_xlat6.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat7.xyz;
    }
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat4.xzw;
    u_xlat0.xyz = u_xlat7.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat63) * u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

