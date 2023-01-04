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
layout(set = 1, binding = 0, std140) uniform PGlobals {
	vec2 _GlobalMipBias;
};
layout(set = 1, binding = 1, std140) uniform MainLightShadows {
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
layout(set = 0, binding = 0) uniform mediump texture2D unity_Lightmap;
layout(set = 0, binding = 1) uniform mediump texture2D unity_LightmapInd;
layout(set = 0, binding = 2) uniform mediump texture2D _MainTex;
layout(set = 0, binding = 3) uniform mediump texture2D _MainLightShadowmapTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in highp vec2 vs_TEXCOORD1;
layout(location = 2) in highp vec4 vs_TEXCOORD3;
layout(location = 3) in highp vec4 vs_TEXCOORD5;
layout(location = 4) in highp vec3 vs_TEXCOORD6;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 4) uniform mediump  sampler samplerunity_Lightmap;
layout(set = 0, binding = 5) uniform mediump  sampler sampler_MainTex;
layout(set = 0, binding = 6) uniform mediump  samplerShadow sampler_MainLightShadowmapTexture;
void main()
{
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
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
vec3 u_xlat17;
bool u_xlatb17;
float u_xlat20;
vec3 u_xlat21;
vec2 u_xlat22;
bool u_xlatb34;
vec2 u_xlat37;
vec2 u_xlat39;
vec2 u_xlat40;
vec2 u_xlat45;
float u_xlat51;
bool u_xlatb51;
float u_xlat52;
bool u_xlatb52;
    u_xlat0.xyz = vs_TEXCOORD6.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat1.xyz = vs_TEXCOORD6.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat2.xyz = vs_TEXCOORD6.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat3.xyz = vs_TEXCOORD6.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.w = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlatb0 = lessThan(u_xlat0, _CascadeShadowSplitSphereRadii);
    u_xlat1.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat0.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat0.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.yzw;
    u_xlat1.yzw = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = dot(u_xlat1, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat0.x = (-u_xlat0.x) + 4.0;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati0 = int(u_xlatu0) << (2 & int(0x1F));
    u_xlat17.xyz = vs_TEXCOORD6.yyy * _MainLightWorldToShadow[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].xyz;
    u_xlat17.xyz = _MainLightWorldToShadow[u_xlati0 / 4][u_xlati0 % 4].xyz * vs_TEXCOORD6.xxx + u_xlat17.xyz;
    u_xlat17.xyz = _MainLightWorldToShadow[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xyz * vs_TEXCOORD6.zzz + u_xlat17.xyz;
    u_xlat0.xyz = u_xlat17.xyz + _MainLightWorldToShadow[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xyz;
    u_xlat1 = texture(sampler2D(unity_LightmapInd, samplerunity_Lightmap), vs_TEXCOORD1.xy, _GlobalMipBias.x);
    u_xlat2.xyz = texture(sampler2D(unity_Lightmap, samplerunity_Lightmap), vs_TEXCOORD1.xy, _GlobalMipBias.x).xyz;
    u_xlat1.xyz = u_xlat1.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat51 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat51 = u_xlat51 + 0.5;
    u_xlat1.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat51 = max(u_xlat1.w, 9.99999975e-05);
    u_xlat1.xyz = u_xlat1.xyz / vec3(u_xlat51);
    u_xlat2 = texture(sampler2D(_MainTex, sampler_MainTex), vs_TEXCOORD0.xy, _GlobalMipBias.x);
    u_xlatb51 = 0.0<_MainLightShadowParams.y;
    if(u_xlatb51){
        u_xlatb51 = _MainLightShadowParams.y==1.0;
        if(u_xlatb51){
            u_xlat3 = u_xlat0.xyxy + _MainLightShadowOffset0;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat0.z);
            u_xlat4.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec0, 0.0);
            vec3 txVec1 = vec3(u_xlat3.zw,u_xlat0.z);
            u_xlat4.y = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec1, 0.0);
            u_xlat3 = u_xlat0.xyxy + _MainLightShadowOffset1;
            vec3 txVec2 = vec3(u_xlat3.xy,u_xlat0.z);
            u_xlat4.z = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec2, 0.0);
            vec3 txVec3 = vec3(u_xlat3.zw,u_xlat0.z);
            u_xlat4.w = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec3, 0.0);
            u_xlat51 = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb52 = _MainLightShadowParams.y==2.0;
            if(u_xlatb52){
                u_xlat3.xy = u_xlat0.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat3.xy = floor(u_xlat3.xy);
                u_xlat37.xy = u_xlat0.xy * _MainLightShadowmapSize.zw + (-u_xlat3.xy);
                u_xlat4 = u_xlat37.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat5 = u_xlat4.xxzz * u_xlat4.xxzz;
                u_xlat4.xz = u_xlat5.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat5.xy = u_xlat5.xz * vec2(0.5, 0.5) + (-u_xlat37.xy);
                u_xlat39.xy = (-u_xlat37.xy) + vec2(1.0, 1.0);
                u_xlat6.xy = min(u_xlat37.xy, vec2(0.0, 0.0));
                u_xlat6.xy = (-u_xlat6.xy) * u_xlat6.xy + u_xlat39.xy;
                u_xlat37.xy = max(u_xlat37.xy, vec2(0.0, 0.0));
                u_xlat37.xy = (-u_xlat37.xy) * u_xlat37.xy + u_xlat4.yw;
                u_xlat6.xy = u_xlat6.xy + vec2(1.0, 1.0);
                u_xlat37.xy = u_xlat37.xy + vec2(1.0, 1.0);
                u_xlat7.xy = u_xlat5.xy * vec2(0.159999996, 0.159999996);
                u_xlat5.xy = u_xlat39.xy * vec2(0.159999996, 0.159999996);
                u_xlat6.xy = u_xlat6.xy * vec2(0.159999996, 0.159999996);
                u_xlat8.xy = u_xlat37.xy * vec2(0.159999996, 0.159999996);
                u_xlat37.xy = u_xlat4.yw * vec2(0.159999996, 0.159999996);
                u_xlat7.z = u_xlat6.x;
                u_xlat7.w = u_xlat37.x;
                u_xlat5.z = u_xlat8.x;
                u_xlat5.w = u_xlat4.x;
                u_xlat9 = u_xlat5.zwxz + u_xlat7.zwxz;
                u_xlat6.z = u_xlat7.y;
                u_xlat6.w = u_xlat37.y;
                u_xlat8.z = u_xlat5.y;
                u_xlat8.w = u_xlat4.z;
                u_xlat4.xyz = u_xlat6.zyw + u_xlat8.zyw;
                u_xlat5.xyz = u_xlat5.xzw / u_xlat9.zwy;
                u_xlat5.xyz = u_xlat5.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat6.xyz = u_xlat8.zyw / u_xlat4.xyz;
                u_xlat6.xyz = u_xlat6.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat5.xyz = u_xlat5.yxz * _MainLightShadowmapSize.xxx;
                u_xlat6.xyz = u_xlat6.xyz * _MainLightShadowmapSize.yyy;
                u_xlat5.w = u_xlat6.x;
                u_xlat7 = u_xlat3.xyxy * _MainLightShadowmapSize.xyxy + u_xlat5.ywxw;
                u_xlat37.xy = u_xlat3.xy * _MainLightShadowmapSize.xy + u_xlat5.zw;
                u_xlat6.w = u_xlat5.y;
                u_xlat5.yw = u_xlat6.yz;
                u_xlat8 = u_xlat3.xyxy * _MainLightShadowmapSize.xyxy + u_xlat5.xyzy;
                u_xlat6 = u_xlat3.xyxy * _MainLightShadowmapSize.xyxy + u_xlat6.wywz;
                u_xlat5 = u_xlat3.xyxy * _MainLightShadowmapSize.xyxy + u_xlat5.xwzw;
                u_xlat10 = u_xlat4.xxxy * u_xlat9.zwyz;
                u_xlat11 = u_xlat4.yyzz * u_xlat9;
                u_xlat52 = u_xlat4.z * u_xlat9.y;
                vec3 txVec4 = vec3(u_xlat7.xy,u_xlat0.z);
                u_xlat3.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat7.zw,u_xlat0.z);
                u_xlat20 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec5, 0.0);
                u_xlat20 = u_xlat20 * u_xlat10.y;
                u_xlat3.x = u_xlat10.x * u_xlat3.x + u_xlat20;
                vec3 txVec6 = vec3(u_xlat37.xy,u_xlat0.z);
                u_xlat20 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec6, 0.0);
                u_xlat3.x = u_xlat10.z * u_xlat20 + u_xlat3.x;
                vec3 txVec7 = vec3(u_xlat6.xy,u_xlat0.z);
                u_xlat20 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec7, 0.0);
                u_xlat3.x = u_xlat10.w * u_xlat20 + u_xlat3.x;
                vec3 txVec8 = vec3(u_xlat8.xy,u_xlat0.z);
                u_xlat20 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec8, 0.0);
                u_xlat3.x = u_xlat11.x * u_xlat20 + u_xlat3.x;
                vec3 txVec9 = vec3(u_xlat8.zw,u_xlat0.z);
                u_xlat20 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec9, 0.0);
                u_xlat3.x = u_xlat11.y * u_xlat20 + u_xlat3.x;
                vec3 txVec10 = vec3(u_xlat6.zw,u_xlat0.z);
                u_xlat20 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec10, 0.0);
                u_xlat3.x = u_xlat11.z * u_xlat20 + u_xlat3.x;
                vec3 txVec11 = vec3(u_xlat5.xy,u_xlat0.z);
                u_xlat20 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec11, 0.0);
                u_xlat3.x = u_xlat11.w * u_xlat20 + u_xlat3.x;
                vec3 txVec12 = vec3(u_xlat5.zw,u_xlat0.z);
                u_xlat20 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec12, 0.0);
                u_xlat51 = u_xlat52 * u_xlat20 + u_xlat3.x;
            } else {
                u_xlat3.xy = u_xlat0.xy * _MainLightShadowmapSize.zw + vec2(0.5, 0.5);
                u_xlat3.xy = floor(u_xlat3.xy);
                u_xlat37.xy = u_xlat0.xy * _MainLightShadowmapSize.zw + (-u_xlat3.xy);
                u_xlat4 = u_xlat37.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat5 = u_xlat4.xxzz * u_xlat4.xxzz;
                u_xlat6.yw = u_xlat5.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat4.xz = u_xlat5.xz * vec2(0.5, 0.5) + (-u_xlat37.xy);
                u_xlat5.xy = (-u_xlat37.xy) + vec2(1.0, 1.0);
                u_xlat39.xy = min(u_xlat37.xy, vec2(0.0, 0.0));
                u_xlat5.xy = (-u_xlat39.xy) * u_xlat39.xy + u_xlat5.xy;
                u_xlat39.xy = max(u_xlat37.xy, vec2(0.0, 0.0));
                u_xlat21.xz = (-u_xlat39.xy) * u_xlat39.xy + u_xlat4.yw;
                u_xlat5.xy = u_xlat5.xy + vec2(2.0, 2.0);
                u_xlat4.yw = u_xlat21.xz + vec2(2.0, 2.0);
                u_xlat7.z = u_xlat4.y * 0.0816320032;
                u_xlat8.xyz = u_xlat4.zxw * vec3(0.0816320032, 0.0816320032, 0.0816320032);
                u_xlat4.xy = u_xlat5.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat7.x = u_xlat8.y;
                u_xlat7.yw = u_xlat37.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat5.xz = u_xlat37.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat5.y = u_xlat4.x;
                u_xlat5.w = u_xlat6.y;
                u_xlat7 = u_xlat5 + u_xlat7;
                u_xlat8.yw = u_xlat37.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat6.xz = u_xlat37.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat6.y = u_xlat4.y;
                u_xlat4 = u_xlat6 + u_xlat8;
                u_xlat5 = u_xlat5 / u_xlat7;
                u_xlat5 = u_xlat5 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat6 = u_xlat6 / u_xlat4;
                u_xlat6 = u_xlat6 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat5 = u_xlat5.wxyz * _MainLightShadowmapSize.xxxx;
                u_xlat6 = u_xlat6.xwyz * _MainLightShadowmapSize.yyyy;
                u_xlat8.xzw = u_xlat5.yzw;
                u_xlat8.y = u_xlat6.x;
                u_xlat9 = u_xlat3.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyzy;
                u_xlat37.xy = u_xlat3.xy * _MainLightShadowmapSize.xy + u_xlat8.wy;
                u_xlat5.y = u_xlat8.y;
                u_xlat8.y = u_xlat6.z;
                u_xlat10 = u_xlat3.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyzy;
                u_xlat11.xy = u_xlat3.xy * _MainLightShadowmapSize.xy + u_xlat8.wy;
                u_xlat5.z = u_xlat8.y;
                u_xlat12 = u_xlat3.xyxy * _MainLightShadowmapSize.xyxy + u_xlat5.xyxz;
                u_xlat8.y = u_xlat6.w;
                u_xlat13 = u_xlat3.xyxy * _MainLightShadowmapSize.xyxy + u_xlat8.xyzy;
                u_xlat22.xy = u_xlat3.xy * _MainLightShadowmapSize.xy + u_xlat8.wy;
                u_xlat5.w = u_xlat8.y;
                u_xlat45.xy = u_xlat3.xy * _MainLightShadowmapSize.xy + u_xlat5.xw;
                u_xlat6.xzw = u_xlat8.xzw;
                u_xlat8 = u_xlat3.xyxy * _MainLightShadowmapSize.xyxy + u_xlat6.xyzy;
                u_xlat40.xy = u_xlat3.xy * _MainLightShadowmapSize.xy + u_xlat6.wy;
                u_xlat6.x = u_xlat5.x;
                u_xlat3.xy = u_xlat3.xy * _MainLightShadowmapSize.xy + u_xlat6.xy;
                u_xlat14 = u_xlat4.xxxx * u_xlat7;
                u_xlat15 = u_xlat4.yyyy * u_xlat7;
                u_xlat16 = u_xlat4.zzzz * u_xlat7;
                u_xlat4 = u_xlat4.wwww * u_xlat7;
                vec3 txVec13 = vec3(u_xlat9.xy,u_xlat0.z);
                u_xlat52 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat9.zw,u_xlat0.z);
                u_xlat5.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec14, 0.0);
                u_xlat5.x = u_xlat5.x * u_xlat14.y;
                u_xlat52 = u_xlat14.x * u_xlat52 + u_xlat5.x;
                vec3 txVec15 = vec3(u_xlat37.xy,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec15, 0.0);
                u_xlat52 = u_xlat14.z * u_xlat37.x + u_xlat52;
                vec3 txVec16 = vec3(u_xlat12.xy,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec16, 0.0);
                u_xlat52 = u_xlat14.w * u_xlat37.x + u_xlat52;
                vec3 txVec17 = vec3(u_xlat10.xy,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec17, 0.0);
                u_xlat52 = u_xlat15.x * u_xlat37.x + u_xlat52;
                vec3 txVec18 = vec3(u_xlat10.zw,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec18, 0.0);
                u_xlat52 = u_xlat15.y * u_xlat37.x + u_xlat52;
                vec3 txVec19 = vec3(u_xlat11.xy,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec19, 0.0);
                u_xlat52 = u_xlat15.z * u_xlat37.x + u_xlat52;
                vec3 txVec20 = vec3(u_xlat12.zw,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec20, 0.0);
                u_xlat52 = u_xlat15.w * u_xlat37.x + u_xlat52;
                vec3 txVec21 = vec3(u_xlat13.xy,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec21, 0.0);
                u_xlat52 = u_xlat16.x * u_xlat37.x + u_xlat52;
                vec3 txVec22 = vec3(u_xlat13.zw,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec22, 0.0);
                u_xlat52 = u_xlat16.y * u_xlat37.x + u_xlat52;
                vec3 txVec23 = vec3(u_xlat22.xy,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec23, 0.0);
                u_xlat52 = u_xlat16.z * u_xlat37.x + u_xlat52;
                vec3 txVec24 = vec3(u_xlat45.xy,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec24, 0.0);
                u_xlat52 = u_xlat16.w * u_xlat37.x + u_xlat52;
                vec3 txVec25 = vec3(u_xlat8.xy,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec25, 0.0);
                u_xlat52 = u_xlat4.x * u_xlat37.x + u_xlat52;
                vec3 txVec26 = vec3(u_xlat8.zw,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec26, 0.0);
                u_xlat52 = u_xlat4.y * u_xlat37.x + u_xlat52;
                vec3 txVec27 = vec3(u_xlat40.xy,u_xlat0.z);
                u_xlat37.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec27, 0.0);
                u_xlat52 = u_xlat4.z * u_xlat37.x + u_xlat52;
                vec3 txVec28 = vec3(u_xlat3.xy,u_xlat0.z);
                u_xlat3.x = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec28, 0.0);
                u_xlat51 = u_xlat4.w * u_xlat3.x + u_xlat52;
            }
        }
    } else {
        vec3 txVec29 = vec3(u_xlat0.xy,u_xlat0.z);
        u_xlat51 = textureLod(sampler2DShadow(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture), txVec29, 0.0);
    }
    u_xlat0.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat0.x = u_xlat51 * _MainLightShadowParams.x + u_xlat0.x;
    u_xlatb17 = 0.0>=u_xlat0.z;
    u_xlatb34 = u_xlat0.z>=1.0;
    u_xlatb17 = u_xlatb34 || u_xlatb17;
    u_xlat0.x = (u_xlatb17) ? 1.0 : u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    SV_Target0.w = u_xlat2.w;
    return;
}

