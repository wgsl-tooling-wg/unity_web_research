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
	uint _RenderingLayerMaxInt;
	float _RenderingLayerRcpMaxInt;
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
	vec4 _MainTex_TexelSize;
	vec4 _MRLL_TexelSize;
	vec4 _BumpMap_TexelSize;
	vec4 _Color1;
	vec4 _Color2;
};
layout(set = 0, binding = 0) uniform mediump textureCube unity_SpecCube0;
layout(set = 0, binding = 1) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 2) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightShadowmapTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _MainTex;
layout(set = 0, binding = 5) uniform mediump texture2D _MRLL;
layout(set = 0, binding = 6) uniform mediump texture2D _BumpMap;
layout(location = 0) in highp vec3 vs_INTERP0;
layout(location = 1) in highp vec3 vs_INTERP1;
layout(location = 2) in highp vec4 vs_INTERP2;
layout(location = 3) in highp vec4 vs_INTERP3;
layout(location = 4) in highp vec2 vs_INTERP4;
layout(location = 0) out highp vec4 SV_Target0;
layout(location = 1) out highp vec4 SV_Target1;
layout(set = 0, binding = 7) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 8) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 9) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 10) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
layout(set = 0, binding = 11) uniform mediump  sampler samplerSamplerState_Trilinear_Clamp;
void main()
{
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
bvec4 u_xlatb3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
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
vec4 u_xlat19;
vec4 u_xlat20;
vec2 u_xlat21;
int u_xlati21;
uint u_xlatu21;
bool u_xlatb21;
vec3 u_xlat22;
bvec3 u_xlatb22;
vec3 u_xlat24;
bool u_xlatb24;
float u_xlat27;
vec3 u_xlat29;
vec2 u_xlat30;
float u_xlat42;
uint u_xlatu42;
float u_xlat43;
float u_xlat45;
bool u_xlatb45;
vec2 u_xlat48;
vec2 u_xlat51;
vec2 u_xlat52;
vec2 u_xlat57;
float u_xlat63;
float u_xlat65;
float u_xlat66;
int u_xlati66;
uint u_xlatu66;
bool u_xlatb66;
float u_xlat67;
float u_xlat68;
int u_xlati68;
bool u_xlatb68;
float u_xlat69;
float u_xlat70;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_MainTex, samplerSamplerState_Trilinear_Clamp), vs_INTERP3.xy, _GlobalMipBias.x);
    u_xlat1 = texture(sampler2D(_MRLL, samplerSamplerState_Trilinear_Clamp), vs_INTERP3.xy, _GlobalMipBias.x);
    u_xlat2.xyz = u_xlat1.www * _Color2.xyz;
    u_xlat2.xyz = _Color1.xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat43 = u_xlat1.w + u_xlat1.z;
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat4.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlatb4.xyz = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.0), u_xlat0.xyzx).xyz;
    u_xlat5.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb4.z ? float(1.0) : 0.0;
;
    u_xlat4.x = (u_xlatb4.x) ? float(0.0) : float(1.0);
    u_xlat4.y = (u_xlatb4.y) ? float(0.0) : float(1.0);
    u_xlat4.z = (u_xlatb4.z) ? float(0.0) : float(1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat43) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.x = u_xlat0.x + -0.150000006;
    u_xlat0.x = ceil(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat2.xyz = u_xlat0.xxx * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat2.xyz;
    u_xlat3.xyz = texture(sampler2D(_BumpMap, samplerSamplerState_Trilinear_Clamp), vs_INTERP3.xy, _GlobalMipBias.x).xyw;
    u_xlat3.x = u_xlat3.x * u_xlat3.z;
    u_xlat21.xy = u_xlat3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat43 = dot(u_xlat21.xy, u_xlat21.xy);
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = max(u_xlat43, 1.00000002e-16);
    u_xlat0.x = u_xlat1.x + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.x = max(u_xlat1.y, 0.0);
    u_xlat1.x = min(u_xlat1.x, 0.850000024);
    u_xlatb22.x = 0.0<vs_INTERP2.w;
    u_xlatb22.z = unity_WorldTransformParams.w>=0.0;
    u_xlat22.x = (u_xlatb22.x) ? float(1.0) : float(-1.0);
    u_xlat22.z = (u_xlatb22.z) ? float(1.0) : float(-1.0);
    u_xlat22.x = u_xlat22.z * u_xlat22.x;
    u_xlat3.xyz = vs_INTERP1.zxy * vs_INTERP2.yzx;
    u_xlat3.xyz = vs_INTERP1.yzx * vs_INTERP2.zxy + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat22.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat21.yyy * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat21.xxx * vs_INTERP2.xyz + u_xlat3.xyz;
    u_xlat22.xyz = vec3(u_xlat43) * vs_INTERP1.xyz + u_xlat3.xyz;
    u_xlat21.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat22.xyz = u_xlat21.xxx * u_xlat22.xyz;
    u_xlatb21 = unity_OrthoParams.w==0.0;
    u_xlat3.xyz = (-vs_INTERP0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat3.xyz = vec3(u_xlat42) * u_xlat3.xyz;
    u_xlat4.x = (u_xlatb21) ? u_xlat3.x : unity_MatrixV[0].z;
    u_xlat4.y = (u_xlatb21) ? u_xlat3.y : unity_MatrixV[1].z;
    u_xlat4.z = (u_xlatb21) ? u_xlat3.z : unity_MatrixV[2].z;
    u_xlat3.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat5.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat6.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat7.xyz = vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat3.y = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat3.z = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat3.w = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb3 = lessThan(u_xlat3, _CascadeShadowSplitSphereRadii);
    u_xlat5.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb3.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb3.z ? float(1.0) : 0.0;
    u_xlat5.w = u_xlatb3.w ? float(1.0) : 0.0;
;
    u_xlat3.x = (u_xlatb3.x) ? float(-1.0) : float(-0.0);
    u_xlat3.y = (u_xlatb3.y) ? float(-1.0) : float(-0.0);
    u_xlat3.z = (u_xlatb3.z) ? float(-1.0) : float(-0.0);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat5.yzw;
    u_xlat5.yzw = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat21.x = dot(u_xlat5, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat21.x = (-u_xlat21.x) + 4.0;
    u_xlatu21 = uint(u_xlat21.x);
    u_xlati21 = int(u_xlatu21) << (2 & int(0x1F));
    u_xlat3.xyz = vs_INTERP0.yyy * _MainLightWorldToShadow[(u_xlati21 + 1) / 4][(u_xlati21 + 1) % 4].xyz;
    u_xlat3.xyz = _MainLightWorldToShadow[u_xlati21 / 4][u_xlati21 % 4].xyz * vs_INTERP0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = _MainLightWorldToShadow[(u_xlati21 + 2) / 4][(u_xlati21 + 2) % 4].xyz * vs_INTERP0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + _MainLightWorldToShadow[(u_xlati21 + 3) / 4][(u_xlati21 + 3) % 4].xyz;
    u_xlat5.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_INTERP4.xy, _GlobalMipBias.x).xyz;
    u_xlat21.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat6.xy = u_xlat21.xy * hlslcc_FragCoord.xy;
    u_xlat21.x = u_xlat6.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat6.z = (-u_xlat21.x) + 1.0;
    u_xlat21.x = (-u_xlat0.x) * 0.959999979 + 0.959999979;
    u_xlat42 = (-u_xlat21.x) + u_xlat1.x;
    u_xlat7.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = (-u_xlat1.x) + 1.0;
    u_xlat21.x = u_xlat0.x * u_xlat0.x;
    u_xlat1.x = u_xlat21.x * u_xlat21.x;
    u_xlat42 = u_xlat42 + 1.0;
    u_xlat42 = min(u_xlat42, 1.0);
    u_xlat65 = u_xlat21.x * 4.0 + 2.0;
    u_xlat66 = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat6.xz, _GlobalMipBias.x).x;
    u_xlat67 = u_xlat66 + -1.0;
    u_xlat67 = _AmbientOcclusionParam.w * u_xlat67 + 1.0;
    u_xlat63 = min(u_xlat0.w, u_xlat66);
    u_xlatb66 = 0.0<_MainLightShadowParams.y;
    if(u_xlatb66){
        u_xlatb66 = _MainLightShadowParams.y==1.0;
        if(u_xlatb66){
            u_xlat6 = u_xlat3.xyxy + _MainLightShadowOffset0;
            vec3 txVec0 = vec3(u_xlat6.xy,u_xlat3.z);
            u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
            vec3 txVec1 = vec3(u_xlat6.zw,u_xlat3.z);
            u_xlat8.y = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
            u_xlat6 = u_xlat3.xyxy + _MainLightShadowOffset1;
            vec3 txVec2 = vec3(u_xlat6.xy,u_xlat3.z);
            u_xlat8.z = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec2, 0.0);
            vec3 txVec3 = vec3(u_xlat6.zw,u_xlat3.z);
            u_xlat8.w = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec3, 0.0);
            u_xlat66 = dot(u_xlat8, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb68 = _MainLightShadowParams.y==2.0;
            if(u_xlatb68){
                u_xlat6.xy = u_xlat3.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat6.xy = floor(u_xlat6.xy);
                u_xlat48.xy = u_xlat3.xy * _MainLightShadowmapSize.zw + (-u_xlat6.xy);
                u_xlat8 = u_xlat48.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat9 = u_xlat8.xxzz * u_xlat8.xxzz;
                u_xlat8.xz = u_xlat9.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat9.xy = u_xlat9.xz * vec2(0.5, 0.5) + (-u_xlat48.xy);
                u_xlat51.xy = (-u_xlat48.xy) + vec2(1.0, 1.0);
                u_xlat10.xy = min(u_xlat48.xy, vec2(0.0, 0.0));
                u_xlat10.xy = (-u_xlat10.xy) * u_xlat10.xy + u_xlat51.xy;
                u_xlat48.xy = max(u_xlat48.xy, vec2(0.0, 0.0));
                u_xlat48.xy = (-u_xlat48.xy) * u_xlat48.xy + u_xlat8.yw;
                u_xlat10.xy = u_xlat10.xy + vec2(1.0, 1.0);
                u_xlat48.xy = u_xlat48.xy + vec2(1.0, 1.0);
                u_xlat11.xy = u_xlat9.xy * vec2(0.159999996, 0.159999996);
                u_xlat9.xy = u_xlat51.xy * vec2(0.159999996, 0.159999996);
                u_xlat10.xy = u_xlat10.xy * vec2(0.159999996, 0.159999996);
                u_xlat12.xy = u_xlat48.xy * vec2(0.159999996, 0.159999996);
                u_xlat48.xy = u_xlat8.yw * vec2(0.159999996, 0.159999996);
                u_xlat11.z = u_xlat10.x;
                u_xlat11.w = u_xlat48.x;
                u_xlat9.z = u_xlat12.x;
                u_xlat9.w = u_xlat8.x;
                u_xlat13 = u_xlat9.zwxz + u_xlat11.zwxz;
                u_xlat10.z = u_xlat11.y;
                u_xlat10.w = u_xlat48.y;
                u_xlat12.z = u_xlat9.y;
                u_xlat12.w = u_xlat8.z;
                u_xlat8.xyz = u_xlat10.zyw + u_xlat12.zyw;
                u_xlat9.xyz = u_xlat9.xzw / u_xlat13.zwy;
                u_xlat9.xyz = u_xlat9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat10.xyz = u_xlat12.zyw / u_xlat8.xyz;
                u_xlat10.xyz = u_xlat10.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat9.xyz = u_xlat9.yxz * _MainLightShadowmapSize.xxx;
                u_xlat10.xyz = u_xlat10.xyz * _MainLightShadowmapSize.yyy;
                u_xlat9.w = u_xlat10.x;
                u_xlat11 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.ywxw;
                u_xlat48.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat9.zw;
                u_xlat10.w = u_xlat9.y;
                u_xlat9.yw = u_xlat10.yz;
                u_xlat12 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xyzy;
                u_xlat10 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.wywz;
                u_xlat9 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xwzw;
                u_xlat14 = u_xlat8.xxxy * u_xlat13.zwyz;
                u_xlat15 = u_xlat8.yyzz * u_xlat13;
                u_xlat68 = u_xlat8.z * u_xlat13.y;
                vec3 txVec4 = vec3(u_xlat11.xy,u_xlat3.z);
                u_xlat6.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat11.zw,u_xlat3.z);
                u_xlat27 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec5, 0.0);
                u_xlat27 = u_xlat27 * u_xlat14.y;
                u_xlat6.x = u_xlat14.x * u_xlat6.x + u_xlat27;
                vec3 txVec6 = vec3(u_xlat48.xy,u_xlat3.z);
                u_xlat27 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec6, 0.0);
                u_xlat6.x = u_xlat14.z * u_xlat27 + u_xlat6.x;
                vec3 txVec7 = vec3(u_xlat10.xy,u_xlat3.z);
                u_xlat27 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec7, 0.0);
                u_xlat6.x = u_xlat14.w * u_xlat27 + u_xlat6.x;
                vec3 txVec8 = vec3(u_xlat12.xy,u_xlat3.z);
                u_xlat27 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec8, 0.0);
                u_xlat6.x = u_xlat15.x * u_xlat27 + u_xlat6.x;
                vec3 txVec9 = vec3(u_xlat12.zw,u_xlat3.z);
                u_xlat27 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec9, 0.0);
                u_xlat6.x = u_xlat15.y * u_xlat27 + u_xlat6.x;
                vec3 txVec10 = vec3(u_xlat10.zw,u_xlat3.z);
                u_xlat27 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec10, 0.0);
                u_xlat6.x = u_xlat15.z * u_xlat27 + u_xlat6.x;
                vec3 txVec11 = vec3(u_xlat9.xy,u_xlat3.z);
                u_xlat27 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec11, 0.0);
                u_xlat6.x = u_xlat15.w * u_xlat27 + u_xlat6.x;
                vec3 txVec12 = vec3(u_xlat9.zw,u_xlat3.z);
                u_xlat27 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec12, 0.0);
                u_xlat66 = u_xlat68 * u_xlat27 + u_xlat6.x;
            } else {
                u_xlat6.xy = u_xlat3.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat6.xy = floor(u_xlat6.xy);
                u_xlat48.xy = u_xlat3.xy * _MainLightShadowmapSize.zw + (-u_xlat6.xy);
                u_xlat8 = u_xlat48.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat9 = u_xlat8.xxzz * u_xlat8.xxzz;
                u_xlat10.yw = u_xlat9.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat8.xz = u_xlat9.xz * vec2(0.5, 0.5) + (-u_xlat48.xy);
                u_xlat9.xy = (-u_xlat48.xy) + vec2(1.0, 1.0);
                u_xlat51.xy = min(u_xlat48.xy, vec2(0.0, 0.0));
                u_xlat9.xy = (-u_xlat51.xy) * u_xlat51.xy + u_xlat9.xy;
                u_xlat51.xy = max(u_xlat48.xy, vec2(0.0, 0.0));
                u_xlat29.xz = (-u_xlat51.xy) * u_xlat51.xy + u_xlat8.yw;
                u_xlat9.xy = u_xlat9.xy + vec2(2.0, 2.0);
                u_xlat8.yw = u_xlat29.xz + vec2(2.0, 2.0);
                u_xlat11.z = u_xlat8.y * 0.0816320032;
                u_xlat12.xyz = u_xlat8.zxw * vec3(0.0816320032, 0.0816320032, 0.0816320032);
                u_xlat8.xy = u_xlat9.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat11.x = u_xlat12.y;
                u_xlat11.yw = u_xlat48.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat9.xz = u_xlat48.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat9.y = u_xlat8.x;
                u_xlat9.w = u_xlat10.y;
                u_xlat11 = u_xlat9 + u_xlat11;
                u_xlat12.yw = u_xlat48.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat10.xz = u_xlat48.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat10.y = u_xlat8.y;
                u_xlat8 = u_xlat10 + u_xlat12;
                u_xlat9 = u_xlat9 / u_xlat11;
                u_xlat9 = u_xlat9 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat10 = u_xlat10 / u_xlat8;
                u_xlat10 = u_xlat10 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat9 = u_xlat9.wxyz * _MainLightShadowmapSize.xxxx;
                u_xlat10 = u_xlat10.xwyz * _MainLightShadowmapSize.yyyy;
                u_xlat12.xzw = u_xlat9.yzw;
                u_xlat12.y = u_xlat10.x;
                u_xlat13 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat12.xyzy;
                u_xlat48.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat12.wy;
                u_xlat9.y = u_xlat12.y;
                u_xlat12.y = u_xlat10.z;
                u_xlat14 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat12.xyzy;
                u_xlat15.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat12.wy;
                u_xlat9.z = u_xlat12.y;
                u_xlat16 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xyxz;
                u_xlat12.y = u_xlat10.w;
                u_xlat17 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat12.xyzy;
                u_xlat30.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat12.wy;
                u_xlat9.w = u_xlat12.y;
                u_xlat57.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat9.xw;
                u_xlat10.xzw = u_xlat12.xzw;
                u_xlat12 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat10.xyzy;
                u_xlat52.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat10.wy;
                u_xlat10.x = u_xlat9.x;
                u_xlat6.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat10.xy;
                u_xlat18 = u_xlat8.xxxx * u_xlat11;
                u_xlat19 = u_xlat8.yyyy * u_xlat11;
                u_xlat20 = u_xlat8.zzzz * u_xlat11;
                u_xlat8 = u_xlat8.wwww * u_xlat11;
                vec3 txVec13 = vec3(u_xlat13.xy,u_xlat3.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat13.zw,u_xlat3.z);
                u_xlat70 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec14, 0.0);
                u_xlat70 = u_xlat70 * u_xlat18.y;
                u_xlat68 = u_xlat18.x * u_xlat68 + u_xlat70;
                vec3 txVec15 = vec3(u_xlat48.xy,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec15, 0.0);
                u_xlat68 = u_xlat18.z * u_xlat48.x + u_xlat68;
                vec3 txVec16 = vec3(u_xlat16.xy,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec16, 0.0);
                u_xlat68 = u_xlat18.w * u_xlat48.x + u_xlat68;
                vec3 txVec17 = vec3(u_xlat14.xy,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec17, 0.0);
                u_xlat68 = u_xlat19.x * u_xlat48.x + u_xlat68;
                vec3 txVec18 = vec3(u_xlat14.zw,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec18, 0.0);
                u_xlat68 = u_xlat19.y * u_xlat48.x + u_xlat68;
                vec3 txVec19 = vec3(u_xlat15.xy,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec19, 0.0);
                u_xlat68 = u_xlat19.z * u_xlat48.x + u_xlat68;
                vec3 txVec20 = vec3(u_xlat16.zw,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec20, 0.0);
                u_xlat68 = u_xlat19.w * u_xlat48.x + u_xlat68;
                vec3 txVec21 = vec3(u_xlat17.xy,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec21, 0.0);
                u_xlat68 = u_xlat20.x * u_xlat48.x + u_xlat68;
                vec3 txVec22 = vec3(u_xlat17.zw,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec22, 0.0);
                u_xlat68 = u_xlat20.y * u_xlat48.x + u_xlat68;
                vec3 txVec23 = vec3(u_xlat30.xy,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec23, 0.0);
                u_xlat68 = u_xlat20.z * u_xlat48.x + u_xlat68;
                vec3 txVec24 = vec3(u_xlat57.xy,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec24, 0.0);
                u_xlat68 = u_xlat20.w * u_xlat48.x + u_xlat68;
                vec3 txVec25 = vec3(u_xlat12.xy,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec25, 0.0);
                u_xlat68 = u_xlat8.x * u_xlat48.x + u_xlat68;
                vec3 txVec26 = vec3(u_xlat12.zw,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec26, 0.0);
                u_xlat68 = u_xlat8.y * u_xlat48.x + u_xlat68;
                vec3 txVec27 = vec3(u_xlat52.xy,u_xlat3.z);
                u_xlat48.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec27, 0.0);
                u_xlat68 = u_xlat8.z * u_xlat48.x + u_xlat68;
                vec3 txVec28 = vec3(u_xlat6.xy,u_xlat3.z);
                u_xlat6.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec28, 0.0);
                u_xlat66 = u_xlat8.w * u_xlat6.x + u_xlat68;
            }
        }
    } else {
        vec3 txVec29 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec29, 0.0);
    }
    u_xlat3.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat3.x = u_xlat66 * _MainLightShadowParams.x + u_xlat3.x;
    u_xlatb24 = 0.0>=u_xlat3.z;
    u_xlatb45 = u_xlat3.z>=1.0;
    u_xlatb24 = u_xlatb45 || u_xlatb24;
    u_xlat3.x = (u_xlatb24) ? 1.0 : u_xlat3.x;
    u_xlat24.xyz = vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat24.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat24.x = u_xlat24.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat45 = (-u_xlat3.x) + 1.0;
    u_xlat3.x = u_xlat24.x * u_xlat45 + u_xlat3.x;
    u_xlat24.xyz = vec3(u_xlat67) * _MainLightColor.xyz;
    u_xlat68 = dot((-u_xlat4.xyz), u_xlat22.xyz);
    u_xlat68 = u_xlat68 + u_xlat68;
    u_xlat6.xyz = u_xlat22.xyz * (-vec3(u_xlat68)) + (-u_xlat4.xyz);
    u_xlat68 = dot(u_xlat22.xyz, u_xlat4.xyz);
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
    u_xlat68 = (-u_xlat68) + 1.0;
    u_xlat68 = u_xlat68 * u_xlat68;
    u_xlat68 = u_xlat68 * u_xlat68;
    u_xlat69 = (-u_xlat0.x) * 0.699999988 + 1.70000005;
    u_xlat0.x = u_xlat0.x * u_xlat69;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat6 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat6.xyz, u_xlat0.x);
    u_xlat0.x = u_xlat6.w + -1.0;
    u_xlat0.x = unity_SpecCube0_HDR.w * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat0.xxx;
    u_xlat0.xy = u_xlat21.xx * u_xlat21.xx + vec2(-1.0, 1.0);
    u_xlat21.x = float(1.0) / u_xlat0.y;
    u_xlat8.xyz = (-u_xlat2.xyz) + vec3(u_xlat42);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat21.xxx * u_xlat8.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat8.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz + u_xlat6.xyz;
    u_xlat21.x = u_xlat3.x * unity_LightData.z;
    u_xlat42 = dot(u_xlat22.xyz, _MainLightPosition.xyz);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat21.x = u_xlat42 * u_xlat21.x;
    u_xlat3.xyz = u_xlat21.xxx * u_xlat24.xyz;
    u_xlat6.xyz = u_xlat4.xyz + _MainLightPosition.xyz;
    u_xlat21.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21.x = max(u_xlat21.x, 1.17549435e-37);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat6.xyz = u_xlat21.xxx * u_xlat6.xyz;
    u_xlat21.x = dot(u_xlat22.xyz, u_xlat6.xyz);
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
    u_xlat21.y = dot(_MainLightPosition.xyz, u_xlat6.xyz);
    u_xlat21.y = clamp(u_xlat21.y, 0.0, 1.0);
    u_xlat21.xy = u_xlat21.xy * u_xlat21.xy;
    u_xlat21.x = u_xlat21.x * u_xlat0.x + 1.00001001;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat42 = max(u_xlat21.y, 0.100000001);
    u_xlat21.x = u_xlat42 * u_xlat21.x;
    u_xlat21.x = u_xlat65 * u_xlat21.x;
    u_xlat21.x = u_xlat1.x / u_xlat21.x;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat21.xxx + u_xlat7.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat21.x = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu21 =  uint(int(u_xlat21.x));
    u_xlat6.x = float(0.0);
    u_xlat6.y = float(0.0);
    u_xlat6.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu21 ; u_xlatu_loop_1++)
    {
        u_xlatu66 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati68 = int(u_xlatu_loop_1 & 3u);
        u_xlat66 = dot(unity_LightIndices[int(u_xlatu66)], uintBitsToFloat(ImmCB_0[u_xlati68]));
        u_xlati66 = int(u_xlat66);
        u_xlat8.xyz = (-vs_INTERP0.xyz) * _AdditionalLightsPosition[u_xlati66].www + _AdditionalLightsPosition[u_xlati66].xyz;
        u_xlat68 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat68 = max(u_xlat68, 6.10351562e-05);
        u_xlat69 = inversesqrt(u_xlat68);
        u_xlat9.xyz = vec3(u_xlat69) * u_xlat8.xyz;
        u_xlat70 = float(1.0) / float(u_xlat68);
        u_xlat68 = u_xlat68 * _AdditionalLightsAttenuation[u_xlati66].x;
        u_xlat68 = (-u_xlat68) * u_xlat68 + 1.0;
        u_xlat68 = max(u_xlat68, 0.0);
        u_xlat68 = u_xlat68 * u_xlat68;
        u_xlat68 = u_xlat68 * u_xlat70;
        u_xlat70 = dot(_AdditionalLightsSpotDir[u_xlati66].xyz, u_xlat9.xyz);
        u_xlat70 = u_xlat70 * _AdditionalLightsAttenuation[u_xlati66].z + _AdditionalLightsAttenuation[u_xlati66].w;
        u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
        u_xlat70 = u_xlat70 * u_xlat70;
        u_xlat68 = u_xlat68 * u_xlat70;
        u_xlat10.xyz = vec3(u_xlat67) * _AdditionalLightsColor[u_xlati66].xyz;
        u_xlat66 = dot(u_xlat22.xyz, u_xlat9.xyz);
        u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
        u_xlat66 = u_xlat66 * u_xlat68;
        u_xlat10.xyz = vec3(u_xlat66) * u_xlat10.xyz;
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat69) + u_xlat4.xyz;
        u_xlat66 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat66 = max(u_xlat66, 1.17549435e-37);
        u_xlat66 = inversesqrt(u_xlat66);
        u_xlat8.xyz = vec3(u_xlat66) * u_xlat8.xyz;
        u_xlat66 = dot(u_xlat22.xyz, u_xlat8.xyz);
        u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
        u_xlat68 = dot(u_xlat9.xyz, u_xlat8.xyz);
        u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
        u_xlat66 = u_xlat66 * u_xlat66;
        u_xlat66 = u_xlat66 * u_xlat0.x + 1.00001001;
        u_xlat68 = u_xlat68 * u_xlat68;
        u_xlat66 = u_xlat66 * u_xlat66;
        u_xlat68 = max(u_xlat68, 0.100000001);
        u_xlat66 = u_xlat66 * u_xlat68;
        u_xlat66 = u_xlat65 * u_xlat66;
        u_xlat66 = u_xlat1.x / u_xlat66;
        u_xlat8.xyz = u_xlat2.xyz * vec3(u_xlat66) + u_xlat7.xyz;
        u_xlat6.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat6.xyz;
    }
    u_xlat0.xyz = u_xlat5.xyz * vec3(u_xlat63) + u_xlat3.xyz;
    SV_Target0.xyz = u_xlat6.xyz + u_xlat0.xyz;
    u_xlatu0 = _RenderingLayerMaxInt & floatBitsToUint(unity_RenderingLayer.x);
    u_xlat0.x = float(u_xlatu0);
    SV_Target1.x = u_xlat0.x * _RenderingLayerRcpMaxInt;
    SV_Target1.x = clamp(SV_Target1.x, 0.0, 1.0);
    SV_Target0.w = 1.0;
    SV_Target1.yzw = vec3(0.0, 0.0, 0.0);
    return;
}

