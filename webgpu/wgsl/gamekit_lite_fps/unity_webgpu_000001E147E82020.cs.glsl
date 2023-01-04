#version 440

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
layout(set = 0, binding = 0, std140) uniform CB1 {
	vec4 gInvThicknessTable[3];
	vec4 gSampleWeightTable[3];
	vec4 gInvSliceDimension;
	vec2 AdditionalParams;
};
layout(set = 0, binding = 1) uniform highp texture2D DepthTex;
writeonly layout(set = 0, binding = 2, r32f) highp uniform image2D Occlusion_origX0X;
vec4 u_xlat0;
ivec2 u_xlati0;
vec4 u_xlat1;
ivec4 u_xlati1;
vec3 u_xlat2;
vec3 u_xlat3;
ivec4 u_xlati3;
ivec4 u_xlati4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat8;
float u_xlat10;
ivec2 u_xlati10;
vec2 u_xlat11;
float u_xlat12;
float u_xlat15;
int u_xlati15;
float u_xlat16;
float u_xlat17;
shared struct {
	uint value[1];
} TGSM0[1024];
layout(local_size_x = 16, local_size_y = 16, local_size_z = 1) in;
layout(set = 0, binding = 3) uniform highp  sampler samplerDepthTex;
void main()
{
    u_xlati0.xy = ivec2(gl_LocalInvocationID.xy) + ivec2(gl_GlobalInvocationID.xy);
    u_xlati0.xy = u_xlati0.xy + ivec2(int(0xFFFFFFF9u), int(0xFFFFFFF9u));
    u_xlat0.xy = vec2(u_xlati0.xy);
    u_xlat0.xy = u_xlat0.xy * gInvSliceDimension.xy;
    u_xlat0 = textureGather(sampler2D(DepthTex, samplerDepthTex), u_xlat0.xy);
    u_xlati1.x = int(gl_LocalInvocationID.x) << 1;
    u_xlati1.x = int(gl_LocalInvocationID.y) * 64 + u_xlati1.x;
    TGSM0[u_xlati1.x].value[(0 >> 2)] = floatBitsToUint(u_xlat0.w);
    u_xlati15 = u_xlati1.x + 1;
    TGSM0[u_xlati15].value[(0 >> 2)] = floatBitsToUint(u_xlat0.z);
    u_xlati10.xy = u_xlati1.xx + ivec2(32, 33);
    TGSM0[u_xlati10.x].value[(0 >> 2)] = floatBitsToUint(u_xlat0.x);
    TGSM0[u_xlati10.y].value[(0 >> 2)] = floatBitsToUint(u_xlat0.y);
    //memoryBarrierShared;
    barrier();
    u_xlati0.x = int(gl_LocalInvocationID.y) * 32 + int(gl_LocalInvocationID.x);
    u_xlati1 = u_xlati0.xxxx + ivec4(256, 264, 268, 260);
    u_xlat5.x = uintBitsToFloat(TGSM0[u_xlati1.w].value[(0 >> 2) + 0]);
    u_xlat10 = uintBitsToFloat(TGSM0[u_xlati1.y].value[(0 >> 2) + 0]);
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat6.xz = vec2(u_xlat10) * gInvThicknessTable[0].yw;
    u_xlat2.xy = gInvThicknessTable[0].yw + vec2(-0.5, -0.5);
    u_xlat5.x = u_xlat5.x * u_xlat6.x + (-u_xlat2.x);
    u_xlat15 = u_xlat5.x * AdditionalParams.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat11.x = uintBitsToFloat(TGSM0[u_xlati1.z].value[(0 >> 2) + 0]);
    u_xlat1.x = uintBitsToFloat(TGSM0[u_xlati1.x].value[(0 >> 2) + 0]);
    u_xlat1.x = u_xlat1.x * u_xlat6.z + (-u_xlat2.y);
    u_xlat11.x = u_xlat11.x * u_xlat6.x + (-u_xlat2.x);
    u_xlat12 = max(u_xlat15, u_xlat11.x);
    u_xlat11.x = u_xlat11.x * AdditionalParams.x;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat5.x = max(u_xlat5.x, u_xlat11.x);
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat5.x = u_xlat5.x + u_xlat12;
    u_xlat5.x = (-u_xlat11.x) * u_xlat15 + u_xlat5.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlati3 = u_xlati0.xxxx + ivec4(392, 136, 272, 520);
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati3.y].value[(0 >> 2) + 0]);
    u_xlat15 = u_xlat15 * u_xlat6.x + (-u_xlat2.x);
    u_xlat11.x = u_xlat15 * AdditionalParams.x;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat12 = uintBitsToFloat(TGSM0[u_xlati3.x].value[(0 >> 2) + 0]);
    u_xlat6.x = u_xlat12 * u_xlat6.x + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat11.x, u_xlat6.x);
    u_xlat6.x = u_xlat6.x * AdditionalParams.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat15 = max(u_xlat15, u_xlat6.x);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat15 = u_xlat15 + u_xlat2.x;
    u_xlat15 = (-u_xlat6.x) * u_xlat11.x + u_xlat15;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat5.x = u_xlat15 + u_xlat5.x;
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati3.w].value[(0 >> 2) + 0]);
    u_xlat6.x = uintBitsToFloat(TGSM0[u_xlati3.z].value[(0 >> 2) + 0]);
    u_xlat6.x = u_xlat6.x * u_xlat6.z + (-u_xlat2.y);
    u_xlat15 = u_xlat15 * u_xlat6.z + (-u_xlat2.y);
    u_xlati3 = u_xlati0.xxxx + ivec4(8, 326, 202, 330);
    u_xlat11.x = uintBitsToFloat(TGSM0[u_xlati3.x].value[(0 >> 2) + 0]);
    u_xlat11.x = u_xlat11.x * u_xlat6.z + (-u_xlat2.y);
    u_xlat16 = u_xlat11.x * AdditionalParams.x;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat2.x = max(u_xlat15, u_xlat16);
    u_xlat15 = u_xlat15 * AdditionalParams.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat11.x = max(u_xlat15, u_xlat11.x);
    u_xlat11.x = min(u_xlat11.x, 1.0);
    u_xlat11.x = u_xlat11.x + u_xlat2.x;
    u_xlat15 = (-u_xlat15) * u_xlat16 + u_xlat11.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat11.x = u_xlat1.x * AdditionalParams.x;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat1.w = max(u_xlat11.x, u_xlat6.x);
    u_xlat6.x = u_xlat6.x * AdditionalParams.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat1.x = max(u_xlat6.x, u_xlat1.x);
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 1.0));
    u_xlat1.x = u_xlat1.x + u_xlat1.w;
    u_xlat1.x = (-u_xlat6.x) * u_xlat11.x + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat5.z = u_xlat15 + u_xlat1.x;
    u_xlat5.xz = u_xlat5.xz * gSampleWeightTable[0].yw;
    u_xlat15 = u_xlat5.z * 0.5;
    u_xlat5.x = u_xlat5.x * 0.5 + u_xlat15;
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati3.z].value[(0 >> 2) + 0]);
    u_xlat1.xy = vec2(u_xlat10) * gInvThicknessTable[1].xz;
    u_xlat2.xyz = vec3(u_xlat10) * gInvThicknessTable[2].xwz;
    u_xlat11.xy = gInvThicknessTable[1].xz + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat15 * u_xlat1.x + (-u_xlat11.x);
    u_xlat15 = u_xlat10 * AdditionalParams.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat17 = uintBitsToFloat(TGSM0[u_xlati3.y].value[(0 >> 2) + 0]);
    u_xlat3.x = uintBitsToFloat(TGSM0[u_xlati3.w].value[(0 >> 2) + 0]);
    u_xlat3.x = u_xlat3.x * u_xlat1.x + (-u_xlat11.x);
    u_xlat17 = u_xlat17 * u_xlat1.x + (-u_xlat11.x);
    u_xlat8 = max(u_xlat15, u_xlat17);
    u_xlat17 = u_xlat17 * AdditionalParams.x;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat8 = min(u_xlat8, 1.0);
    u_xlat10 = max(u_xlat10, u_xlat17);
    u_xlat10 = min(u_xlat10, 1.0);
    u_xlat10 = u_xlat10 + u_xlat8;
    u_xlat10 = (-u_xlat17) * u_xlat15 + u_xlat10;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlati4 = u_xlati0.xxxx + ivec4(198, 388, 140, 396);
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati4.x].value[(0 >> 2) + 0]);
    u_xlat15 = u_xlat15 * u_xlat1.x + (-u_xlat11.x);
    u_xlat1.x = u_xlat15 * AdditionalParams.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat11.x = max(u_xlat1.x, u_xlat3.x);
    u_xlat17 = u_xlat3.x * AdditionalParams.x;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat11.x = min(u_xlat11.x, 1.0);
    u_xlat15 = max(u_xlat15, u_xlat17);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat15 = u_xlat15 + u_xlat11.x;
    u_xlat15 = (-u_xlat17) * u_xlat1.x + u_xlat15;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlat10 = u_xlat10 * gSampleWeightTable[1].x;
    u_xlat5.x = u_xlat10 * 0.5 + u_xlat5.x;
    u_xlat10 = uintBitsToFloat(TGSM0[u_xlati4.z].value[(0 >> 2) + 0]);
    u_xlat3.xyz = gInvThicknessTable[2].xwz + vec3(-0.5, -0.5, -0.5);
    u_xlat10 = u_xlat10 * u_xlat2.x + (-u_xlat3.x);
    u_xlat15 = u_xlat10 * AdditionalParams.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.x = uintBitsToFloat(TGSM0[u_xlati4.y].value[(0 >> 2) + 0]);
    u_xlat11.x = uintBitsToFloat(TGSM0[u_xlati4.w].value[(0 >> 2) + 0]);
    u_xlat11.x = u_xlat11.x * u_xlat2.x + (-u_xlat3.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x + (-u_xlat3.x);
    u_xlat17 = max(u_xlat15, u_xlat1.x);
    u_xlat1.x = u_xlat1.x * AdditionalParams.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10 = max(u_xlat10, u_xlat1.x);
    u_xlat10 = min(u_xlat10, 1.0);
    u_xlat10 = u_xlat10 + u_xlat17;
    u_xlat10 = (-u_xlat1.x) * u_xlat15 + u_xlat10;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlati4 = u_xlati0.xxxx + ivec4(132, 450, 78, 462);
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati4.x].value[(0 >> 2) + 0]);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat3.x);
    u_xlat1.x = u_xlat15 * AdditionalParams.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat2.x = max(u_xlat1.x, u_xlat11.x);
    u_xlat11.x = u_xlat11.x * AdditionalParams.x;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat15 = max(u_xlat15, u_xlat11.x);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat15 = u_xlat15 + u_xlat2.x;
    u_xlat15 = (-u_xlat11.x) * u_xlat1.x + u_xlat15;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlat10 = u_xlat10 * gSampleWeightTable[2].x;
    u_xlat5.x = u_xlat10 * 0.5 + u_xlat5.x;
    u_xlat10 = uintBitsToFloat(TGSM0[u_xlati4.z].value[(0 >> 2) + 0]);
    u_xlat10 = u_xlat10 * u_xlat2.y + (-u_xlat3.y);
    u_xlat15 = u_xlat10 * AdditionalParams.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.x = uintBitsToFloat(TGSM0[u_xlati4.y].value[(0 >> 2) + 0]);
    u_xlat11.x = uintBitsToFloat(TGSM0[u_xlati4.w].value[(0 >> 2) + 0]);
    u_xlat11.x = u_xlat11.x * u_xlat2.y + (-u_xlat3.y);
    u_xlat1.x = u_xlat1.x * u_xlat2.y + (-u_xlat3.y);
    u_xlat2.x = max(u_xlat15, u_xlat1.x);
    u_xlat1.x = u_xlat1.x * AdditionalParams.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat10 = max(u_xlat10, u_xlat1.x);
    u_xlat10 = min(u_xlat10, 1.0);
    u_xlat10 = u_xlat10 + u_xlat2.x;
    u_xlat10 = (-u_xlat1.x) * u_xlat15 + u_xlat10;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlati4 = u_xlati0.xxxx + ivec4(66, 458, 70, 454);
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati4.x].value[(0 >> 2) + 0]);
    u_xlat15 = u_xlat15 * u_xlat2.y + (-u_xlat3.y);
    u_xlat1.x = u_xlat15 * AdditionalParams.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat2.x = max(u_xlat1.x, u_xlat11.x);
    u_xlat11.x = u_xlat11.x * AdditionalParams.x;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat15 = max(u_xlat15, u_xlat11.x);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat15 = u_xlat15 + u_xlat2.x;
    u_xlat15 = (-u_xlat11.x) * u_xlat1.x + u_xlat15;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlat10 = u_xlat10 * gSampleWeightTable[2].w;
    u_xlat5.x = u_xlat10 * 0.5 + u_xlat5.x;
    u_xlat10 = uintBitsToFloat(TGSM0[u_xlati4.z].value[(0 >> 2) + 0]);
    u_xlat10 = u_xlat10 * u_xlat1.y + (-u_xlat11.y);
    u_xlat15 = u_xlat10 * AdditionalParams.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.x = uintBitsToFloat(TGSM0[u_xlati4.y].value[(0 >> 2) + 0]);
    u_xlat11.x = uintBitsToFloat(TGSM0[u_xlati4.w].value[(0 >> 2) + 0]);
    u_xlat11.x = u_xlat11.x * u_xlat1.y + (-u_xlat11.y);
    u_xlat1.x = u_xlat1.x * u_xlat1.y + (-u_xlat11.y);
    u_xlat2.x = max(u_xlat15, u_xlat1.x);
    u_xlat1.x = u_xlat1.x * AdditionalParams.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat10 = max(u_xlat10, u_xlat1.x);
    u_xlat10 = min(u_xlat10, 1.0);
    u_xlat10 = u_xlat10 + u_xlat2.x;
    u_xlat10 = (-u_xlat1.x) * u_xlat15 + u_xlat10;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlati4 = u_xlati0.xxxx + ivec4(74, 334, 194, 322);
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati4.x].value[(0 >> 2) + 0]);
    u_xlat15 = u_xlat15 * u_xlat1.y + (-u_xlat11.y);
    u_xlat1.x = u_xlat15 * AdditionalParams.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat2.x = max(u_xlat1.x, u_xlat11.x);
    u_xlat11.x = u_xlat11.x * AdditionalParams.x;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat15 = max(u_xlat15, u_xlat11.x);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat15 = u_xlat15 + u_xlat2.x;
    u_xlat15 = (-u_xlat11.x) * u_xlat1.x + u_xlat15;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati4.y].value[(0 >> 2) + 0]);
    u_xlat15 = u_xlat15 * u_xlat1.y + (-u_xlat11.y);
    u_xlat1.x = uintBitsToFloat(TGSM0[u_xlati4.z].value[(0 >> 2) + 0]);
    u_xlat11.x = uintBitsToFloat(TGSM0[u_xlati4.w].value[(0 >> 2) + 0]);
    u_xlat11.x = u_xlat11.x * u_xlat1.y + (-u_xlat11.y);
    u_xlat1.x = u_xlat1.x * u_xlat1.y + (-u_xlat11.y);
    u_xlat2.x = u_xlat1.x * AdditionalParams.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat7 = max(u_xlat15, u_xlat2.x);
    u_xlat15 = u_xlat15 * AdditionalParams.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat7 = min(u_xlat7, 1.0);
    u_xlat1.x = max(u_xlat15, u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.x = u_xlat1.x + u_xlat7;
    u_xlat15 = (-u_xlat15) * u_xlat2.x + u_xlat1.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlati4 = u_xlati0.xxxx + ivec4(206, 524, 4, 516);
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati4.x].value[(0 >> 2) + 0]);
    u_xlat15 = u_xlat15 * u_xlat1.y + (-u_xlat11.y);
    u_xlat1.x = u_xlat15 * AdditionalParams.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6.x = max(u_xlat1.x, u_xlat11.x);
    u_xlat11.x = u_xlat11.x * AdditionalParams.x;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat15 = max(u_xlat15, u_xlat11.x);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat15 = u_xlat15 + u_xlat6.x;
    u_xlat15 = (-u_xlat11.x) * u_xlat1.x + u_xlat15;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlat10 = u_xlat10 * gSampleWeightTable[1].z;
    u_xlat5.x = u_xlat10 * 0.25 + u_xlat5.x;
    u_xlat10 = uintBitsToFloat(TGSM0[u_xlati4.y].value[(0 >> 2) + 0]);
    u_xlat10 = u_xlat10 * u_xlat2.z + (-u_xlat3.z);
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati4.z].value[(0 >> 2) + 0]);
    u_xlat1.x = uintBitsToFloat(TGSM0[u_xlati4.w].value[(0 >> 2) + 0]);
    u_xlat1.x = u_xlat1.x * u_xlat2.z + (-u_xlat3.z);
    u_xlat15 = u_xlat15 * u_xlat2.z + (-u_xlat3.z);
    u_xlat6.x = u_xlat15 * AdditionalParams.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat11.x = max(u_xlat10, u_xlat6.x);
    u_xlat10 = u_xlat10 * AdditionalParams.x;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat11.x = min(u_xlat11.x, 1.0);
    u_xlat15 = max(u_xlat10, u_xlat15);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat15 = u_xlat15 + u_xlat11.x;
    u_xlat10 = (-u_xlat10) * u_xlat6.x + u_xlat15;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlati4 = u_xlati0.xxxx + ivec4(12, 400, 128, 384);
    u_xlati0.x = u_xlati0.x + 144;
    u_xlat0.x = uintBitsToFloat(TGSM0[u_xlati0.x].value[(0 >> 2) + 0]);
    u_xlat0.x = u_xlat0.x * u_xlat2.z + (-u_xlat3.z);
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati4.x].value[(0 >> 2) + 0]);
    u_xlat15 = u_xlat15 * u_xlat2.z + (-u_xlat3.z);
    u_xlat6.x = u_xlat15 * AdditionalParams.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat11.x = max(u_xlat6.x, u_xlat1.x);
    u_xlat1.x = u_xlat1.x * AdditionalParams.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat11.x = min(u_xlat11.x, 1.0);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat15 = u_xlat15 + u_xlat11.x;
    u_xlat15 = (-u_xlat1.x) * u_xlat6.x + u_xlat15;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlat15 = uintBitsToFloat(TGSM0[u_xlati4.y].value[(0 >> 2) + 0]);
    u_xlat15 = u_xlat15 * u_xlat2.z + (-u_xlat3.z);
    u_xlat1.x = uintBitsToFloat(TGSM0[u_xlati4.z].value[(0 >> 2) + 0]);
    u_xlat6.x = uintBitsToFloat(TGSM0[u_xlati4.w].value[(0 >> 2) + 0]);
    u_xlat6.x = u_xlat6.x * u_xlat2.z + (-u_xlat3.z);
    u_xlat1.x = u_xlat1.x * u_xlat2.z + (-u_xlat3.z);
    u_xlat11.x = u_xlat1.x * AdditionalParams.x;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat1.w = max(u_xlat15, u_xlat11.x);
    u_xlat15 = u_xlat15 * AdditionalParams.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.x = max(u_xlat15, u_xlat1.x);
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 1.0));
    u_xlat1.x = u_xlat1.x + u_xlat1.w;
    u_xlat15 = (-u_xlat15) * u_xlat11.x + u_xlat1.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlat15 = u_xlat0.x * AdditionalParams.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.x = max(u_xlat15, u_xlat6.x);
    u_xlat6.x = u_xlat6.x * AdditionalParams.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat0.x = max(u_xlat0.x, u_xlat6.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat1.x;
    u_xlat0.x = (-u_xlat6.x) * u_xlat15 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + u_xlat10;
    u_xlat0.x = u_xlat0.x * gSampleWeightTable[2].z;
    u_xlat0.x = u_xlat0.x * 0.25 + u_xlat5.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = AdditionalParams.y * u_xlat0.x + 1.0;
    imageStore(Occlusion_origX0X, ivec2(gl_GlobalInvocationID.xy), u_xlat0.xxxx);
    return;
}

