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
	vec4 _ProjectionParams;
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
layout(set = 0, binding = 0) uniform mediump textureCube unity_SpecCube0;
layout(set = 0, binding = 1) uniform mediump texture2D _MainTex;
layout(set = 0, binding = 2) uniform mediump texture2D _MetallicTex;
layout(set = 0, binding = 3) uniform mediump texture2D _ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 4) uniform mediump texture2D _MainLightShadowmapTexture;
layout(location = 0) in highp vec4 vs_TEXCOORD0;
layout(location = 1) in highp vec3 vs_TEXCOORD3;
layout(location = 2) in highp vec3 vs_TEXCOORD7;
layout(location = 3) in highp vec4 vs_TEXCOORD8;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 5) uniform mediump  sampler samplerunity_SpecCube0;
layout(set = 0, binding = 6) uniform mediump  sampler sampler_MainTex;
layout(set = 0, binding = 7) uniform mediump  sampler sampler_MetallicTex;
layout(set = 0, binding = 8) uniform mediump  sampler sampler_ScreenSpaceOcclusionTexture;
layout(set = 0, binding = 9) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
void main()
{
vec4 u_xlat0;
float u_xlat1;
uint u_xlatu1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
bool u_xlatb6;
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
vec4 u_xlat19;
vec3 u_xlat21;
bool u_xlatb21;
vec3 u_xlat23;
float u_xlat24;
float u_xlat26;
bool u_xlatb26;
vec3 u_xlat27;
vec3 u_xlat28;
float u_xlat41;
float u_xlat44;
vec2 u_xlat46;
vec2 u_xlat48;
vec2 u_xlat49;
vec2 u_xlat54;
float u_xlat60;
uint u_xlatu60;
float u_xlat62;
int u_xlati62;
uint u_xlatu62;
bool u_xlatb62;
float u_xlat64;
float u_xlat65;
int u_xlati65;
bool u_xlatb65;
float u_xlat66;
float u_xlat67;
float u_xlat68;
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = texture(sampler2D(_MainTex, sampler_MainTex), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlat1 = texture(sampler2D(_MetallicTex, sampler_MetallicTex), vs_TEXCOORD0.xy, _GlobalMipBias.x).x;
    u_xlatb21 = unity_OrthoParams.w==0.0;
    u_xlat2.xyz = (-vs_TEXCOORD7.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat3.x = unity_MatrixV[0].z;
    u_xlat3.y = unity_MatrixV[1].z;
    u_xlat3.z = unity_MatrixV[2].z;
    u_xlat21.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat3.xyz;
    u_xlat2.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD3.xyz;
    u_xlat3.x = vs_TEXCOORD7.y * unity_MatrixV[1].z;
    u_xlat3.x = unity_MatrixV[0].z * vs_TEXCOORD7.x + u_xlat3.x;
    u_xlat3.x = unity_MatrixV[2].z * vs_TEXCOORD7.z + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + unity_MatrixV[3].z;
    u_xlat3.x = (-u_xlat3.x) + (-_ProjectionParams.y);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x * unity_FogParams.x;
    u_xlat2.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat2);
    u_xlat4.y = dot(unity_SHAg, u_xlat2);
    u_xlat4.z = dot(unity_SHAb, u_xlat2);
    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat6.x = dot(unity_SHBr, u_xlat5);
    u_xlat6.y = dot(unity_SHBg, u_xlat5);
    u_xlat6.z = dot(unity_SHBb, u_xlat5);
    u_xlat62 = u_xlat2.y * u_xlat2.y;
    u_xlat62 = u_xlat2.x * u_xlat2.x + (-u_xlat62);
    u_xlat23.xyz = unity_SHC.xyz * vec3(u_xlat62) + u_xlat6.xyz;
    u_xlat23.xyz = u_xlat23.xyz + u_xlat4.xyz;
    u_xlat23.xyz = max(u_xlat23.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xy = vec2(1.0) / vec2(_ScaledScreenParams.xy);
    u_xlat4.xy = u_xlat4.xy * hlslcc_FragCoord.xy;
    u_xlat62 = u_xlat4.y * _ScaleBiasRt.x + _ScaleBiasRt.y;
    u_xlat4.z = (-u_xlat62) + 1.0;
    u_xlat62 = (-u_xlat1) * 0.959999979 + 0.959999979;
    u_xlat24 = (-u_xlat62) + 1.0;
    u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat62);
    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = vec3(u_xlat1) * u_xlat0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1 = (-u_xlat0.w) + 1.0;
    u_xlat62 = u_xlat1 * u_xlat1;
    u_xlat62 = max(u_xlat62, 0.0078125);
    u_xlat64 = u_xlat62 * u_xlat62;
    u_xlat60 = u_xlat0.w + u_xlat24;
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
    u_xlat24 = u_xlat62 * 4.0 + 2.0;
    u_xlat4.x = texture(sampler2D(_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture), u_xlat4.xz, _GlobalMipBias.x).x;
    u_xlat44 = u_xlat4.x + -1.0;
    u_xlat44 = _AmbientOcclusionParam.w * u_xlat44 + 1.0;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlatb65 = 0.0<_MainLightShadowParams.y;
    if(u_xlatb65){
        u_xlatb65 = _MainLightShadowParams.y==1.0;
        if(u_xlatb65){
            u_xlat6 = vs_TEXCOORD8.xyxy + _MainLightShadowOffset0;
            vec3 txVec0 = vec3(u_xlat6.xy,vs_TEXCOORD8.z);
            u_xlat7.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
            vec3 txVec1 = vec3(u_xlat6.zw,vs_TEXCOORD8.z);
            u_xlat7.y = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
            u_xlat6 = vs_TEXCOORD8.xyxy + _MainLightShadowOffset1;
            vec3 txVec2 = vec3(u_xlat6.xy,vs_TEXCOORD8.z);
            u_xlat7.z = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec2, 0.0);
            vec3 txVec3 = vec3(u_xlat6.zw,vs_TEXCOORD8.z);
            u_xlat7.w = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec3, 0.0);
            u_xlat65 = dot(u_xlat7, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb6 = _MainLightShadowParams.y==2.0;
            if(u_xlatb6){
                u_xlat6.xy = vs_TEXCOORD8.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat6.xy = floor(u_xlat6.xy);
                u_xlat46.xy = vs_TEXCOORD8.xy * _MainLightShadowmapSize.zw + (-u_xlat6.xy);
                u_xlat7 = u_xlat46.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat8 = u_xlat7.xxzz * u_xlat7.xxzz;
                u_xlat7.xz = u_xlat8.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat8.xy = u_xlat8.xz * vec2(0.5, 0.5) + (-u_xlat46.xy);
                u_xlat48.xy = (-u_xlat46.xy) + vec2(1.0, 1.0);
                u_xlat9.xy = min(u_xlat46.xy, vec2(0.0, 0.0));
                u_xlat9.xy = (-u_xlat9.xy) * u_xlat9.xy + u_xlat48.xy;
                u_xlat46.xy = max(u_xlat46.xy, vec2(0.0, 0.0));
                u_xlat46.xy = (-u_xlat46.xy) * u_xlat46.xy + u_xlat7.yw;
                u_xlat9.xy = u_xlat9.xy + vec2(1.0, 1.0);
                u_xlat46.xy = u_xlat46.xy + vec2(1.0, 1.0);
                u_xlat10.xy = u_xlat8.xy * vec2(0.159999996, 0.159999996);
                u_xlat8.xy = u_xlat48.xy * vec2(0.159999996, 0.159999996);
                u_xlat9.xy = u_xlat9.xy * vec2(0.159999996, 0.159999996);
                u_xlat11.xy = u_xlat46.xy * vec2(0.159999996, 0.159999996);
                u_xlat46.xy = u_xlat7.yw * vec2(0.159999996, 0.159999996);
                u_xlat10.z = u_xlat9.x;
                u_xlat10.w = u_xlat46.x;
                u_xlat8.z = u_xlat11.x;
                u_xlat8.w = u_xlat7.x;
                u_xlat12 = u_xlat8.zwxz + u_xlat10.zwxz;
                u_xlat9.z = u_xlat10.y;
                u_xlat9.w = u_xlat46.y;
                u_xlat11.z = u_xlat8.y;
                u_xlat11.w = u_xlat7.z;
                u_xlat7.xyz = u_xlat9.zyw + u_xlat11.zyw;
                u_xlat8.xyz = u_xlat8.xzw / u_xlat12.zwy;
                u_xlat8.xyz = u_xlat8.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat9.xyz = u_xlat11.zyw / u_xlat7.xyz;
                u_xlat9.xyz = u_xlat9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat8.xyz = u_xlat8.yxz * _MainLightShadowmapSize.xxx;
                u_xlat9.xyz = u_xlat9.xyz * _MainLightShadowmapSize.yyy;
                u_xlat8.w = u_xlat9.x;
                u_xlat10 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.ywxw;
                u_xlat46.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat8.zw;
                u_xlat9.w = u_xlat8.y;
                u_xlat8.yw = u_xlat9.yz;
                u_xlat11 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyzy;
                u_xlat9 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.wywz;
                u_xlat8 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xwzw;
                u_xlat13 = u_xlat7.xxxy * u_xlat12.zwyz;
                u_xlat14 = u_xlat7.yyzz * u_xlat12;
                u_xlat6.x = u_xlat7.z * u_xlat12.y;
                vec3 txVec4 = vec3(u_xlat10.xy,vs_TEXCOORD8.z);
                u_xlat26 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat10.zw,vs_TEXCOORD8.z);
                u_xlat7.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec5, 0.0);
                u_xlat7.x = u_xlat7.x * u_xlat13.y;
                u_xlat26 = u_xlat13.x * u_xlat26 + u_xlat7.x;
                vec3 txVec6 = vec3(u_xlat46.xy,vs_TEXCOORD8.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec6, 0.0);
                u_xlat26 = u_xlat13.z * u_xlat46.x + u_xlat26;
                vec3 txVec7 = vec3(u_xlat9.xy,vs_TEXCOORD8.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec7, 0.0);
                u_xlat26 = u_xlat13.w * u_xlat46.x + u_xlat26;
                vec3 txVec8 = vec3(u_xlat11.xy,vs_TEXCOORD8.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec8, 0.0);
                u_xlat26 = u_xlat14.x * u_xlat46.x + u_xlat26;
                vec3 txVec9 = vec3(u_xlat11.zw,vs_TEXCOORD8.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec9, 0.0);
                u_xlat26 = u_xlat14.y * u_xlat46.x + u_xlat26;
                vec3 txVec10 = vec3(u_xlat9.zw,vs_TEXCOORD8.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec10, 0.0);
                u_xlat26 = u_xlat14.z * u_xlat46.x + u_xlat26;
                vec3 txVec11 = vec3(u_xlat8.xy,vs_TEXCOORD8.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec11, 0.0);
                u_xlat26 = u_xlat14.w * u_xlat46.x + u_xlat26;
                vec3 txVec12 = vec3(u_xlat8.zw,vs_TEXCOORD8.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec12, 0.0);
                u_xlat65 = u_xlat6.x * u_xlat46.x + u_xlat26;
            } else {
                u_xlat6.xy = vs_TEXCOORD8.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat6.xy = floor(u_xlat6.xy);
                u_xlat46.xy = vs_TEXCOORD8.xy * _MainLightShadowmapSize.zw + (-u_xlat6.xy);
                u_xlat7 = u_xlat46.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat8 = u_xlat7.xxzz * u_xlat7.xxzz;
                u_xlat9.yw = u_xlat8.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat7.xz = u_xlat8.xz * vec2(0.5, 0.5) + (-u_xlat46.xy);
                u_xlat8.xy = (-u_xlat46.xy) + vec2(1.0, 1.0);
                u_xlat48.xy = min(u_xlat46.xy, vec2(0.0, 0.0));
                u_xlat8.xy = (-u_xlat48.xy) * u_xlat48.xy + u_xlat8.xy;
                u_xlat48.xy = max(u_xlat46.xy, vec2(0.0, 0.0));
                u_xlat27.xz = (-u_xlat48.xy) * u_xlat48.xy + u_xlat7.yw;
                u_xlat8.xy = u_xlat8.xy + vec2(2.0, 2.0);
                u_xlat7.yw = u_xlat27.xz + vec2(2.0, 2.0);
                u_xlat10.z = u_xlat7.y * 0.0816320032;
                u_xlat11.xyz = u_xlat7.zxw * vec3(0.0816320032, 0.0816320032, 0.0816320032);
                u_xlat7.xy = u_xlat8.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat10.x = u_xlat11.y;
                u_xlat10.yw = u_xlat46.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat8.xz = u_xlat46.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat8.y = u_xlat7.x;
                u_xlat8.w = u_xlat9.y;
                u_xlat10 = u_xlat8 + u_xlat10;
                u_xlat11.yw = u_xlat46.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat9.xz = u_xlat46.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat9.y = u_xlat7.y;
                u_xlat7 = u_xlat9 + u_xlat11;
                u_xlat8 = u_xlat8 / u_xlat10;
                u_xlat8 = u_xlat8 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat9 = u_xlat9 / u_xlat7;
                u_xlat9 = u_xlat9 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat8 = u_xlat8.wxyz * _MainLightShadowmapSize.xxxx;
                u_xlat9 = u_xlat9.xwyz * _MainLightShadowmapSize.yyyy;
                u_xlat11.xzw = u_xlat8.yzw;
                u_xlat11.y = u_xlat9.x;
                u_xlat12 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat11.xyzy;
                u_xlat46.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat11.wy;
                u_xlat8.y = u_xlat11.y;
                u_xlat11.y = u_xlat9.z;
                u_xlat13 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat11.xyzy;
                u_xlat14.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat11.wy;
                u_xlat8.z = u_xlat11.y;
                u_xlat15 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyxz;
                u_xlat11.y = u_xlat9.w;
                u_xlat16 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat11.xyzy;
                u_xlat28.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat11.wy;
                u_xlat8.w = u_xlat11.y;
                u_xlat54.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat8.xw;
                u_xlat9.xzw = u_xlat11.xzw;
                u_xlat11 = u_xlat6.xyxy * _MainLightShadowmapSize.xyxy + u_xlat9.xyzy;
                u_xlat49.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat9.wy;
                u_xlat9.x = u_xlat8.x;
                u_xlat6.xy = u_xlat6.xy * _MainLightShadowmapSize.xy + u_xlat9.xy;
                u_xlat17 = u_xlat7.xxxx * u_xlat10;
                u_xlat18 = u_xlat7.yyyy * u_xlat10;
                u_xlat19 = u_xlat7.zzzz * u_xlat10;
                u_xlat7 = u_xlat7.wwww * u_xlat10;
                vec3 txVec13 = vec3(u_xlat12.xy,vs_TEXCOORD8.z);
                u_xlat8.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat12.zw,vs_TEXCOORD8.z);
                u_xlat68 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec14, 0.0);
                u_xlat68 = u_xlat68 * u_xlat17.y;
                u_xlat8.x = u_xlat17.x * u_xlat8.x + u_xlat68;
                vec3 txVec15 = vec3(u_xlat46.xy,vs_TEXCOORD8.z);
                u_xlat46.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec15, 0.0);
                u_xlat46.x = u_xlat17.z * u_xlat46.x + u_xlat8.x;
                vec3 txVec16 = vec3(u_xlat15.xy,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec16, 0.0);
                u_xlat46.x = u_xlat17.w * u_xlat66 + u_xlat46.x;
                vec3 txVec17 = vec3(u_xlat13.xy,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec17, 0.0);
                u_xlat46.x = u_xlat18.x * u_xlat66 + u_xlat46.x;
                vec3 txVec18 = vec3(u_xlat13.zw,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec18, 0.0);
                u_xlat46.x = u_xlat18.y * u_xlat66 + u_xlat46.x;
                vec3 txVec19 = vec3(u_xlat14.xy,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec19, 0.0);
                u_xlat46.x = u_xlat18.z * u_xlat66 + u_xlat46.x;
                vec3 txVec20 = vec3(u_xlat15.zw,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec20, 0.0);
                u_xlat46.x = u_xlat18.w * u_xlat66 + u_xlat46.x;
                vec3 txVec21 = vec3(u_xlat16.xy,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec21, 0.0);
                u_xlat46.x = u_xlat19.x * u_xlat66 + u_xlat46.x;
                vec3 txVec22 = vec3(u_xlat16.zw,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec22, 0.0);
                u_xlat46.x = u_xlat19.y * u_xlat66 + u_xlat46.x;
                vec3 txVec23 = vec3(u_xlat28.xy,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec23, 0.0);
                u_xlat46.x = u_xlat19.z * u_xlat66 + u_xlat46.x;
                vec3 txVec24 = vec3(u_xlat54.xy,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec24, 0.0);
                u_xlat46.x = u_xlat19.w * u_xlat66 + u_xlat46.x;
                vec3 txVec25 = vec3(u_xlat11.xy,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec25, 0.0);
                u_xlat46.x = u_xlat7.x * u_xlat66 + u_xlat46.x;
                vec3 txVec26 = vec3(u_xlat11.zw,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec26, 0.0);
                u_xlat46.x = u_xlat7.y * u_xlat66 + u_xlat46.x;
                vec3 txVec27 = vec3(u_xlat49.xy,vs_TEXCOORD8.z);
                u_xlat66 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec27, 0.0);
                u_xlat46.x = u_xlat7.z * u_xlat66 + u_xlat46.x;
                vec3 txVec28 = vec3(u_xlat6.xy,vs_TEXCOORD8.z);
                u_xlat6.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec28, 0.0);
                u_xlat65 = u_xlat7.w * u_xlat6.x + u_xlat46.x;
            }
        }
    } else {
        vec3 txVec29 = vec3(vs_TEXCOORD8.xy,vs_TEXCOORD8.z);
        u_xlat65 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec29, 0.0);
    }
    u_xlat6.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat65 = u_xlat65 * _MainLightShadowParams.x + u_xlat6.x;
    u_xlatb6 = 0.0>=vs_TEXCOORD8.z;
    u_xlatb26 = vs_TEXCOORD8.z>=1.0;
    u_xlatb6 = u_xlatb26 || u_xlatb6;
    u_xlat65 = (u_xlatb6) ? 1.0 : u_xlat65;
    u_xlat6.xyz = vs_TEXCOORD7.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat6.x = u_xlat6.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat26 = (-u_xlat65) + 1.0;
    u_xlat65 = u_xlat6.x * u_xlat26 + u_xlat65;
    u_xlat6.xyz = vec3(u_xlat44) * _MainLightColor.xyz;
    u_xlat66 = dot((-u_xlat21.xyz), u_xlat2.xyz);
    u_xlat66 = u_xlat66 + u_xlat66;
    u_xlat7.xyz = u_xlat2.xyz * (-vec3(u_xlat66)) + (-u_xlat21.xyz);
    u_xlat66 = dot(u_xlat2.xyz, u_xlat21.xyz);
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
    u_xlat66 = (-u_xlat66) + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat67 = (-u_xlat1) * 0.699999988 + 1.70000005;
    u_xlat1 = u_xlat1 * u_xlat67;
    u_xlat1 = u_xlat1 * 6.0;
    u_xlat7 = textureLod(samplerCube(unity_SpecCube0, samplerunity_SpecCube0), u_xlat7.xyz, u_xlat1);
    u_xlat1 = u_xlat7.w + -1.0;
    u_xlat1 = unity_SpecCube0_HDR.w * u_xlat1 + 1.0;
    u_xlat1 = max(u_xlat1, 0.0);
    u_xlat1 = log2(u_xlat1);
    u_xlat1 = u_xlat1 * unity_SpecCube0_HDR.y;
    u_xlat1 = exp2(u_xlat1);
    u_xlat1 = u_xlat1 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat1);
    u_xlat8.xy = vec2(u_xlat62) * vec2(u_xlat62) + vec2(-1.0, 1.0);
    u_xlat1 = float(1.0) / u_xlat8.y;
    u_xlat28.xyz = (-u_xlat0.xyz) + vec3(u_xlat60);
    u_xlat28.xyz = vec3(u_xlat66) * u_xlat28.xyz + u_xlat0.xyz;
    u_xlat28.xyz = vec3(u_xlat1) * u_xlat28.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat28.xyz;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat5.xyz + u_xlat7.xyz;
    u_xlat60 = u_xlat65 * unity_LightData.z;
    u_xlat1 = dot(u_xlat2.xyz, _MainLightPosition.xyz);
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat60 = u_xlat60 * u_xlat1;
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat21.xyz + _MainLightPosition.xyz;
    u_xlat60 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat60 = max(u_xlat60, 1.17549435e-37);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat7.xyz = vec3(u_xlat60) * u_xlat7.xyz;
    u_xlat60 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
    u_xlat1 = dot(_MainLightPosition.xyz, u_xlat7.xyz);
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat60 = u_xlat60 * u_xlat60;
    u_xlat60 = u_xlat60 * u_xlat8.x + 1.00001001;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat60 = u_xlat60 * u_xlat60;
    u_xlat1 = max(u_xlat1, 0.100000001);
    u_xlat60 = u_xlat60 * u_xlat1;
    u_xlat60 = u_xlat24 * u_xlat60;
    u_xlat60 = u_xlat64 / u_xlat60;
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat60) + u_xlat5.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat60 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu60 =  uint(int(u_xlat60));
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu60 ; u_xlatu_loop_1++)
    {
        u_xlatu62 = u_xlatu_loop_1 >> (2u & uint(0x1F));
        u_xlati65 = int(u_xlatu_loop_1 & 3u);
        u_xlat62 = dot(unity_LightIndices[int(u_xlatu62)], uintBitsToFloat(ImmCB_0[u_xlati65]));
        u_xlati62 = int(u_xlat62);
        u_xlat28.xyz = (-vs_TEXCOORD7.xyz) * _AdditionalLightsPosition[u_xlati62].www + _AdditionalLightsPosition[u_xlati62].xyz;
        u_xlat65 = dot(u_xlat28.xyz, u_xlat28.xyz);
        u_xlat65 = max(u_xlat65, 6.10351562e-05);
        u_xlat66 = inversesqrt(u_xlat65);
        u_xlat9.xyz = vec3(u_xlat66) * u_xlat28.xyz;
        u_xlat67 = float(1.0) / float(u_xlat65);
        u_xlat65 = u_xlat65 * _AdditionalLightsAttenuation[u_xlati62].x;
        u_xlat65 = (-u_xlat65) * u_xlat65 + 1.0;
        u_xlat65 = max(u_xlat65, 0.0);
        u_xlat65 = u_xlat65 * u_xlat65;
        u_xlat65 = u_xlat65 * u_xlat67;
        u_xlat67 = dot(_AdditionalLightsSpotDir[u_xlati62].xyz, u_xlat9.xyz);
        u_xlat67 = u_xlat67 * _AdditionalLightsAttenuation[u_xlati62].z + _AdditionalLightsAttenuation[u_xlati62].w;
        u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
        u_xlat67 = u_xlat67 * u_xlat67;
        u_xlat65 = u_xlat65 * u_xlat67;
        u_xlat10.xyz = vec3(u_xlat44) * _AdditionalLightsColor[u_xlati62].xyz;
        u_xlat62 = dot(u_xlat2.xyz, u_xlat9.xyz);
        u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
        u_xlat62 = u_xlat62 * u_xlat65;
        u_xlat10.xyz = vec3(u_xlat62) * u_xlat10.xyz;
        u_xlat28.xyz = u_xlat28.xyz * vec3(u_xlat66) + u_xlat21.xyz;
        u_xlat62 = dot(u_xlat28.xyz, u_xlat28.xyz);
        u_xlat62 = max(u_xlat62, 1.17549435e-37);
        u_xlat62 = inversesqrt(u_xlat62);
        u_xlat28.xyz = vec3(u_xlat62) * u_xlat28.xyz;
        u_xlat62 = dot(u_xlat2.xyz, u_xlat28.xyz);
        u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
        u_xlat65 = dot(u_xlat9.xyz, u_xlat28.xyz);
        u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
        u_xlat62 = u_xlat62 * u_xlat62;
        u_xlat62 = u_xlat62 * u_xlat8.x + 1.00001001;
        u_xlat65 = u_xlat65 * u_xlat65;
        u_xlat62 = u_xlat62 * u_xlat62;
        u_xlat65 = max(u_xlat65, 0.100000001);
        u_xlat62 = u_xlat62 * u_xlat65;
        u_xlat62 = u_xlat24 * u_xlat62;
        u_xlat62 = u_xlat64 / u_xlat62;
        u_xlat28.xyz = u_xlat0.xyz * vec3(u_xlat62) + u_xlat5.xyz;
        u_xlat7.xyz = u_xlat28.xyz * u_xlat10.xyz + u_xlat7.xyz;
    }
    u_xlat0.xyz = u_xlat23.xyz * u_xlat4.xxx + u_xlat6.xyz;
    u_xlat0.xyz = u_xlat7.xyz + u_xlat0.xyz;
    u_xlat60 = u_xlat3.x * (-u_xlat3.x);
    u_xlat60 = exp2(u_xlat60);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(u_xlat60) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

