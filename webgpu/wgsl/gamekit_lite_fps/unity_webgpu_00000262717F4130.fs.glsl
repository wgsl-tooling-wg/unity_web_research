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
layout(set = 0, binding = 0, std140) uniform PGlobals {
	vec4 _Time;
	vec3 _WorldSpaceCameraPos;
	vec4 _WorldSpaceLightPos0;
	vec4 unity_SHAr;
	vec4 unity_SHAg;
	vec4 unity_SHAb;
	vec4 unity_OcclusionMaskSelector;
	mat4x4 unity_ObjectToWorld;
	vec4 unity_ProbeVolumeParams;
	mat4x4 unity_ProbeVolumeWorldToObject;
	vec3 unity_ProbeVolumeSizeInv;
	vec3 unity_ProbeVolumeMin;
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
layout(set = 0, binding = 1) uniform mediump texture2D _MainTex;
layout(set = 0, binding = 2) uniform mediump texture2D _FaceTex;
layout(set = 0, binding = 3) uniform mediump texture2D _OutlineTex;
layout(set = 0, binding = 4) uniform mediump texture2D _BumpMap;
layout(set = 0, binding = 5) uniform mediump textureCube _Cube;
layout(set = 0, binding = 6) uniform highp texture3D unity_ProbeVolumeSH;
layout(location = 0) in highp vec4 vs_TEXCOORD0;
layout(location = 1) in highp vec2 vs_TEXCOORD1;
layout(location = 2) in highp vec2 vs_TEXCOORD5;
layout(location = 3) in highp vec4 vs_TEXCOORD2;
layout(location = 4) in highp vec4 vs_TEXCOORD3;
layout(location = 5) in highp vec4 vs_TEXCOORD4;
layout(location = 6) in highp vec4 vs_COLOR0;
layout(location = 7) in highp vec3 vs_TEXCOORD6;
layout(location = 8) in highp vec3 vs_TEXCOORD7;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
float u_xlat11;
vec2 u_xlat12;
bool u_xlatb12;
float u_xlat14;
float u_xlat18;
float u_xlat20;
float u_xlat27;
float u_xlat28;
float u_xlat29;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
layout(set = 0, binding = 7) uniform highp  sampler samplerunity_ProbeVolumeSH;
layout(set = 0, binding = 8) uniform mediump  sampler sampler_FaceTex;
layout(set = 0, binding = 9) uniform mediump  sampler sampler_OutlineTex;
layout(set = 0, binding = 10) uniform mediump  sampler sampler_BumpMap;
layout(set = 0, binding = 11) uniform mediump  sampler sampler_Cube;
layout(set = 0, binding = 12) uniform mediump  sampler sampler_MainTex;
void main()
{
    u_xlat9.x = vs_TEXCOORD2.w;
    u_xlat9.y = vs_TEXCOORD3.w;
    u_xlat9.z = vs_TEXCOORD4.w;
    u_xlat1.xyz = (-u_xlat9.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat3.xy).w;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.y = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat2.xy).w;
    u_xlat4.z = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat3.zw).w;
    u_xlat4.w = texture(sampler2D(_MainTex, sampler_MainTex), u_xlat2.zw).w;
    u_xlat28 = texture(sampler2D(_MainTex, sampler_MainTex), vs_TEXCOORD0.xy).w;
    u_xlat28 = (-u_xlat28) + 0.5;
    u_xlat28 = u_xlat28 + (-vs_TEXCOORD5.x);
    u_xlat28 = u_xlat28 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat2.xz = u_xlat2.xy * vs_TEXCOORD5.yy;
    u_xlat3 = vs_COLOR0 * _FaceColor;
    u_xlat29 = vs_COLOR0.w * _OutlineColor.w;
    u_xlat5.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat5 = texture(sampler2D(_FaceTex, sampler_FaceTex), u_xlat5.xy);
    u_xlat3 = u_xlat3 * u_xlat5;
    u_xlat5.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat5 = texture(sampler2D(_OutlineTex, sampler_OutlineTex), u_xlat5.xy);
    u_xlat5.xyz = u_xlat5.xyz * _OutlineColor.xyz;
    u_xlat6.w = u_xlat29 * u_xlat5.w;
    u_xlat29 = (-u_xlat2.x) * 0.5 + u_xlat28;
    u_xlat20 = u_xlat2.z * 0.5 + u_xlat29;
    u_xlat11 = u_xlat2.y * vs_TEXCOORD5.y + 1.0;
    u_xlat11 = u_xlat20 / u_xlat11;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat11 = (-u_xlat11) + 1.0;
    u_xlat28 = u_xlat2.x * 0.5 + u_xlat28;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat28 * u_xlat2.x;
    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * u_xlat6.www;
    u_xlat5 = (-u_xlat3) + u_xlat6;
    u_xlat3 = u_xlat2.xxxx * u_xlat5 + u_xlat3;
    u_xlat2 = vec4(u_xlat11) * u_xlat3;
    u_xlat3.x = max(u_xlat2.w, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz / u_xlat3.xxx;
    u_xlat3.x = _ShaderFlags * 0.5;
    u_xlatb12 = u_xlat3.x>=(-u_xlat3.x);
    u_xlat3.x = fract(abs(u_xlat3.x));
    u_xlat3.x = (u_xlatb12) ? u_xlat3.x : (-u_xlat3.x);
    u_xlatb3 = u_xlat3.x>=0.5;
    u_xlat12.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat4 = u_xlat12.xxxx + u_xlat4;
    u_xlat12.x = _BevelWidth + _OutlineWidth;
    u_xlat12.x = max(u_xlat12.x, 0.00999999978);
    u_xlat4 = u_xlat4 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4 = u_xlat4 / u_xlat12.xxxx;
    u_xlat4 = u_xlat4 + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
    u_xlat5 = u_xlat4 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat5 = -abs(u_xlat5) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = (bool(u_xlatb3)) ? u_xlat5 : u_xlat4;
    u_xlat5 = u_xlat4 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat5 = sin(u_xlat5);
    u_xlat5 = (-u_xlat4) + u_xlat5;
    u_xlat4 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat5 + u_xlat4;
    u_xlat3.x = (-_BevelClamp) + 1.0;
    u_xlat4 = min(u_xlat3.xxxx, u_xlat4);
    u_xlat3.x = u_xlat12.x * _Bevel;
    u_xlat3.x = u_xlat3.x * _GradientScale;
    u_xlat3.x = u_xlat3.x * -2.0;
    u_xlat12.xy = u_xlat3.xx * u_xlat4.xz;
    u_xlat3.yz = u_xlat4.wy * u_xlat3.xx + (-u_xlat12.yx);
    u_xlat3.x = float(-1.0);
    u_xlat3.w = float(1.0);
    u_xlat30 = dot(u_xlat3.zw, u_xlat3.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat4.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat4.x = u_xlat30 * u_xlat3.z;
    u_xlat30 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz;
    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.zxy * u_xlat3.yzx + (-u_xlat5.xyz);
    u_xlat4.xyz = texture(sampler2D(_BumpMap, sampler_BumpMap), vs_TEXCOORD0.zw).xyw;
    u_xlat4.x = u_xlat4.z * u_xlat4.x;
    u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat30 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat30 = (-u_xlat30) + 1.0;
    u_xlat4.z = sqrt(u_xlat30);
    u_xlat30 = (-_BumpFace) + _BumpOutline;
    u_xlat30 = u_xlat28 * u_xlat30 + _BumpFace;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat30) + vec3(-0.0, -0.0, -1.0);
    u_xlat4.xyz = u_xlat2.www * u_xlat4.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat4.xyz);
    u_xlat30 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat3.yyy * unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat4.xyz = unity_ObjectToWorld[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat4.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat4.xyz = u_xlat4.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat4.xyz = texture(samplerCube(_Cube, sampler_Cube), u_xlat4.xyz).xyz;
    u_xlat5.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + _ReflectFaceColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat30 = (-_FaceShininess) + _OutlineShininess;
    u_xlat28 = u_xlat28 * u_xlat30 + _FaceShininess;
    u_xlatb30 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb30){
        u_xlatb31 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat5.xyz;
        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb31)) ? u_xlat5.xyz : u_xlat9.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat31 = u_xlat5.y * 0.25 + 0.75;
        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat31, u_xlat14);
        u_xlat5 = texture(sampler3D(unity_ProbeVolumeSH, samplerunity_ProbeVolumeSH), u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat31 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat3.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat3.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat3.xyz));
    u_xlat3.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz;
    u_xlat3.xyz = vec3(u_xlat31) * _LightColor0.xyz;
    if(u_xlatb30){
        u_xlatb30 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat6.xyz;
        u_xlat6.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat9.xyz = (bool(u_xlatb30)) ? u_xlat6.xyz : u_xlat9.xyz;
        u_xlat9.xyz = u_xlat9.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat9.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9.x = u_xlat6.y * 0.25;
        u_xlat18 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat27 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat9.x = max(u_xlat18, u_xlat9.x);
        u_xlat6.x = min(u_xlat27, u_xlat9.x);
        u_xlat7 = texture(sampler3D(unity_ProbeVolumeSH, samplerunity_ProbeVolumeSH), u_xlat6.xzw);
        u_xlat9.xyz = u_xlat6.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat8 = texture(sampler3D(unity_ProbeVolumeSH, samplerunity_ProbeVolumeSH), u_xlat9.xyz);
        u_xlat9.xyz = u_xlat6.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat6 = texture(sampler3D(unity_ProbeVolumeSH, samplerunity_ProbeVolumeSH), u_xlat9.xyz);
        u_xlat5.w = 1.0;
        u_xlat7.x = dot(u_xlat7, u_xlat5);
        u_xlat7.y = dot(u_xlat8, u_xlat5);
        u_xlat7.z = dot(u_xlat6, u_xlat5);
    } else {
        u_xlat5.w = 1.0;
        u_xlat7.x = dot(unity_SHAr, u_xlat5);
        u_xlat7.y = dot(unity_SHAg, u_xlat5);
        u_xlat7.z = dot(unity_SHAb, u_xlat5);
    }
    u_xlat0.yzw = u_xlat7.xyz + vs_TEXCOORD7.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.x = u_xlat28 * 128.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat10.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat10.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.yzw + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat2.www + u_xlat0.xyz;
    SV_Target0.w = u_xlat2.w;
    return;
}

