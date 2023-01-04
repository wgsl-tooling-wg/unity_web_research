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
	vec4 _ProjectionParams;
	vec4 _SSAOParams;
	vec4 _CameraViewTopLeftCorner[2];
	mat4x4 _CameraViewProjections[2];
	vec4 _CameraViewXExtent[2];
	vec4 _CameraViewYExtent[2];
	vec4 _CameraViewZExtent[2];
	vec4 _SSAOBlueNoiseParams;
};
layout(set = 0, binding = 0) uniform highp texture2D _CameraDepthTexture;
layout(set = 0, binding = 1) uniform highp texture2D _CameraNormalsTexture;
layout(set = 0, binding = 2) uniform mediump texture2D _BlueNoiseTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 3) uniform mediump  sampler sampler_PointRepeat;
layout(set = 0, binding = 4) uniform highp  sampler sampler_CameraDepthTexture;
layout(set = 0, binding = 5) uniform highp  sampler sampler_CameraNormalsTexture;
void main()
{
float u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat10;
vec3 u_xlat11;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
bool u_xlatb24;
    u_xlat0 = texture(sampler2D(_CameraDepthTexture, sampler_CameraDepthTexture), vs_TEXCOORD0.xy, _GlobalMipBias.x).x;
    u_xlatb7 = u_xlat0<9.99999975e-06;
    if(u_xlatb7){
        SV_Target0 = vec4(0.0, 0.5, 0.5, 0.5);
        return;
    }
    u_xlat7.x = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat0 = (-u_xlat7.x) * u_xlat0 + _ProjectionParams.z;
    u_xlatb14 = _SSAOParams.w<u_xlat0;
    if(u_xlatb14){
        SV_Target0 = vec4(0.0, 0.5, 0.5, 0.5);
        return;
    }
    u_xlat1.xyz = texture(sampler2D(_CameraNormalsTexture, sampler_CameraNormalsTexture), vs_TEXCOORD0.xy, _GlobalMipBias.x).xyz;
    u_xlat14.x = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat21 = u_xlat0 * _ProjectionParams.w;
    u_xlat2.xyz = _CameraViewXExtent[0].xyz * vs_TEXCOORD0.xxx + _CameraViewTopLeftCorner[0].xyz;
    u_xlat2.xyz = _CameraViewYExtent[0].xyz * u_xlat14.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _CameraViewZExtent[0].xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat14.xy = vs_TEXCOORD0.xy + _SSAOBlueNoiseParams.zw;
    u_xlat3.xy = u_xlat14.xy * _SSAOBlueNoiseParams.xy;
    u_xlat22 = texture(sampler2D(_BlueNoiseTexture, sampler_PointRepeat), u_xlat3.xy, _GlobalMipBias.x).w;
    u_xlat23 = fract(u_xlat22);
    u_xlat3.z = u_xlat23 * 2.0 + -1.0;
    u_xlat22 = u_xlat22 + 0.9296875;
    u_xlat22 = u_xlat22 * 628.318542;
    u_xlat23 = (-u_xlat3.z) * u_xlat3.z + 1.0;
    u_xlat23 = sqrt(u_xlat23);
    u_xlat4.x = sin(u_xlat22);
    u_xlat5.x = cos(u_xlat22);
    u_xlat3.x = u_xlat23 * u_xlat5.x;
    u_xlat3.y = u_xlat23 * u_xlat4.x;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlatb22 = u_xlat22>=0.0;
    u_xlat22 = (u_xlatb22) ? 1.0 : -1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _SSAOParams.yyy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + u_xlat2.xyz;
    u_xlat10.xz = u_xlat3.yy * _CameraViewProjections[1 / 4][1 % 4].xy;
    u_xlat3.xy = _CameraViewProjections[0 / 4][0 % 4].xy * u_xlat3.xx + u_xlat10.xz;
    u_xlat3.xy = _CameraViewProjections[2 / 4][2 % 4].xy * u_xlat3.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(1.0, 1.0);
    u_xlat3.xy = u_xlat3.xy * vec2(0.5, 0.5);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat22 = texture(sampler2D(_CameraDepthTexture, sampler_CameraDepthTexture), u_xlat3.xy, _GlobalMipBias.x).x;
    u_xlat23 = (-u_xlat7.x) * u_xlat22 + _ProjectionParams.z;
    u_xlat17 = u_xlat0 + (-u_xlat23);
    u_xlatb17 = abs(u_xlat17)<_SSAOParams.y;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlatb22 = 9.99999975e-06<u_xlat22;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat22 = u_xlat22 * u_xlat17;
    u_xlat10.x = (-u_xlat3.y) + 1.0;
    u_xlat23 = u_xlat23 * _ProjectionParams.w;
    u_xlat3.xzw = _CameraViewXExtent[0].xyz * u_xlat3.xxx + _CameraViewTopLeftCorner[0].xyz;
    u_xlat3.xyz = _CameraViewYExtent[0].xyz * u_xlat10.xxx + u_xlat3.xzw;
    u_xlat3.xyz = _CameraViewZExtent[0].xyz * vec3(u_xlat23) + u_xlat3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat3.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat23 = (-u_xlat0) * 0.00400000019 + u_xlat23;
    u_xlat23 = max(u_xlat23, 0.0);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat3.x = u_xlat3.x + 9.99999975e-05;
    u_xlat3.x = float(1.0) / float(u_xlat3.x);
    u_xlat23 = u_xlat23 * u_xlat3.x;
    u_xlat3 = u_xlat14.xyxy * _SSAOBlueNoiseParams.xyxy + vec4(0.25, 0.25, 0.5, 0.5);
    u_xlat3.x = texture(sampler2D(_BlueNoiseTexture, sampler_PointRepeat), u_xlat3.xy, _GlobalMipBias.x).w;
    u_xlat3.xy = u_xlat3.xx + vec2(0.33984375, 0.76171875);
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat4.z = u_xlat3.x * 2.0 + -1.0;
    u_xlat3.x = u_xlat3.y * 628.318542;
    u_xlat10.x = (-u_xlat4.z) * u_xlat4.z + 1.0;
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat5.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat4.x = u_xlat10.x * u_xlat5.x;
    u_xlat4.y = u_xlat3.x * u_xlat10.x;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlatb3 = u_xlat3.x>=0.0;
    u_xlat3.x = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _SSAOParams.yyy;
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.15625, 0.15625, 0.15625) + u_xlat2.xyz;
    u_xlat3.xy = u_xlat4.yy * _CameraViewProjections[1 / 4][1 % 4].xy;
    u_xlat3.xy = _CameraViewProjections[0 / 4][0 % 4].xy * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = _CameraViewProjections[2 / 4][2 % 4].xy * u_xlat4.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(1.0, 1.0);
    u_xlat3.xy = u_xlat3.xy * vec2(0.5, 0.5);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.x = texture(sampler2D(_CameraDepthTexture, sampler_CameraDepthTexture), u_xlat3.xy, _GlobalMipBias.x).x;
    u_xlat11.x = (-u_xlat7.x) * u_xlat4.x + _ProjectionParams.z;
    u_xlat18 = u_xlat0 + (-u_xlat11.x);
    u_xlatb4.z = abs(u_xlat18)<_SSAOParams.y;
    u_xlatb4.x = 9.99999975e-06<u_xlat4.x;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.z = u_xlatb4.z ? float(1.0) : 0.0;
;
    u_xlat4.x = u_xlat4.x * u_xlat4.z;
    u_xlat10.x = (-u_xlat3.y) + 1.0;
    u_xlat11.x = u_xlat11.x * _ProjectionParams.w;
    u_xlat5.xyz = _CameraViewXExtent[0].xyz * u_xlat3.xxx + _CameraViewTopLeftCorner[0].xyz;
    u_xlat5.xyz = _CameraViewYExtent[0].xyz * u_xlat10.xxx + u_xlat5.xyz;
    u_xlat11.xyz = _CameraViewZExtent[0].xyz * u_xlat11.xxx + u_xlat5.xyz;
    u_xlat11.xyz = (-u_xlat2.xyz) + u_xlat11.xyz;
    u_xlat3.x = dot(u_xlat11.xyz, u_xlat1.xyz);
    u_xlat3.x = (-u_xlat0) * 0.00400000019 + u_xlat3.x;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat10.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat10.x + 9.99999975e-05;
    u_xlat10.x = float(1.0) / float(u_xlat10.x);
    u_xlat3.x = u_xlat10.x * u_xlat3.x;
    u_xlat3.x = u_xlat4.x * u_xlat3.x;
    u_xlat22 = u_xlat23 * u_xlat22 + u_xlat3.x;
    u_xlat23 = texture(sampler2D(_BlueNoiseTexture, sampler_PointRepeat), u_xlat3.zw, _GlobalMipBias.x).w;
    u_xlat3.xy = vec2(u_xlat23) + vec2(0.75390625, 0.133333296);
    u_xlat23 = fract(u_xlat3.x);
    u_xlat4.z = u_xlat23 * 2.0 + -1.0;
    u_xlat23 = u_xlat3.y * 628.318542;
    u_xlat3.x = (-u_xlat4.z) * u_xlat4.z + 1.0;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat5.x = sin(u_xlat23);
    u_xlat6 = cos(u_xlat23);
    u_xlat4.x = u_xlat3.x * u_xlat6;
    u_xlat4.y = u_xlat3.x * u_xlat5.x;
    u_xlat23 = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlatb23 = u_xlat23>=0.0;
    u_xlat23 = (u_xlatb23) ? 1.0 : -1.0;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _SSAOParams.yyy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.324999988, 0.324999988, 0.324999988) + u_xlat2.xyz;
    u_xlat10.xz = u_xlat3.yy * _CameraViewProjections[1 / 4][1 % 4].xy;
    u_xlat3.xy = _CameraViewProjections[0 / 4][0 % 4].xy * u_xlat3.xx + u_xlat10.xz;
    u_xlat3.xy = _CameraViewProjections[2 / 4][2 % 4].xy * u_xlat3.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(1.0, 1.0);
    u_xlat3.xy = u_xlat3.xy * vec2(0.5, 0.5);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat23 = texture(sampler2D(_CameraDepthTexture, sampler_CameraDepthTexture), u_xlat3.xy, _GlobalMipBias.x).x;
    u_xlat17 = (-u_xlat7.x) * u_xlat23 + _ProjectionParams.z;
    u_xlat24 = u_xlat0 + (-u_xlat17);
    u_xlatb24 = abs(u_xlat24)<_SSAOParams.y;
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlatb23 = 9.99999975e-06<u_xlat23;
    u_xlat23 = u_xlatb23 ? 1.0 : float(0.0);
    u_xlat23 = u_xlat23 * u_xlat24;
    u_xlat10.x = (-u_xlat3.y) + 1.0;
    u_xlat17 = u_xlat17 * _ProjectionParams.w;
    u_xlat4.xyz = _CameraViewXExtent[0].xyz * u_xlat3.xxx + _CameraViewTopLeftCorner[0].xyz;
    u_xlat3.xyw = _CameraViewYExtent[0].xyz * u_xlat10.xxx + u_xlat4.xyz;
    u_xlat3.xyz = _CameraViewZExtent[0].xyz * vec3(u_xlat17) + u_xlat3.xyw;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat3.xyz;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat24 = (-u_xlat0) * 0.00400000019 + u_xlat24;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat3.x = u_xlat3.x + 9.99999975e-05;
    u_xlat3.x = float(1.0) / float(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * u_xlat24;
    u_xlat22 = u_xlat3.x * u_xlat23 + u_xlat22;
    u_xlat14.xy = u_xlat14.xy * _SSAOBlueNoiseParams.xy + vec2(0.75, 0.75);
    u_xlat14.x = texture(sampler2D(_BlueNoiseTexture, sampler_PointRepeat), u_xlat14.xy, _GlobalMipBias.x).w;
    u_xlat14.xy = u_xlat14.xx + vec2(0.56640625, 0.015625);
    u_xlat14.x = fract(u_xlat14.x);
    u_xlat3.z = u_xlat14.x * 2.0 + -1.0;
    u_xlat14.x = u_xlat14.y * 628.318542;
    u_xlat21 = (-u_xlat3.z) * u_xlat3.z + 1.0;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5.x = cos(u_xlat14.x);
    u_xlat3.x = u_xlat21 * u_xlat5.x;
    u_xlat3.y = u_xlat21 * u_xlat4.x;
    u_xlat14.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlatb14 = u_xlat14.x>=0.0;
    u_xlat14.x = (u_xlatb14) ? 1.0 : -1.0;
    u_xlat3.xyz = u_xlat14.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _SSAOParams.yyy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.606249988, 0.606249988, 0.606249988) + u_xlat2.xyz;
    u_xlat14.xy = u_xlat3.yy * _CameraViewProjections[1 / 4][1 % 4].xy;
    u_xlat14.xy = _CameraViewProjections[0 / 4][0 % 4].xy * u_xlat3.xx + u_xlat14.xy;
    u_xlat14.xy = _CameraViewProjections[2 / 4][2 % 4].xy * u_xlat3.zz + u_xlat14.xy;
    u_xlat14.xy = u_xlat14.xy + vec2(1.0, 1.0);
    u_xlat14.xy = u_xlat14.xy * vec2(0.5, 0.5);
    u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
    u_xlat23 = texture(sampler2D(_CameraDepthTexture, sampler_CameraDepthTexture), u_xlat14.xy, _GlobalMipBias.x).x;
    u_xlat7.x = (-u_xlat7.x) * u_xlat23 + _ProjectionParams.z;
    u_xlat3.x = (-u_xlat7.x) + u_xlat0;
    u_xlatb3 = abs(u_xlat3.x)<_SSAOParams.y;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlatb23 = 9.99999975e-06<u_xlat23;
    u_xlat23 = u_xlatb23 ? 1.0 : float(0.0);
    u_xlat23 = u_xlat23 * u_xlat3.x;
    u_xlat21 = (-u_xlat14.y) + 1.0;
    u_xlat7.x = u_xlat7.x * _ProjectionParams.w;
    u_xlat3.xyz = _CameraViewXExtent[0].xyz * u_xlat14.xxx + _CameraViewTopLeftCorner[0].xyz;
    u_xlat3.xyz = _CameraViewYExtent[0].xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat7.xyz = _CameraViewZExtent[0].xyz * u_xlat7.xxx + u_xlat3.xyz;
    u_xlat7.xyz = (-u_xlat2.xyz) + u_xlat7.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat2.x = (-u_xlat0) * 0.00400000019 + u_xlat2.x;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = u_xlat7.x + 9.99999975e-05;
    u_xlat7.x = float(1.0) / float(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * u_xlat2.x;
    u_xlat7.x = u_xlat7.x * u_xlat23 + u_xlat22;
    u_xlat7.x = u_xlat7.x * _SSAOParams.y;
    u_xlat14.x = float(1.0) / float(_SSAOParams.w);
    u_xlat0 = (-u_xlat0) * u_xlat14.x + 1.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat7.x = u_xlat7.x * _SSAOParams.x;
    u_xlat0 = u_xlat0 * u_xlat7.x;
    u_xlat0 = u_xlat0 * 0.25;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * 0.600000024;
    SV_Target0.x = exp2(u_xlat0);
    SV_Target0.yzw = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    return;
}

