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
	vec4 _Time;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _WorldSpaceLightPos0;
	vec4 unity_SHAr;
	vec4 unity_SHAg;
	vec4 unity_SHAb;
	mat4x4 unity_ObjectToWorld;
	vec4 unity_FogColor;
	vec4 unity_FogParams;
	vec4 _LightColor0;
	vec4 _SpecColor;
	float _FaceUVSpeedX;
	float _FaceUVSpeedY;
	vec4 _FaceColor;
	float _OutlineSoftness;
	float _OutlineUVSpeedX;
	float _OutlineUVSpeedY;
	vec4 _OutlineColor;
	float _OutlineWidth;
	float _Bevel;
	float _BevelOffset;
	float _BevelWidth;
	float _BevelClamp;
	float _BevelRoundness;
	float _BumpOutline;
	float _BumpFace;
	vec4 _ReflectFaceColor;
	vec4 _ReflectOutlineColor;
	float _ShaderFlags;
	float _ScaleRatioA;
	float _TextureWidth;
	float _TextureHeight;
	float _GradientScale;
	float _FaceShininess;
	float _OutlineShininess;
};
layout(set = 0, binding = 0) uniform mediump texture2D _MainTex;
layout(set = 0, binding = 1) uniform mediump texture2D _FaceTex;
layout(set = 0, binding = 2) uniform mediump texture2D _OutlineTex;
layout(set = 0, binding = 3) uniform mediump texture2D _BumpMap;
layout(set = 0, binding = 4) uniform mediump textureCube _Cube;
layout(location = 0) in highp vec4 vs_TEXCOORD0;
layout(location = 1) in highp vec2 vs_TEXCOORD1;
layout(location = 2) in highp vec2 vs_TEXCOORD5;
layout(location = 3) in highp vec4 vs_TEXCOORD2;
layout(location = 4) in highp vec4 vs_TEXCOORD3;
layout(location = 5) in highp vec4 vs_TEXCOORD4;
layout(location = 6) in highp vec4 vs_COLOR0;
layout(location = 7) in highp vec3 vs_TEXCOORD6;
layout(location = 8) in highp float vs_TEXCOORD8;
layout(location = 9) in highp vec3 vs_TEXCOORD7;
layout(location = 0) out highp vec4 SV_Target0;
layout(set = 0, binding = 5) uniform mediump  sampler sampler_FaceTex;
layout(set = 0, binding = 6) uniform mediump  sampler sampler_OutlineTex;
layout(set = 0, binding = 7) uniform mediump  sampler sampler_BumpMap;
layout(set = 0, binding = 8) uniform mediump  sampler sampler_Cube;
layout(set = 0, binding = 9) uniform mediump  sampler sampler_MainTex;
void main()
{
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
bool u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb9;
float u_xlat10;
float u_xlat18;
float u_xlat19;
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat2.xy).w;
    u_xlat3.z = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat2.zw).w;
    u_xlat3.y = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat1.xy).w;
    u_xlat3.w = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat1.zw).w;
    u_xlat1 = vec4(u_xlat18) + u_xlat3;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat18 = _BevelWidth + _OutlineWidth;
    u_xlat18 = max(u_xlat18, 0.00999999978);
    u_xlat1 = u_xlat1 / vec4(u_xlat18);
    u_xlat18 = u_xlat18 * _Bevel;
    u_xlat18 = u_xlat18 * _GradientScale;
    u_xlat18 = u_xlat18 * -2.0;
    u_xlat1 = u_xlat1 + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat2 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat3.x = _ShaderFlags * 0.5;
    u_xlatb9 = u_xlat3.x>=(-u_xlat3.x);
    u_xlat3.x = fract(abs(u_xlat3.x));
    u_xlat3.x = (u_xlatb9) ? u_xlat3.x : (-u_xlat3.x);
    u_xlatb3 = u_xlat3.x>=0.5;
    u_xlat1 = (bool(u_xlatb3)) ? u_xlat2 : u_xlat1;
    u_xlat2 = u_xlat1 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat1;
    u_xlat2.x = (-_BevelClamp) + 1.0;
    u_xlat1 = min(u_xlat1, u_xlat2.xxxx);
    u_xlat1.xz = vec2(u_xlat18) * u_xlat1.xz;
    u_xlat1.yz = u_xlat1.wy * vec2(u_xlat18) + (-u_xlat1.zx);
    u_xlat1.x = float(-1.0);
    u_xlat1.w = float(1.0);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.x = u_xlat19 * u_xlat1.z;
    u_xlat2.yz = vec2(u_xlat19) * vec2(1.0, 0.0);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat2 = texture(sampler2D(_OutlineTex, sampler_OutlineTex), u_xlat2.xy);
    u_xlat2.xyz = u_xlat2.xyz * _OutlineColor.xyz;
    u_xlat18 = vs_COLOR0.w * _OutlineColor.w;
    u_xlat3.w = u_xlat2.w * u_xlat18;
    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
    u_xlat2.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat2 = texture(sampler2D(_FaceTex, sampler_FaceTex), u_xlat2.xy);
    u_xlat4 = vs_COLOR0 * _FaceColor;
    u_xlat2 = u_xlat2 * u_xlat4;
    u_xlat2.xyz = u_xlat2.www * u_xlat2.xyz;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat18 = _OutlineWidth * _ScaleRatioA;
    u_xlat18 = u_xlat18 * vs_TEXCOORD5.y;
    u_xlat19 = min(u_xlat18, 1.0);
    u_xlat19 = sqrt(u_xlat19);
    u_xlat4.x = texture(sampler2D(_MainTex, sampler_MainTex), vs_TEXCOORD0.xy).w;
    u_xlat4.x = (-u_xlat4.x) + 0.5;
    u_xlat4.x = u_xlat4.x + (-vs_TEXCOORD5.x);
    u_xlat4.x = u_xlat4.x * vs_TEXCOORD5.y + 0.5;
    u_xlat10 = u_xlat18 * 0.5 + u_xlat4.x;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat4.x;
    u_xlat19 = u_xlat19 * u_xlat10;
    u_xlat2 = vec4(u_xlat19) * u_xlat3 + u_xlat2;
    u_xlat19 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat19 * vs_TEXCOORD5.y;
    u_xlat19 = u_xlat19 * vs_TEXCOORD5.y + 1.0;
    u_xlat18 = u_xlat3.x * 0.5 + u_xlat18;
    u_xlat18 = u_xlat18 / u_xlat19;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat2 = vec4(u_xlat18) * u_xlat2;
    u_xlat18 = (-_BumpFace) + _BumpOutline;
    u_xlat18 = u_xlat10 * u_xlat18 + _BumpFace;
    u_xlat3.xyz = texture(sampler2D(_BumpMap, sampler_BumpMap), vs_TEXCOORD0.zw).xyw;
    u_xlat3.x = u_xlat3.z * u_xlat3.x;
    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat19 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat19 = min(u_xlat19, 1.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat3.z = sqrt(u_xlat19);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat18) + vec3(-0.0, -0.0, -1.0);
    u_xlat3.xyz = u_xlat2.www * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat3.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat3.x = dot(vs_TEXCOORD2.xyz, (-u_xlat1.xyz));
    u_xlat3.y = dot(vs_TEXCOORD3.xyz, (-u_xlat1.xyz));
    u_xlat3.z = dot(vs_TEXCOORD4.xyz, (-u_xlat1.xyz));
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat6.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat6.x = u_xlat10 * u_xlat6.x + _FaceShininess;
    u_xlat6.x = u_xlat6.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat6.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat18 = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat19 = max(u_xlat2.w, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz / vec3(u_xlat19);
    u_xlat4.xzw = u_xlat2.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat4.xzw * vec3(u_xlat18) + u_xlat0.xyz;
    u_xlat3.w = 1.0;
    u_xlat5.x = dot(unity_SHAr, u_xlat3);
    u_xlat5.y = dot(unity_SHAg, u_xlat3);
    u_xlat5.z = dot(unity_SHAb, u_xlat3);
    u_xlat3.xyz = u_xlat5.xyz + vs_TEXCOORD7.xyz;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat2.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz + _ReflectFaceColor.xyz;
    u_xlat3.xyz = u_xlat1.yyy * unity_ObjectToWorld[1].xyz;
    u_xlat1.xyw = unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat18 = dot(vs_TEXCOORD6.xyz, u_xlat1.xyz);
    u_xlat18 = u_xlat18 + u_xlat18;
    u_xlat1.xyz = u_xlat1.xyz * (-vec3(u_xlat18)) + vs_TEXCOORD6.xyz;
    u_xlat1.xyz = texture(samplerCube(_Cube, sampler_Cube), u_xlat1.xyz).xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.www + u_xlat0.xyz;
    SV_Target0.w = u_xlat2.w;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat18 = vs_TEXCOORD8 / _ProjectionParams.y;
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = u_xlat18 * _ProjectionParams.z;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = u_xlat18 * unity_FogParams.x;
    u_xlat18 = u_xlat18 * (-u_xlat18);
    u_xlat18 = exp2(u_xlat18);
    SV_Target0.xyz = vec3(u_xlat18) * u_xlat0.xyz + unity_FogColor.xyz;
    return;
}

