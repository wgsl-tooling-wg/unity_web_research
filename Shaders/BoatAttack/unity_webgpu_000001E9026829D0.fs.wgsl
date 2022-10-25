struct PGlobals {
  x_ScaledScreenParams : vec4<f32>,
  x_GlobalMipBias : vec2<f32>,
  @size(8)
  padding : u32,
  x_MainLightPosition : vec4<f32>,
  x_MainLightColor : vec4<f32>,
  x_AmbientOcclusionParam : vec4<f32>,
  x_AdditionalLightsCount : vec4<f32>,
  x_RenderingLayerMaxInt : u32,
  x_RenderingLayerRcpMaxInt : f32,
  @size(8)
  padding_1 : u32,
  x_WorldSpaceCameraPos : vec3<f32>,
  @size(4)
  padding_2 : u32,
  unity_OrthoParams : vec4<f32>,
  x_ScaleBiasRt : vec4<f32>,
  unity_MatrixV : mat4x4<f32>,
}

struct UnityPerMaterial {
  Texture2D_25A083BC_TexelSize : vec4<f32>,
  Texture2D_6EEDD32E_TexelSize : vec4<f32>,
  Texture2D_E9EC22CC_TexelSize : vec4<f32>,
  x_Hue : f32,
}

type Arr = array<vec4<f32>, 2u>;

struct UnityPerDraw {
  unity_ObjectToWorld : mat4x4<f32>,
  unity_WorldToObject : mat4x4<f32>,
  unity_LODFade : vec4<f32>,
  unity_WorldTransformParams : vec4<f32>,
  unity_RenderingLayer : vec4<f32>,
  unity_LightData : vec4<f32>,
  unity_LightIndices : Arr,
  unity_ProbesOcclusion : vec4<f32>,
  unity_SpecCube0_HDR : vec4<f32>,
  unity_SpecCube1_HDR : vec4<f32>,
  unity_SpecCube0_BoxMax : vec4<f32>,
  unity_SpecCube0_BoxMin : vec4<f32>,
  unity_SpecCube0_ProbePosition : vec4<f32>,
  unity_SpecCube1_BoxMax : vec4<f32>,
  unity_SpecCube1_BoxMin : vec4<f32>,
  unity_SpecCube1_ProbePosition : vec4<f32>,
  unity_LightmapST : vec4<f32>,
  unity_DynamicLightmapST : vec4<f32>,
  unity_SHAr : vec4<f32>,
  unity_SHAg : vec4<f32>,
  unity_SHAb : vec4<f32>,
  unity_SHBr : vec4<f32>,
  unity_SHBg : vec4<f32>,
  unity_SHBb : vec4<f32>,
  unity_SHC : vec4<f32>,
  unity_RendererBounds_Min : vec4<f32>,
  unity_RendererBounds_Max : vec4<f32>,
  unity_MatrixPreviousM : mat4x4<f32>,
  unity_MatrixPreviousMI : mat4x4<f32>,
  unity_MotionVectorsParams : vec4<f32>,
  unity_SpriteColor : vec4<f32>,
  unity_SpriteProps : vec4<f32>,
}

type Arr_1 = array<mat4x4<f32>, 5u>;

struct MainLightShadows {
  x_MainLightWorldToShadow : Arr_1,
  x_CascadeShadowSplitSpheres0 : vec4<f32>,
  x_CascadeShadowSplitSpheres1 : vec4<f32>,
  x_CascadeShadowSplitSpheres2 : vec4<f32>,
  x_CascadeShadowSplitSpheres3 : vec4<f32>,
  x_CascadeShadowSplitSphereRadii : vec4<f32>,
  x_MainLightShadowOffset0 : vec4<f32>,
  x_MainLightShadowOffset1 : vec4<f32>,
  x_MainLightShadowParams : vec4<f32>,
  x_MainLightShadowmapSize : vec4<f32>,
}

struct strided_arr {
  @size(16)
  el : f32,
}

type Arr_2 = array<strided_arr, 8u>;

struct LightCookies {
  x_MainLightWorldToLight : mat4x4<f32>,
  x_AdditionalLightsCookieEnableBits : Arr_2,
  x_MainLightCookieTextureFormat : f32,
  x_AdditionalLightsCookieAtlasTextureFormat : f32,
}

type Arr_3 = array<vec4<f32>, 256u>;

type Arr_4 = array<vec4<f32>, 256u>;

type Arr_5 = array<vec4<f32>, 256u>;

type Arr_6 = array<vec4<f32>, 256u>;

type Arr_7 = array<vec4<f32>, 256u>;

struct strided_arr_1 {
  @size(16)
  el : f32,
}

type Arr_8 = array<strided_arr_1, 256u>;

type Arr_9 = array<vec4<f32>, 256u>;

type Arr_10 = array<strided_arr_1, 256u>;

struct AdditionalLights {
  x_AdditionalLightsPosition : Arr_9,
  x_AdditionalLightsColor : Arr_9,
  x_AdditionalLightsAttenuation : Arr_9,
  x_AdditionalLightsSpotDir : Arr_9,
  x_AdditionalLightsOcclusionProbes : Arr_9,
  x_AdditionalLightsLayerMasks : Arr_10,
}

type Arr_11 = array<mat4x4<f32>, 256u>;

struct AdditionalLightsCookies {
  x_AdditionalLightsWorldToLights : Arr_11,
  x_AdditionalLightsCookieAtlasUVRects : Arr_9,
  x_AdditionalLightsLightTypes : Arr_10,
}

var<private> gl_FragCoord : vec4<f32>;

@group(0) @binding(5) var Texture2D_25A083BC : texture_2d<f32>;

@group(0) @binding(13) var samplerTexture2D_25A083BC : sampler;

var<private> vs_INTERP3 : vec4<f32>;

@group(1) @binding(0) var<uniform> x_44 : PGlobals;

@group(1) @binding(6) var<uniform> x_190 : UnityPerMaterial;

@group(0) @binding(7) var Texture2D_E9EC22CC : texture_2d<f32>;

@group(0) @binding(15) var samplerTexture2D_E9EC22CC : sampler;

@group(0) @binding(6) var Texture2D_6EEDD32E : texture_2d<f32>;

@group(0) @binding(14) var samplerTexture2D_6EEDD32E : sampler;

var<private> vs_INTERP2 : vec4<f32>;

@group(1) @binding(2) var<uniform> x_359 : UnityPerDraw;

var<private> vs_INTERP1 : vec3<f32>;

var<private> vs_INTERP0 : vec3<f32>;

@group(0) @binding(1) var x_ScreenSpaceOcclusionTexture : texture_2d<f32>;

@group(0) @binding(9) var sampler_ScreenSpaceOcclusionTexture : sampler;

@group(1) @binding(3) var<uniform> x_726 : MainLightShadows;

var<private> vs_INTERP8 : vec4<f32>;

@group(0) @binding(2) var x_MainLightShadowmapTexture : texture_depth_2d;

@group(0) @binding(10) var sampler_MainLightShadowmapTexture : sampler_comparison;

@group(1) @binding(4) var<uniform> x_2052 : LightCookies;

@group(0) @binding(3) var x_MainLightCookieTexture : texture_2d<f32>;

@group(0) @binding(11) var sampler_MainLightCookieTexture : sampler;

@group(0) @binding(0) var unity_SpecCube0 : texture_cube<f32>;

@group(0) @binding(8) var samplerunity_SpecCube0 : sampler;

@group(1) @binding(1) var<uniform> x_2493 : AdditionalLights;

@group(1) @binding(5) var<uniform> x_2601 : AdditionalLightsCookies;

@group(0) @binding(4) var x_AdditionalLightsCookieAtlasTexture : texture_2d<f32>;

@group(0) @binding(12) var sampler_AdditionalLightsCookieAtlasTexture : sampler;

var<private> SV_Target0 : vec4<f32>;

var<private> SV_Target1 : vec4<f32>;

fn main_1() {
  var hlslcc_FragCoord : vec4<f32>;
  var u_xlat0 : vec4<f32>;
  var u_xlatb1 : bool;
  var u_xlat1 : vec4<f32>;
  var u_xlat2 : vec4<f32>;
  var u_xlat3 : vec4<f32>;
  var u_xlatb20 : bool;
  var u_xlat20 : f32;
  var u_xlat40 : f32;
  var x_146 : f32;
  var u_xlat21 : vec3<f32>;
  var u_xlatb60 : bool;
  var x_211 : f32;
  var x_220 : f32;
  var u_xlat60 : f32;
  var u_xlatb41 : vec2<bool>;
  var u_xlat41 : vec2<f32>;
  var u_xlat62 : f32;
  var u_xlat4 : vec3<f32>;
  var x_475 : f32;
  var x_488 : f32;
  var x_499 : f32;
  var u_xlat5 : vec4<f32>;
  var u_xlat6 : vec3<f32>;
  var u_xlat61 : f32;
  var u_xlat22 : f32;
  var u_xlat63 : f32;
  var u_xlat64 : f32;
  var u_xlat42 : f32;
  var u_xlatb63 : bool;
  var txVec0 : vec3<f32>;
  var u_xlat7 : vec4<f32>;
  var txVec1 : vec3<f32>;
  var txVec2 : vec3<f32>;
  var txVec3 : vec3<f32>;
  var u_xlatb5 : bool;
  var u_xlat45 : vec2<f32>;
  var u_xlat8 : vec4<f32>;
  var u_xlat48 : vec2<f32>;
  var u_xlat9 : vec4<f32>;
  var u_xlat10 : vec4<f32>;
  var u_xlat11 : vec4<f32>;
  var u_xlat12 : vec4<f32>;
  var u_xlat13 : vec4<f32>;
  var u_xlat14 : vec4<f32>;
  var txVec4 : vec3<f32>;
  var u_xlat25 : f32;
  var txVec5 : vec3<f32>;
  var u_xlat66 : f32;
  var txVec6 : vec3<f32>;
  var txVec7 : vec3<f32>;
  var txVec8 : vec3<f32>;
  var txVec9 : vec3<f32>;
  var txVec10 : vec3<f32>;
  var txVec11 : vec3<f32>;
  var txVec12 : vec3<f32>;
  var u_xlat27 : vec3<f32>;
  var u_xlat15 : vec4<f32>;
  var u_xlat16 : vec4<f32>;
  var u_xlat28 : vec3<f32>;
  var u_xlat54 : vec2<f32>;
  var u_xlat49 : vec2<f32>;
  var u_xlat17 : vec4<f32>;
  var u_xlat18 : vec4<f32>;
  var u_xlat19 : vec4<f32>;
  var txVec13 : vec3<f32>;
  var txVec14 : vec3<f32>;
  var txVec15 : vec3<f32>;
  var txVec16 : vec3<f32>;
  var u_xlat65 : f32;
  var txVec17 : vec3<f32>;
  var txVec18 : vec3<f32>;
  var txVec19 : vec3<f32>;
  var txVec20 : vec3<f32>;
  var txVec21 : vec3<f32>;
  var txVec22 : vec3<f32>;
  var txVec23 : vec3<f32>;
  var txVec24 : vec3<f32>;
  var txVec25 : vec3<f32>;
  var txVec26 : vec3<f32>;
  var txVec27 : vec3<f32>;
  var txVec28 : vec3<f32>;
  var txVec29 : vec3<f32>;
  var u_xlatb25 : bool;
  var u_xlatb7 : vec2<bool>;
  var x_2134 : f32;
  var x_2145 : vec3<f32>;
  var u_xlatu60 : u32;
  var u_xlatu_loop_1 : u32;
  var u_xlatu2 : u32;
  var u_xlati63 : i32;
  var indexable : array<vec4<u32>, 4u>;
  var u_xlatu66 : u32;
  var u_xlati47 : i32;
  var u_xlati66 : i32;
  var u_xlati67 : i32;
  var u_xlatb66 : bool;
  var u_xlat51 : vec2<f32>;
  var u_xlatb47 : vec2<bool>;
  var u_xlat47 : vec2<f32>;
  var x_2894 : f32;
  var x_2907 : f32;
  var x_2959 : f32;
  var x_2970 : vec3<f32>;
  var u_xlatu0 : u32;
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_13 : vec4<f32> = gl_FragCoord;
  let x_14 : vec3<f32> = vec3<f32>(x_13.x, x_13.y, x_13.z);
  let x_20 : f32 = gl_FragCoord.w;
  hlslcc_FragCoord = vec4<f32>(x_14.x, x_14.y, x_14.z, (1.0f / x_20));
  let x_39 : vec4<f32> = vs_INTERP3;
  let x_50 : f32 = x_44.x_GlobalMipBias.x;
  let x_51 : vec4<f32> = textureSampleBias(Texture2D_25A083BC, samplerTexture2D_25A083BC, vec2<f32>(x_39.x, x_39.y), x_50);
  u_xlat0 = x_51;
  let x_58 : f32 = u_xlat0.y;
  let x_61 : f32 = u_xlat0.z;
  u_xlatb1 = (x_58 >= x_61);
  let x_64 : bool = u_xlatb1;
  u_xlat1.x = select(0.0f, 1.0f, x_64);
  let x_69 : vec4<f32> = u_xlat0;
  let x_70 : vec2<f32> = vec2<f32>(x_69.z, x_69.y);
  let x_71 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_70.x, x_70.y, x_71.z, x_71.w);
  u_xlat2.z = -1.0f;
  u_xlat2.w = 0.666666687f;
  let x_78 : vec4<f32> = u_xlat0;
  let x_80 : vec4<f32> = u_xlat2;
  let x_83 : vec2<f32> = (vec2<f32>(x_78.y, x_78.z) + -(vec2<f32>(x_80.x, x_80.y)));
  let x_84 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_83.x, x_83.y, x_84.z, x_84.w);
  u_xlat3.z = 1.0f;
  u_xlat3.w = -1.0f;
  let x_88 : vec4<f32> = u_xlat1;
  let x_90 : vec4<f32> = u_xlat3;
  let x_92 : vec4<f32> = u_xlat2;
  u_xlat1 = ((vec4<f32>(x_88.x, x_88.x, x_88.x, x_88.x) * x_90) + x_92);
  let x_96 : f32 = u_xlat0.x;
  let x_98 : f32 = u_xlat1.x;
  u_xlatb20 = (x_96 >= x_98);
  let x_101 : bool = u_xlatb20;
  u_xlat20 = select(0.0f, 1.0f, x_101);
  let x_103 : vec4<f32> = u_xlat1;
  let x_104 : vec3<f32> = vec3<f32>(x_103.x, x_103.y, x_103.w);
  let x_105 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_104.x, x_104.y, x_104.z, x_105.w);
  let x_108 : f32 = u_xlat0.x;
  u_xlat2.w = x_108;
  let x_110 : vec4<f32> = u_xlat2;
  let x_111 : vec3<f32> = vec3<f32>(x_110.w, x_110.y, x_110.x);
  let x_112 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_111.x, x_111.y, x_112.z, x_111.z);
  let x_114 : vec4<f32> = u_xlat2;
  let x_116 : vec4<f32> = u_xlat1;
  u_xlat1 = (-(x_114) + x_116);
  let x_118 : f32 = u_xlat20;
  let x_120 : vec4<f32> = u_xlat1;
  let x_122 : vec4<f32> = u_xlat2;
  u_xlat1 = ((vec4<f32>(x_118, x_118, x_118, x_118) * x_120) + x_122);
  let x_125 : f32 = u_xlat1.y;
  let x_127 : f32 = u_xlat1.w;
  u_xlat0.x = min(x_125, x_127);
  let x_131 : f32 = u_xlat0.x;
  let x_134 : f32 = u_xlat1.x;
  u_xlat0.x = (-(x_131) + x_134);
  let x_138 : f32 = u_xlat0.x;
  u_xlatb20 = (x_138 == 0.0f);
  let x_142 : f32 = u_xlat1.x;
  u_xlat40 = (x_142 + 1.00000001e-10f);
  let x_145 : bool = u_xlatb20;
  if (x_145) {
    let x_150 : f32 = u_xlat1.x;
    x_146 = x_150;
  } else {
    let x_152 : f32 = u_xlat40;
    x_146 = x_152;
  }
  let x_153 : f32 = x_146;
  u_xlat20 = x_153;
  let x_155 : f32 = u_xlat1.y;
  let x_158 : f32 = u_xlat1.w;
  u_xlat1.x = (-(x_155) + x_158);
  let x_164 : f32 = u_xlat0.x;
  u_xlat21.x = ((x_164 * 6.0f) + 1.00000001e-10f);
  let x_170 : f32 = u_xlat1.x;
  let x_172 : f32 = u_xlat21.x;
  u_xlat1.x = (x_170 / x_172);
  let x_176 : f32 = u_xlat1.x;
  let x_178 : f32 = u_xlat1.z;
  u_xlat1.x = (x_176 + x_178);
  let x_182 : f32 = u_xlat0.x;
  let x_183 : f32 = u_xlat40;
  u_xlat0.x = (x_182 / x_183);
  let x_187 : f32 = u_xlat0.w;
  let x_193 : f32 = x_190.x_Hue;
  let x_196 : f32 = u_xlat1.x;
  u_xlat40 = ((x_187 * x_193) + abs(x_196));
  let x_200 : f32 = u_xlat40;
  u_xlatb60 = (x_200 < 0.0f);
  let x_202 : f32 = u_xlat40;
  u_xlatb1 = (1.0f < x_202);
  let x_204 : f32 = u_xlat40;
  let x_207 : vec2<f32> = (vec2<f32>(x_204, x_204) + vec2<f32>(1.0f, -1.0f));
  let x_208 : vec3<f32> = u_xlat21;
  u_xlat21 = vec3<f32>(x_207.x, x_207.y, x_208.z);
  let x_210 : bool = u_xlatb1;
  if (x_210) {
    let x_215 : f32 = u_xlat21.y;
    x_211 = x_215;
  } else {
    let x_217 : f32 = u_xlat40;
    x_211 = x_217;
  }
  let x_218 : f32 = x_211;
  u_xlat40 = x_218;
  let x_219 : bool = u_xlatb60;
  if (x_219) {
    let x_224 : f32 = u_xlat21.x;
    x_220 = x_224;
  } else {
    let x_226 : f32 = u_xlat40;
    x_220 = x_226;
  }
  let x_227 : f32 = x_220;
  u_xlat40 = x_227;
  let x_228 : f32 = u_xlat40;
  let x_232 : vec3<f32> = (vec3<f32>(x_228, x_228, x_228) + vec3<f32>(1.0f, 0.666666687f, 0.333333343f));
  let x_233 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_232.x, x_232.y, x_232.z, x_233.w);
  let x_235 : vec4<f32> = u_xlat1;
  let x_237 : vec3<f32> = fract(vec3<f32>(x_235.x, x_235.y, x_235.z));
  let x_238 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_237.x, x_237.y, x_237.z, x_238.w);
  let x_240 : vec4<f32> = u_xlat1;
  let x_246 : vec3<f32> = ((vec3<f32>(x_240.x, x_240.y, x_240.z) * vec3<f32>(6.0f, 6.0f, 6.0f)) + vec3<f32>(-3.0f, -3.0f, -3.0f));
  let x_247 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_246.x, x_246.y, x_246.z, x_247.w);
  let x_249 : vec4<f32> = u_xlat1;
  let x_253 : vec3<f32> = (abs(vec3<f32>(x_249.x, x_249.y, x_249.z)) + vec3<f32>(-1.0f, -1.0f, -1.0f));
  let x_254 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_253.x, x_253.y, x_253.z, x_254.w);
  let x_256 : vec4<f32> = u_xlat1;
  let x_260 : vec3<f32> = clamp(vec3<f32>(x_256.x, x_256.y, x_256.z), vec3<f32>(0.0f, 0.0f, 0.0f), vec3<f32>(1.0f, 1.0f, 1.0f));
  let x_261 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_260.x, x_260.y, x_260.z, x_261.w);
  let x_263 : vec4<f32> = u_xlat1;
  let x_265 : vec3<f32> = (vec3<f32>(x_263.x, x_263.y, x_263.z) + vec3<f32>(-1.0f, -1.0f, -1.0f));
  let x_266 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_265.x, x_265.y, x_265.z, x_266.w);
  let x_268 : vec4<f32> = u_xlat0;
  let x_270 : vec4<f32> = u_xlat1;
  let x_274 : vec3<f32> = ((vec3<f32>(x_268.x, x_268.x, x_268.x) * vec3<f32>(x_270.x, x_270.y, x_270.z)) + vec3<f32>(1.0f, 1.0f, 1.0f));
  let x_275 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_274.x, x_275.y, x_274.y, x_274.z);
  let x_277 : vec4<f32> = u_xlat0;
  let x_279 : f32 = u_xlat20;
  let x_281 : vec3<f32> = (vec3<f32>(x_277.x, x_277.z, x_277.w) * vec3<f32>(x_279, x_279, x_279));
  let x_282 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_281.x, x_281.y, x_281.z, x_282.w);
  let x_284 : vec4<f32> = u_xlat0;
  let x_288 : vec3<f32> = clamp(vec3<f32>(x_284.x, x_284.y, x_284.z), vec3<f32>(0.0f, 0.0f, 0.0f), vec3<f32>(1.0f, 1.0f, 1.0f));
  let x_289 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_288.x, x_288.y, x_288.z, x_289.w);
  let x_296 : vec4<f32> = vs_INTERP3;
  let x_299 : f32 = x_44.x_GlobalMipBias.x;
  let x_300 : vec4<f32> = textureSampleBias(Texture2D_E9EC22CC, samplerTexture2D_E9EC22CC, vec2<f32>(x_296.x, x_296.y), x_299);
  let x_301 : vec3<f32> = vec3<f32>(x_300.x, x_300.y, x_300.w);
  let x_302 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_301.x, x_301.y, x_301.z, x_302.w);
  let x_305 : f32 = u_xlat1.x;
  let x_307 : f32 = u_xlat1.z;
  u_xlat1.x = (x_305 * x_307);
  let x_310 : vec4<f32> = u_xlat1;
  let x_316 : vec2<f32> = ((vec2<f32>(x_310.x, x_310.y) * vec2<f32>(2.0f, 2.0f)) + vec2<f32>(-1.0f, -1.0f));
  let x_317 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_316.x, x_316.y, x_317.z, x_317.w);
  let x_320 : vec4<f32> = u_xlat1;
  let x_322 : vec4<f32> = u_xlat1;
  u_xlat60 = dot(vec2<f32>(x_320.x, x_320.y), vec2<f32>(x_322.x, x_322.y));
  let x_325 : f32 = u_xlat60;
  u_xlat60 = min(x_325, 1.0f);
  let x_327 : f32 = u_xlat60;
  u_xlat60 = (-(x_327) + 1.0f);
  let x_330 : f32 = u_xlat60;
  u_xlat60 = sqrt(x_330);
  let x_332 : f32 = u_xlat60;
  u_xlat60 = max(x_332, 1.00000002e-16f);
  let x_340 : vec4<f32> = vs_INTERP3;
  let x_343 : f32 = x_44.x_GlobalMipBias.x;
  let x_344 : vec4<f32> = textureSampleBias(Texture2D_6EEDD32E, samplerTexture2D_6EEDD32E, vec2<f32>(x_340.x, x_340.y), x_343);
  let x_345 : vec3<f32> = vec3<f32>(x_344.x, x_344.w, x_344.y);
  let x_346 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_345.x, x_345.y, x_345.z, x_346.w);
  let x_353 : f32 = vs_INTERP2.w;
  u_xlatb41.x = (0.0f < x_353);
  let x_361 : f32 = x_359.unity_WorldTransformParams.w;
  u_xlatb41.y = (x_361 >= 0.0f);
  let x_367 : bool = u_xlatb41.x;
  u_xlat41.x = select(-1.0f, 1.0f, x_367);
  let x_371 : bool = u_xlatb41.y;
  u_xlat41.y = select(-1.0f, 1.0f, x_371);
  let x_375 : f32 = u_xlat41.y;
  let x_377 : f32 = u_xlat41.x;
  u_xlat41.x = (x_375 * x_377);
  let x_382 : vec3<f32> = vs_INTERP1;
  let x_384 : vec4<f32> = vs_INTERP2;
  let x_386 : vec3<f32> = (vec3<f32>(x_382.z, x_382.x, x_382.y) * vec3<f32>(x_384.y, x_384.z, x_384.x));
  let x_387 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_386.x, x_386.y, x_386.z, x_387.w);
  let x_389 : vec3<f32> = vs_INTERP1;
  let x_391 : vec4<f32> = vs_INTERP2;
  let x_394 : vec4<f32> = u_xlat3;
  let x_397 : vec3<f32> = ((vec3<f32>(x_389.y, x_389.z, x_389.x) * vec3<f32>(x_391.z, x_391.x, x_391.y)) + -(vec3<f32>(x_394.x, x_394.y, x_394.z)));
  let x_398 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_397.x, x_397.y, x_397.z, x_398.w);
  let x_400 : vec2<f32> = u_xlat41;
  let x_402 : vec4<f32> = u_xlat3;
  let x_404 : vec3<f32> = (vec3<f32>(x_400.x, x_400.x, x_400.x) * vec3<f32>(x_402.x, x_402.y, x_402.z));
  let x_405 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_404.x, x_404.y, x_404.z, x_405.w);
  let x_407 : vec4<f32> = u_xlat1;
  let x_409 : vec4<f32> = u_xlat3;
  u_xlat21 = (vec3<f32>(x_407.y, x_407.y, x_407.y) * vec3<f32>(x_409.x, x_409.y, x_409.z));
  let x_412 : vec4<f32> = u_xlat1;
  let x_414 : vec4<f32> = vs_INTERP2;
  let x_417 : vec3<f32> = u_xlat21;
  let x_418 : vec3<f32> = ((vec3<f32>(x_412.x, x_412.x, x_412.x) * vec3<f32>(x_414.x, x_414.y, x_414.z)) + x_417);
  let x_419 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_418.x, x_418.y, x_418.z, x_419.w);
  let x_421 : f32 = u_xlat60;
  let x_423 : vec3<f32> = vs_INTERP1;
  let x_425 : vec4<f32> = u_xlat1;
  let x_427 : vec3<f32> = ((vec3<f32>(x_421, x_421, x_421) * x_423) + vec3<f32>(x_425.x, x_425.y, x_425.z));
  let x_428 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_427.x, x_427.y, x_427.z, x_428.w);
  let x_430 : vec4<f32> = u_xlat1;
  let x_432 : vec4<f32> = u_xlat1;
  u_xlat60 = dot(vec3<f32>(x_430.x, x_430.y, x_430.z), vec3<f32>(x_432.x, x_432.y, x_432.z));
  let x_435 : f32 = u_xlat60;
  u_xlat60 = inverseSqrt(x_435);
  let x_437 : f32 = u_xlat60;
  let x_439 : vec4<f32> = u_xlat1;
  let x_441 : vec3<f32> = (vec3<f32>(x_437, x_437, x_437) * vec3<f32>(x_439.x, x_439.y, x_439.z));
  let x_442 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_441.x, x_441.y, x_441.z, x_442.w);
  let x_446 : f32 = x_44.unity_OrthoParams.w;
  u_xlatb60 = (x_446 == 0.0f);
  let x_449 : vec3<f32> = vs_INTERP0;
  let x_454 : vec3<f32> = x_44.x_WorldSpaceCameraPos;
  let x_455 : vec3<f32> = (-(x_449) + x_454);
  let x_456 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_455.x, x_455.y, x_455.z, x_456.w);
  let x_459 : vec4<f32> = u_xlat3;
  let x_461 : vec4<f32> = u_xlat3;
  u_xlat62 = dot(vec3<f32>(x_459.x, x_459.y, x_459.z), vec3<f32>(x_461.x, x_461.y, x_461.z));
  let x_464 : f32 = u_xlat62;
  u_xlat62 = inverseSqrt(x_464);
  let x_466 : f32 = u_xlat62;
  let x_468 : vec4<f32> = u_xlat3;
  let x_470 : vec3<f32> = (vec3<f32>(x_466, x_466, x_466) * vec3<f32>(x_468.x, x_468.y, x_468.z));
  let x_471 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_470.x, x_470.y, x_470.z, x_471.w);
  let x_474 : bool = u_xlatb60;
  if (x_474) {
    let x_479 : f32 = u_xlat3.x;
    x_475 = x_479;
  } else {
    let x_484 : f32 = x_44.unity_MatrixV[0i].z;
    x_475 = x_484;
  }
  let x_485 : f32 = x_475;
  u_xlat4.x = x_485;
  let x_487 : bool = u_xlatb60;
  if (x_487) {
    let x_492 : f32 = u_xlat3.y;
    x_488 = x_492;
  } else {
    let x_495 : f32 = x_44.unity_MatrixV[1i].z;
    x_488 = x_495;
  }
  let x_496 : f32 = x_488;
  u_xlat4.y = x_496;
  let x_498 : bool = u_xlatb60;
  if (x_498) {
    let x_503 : f32 = u_xlat3.z;
    x_499 = x_503;
  } else {
    let x_507 : f32 = x_44.unity_MatrixV[2i].z;
    x_499 = x_507;
  }
  let x_508 : f32 = x_499;
  u_xlat4.z = x_508;
  u_xlat1.w = 1.0f;
  let x_514 : vec4<f32> = x_359.unity_SHAr;
  let x_515 : vec4<f32> = u_xlat1;
  u_xlat3.x = dot(x_514, x_515);
  let x_520 : vec4<f32> = x_359.unity_SHAg;
  let x_521 : vec4<f32> = u_xlat1;
  u_xlat3.y = dot(x_520, x_521);
  let x_526 : vec4<f32> = x_359.unity_SHAb;
  let x_527 : vec4<f32> = u_xlat1;
  u_xlat3.z = dot(x_526, x_527);
  let x_531 : vec4<f32> = u_xlat1;
  let x_533 : vec4<f32> = u_xlat1;
  u_xlat5 = (vec4<f32>(x_531.y, x_531.z, x_531.z, x_531.x) * vec4<f32>(x_533.x, x_533.y, x_533.z, x_533.z));
  let x_539 : vec4<f32> = x_359.unity_SHBr;
  let x_540 : vec4<f32> = u_xlat5;
  u_xlat6.x = dot(x_539, x_540);
  let x_545 : vec4<f32> = x_359.unity_SHBg;
  let x_546 : vec4<f32> = u_xlat5;
  u_xlat6.y = dot(x_545, x_546);
  let x_551 : vec4<f32> = x_359.unity_SHBb;
  let x_552 : vec4<f32> = u_xlat5;
  u_xlat6.z = dot(x_551, x_552);
  let x_556 : f32 = u_xlat1.y;
  let x_558 : f32 = u_xlat1.y;
  u_xlat60 = (x_556 * x_558);
  let x_561 : f32 = u_xlat1.x;
  let x_563 : f32 = u_xlat1.x;
  let x_565 : f32 = u_xlat60;
  u_xlat60 = ((x_561 * x_563) + -(x_565));
  let x_570 : vec4<f32> = x_359.unity_SHC;
  let x_572 : f32 = u_xlat60;
  let x_575 : vec3<f32> = u_xlat6;
  let x_576 : vec3<f32> = ((vec3<f32>(x_570.x, x_570.y, x_570.z) * vec3<f32>(x_572, x_572, x_572)) + x_575);
  let x_577 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_576.x, x_576.y, x_576.z, x_577.w);
  let x_579 : vec4<f32> = u_xlat3;
  let x_581 : vec4<f32> = u_xlat5;
  let x_583 : vec3<f32> = (vec3<f32>(x_579.x, x_579.y, x_579.z) + vec3<f32>(x_581.x, x_581.y, x_581.z));
  let x_584 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_583.x, x_583.y, x_583.z, x_584.w);
  let x_586 : vec4<f32> = u_xlat3;
  let x_589 : vec3<f32> = max(vec3<f32>(x_586.x, x_586.y, x_586.z), vec3<f32>(0.0f, 0.0f, 0.0f));
  let x_590 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_589.x, x_589.y, x_589.z, x_590.w);
  let x_594 : vec4<f32> = x_44.x_ScaledScreenParams;
  let x_595 : vec2<f32> = vec2<f32>(x_594.x, x_594.y);
  let x_599 : vec2<f32> = (vec2<f32>(1.0f, 1.0f) / vec2<f32>(x_595.x, x_595.y));
  let x_600 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_599.x, x_599.y, x_600.z, x_600.w);
  let x_602 : vec4<f32> = u_xlat5;
  let x_604 : vec4<f32> = hlslcc_FragCoord;
  let x_606 : vec2<f32> = (vec2<f32>(x_602.x, x_602.y) * vec2<f32>(x_604.x, x_604.y));
  let x_607 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_606.x, x_606.y, x_607.z, x_607.w);
  let x_610 : f32 = u_xlat5.y;
  let x_613 : f32 = x_44.x_ScaleBiasRt.x;
  let x_616 : f32 = x_44.x_ScaleBiasRt.y;
  u_xlat60 = ((x_610 * x_613) + x_616);
  let x_618 : f32 = u_xlat60;
  u_xlat5.z = (-(x_618) + 1.0f);
  let x_622 : vec4<f32> = u_xlat2;
  let x_623 : vec2<f32> = vec2<f32>(x_622.x, x_622.y);
  let x_624 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_623.x, x_623.y, x_624.z, x_624.w);
  let x_626 : vec4<f32> = u_xlat2;
  let x_630 : vec2<f32> = clamp(vec2<f32>(x_626.x, x_626.y), vec2<f32>(0.0f, 0.0f), vec2<f32>(1.0f, 1.0f));
  let x_631 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_630.x, x_630.y, x_631.z, x_631.w);
  let x_634 : f32 = u_xlat2.x;
  u_xlat60 = ((-(x_634) * 0.959999979f) + 0.959999979f);
  let x_640 : f32 = u_xlat60;
  let x_643 : f32 = u_xlat2.y;
  u_xlat61 = (-(x_640) + x_643);
  let x_645 : f32 = u_xlat60;
  let x_647 : vec4<f32> = u_xlat0;
  u_xlat6 = (vec3<f32>(x_645, x_645, x_645) * vec3<f32>(x_647.x, x_647.y, x_647.z));
  let x_650 : vec4<f32> = u_xlat0;
  let x_654 : vec3<f32> = (vec3<f32>(x_650.x, x_650.y, x_650.z) + vec3<f32>(-0.039999999f, -0.039999999f, -0.039999999f));
  let x_655 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_654.x, x_654.y, x_654.z, x_655.w);
  let x_657 : vec4<f32> = u_xlat2;
  let x_659 : vec4<f32> = u_xlat0;
  let x_664 : vec3<f32> = ((vec3<f32>(x_657.x, x_657.x, x_657.x) * vec3<f32>(x_659.x, x_659.y, x_659.z)) + vec3<f32>(0.039999999f, 0.039999999f, 0.039999999f));
  let x_665 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_664.x, x_664.y, x_664.z, x_665.w);
  let x_668 : f32 = u_xlat2.y;
  u_xlat60 = (-(x_668) + 1.0f);
  let x_671 : f32 = u_xlat60;
  let x_672 : f32 = u_xlat60;
  u_xlat2.x = (x_671 * x_672);
  let x_676 : f32 = u_xlat2.x;
  u_xlat2.x = max(x_676, 0.0078125f);
  let x_682 : f32 = u_xlat2.x;
  let x_684 : f32 = u_xlat2.x;
  u_xlat22 = (x_682 * x_684);
  let x_686 : f32 = u_xlat61;
  u_xlat61 = (x_686 + 1.0f);
  let x_688 : f32 = u_xlat61;
  u_xlat61 = min(x_688, 1.0f);
  let x_691 : f32 = u_xlat2.x;
  u_xlat62 = ((x_691 * 4.0f) + 2.0f);
  let x_701 : vec4<f32> = u_xlat5;
  let x_704 : f32 = x_44.x_GlobalMipBias.x;
  let x_705 : vec4<f32> = textureSampleBias(x_ScreenSpaceOcclusionTexture, sampler_ScreenSpaceOcclusionTexture, vec2<f32>(x_701.x, x_701.z), x_704);
  u_xlat63 = x_705.x;
  let x_708 : f32 = u_xlat63;
  u_xlat64 = (x_708 + -1.0f);
  let x_712 : f32 = x_44.x_AmbientOcclusionParam.w;
  let x_713 : f32 = u_xlat64;
  u_xlat64 = ((x_712 * x_713) + 1.0f);
  let x_718 : f32 = u_xlat2.z;
  let x_719 : f32 = u_xlat63;
  u_xlat42 = min(x_718, x_719);
  let x_728 : f32 = x_726.x_MainLightShadowParams.y;
  u_xlatb63 = (0.0f < x_728);
  let x_730 : bool = u_xlatb63;
  if (x_730) {
    let x_734 : f32 = x_726.x_MainLightShadowParams.y;
    u_xlatb63 = (x_734 == 1.0f);
    let x_736 : bool = u_xlatb63;
    if (x_736) {
      let x_740 : vec4<f32> = vs_INTERP8;
      let x_744 : vec4<f32> = x_726.x_MainLightShadowOffset0;
      u_xlat5 = (vec4<f32>(x_740.x, x_740.y, x_740.x, x_740.y) + x_744);
      let x_747 : vec4<f32> = u_xlat5;
      let x_748 : vec2<f32> = vec2<f32>(x_747.x, x_747.y);
      let x_750 : f32 = vs_INTERP8.z;
      txVec0 = vec3<f32>(x_748.x, x_748.y, x_750);
      let x_763 : vec3<f32> = txVec0;
      let x_765 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_763.xy, x_763.z);
      u_xlat7.x = x_765;
      let x_768 : vec4<f32> = u_xlat5;
      let x_769 : vec2<f32> = vec2<f32>(x_768.z, x_768.w);
      let x_771 : f32 = vs_INTERP8.z;
      txVec1 = vec3<f32>(x_769.x, x_769.y, x_771);
      let x_778 : vec3<f32> = txVec1;
      let x_780 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_778.xy, x_778.z);
      u_xlat7.y = x_780;
      let x_782 : vec4<f32> = vs_INTERP8;
      let x_786 : vec4<f32> = x_726.x_MainLightShadowOffset1;
      u_xlat5 = (vec4<f32>(x_782.x, x_782.y, x_782.x, x_782.y) + x_786);
      let x_789 : vec4<f32> = u_xlat5;
      let x_790 : vec2<f32> = vec2<f32>(x_789.x, x_789.y);
      let x_792 : f32 = vs_INTERP8.z;
      txVec2 = vec3<f32>(x_790.x, x_790.y, x_792);
      let x_799 : vec3<f32> = txVec2;
      let x_801 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_799.xy, x_799.z);
      u_xlat7.z = x_801;
      let x_804 : vec4<f32> = u_xlat5;
      let x_805 : vec2<f32> = vec2<f32>(x_804.z, x_804.w);
      let x_807 : f32 = vs_INTERP8.z;
      txVec3 = vec3<f32>(x_805.x, x_805.y, x_807);
      let x_814 : vec3<f32> = txVec3;
      let x_816 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_814.xy, x_814.z);
      u_xlat7.w = x_816;
      let x_818 : vec4<f32> = u_xlat7;
      u_xlat63 = dot(x_818, vec4<f32>(0.25f, 0.25f, 0.25f, 0.25f));
    } else {
      let x_825 : f32 = x_726.x_MainLightShadowParams.y;
      u_xlatb5 = (x_825 == 2.0f);
      let x_827 : bool = u_xlatb5;
      if (x_827) {
        let x_830 : vec4<f32> = vs_INTERP8;
        let x_833 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_838 : vec2<f32> = ((vec2<f32>(x_830.x, x_830.y) * vec2<f32>(x_833.z, x_833.w)) + vec2<f32>(0.5f, 0.5f));
        let x_839 : vec4<f32> = u_xlat5;
        u_xlat5 = vec4<f32>(x_838.x, x_838.y, x_839.z, x_839.w);
        let x_841 : vec4<f32> = u_xlat5;
        let x_843 : vec2<f32> = floor(vec2<f32>(x_841.x, x_841.y));
        let x_844 : vec4<f32> = u_xlat5;
        u_xlat5 = vec4<f32>(x_843.x, x_843.y, x_844.z, x_844.w);
        let x_847 : vec4<f32> = vs_INTERP8;
        let x_850 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_853 : vec4<f32> = u_xlat5;
        u_xlat45 = ((vec2<f32>(x_847.x, x_847.y) * vec2<f32>(x_850.z, x_850.w)) + -(vec2<f32>(x_853.x, x_853.y)));
        let x_857 : vec2<f32> = u_xlat45;
        u_xlat7 = (vec4<f32>(x_857.x, x_857.x, x_857.y, x_857.y) + vec4<f32>(0.5f, 1.0f, 0.5f, 1.0f));
        let x_862 : vec4<f32> = u_xlat7;
        let x_864 : vec4<f32> = u_xlat7;
        u_xlat8 = (vec4<f32>(x_862.x, x_862.x, x_862.z, x_862.z) * vec4<f32>(x_864.x, x_864.x, x_864.z, x_864.z));
        let x_867 : vec4<f32> = u_xlat8;
        let x_871 : vec2<f32> = (vec2<f32>(x_867.y, x_867.w) * vec2<f32>(0.079999998f, 0.079999998f));
        let x_872 : vec4<f32> = u_xlat7;
        u_xlat7 = vec4<f32>(x_871.x, x_872.y, x_871.y, x_872.w);
        let x_874 : vec4<f32> = u_xlat8;
        let x_877 : vec2<f32> = u_xlat45;
        let x_879 : vec2<f32> = ((vec2<f32>(x_874.x, x_874.z) * vec2<f32>(0.5f, 0.5f)) + -(x_877));
        let x_880 : vec4<f32> = u_xlat8;
        u_xlat8 = vec4<f32>(x_879.x, x_879.y, x_880.z, x_880.w);
        let x_883 : vec2<f32> = u_xlat45;
        u_xlat48 = (-(x_883) + vec2<f32>(1.0f, 1.0f));
        let x_887 : vec2<f32> = u_xlat45;
        let x_889 : vec2<f32> = min(x_887, vec2<f32>(0.0f, 0.0f));
        let x_890 : vec4<f32> = u_xlat9;
        u_xlat9 = vec4<f32>(x_889.x, x_889.y, x_890.z, x_890.w);
        let x_892 : vec4<f32> = u_xlat9;
        let x_895 : vec4<f32> = u_xlat9;
        let x_898 : vec2<f32> = u_xlat48;
        let x_899 : vec2<f32> = ((-(vec2<f32>(x_892.x, x_892.y)) * vec2<f32>(x_895.x, x_895.y)) + x_898);
        let x_900 : vec4<f32> = u_xlat9;
        u_xlat9 = vec4<f32>(x_899.x, x_899.y, x_900.z, x_900.w);
        let x_902 : vec2<f32> = u_xlat45;
        u_xlat45 = max(x_902, vec2<f32>(0.0f, 0.0f));
        let x_904 : vec2<f32> = u_xlat45;
        let x_906 : vec2<f32> = u_xlat45;
        let x_908 : vec4<f32> = u_xlat7;
        u_xlat45 = ((-(x_904) * x_906) + vec2<f32>(x_908.y, x_908.w));
        let x_911 : vec4<f32> = u_xlat9;
        let x_913 : vec2<f32> = (vec2<f32>(x_911.x, x_911.y) + vec2<f32>(1.0f, 1.0f));
        let x_914 : vec4<f32> = u_xlat9;
        u_xlat9 = vec4<f32>(x_913.x, x_913.y, x_914.z, x_914.w);
        let x_916 : vec2<f32> = u_xlat45;
        u_xlat45 = (x_916 + vec2<f32>(1.0f, 1.0f));
        let x_919 : vec4<f32> = u_xlat8;
        let x_923 : vec2<f32> = (vec2<f32>(x_919.x, x_919.y) * vec2<f32>(0.159999996f, 0.159999996f));
        let x_924 : vec4<f32> = u_xlat10;
        u_xlat10 = vec4<f32>(x_923.x, x_923.y, x_924.z, x_924.w);
        let x_926 : vec2<f32> = u_xlat48;
        let x_927 : vec2<f32> = (x_926 * vec2<f32>(0.159999996f, 0.159999996f));
        let x_928 : vec4<f32> = u_xlat8;
        u_xlat8 = vec4<f32>(x_927.x, x_927.y, x_928.z, x_928.w);
        let x_930 : vec4<f32> = u_xlat9;
        let x_932 : vec2<f32> = (vec2<f32>(x_930.x, x_930.y) * vec2<f32>(0.159999996f, 0.159999996f));
        let x_933 : vec4<f32> = u_xlat9;
        u_xlat9 = vec4<f32>(x_932.x, x_932.y, x_933.z, x_933.w);
        let x_936 : vec2<f32> = u_xlat45;
        let x_937 : vec2<f32> = (x_936 * vec2<f32>(0.159999996f, 0.159999996f));
        let x_938 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_937.x, x_937.y, x_938.z, x_938.w);
        let x_940 : vec4<f32> = u_xlat7;
        u_xlat45 = (vec2<f32>(x_940.y, x_940.w) * vec2<f32>(0.159999996f, 0.159999996f));
        let x_944 : f32 = u_xlat9.x;
        u_xlat10.z = x_944;
        let x_947 : f32 = u_xlat45.x;
        u_xlat10.w = x_947;
        let x_950 : f32 = u_xlat11.x;
        u_xlat8.z = x_950;
        let x_953 : f32 = u_xlat7.x;
        u_xlat8.w = x_953;
        let x_956 : vec4<f32> = u_xlat8;
        let x_958 : vec4<f32> = u_xlat10;
        u_xlat12 = (vec4<f32>(x_956.z, x_956.w, x_956.x, x_956.z) + vec4<f32>(x_958.z, x_958.w, x_958.x, x_958.z));
        let x_962 : f32 = u_xlat10.y;
        u_xlat9.z = x_962;
        let x_965 : f32 = u_xlat45.y;
        u_xlat9.w = x_965;
        let x_968 : f32 = u_xlat8.y;
        u_xlat11.z = x_968;
        let x_971 : f32 = u_xlat7.z;
        u_xlat11.w = x_971;
        let x_973 : vec4<f32> = u_xlat9;
        let x_975 : vec4<f32> = u_xlat11;
        let x_977 : vec3<f32> = (vec3<f32>(x_973.z, x_973.y, x_973.w) + vec3<f32>(x_975.z, x_975.y, x_975.w));
        let x_978 : vec4<f32> = u_xlat7;
        u_xlat7 = vec4<f32>(x_977.x, x_977.y, x_977.z, x_978.w);
        let x_980 : vec4<f32> = u_xlat8;
        let x_982 : vec4<f32> = u_xlat12;
        let x_984 : vec3<f32> = (vec3<f32>(x_980.x, x_980.z, x_980.w) / vec3<f32>(x_982.z, x_982.w, x_982.y));
        let x_985 : vec4<f32> = u_xlat8;
        u_xlat8 = vec4<f32>(x_984.x, x_984.y, x_984.z, x_985.w);
        let x_987 : vec4<f32> = u_xlat8;
        let x_993 : vec3<f32> = (vec3<f32>(x_987.x, x_987.y, x_987.z) + vec3<f32>(-2.5f, -0.5f, 1.5f));
        let x_994 : vec4<f32> = u_xlat8;
        u_xlat8 = vec4<f32>(x_993.x, x_993.y, x_993.z, x_994.w);
        let x_996 : vec4<f32> = u_xlat11;
        let x_998 : vec4<f32> = u_xlat7;
        let x_1000 : vec3<f32> = (vec3<f32>(x_996.z, x_996.y, x_996.w) / vec3<f32>(x_998.x, x_998.y, x_998.z));
        let x_1001 : vec4<f32> = u_xlat9;
        u_xlat9 = vec4<f32>(x_1000.x, x_1000.y, x_1000.z, x_1001.w);
        let x_1003 : vec4<f32> = u_xlat9;
        let x_1005 : vec3<f32> = (vec3<f32>(x_1003.x, x_1003.y, x_1003.z) + vec3<f32>(-2.5f, -0.5f, 1.5f));
        let x_1006 : vec4<f32> = u_xlat9;
        u_xlat9 = vec4<f32>(x_1005.x, x_1005.y, x_1005.z, x_1006.w);
        let x_1008 : vec4<f32> = u_xlat8;
        let x_1011 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1013 : vec3<f32> = (vec3<f32>(x_1008.y, x_1008.x, x_1008.z) * vec3<f32>(x_1011.x, x_1011.x, x_1011.x));
        let x_1014 : vec4<f32> = u_xlat8;
        u_xlat8 = vec4<f32>(x_1013.x, x_1013.y, x_1013.z, x_1014.w);
        let x_1016 : vec4<f32> = u_xlat9;
        let x_1019 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1021 : vec3<f32> = (vec3<f32>(x_1016.x, x_1016.y, x_1016.z) * vec3<f32>(x_1019.y, x_1019.y, x_1019.y));
        let x_1022 : vec4<f32> = u_xlat9;
        u_xlat9 = vec4<f32>(x_1021.x, x_1021.y, x_1021.z, x_1022.w);
        let x_1025 : f32 = u_xlat9.x;
        u_xlat8.w = x_1025;
        let x_1027 : vec4<f32> = u_xlat5;
        let x_1030 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1033 : vec4<f32> = u_xlat8;
        u_xlat10 = ((vec4<f32>(x_1027.x, x_1027.y, x_1027.x, x_1027.y) * vec4<f32>(x_1030.x, x_1030.y, x_1030.x, x_1030.y)) + vec4<f32>(x_1033.y, x_1033.w, x_1033.x, x_1033.w));
        let x_1036 : vec4<f32> = u_xlat5;
        let x_1039 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1042 : vec4<f32> = u_xlat8;
        u_xlat45 = ((vec2<f32>(x_1036.x, x_1036.y) * vec2<f32>(x_1039.x, x_1039.y)) + vec2<f32>(x_1042.z, x_1042.w));
        let x_1046 : f32 = u_xlat8.y;
        u_xlat9.w = x_1046;
        let x_1048 : vec4<f32> = u_xlat9;
        let x_1049 : vec2<f32> = vec2<f32>(x_1048.y, x_1048.z);
        let x_1050 : vec4<f32> = u_xlat8;
        u_xlat8 = vec4<f32>(x_1050.x, x_1049.x, x_1050.z, x_1049.y);
        let x_1052 : vec4<f32> = u_xlat5;
        let x_1055 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1058 : vec4<f32> = u_xlat8;
        u_xlat11 = ((vec4<f32>(x_1052.x, x_1052.y, x_1052.x, x_1052.y) * vec4<f32>(x_1055.x, x_1055.y, x_1055.x, x_1055.y)) + vec4<f32>(x_1058.x, x_1058.y, x_1058.z, x_1058.y));
        let x_1061 : vec4<f32> = u_xlat5;
        let x_1064 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1067 : vec4<f32> = u_xlat9;
        u_xlat9 = ((vec4<f32>(x_1061.x, x_1061.y, x_1061.x, x_1061.y) * vec4<f32>(x_1064.x, x_1064.y, x_1064.x, x_1064.y)) + vec4<f32>(x_1067.w, x_1067.y, x_1067.w, x_1067.z));
        let x_1070 : vec4<f32> = u_xlat5;
        let x_1073 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1076 : vec4<f32> = u_xlat8;
        u_xlat8 = ((vec4<f32>(x_1070.x, x_1070.y, x_1070.x, x_1070.y) * vec4<f32>(x_1073.x, x_1073.y, x_1073.x, x_1073.y)) + vec4<f32>(x_1076.x, x_1076.w, x_1076.z, x_1076.w));
        let x_1080 : vec4<f32> = u_xlat7;
        let x_1082 : vec4<f32> = u_xlat12;
        u_xlat13 = (vec4<f32>(x_1080.x, x_1080.x, x_1080.x, x_1080.y) * vec4<f32>(x_1082.z, x_1082.w, x_1082.y, x_1082.z));
        let x_1086 : vec4<f32> = u_xlat7;
        let x_1088 : vec4<f32> = u_xlat12;
        u_xlat14 = (vec4<f32>(x_1086.y, x_1086.y, x_1086.z, x_1086.z) * x_1088);
        let x_1091 : f32 = u_xlat7.z;
        let x_1093 : f32 = u_xlat12.y;
        u_xlat5.x = (x_1091 * x_1093);
        let x_1097 : vec4<f32> = u_xlat10;
        let x_1098 : vec2<f32> = vec2<f32>(x_1097.x, x_1097.y);
        let x_1100 : f32 = vs_INTERP8.z;
        txVec4 = vec3<f32>(x_1098.x, x_1098.y, x_1100);
        let x_1108 : vec3<f32> = txVec4;
        let x_1110 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1108.xy, x_1108.z);
        u_xlat25 = x_1110;
        let x_1112 : vec4<f32> = u_xlat10;
        let x_1113 : vec2<f32> = vec2<f32>(x_1112.z, x_1112.w);
        let x_1115 : f32 = vs_INTERP8.z;
        txVec5 = vec3<f32>(x_1113.x, x_1113.y, x_1115);
        let x_1123 : vec3<f32> = txVec5;
        let x_1125 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1123.xy, x_1123.z);
        u_xlat66 = x_1125;
        let x_1126 : f32 = u_xlat66;
        let x_1128 : f32 = u_xlat13.y;
        u_xlat66 = (x_1126 * x_1128);
        let x_1131 : f32 = u_xlat13.x;
        let x_1132 : f32 = u_xlat25;
        let x_1134 : f32 = u_xlat66;
        u_xlat25 = ((x_1131 * x_1132) + x_1134);
        let x_1137 : vec2<f32> = u_xlat45;
        let x_1139 : f32 = vs_INTERP8.z;
        txVec6 = vec3<f32>(x_1137.x, x_1137.y, x_1139);
        let x_1146 : vec3<f32> = txVec6;
        let x_1148 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1146.xy, x_1146.z);
        u_xlat45.x = x_1148;
        let x_1151 : f32 = u_xlat13.z;
        let x_1153 : f32 = u_xlat45.x;
        let x_1155 : f32 = u_xlat25;
        u_xlat25 = ((x_1151 * x_1153) + x_1155);
        let x_1158 : vec4<f32> = u_xlat9;
        let x_1159 : vec2<f32> = vec2<f32>(x_1158.x, x_1158.y);
        let x_1161 : f32 = vs_INTERP8.z;
        txVec7 = vec3<f32>(x_1159.x, x_1159.y, x_1161);
        let x_1168 : vec3<f32> = txVec7;
        let x_1170 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1168.xy, x_1168.z);
        u_xlat45.x = x_1170;
        let x_1173 : f32 = u_xlat13.w;
        let x_1175 : f32 = u_xlat45.x;
        let x_1177 : f32 = u_xlat25;
        u_xlat25 = ((x_1173 * x_1175) + x_1177);
        let x_1180 : vec4<f32> = u_xlat11;
        let x_1181 : vec2<f32> = vec2<f32>(x_1180.x, x_1180.y);
        let x_1183 : f32 = vs_INTERP8.z;
        txVec8 = vec3<f32>(x_1181.x, x_1181.y, x_1183);
        let x_1190 : vec3<f32> = txVec8;
        let x_1192 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1190.xy, x_1190.z);
        u_xlat45.x = x_1192;
        let x_1195 : f32 = u_xlat14.x;
        let x_1197 : f32 = u_xlat45.x;
        let x_1199 : f32 = u_xlat25;
        u_xlat25 = ((x_1195 * x_1197) + x_1199);
        let x_1202 : vec4<f32> = u_xlat11;
        let x_1203 : vec2<f32> = vec2<f32>(x_1202.z, x_1202.w);
        let x_1205 : f32 = vs_INTERP8.z;
        txVec9 = vec3<f32>(x_1203.x, x_1203.y, x_1205);
        let x_1212 : vec3<f32> = txVec9;
        let x_1214 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1212.xy, x_1212.z);
        u_xlat45.x = x_1214;
        let x_1217 : f32 = u_xlat14.y;
        let x_1219 : f32 = u_xlat45.x;
        let x_1221 : f32 = u_xlat25;
        u_xlat25 = ((x_1217 * x_1219) + x_1221);
        let x_1224 : vec4<f32> = u_xlat9;
        let x_1225 : vec2<f32> = vec2<f32>(x_1224.z, x_1224.w);
        let x_1227 : f32 = vs_INTERP8.z;
        txVec10 = vec3<f32>(x_1225.x, x_1225.y, x_1227);
        let x_1234 : vec3<f32> = txVec10;
        let x_1236 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1234.xy, x_1234.z);
        u_xlat45.x = x_1236;
        let x_1239 : f32 = u_xlat14.z;
        let x_1241 : f32 = u_xlat45.x;
        let x_1243 : f32 = u_xlat25;
        u_xlat25 = ((x_1239 * x_1241) + x_1243);
        let x_1246 : vec4<f32> = u_xlat8;
        let x_1247 : vec2<f32> = vec2<f32>(x_1246.x, x_1246.y);
        let x_1249 : f32 = vs_INTERP8.z;
        txVec11 = vec3<f32>(x_1247.x, x_1247.y, x_1249);
        let x_1256 : vec3<f32> = txVec11;
        let x_1258 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1256.xy, x_1256.z);
        u_xlat45.x = x_1258;
        let x_1261 : f32 = u_xlat14.w;
        let x_1263 : f32 = u_xlat45.x;
        let x_1265 : f32 = u_xlat25;
        u_xlat25 = ((x_1261 * x_1263) + x_1265);
        let x_1268 : vec4<f32> = u_xlat8;
        let x_1269 : vec2<f32> = vec2<f32>(x_1268.z, x_1268.w);
        let x_1271 : f32 = vs_INTERP8.z;
        txVec12 = vec3<f32>(x_1269.x, x_1269.y, x_1271);
        let x_1278 : vec3<f32> = txVec12;
        let x_1280 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1278.xy, x_1278.z);
        u_xlat45.x = x_1280;
        let x_1283 : f32 = u_xlat5.x;
        let x_1285 : f32 = u_xlat45.x;
        let x_1287 : f32 = u_xlat25;
        u_xlat63 = ((x_1283 * x_1285) + x_1287);
      } else {
        let x_1290 : vec4<f32> = vs_INTERP8;
        let x_1293 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1296 : vec2<f32> = ((vec2<f32>(x_1290.x, x_1290.y) * vec2<f32>(x_1293.z, x_1293.w)) + vec2<f32>(0.5f, 0.5f));
        let x_1297 : vec4<f32> = u_xlat5;
        u_xlat5 = vec4<f32>(x_1296.x, x_1296.y, x_1297.z, x_1297.w);
        let x_1299 : vec4<f32> = u_xlat5;
        let x_1301 : vec2<f32> = floor(vec2<f32>(x_1299.x, x_1299.y));
        let x_1302 : vec4<f32> = u_xlat5;
        u_xlat5 = vec4<f32>(x_1301.x, x_1301.y, x_1302.z, x_1302.w);
        let x_1304 : vec4<f32> = vs_INTERP8;
        let x_1307 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1310 : vec4<f32> = u_xlat5;
        u_xlat45 = ((vec2<f32>(x_1304.x, x_1304.y) * vec2<f32>(x_1307.z, x_1307.w)) + -(vec2<f32>(x_1310.x, x_1310.y)));
        let x_1314 : vec2<f32> = u_xlat45;
        u_xlat7 = (vec4<f32>(x_1314.x, x_1314.x, x_1314.y, x_1314.y) + vec4<f32>(0.5f, 1.0f, 0.5f, 1.0f));
        let x_1317 : vec4<f32> = u_xlat7;
        let x_1319 : vec4<f32> = u_xlat7;
        u_xlat8 = (vec4<f32>(x_1317.x, x_1317.x, x_1317.z, x_1317.z) * vec4<f32>(x_1319.x, x_1319.x, x_1319.z, x_1319.z));
        let x_1322 : vec4<f32> = u_xlat8;
        let x_1326 : vec2<f32> = (vec2<f32>(x_1322.y, x_1322.w) * vec2<f32>(0.040816002f, 0.040816002f));
        let x_1327 : vec4<f32> = u_xlat9;
        u_xlat9 = vec4<f32>(x_1327.x, x_1326.x, x_1327.z, x_1326.y);
        let x_1329 : vec4<f32> = u_xlat8;
        let x_1332 : vec2<f32> = u_xlat45;
        let x_1334 : vec2<f32> = ((vec2<f32>(x_1329.x, x_1329.z) * vec2<f32>(0.5f, 0.5f)) + -(x_1332));
        let x_1335 : vec4<f32> = u_xlat7;
        u_xlat7 = vec4<f32>(x_1334.x, x_1335.y, x_1334.y, x_1335.w);
        let x_1337 : vec2<f32> = u_xlat45;
        let x_1339 : vec2<f32> = (-(x_1337) + vec2<f32>(1.0f, 1.0f));
        let x_1340 : vec4<f32> = u_xlat8;
        u_xlat8 = vec4<f32>(x_1339.x, x_1339.y, x_1340.z, x_1340.w);
        let x_1342 : vec2<f32> = u_xlat45;
        u_xlat48 = min(x_1342, vec2<f32>(0.0f, 0.0f));
        let x_1344 : vec2<f32> = u_xlat48;
        let x_1346 : vec2<f32> = u_xlat48;
        let x_1348 : vec4<f32> = u_xlat8;
        let x_1350 : vec2<f32> = ((-(x_1344) * x_1346) + vec2<f32>(x_1348.x, x_1348.y));
        let x_1351 : vec4<f32> = u_xlat8;
        u_xlat8 = vec4<f32>(x_1350.x, x_1350.y, x_1351.z, x_1351.w);
        let x_1353 : vec2<f32> = u_xlat45;
        u_xlat48 = max(x_1353, vec2<f32>(0.0f, 0.0f));
        let x_1356 : vec2<f32> = u_xlat48;
        let x_1358 : vec2<f32> = u_xlat48;
        let x_1360 : vec4<f32> = u_xlat7;
        let x_1362 : vec2<f32> = ((-(x_1356) * x_1358) + vec2<f32>(x_1360.y, x_1360.w));
        let x_1363 : vec3<f32> = u_xlat27;
        u_xlat27 = vec3<f32>(x_1362.x, x_1363.y, x_1362.y);
        let x_1365 : vec4<f32> = u_xlat8;
        let x_1367 : vec2<f32> = (vec2<f32>(x_1365.x, x_1365.y) + vec2<f32>(2.0f, 2.0f));
        let x_1368 : vec4<f32> = u_xlat8;
        u_xlat8 = vec4<f32>(x_1367.x, x_1367.y, x_1368.z, x_1368.w);
        let x_1370 : vec3<f32> = u_xlat27;
        let x_1372 : vec2<f32> = (vec2<f32>(x_1370.x, x_1370.z) + vec2<f32>(2.0f, 2.0f));
        let x_1373 : vec4<f32> = u_xlat7;
        u_xlat7 = vec4<f32>(x_1373.x, x_1372.x, x_1373.z, x_1372.y);
        let x_1376 : f32 = u_xlat7.y;
        u_xlat10.z = (x_1376 * 0.081632003f);
        let x_1380 : vec4<f32> = u_xlat7;
        let x_1383 : vec3<f32> = (vec3<f32>(x_1380.z, x_1380.x, x_1380.w) * vec3<f32>(0.081632003f, 0.081632003f, 0.081632003f));
        let x_1384 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_1383.x, x_1383.y, x_1383.z, x_1384.w);
        let x_1386 : vec4<f32> = u_xlat8;
        let x_1389 : vec2<f32> = (vec2<f32>(x_1386.x, x_1386.y) * vec2<f32>(0.081632003f, 0.081632003f));
        let x_1390 : vec4<f32> = u_xlat7;
        u_xlat7 = vec4<f32>(x_1389.x, x_1389.y, x_1390.z, x_1390.w);
        let x_1393 : f32 = u_xlat11.y;
        u_xlat10.x = x_1393;
        let x_1395 : vec2<f32> = u_xlat45;
        let x_1402 : vec2<f32> = ((vec2<f32>(x_1395.x, x_1395.x) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.163264006f, 0.081632003f));
        let x_1403 : vec4<f32> = u_xlat10;
        u_xlat10 = vec4<f32>(x_1403.x, x_1402.x, x_1403.z, x_1402.y);
        let x_1405 : vec2<f32> = u_xlat45;
        let x_1409 : vec2<f32> = ((vec2<f32>(x_1405.x, x_1405.x) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.081632003f, 0.163264006f));
        let x_1410 : vec4<f32> = u_xlat8;
        u_xlat8 = vec4<f32>(x_1409.x, x_1410.y, x_1409.y, x_1410.w);
        let x_1413 : f32 = u_xlat7.x;
        u_xlat8.y = x_1413;
        let x_1416 : f32 = u_xlat9.y;
        u_xlat8.w = x_1416;
        let x_1418 : vec4<f32> = u_xlat8;
        let x_1419 : vec4<f32> = u_xlat10;
        u_xlat10 = (x_1418 + x_1419);
        let x_1421 : vec2<f32> = u_xlat45;
        let x_1424 : vec2<f32> = ((vec2<f32>(x_1421.y, x_1421.y) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.163264006f, 0.081632003f));
        let x_1425 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_1425.x, x_1424.x, x_1425.z, x_1424.y);
        let x_1427 : vec2<f32> = u_xlat45;
        let x_1430 : vec2<f32> = ((vec2<f32>(x_1427.y, x_1427.y) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.081632003f, 0.163264006f));
        let x_1431 : vec4<f32> = u_xlat9;
        u_xlat9 = vec4<f32>(x_1430.x, x_1431.y, x_1430.y, x_1431.w);
        let x_1434 : f32 = u_xlat7.y;
        u_xlat9.y = x_1434;
        let x_1436 : vec4<f32> = u_xlat9;
        let x_1437 : vec4<f32> = u_xlat11;
        u_xlat7 = (x_1436 + x_1437);
        let x_1439 : vec4<f32> = u_xlat8;
        let x_1440 : vec4<f32> = u_xlat10;
        u_xlat8 = (x_1439 / x_1440);
        let x_1442 : vec4<f32> = u_xlat8;
        u_xlat8 = (x_1442 + vec4<f32>(-3.5f, -1.5f, 0.5f, 2.5f));
        let x_1448 : vec4<f32> = u_xlat9;
        let x_1449 : vec4<f32> = u_xlat7;
        u_xlat9 = (x_1448 / x_1449);
        let x_1451 : vec4<f32> = u_xlat9;
        u_xlat9 = (x_1451 + vec4<f32>(-3.5f, -1.5f, 0.5f, 2.5f));
        let x_1453 : vec4<f32> = u_xlat8;
        let x_1456 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        u_xlat8 = (vec4<f32>(x_1453.w, x_1453.x, x_1453.y, x_1453.z) * vec4<f32>(x_1456.x, x_1456.x, x_1456.x, x_1456.x));
        let x_1459 : vec4<f32> = u_xlat9;
        let x_1462 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        u_xlat9 = (vec4<f32>(x_1459.x, x_1459.w, x_1459.y, x_1459.z) * vec4<f32>(x_1462.y, x_1462.y, x_1462.y, x_1462.y));
        let x_1465 : vec4<f32> = u_xlat8;
        let x_1466 : vec3<f32> = vec3<f32>(x_1465.y, x_1465.z, x_1465.w);
        let x_1467 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_1466.x, x_1467.y, x_1466.y, x_1466.z);
        let x_1470 : f32 = u_xlat9.x;
        u_xlat11.y = x_1470;
        let x_1472 : vec4<f32> = u_xlat5;
        let x_1475 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1478 : vec4<f32> = u_xlat11;
        u_xlat12 = ((vec4<f32>(x_1472.x, x_1472.y, x_1472.x, x_1472.y) * vec4<f32>(x_1475.x, x_1475.y, x_1475.x, x_1475.y)) + vec4<f32>(x_1478.x, x_1478.y, x_1478.z, x_1478.y));
        let x_1481 : vec4<f32> = u_xlat5;
        let x_1484 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1487 : vec4<f32> = u_xlat11;
        u_xlat45 = ((vec2<f32>(x_1481.x, x_1481.y) * vec2<f32>(x_1484.x, x_1484.y)) + vec2<f32>(x_1487.w, x_1487.y));
        let x_1491 : f32 = u_xlat11.y;
        u_xlat8.y = x_1491;
        let x_1494 : f32 = u_xlat9.z;
        u_xlat11.y = x_1494;
        let x_1496 : vec4<f32> = u_xlat5;
        let x_1499 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1502 : vec4<f32> = u_xlat11;
        u_xlat13 = ((vec4<f32>(x_1496.x, x_1496.y, x_1496.x, x_1496.y) * vec4<f32>(x_1499.x, x_1499.y, x_1499.x, x_1499.y)) + vec4<f32>(x_1502.x, x_1502.y, x_1502.z, x_1502.y));
        let x_1505 : vec4<f32> = u_xlat5;
        let x_1508 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1511 : vec4<f32> = u_xlat11;
        let x_1513 : vec2<f32> = ((vec2<f32>(x_1505.x, x_1505.y) * vec2<f32>(x_1508.x, x_1508.y)) + vec2<f32>(x_1511.w, x_1511.y));
        let x_1514 : vec4<f32> = u_xlat14;
        u_xlat14 = vec4<f32>(x_1513.x, x_1513.y, x_1514.z, x_1514.w);
        let x_1517 : f32 = u_xlat11.y;
        u_xlat8.z = x_1517;
        let x_1520 : vec4<f32> = u_xlat5;
        let x_1523 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1526 : vec4<f32> = u_xlat8;
        u_xlat15 = ((vec4<f32>(x_1520.x, x_1520.y, x_1520.x, x_1520.y) * vec4<f32>(x_1523.x, x_1523.y, x_1523.x, x_1523.y)) + vec4<f32>(x_1526.x, x_1526.y, x_1526.x, x_1526.z));
        let x_1530 : f32 = u_xlat9.w;
        u_xlat11.y = x_1530;
        let x_1533 : vec4<f32> = u_xlat5;
        let x_1536 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1539 : vec4<f32> = u_xlat11;
        u_xlat16 = ((vec4<f32>(x_1533.x, x_1533.y, x_1533.x, x_1533.y) * vec4<f32>(x_1536.x, x_1536.y, x_1536.x, x_1536.y)) + vec4<f32>(x_1539.x, x_1539.y, x_1539.z, x_1539.y));
        let x_1543 : vec4<f32> = u_xlat5;
        let x_1546 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1549 : vec4<f32> = u_xlat11;
        let x_1551 : vec2<f32> = ((vec2<f32>(x_1543.x, x_1543.y) * vec2<f32>(x_1546.x, x_1546.y)) + vec2<f32>(x_1549.w, x_1549.y));
        let x_1552 : vec3<f32> = u_xlat28;
        u_xlat28 = vec3<f32>(x_1551.x, x_1551.y, x_1552.z);
        let x_1555 : f32 = u_xlat11.y;
        u_xlat8.w = x_1555;
        let x_1558 : vec4<f32> = u_xlat5;
        let x_1561 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1564 : vec4<f32> = u_xlat8;
        u_xlat54 = ((vec2<f32>(x_1558.x, x_1558.y) * vec2<f32>(x_1561.x, x_1561.y)) + vec2<f32>(x_1564.x, x_1564.w));
        let x_1567 : vec4<f32> = u_xlat11;
        let x_1568 : vec3<f32> = vec3<f32>(x_1567.x, x_1567.z, x_1567.w);
        let x_1569 : vec4<f32> = u_xlat9;
        u_xlat9 = vec4<f32>(x_1568.x, x_1569.y, x_1568.y, x_1568.z);
        let x_1571 : vec4<f32> = u_xlat5;
        let x_1574 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1577 : vec4<f32> = u_xlat9;
        u_xlat11 = ((vec4<f32>(x_1571.x, x_1571.y, x_1571.x, x_1571.y) * vec4<f32>(x_1574.x, x_1574.y, x_1574.x, x_1574.y)) + vec4<f32>(x_1577.x, x_1577.y, x_1577.z, x_1577.y));
        let x_1581 : vec4<f32> = u_xlat5;
        let x_1584 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1587 : vec4<f32> = u_xlat9;
        u_xlat49 = ((vec2<f32>(x_1581.x, x_1581.y) * vec2<f32>(x_1584.x, x_1584.y)) + vec2<f32>(x_1587.w, x_1587.y));
        let x_1591 : f32 = u_xlat8.x;
        u_xlat9.x = x_1591;
        let x_1593 : vec4<f32> = u_xlat5;
        let x_1596 : vec4<f32> = x_726.x_MainLightShadowmapSize;
        let x_1599 : vec4<f32> = u_xlat9;
        let x_1601 : vec2<f32> = ((vec2<f32>(x_1593.x, x_1593.y) * vec2<f32>(x_1596.x, x_1596.y)) + vec2<f32>(x_1599.x, x_1599.y));
        let x_1602 : vec4<f32> = u_xlat5;
        u_xlat5 = vec4<f32>(x_1601.x, x_1601.y, x_1602.z, x_1602.w);
        let x_1605 : vec4<f32> = u_xlat7;
        let x_1607 : vec4<f32> = u_xlat10;
        u_xlat17 = (vec4<f32>(x_1605.x, x_1605.x, x_1605.x, x_1605.x) * x_1607);
        let x_1610 : vec4<f32> = u_xlat7;
        let x_1612 : vec4<f32> = u_xlat10;
        u_xlat18 = (vec4<f32>(x_1610.y, x_1610.y, x_1610.y, x_1610.y) * x_1612);
        let x_1615 : vec4<f32> = u_xlat7;
        let x_1617 : vec4<f32> = u_xlat10;
        u_xlat19 = (vec4<f32>(x_1615.z, x_1615.z, x_1615.z, x_1615.z) * x_1617);
        let x_1619 : vec4<f32> = u_xlat7;
        let x_1621 : vec4<f32> = u_xlat10;
        u_xlat7 = (vec4<f32>(x_1619.w, x_1619.w, x_1619.w, x_1619.w) * x_1621);
        let x_1624 : vec4<f32> = u_xlat12;
        let x_1625 : vec2<f32> = vec2<f32>(x_1624.x, x_1624.y);
        let x_1627 : f32 = vs_INTERP8.z;
        txVec13 = vec3<f32>(x_1625.x, x_1625.y, x_1627);
        let x_1634 : vec3<f32> = txVec13;
        let x_1636 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1634.xy, x_1634.z);
        u_xlat66 = x_1636;
        let x_1638 : vec4<f32> = u_xlat12;
        let x_1639 : vec2<f32> = vec2<f32>(x_1638.z, x_1638.w);
        let x_1641 : f32 = vs_INTERP8.z;
        txVec14 = vec3<f32>(x_1639.x, x_1639.y, x_1641);
        let x_1648 : vec3<f32> = txVec14;
        let x_1650 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1648.xy, x_1648.z);
        u_xlat8.x = x_1650;
        let x_1653 : f32 = u_xlat8.x;
        let x_1655 : f32 = u_xlat17.y;
        u_xlat8.x = (x_1653 * x_1655);
        let x_1659 : f32 = u_xlat17.x;
        let x_1660 : f32 = u_xlat66;
        let x_1663 : f32 = u_xlat8.x;
        u_xlat66 = ((x_1659 * x_1660) + x_1663);
        let x_1666 : vec2<f32> = u_xlat45;
        let x_1668 : f32 = vs_INTERP8.z;
        txVec15 = vec3<f32>(x_1666.x, x_1666.y, x_1668);
        let x_1675 : vec3<f32> = txVec15;
        let x_1677 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1675.xy, x_1675.z);
        u_xlat45.x = x_1677;
        let x_1680 : f32 = u_xlat17.z;
        let x_1682 : f32 = u_xlat45.x;
        let x_1684 : f32 = u_xlat66;
        u_xlat45.x = ((x_1680 * x_1682) + x_1684);
        let x_1688 : vec4<f32> = u_xlat15;
        let x_1689 : vec2<f32> = vec2<f32>(x_1688.x, x_1688.y);
        let x_1691 : f32 = vs_INTERP8.z;
        txVec16 = vec3<f32>(x_1689.x, x_1689.y, x_1691);
        let x_1699 : vec3<f32> = txVec16;
        let x_1701 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1699.xy, x_1699.z);
        u_xlat65 = x_1701;
        let x_1703 : f32 = u_xlat17.w;
        let x_1704 : f32 = u_xlat65;
        let x_1707 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1703 * x_1704) + x_1707);
        let x_1711 : vec4<f32> = u_xlat13;
        let x_1712 : vec2<f32> = vec2<f32>(x_1711.x, x_1711.y);
        let x_1714 : f32 = vs_INTERP8.z;
        txVec17 = vec3<f32>(x_1712.x, x_1712.y, x_1714);
        let x_1721 : vec3<f32> = txVec17;
        let x_1723 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1721.xy, x_1721.z);
        u_xlat65 = x_1723;
        let x_1725 : f32 = u_xlat18.x;
        let x_1726 : f32 = u_xlat65;
        let x_1729 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1725 * x_1726) + x_1729);
        let x_1733 : vec4<f32> = u_xlat13;
        let x_1734 : vec2<f32> = vec2<f32>(x_1733.z, x_1733.w);
        let x_1736 : f32 = vs_INTERP8.z;
        txVec18 = vec3<f32>(x_1734.x, x_1734.y, x_1736);
        let x_1743 : vec3<f32> = txVec18;
        let x_1745 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1743.xy, x_1743.z);
        u_xlat65 = x_1745;
        let x_1747 : f32 = u_xlat18.y;
        let x_1748 : f32 = u_xlat65;
        let x_1751 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1747 * x_1748) + x_1751);
        let x_1755 : vec4<f32> = u_xlat14;
        let x_1756 : vec2<f32> = vec2<f32>(x_1755.x, x_1755.y);
        let x_1758 : f32 = vs_INTERP8.z;
        txVec19 = vec3<f32>(x_1756.x, x_1756.y, x_1758);
        let x_1765 : vec3<f32> = txVec19;
        let x_1767 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1765.xy, x_1765.z);
        u_xlat65 = x_1767;
        let x_1769 : f32 = u_xlat18.z;
        let x_1770 : f32 = u_xlat65;
        let x_1773 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1769 * x_1770) + x_1773);
        let x_1777 : vec4<f32> = u_xlat15;
        let x_1778 : vec2<f32> = vec2<f32>(x_1777.z, x_1777.w);
        let x_1780 : f32 = vs_INTERP8.z;
        txVec20 = vec3<f32>(x_1778.x, x_1778.y, x_1780);
        let x_1787 : vec3<f32> = txVec20;
        let x_1789 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1787.xy, x_1787.z);
        u_xlat65 = x_1789;
        let x_1791 : f32 = u_xlat18.w;
        let x_1792 : f32 = u_xlat65;
        let x_1795 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1791 * x_1792) + x_1795);
        let x_1799 : vec4<f32> = u_xlat16;
        let x_1800 : vec2<f32> = vec2<f32>(x_1799.x, x_1799.y);
        let x_1802 : f32 = vs_INTERP8.z;
        txVec21 = vec3<f32>(x_1800.x, x_1800.y, x_1802);
        let x_1809 : vec3<f32> = txVec21;
        let x_1811 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1809.xy, x_1809.z);
        u_xlat65 = x_1811;
        let x_1813 : f32 = u_xlat19.x;
        let x_1814 : f32 = u_xlat65;
        let x_1817 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1813 * x_1814) + x_1817);
        let x_1821 : vec4<f32> = u_xlat16;
        let x_1822 : vec2<f32> = vec2<f32>(x_1821.z, x_1821.w);
        let x_1824 : f32 = vs_INTERP8.z;
        txVec22 = vec3<f32>(x_1822.x, x_1822.y, x_1824);
        let x_1831 : vec3<f32> = txVec22;
        let x_1833 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1831.xy, x_1831.z);
        u_xlat65 = x_1833;
        let x_1835 : f32 = u_xlat19.y;
        let x_1836 : f32 = u_xlat65;
        let x_1839 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1835 * x_1836) + x_1839);
        let x_1843 : vec3<f32> = u_xlat28;
        let x_1844 : vec2<f32> = vec2<f32>(x_1843.x, x_1843.y);
        let x_1846 : f32 = vs_INTERP8.z;
        txVec23 = vec3<f32>(x_1844.x, x_1844.y, x_1846);
        let x_1853 : vec3<f32> = txVec23;
        let x_1855 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1853.xy, x_1853.z);
        u_xlat65 = x_1855;
        let x_1857 : f32 = u_xlat19.z;
        let x_1858 : f32 = u_xlat65;
        let x_1861 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1857 * x_1858) + x_1861);
        let x_1865 : vec2<f32> = u_xlat54;
        let x_1867 : f32 = vs_INTERP8.z;
        txVec24 = vec3<f32>(x_1865.x, x_1865.y, x_1867);
        let x_1874 : vec3<f32> = txVec24;
        let x_1876 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1874.xy, x_1874.z);
        u_xlat65 = x_1876;
        let x_1878 : f32 = u_xlat19.w;
        let x_1879 : f32 = u_xlat65;
        let x_1882 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1878 * x_1879) + x_1882);
        let x_1886 : vec4<f32> = u_xlat11;
        let x_1887 : vec2<f32> = vec2<f32>(x_1886.x, x_1886.y);
        let x_1889 : f32 = vs_INTERP8.z;
        txVec25 = vec3<f32>(x_1887.x, x_1887.y, x_1889);
        let x_1896 : vec3<f32> = txVec25;
        let x_1898 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1896.xy, x_1896.z);
        u_xlat65 = x_1898;
        let x_1900 : f32 = u_xlat7.x;
        let x_1901 : f32 = u_xlat65;
        let x_1904 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1900 * x_1901) + x_1904);
        let x_1908 : vec4<f32> = u_xlat11;
        let x_1909 : vec2<f32> = vec2<f32>(x_1908.z, x_1908.w);
        let x_1911 : f32 = vs_INTERP8.z;
        txVec26 = vec3<f32>(x_1909.x, x_1909.y, x_1911);
        let x_1918 : vec3<f32> = txVec26;
        let x_1920 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1918.xy, x_1918.z);
        u_xlat65 = x_1920;
        let x_1922 : f32 = u_xlat7.y;
        let x_1923 : f32 = u_xlat65;
        let x_1926 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1922 * x_1923) + x_1926);
        let x_1930 : vec2<f32> = u_xlat49;
        let x_1932 : f32 = vs_INTERP8.z;
        txVec27 = vec3<f32>(x_1930.x, x_1930.y, x_1932);
        let x_1939 : vec3<f32> = txVec27;
        let x_1941 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1939.xy, x_1939.z);
        u_xlat65 = x_1941;
        let x_1943 : f32 = u_xlat7.z;
        let x_1944 : f32 = u_xlat65;
        let x_1947 : f32 = u_xlat45.x;
        u_xlat45.x = ((x_1943 * x_1944) + x_1947);
        let x_1951 : vec4<f32> = u_xlat5;
        let x_1952 : vec2<f32> = vec2<f32>(x_1951.x, x_1951.y);
        let x_1954 : f32 = vs_INTERP8.z;
        txVec28 = vec3<f32>(x_1952.x, x_1952.y, x_1954);
        let x_1961 : vec3<f32> = txVec28;
        let x_1963 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1961.xy, x_1961.z);
        u_xlat5.x = x_1963;
        let x_1966 : f32 = u_xlat7.w;
        let x_1968 : f32 = u_xlat5.x;
        let x_1971 : f32 = u_xlat45.x;
        u_xlat63 = ((x_1966 * x_1968) + x_1971);
      }
    }
  } else {
    let x_1975 : vec4<f32> = vs_INTERP8;
    let x_1976 : vec2<f32> = vec2<f32>(x_1975.x, x_1975.y);
    let x_1978 : f32 = vs_INTERP8.z;
    txVec29 = vec3<f32>(x_1976.x, x_1976.y, x_1978);
    let x_1985 : vec3<f32> = txVec29;
    let x_1987 : f32 = textureSampleCompareLevel(x_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, x_1985.xy, x_1985.z);
    u_xlat63 = x_1987;
  }
  let x_1989 : f32 = x_726.x_MainLightShadowParams.x;
  u_xlat5.x = (-(x_1989) + 1.0f);
  let x_1993 : f32 = u_xlat63;
  let x_1995 : f32 = x_726.x_MainLightShadowParams.x;
  let x_1998 : f32 = u_xlat5.x;
  u_xlat63 = ((x_1993 * x_1995) + x_1998);
  let x_2001 : f32 = vs_INTERP8.z;
  u_xlatb5 = (0.0f >= x_2001);
  let x_2005 : f32 = vs_INTERP8.z;
  u_xlatb25 = (x_2005 >= 1.0f);
  let x_2007 : bool = u_xlatb25;
  let x_2008 : bool = u_xlatb5;
  u_xlatb5 = (x_2007 | x_2008);
  let x_2010 : bool = u_xlatb5;
  let x_2011 : f32 = u_xlat63;
  u_xlat63 = select(x_2011, 1.0f, x_2010);
  let x_2013 : vec3<f32> = vs_INTERP0;
  let x_2015 : vec3<f32> = x_44.x_WorldSpaceCameraPos;
  let x_2017 : vec3<f32> = (x_2013 + -(x_2015));
  let x_2018 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_2017.x, x_2017.y, x_2017.z, x_2018.w);
  let x_2020 : vec4<f32> = u_xlat5;
  let x_2022 : vec4<f32> = u_xlat5;
  u_xlat5.x = dot(vec3<f32>(x_2020.x, x_2020.y, x_2020.z), vec3<f32>(x_2022.x, x_2022.y, x_2022.z));
  let x_2027 : f32 = u_xlat5.x;
  let x_2029 : f32 = x_726.x_MainLightShadowParams.z;
  let x_2032 : f32 = x_726.x_MainLightShadowParams.w;
  u_xlat5.x = ((x_2027 * x_2029) + x_2032);
  let x_2036 : f32 = u_xlat5.x;
  u_xlat5.x = clamp(x_2036, 0.0f, 1.0f);
  let x_2039 : f32 = u_xlat63;
  u_xlat25 = (-(x_2039) + 1.0f);
  let x_2043 : f32 = u_xlat5.x;
  let x_2044 : f32 = u_xlat25;
  let x_2046 : f32 = u_xlat63;
  u_xlat63 = ((x_2043 * x_2044) + x_2046);
  let x_2054 : f32 = x_2052.x_MainLightCookieTextureFormat;
  u_xlatb5 = !((x_2054 == -1.0f));
  let x_2056 : bool = u_xlatb5;
  if (x_2056) {
    let x_2059 : vec3<f32> = vs_INTERP0;
    let x_2062 : vec4<f32> = x_2052.x_MainLightWorldToLight[1i];
    let x_2064 : vec2<f32> = (vec2<f32>(x_2059.y, x_2059.y) * vec2<f32>(x_2062.x, x_2062.y));
    let x_2065 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_2064.x, x_2064.y, x_2065.z, x_2065.w);
    let x_2068 : vec4<f32> = x_2052.x_MainLightWorldToLight[0i];
    let x_2070 : vec3<f32> = vs_INTERP0;
    let x_2073 : vec4<f32> = u_xlat5;
    let x_2075 : vec2<f32> = ((vec2<f32>(x_2068.x, x_2068.y) * vec2<f32>(x_2070.x, x_2070.x)) + vec2<f32>(x_2073.x, x_2073.y));
    let x_2076 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_2075.x, x_2075.y, x_2076.z, x_2076.w);
    let x_2079 : vec4<f32> = x_2052.x_MainLightWorldToLight[2i];
    let x_2081 : vec3<f32> = vs_INTERP0;
    let x_2084 : vec4<f32> = u_xlat5;
    let x_2086 : vec2<f32> = ((vec2<f32>(x_2079.x, x_2079.y) * vec2<f32>(x_2081.z, x_2081.z)) + vec2<f32>(x_2084.x, x_2084.y));
    let x_2087 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_2086.x, x_2086.y, x_2087.z, x_2087.w);
    let x_2089 : vec4<f32> = u_xlat5;
    let x_2092 : vec4<f32> = x_2052.x_MainLightWorldToLight[3i];
    let x_2094 : vec2<f32> = (vec2<f32>(x_2089.x, x_2089.y) + vec2<f32>(x_2092.x, x_2092.y));
    let x_2095 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_2094.x, x_2094.y, x_2095.z, x_2095.w);
    let x_2097 : vec4<f32> = u_xlat5;
    let x_2100 : vec2<f32> = ((vec2<f32>(x_2097.x, x_2097.y) * vec2<f32>(0.5f, 0.5f)) + vec2<f32>(0.5f, 0.5f));
    let x_2101 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_2100.x, x_2100.y, x_2101.z, x_2101.w);
    let x_2108 : vec4<f32> = u_xlat5;
    let x_2111 : f32 = x_44.x_GlobalMipBias.x;
    let x_2112 : vec4<f32> = textureSampleBias(x_MainLightCookieTexture, sampler_MainLightCookieTexture, vec2<f32>(x_2108.x, x_2108.y), x_2111);
    u_xlat5 = x_2112;
    let x_2115 : f32 = x_2052.x_MainLightCookieTextureFormat;
    let x_2117 : f32 = x_2052.x_MainLightCookieTextureFormat;
    let x_2119 : f32 = x_2052.x_MainLightCookieTextureFormat;
    let x_2121 : f32 = x_2052.x_MainLightCookieTextureFormat;
    let x_2122 : vec4<f32> = vec4<f32>(x_2115, x_2117, x_2119, x_2121);
    let x_2130 : vec4<bool> = (vec4<f32>(x_2122.x, x_2122.y, x_2122.z, x_2122.w) == vec4<f32>(0.0f, 1.0f, 0.0f, 0.0f));
    u_xlatb7 = vec2<bool>(x_2130.x, x_2130.y);
    let x_2133 : bool = u_xlatb7.y;
    if (x_2133) {
      let x_2138 : f32 = u_xlat5.w;
      x_2134 = x_2138;
    } else {
      let x_2141 : f32 = u_xlat5.x;
      x_2134 = x_2141;
    }
    let x_2142 : f32 = x_2134;
    u_xlat65 = x_2142;
    let x_2144 : bool = u_xlatb7.x;
    if (x_2144) {
      let x_2148 : vec4<f32> = u_xlat5;
      x_2145 = vec3<f32>(x_2148.x, x_2148.y, x_2148.z);
    } else {
      let x_2151 : f32 = u_xlat65;
      x_2145 = vec3<f32>(x_2151, x_2151, x_2151);
    }
    let x_2153 : vec3<f32> = x_2145;
    let x_2154 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_2153.x, x_2153.y, x_2153.z, x_2154.w);
  } else {
    u_xlat5.x = 1.0f;
    u_xlat5.y = 1.0f;
    u_xlat5.z = 1.0f;
  }
  let x_2160 : vec4<f32> = u_xlat5;
  let x_2163 : vec4<f32> = x_44.x_MainLightColor;
  let x_2165 : vec3<f32> = (vec3<f32>(x_2160.x, x_2160.y, x_2160.z) * vec3<f32>(x_2163.x, x_2163.y, x_2163.z));
  let x_2166 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_2165.x, x_2165.y, x_2165.z, x_2166.w);
  let x_2168 : f32 = u_xlat64;
  let x_2170 : vec4<f32> = u_xlat5;
  let x_2172 : vec3<f32> = (vec3<f32>(x_2168, x_2168, x_2168) * vec3<f32>(x_2170.x, x_2170.y, x_2170.z));
  let x_2173 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_2172.x, x_2172.y, x_2172.z, x_2173.w);
  let x_2175 : vec3<f32> = u_xlat4;
  let x_2177 : vec4<f32> = u_xlat1;
  u_xlat65 = dot(-(x_2175), vec3<f32>(x_2177.x, x_2177.y, x_2177.z));
  let x_2180 : f32 = u_xlat65;
  let x_2181 : f32 = u_xlat65;
  u_xlat65 = (x_2180 + x_2181);
  let x_2183 : vec4<f32> = u_xlat1;
  let x_2185 : f32 = u_xlat65;
  let x_2189 : vec3<f32> = u_xlat4;
  let x_2191 : vec3<f32> = ((vec3<f32>(x_2183.x, x_2183.y, x_2183.z) * -(vec3<f32>(x_2185, x_2185, x_2185))) + -(x_2189));
  let x_2192 : vec4<f32> = u_xlat7;
  u_xlat7 = vec4<f32>(x_2191.x, x_2191.y, x_2191.z, x_2192.w);
  let x_2194 : vec4<f32> = u_xlat1;
  let x_2196 : vec3<f32> = u_xlat4;
  u_xlat65 = dot(vec3<f32>(x_2194.x, x_2194.y, x_2194.z), x_2196);
  let x_2198 : f32 = u_xlat65;
  u_xlat65 = clamp(x_2198, 0.0f, 1.0f);
  let x_2200 : f32 = u_xlat65;
  u_xlat65 = (-(x_2200) + 1.0f);
  let x_2203 : f32 = u_xlat65;
  let x_2204 : f32 = u_xlat65;
  u_xlat65 = (x_2203 * x_2204);
  let x_2206 : f32 = u_xlat65;
  let x_2207 : f32 = u_xlat65;
  u_xlat65 = (x_2206 * x_2207);
  let x_2209 : f32 = u_xlat60;
  u_xlat66 = ((-(x_2209) * 0.699999988f) + 1.700000048f);
  let x_2215 : f32 = u_xlat60;
  let x_2216 : f32 = u_xlat66;
  u_xlat60 = (x_2215 * x_2216);
  let x_2218 : f32 = u_xlat60;
  u_xlat60 = (x_2218 * 6.0f);
  let x_2228 : vec4<f32> = u_xlat7;
  let x_2230 : f32 = u_xlat60;
  let x_2231 : vec4<f32> = textureSampleLevel(unity_SpecCube0, samplerunity_SpecCube0, vec3<f32>(x_2228.x, x_2228.y, x_2228.z), x_2230);
  u_xlat7 = x_2231;
  let x_2233 : f32 = u_xlat7.w;
  u_xlat60 = (x_2233 + -1.0f);
  let x_2236 : f32 = x_359.unity_SpecCube0_HDR.w;
  let x_2237 : f32 = u_xlat60;
  u_xlat60 = ((x_2236 * x_2237) + 1.0f);
  let x_2240 : f32 = u_xlat60;
  u_xlat60 = max(x_2240, 0.0f);
  let x_2242 : f32 = u_xlat60;
  u_xlat60 = log2(x_2242);
  let x_2244 : f32 = u_xlat60;
  let x_2246 : f32 = x_359.unity_SpecCube0_HDR.y;
  u_xlat60 = (x_2244 * x_2246);
  let x_2248 : f32 = u_xlat60;
  u_xlat60 = exp2(x_2248);
  let x_2250 : f32 = u_xlat60;
  let x_2252 : f32 = x_359.unity_SpecCube0_HDR.x;
  u_xlat60 = (x_2250 * x_2252);
  let x_2254 : vec4<f32> = u_xlat7;
  let x_2256 : f32 = u_xlat60;
  let x_2258 : vec3<f32> = (vec3<f32>(x_2254.x, x_2254.y, x_2254.z) * vec3<f32>(x_2256, x_2256, x_2256));
  let x_2259 : vec4<f32> = u_xlat7;
  u_xlat7 = vec4<f32>(x_2258.x, x_2258.y, x_2258.z, x_2259.w);
  let x_2261 : vec4<f32> = u_xlat2;
  let x_2263 : vec4<f32> = u_xlat2;
  let x_2267 : vec2<f32> = ((vec2<f32>(x_2261.x, x_2261.x) * vec2<f32>(x_2263.x, x_2263.x)) + vec2<f32>(-1.0f, 1.0f));
  let x_2268 : vec4<f32> = u_xlat8;
  u_xlat8 = vec4<f32>(x_2267.x, x_2267.y, x_2268.z, x_2268.w);
  let x_2271 : f32 = u_xlat8.y;
  u_xlat60 = (1.0f / x_2271);
  let x_2273 : vec4<f32> = u_xlat0;
  let x_2276 : f32 = u_xlat61;
  u_xlat28 = (-(vec3<f32>(x_2273.x, x_2273.y, x_2273.z)) + vec3<f32>(x_2276, x_2276, x_2276));
  let x_2279 : f32 = u_xlat65;
  let x_2281 : vec3<f32> = u_xlat28;
  let x_2283 : vec4<f32> = u_xlat0;
  u_xlat28 = ((vec3<f32>(x_2279, x_2279, x_2279) * x_2281) + vec3<f32>(x_2283.x, x_2283.y, x_2283.z));
  let x_2286 : f32 = u_xlat60;
  let x_2288 : vec3<f32> = u_xlat28;
  u_xlat28 = (vec3<f32>(x_2286, x_2286, x_2286) * x_2288);
  let x_2290 : vec4<f32> = u_xlat7;
  let x_2292 : vec3<f32> = u_xlat28;
  let x_2293 : vec3<f32> = (vec3<f32>(x_2290.x, x_2290.y, x_2290.z) * x_2292);
  let x_2294 : vec4<f32> = u_xlat7;
  u_xlat7 = vec4<f32>(x_2293.x, x_2293.y, x_2293.z, x_2294.w);
  let x_2296 : vec4<f32> = u_xlat3;
  let x_2298 : vec3<f32> = u_xlat6;
  let x_2300 : vec4<f32> = u_xlat7;
  let x_2302 : vec3<f32> = ((vec3<f32>(x_2296.x, x_2296.y, x_2296.z) * x_2298) + vec3<f32>(x_2300.x, x_2300.y, x_2300.z));
  let x_2303 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_2302.x, x_2302.y, x_2302.z, x_2303.w);
  let x_2305 : f32 = u_xlat63;
  let x_2308 : f32 = x_359.unity_LightData.z;
  u_xlat60 = (x_2305 * x_2308);
  let x_2310 : vec4<f32> = u_xlat1;
  let x_2313 : vec4<f32> = x_44.x_MainLightPosition;
  u_xlat61 = dot(vec3<f32>(x_2310.x, x_2310.y, x_2310.z), vec3<f32>(x_2313.x, x_2313.y, x_2313.z));
  let x_2316 : f32 = u_xlat61;
  u_xlat61 = clamp(x_2316, 0.0f, 1.0f);
  let x_2318 : f32 = u_xlat60;
  let x_2319 : f32 = u_xlat61;
  u_xlat60 = (x_2318 * x_2319);
  let x_2321 : f32 = u_xlat60;
  let x_2323 : vec4<f32> = u_xlat5;
  let x_2325 : vec3<f32> = (vec3<f32>(x_2321, x_2321, x_2321) * vec3<f32>(x_2323.x, x_2323.y, x_2323.z));
  let x_2326 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_2325.x, x_2325.y, x_2325.z, x_2326.w);
  let x_2328 : vec3<f32> = u_xlat4;
  let x_2330 : vec4<f32> = x_44.x_MainLightPosition;
  let x_2332 : vec3<f32> = (x_2328 + vec3<f32>(x_2330.x, x_2330.y, x_2330.z));
  let x_2333 : vec4<f32> = u_xlat7;
  u_xlat7 = vec4<f32>(x_2332.x, x_2332.y, x_2332.z, x_2333.w);
  let x_2335 : vec4<f32> = u_xlat7;
  let x_2337 : vec4<f32> = u_xlat7;
  u_xlat60 = dot(vec3<f32>(x_2335.x, x_2335.y, x_2335.z), vec3<f32>(x_2337.x, x_2337.y, x_2337.z));
  let x_2340 : f32 = u_xlat60;
  u_xlat60 = max(x_2340, 1.17549435e-37f);
  let x_2343 : f32 = u_xlat60;
  u_xlat60 = inverseSqrt(x_2343);
  let x_2345 : f32 = u_xlat60;
  let x_2347 : vec4<f32> = u_xlat7;
  let x_2349 : vec3<f32> = (vec3<f32>(x_2345, x_2345, x_2345) * vec3<f32>(x_2347.x, x_2347.y, x_2347.z));
  let x_2350 : vec4<f32> = u_xlat7;
  u_xlat7 = vec4<f32>(x_2349.x, x_2349.y, x_2349.z, x_2350.w);
  let x_2352 : vec4<f32> = u_xlat1;
  let x_2354 : vec4<f32> = u_xlat7;
  u_xlat60 = dot(vec3<f32>(x_2352.x, x_2352.y, x_2352.z), vec3<f32>(x_2354.x, x_2354.y, x_2354.z));
  let x_2357 : f32 = u_xlat60;
  u_xlat60 = clamp(x_2357, 0.0f, 1.0f);
  let x_2360 : vec4<f32> = x_44.x_MainLightPosition;
  let x_2362 : vec4<f32> = u_xlat7;
  u_xlat61 = dot(vec3<f32>(x_2360.x, x_2360.y, x_2360.z), vec3<f32>(x_2362.x, x_2362.y, x_2362.z));
  let x_2365 : f32 = u_xlat61;
  u_xlat61 = clamp(x_2365, 0.0f, 1.0f);
  let x_2367 : f32 = u_xlat60;
  let x_2368 : f32 = u_xlat60;
  u_xlat60 = (x_2367 * x_2368);
  let x_2370 : f32 = u_xlat60;
  let x_2372 : f32 = u_xlat8.x;
  u_xlat60 = ((x_2370 * x_2372) + 1.000010014f);
  let x_2376 : f32 = u_xlat61;
  let x_2377 : f32 = u_xlat61;
  u_xlat61 = (x_2376 * x_2377);
  let x_2379 : f32 = u_xlat60;
  let x_2380 : f32 = u_xlat60;
  u_xlat60 = (x_2379 * x_2380);
  let x_2382 : f32 = u_xlat61;
  u_xlat61 = max(x_2382, 0.100000001f);
  let x_2385 : f32 = u_xlat60;
  let x_2386 : f32 = u_xlat61;
  u_xlat60 = (x_2385 * x_2386);
  let x_2388 : f32 = u_xlat62;
  let x_2389 : f32 = u_xlat60;
  u_xlat60 = (x_2388 * x_2389);
  let x_2391 : f32 = u_xlat22;
  let x_2392 : f32 = u_xlat60;
  u_xlat60 = (x_2391 / x_2392);
  let x_2394 : vec4<f32> = u_xlat0;
  let x_2396 : f32 = u_xlat60;
  let x_2399 : vec3<f32> = u_xlat6;
  let x_2400 : vec3<f32> = ((vec3<f32>(x_2394.x, x_2394.y, x_2394.z) * vec3<f32>(x_2396, x_2396, x_2396)) + x_2399);
  let x_2401 : vec4<f32> = u_xlat7;
  u_xlat7 = vec4<f32>(x_2400.x, x_2400.y, x_2400.z, x_2401.w);
  let x_2403 : vec4<f32> = u_xlat5;
  let x_2405 : vec4<f32> = u_xlat7;
  let x_2407 : vec3<f32> = (vec3<f32>(x_2403.x, x_2403.y, x_2403.z) * vec3<f32>(x_2405.x, x_2405.y, x_2405.z));
  let x_2408 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_2407.x, x_2407.y, x_2407.z, x_2408.w);
  let x_2411 : f32 = x_44.x_AdditionalLightsCount.x;
  let x_2413 : f32 = x_359.unity_LightData.y;
  u_xlat60 = min(x_2411, x_2413);
  let x_2417 : f32 = u_xlat60;
  u_xlatu60 = bitcast<u32>(i32(x_2417));
  let x_2421 : f32 = x_2052.x_AdditionalLightsCookieAtlasTextureFormat;
  let x_2423 : f32 = x_2052.x_AdditionalLightsCookieAtlasTextureFormat;
  let x_2425 : f32 = x_2052.x_AdditionalLightsCookieAtlasTextureFormat;
  let x_2427 : f32 = x_2052.x_AdditionalLightsCookieAtlasTextureFormat;
  let x_2428 : vec4<f32> = vec4<f32>(x_2421, x_2423, x_2425, x_2427);
  let x_2434 : vec4<bool> = (vec4<f32>(x_2428.x, x_2428.y, x_2428.z, x_2428.w) == vec4<f32>(0.0f, 1.0f, 0.0f, 0.0f));
  u_xlatb7 = vec2<bool>(x_2434.x, x_2434.y);
  u_xlat28.x = 0.0f;
  u_xlat28.y = 0.0f;
  u_xlat28.z = 0.0f;
  u_xlatu_loop_1 = 0u;
  loop {
    let x_2445 : u32 = u_xlatu_loop_1;
    let x_2446 : u32 = u_xlatu60;
    if ((x_2445 < x_2446)) {
    } else {
      break;
    }
    let x_2449 : u32 = u_xlatu_loop_1;
    u_xlatu2 = (x_2449 >> 2u);
    let x_2453 : u32 = u_xlatu_loop_1;
    u_xlati63 = bitcast<i32>((x_2453 & 3u));
    let x_2456 : u32 = u_xlatu2;
    let x_2459 : vec4<f32> = x_359.unity_LightIndices[bitcast<i32>(x_2456)];
    let x_2469 : i32 = u_xlati63;
    indexable = array<vec4<u32>, 4u>(vec4<u32>(1065353216u, 0u, 0u, 0u), vec4<u32>(0u, 1065353216u, 0u, 0u), vec4<u32>(0u, 0u, 1065353216u, 0u), vec4<u32>(0u, 0u, 0u, 1065353216u));
    let x_2474 : vec4<u32> = indexable[x_2469];
    u_xlat2.x = dot(x_2459, bitcast<vec4<f32>>(x_2474));
    let x_2479 : f32 = u_xlat2.x;
    u_xlatu2 = bitcast<u32>(i32(x_2479));
    let x_2482 : vec3<f32> = vs_INTERP0;
    let x_2494 : u32 = u_xlatu2;
    let x_2497 : vec4<f32> = x_2493.x_AdditionalLightsPosition[bitcast<i32>(x_2494)];
    let x_2500 : u32 = u_xlatu2;
    let x_2503 : vec4<f32> = x_2493.x_AdditionalLightsPosition[bitcast<i32>(x_2500)];
    let x_2505 : vec3<f32> = ((-(x_2482) * vec3<f32>(x_2497.w, x_2497.w, x_2497.w)) + vec3<f32>(x_2503.x, x_2503.y, x_2503.z));
    let x_2506 : vec4<f32> = u_xlat9;
    u_xlat9 = vec4<f32>(x_2505.x, x_2505.y, x_2505.z, x_2506.w);
    let x_2508 : vec4<f32> = u_xlat9;
    let x_2510 : vec4<f32> = u_xlat9;
    u_xlat63 = dot(vec3<f32>(x_2508.x, x_2508.y, x_2508.z), vec3<f32>(x_2510.x, x_2510.y, x_2510.z));
    let x_2513 : f32 = u_xlat63;
    u_xlat63 = max(x_2513, 6.10351562e-05f);
    let x_2516 : f32 = u_xlat63;
    u_xlat65 = inverseSqrt(x_2516);
    let x_2518 : f32 = u_xlat65;
    let x_2520 : vec4<f32> = u_xlat9;
    let x_2522 : vec3<f32> = (vec3<f32>(x_2518, x_2518, x_2518) * vec3<f32>(x_2520.x, x_2520.y, x_2520.z));
    let x_2523 : vec4<f32> = u_xlat10;
    u_xlat10 = vec4<f32>(x_2522.x, x_2522.y, x_2522.z, x_2523.w);
    let x_2525 : f32 = u_xlat63;
    u_xlat66 = (1.0f / x_2525);
    let x_2527 : f32 = u_xlat63;
    let x_2528 : u32 = u_xlatu2;
    let x_2531 : f32 = x_2493.x_AdditionalLightsAttenuation[bitcast<i32>(x_2528)].x;
    u_xlat63 = (x_2527 * x_2531);
    let x_2533 : f32 = u_xlat63;
    let x_2535 : f32 = u_xlat63;
    u_xlat63 = ((-(x_2533) * x_2535) + 1.0f);
    let x_2538 : f32 = u_xlat63;
    u_xlat63 = max(x_2538, 0.0f);
    let x_2540 : f32 = u_xlat63;
    let x_2541 : f32 = u_xlat63;
    u_xlat63 = (x_2540 * x_2541);
    let x_2543 : f32 = u_xlat63;
    let x_2544 : f32 = u_xlat66;
    u_xlat63 = (x_2543 * x_2544);
    let x_2546 : u32 = u_xlatu2;
    let x_2549 : vec4<f32> = x_2493.x_AdditionalLightsSpotDir[bitcast<i32>(x_2546)];
    let x_2551 : vec4<f32> = u_xlat10;
    u_xlat66 = dot(vec3<f32>(x_2549.x, x_2549.y, x_2549.z), vec3<f32>(x_2551.x, x_2551.y, x_2551.z));
    let x_2554 : f32 = u_xlat66;
    let x_2555 : u32 = u_xlatu2;
    let x_2558 : f32 = x_2493.x_AdditionalLightsAttenuation[bitcast<i32>(x_2555)].z;
    let x_2560 : u32 = u_xlatu2;
    let x_2563 : f32 = x_2493.x_AdditionalLightsAttenuation[bitcast<i32>(x_2560)].w;
    u_xlat66 = ((x_2554 * x_2558) + x_2563);
    let x_2565 : f32 = u_xlat66;
    u_xlat66 = clamp(x_2565, 0.0f, 1.0f);
    let x_2567 : f32 = u_xlat66;
    let x_2568 : f32 = u_xlat66;
    u_xlat66 = (x_2567 * x_2568);
    let x_2570 : f32 = u_xlat63;
    let x_2571 : f32 = u_xlat66;
    u_xlat63 = (x_2570 * x_2571);
    let x_2574 : u32 = u_xlatu2;
    u_xlatu66 = (x_2574 >> 5u);
    let x_2577 : u32 = u_xlatu2;
    u_xlati47 = (1i << bitcast<u32>((bitcast<i32>(x_2577) & 31i)));
    let x_2583 : i32 = u_xlati47;
    let x_2585 : u32 = u_xlatu66;
    let x_2588 : f32 = x_2052.x_AdditionalLightsCookieEnableBits[bitcast<i32>(x_2585)].el;
    u_xlati66 = bitcast<i32>((bitcast<u32>(x_2583) & bitcast<u32>(x_2588)));
    let x_2592 : i32 = u_xlati66;
    if ((x_2592 != 0i)) {
      let x_2602 : u32 = u_xlatu2;
      let x_2605 : f32 = x_2601.x_AdditionalLightsLightTypes[bitcast<i32>(x_2602)].el;
      u_xlati66 = i32(x_2605);
      let x_2607 : i32 = u_xlati66;
      u_xlati47 = select(1i, 0i, (x_2607 != 0i));
      let x_2611 : u32 = u_xlatu2;
      u_xlati67 = (bitcast<i32>(x_2611) << bitcast<u32>(2i));
      let x_2614 : i32 = u_xlati47;
      if ((x_2614 != 0i)) {
        let x_2618 : vec3<f32> = vs_INTERP0;
        let x_2620 : i32 = u_xlati67;
        let x_2623 : i32 = u_xlati67;
        let x_2627 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[((x_2620 + 1i) / 4i)][((x_2623 + 1i) % 4i)];
        let x_2629 : vec3<f32> = (vec3<f32>(x_2618.y, x_2618.y, x_2618.y) * vec3<f32>(x_2627.x, x_2627.y, x_2627.w));
        let x_2630 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_2629.x, x_2629.y, x_2629.z, x_2630.w);
        let x_2632 : i32 = u_xlati67;
        let x_2634 : i32 = u_xlati67;
        let x_2637 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[(x_2632 / 4i)][(x_2634 % 4i)];
        let x_2639 : vec3<f32> = vs_INTERP0;
        let x_2642 : vec4<f32> = u_xlat11;
        let x_2644 : vec3<f32> = ((vec3<f32>(x_2637.x, x_2637.y, x_2637.w) * vec3<f32>(x_2639.x, x_2639.x, x_2639.x)) + vec3<f32>(x_2642.x, x_2642.y, x_2642.z));
        let x_2645 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_2644.x, x_2644.y, x_2644.z, x_2645.w);
        let x_2647 : i32 = u_xlati67;
        let x_2650 : i32 = u_xlati67;
        let x_2654 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[((x_2647 + 2i) / 4i)][((x_2650 + 2i) % 4i)];
        let x_2656 : vec3<f32> = vs_INTERP0;
        let x_2659 : vec4<f32> = u_xlat11;
        let x_2661 : vec3<f32> = ((vec3<f32>(x_2654.x, x_2654.y, x_2654.w) * vec3<f32>(x_2656.z, x_2656.z, x_2656.z)) + vec3<f32>(x_2659.x, x_2659.y, x_2659.z));
        let x_2662 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_2661.x, x_2661.y, x_2661.z, x_2662.w);
        let x_2664 : vec4<f32> = u_xlat11;
        let x_2666 : i32 = u_xlati67;
        let x_2669 : i32 = u_xlati67;
        let x_2673 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[((x_2666 + 3i) / 4i)][((x_2669 + 3i) % 4i)];
        let x_2675 : vec3<f32> = (vec3<f32>(x_2664.x, x_2664.y, x_2664.z) + vec3<f32>(x_2673.x, x_2673.y, x_2673.w));
        let x_2676 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_2675.x, x_2675.y, x_2675.z, x_2676.w);
        let x_2678 : vec4<f32> = u_xlat11;
        let x_2680 : vec4<f32> = u_xlat11;
        let x_2682 : vec2<f32> = (vec2<f32>(x_2678.x, x_2678.y) / vec2<f32>(x_2680.z, x_2680.z));
        let x_2683 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_2682.x, x_2682.y, x_2683.z, x_2683.w);
        let x_2685 : vec4<f32> = u_xlat11;
        let x_2688 : vec2<f32> = ((vec2<f32>(x_2685.x, x_2685.y) * vec2<f32>(0.5f, 0.5f)) + vec2<f32>(0.5f, 0.5f));
        let x_2689 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_2688.x, x_2688.y, x_2689.z, x_2689.w);
        let x_2691 : vec4<f32> = u_xlat11;
        let x_2695 : vec2<f32> = clamp(vec2<f32>(x_2691.x, x_2691.y), vec2<f32>(0.0f, 0.0f), vec2<f32>(1.0f, 1.0f));
        let x_2696 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_2695.x, x_2695.y, x_2696.z, x_2696.w);
        let x_2698 : u32 = u_xlatu2;
        let x_2701 : vec4<f32> = x_2601.x_AdditionalLightsCookieAtlasUVRects[bitcast<i32>(x_2698)];
        let x_2703 : vec4<f32> = u_xlat11;
        let x_2706 : u32 = u_xlatu2;
        let x_2709 : vec4<f32> = x_2601.x_AdditionalLightsCookieAtlasUVRects[bitcast<i32>(x_2706)];
        let x_2711 : vec2<f32> = ((vec2<f32>(x_2701.x, x_2701.y) * vec2<f32>(x_2703.x, x_2703.y)) + vec2<f32>(x_2709.z, x_2709.w));
        let x_2712 : vec4<f32> = u_xlat11;
        u_xlat11 = vec4<f32>(x_2711.x, x_2711.y, x_2712.z, x_2712.w);
      } else {
        let x_2716 : i32 = u_xlati66;
        u_xlatb66 = (x_2716 == 1i);
        let x_2718 : bool = u_xlatb66;
        u_xlati66 = select(0i, 1i, x_2718);
        let x_2720 : i32 = u_xlati66;
        if ((x_2720 != 0i)) {
          let x_2725 : vec3<f32> = vs_INTERP0;
          let x_2727 : i32 = u_xlati67;
          let x_2730 : i32 = u_xlati67;
          let x_2734 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[((x_2727 + 1i) / 4i)][((x_2730 + 1i) % 4i)];
          u_xlat51 = (vec2<f32>(x_2725.y, x_2725.y) * vec2<f32>(x_2734.x, x_2734.y));
          let x_2737 : i32 = u_xlati67;
          let x_2739 : i32 = u_xlati67;
          let x_2742 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[(x_2737 / 4i)][(x_2739 % 4i)];
          let x_2744 : vec3<f32> = vs_INTERP0;
          let x_2747 : vec2<f32> = u_xlat51;
          u_xlat51 = ((vec2<f32>(x_2742.x, x_2742.y) * vec2<f32>(x_2744.x, x_2744.x)) + x_2747);
          let x_2749 : i32 = u_xlati67;
          let x_2752 : i32 = u_xlati67;
          let x_2756 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[((x_2749 + 2i) / 4i)][((x_2752 + 2i) % 4i)];
          let x_2758 : vec3<f32> = vs_INTERP0;
          let x_2761 : vec2<f32> = u_xlat51;
          u_xlat51 = ((vec2<f32>(x_2756.x, x_2756.y) * vec2<f32>(x_2758.z, x_2758.z)) + x_2761);
          let x_2763 : vec2<f32> = u_xlat51;
          let x_2764 : i32 = u_xlati67;
          let x_2767 : i32 = u_xlati67;
          let x_2771 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[((x_2764 + 3i) / 4i)][((x_2767 + 3i) % 4i)];
          u_xlat51 = (x_2763 + vec2<f32>(x_2771.x, x_2771.y));
          let x_2774 : vec2<f32> = u_xlat51;
          u_xlat51 = ((x_2774 * vec2<f32>(0.5f, 0.5f)) + vec2<f32>(0.5f, 0.5f));
          let x_2777 : vec2<f32> = u_xlat51;
          u_xlat51 = fract(x_2777);
          let x_2779 : u32 = u_xlatu2;
          let x_2782 : vec4<f32> = x_2601.x_AdditionalLightsCookieAtlasUVRects[bitcast<i32>(x_2779)];
          let x_2784 : vec2<f32> = u_xlat51;
          let x_2786 : u32 = u_xlatu2;
          let x_2789 : vec4<f32> = x_2601.x_AdditionalLightsCookieAtlasUVRects[bitcast<i32>(x_2786)];
          let x_2791 : vec2<f32> = ((vec2<f32>(x_2782.x, x_2782.y) * x_2784) + vec2<f32>(x_2789.z, x_2789.w));
          let x_2792 : vec4<f32> = u_xlat11;
          u_xlat11 = vec4<f32>(x_2791.x, x_2791.y, x_2792.z, x_2792.w);
        } else {
          let x_2795 : vec3<f32> = vs_INTERP0;
          let x_2797 : i32 = u_xlati67;
          let x_2800 : i32 = u_xlati67;
          let x_2804 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[((x_2797 + 1i) / 4i)][((x_2800 + 1i) % 4i)];
          u_xlat12 = (vec4<f32>(x_2795.y, x_2795.y, x_2795.y, x_2795.y) * x_2804);
          let x_2806 : i32 = u_xlati67;
          let x_2808 : i32 = u_xlati67;
          let x_2811 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[(x_2806 / 4i)][(x_2808 % 4i)];
          let x_2812 : vec3<f32> = vs_INTERP0;
          let x_2815 : vec4<f32> = u_xlat12;
          u_xlat12 = ((x_2811 * vec4<f32>(x_2812.x, x_2812.x, x_2812.x, x_2812.x)) + x_2815);
          let x_2817 : i32 = u_xlati67;
          let x_2820 : i32 = u_xlati67;
          let x_2824 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[((x_2817 + 2i) / 4i)][((x_2820 + 2i) % 4i)];
          let x_2825 : vec3<f32> = vs_INTERP0;
          let x_2828 : vec4<f32> = u_xlat12;
          u_xlat12 = ((x_2824 * vec4<f32>(x_2825.z, x_2825.z, x_2825.z, x_2825.z)) + x_2828);
          let x_2830 : vec4<f32> = u_xlat12;
          let x_2831 : i32 = u_xlati67;
          let x_2834 : i32 = u_xlati67;
          let x_2838 : vec4<f32> = x_2601.x_AdditionalLightsWorldToLights[((x_2831 + 3i) / 4i)][((x_2834 + 3i) % 4i)];
          u_xlat12 = (x_2830 + x_2838);
          let x_2840 : vec4<f32> = u_xlat12;
          let x_2842 : vec4<f32> = u_xlat12;
          let x_2844 : vec3<f32> = (vec3<f32>(x_2840.x, x_2840.y, x_2840.z) / vec3<f32>(x_2842.w, x_2842.w, x_2842.w));
          let x_2845 : vec4<f32> = u_xlat12;
          u_xlat12 = vec4<f32>(x_2844.x, x_2844.y, x_2844.z, x_2845.w);
          let x_2847 : vec4<f32> = u_xlat12;
          let x_2849 : vec4<f32> = u_xlat12;
          u_xlat66 = dot(vec3<f32>(x_2847.x, x_2847.y, x_2847.z), vec3<f32>(x_2849.x, x_2849.y, x_2849.z));
          let x_2852 : f32 = u_xlat66;
          u_xlat66 = inverseSqrt(x_2852);
          let x_2854 : f32 = u_xlat66;
          let x_2856 : vec4<f32> = u_xlat12;
          let x_2858 : vec3<f32> = (vec3<f32>(x_2854, x_2854, x_2854) * vec3<f32>(x_2856.x, x_2856.y, x_2856.z));
          let x_2859 : vec4<f32> = u_xlat12;
          u_xlat12 = vec4<f32>(x_2858.x, x_2858.y, x_2858.z, x_2859.w);
          let x_2861 : vec4<f32> = u_xlat12;
          u_xlat66 = dot(abs(vec3<f32>(x_2861.x, x_2861.y, x_2861.z)), vec3<f32>(1.0f, 1.0f, 1.0f));
          let x_2865 : f32 = u_xlat66;
          u_xlat66 = max(x_2865, 0.000001f);
          let x_2868 : f32 = u_xlat66;
          u_xlat66 = (1.0f / x_2868);
          let x_2870 : f32 = u_xlat66;
          let x_2872 : vec4<f32> = u_xlat12;
          let x_2874 : vec3<f32> = (vec3<f32>(x_2870, x_2870, x_2870) * vec3<f32>(x_2872.z, x_2872.x, x_2872.y));
          let x_2875 : vec4<f32> = u_xlat13;
          u_xlat13 = vec4<f32>(x_2874.x, x_2874.y, x_2874.z, x_2875.w);
          let x_2878 : f32 = u_xlat13.x;
          u_xlat13.x = -(x_2878);
          let x_2882 : f32 = u_xlat13.x;
          u_xlat13.x = clamp(x_2882, 0.0f, 1.0f);
          let x_2886 : vec4<f32> = u_xlat13;
          let x_2889 : vec4<bool> = (vec4<f32>(x_2886.y, x_2886.z, x_2886.y, x_2886.z) >= vec4<f32>(0.0f, 0.0f, 0.0f, 0.0f));
          u_xlatb47 = vec2<bool>(x_2889.x, x_2889.y);
          let x_2893 : bool = u_xlatb47.x;
          if (x_2893) {
            let x_2898 : f32 = u_xlat13.x;
            x_2894 = x_2898;
          } else {
            let x_2901 : f32 = u_xlat13.x;
            x_2894 = -(x_2901);
          }
          let x_2903 : f32 = x_2894;
          u_xlat47.x = x_2903;
          let x_2906 : bool = u_xlatb47.y;
          if (x_2906) {
            let x_2911 : f32 = u_xlat13.x;
            x_2907 = x_2911;
          } else {
            let x_2914 : f32 = u_xlat13.x;
            x_2907 = -(x_2914);
          }
          let x_2916 : f32 = x_2907;
          u_xlat47.y = x_2916;
          let x_2918 : vec4<f32> = u_xlat12;
          let x_2920 : f32 = u_xlat66;
          let x_2923 : vec2<f32> = u_xlat47;
          u_xlat47 = ((vec2<f32>(x_2918.x, x_2918.y) * vec2<f32>(x_2920, x_2920)) + x_2923);
          let x_2925 : vec2<f32> = u_xlat47;
          u_xlat47 = ((x_2925 * vec2<f32>(0.5f, 0.5f)) + vec2<f32>(0.5f, 0.5f));
          let x_2928 : vec2<f32> = u_xlat47;
          u_xlat47 = clamp(x_2928, vec2<f32>(0.0f, 0.0f), vec2<f32>(1.0f, 1.0f));
          let x_2932 : u32 = u_xlatu2;
          let x_2935 : vec4<f32> = x_2601.x_AdditionalLightsCookieAtlasUVRects[bitcast<i32>(x_2932)];
          let x_2937 : vec2<f32> = u_xlat47;
          let x_2939 : u32 = u_xlatu2;
          let x_2942 : vec4<f32> = x_2601.x_AdditionalLightsCookieAtlasUVRects[bitcast<i32>(x_2939)];
          let x_2944 : vec2<f32> = ((vec2<f32>(x_2935.x, x_2935.y) * x_2937) + vec2<f32>(x_2942.z, x_2942.w));
          let x_2945 : vec4<f32> = u_xlat11;
          u_xlat11 = vec4<f32>(x_2944.x, x_2944.y, x_2945.z, x_2945.w);
        }
      }
      let x_2952 : vec4<f32> = u_xlat11;
      let x_2955 : f32 = x_44.x_GlobalMipBias.x;
      let x_2956 : vec4<f32> = textureSampleBias(x_AdditionalLightsCookieAtlasTexture, sampler_AdditionalLightsCookieAtlasTexture, vec2<f32>(x_2952.x, x_2952.y), x_2955);
      u_xlat11 = x_2956;
      let x_2958 : bool = u_xlatb7.y;
      if (x_2958) {
        let x_2963 : f32 = u_xlat11.w;
        x_2959 = x_2963;
      } else {
        let x_2966 : f32 = u_xlat11.x;
        x_2959 = x_2966;
      }
      let x_2967 : f32 = x_2959;
      u_xlat66 = x_2967;
      let x_2969 : bool = u_xlatb7.x;
      if (x_2969) {
        let x_2973 : vec4<f32> = u_xlat11;
        x_2970 = vec3<f32>(x_2973.x, x_2973.y, x_2973.z);
      } else {
        let x_2976 : f32 = u_xlat66;
        x_2970 = vec3<f32>(x_2976, x_2976, x_2976);
      }
      let x_2978 : vec3<f32> = x_2970;
      let x_2979 : vec4<f32> = u_xlat11;
      u_xlat11 = vec4<f32>(x_2978.x, x_2978.y, x_2978.z, x_2979.w);
    } else {
      u_xlat11.x = 1.0f;
      u_xlat11.y = 1.0f;
      u_xlat11.z = 1.0f;
    }
    let x_2985 : vec4<f32> = u_xlat11;
    let x_2987 : u32 = u_xlatu2;
    let x_2990 : vec4<f32> = x_2493.x_AdditionalLightsColor[bitcast<i32>(x_2987)];
    let x_2992 : vec3<f32> = (vec3<f32>(x_2985.x, x_2985.y, x_2985.z) * vec3<f32>(x_2990.x, x_2990.y, x_2990.z));
    let x_2993 : vec4<f32> = u_xlat11;
    u_xlat11 = vec4<f32>(x_2992.x, x_2992.y, x_2992.z, x_2993.w);
    let x_2995 : f32 = u_xlat64;
    let x_2997 : vec4<f32> = u_xlat11;
    let x_2999 : vec3<f32> = (vec3<f32>(x_2995, x_2995, x_2995) * vec3<f32>(x_2997.x, x_2997.y, x_2997.z));
    let x_3000 : vec4<f32> = u_xlat11;
    u_xlat11 = vec4<f32>(x_2999.x, x_2999.y, x_2999.z, x_3000.w);
    let x_3002 : vec4<f32> = u_xlat1;
    let x_3004 : vec4<f32> = u_xlat10;
    u_xlat2.x = dot(vec3<f32>(x_3002.x, x_3002.y, x_3002.z), vec3<f32>(x_3004.x, x_3004.y, x_3004.z));
    let x_3009 : f32 = u_xlat2.x;
    u_xlat2.x = clamp(x_3009, 0.0f, 1.0f);
    let x_3013 : f32 = u_xlat2.x;
    let x_3014 : f32 = u_xlat63;
    u_xlat2.x = (x_3013 * x_3014);
    let x_3017 : vec4<f32> = u_xlat2;
    let x_3019 : vec4<f32> = u_xlat11;
    let x_3021 : vec3<f32> = (vec3<f32>(x_3017.x, x_3017.x, x_3017.x) * vec3<f32>(x_3019.x, x_3019.y, x_3019.z));
    let x_3022 : vec4<f32> = u_xlat11;
    u_xlat11 = vec4<f32>(x_3021.x, x_3021.y, x_3021.z, x_3022.w);
    let x_3024 : vec4<f32> = u_xlat9;
    let x_3026 : f32 = u_xlat65;
    let x_3029 : vec3<f32> = u_xlat4;
    let x_3030 : vec3<f32> = ((vec3<f32>(x_3024.x, x_3024.y, x_3024.z) * vec3<f32>(x_3026, x_3026, x_3026)) + x_3029);
    let x_3031 : vec4<f32> = u_xlat9;
    u_xlat9 = vec4<f32>(x_3030.x, x_3030.y, x_3030.z, x_3031.w);
    let x_3033 : vec4<f32> = u_xlat9;
    let x_3035 : vec4<f32> = u_xlat9;
    u_xlat2.x = dot(vec3<f32>(x_3033.x, x_3033.y, x_3033.z), vec3<f32>(x_3035.x, x_3035.y, x_3035.z));
    let x_3040 : f32 = u_xlat2.x;
    u_xlat2.x = max(x_3040, 1.17549435e-37f);
    let x_3044 : f32 = u_xlat2.x;
    u_xlat2.x = inverseSqrt(x_3044);
    let x_3047 : vec4<f32> = u_xlat2;
    let x_3049 : vec4<f32> = u_xlat9;
    let x_3051 : vec3<f32> = (vec3<f32>(x_3047.x, x_3047.x, x_3047.x) * vec3<f32>(x_3049.x, x_3049.y, x_3049.z));
    let x_3052 : vec4<f32> = u_xlat9;
    u_xlat9 = vec4<f32>(x_3051.x, x_3051.y, x_3051.z, x_3052.w);
    let x_3054 : vec4<f32> = u_xlat1;
    let x_3056 : vec4<f32> = u_xlat9;
    u_xlat2.x = dot(vec3<f32>(x_3054.x, x_3054.y, x_3054.z), vec3<f32>(x_3056.x, x_3056.y, x_3056.z));
    let x_3061 : f32 = u_xlat2.x;
    u_xlat2.x = clamp(x_3061, 0.0f, 1.0f);
    let x_3064 : vec4<f32> = u_xlat10;
    let x_3066 : vec4<f32> = u_xlat9;
    u_xlat63 = dot(vec3<f32>(x_3064.x, x_3064.y, x_3064.z), vec3<f32>(x_3066.x, x_3066.y, x_3066.z));
    let x_3069 : f32 = u_xlat63;
    u_xlat63 = clamp(x_3069, 0.0f, 1.0f);
    let x_3072 : f32 = u_xlat2.x;
    let x_3074 : f32 = u_xlat2.x;
    u_xlat2.x = (x_3072 * x_3074);
    let x_3078 : f32 = u_xlat2.x;
    let x_3080 : f32 = u_xlat8.x;
    u_xlat2.x = ((x_3078 * x_3080) + 1.000010014f);
    let x_3084 : f32 = u_xlat63;
    let x_3085 : f32 = u_xlat63;
    u_xlat63 = (x_3084 * x_3085);
    let x_3088 : f32 = u_xlat2.x;
    let x_3090 : f32 = u_xlat2.x;
    u_xlat2.x = (x_3088 * x_3090);
    let x_3093 : f32 = u_xlat63;
    u_xlat63 = max(x_3093, 0.100000001f);
    let x_3096 : f32 = u_xlat2.x;
    let x_3097 : f32 = u_xlat63;
    u_xlat2.x = (x_3096 * x_3097);
    let x_3100 : f32 = u_xlat62;
    let x_3102 : f32 = u_xlat2.x;
    u_xlat2.x = (x_3100 * x_3102);
    let x_3105 : f32 = u_xlat22;
    let x_3107 : f32 = u_xlat2.x;
    u_xlat2.x = (x_3105 / x_3107);
    let x_3110 : vec4<f32> = u_xlat0;
    let x_3112 : vec4<f32> = u_xlat2;
    let x_3115 : vec3<f32> = u_xlat6;
    let x_3116 : vec3<f32> = ((vec3<f32>(x_3110.x, x_3110.y, x_3110.z) * vec3<f32>(x_3112.x, x_3112.x, x_3112.x)) + x_3115);
    let x_3117 : vec4<f32> = u_xlat9;
    u_xlat9 = vec4<f32>(x_3116.x, x_3116.y, x_3116.z, x_3117.w);
    let x_3119 : vec4<f32> = u_xlat9;
    let x_3121 : vec4<f32> = u_xlat11;
    let x_3124 : vec3<f32> = u_xlat28;
    u_xlat28 = ((vec3<f32>(x_3119.x, x_3119.y, x_3119.z) * vec3<f32>(x_3121.x, x_3121.y, x_3121.z)) + x_3124);

    continuing {
      let x_3126 : u32 = u_xlatu_loop_1;
      u_xlatu_loop_1 = (x_3126 + bitcast<u32>(1i));
    }
  }
  let x_3128 : vec4<f32> = u_xlat3;
  let x_3130 : f32 = u_xlat42;
  let x_3133 : vec4<f32> = u_xlat5;
  let x_3135 : vec3<f32> = ((vec3<f32>(x_3128.x, x_3128.y, x_3128.z) * vec3<f32>(x_3130, x_3130, x_3130)) + vec3<f32>(x_3133.x, x_3133.y, x_3133.z));
  let x_3136 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_3135.x, x_3135.y, x_3135.z, x_3136.w);
  let x_3140 : vec3<f32> = u_xlat28;
  let x_3141 : vec4<f32> = u_xlat0;
  let x_3143 : vec3<f32> = (x_3140 + vec3<f32>(x_3141.x, x_3141.y, x_3141.z));
  let x_3144 : vec4<f32> = SV_Target0;
  SV_Target0 = vec4<f32>(x_3143.x, x_3143.y, x_3143.z, x_3144.w);
  let x_3149 : u32 = x_44.x_RenderingLayerMaxInt;
  let x_3151 : f32 = x_359.unity_RenderingLayer.x;
  u_xlatu0 = (x_3149 & bitcast<u32>(x_3151));
  let x_3154 : u32 = u_xlatu0;
  u_xlat0.x = f32(x_3154);
  let x_3159 : f32 = u_xlat0.x;
  let x_3161 : f32 = x_44.x_RenderingLayerRcpMaxInt;
  SV_Target1.x = (x_3159 * x_3161);
  let x_3166 : f32 = SV_Target1.x;
  SV_Target1.x = clamp(x_3166, 0.0f, 1.0f);
  SV_Target0.w = 1.0f;
  let x_3170 : vec4<f32> = SV_Target1;
  SV_Target1 = vec4<f32>(x_3170.x, vec3<f32>(0.0f, 0.0f, 0.0f).x, vec3<f32>(0.0f, 0.0f, 0.0f).y, vec3<f32>(0.0f, 0.0f, 0.0f).z);
  return;
}

struct main_out {
  @location(0)
  SV_Target0_1 : vec4<f32>,
  @location(1)
  SV_Target1_1 : vec4<f32>,
}

@fragment
fn main(@builtin(position) gl_FragCoord_param : vec4<f32>, @location(3) vs_INTERP3_param : vec4<f32>, @location(2) vs_INTERP2_param : vec4<f32>, @location(1) vs_INTERP1_param : vec3<f32>, @location(0) vs_INTERP0_param : vec3<f32>, @location(4) vs_INTERP8_param : vec4<f32>) -> main_out {
  gl_FragCoord = gl_FragCoord_param;
  vs_INTERP3 = vs_INTERP3_param;
  vs_INTERP2 = vs_INTERP2_param;
  vs_INTERP1 = vs_INTERP1_param;
  vs_INTERP0 = vs_INTERP0_param;
  vs_INTERP8 = vs_INTERP8_param;
  main_1();
  return main_out(SV_Target0, SV_Target1);
}

