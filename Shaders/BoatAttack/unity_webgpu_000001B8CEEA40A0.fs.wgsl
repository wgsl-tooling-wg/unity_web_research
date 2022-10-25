type Arr = array<mat4x4<f32>, 4u>;

struct PGlobals {
  x_ZBufferParams : vec4<f32>,
  unity_OrthoParams : vec4<f32>,
  unity_CameraToWorld : mat4x4<f32>,
  x_LightSplitsNear : vec4<f32>,
  x_LightSplitsFar : vec4<f32>,
  unity_WorldToShadow : Arr,
  x_LightShadowData : vec4<f32>,
  x_ShadowMapTexture_TexelSize : vec4<f32>,
}

@group(0) @binding(0) var x_CameraDepthTexture : texture_2d<f32>;

@group(0) @binding(3) var sampler_CameraDepthTexture : sampler;

var<private> vs_TEXCOORD0 : vec4<f32>;

@group(1) @binding(0) var<uniform> x_39 : PGlobals;

var<private> vs_TEXCOORD2 : vec3<f32>;

var<private> vs_TEXCOORD3 : vec3<f32>;

var<private> vs_TEXCOORD1 : vec3<f32>;

@group(0) @binding(1) var x_ShadowMapTexture : texture_depth_2d;

@group(0) @binding(2) var sampler_ShadowMapTexture : sampler_comparison;

var<private> SV_Target0 : vec4<f32>;

var<private> gl_FragCoord : vec4<f32>;

fn main_1() {
  var u_xlat0 : vec4<f32>;
  var u_xlat9 : vec3<f32>;
  var u_xlat18 : f32;
  var u_xlat1 : vec4<f32>;
  var u_xlatb1 : vec4<bool>;
  var u_xlatb2 : vec4<bool>;
  var u_xlat2 : vec4<f32>;
  var u_xlat3 : vec4<f32>;
  var u_xlat27 : f32;
  var u_xlat19 : vec2<f32>;
  var u_xlat4 : vec4<f32>;
  var u_xlat5 : vec4<f32>;
  var u_xlat6 : vec4<f32>;
  var u_xlat7 : vec4<f32>;
  var u_xlat8 : vec4<f32>;
  var txVec0 : vec3<f32>;
  var txVec1 : vec3<f32>;
  var txVec2 : vec3<f32>;
  var txVec3 : vec3<f32>;
  var txVec4 : vec3<f32>;
  var txVec5 : vec3<f32>;
  var txVec6 : vec3<f32>;
  var txVec7 : vec3<f32>;
  var txVec8 : vec3<f32>;
  var txVec9 : vec3<f32>;
  var txVec10 : vec3<f32>;
  var txVec11 : vec3<f32>;
  var txVec12 : vec3<f32>;
  var txVec13 : vec3<f32>;
  var txVec14 : vec3<f32>;
  var txVec15 : vec3<f32>;
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_23 : vec4<f32> = vs_TEXCOORD0;
  let x_25 : vec4<f32> = textureSample(x_CameraDepthTexture, sampler_CameraDepthTexture, vec2<f32>(x_23.x, x_23.y));
  u_xlat0.x = x_25.x;
  let x_44 : f32 = x_39.x_ZBufferParams.x;
  let x_46 : f32 = u_xlat0.x;
  let x_50 : f32 = x_39.x_ZBufferParams.y;
  u_xlat9.x = ((x_44 * x_46) + x_50);
  let x_55 : f32 = u_xlat9.x;
  u_xlat9.x = (1.0f / x_55);
  let x_60 : f32 = u_xlat9.x;
  let x_63 : f32 = u_xlat0.x;
  u_xlat18 = (-(x_60) + x_63);
  let x_68 : f32 = x_39.unity_OrthoParams.w;
  let x_69 : f32 = u_xlat18;
  let x_72 : f32 = u_xlat9.x;
  u_xlat9.x = ((x_68 * x_69) + x_72);
  let x_76 : f32 = u_xlat0.x;
  u_xlat0.x = (-(x_76) + 1.0f);
  let x_83 : vec3<f32> = vs_TEXCOORD2;
  let x_86 : vec3<f32> = vs_TEXCOORD3;
  let x_87 : vec3<f32> = (-(x_83) + x_86);
  let x_88 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_87.x, x_87.y, x_87.z, x_88.w);
  let x_90 : vec4<f32> = u_xlat0;
  let x_92 : vec4<f32> = u_xlat1;
  let x_95 : vec3<f32> = vs_TEXCOORD2;
  let x_96 : vec3<f32> = ((vec3<f32>(x_90.x, x_90.x, x_90.x) * vec3<f32>(x_92.x, x_92.y, x_92.z)) + x_95);
  let x_97 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_96.x, x_97.y, x_96.y, x_96.z);
  let x_100 : vec3<f32> = vs_TEXCOORD1;
  let x_102 : vec3<f32> = u_xlat9;
  let x_105 : vec4<f32> = u_xlat0;
  let x_107 : vec3<f32> = ((-(x_100) * vec3<f32>(x_102.x, x_102.x, x_102.x)) + vec3<f32>(x_105.x, x_105.z, x_105.w));
  let x_108 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_107.x, x_108.y, x_107.y, x_107.z);
  let x_110 : vec3<f32> = u_xlat9;
  let x_112 : vec3<f32> = vs_TEXCOORD1;
  let x_113 : vec3<f32> = (vec3<f32>(x_110.x, x_110.x, x_110.x) * x_112);
  let x_114 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_113.x, x_113.y, x_113.z, x_114.w);
  let x_118 : vec4<f32> = x_39.unity_OrthoParams;
  let x_120 : vec4<f32> = u_xlat0;
  let x_123 : vec4<f32> = u_xlat1;
  let x_125 : vec3<f32> = ((vec3<f32>(x_118.w, x_118.w, x_118.w) * vec3<f32>(x_120.x, x_120.z, x_120.w)) + vec3<f32>(x_123.x, x_123.y, x_123.z));
  let x_126 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_125.x, x_125.y, x_125.z, x_126.w);
  let x_132 : vec4<f32> = u_xlat0;
  let x_136 : vec4<f32> = x_39.x_LightSplitsNear;
  u_xlatb1 = (vec4<f32>(x_132.z, x_132.z, x_132.z, x_132.z) >= x_136);
  let x_140 : bool = u_xlatb1.x;
  u_xlat1.x = select(0.0f, 1.0f, x_140);
  let x_145 : bool = u_xlatb1.y;
  u_xlat1.y = select(0.0f, 1.0f, x_145);
  let x_150 : bool = u_xlatb1.z;
  u_xlat1.z = select(0.0f, 1.0f, x_150);
  let x_154 : bool = u_xlatb1.w;
  u_xlat1.w = select(0.0f, 1.0f, x_154);
  let x_158 : vec4<f32> = u_xlat0;
  let x_162 : vec4<f32> = x_39.x_LightSplitsFar;
  u_xlatb2 = (vec4<f32>(x_158.z, x_158.z, x_158.z, x_158.z) < x_162);
  let x_166 : bool = u_xlatb2.x;
  u_xlat2.x = select(0.0f, 1.0f, x_166);
  let x_170 : bool = u_xlatb2.y;
  u_xlat2.y = select(0.0f, 1.0f, x_170);
  let x_174 : bool = u_xlatb2.z;
  u_xlat2.z = select(0.0f, 1.0f, x_174);
  let x_178 : bool = u_xlatb2.w;
  u_xlat2.w = select(0.0f, 1.0f, x_178);
  let x_181 : vec4<f32> = u_xlat1;
  let x_182 : vec4<f32> = u_xlat2;
  u_xlat1 = (x_181 * x_182);
  let x_184 : vec4<f32> = u_xlat0;
  let x_188 : vec4<f32> = x_39.unity_CameraToWorld[1i];
  u_xlat2 = (vec4<f32>(x_184.y, x_184.y, x_184.y, x_184.y) * x_188);
  let x_191 : vec4<f32> = x_39.unity_CameraToWorld[0i];
  let x_192 : vec4<f32> = u_xlat0;
  let x_195 : vec4<f32> = u_xlat2;
  u_xlat2 = ((x_191 * vec4<f32>(x_192.x, x_192.x, x_192.x, x_192.x)) + x_195);
  let x_198 : vec4<f32> = x_39.unity_CameraToWorld[2i];
  let x_199 : vec4<f32> = u_xlat0;
  let x_202 : vec4<f32> = u_xlat2;
  u_xlat0 = ((x_198 * vec4<f32>(x_199.z, x_199.z, x_199.z, x_199.z)) + x_202);
  let x_204 : vec4<f32> = u_xlat0;
  let x_206 : vec4<f32> = x_39.unity_CameraToWorld[3i];
  u_xlat0 = (x_204 + x_206);
  let x_208 : vec4<f32> = u_xlat0;
  let x_212 : vec4<f32> = x_39.unity_WorldToShadow[1i][1i];
  let x_214 : vec3<f32> = (vec3<f32>(x_208.y, x_208.y, x_208.y) * vec3<f32>(x_212.x, x_212.y, x_212.z));
  let x_215 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_214.x, x_214.y, x_214.z, x_215.w);
  let x_218 : vec4<f32> = x_39.unity_WorldToShadow[1i][0i];
  let x_220 : vec4<f32> = u_xlat0;
  let x_223 : vec4<f32> = u_xlat2;
  let x_225 : vec3<f32> = ((vec3<f32>(x_218.x, x_218.y, x_218.z) * vec3<f32>(x_220.x, x_220.x, x_220.x)) + vec3<f32>(x_223.x, x_223.y, x_223.z));
  let x_226 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_225.x, x_225.y, x_225.z, x_226.w);
  let x_229 : vec4<f32> = x_39.unity_WorldToShadow[1i][2i];
  let x_231 : vec4<f32> = u_xlat0;
  let x_234 : vec4<f32> = u_xlat2;
  let x_236 : vec3<f32> = ((vec3<f32>(x_229.x, x_229.y, x_229.z) * vec3<f32>(x_231.z, x_231.z, x_231.z)) + vec3<f32>(x_234.x, x_234.y, x_234.z));
  let x_237 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_236.x, x_236.y, x_236.z, x_237.w);
  let x_240 : vec4<f32> = x_39.unity_WorldToShadow[1i][3i];
  let x_242 : vec4<f32> = u_xlat0;
  let x_245 : vec4<f32> = u_xlat2;
  let x_247 : vec3<f32> = ((vec3<f32>(x_240.x, x_240.y, x_240.z) * vec3<f32>(x_242.w, x_242.w, x_242.w)) + vec3<f32>(x_245.x, x_245.y, x_245.z));
  let x_248 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_247.x, x_247.y, x_247.z, x_248.w);
  let x_250 : vec4<f32> = u_xlat1;
  let x_252 : vec4<f32> = u_xlat2;
  let x_254 : vec3<f32> = (vec3<f32>(x_250.y, x_250.y, x_250.y) * vec3<f32>(x_252.x, x_252.y, x_252.z));
  let x_255 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_254.x, x_254.y, x_254.z, x_255.w);
  let x_258 : vec4<f32> = u_xlat0;
  let x_261 : vec4<f32> = x_39.unity_WorldToShadow[0i][1i];
  let x_263 : vec3<f32> = (vec3<f32>(x_258.y, x_258.y, x_258.y) * vec3<f32>(x_261.x, x_261.y, x_261.z));
  let x_264 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_263.x, x_263.y, x_263.z, x_264.w);
  let x_267 : vec4<f32> = x_39.unity_WorldToShadow[0i][0i];
  let x_269 : vec4<f32> = u_xlat0;
  let x_272 : vec4<f32> = u_xlat3;
  let x_274 : vec3<f32> = ((vec3<f32>(x_267.x, x_267.y, x_267.z) * vec3<f32>(x_269.x, x_269.x, x_269.x)) + vec3<f32>(x_272.x, x_272.y, x_272.z));
  let x_275 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_274.x, x_274.y, x_274.z, x_275.w);
  let x_278 : vec4<f32> = x_39.unity_WorldToShadow[0i][2i];
  let x_280 : vec4<f32> = u_xlat0;
  let x_283 : vec4<f32> = u_xlat3;
  let x_285 : vec3<f32> = ((vec3<f32>(x_278.x, x_278.y, x_278.z) * vec3<f32>(x_280.z, x_280.z, x_280.z)) + vec3<f32>(x_283.x, x_283.y, x_283.z));
  let x_286 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_285.x, x_285.y, x_285.z, x_286.w);
  let x_289 : vec4<f32> = x_39.unity_WorldToShadow[0i][3i];
  let x_291 : vec4<f32> = u_xlat0;
  let x_294 : vec4<f32> = u_xlat3;
  let x_296 : vec3<f32> = ((vec3<f32>(x_289.x, x_289.y, x_289.z) * vec3<f32>(x_291.w, x_291.w, x_291.w)) + vec3<f32>(x_294.x, x_294.y, x_294.z));
  let x_297 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_296.x, x_296.y, x_296.z, x_297.w);
  let x_299 : vec4<f32> = u_xlat3;
  let x_301 : vec4<f32> = u_xlat1;
  let x_304 : vec4<f32> = u_xlat2;
  let x_306 : vec3<f32> = ((vec3<f32>(x_299.x, x_299.y, x_299.z) * vec3<f32>(x_301.x, x_301.x, x_301.x)) + vec3<f32>(x_304.x, x_304.y, x_304.z));
  let x_307 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_306.x, x_306.y, x_306.z, x_307.w);
  let x_309 : vec4<f32> = u_xlat0;
  let x_312 : vec4<f32> = x_39.unity_WorldToShadow[2i][1i];
  let x_314 : vec3<f32> = (vec3<f32>(x_309.y, x_309.y, x_309.y) * vec3<f32>(x_312.x, x_312.y, x_312.z));
  let x_315 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_314.x, x_314.y, x_314.z, x_315.w);
  let x_318 : vec4<f32> = x_39.unity_WorldToShadow[2i][0i];
  let x_320 : vec4<f32> = u_xlat0;
  let x_323 : vec4<f32> = u_xlat3;
  let x_325 : vec3<f32> = ((vec3<f32>(x_318.x, x_318.y, x_318.z) * vec3<f32>(x_320.x, x_320.x, x_320.x)) + vec3<f32>(x_323.x, x_323.y, x_323.z));
  let x_326 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_325.x, x_325.y, x_325.z, x_326.w);
  let x_329 : vec4<f32> = x_39.unity_WorldToShadow[2i][2i];
  let x_331 : vec4<f32> = u_xlat0;
  let x_334 : vec4<f32> = u_xlat3;
  let x_336 : vec3<f32> = ((vec3<f32>(x_329.x, x_329.y, x_329.z) * vec3<f32>(x_331.z, x_331.z, x_331.z)) + vec3<f32>(x_334.x, x_334.y, x_334.z));
  let x_337 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_336.x, x_336.y, x_336.z, x_337.w);
  let x_340 : vec4<f32> = x_39.unity_WorldToShadow[2i][3i];
  let x_342 : vec4<f32> = u_xlat0;
  let x_345 : vec4<f32> = u_xlat3;
  let x_347 : vec3<f32> = ((vec3<f32>(x_340.x, x_340.y, x_340.z) * vec3<f32>(x_342.w, x_342.w, x_342.w)) + vec3<f32>(x_345.x, x_345.y, x_345.z));
  let x_348 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_347.x, x_347.y, x_347.z, x_348.w);
  let x_350 : vec4<f32> = u_xlat3;
  let x_352 : vec4<f32> = u_xlat1;
  let x_355 : vec4<f32> = u_xlat2;
  let x_357 : vec3<f32> = ((vec3<f32>(x_350.x, x_350.y, x_350.z) * vec3<f32>(x_352.z, x_352.z, x_352.z)) + vec3<f32>(x_355.x, x_355.y, x_355.z));
  let x_358 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_357.x, x_357.y, x_357.z, x_358.w);
  let x_360 : vec4<f32> = u_xlat0;
  let x_363 : vec4<f32> = x_39.unity_WorldToShadow[3i][1i];
  let x_365 : vec3<f32> = (vec3<f32>(x_360.y, x_360.y, x_360.y) * vec3<f32>(x_363.x, x_363.y, x_363.z));
  let x_366 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_365.x, x_365.y, x_365.z, x_366.w);
  let x_369 : vec4<f32> = x_39.unity_WorldToShadow[3i][0i];
  let x_371 : vec4<f32> = u_xlat0;
  let x_374 : vec4<f32> = u_xlat3;
  let x_376 : vec3<f32> = ((vec3<f32>(x_369.x, x_369.y, x_369.z) * vec3<f32>(x_371.x, x_371.x, x_371.x)) + vec3<f32>(x_374.x, x_374.y, x_374.z));
  let x_377 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_376.x, x_376.y, x_376.z, x_377.w);
  let x_380 : vec4<f32> = x_39.unity_WorldToShadow[3i][2i];
  let x_382 : vec4<f32> = u_xlat0;
  let x_385 : vec4<f32> = u_xlat3;
  let x_387 : vec3<f32> = ((vec3<f32>(x_380.x, x_380.y, x_380.z) * vec3<f32>(x_382.z, x_382.z, x_382.z)) + vec3<f32>(x_385.x, x_385.y, x_385.z));
  let x_388 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_387.x, x_387.y, x_387.z, x_388.w);
  let x_391 : vec4<f32> = x_39.unity_WorldToShadow[3i][3i];
  let x_393 : vec4<f32> = u_xlat0;
  let x_396 : vec4<f32> = u_xlat0;
  let x_398 : vec3<f32> = ((vec3<f32>(x_391.x, x_391.y, x_391.z) * vec3<f32>(x_393.w, x_393.w, x_393.w)) + vec3<f32>(x_396.x, x_396.y, x_396.z));
  let x_399 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_398.x, x_398.y, x_398.z, x_399.w);
  let x_401 : vec4<f32> = u_xlat0;
  let x_403 : vec4<f32> = u_xlat1;
  let x_406 : vec4<f32> = u_xlat2;
  let x_408 : vec3<f32> = ((vec3<f32>(x_401.x, x_401.y, x_401.z) * vec3<f32>(x_403.w, x_403.w, x_403.w)) + vec3<f32>(x_406.x, x_406.y, x_406.z));
  let x_409 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_408.x, x_408.y, x_408.z, x_409.w);
  let x_412 : vec4<f32> = u_xlat1;
  u_xlat27 = dot(x_412, vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_415 : f32 = u_xlat27;
  let x_418 : f32 = u_xlat0.z;
  u_xlat18 = (-(x_415) + x_418);
  let x_420 : f32 = u_xlat18;
  u_xlat18 = (x_420 + 1.0f);
  let x_422 : vec4<f32> = u_xlat0;
  let x_426 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_431 : vec2<f32> = ((vec2<f32>(x_422.x, x_422.y) * vec2<f32>(x_426.z, x_426.w)) + vec2<f32>(0.5f, 0.5f));
  let x_432 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_431.x, x_431.y, x_432.z, x_432.w);
  let x_434 : vec4<f32> = u_xlat1;
  let x_436 : vec2<f32> = floor(vec2<f32>(x_434.x, x_434.y));
  let x_437 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_436.x, x_436.y, x_437.z, x_437.w);
  let x_439 : vec4<f32> = u_xlat0;
  let x_442 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_445 : vec4<f32> = u_xlat1;
  let x_448 : vec2<f32> = ((vec2<f32>(x_439.x, x_439.y) * vec2<f32>(x_442.z, x_442.w)) + -(vec2<f32>(x_445.x, x_445.y)));
  let x_449 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_448.x, x_448.y, x_449.z, x_449.w);
  let x_453 : vec4<f32> = u_xlat0;
  u_xlat19 = (-(vec2<f32>(x_453.x, x_453.y)) + vec2<f32>(1.0f, 1.0f));
  let x_458 : vec4<f32> = u_xlat0;
  let x_461 : vec2<f32> = min(vec2<f32>(x_458.x, x_458.y), vec2<f32>(0.0f, 0.0f));
  let x_462 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_461.x, x_461.y, x_462.z, x_462.w);
  let x_464 : vec4<f32> = u_xlat2;
  let x_467 : vec4<f32> = u_xlat2;
  let x_470 : vec2<f32> = u_xlat19;
  u_xlat19 = ((-(vec2<f32>(x_464.x, x_464.y)) * vec2<f32>(x_467.x, x_467.y)) + x_470);
  let x_472 : vec2<f32> = u_xlat19;
  u_xlat19 = (x_472 + vec2<f32>(2.0f, 2.0f));
  let x_476 : vec2<f32> = u_xlat19;
  let x_479 : vec2<f32> = (x_476 * vec2<f32>(0.081632003f, 0.081632003f));
  let x_480 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_479.x, x_479.y, x_480.z, x_480.w);
  let x_483 : f32 = u_xlat2.x;
  u_xlat3.y = x_483;
  let x_485 : vec4<f32> = u_xlat0;
  u_xlat19 = max(vec2<f32>(x_485.x, x_485.y), vec2<f32>(0.0f, 0.0f));
  let x_489 : vec4<f32> = u_xlat0;
  u_xlat4 = (vec4<f32>(x_489.x, x_489.x, x_489.y, x_489.y) + vec4<f32>(0.5f, 1.0f, 0.5f, 1.0f));
  let x_493 : vec2<f32> = u_xlat19;
  let x_495 : vec2<f32> = u_xlat19;
  let x_497 : vec4<f32> = u_xlat4;
  u_xlat19 = ((-(x_493) * x_495) + vec2<f32>(x_497.y, x_497.w));
  let x_500 : vec4<f32> = u_xlat4;
  let x_502 : vec4<f32> = u_xlat4;
  u_xlat4 = (vec4<f32>(x_500.x, x_500.x, x_500.z, x_500.z) * vec4<f32>(x_502.x, x_502.x, x_502.z, x_502.z));
  let x_505 : vec2<f32> = u_xlat19;
  u_xlat19 = (x_505 + vec2<f32>(2.0f, 2.0f));
  let x_509 : f32 = u_xlat19.x;
  u_xlat5.z = (x_509 * 0.081632003f);
  let x_514 : f32 = u_xlat19.y;
  u_xlat6.z = (x_514 * 0.081632003f);
  let x_517 : vec4<f32> = u_xlat4;
  let x_520 : vec4<f32> = u_xlat0;
  u_xlat19 = ((vec2<f32>(x_517.x, x_517.z) * vec2<f32>(0.5f, 0.5f)) + -(vec2<f32>(x_520.x, x_520.y)));
  let x_524 : vec4<f32> = u_xlat4;
  let x_528 : vec2<f32> = (vec2<f32>(x_524.y, x_524.w) * vec2<f32>(0.040816002f, 0.040816002f));
  let x_529 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_528.x, x_528.y, x_529.z, x_529.w);
  let x_531 : vec2<f32> = u_xlat19;
  let x_533 : vec2<f32> = (vec2<f32>(x_531.y, x_531.x) * vec2<f32>(0.081632003f, 0.081632003f));
  let x_534 : vec4<f32> = u_xlat6;
  u_xlat6 = vec4<f32>(x_533.x, x_533.y, x_534.z, x_534.w);
  let x_537 : f32 = u_xlat6.y;
  u_xlat5.x = x_537;
  let x_539 : vec4<f32> = u_xlat0;
  let x_546 : vec2<f32> = ((vec2<f32>(x_539.x, x_539.x) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.163264006f, 0.081632003f));
  let x_547 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_547.x, x_546.x, x_547.z, x_546.y);
  let x_549 : vec4<f32> = u_xlat0;
  let x_553 : vec2<f32> = ((vec2<f32>(x_549.x, x_549.x) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.081632003f, 0.163264006f));
  let x_554 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_553.x, x_554.y, x_553.y, x_554.w);
  let x_557 : f32 = u_xlat4.x;
  u_xlat3.w = x_557;
  let x_560 : f32 = u_xlat4.y;
  u_xlat2.w = x_560;
  let x_562 : vec4<f32> = u_xlat3;
  let x_563 : vec4<f32> = u_xlat5;
  u_xlat4 = (x_562 + x_563);
  let x_565 : vec4<f32> = u_xlat3;
  let x_566 : vec4<f32> = u_xlat4;
  u_xlat3 = (x_565 / x_566);
  let x_568 : vec4<f32> = u_xlat3;
  u_xlat3 = (x_568 + vec4<f32>(-3.5f, -1.5f, 0.5f, 2.5f));
  let x_574 : vec4<f32> = u_xlat3;
  let x_577 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  u_xlat3 = (vec4<f32>(x_574.w, x_574.x, x_574.y, x_574.z) * vec4<f32>(x_577.x, x_577.x, x_577.x, x_577.x));
  let x_580 : vec4<f32> = u_xlat0;
  let x_583 : vec2<f32> = ((vec2<f32>(x_580.y, x_580.y) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.163264006f, 0.081632003f));
  let x_584 : vec4<f32> = u_xlat6;
  u_xlat6 = vec4<f32>(x_584.x, x_583.x, x_584.z, x_583.y);
  let x_586 : vec4<f32> = u_xlat0;
  let x_589 : vec2<f32> = ((vec2<f32>(x_586.y, x_586.y) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.081632003f, 0.163264006f));
  let x_590 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_589.x, x_590.y, x_589.y, x_590.w);
  let x_592 : vec4<f32> = u_xlat2;
  let x_593 : vec4<f32> = u_xlat6;
  u_xlat5 = (x_592 + x_593);
  let x_595 : vec4<f32> = u_xlat2;
  let x_596 : vec4<f32> = u_xlat5;
  u_xlat2 = (x_595 / x_596);
  let x_598 : vec4<f32> = u_xlat2;
  u_xlat2 = (x_598 + vec4<f32>(-3.5f, -1.5f, 0.5f, 2.5f));
  let x_600 : vec4<f32> = u_xlat2;
  let x_603 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  u_xlat2 = (vec4<f32>(x_600.x, x_600.w, x_600.y, x_600.z) * vec4<f32>(x_603.y, x_603.y, x_603.y, x_603.y));
  let x_606 : vec4<f32> = u_xlat4;
  let x_607 : vec4<f32> = u_xlat5;
  u_xlat6 = (x_606 * vec4<f32>(x_607.x, x_607.x, x_607.x, x_607.x));
  let x_611 : vec4<f32> = u_xlat3;
  let x_612 : vec3<f32> = vec3<f32>(x_611.y, x_611.z, x_611.w);
  let x_613 : vec4<f32> = u_xlat7;
  u_xlat7 = vec4<f32>(x_612.x, x_613.y, x_612.y, x_612.z);
  let x_616 : f32 = u_xlat2.x;
  u_xlat7.y = x_616;
  let x_619 : vec4<f32> = u_xlat1;
  let x_622 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_625 : vec4<f32> = u_xlat7;
  u_xlat8 = ((vec4<f32>(x_619.x, x_619.y, x_619.x, x_619.y) * vec4<f32>(x_622.x, x_622.y, x_622.x, x_622.y)) + vec4<f32>(x_625.x, x_625.y, x_625.z, x_625.y));
  let x_629 : vec4<f32> = u_xlat8;
  let x_630 : vec2<f32> = vec2<f32>(x_629.x, x_629.y);
  let x_631 : f32 = u_xlat18;
  txVec0 = vec3<f32>(x_630.x, x_630.y, x_631);
  let x_643 : vec3<f32> = txVec0;
  let x_645 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_643.xy, x_643.z);
  u_xlat0.x = x_645;
  let x_648 : vec4<f32> = u_xlat8;
  let x_649 : vec2<f32> = vec2<f32>(x_648.z, x_648.w);
  let x_650 : f32 = u_xlat18;
  txVec1 = vec3<f32>(x_649.x, x_649.y, x_650);
  let x_657 : vec3<f32> = txVec1;
  let x_659 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_657.xy, x_657.z);
  u_xlat9.x = x_659;
  let x_662 : f32 = u_xlat9.x;
  let x_664 : f32 = u_xlat6.y;
  u_xlat9.x = (x_662 * x_664);
  let x_668 : f32 = u_xlat6.x;
  let x_670 : f32 = u_xlat0.x;
  let x_673 : f32 = u_xlat9.x;
  u_xlat0.x = ((x_668 * x_670) + x_673);
  let x_676 : vec4<f32> = u_xlat1;
  let x_679 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_682 : vec4<f32> = u_xlat7;
  let x_684 : vec2<f32> = ((vec2<f32>(x_676.x, x_676.y) * vec2<f32>(x_679.x, x_679.y)) + vec2<f32>(x_682.w, x_682.y));
  let x_685 : vec3<f32> = u_xlat9;
  u_xlat9 = vec3<f32>(x_684.x, x_685.y, x_684.y);
  let x_688 : f32 = u_xlat7.y;
  u_xlat3.y = x_688;
  let x_690 : vec4<f32> = u_xlat1;
  let x_693 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_696 : vec4<f32> = u_xlat3;
  u_xlat19 = ((vec2<f32>(x_690.x, x_690.y) * vec2<f32>(x_693.x, x_693.y)) + vec2<f32>(x_696.x, x_696.y));
  let x_700 : vec2<f32> = u_xlat19;
  let x_701 : f32 = u_xlat18;
  txVec2 = vec3<f32>(x_700.x, x_700.y, x_701);
  let x_708 : vec3<f32> = txVec2;
  let x_710 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_708.xy, x_708.z);
  u_xlat19.x = x_710;
  let x_713 : vec3<f32> = u_xlat9;
  let x_714 : vec2<f32> = vec2<f32>(x_713.x, x_713.z);
  let x_715 : f32 = u_xlat18;
  txVec3 = vec3<f32>(x_714.x, x_714.y, x_715);
  let x_722 : vec3<f32> = txVec3;
  let x_724 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_722.xy, x_722.z);
  u_xlat9.x = x_724;
  let x_727 : f32 = u_xlat6.z;
  let x_729 : f32 = u_xlat9.x;
  let x_732 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_727 * x_729) + x_732);
  let x_736 : f32 = u_xlat6.w;
  let x_738 : f32 = u_xlat19.x;
  let x_741 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_736 * x_738) + x_741);
  let x_744 : vec4<f32> = u_xlat4;
  let x_745 : vec4<f32> = u_xlat5;
  u_xlat6 = (x_744 * vec4<f32>(x_745.y, x_745.y, x_745.y, x_745.y));
  let x_749 : f32 = u_xlat2.z;
  u_xlat7.y = x_749;
  let x_751 : vec4<f32> = u_xlat1;
  let x_754 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_757 : vec4<f32> = u_xlat7;
  u_xlat8 = ((vec4<f32>(x_751.x, x_751.y, x_751.x, x_751.y) * vec4<f32>(x_754.x, x_754.y, x_754.x, x_754.y)) + vec4<f32>(x_757.x, x_757.y, x_757.z, x_757.y));
  let x_761 : vec4<f32> = u_xlat8;
  let x_762 : vec2<f32> = vec2<f32>(x_761.x, x_761.y);
  let x_763 : f32 = u_xlat18;
  txVec4 = vec3<f32>(x_762.x, x_762.y, x_763);
  let x_770 : vec3<f32> = txVec4;
  let x_772 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_770.xy, x_770.z);
  u_xlat9.x = x_772;
  let x_775 : vec4<f32> = u_xlat8;
  let x_776 : vec2<f32> = vec2<f32>(x_775.z, x_775.w);
  let x_777 : f32 = u_xlat18;
  txVec5 = vec3<f32>(x_776.x, x_776.y, x_777);
  let x_784 : vec3<f32> = txVec5;
  let x_786 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_784.xy, x_784.z);
  u_xlat27 = x_786;
  let x_788 : f32 = u_xlat6.x;
  let x_790 : f32 = u_xlat9.x;
  let x_793 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_788 * x_790) + x_793);
  let x_797 : f32 = u_xlat6.y;
  let x_798 : f32 = u_xlat27;
  let x_801 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_797 * x_798) + x_801);
  let x_804 : vec4<f32> = u_xlat1;
  let x_807 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_810 : vec4<f32> = u_xlat7;
  let x_812 : vec2<f32> = ((vec2<f32>(x_804.x, x_804.y) * vec2<f32>(x_807.x, x_807.y)) + vec2<f32>(x_810.w, x_810.y));
  let x_813 : vec3<f32> = u_xlat9;
  u_xlat9 = vec3<f32>(x_812.x, x_813.y, x_812.y);
  let x_816 : f32 = u_xlat7.y;
  u_xlat3.z = x_816;
  let x_818 : vec4<f32> = u_xlat1;
  let x_821 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_824 : vec4<f32> = u_xlat3;
  u_xlat19 = ((vec2<f32>(x_818.x, x_818.y) * vec2<f32>(x_821.x, x_821.y)) + vec2<f32>(x_824.x, x_824.z));
  let x_828 : vec2<f32> = u_xlat19;
  let x_829 : f32 = u_xlat18;
  txVec6 = vec3<f32>(x_828.x, x_828.y, x_829);
  let x_836 : vec3<f32> = txVec6;
  let x_838 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_836.xy, x_836.z);
  u_xlat19.x = x_838;
  let x_841 : vec3<f32> = u_xlat9;
  let x_842 : vec2<f32> = vec2<f32>(x_841.x, x_841.z);
  let x_843 : f32 = u_xlat18;
  txVec7 = vec3<f32>(x_842.x, x_842.y, x_843);
  let x_850 : vec3<f32> = txVec7;
  let x_852 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_850.xy, x_850.z);
  u_xlat9.x = x_852;
  let x_855 : f32 = u_xlat6.z;
  let x_857 : f32 = u_xlat9.x;
  let x_860 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_855 * x_857) + x_860);
  let x_864 : f32 = u_xlat6.w;
  let x_866 : f32 = u_xlat19.x;
  let x_869 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_864 * x_866) + x_869);
  let x_872 : vec4<f32> = u_xlat4;
  let x_873 : vec4<f32> = u_xlat5;
  u_xlat6 = (x_872 * vec4<f32>(x_873.z, x_873.z, x_873.z, x_873.z));
  let x_876 : vec4<f32> = u_xlat4;
  let x_877 : vec4<f32> = u_xlat5;
  u_xlat4 = (x_876 * vec4<f32>(x_877.w, x_877.w, x_877.w, x_877.w));
  let x_881 : f32 = u_xlat2.w;
  u_xlat7.y = x_881;
  let x_883 : vec4<f32> = u_xlat1;
  let x_886 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_889 : vec4<f32> = u_xlat7;
  u_xlat5 = ((vec4<f32>(x_883.x, x_883.y, x_883.x, x_883.y) * vec4<f32>(x_886.x, x_886.y, x_886.x, x_886.y)) + vec4<f32>(x_889.x, x_889.y, x_889.z, x_889.y));
  let x_893 : vec4<f32> = u_xlat5;
  let x_894 : vec2<f32> = vec2<f32>(x_893.x, x_893.y);
  let x_895 : f32 = u_xlat18;
  txVec8 = vec3<f32>(x_894.x, x_894.y, x_895);
  let x_902 : vec3<f32> = txVec8;
  let x_904 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_902.xy, x_902.z);
  u_xlat9.x = x_904;
  let x_907 : vec4<f32> = u_xlat5;
  let x_908 : vec2<f32> = vec2<f32>(x_907.z, x_907.w);
  let x_909 : f32 = u_xlat18;
  txVec9 = vec3<f32>(x_908.x, x_908.y, x_909);
  let x_916 : vec3<f32> = txVec9;
  let x_918 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_916.xy, x_916.z);
  u_xlat27 = x_918;
  let x_920 : f32 = u_xlat6.x;
  let x_922 : f32 = u_xlat9.x;
  let x_925 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_920 * x_922) + x_925);
  let x_929 : f32 = u_xlat6.y;
  let x_930 : f32 = u_xlat27;
  let x_933 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_929 * x_930) + x_933);
  let x_936 : vec4<f32> = u_xlat1;
  let x_939 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_942 : vec4<f32> = u_xlat7;
  let x_944 : vec2<f32> = ((vec2<f32>(x_936.x, x_936.y) * vec2<f32>(x_939.x, x_939.y)) + vec2<f32>(x_942.w, x_942.y));
  let x_945 : vec3<f32> = u_xlat9;
  u_xlat9 = vec3<f32>(x_944.x, x_945.y, x_944.y);
  let x_947 : vec4<f32> = u_xlat7;
  let x_948 : vec3<f32> = vec3<f32>(x_947.x, x_947.z, x_947.w);
  let x_949 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_948.x, x_949.y, x_948.y, x_948.z);
  let x_952 : f32 = u_xlat7.y;
  u_xlat3.w = x_952;
  let x_954 : vec4<f32> = u_xlat1;
  let x_957 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_960 : vec4<f32> = u_xlat3;
  u_xlat19 = ((vec2<f32>(x_954.x, x_954.y) * vec2<f32>(x_957.x, x_957.y)) + vec2<f32>(x_960.x, x_960.w));
  let x_964 : vec2<f32> = u_xlat19;
  let x_965 : f32 = u_xlat18;
  txVec10 = vec3<f32>(x_964.x, x_964.y, x_965);
  let x_972 : vec3<f32> = txVec10;
  let x_974 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_972.xy, x_972.z);
  u_xlat19.x = x_974;
  let x_977 : vec3<f32> = u_xlat9;
  let x_978 : vec2<f32> = vec2<f32>(x_977.x, x_977.z);
  let x_979 : f32 = u_xlat18;
  txVec11 = vec3<f32>(x_978.x, x_978.y, x_979);
  let x_986 : vec3<f32> = txVec11;
  let x_988 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_986.xy, x_986.z);
  u_xlat9.x = x_988;
  let x_991 : f32 = u_xlat6.z;
  let x_993 : f32 = u_xlat9.x;
  let x_996 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_991 * x_993) + x_996);
  let x_1000 : f32 = u_xlat6.w;
  let x_1002 : f32 = u_xlat19.x;
  let x_1005 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1000 * x_1002) + x_1005);
  let x_1008 : vec4<f32> = u_xlat1;
  let x_1011 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_1014 : vec4<f32> = u_xlat2;
  u_xlat5 = ((vec4<f32>(x_1008.x, x_1008.y, x_1008.x, x_1008.y) * vec4<f32>(x_1011.x, x_1011.y, x_1011.x, x_1011.y)) + vec4<f32>(x_1014.x, x_1014.y, x_1014.z, x_1014.y));
  let x_1017 : vec4<f32> = u_xlat1;
  let x_1020 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_1023 : vec4<f32> = u_xlat2;
  let x_1025 : vec2<f32> = ((vec2<f32>(x_1017.x, x_1017.y) * vec2<f32>(x_1020.x, x_1020.y)) + vec2<f32>(x_1023.w, x_1023.y));
  let x_1026 : vec3<f32> = u_xlat9;
  u_xlat9 = vec3<f32>(x_1025.x, x_1026.y, x_1025.y);
  let x_1029 : f32 = u_xlat2.y;
  u_xlat3.y = x_1029;
  let x_1031 : vec4<f32> = u_xlat1;
  let x_1034 : vec4<f32> = x_39.x_ShadowMapTexture_TexelSize;
  let x_1037 : vec4<f32> = u_xlat3;
  let x_1039 : vec2<f32> = ((vec2<f32>(x_1031.x, x_1031.y) * vec2<f32>(x_1034.x, x_1034.y)) + vec2<f32>(x_1037.x, x_1037.y));
  let x_1040 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1039.x, x_1039.y, x_1040.z, x_1040.w);
  let x_1043 : vec4<f32> = u_xlat1;
  let x_1044 : vec2<f32> = vec2<f32>(x_1043.x, x_1043.y);
  let x_1045 : f32 = u_xlat18;
  txVec12 = vec3<f32>(x_1044.x, x_1044.y, x_1045);
  let x_1052 : vec3<f32> = txVec12;
  let x_1054 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_1052.xy, x_1052.z);
  u_xlat1.x = x_1054;
  let x_1057 : vec3<f32> = u_xlat9;
  let x_1058 : vec2<f32> = vec2<f32>(x_1057.x, x_1057.z);
  let x_1059 : f32 = u_xlat18;
  txVec13 = vec3<f32>(x_1058.x, x_1058.y, x_1059);
  let x_1066 : vec3<f32> = txVec13;
  let x_1068 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_1066.xy, x_1066.z);
  u_xlat9.x = x_1068;
  let x_1071 : vec4<f32> = u_xlat5;
  let x_1072 : vec2<f32> = vec2<f32>(x_1071.x, x_1071.y);
  let x_1073 : f32 = u_xlat18;
  txVec14 = vec3<f32>(x_1072.x, x_1072.y, x_1073);
  let x_1080 : vec3<f32> = txVec14;
  let x_1082 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_1080.xy, x_1080.z);
  u_xlat27 = x_1082;
  let x_1084 : vec4<f32> = u_xlat5;
  let x_1085 : vec2<f32> = vec2<f32>(x_1084.z, x_1084.w);
  let x_1086 : f32 = u_xlat18;
  txVec15 = vec3<f32>(x_1085.x, x_1085.y, x_1086);
  let x_1093 : vec3<f32> = txVec15;
  let x_1095 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_1093.xy, x_1093.z);
  u_xlat18 = x_1095;
  let x_1097 : f32 = u_xlat4.x;
  let x_1098 : f32 = u_xlat27;
  let x_1101 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1097 * x_1098) + x_1101);
  let x_1105 : f32 = u_xlat4.y;
  let x_1106 : f32 = u_xlat18;
  let x_1109 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1105 * x_1106) + x_1109);
  let x_1113 : f32 = u_xlat4.z;
  let x_1115 : f32 = u_xlat9.x;
  let x_1118 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1113 * x_1115) + x_1118);
  let x_1122 : f32 = u_xlat4.w;
  let x_1124 : f32 = u_xlat1.x;
  let x_1127 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1122 * x_1124) + x_1127);
  let x_1132 : f32 = x_39.x_LightShadowData.x;
  u_xlat9.x = (-(x_1132) + 1.0f);
  let x_1138 : vec4<f32> = u_xlat0;
  let x_1140 : vec3<f32> = u_xlat9;
  let x_1144 : vec4<f32> = x_39.x_LightShadowData;
  SV_Target0 = ((vec4<f32>(x_1138.x, x_1138.x, x_1138.x, x_1138.x) * vec4<f32>(x_1140.x, x_1140.x, x_1140.x, x_1140.x)) + vec4<f32>(x_1144.x, x_1144.x, x_1144.x, x_1144.x));
  return;
}

struct main_out {
  @location(0)
  SV_Target0_1 : vec4<f32>,
}

@fragment
fn main(@location(0) vs_TEXCOORD0_param : vec4<f32>, @location(2) vs_TEXCOORD2_param : vec3<f32>, @location(3) vs_TEXCOORD3_param : vec3<f32>, @location(1) vs_TEXCOORD1_param : vec3<f32>, @builtin(position) gl_FragCoord_param : vec4<f32>) -> main_out {
  vs_TEXCOORD0 = vs_TEXCOORD0_param;
  vs_TEXCOORD2 = vs_TEXCOORD2_param;
  vs_TEXCOORD3 = vs_TEXCOORD3_param;
  vs_TEXCOORD1 = vs_TEXCOORD1_param;
  gl_FragCoord = gl_FragCoord_param;
  main_1();
  return main_out(SV_Target0);
}

