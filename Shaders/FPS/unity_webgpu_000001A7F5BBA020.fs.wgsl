struct PGlobals {
  x_ScreenParams : vec4<f32>,
  x_RenderViewportScaleFactor : f32,
  @size(12)
  padding : u32,
  x_Distortion_Amount : vec4<f32>,
  x_Distortion_CenterScale : vec4<f32>,
  x_ChromaticAberration_Amount : f32,
  @size(12)
  padding_1 : u32,
  x_Lut2D_Params : vec3<f32>,
  @size(4)
  padding_2 : u32,
  x_Vignette_Color : vec3<f32>,
  @size(4)
  padding_3 : u32,
  x_Vignette_Center : vec2<f32>,
  @size(8)
  padding_4 : u32,
  x_Vignette_Settings : vec4<f32>,
  x_Vignette_Opacity : f32,
  x_Vignette_Mode : f32,
  x_Grain_Params1 : vec2<f32>,
  x_Grain_Params2 : vec4<f32>,
  x_LumaInAlpha : f32,
}

var<private> u_xlat0 : vec4<f32>;

var<private> vs_TEXCOORD0 : vec2<f32>;

var<private> u_xlat20 : vec2<f32>;

@group(0) @binding(0) var<uniform> x_26 : PGlobals;

var<private> u_xlat1 : vec3<f32>;

var<private> u_xlatb11 : bool;

var<private> u_xlat21 : vec2<f32>;

var<private> u_xlat2 : vec3<f32>;

var<private> u_xlat3 : vec4<f32>;

var<private> u_xlat31 : f32;

var<private> u_xlat12 : vec3<f32>;

var<private> u_xlat22 : f32;

var<private> u_xlat32 : f32;

var<private> u_xlatb13 : bool;

var<private> u_xlatb12 : bool;

@group(0) @binding(2) var x_AutoExposureTex : texture_2d<f32>;

@group(0) @binding(8) var sampler_AutoExposureTex : sampler;

var<private> u_xlat4 : vec4<f32>;

@group(0) @binding(3) var x_ChromaticAberration_SpectralLut : texture_2d<f32>;

@group(0) @binding(9) var sampler_ChromaticAberration_SpectralLut : sampler;

var<private> u_xlat5 : vec4<f32>;

var<private> u_xlat6 : vec4<f32>;

var<private> u_xlat7 : vec4<f32>;

var<private> u_xlat8 : vec4<f32>;

var<private> u_xlat17 : f32;

var<private> u_xlat27 : f32;

var<private> u_xlatb37 : bool;

var<private> u_xlatb1 : bool;

@group(0) @binding(1) var x_MainTex : texture_2d<f32>;

@group(0) @binding(7) var sampler_MainTex : sampler;

var<private> u_xlat9 : f32;

var<private> u_xlat18 : f32;

var<private> u_xlat28 : f32;

var<private> u_xlatb38 : bool;

var<private> u_xlat11 : vec3<f32>;

var<private> u_xlat13 : f32;

var<private> u_xlatb7 : bool;

@group(0) @binding(5) var x_Vignette_Mask : texture_2d<f32>;

@group(0) @binding(11) var sampler_Vignette_Mask : sampler;

var<private> vs_TEXCOORD1 : vec2<f32>;

@group(0) @binding(6) var x_GrainTex : texture_2d<f32>;

@group(0) @binding(12) var sampler_GrainTex : sampler;

var<private> u_xlat30 : f32;

var<private> u_xlatb2 : vec3<bool>;

var<private> u_xlat10 : vec3<f32>;

@group(0) @binding(4) var x_Lut2D : texture_2d<f32>;

@group(0) @binding(10) var sampler_Lut2D : sampler;

var<private> u_xlatb0 : vec3<bool>;

var<private> SV_Target0 : vec4<f32>;

var<private> gl_FragCoord : vec4<f32>;

fn main_1() {
  var x_209 : f32;
  var x_235 : f32;
  var x_468 : f32;
  var x_693 : f32;
  var x_893 : f32;
  var x_1168 : f32;
  var hlslcc_movcTemp : vec4<f32>;
  var x_1335 : f32;
  var x_1347 : f32;
  var x_1359 : f32;
  var x_1483 : f32;
  var x_1495 : f32;
  var x_1507 : f32;
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_13 : vec2<f32> = vs_TEXCOORD0;
  let x_16 : vec2<f32> = (x_13 + vec2<f32>(-0.5f, -0.5f));
  let x_17 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_16.x, x_16.y, x_17.z, x_17.w);
  let x_21 : vec4<f32> = u_xlat0;
  let x_31 : vec4<f32> = x_26.x_Distortion_Amount;
  u_xlat20 = ((vec2<f32>(x_21.x, x_21.y) * vec2<f32>(x_31.z, x_31.z)) + vec2<f32>(0.5f, 0.5f));
  let x_37 : vec4<f32> = u_xlat0;
  let x_40 : vec4<f32> = x_26.x_Distortion_Amount;
  let x_45 : vec4<f32> = x_26.x_Distortion_CenterScale;
  let x_48 : vec2<f32> = ((vec2<f32>(x_37.x, x_37.y) * vec2<f32>(x_40.z, x_40.z)) + -(vec2<f32>(x_45.x, x_45.y)));
  let x_49 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_48.x, x_48.y, x_49.z, x_49.w);
  let x_51 : vec4<f32> = u_xlat0;
  let x_54 : vec4<f32> = x_26.x_Distortion_CenterScale;
  let x_56 : vec2<f32> = (vec2<f32>(x_51.x, x_51.y) * vec2<f32>(x_54.z, x_54.w));
  let x_57 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_56.x, x_56.y, x_57.z, x_57.w);
  let x_61 : vec4<f32> = u_xlat0;
  let x_63 : vec4<f32> = u_xlat0;
  u_xlat1.x = dot(vec2<f32>(x_61.x, x_61.y), vec2<f32>(x_63.x, x_63.y));
  let x_71 : f32 = u_xlat1.x;
  u_xlat1.x = sqrt(x_71);
  let x_81 : f32 = x_26.x_Distortion_Amount.w;
  u_xlatb11 = (0.0f < x_81);
  let x_83 : bool = u_xlatb11;
  if (x_83) {
    let x_87 : vec3<f32> = u_xlat1;
    let x_90 : vec4<f32> = x_26.x_Distortion_Amount;
    u_xlat21 = (vec2<f32>(x_87.x, x_87.x) * vec2<f32>(x_90.x, x_90.y));
    let x_95 : f32 = u_xlat21.x;
    u_xlat2.x = sin(x_95);
    let x_100 : f32 = u_xlat21.x;
    u_xlat3.x = cos(x_100);
    let x_104 : f32 = u_xlat2.x;
    let x_106 : f32 = u_xlat3.x;
    u_xlat21.x = (x_104 / x_106);
    let x_113 : f32 = u_xlat21.y;
    u_xlat31 = (1.0f / x_113);
    let x_116 : f32 = u_xlat21.x;
    let x_117 : f32 = u_xlat31;
    u_xlat21.x = ((x_116 * x_117) + -1.0f);
    let x_122 : vec4<f32> = u_xlat0;
    let x_124 : vec2<f32> = u_xlat21;
    let x_127 : vec2<f32> = u_xlat20;
    u_xlat21 = ((vec2<f32>(x_122.x, x_122.y) * vec2<f32>(x_124.x, x_124.x)) + x_127);
  } else {
    let x_131 : f32 = u_xlat1.x;
    u_xlat2.x = (1.0f / x_131);
    let x_135 : f32 = u_xlat2.x;
    let x_137 : f32 = x_26.x_Distortion_Amount.x;
    u_xlat2.x = (x_135 * x_137);
    let x_142 : f32 = u_xlat1.x;
    let x_144 : f32 = x_26.x_Distortion_Amount.y;
    u_xlat12.x = (x_142 * x_144);
    let x_149 : f32 = u_xlat12.x;
    u_xlat22 = min(abs(x_149), 1.0f);
    let x_154 : f32 = u_xlat12.x;
    u_xlat32 = max(abs(x_154), 1.0f);
    let x_157 : f32 = u_xlat32;
    u_xlat32 = (1.0f / x_157);
    let x_159 : f32 = u_xlat32;
    let x_160 : f32 = u_xlat22;
    u_xlat22 = (x_159 * x_160);
    let x_162 : f32 = u_xlat22;
    let x_163 : f32 = u_xlat22;
    u_xlat32 = (x_162 * x_163);
    let x_165 : f32 = u_xlat32;
    u_xlat3.x = ((x_165 * 0.0208351f) + -0.085133001f);
    let x_171 : f32 = u_xlat32;
    let x_173 : f32 = u_xlat3.x;
    u_xlat3.x = ((x_171 * x_173) + 0.180141002f);
    let x_178 : f32 = u_xlat32;
    let x_180 : f32 = u_xlat3.x;
    u_xlat3.x = ((x_178 * x_180) + -0.330299497f);
    let x_185 : f32 = u_xlat32;
    let x_187 : f32 = u_xlat3.x;
    u_xlat32 = ((x_185 * x_187) + 0.999866009f);
    let x_191 : f32 = u_xlat32;
    let x_192 : f32 = u_xlat22;
    u_xlat3.x = (x_191 * x_192);
    let x_197 : f32 = u_xlat12.x;
    u_xlatb13 = (1.0f < abs(x_197));
    let x_201 : f32 = u_xlat3.x;
    u_xlat3.x = ((x_201 * -2.0f) + 1.570796371f);
    let x_207 : bool = u_xlatb13;
    if (x_207) {
      let x_213 : f32 = u_xlat3.x;
      x_209 = x_213;
    } else {
      x_209 = 0.0f;
    }
    let x_215 : f32 = x_209;
    u_xlat3.x = x_215;
    let x_217 : f32 = u_xlat22;
    let x_218 : f32 = u_xlat32;
    let x_221 : f32 = u_xlat3.x;
    u_xlat22 = ((x_217 * x_218) + x_221);
    let x_224 : f32 = u_xlat12.x;
    u_xlat12.x = min(x_224, 1.0f);
    let x_229 : f32 = u_xlat12.x;
    let x_231 : f32 = u_xlat12.x;
    u_xlatb12 = (x_229 < -(x_231));
    let x_234 : bool = u_xlatb12;
    if (x_234) {
      let x_238 : f32 = u_xlat22;
      x_235 = -(x_238);
    } else {
      let x_241 : f32 = u_xlat22;
      x_235 = x_241;
    }
    let x_242 : f32 = x_235;
    u_xlat12.x = x_242;
    let x_245 : f32 = u_xlat2.x;
    let x_247 : f32 = u_xlat12.x;
    u_xlat2.x = ((x_245 * x_247) + -1.0f);
    let x_251 : vec4<f32> = u_xlat0;
    let x_253 : vec3<f32> = u_xlat2;
    let x_256 : vec2<f32> = u_xlat20;
    u_xlat21 = ((vec2<f32>(x_251.x, x_251.y) * vec2<f32>(x_253.x, x_253.x)) + x_256);
  }
  let x_268 : vec2<f32> = vs_TEXCOORD0;
  let x_269 : vec4<f32> = textureSample(x_AutoExposureTex, sampler_AutoExposureTex, x_268);
  u_xlat2.x = x_269.x;
  let x_272 : vec2<f32> = vs_TEXCOORD0;
  u_xlat3 = ((vec4<f32>(x_272.x, x_272.y, x_272.x, x_272.y) * vec4<f32>(2.0f, 2.0f, 2.0f, 2.0f)) + vec4<f32>(-1.0f, -1.0f, -1.0f, -1.0f));
  let x_279 : vec4<f32> = u_xlat3;
  let x_281 : vec4<f32> = u_xlat3;
  u_xlat12.x = dot(vec2<f32>(x_279.z, x_279.w), vec2<f32>(x_281.z, x_281.w));
  let x_285 : vec3<f32> = u_xlat12;
  let x_287 : vec4<f32> = u_xlat3;
  u_xlat3 = (vec4<f32>(x_285.x, x_285.x, x_285.x, x_285.x) * x_287);
  let x_289 : vec4<f32> = u_xlat3;
  let x_292 : f32 = x_26.x_ChromaticAberration_Amount;
  let x_294 : f32 = x_26.x_ChromaticAberration_Amount;
  let x_296 : f32 = x_26.x_ChromaticAberration_Amount;
  let x_298 : f32 = x_26.x_ChromaticAberration_Amount;
  let x_299 : vec4<f32> = vec4<f32>(x_292, x_294, x_296, x_298);
  u_xlat3 = (x_289 * vec4<f32>(x_299.x, x_299.y, x_299.z, x_299.w));
  let x_314 : vec4<f32> = textureSampleLevel(x_ChromaticAberration_SpectralLut, sampler_ChromaticAberration_SpectralLut, vec2<f32>(0.166666672f, 0.0f), 0.0f);
  let x_315 : vec3<f32> = vec3<f32>(x_314.x, x_314.y, x_314.z);
  let x_316 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_315.x, x_315.y, x_315.z, x_316.w);
  let x_323 : vec4<f32> = textureSampleLevel(x_ChromaticAberration_SpectralLut, sampler_ChromaticAberration_SpectralLut, vec2<f32>(0.5f, 0.0f), 0.0f);
  let x_324 : vec3<f32> = vec3<f32>(x_323.x, x_323.y, x_323.z);
  let x_325 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_324.x, x_324.y, x_324.z, x_325.w);
  let x_333 : vec4<f32> = textureSampleLevel(x_ChromaticAberration_SpectralLut, sampler_ChromaticAberration_SpectralLut, vec2<f32>(0.833333313f, 0.0f), 0.0f);
  let x_334 : vec3<f32> = vec3<f32>(x_333.x, x_333.y, x_333.z);
  let x_335 : vec4<f32> = u_xlat6;
  u_xlat6 = vec4<f32>(x_334.x, x_334.y, x_334.z, x_335.w);
  let x_337 : bool = u_xlatb11;
  if (x_337) {
    let x_340 : vec3<f32> = u_xlat1;
    let x_343 : vec4<f32> = x_26.x_Distortion_Amount;
    let x_345 : vec2<f32> = (vec2<f32>(x_340.x, x_340.x) * vec2<f32>(x_343.x, x_343.y));
    let x_346 : vec3<f32> = u_xlat12;
    u_xlat12 = vec3<f32>(x_345.x, x_345.y, x_346.z);
    let x_350 : f32 = u_xlat12.x;
    u_xlat7.x = sin(x_350);
    let x_355 : f32 = u_xlat12.x;
    u_xlat8.x = cos(x_355);
    let x_359 : f32 = u_xlat7.x;
    let x_361 : f32 = u_xlat8.x;
    u_xlat12.x = (x_359 / x_361);
    let x_365 : f32 = u_xlat12.y;
    u_xlat22 = (1.0f / x_365);
    let x_368 : f32 = u_xlat12.x;
    let x_369 : f32 = u_xlat22;
    u_xlat12.x = ((x_368 * x_369) + -1.0f);
    let x_373 : vec4<f32> = u_xlat0;
    let x_375 : vec3<f32> = u_xlat12;
    let x_378 : vec2<f32> = u_xlat20;
    let x_379 : vec2<f32> = ((vec2<f32>(x_373.x, x_373.y) * vec2<f32>(x_375.x, x_375.x)) + x_378);
    let x_380 : vec3<f32> = u_xlat12;
    u_xlat12 = vec3<f32>(x_379.x, x_379.y, x_380.z);
  } else {
    let x_384 : f32 = u_xlat1.x;
    u_xlat32 = (1.0f / x_384);
    let x_386 : f32 = u_xlat32;
    let x_388 : f32 = x_26.x_Distortion_Amount.x;
    u_xlat32 = (x_386 * x_388);
    let x_391 : f32 = u_xlat1.x;
    let x_393 : f32 = x_26.x_Distortion_Amount.y;
    u_xlat1.x = (x_391 * x_393);
    let x_397 : f32 = u_xlat1.x;
    u_xlat7.x = min(abs(x_397), 1.0f);
    let x_403 : f32 = u_xlat1.x;
    u_xlat17 = max(abs(x_403), 1.0f);
    let x_406 : f32 = u_xlat17;
    u_xlat17 = (1.0f / x_406);
    let x_408 : f32 = u_xlat17;
    let x_410 : f32 = u_xlat7.x;
    u_xlat7.x = (x_408 * x_410);
    let x_414 : f32 = u_xlat7.x;
    let x_416 : f32 = u_xlat7.x;
    u_xlat17 = (x_414 * x_416);
    let x_419 : f32 = u_xlat17;
    u_xlat27 = ((x_419 * 0.0208351f) + -0.085133001f);
    let x_422 : f32 = u_xlat17;
    let x_423 : f32 = u_xlat27;
    u_xlat27 = ((x_422 * x_423) + 0.180141002f);
    let x_426 : f32 = u_xlat17;
    let x_427 : f32 = u_xlat27;
    u_xlat27 = ((x_426 * x_427) + -0.330299497f);
    let x_430 : f32 = u_xlat17;
    let x_431 : f32 = u_xlat27;
    u_xlat17 = ((x_430 * x_431) + 0.999866009f);
    let x_434 : f32 = u_xlat17;
    let x_436 : f32 = u_xlat7.x;
    u_xlat27 = (x_434 * x_436);
    let x_440 : f32 = u_xlat1.x;
    u_xlatb37 = (1.0f < abs(x_440));
    let x_443 : f32 = u_xlat27;
    u_xlat27 = ((x_443 * -2.0f) + 1.570796371f);
    let x_446 : bool = u_xlatb37;
    let x_447 : f32 = u_xlat27;
    u_xlat27 = select(0.0f, x_447, x_446);
    let x_450 : f32 = u_xlat7.x;
    let x_451 : f32 = u_xlat17;
    let x_453 : f32 = u_xlat27;
    u_xlat7.x = ((x_450 * x_451) + x_453);
    let x_457 : f32 = u_xlat1.x;
    u_xlat1.x = min(x_457, 1.0f);
    let x_462 : f32 = u_xlat1.x;
    let x_464 : f32 = u_xlat1.x;
    u_xlatb1 = (x_462 < -(x_464));
    let x_467 : bool = u_xlatb1;
    if (x_467) {
      let x_472 : f32 = u_xlat7.x;
      x_468 = -(x_472);
    } else {
      let x_476 : f32 = u_xlat7.x;
      x_468 = x_476;
    }
    let x_477 : f32 = x_468;
    u_xlat1.x = x_477;
    let x_479 : f32 = u_xlat32;
    let x_481 : f32 = u_xlat1.x;
    u_xlat1.x = ((x_479 * x_481) + -1.0f);
    let x_485 : vec4<f32> = u_xlat0;
    let x_487 : vec3<f32> = u_xlat1;
    let x_490 : vec2<f32> = u_xlat20;
    let x_491 : vec2<f32> = ((vec2<f32>(x_485.x, x_485.y) * vec2<f32>(x_487.x, x_487.x)) + x_490);
    let x_492 : vec3<f32> = u_xlat12;
    u_xlat12 = vec3<f32>(x_491.x, x_491.y, x_492.z);
  }
  let x_494 : vec3<f32> = u_xlat12;
  let x_495 : vec2<f32> = vec2<f32>(x_494.x, x_494.y);
  let x_496 : vec3<f32> = u_xlat12;
  u_xlat12 = vec3<f32>(x_495.x, x_495.y, x_496.z);
  let x_498 : vec3<f32> = u_xlat12;
  let x_502 : vec2<f32> = clamp(vec2<f32>(x_498.x, x_498.y), vec2<f32>(0.0f, 0.0f), vec2<f32>(1.0f, 1.0f));
  let x_503 : vec3<f32> = u_xlat12;
  u_xlat12 = vec3<f32>(x_502.x, x_502.y, x_503.z);
  let x_505 : vec3<f32> = u_xlat12;
  let x_509 : f32 = x_26.x_RenderViewportScaleFactor;
  let x_511 : vec2<f32> = (vec2<f32>(x_505.x, x_505.y) * vec2<f32>(x_509, x_509));
  let x_512 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_511.x, x_511.y, x_512.z, x_512.w);
  let x_519 : vec4<f32> = u_xlat0;
  let x_521 : vec4<f32> = textureSampleLevel(x_MainTex, sampler_MainTex, vec2<f32>(x_519.x, x_519.y), 0.0f);
  u_xlat0 = x_521;
  let x_522 : vec4<f32> = u_xlat3;
  let x_527 : vec2<f32> = vs_TEXCOORD0;
  u_xlat3 = ((x_522 * vec4<f32>(-0.333333343f, -0.333333343f, -0.666666687f, -0.666666687f)) + vec4<f32>(x_527.x, x_527.y, x_527.x, x_527.y));
  let x_530 : vec4<f32> = u_xlat3;
  u_xlat3 = (x_530 + vec4<f32>(-0.5f, -0.5f, -0.5f, -0.5f));
  let x_533 : vec4<f32> = u_xlat3;
  let x_535 : vec4<f32> = x_26.x_Distortion_Amount;
  u_xlat7 = ((x_533 * vec4<f32>(x_535.z, x_535.z, x_535.z, x_535.z)) + vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
  let x_540 : vec4<f32> = u_xlat3;
  let x_542 : vec4<f32> = x_26.x_Distortion_Amount;
  let x_546 : vec4<f32> = x_26.x_Distortion_CenterScale;
  u_xlat3 = ((x_540 * vec4<f32>(x_542.z, x_542.z, x_542.z, x_542.z)) + -(vec4<f32>(x_546.x, x_546.y, x_546.x, x_546.y)));
  let x_550 : vec4<f32> = u_xlat3;
  let x_552 : vec4<f32> = x_26.x_Distortion_CenterScale;
  u_xlat3 = (x_550 * vec4<f32>(x_552.z, x_552.w, x_552.z, x_552.w));
  let x_555 : vec4<f32> = u_xlat3;
  let x_557 : vec4<f32> = u_xlat3;
  u_xlat1.x = dot(vec2<f32>(x_555.x, x_555.y), vec2<f32>(x_557.x, x_557.y));
  let x_562 : f32 = u_xlat1.x;
  u_xlat1.x = sqrt(x_562);
  let x_565 : bool = u_xlatb11;
  if (x_565) {
    let x_568 : vec3<f32> = u_xlat1;
    let x_571 : vec4<f32> = x_26.x_Distortion_Amount;
    let x_573 : vec2<f32> = (vec2<f32>(x_568.x, x_568.x) * vec2<f32>(x_571.x, x_571.y));
    let x_574 : vec3<f32> = u_xlat12;
    u_xlat12 = vec3<f32>(x_573.x, x_573.y, x_574.z);
    let x_577 : f32 = u_xlat12.x;
    u_xlat8.x = sin(x_577);
    let x_582 : f32 = u_xlat12.x;
    u_xlat9 = cos(x_582);
    let x_585 : f32 = u_xlat8.x;
    let x_586 : f32 = u_xlat9;
    u_xlat12.x = (x_585 / x_586);
    let x_590 : f32 = u_xlat12.y;
    u_xlat22 = (1.0f / x_590);
    let x_593 : f32 = u_xlat12.x;
    let x_594 : f32 = u_xlat22;
    u_xlat12.x = ((x_593 * x_594) + -1.0f);
    let x_598 : vec4<f32> = u_xlat3;
    let x_600 : vec3<f32> = u_xlat12;
    let x_603 : vec4<f32> = u_xlat7;
    let x_605 : vec2<f32> = ((vec2<f32>(x_598.x, x_598.y) * vec2<f32>(x_600.x, x_600.x)) + vec2<f32>(x_603.x, x_603.y));
    let x_606 : vec3<f32> = u_xlat12;
    u_xlat12 = vec3<f32>(x_605.x, x_605.y, x_606.z);
  } else {
    let x_610 : f32 = u_xlat1.x;
    u_xlat32 = (1.0f / x_610);
    let x_612 : f32 = u_xlat32;
    let x_614 : f32 = x_26.x_Distortion_Amount.x;
    u_xlat32 = (x_612 * x_614);
    let x_617 : f32 = u_xlat1.x;
    let x_619 : f32 = x_26.x_Distortion_Amount.y;
    u_xlat1.x = (x_617 * x_619);
    let x_623 : f32 = u_xlat1.x;
    u_xlat8.x = min(abs(x_623), 1.0f);
    let x_629 : f32 = u_xlat1.x;
    u_xlat18 = max(abs(x_629), 1.0f);
    let x_632 : f32 = u_xlat18;
    u_xlat18 = (1.0f / x_632);
    let x_634 : f32 = u_xlat18;
    let x_636 : f32 = u_xlat8.x;
    u_xlat8.x = (x_634 * x_636);
    let x_640 : f32 = u_xlat8.x;
    let x_642 : f32 = u_xlat8.x;
    u_xlat18 = (x_640 * x_642);
    let x_645 : f32 = u_xlat18;
    u_xlat28 = ((x_645 * 0.0208351f) + -0.085133001f);
    let x_648 : f32 = u_xlat18;
    let x_649 : f32 = u_xlat28;
    u_xlat28 = ((x_648 * x_649) + 0.180141002f);
    let x_652 : f32 = u_xlat18;
    let x_653 : f32 = u_xlat28;
    u_xlat28 = ((x_652 * x_653) + -0.330299497f);
    let x_656 : f32 = u_xlat18;
    let x_657 : f32 = u_xlat28;
    u_xlat18 = ((x_656 * x_657) + 0.999866009f);
    let x_660 : f32 = u_xlat18;
    let x_662 : f32 = u_xlat8.x;
    u_xlat28 = (x_660 * x_662);
    let x_666 : f32 = u_xlat1.x;
    u_xlatb38 = (1.0f < abs(x_666));
    let x_669 : f32 = u_xlat28;
    u_xlat28 = ((x_669 * -2.0f) + 1.570796371f);
    let x_672 : bool = u_xlatb38;
    let x_673 : f32 = u_xlat28;
    u_xlat28 = select(0.0f, x_673, x_672);
    let x_676 : f32 = u_xlat8.x;
    let x_677 : f32 = u_xlat18;
    let x_679 : f32 = u_xlat28;
    u_xlat8.x = ((x_676 * x_677) + x_679);
    let x_683 : f32 = u_xlat1.x;
    u_xlat1.x = min(x_683, 1.0f);
    let x_687 : f32 = u_xlat1.x;
    let x_689 : f32 = u_xlat1.x;
    u_xlatb1 = (x_687 < -(x_689));
    let x_692 : bool = u_xlatb1;
    if (x_692) {
      let x_697 : f32 = u_xlat8.x;
      x_693 = -(x_697);
    } else {
      let x_701 : f32 = u_xlat8.x;
      x_693 = x_701;
    }
    let x_702 : f32 = x_693;
    u_xlat1.x = x_702;
    let x_704 : f32 = u_xlat32;
    let x_706 : f32 = u_xlat1.x;
    u_xlat1.x = ((x_704 * x_706) + -1.0f);
    let x_710 : vec4<f32> = u_xlat3;
    let x_712 : vec3<f32> = u_xlat1;
    let x_715 : vec4<f32> = u_xlat7;
    let x_717 : vec2<f32> = ((vec2<f32>(x_710.x, x_710.y) * vec2<f32>(x_712.x, x_712.x)) + vec2<f32>(x_715.x, x_715.y));
    let x_718 : vec3<f32> = u_xlat12;
    u_xlat12 = vec3<f32>(x_717.x, x_717.y, x_718.z);
  }
  let x_720 : vec3<f32> = u_xlat12;
  let x_721 : vec2<f32> = vec2<f32>(x_720.x, x_720.y);
  let x_722 : vec3<f32> = u_xlat12;
  u_xlat12 = vec3<f32>(x_721.x, x_721.y, x_722.z);
  let x_724 : vec3<f32> = u_xlat12;
  let x_728 : vec2<f32> = clamp(vec2<f32>(x_724.x, x_724.y), vec2<f32>(0.0f, 0.0f), vec2<f32>(1.0f, 1.0f));
  let x_729 : vec3<f32> = u_xlat12;
  u_xlat12 = vec3<f32>(x_728.x, x_728.y, x_729.z);
  let x_731 : vec3<f32> = u_xlat12;
  let x_734 : f32 = x_26.x_RenderViewportScaleFactor;
  let x_736 : vec2<f32> = (vec2<f32>(x_731.x, x_731.y) * vec2<f32>(x_734, x_734));
  let x_737 : vec3<f32> = u_xlat12;
  u_xlat12 = vec3<f32>(x_736.x, x_736.y, x_737.z);
  let x_742 : vec3<f32> = u_xlat12;
  let x_744 : vec4<f32> = textureSampleLevel(x_MainTex, sampler_MainTex, vec2<f32>(x_742.x, x_742.y), 0.0f);
  u_xlat8 = x_744;
  let x_745 : vec4<f32> = u_xlat3;
  let x_747 : vec4<f32> = u_xlat3;
  u_xlat1.x = dot(vec2<f32>(x_745.z, x_745.w), vec2<f32>(x_747.z, x_747.w));
  let x_752 : f32 = u_xlat1.x;
  u_xlat1.x = sqrt(x_752);
  let x_755 : bool = u_xlatb11;
  if (x_755) {
    let x_758 : vec3<f32> = u_xlat1;
    let x_761 : vec4<f32> = x_26.x_Distortion_Amount;
    let x_763 : vec2<f32> = (vec2<f32>(x_758.x, x_758.x) * vec2<f32>(x_761.x, x_761.y));
    let x_764 : vec3<f32> = u_xlat12;
    u_xlat12 = vec3<f32>(x_763.x, x_763.y, x_764.z);
    let x_767 : f32 = u_xlat12.x;
    u_xlat3.x = sin(x_767);
    let x_771 : f32 = u_xlat12.x;
    u_xlat7.x = cos(x_771);
    let x_776 : f32 = u_xlat3.x;
    let x_778 : f32 = u_xlat7.x;
    u_xlat11.x = (x_776 / x_778);
    let x_782 : f32 = u_xlat12.y;
    u_xlat12.x = (1.0f / x_782);
    let x_786 : f32 = u_xlat11.x;
    let x_788 : f32 = u_xlat12.x;
    u_xlat11.x = ((x_786 * x_788) + -1.0f);
    let x_792 : vec4<f32> = u_xlat3;
    let x_794 : vec3<f32> = u_xlat11;
    let x_797 : vec4<f32> = u_xlat7;
    let x_799 : vec2<f32> = ((vec2<f32>(x_792.z, x_792.w) * vec2<f32>(x_794.x, x_794.x)) + vec2<f32>(x_797.z, x_797.w));
    let x_800 : vec3<f32> = u_xlat12;
    u_xlat12 = vec3<f32>(x_799.x, x_799.y, x_800.z);
  } else {
    let x_804 : f32 = u_xlat1.x;
    u_xlat11.x = (1.0f / x_804);
    let x_808 : f32 = u_xlat11.x;
    let x_810 : f32 = x_26.x_Distortion_Amount.x;
    u_xlat11.x = (x_808 * x_810);
    let x_814 : f32 = u_xlat1.x;
    let x_816 : f32 = x_26.x_Distortion_Amount.y;
    u_xlat1.x = (x_814 * x_816);
    let x_820 : f32 = u_xlat1.x;
    u_xlat32 = min(abs(x_820), 1.0f);
    let x_824 : f32 = u_xlat1.x;
    u_xlat3.x = max(abs(x_824), 1.0f);
    let x_829 : f32 = u_xlat3.x;
    u_xlat3.x = (1.0f / x_829);
    let x_832 : f32 = u_xlat32;
    let x_834 : f32 = u_xlat3.x;
    u_xlat32 = (x_832 * x_834);
    let x_836 : f32 = u_xlat32;
    let x_837 : f32 = u_xlat32;
    u_xlat3.x = (x_836 * x_837);
    let x_842 : f32 = u_xlat3.x;
    u_xlat13 = ((x_842 * 0.0208351f) + -0.085133001f);
    let x_846 : f32 = u_xlat3.x;
    let x_847 : f32 = u_xlat13;
    u_xlat13 = ((x_846 * x_847) + 0.180141002f);
    let x_851 : f32 = u_xlat3.x;
    let x_852 : f32 = u_xlat13;
    u_xlat13 = ((x_851 * x_852) + -0.330299497f);
    let x_856 : f32 = u_xlat3.x;
    let x_857 : f32 = u_xlat13;
    u_xlat3.x = ((x_856 * x_857) + 0.999866009f);
    let x_861 : f32 = u_xlat32;
    let x_863 : f32 = u_xlat3.x;
    u_xlat13 = (x_861 * x_863);
    let x_867 : f32 = u_xlat1.x;
    u_xlatb7 = (1.0f < abs(x_867));
    let x_870 : f32 = u_xlat13;
    u_xlat13 = ((x_870 * -2.0f) + 1.570796371f);
    let x_873 : bool = u_xlatb7;
    let x_874 : f32 = u_xlat13;
    u_xlat13 = select(0.0f, x_874, x_873);
    let x_876 : f32 = u_xlat32;
    let x_878 : f32 = u_xlat3.x;
    let x_880 : f32 = u_xlat13;
    u_xlat32 = ((x_876 * x_878) + x_880);
    let x_883 : f32 = u_xlat1.x;
    u_xlat1.x = min(x_883, 1.0f);
    let x_887 : f32 = u_xlat1.x;
    let x_889 : f32 = u_xlat1.x;
    u_xlatb1 = (x_887 < -(x_889));
    let x_892 : bool = u_xlatb1;
    if (x_892) {
      let x_896 : f32 = u_xlat32;
      x_893 = -(x_896);
    } else {
      let x_899 : f32 = u_xlat32;
      x_893 = x_899;
    }
    let x_900 : f32 = x_893;
    u_xlat1.x = x_900;
    let x_903 : f32 = u_xlat11.x;
    let x_905 : f32 = u_xlat1.x;
    u_xlat1.x = ((x_903 * x_905) + -1.0f);
    let x_909 : vec4<f32> = u_xlat3;
    let x_911 : vec3<f32> = u_xlat1;
    let x_914 : vec4<f32> = u_xlat7;
    let x_916 : vec2<f32> = ((vec2<f32>(x_909.z, x_909.w) * vec2<f32>(x_911.x, x_911.x)) + vec2<f32>(x_914.z, x_914.w));
    let x_917 : vec3<f32> = u_xlat12;
    u_xlat12 = vec3<f32>(x_916.x, x_916.y, x_917.z);
  }
  let x_919 : vec3<f32> = u_xlat12;
  let x_920 : vec2<f32> = vec2<f32>(x_919.x, x_919.y);
  let x_921 : vec3<f32> = u_xlat12;
  u_xlat12 = vec3<f32>(x_920.x, x_920.y, x_921.z);
  let x_923 : vec3<f32> = u_xlat12;
  let x_927 : vec2<f32> = clamp(vec2<f32>(x_923.x, x_923.y), vec2<f32>(0.0f, 0.0f), vec2<f32>(1.0f, 1.0f));
  let x_928 : vec3<f32> = u_xlat12;
  u_xlat12 = vec3<f32>(x_927.x, x_927.y, x_928.z);
  let x_930 : vec3<f32> = u_xlat12;
  let x_933 : f32 = x_26.x_RenderViewportScaleFactor;
  let x_935 : vec2<f32> = (vec2<f32>(x_930.x, x_930.y) * vec2<f32>(x_933, x_933));
  let x_936 : vec3<f32> = u_xlat1;
  u_xlat1 = vec3<f32>(x_935.x, x_935.y, x_936.z);
  let x_941 : vec3<f32> = u_xlat1;
  let x_943 : vec4<f32> = textureSampleLevel(x_MainTex, sampler_MainTex, vec2<f32>(x_941.x, x_941.y), 0.0f);
  u_xlat3 = x_943;
  u_xlat4.w = 1.0f;
  u_xlat5.w = 1.0f;
  let x_946 : vec4<f32> = u_xlat5;
  let x_947 : vec4<f32> = u_xlat8;
  u_xlat7 = (x_946 * x_947);
  let x_949 : vec4<f32> = u_xlat0;
  let x_950 : vec4<f32> = u_xlat4;
  let x_952 : vec4<f32> = u_xlat7;
  u_xlat0 = ((x_949 * x_950) + x_952);
  u_xlat6.w = 1.0f;
  let x_955 : vec4<f32> = u_xlat3;
  let x_956 : vec4<f32> = u_xlat6;
  let x_958 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_955 * x_956) + x_958);
  let x_960 : vec4<f32> = u_xlat4;
  let x_962 : vec4<f32> = u_xlat5;
  u_xlat12 = (vec3<f32>(x_960.x, x_960.y, x_960.z) + vec3<f32>(x_962.x, x_962.y, x_962.z));
  let x_965 : vec4<f32> = u_xlat6;
  let x_967 : vec3<f32> = u_xlat12;
  let x_968 : vec3<f32> = (vec3<f32>(x_965.x, x_965.y, x_965.z) + x_967);
  let x_969 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_968.x, x_968.y, x_968.z, x_969.w);
  u_xlat3.w = 3.0f;
  let x_973 : vec4<f32> = u_xlat0;
  let x_974 : vec4<f32> = u_xlat3;
  u_xlat0 = (x_973 / x_974);
  let x_976 : vec3<f32> = u_xlat2;
  let x_978 : vec4<f32> = u_xlat0;
  let x_980 : vec3<f32> = (vec3<f32>(x_976.x, x_976.x, x_976.x) * vec3<f32>(x_978.x, x_978.y, x_978.z));
  let x_981 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_980.x, x_980.y, x_980.z, x_981.w);
  let x_985 : f32 = x_26.x_Vignette_Mode;
  u_xlatb1 = (x_985 < 0.5f);
  let x_987 : bool = u_xlatb1;
  if (x_987) {
    let x_990 : vec2<f32> = u_xlat21;
    let x_994 : vec2<f32> = x_26.x_Vignette_Center;
    let x_996 : vec2<f32> = (x_990 + -(x_994));
    let x_997 : vec3<f32> = u_xlat1;
    u_xlat1 = vec3<f32>(x_996.x, x_996.y, x_997.z);
    let x_999 : vec3<f32> = u_xlat1;
    let x_1004 : vec4<f32> = x_26.x_Vignette_Settings;
    let x_1006 : vec2<f32> = (abs(vec2<f32>(x_999.y, x_999.x)) * vec2<f32>(x_1004.x, x_1004.x));
    let x_1007 : vec3<f32> = u_xlat2;
    u_xlat2 = vec3<f32>(x_1007.x, x_1006.x, x_1006.y);
    let x_1011 : f32 = x_26.x_ScreenParams.x;
    let x_1013 : f32 = x_26.x_ScreenParams.y;
    u_xlat1.x = (x_1011 / x_1013);
    let x_1017 : f32 = u_xlat1.x;
    u_xlat1.x = (x_1017 + -1.0f);
    let x_1021 : f32 = x_26.x_Vignette_Settings.w;
    let x_1023 : f32 = u_xlat1.x;
    u_xlat1.x = ((x_1021 * x_1023) + 1.0f);
    let x_1028 : f32 = u_xlat1.x;
    let x_1031 : f32 = u_xlat2.z;
    u_xlat2.x = (x_1028 * x_1031);
    let x_1034 : vec3<f32> = u_xlat2;
    let x_1035 : vec2<f32> = vec2<f32>(x_1034.x, x_1034.y);
    let x_1036 : vec3<f32> = u_xlat2;
    u_xlat2 = vec3<f32>(x_1035.x, x_1035.y, x_1036.z);
    let x_1038 : vec3<f32> = u_xlat2;
    let x_1042 : vec2<f32> = clamp(vec2<f32>(x_1038.x, x_1038.y), vec2<f32>(0.0f, 0.0f), vec2<f32>(1.0f, 1.0f));
    let x_1043 : vec3<f32> = u_xlat2;
    u_xlat2 = vec3<f32>(x_1042.x, x_1042.y, x_1043.z);
    let x_1045 : vec3<f32> = u_xlat2;
    let x_1047 : vec2<f32> = log2(vec2<f32>(x_1045.x, x_1045.y));
    let x_1048 : vec3<f32> = u_xlat1;
    u_xlat1 = vec3<f32>(x_1047.x, x_1047.y, x_1048.z);
    let x_1050 : vec3<f32> = u_xlat1;
    let x_1053 : vec4<f32> = x_26.x_Vignette_Settings;
    let x_1055 : vec2<f32> = (vec2<f32>(x_1050.x, x_1050.y) * vec2<f32>(x_1053.z, x_1053.z));
    let x_1056 : vec3<f32> = u_xlat1;
    u_xlat1 = vec3<f32>(x_1055.x, x_1055.y, x_1056.z);
    let x_1058 : vec3<f32> = u_xlat1;
    let x_1060 : vec2<f32> = exp2(vec2<f32>(x_1058.x, x_1058.y));
    let x_1061 : vec3<f32> = u_xlat1;
    u_xlat1 = vec3<f32>(x_1060.x, x_1060.y, x_1061.z);
    let x_1063 : vec3<f32> = u_xlat1;
    let x_1065 : vec3<f32> = u_xlat1;
    u_xlat1.x = dot(vec2<f32>(x_1063.x, x_1063.y), vec2<f32>(x_1065.x, x_1065.y));
    let x_1070 : f32 = u_xlat1.x;
    u_xlat1.x = (-(x_1070) + 1.0f);
    let x_1075 : f32 = u_xlat1.x;
    u_xlat1.x = max(x_1075, 0.0f);
    let x_1079 : f32 = u_xlat1.x;
    u_xlat1.x = log2(x_1079);
    let x_1083 : f32 = u_xlat1.x;
    let x_1085 : f32 = x_26.x_Vignette_Settings.y;
    u_xlat1.x = (x_1083 * x_1085);
    let x_1089 : f32 = u_xlat1.x;
    u_xlat1.x = exp2(x_1089);
    let x_1095 : vec3<f32> = x_26.x_Vignette_Color;
    u_xlat2 = (-(x_1095) + vec3<f32>(1.0f, 1.0f, 1.0f));
    let x_1099 : vec3<f32> = u_xlat1;
    let x_1101 : vec3<f32> = u_xlat2;
    let x_1104 : vec3<f32> = x_26.x_Vignette_Color;
    u_xlat2 = ((vec3<f32>(x_1099.x, x_1099.x, x_1099.x) * x_1101) + x_1104);
    let x_1106 : vec4<f32> = u_xlat0;
    let x_1108 : vec3<f32> = u_xlat2;
    u_xlat2 = (vec3<f32>(x_1106.x, x_1106.y, x_1106.z) * x_1108);
    let x_1111 : f32 = u_xlat0.w;
    u_xlat11.x = (x_1111 + -1.0f);
    let x_1115 : f32 = u_xlat1.x;
    let x_1117 : f32 = u_xlat11.x;
    u_xlat3.w = ((x_1115 * x_1117) + 1.0f);
  } else {
    let x_1127 : vec2<f32> = u_xlat21;
    let x_1128 : vec4<f32> = textureSample(x_Vignette_Mask, sampler_Vignette_Mask, x_1127);
    u_xlat1.x = x_1128.w;
    let x_1132 : f32 = u_xlat1.x;
    u_xlat1.z = (x_1132 + 0.055f);
    let x_1136 : vec3<f32> = u_xlat1;
    let x_1141 : vec2<f32> = (vec2<f32>(x_1136.x, x_1136.z) * vec2<f32>(0.077399381f, 0.947867334f));
    let x_1142 : vec3<f32> = u_xlat11;
    u_xlat11 = vec3<f32>(x_1141.x, x_1141.y, x_1142.z);
    let x_1145 : f32 = u_xlat11.y;
    u_xlat21.x = max(abs(x_1145), 1.1920929e-07f);
    let x_1151 : f32 = u_xlat21.x;
    u_xlat21.x = log2(x_1151);
    let x_1155 : f32 = u_xlat21.x;
    u_xlat21.x = (x_1155 * 2.400000095f);
    let x_1160 : f32 = u_xlat21.x;
    u_xlat21.x = exp2(x_1160);
    let x_1165 : f32 = u_xlat1.x;
    u_xlatb1 = (0.040449999f >= x_1165);
    let x_1167 : bool = u_xlatb1;
    if (x_1167) {
      let x_1172 : f32 = u_xlat11.x;
      x_1168 = x_1172;
    } else {
      let x_1175 : f32 = u_xlat21.x;
      x_1168 = x_1175;
    }
    let x_1176 : f32 = x_1168;
    u_xlat1.x = x_1176;
    let x_1179 : vec3<f32> = x_26.x_Vignette_Color;
    u_xlat11 = (-(x_1179) + vec3<f32>(1.0f, 1.0f, 1.0f));
    let x_1182 : vec3<f32> = u_xlat1;
    let x_1184 : vec3<f32> = u_xlat11;
    let x_1187 : vec3<f32> = x_26.x_Vignette_Color;
    u_xlat11 = ((vec3<f32>(x_1182.x, x_1182.x, x_1182.x) * x_1184) + x_1187);
    let x_1189 : vec4<f32> = u_xlat0;
    let x_1191 : vec3<f32> = u_xlat11;
    let x_1193 : vec4<f32> = u_xlat0;
    u_xlat11 = ((vec3<f32>(x_1189.x, x_1189.y, x_1189.z) * x_1191) + -(vec3<f32>(x_1193.x, x_1193.y, x_1193.z)));
    let x_1199 : f32 = x_26.x_Vignette_Opacity;
    let x_1201 : vec3<f32> = u_xlat11;
    let x_1203 : vec4<f32> = u_xlat0;
    u_xlat2 = ((vec3<f32>(x_1199, x_1199, x_1199) * x_1201) + vec3<f32>(x_1203.x, x_1203.y, x_1203.z));
    let x_1207 : f32 = u_xlat0.w;
    u_xlat0.x = (x_1207 + -1.0f);
    let x_1211 : f32 = u_xlat1.x;
    let x_1213 : f32 = u_xlat0.x;
    u_xlat3.w = ((x_1211 * x_1213) + 1.0f);
  }
  let x_1218 : vec2<f32> = vs_TEXCOORD1;
  let x_1221 : vec4<f32> = x_26.x_Grain_Params2;
  let x_1225 : vec4<f32> = x_26.x_Grain_Params2;
  let x_1227 : vec2<f32> = ((x_1218 * vec2<f32>(x_1221.x, x_1221.y)) + vec2<f32>(x_1225.z, x_1225.w));
  let x_1228 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1227.x, x_1227.y, x_1228.z, x_1228.w);
  let x_1235 : vec4<f32> = u_xlat0;
  let x_1237 : vec4<f32> = textureSample(x_GrainTex, sampler_GrainTex, vec2<f32>(x_1235.x, x_1235.y));
  let x_1238 : vec3<f32> = vec3<f32>(x_1237.x, x_1237.y, x_1237.z);
  let x_1239 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1238.x, x_1238.y, x_1238.z, x_1239.w);
  let x_1241 : vec3<f32> = u_xlat2;
  u_xlat1 = x_1241;
  let x_1242 : vec3<f32> = u_xlat1;
  u_xlat1 = clamp(x_1242, vec3<f32>(0.0f, 0.0f, 0.0f), vec3<f32>(1.0f, 1.0f, 1.0f));
  let x_1247 : vec3<f32> = u_xlat1;
  u_xlat30 = dot(x_1247, vec3<f32>(0.212672904f, 0.715152204f, 0.072175004f));
  let x_1253 : f32 = u_xlat30;
  u_xlat30 = sqrt(x_1253);
  let x_1257 : f32 = x_26.x_Grain_Params1.x;
  let x_1258 : f32 = u_xlat30;
  u_xlat30 = ((x_1257 * -(x_1258)) + 1.0f);
  let x_1262 : vec4<f32> = u_xlat0;
  let x_1264 : vec3<f32> = u_xlat2;
  let x_1265 : vec3<f32> = (vec3<f32>(x_1262.x, x_1262.y, x_1262.z) * x_1264);
  let x_1266 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1265.x, x_1265.y, x_1265.z, x_1266.w);
  let x_1268 : vec4<f32> = u_xlat0;
  let x_1271 : f32 = x_26.x_Grain_Params1.y;
  let x_1273 : f32 = x_26.x_Grain_Params1.y;
  let x_1275 : f32 = x_26.x_Grain_Params1.y;
  let x_1277 : vec3<f32> = (vec3<f32>(x_1268.x, x_1268.y, x_1268.z) * vec3<f32>(x_1271, x_1273, x_1275));
  let x_1278 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1277.x, x_1277.y, x_1277.z, x_1278.w);
  let x_1280 : vec4<f32> = u_xlat0;
  let x_1282 : f32 = u_xlat30;
  let x_1285 : vec3<f32> = u_xlat2;
  let x_1286 : vec3<f32> = ((vec3<f32>(x_1280.x, x_1280.y, x_1280.z) * vec3<f32>(x_1282, x_1282, x_1282)) + x_1285);
  let x_1287 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_1286.x, x_1286.y, x_1286.z, x_1287.w);
  let x_1289 : vec4<f32> = u_xlat3;
  u_xlat3 = x_1289;
  let x_1290 : vec4<f32> = u_xlat3;
  u_xlat3 = clamp(x_1290, vec4<f32>(0.0f, 0.0f, 0.0f, 0.0f), vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_1294 : vec4<f32> = u_xlat3;
  let x_1298 : vec3<f32> = (vec3<f32>(x_1294.z, x_1294.x, x_1294.y) * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
  let x_1299 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1298.x, x_1298.y, x_1298.z, x_1299.w);
  let x_1301 : vec4<f32> = u_xlat3;
  u_xlat1 = max(vec3<f32>(x_1301.z, x_1301.x, x_1301.y), vec3<f32>(1.1920929e-07f, 1.1920929e-07f, 1.1920929e-07f));
  let x_1305 : vec3<f32> = u_xlat1;
  u_xlat1 = log2(x_1305);
  let x_1307 : vec3<f32> = u_xlat1;
  u_xlat1 = (x_1307 * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
  let x_1311 : vec3<f32> = u_xlat1;
  u_xlat1 = exp2(x_1311);
  let x_1313 : vec3<f32> = u_xlat1;
  u_xlat1 = ((x_1313 * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
  let x_1325 : vec4<f32> = u_xlat3;
  let x_1328 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_1325.z, x_1325.x, x_1325.y, x_1325.z));
  u_xlatb2 = vec3<bool>(x_1328.x, x_1328.y, x_1328.z);
  let x_1332 : vec4<f32> = u_xlat0;
  hlslcc_movcTemp = x_1332;
  let x_1334 : bool = u_xlatb2.x;
  if (x_1334) {
    let x_1339 : f32 = u_xlat0.x;
    x_1335 = x_1339;
  } else {
    let x_1342 : f32 = u_xlat1.x;
    x_1335 = x_1342;
  }
  let x_1343 : f32 = x_1335;
  hlslcc_movcTemp.x = x_1343;
  let x_1346 : bool = u_xlatb2.y;
  if (x_1346) {
    let x_1351 : f32 = u_xlat0.y;
    x_1347 = x_1351;
  } else {
    let x_1354 : f32 = u_xlat1.y;
    x_1347 = x_1354;
  }
  let x_1355 : f32 = x_1347;
  hlslcc_movcTemp.y = x_1355;
  let x_1358 : bool = u_xlatb2.z;
  if (x_1358) {
    let x_1363 : f32 = u_xlat0.z;
    x_1359 = x_1363;
  } else {
    let x_1366 : f32 = u_xlat1.z;
    x_1359 = x_1366;
  }
  let x_1367 : f32 = x_1359;
  hlslcc_movcTemp.z = x_1367;
  let x_1369 : vec4<f32> = hlslcc_movcTemp;
  u_xlat0 = x_1369;
  let x_1371 : vec4<f32> = u_xlat0;
  let x_1375 : vec3<f32> = x_26.x_Lut2D_Params;
  u_xlat10 = (vec3<f32>(x_1371.x, x_1371.y, x_1371.z) * vec3<f32>(x_1375.z, x_1375.z, x_1375.z));
  let x_1379 : f32 = u_xlat10.x;
  u_xlat10.x = floor(x_1379);
  let x_1383 : vec3<f32> = x_26.x_Lut2D_Params;
  let x_1385 : vec2<f32> = (vec2<f32>(x_1383.x, x_1383.y) * vec2<f32>(0.5f, 0.5f));
  let x_1386 : vec3<f32> = u_xlat1;
  u_xlat1 = vec3<f32>(x_1385.x, x_1385.y, x_1386.z);
  let x_1388 : vec3<f32> = u_xlat10;
  let x_1391 : vec3<f32> = x_26.x_Lut2D_Params;
  let x_1394 : vec3<f32> = u_xlat1;
  let x_1396 : vec2<f32> = ((vec2<f32>(x_1388.y, x_1388.z) * vec2<f32>(x_1391.x, x_1391.y)) + vec2<f32>(x_1394.x, x_1394.y));
  let x_1397 : vec3<f32> = u_xlat1;
  u_xlat1 = vec3<f32>(x_1397.x, x_1396.x, x_1396.y);
  let x_1400 : f32 = u_xlat10.x;
  let x_1402 : f32 = x_26.x_Lut2D_Params.y;
  let x_1405 : f32 = u_xlat1.y;
  u_xlat1.x = ((x_1400 * x_1402) + x_1405);
  let x_1413 : vec3<f32> = u_xlat1;
  let x_1415 : vec4<f32> = textureSample(x_Lut2D, sampler_Lut2D, vec2<f32>(x_1413.x, x_1413.z));
  u_xlat2 = vec3<f32>(x_1415.x, x_1415.y, x_1415.z);
  let x_1418 : f32 = x_26.x_Lut2D_Params.y;
  u_xlat4.x = x_1418;
  u_xlat4.y = 0.0f;
  let x_1421 : vec3<f32> = u_xlat1;
  let x_1423 : vec4<f32> = u_xlat4;
  u_xlat20 = (vec2<f32>(x_1421.x, x_1421.z) + vec2<f32>(x_1423.x, x_1423.y));
  let x_1429 : vec2<f32> = u_xlat20;
  let x_1430 : vec4<f32> = textureSample(x_Lut2D, sampler_Lut2D, x_1429);
  u_xlat1 = vec3<f32>(x_1430.x, x_1430.y, x_1430.z);
  let x_1433 : f32 = u_xlat0.x;
  let x_1435 : f32 = x_26.x_Lut2D_Params.z;
  let x_1438 : f32 = u_xlat10.x;
  u_xlat0.x = ((x_1433 * x_1435) + -(x_1438));
  let x_1442 : vec3<f32> = u_xlat2;
  let x_1444 : vec3<f32> = u_xlat1;
  u_xlat10 = (-(x_1442) + x_1444);
  let x_1446 : vec4<f32> = u_xlat0;
  let x_1448 : vec3<f32> = u_xlat10;
  let x_1450 : vec3<f32> = u_xlat2;
  let x_1451 : vec3<f32> = ((vec3<f32>(x_1446.x, x_1446.x, x_1446.x) * x_1448) + x_1450);
  let x_1452 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1451.x, x_1451.y, x_1451.z, x_1452.w);
  let x_1454 : vec4<f32> = u_xlat0;
  u_xlat1 = (vec3<f32>(x_1454.x, x_1454.y, x_1454.z) * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
  let x_1458 : vec4<f32> = u_xlat0;
  u_xlat2 = (vec3<f32>(x_1458.x, x_1458.y, x_1458.z) + vec3<f32>(0.055f, 0.055f, 0.055f));
  let x_1462 : vec3<f32> = u_xlat2;
  u_xlat2 = (x_1462 * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
  let x_1465 : vec3<f32> = u_xlat2;
  u_xlat2 = max(abs(x_1465), vec3<f32>(1.1920929e-07f, 1.1920929e-07f, 1.1920929e-07f));
  let x_1468 : vec3<f32> = u_xlat2;
  u_xlat2 = log2(x_1468);
  let x_1470 : vec3<f32> = u_xlat2;
  u_xlat2 = (x_1470 * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
  let x_1473 : vec3<f32> = u_xlat2;
  u_xlat2 = exp2(x_1473);
  let x_1477 : vec4<f32> = u_xlat0;
  let x_1479 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_1477.x, x_1477.y, x_1477.z, x_1477.x));
  u_xlatb0 = vec3<bool>(x_1479.x, x_1479.y, x_1479.z);
  let x_1482 : bool = u_xlatb0.x;
  if (x_1482) {
    let x_1487 : f32 = u_xlat1.x;
    x_1483 = x_1487;
  } else {
    let x_1490 : f32 = u_xlat2.x;
    x_1483 = x_1490;
  }
  let x_1491 : f32 = x_1483;
  u_xlat3.x = x_1491;
  let x_1494 : bool = u_xlatb0.y;
  if (x_1494) {
    let x_1499 : f32 = u_xlat1.y;
    x_1495 = x_1499;
  } else {
    let x_1502 : f32 = u_xlat2.y;
    x_1495 = x_1502;
  }
  let x_1503 : f32 = x_1495;
  u_xlat3.y = x_1503;
  let x_1506 : bool = u_xlatb0.z;
  if (x_1506) {
    let x_1511 : f32 = u_xlat1.z;
    x_1507 = x_1511;
  } else {
    let x_1514 : f32 = u_xlat2.z;
    x_1507 = x_1514;
  }
  let x_1515 : f32 = x_1507;
  u_xlat3.z = x_1515;
  let x_1519 : f32 = x_26.x_LumaInAlpha;
  u_xlatb0.x = (0.5f < x_1519);
  let x_1523 : bool = u_xlatb0.x;
  if (x_1523) {
    let x_1526 : vec4<f32> = u_xlat3;
    let x_1527 : vec3<f32> = vec3<f32>(x_1526.x, x_1526.y, x_1526.z);
    let x_1528 : vec4<f32> = u_xlat0;
    u_xlat0 = vec4<f32>(x_1527.x, x_1527.y, x_1527.z, x_1528.w);
    let x_1530 : vec4<f32> = u_xlat0;
    let x_1534 : vec3<f32> = clamp(vec3<f32>(x_1530.x, x_1530.y, x_1530.z), vec3<f32>(0.0f, 0.0f, 0.0f), vec3<f32>(1.0f, 1.0f, 1.0f));
    let x_1535 : vec4<f32> = u_xlat0;
    u_xlat0 = vec4<f32>(x_1534.x, x_1534.y, x_1534.z, x_1535.w);
    let x_1537 : vec4<f32> = u_xlat0;
    u_xlat3.w = dot(vec3<f32>(x_1537.x, x_1537.y, x_1537.z), vec3<f32>(0.212672904f, 0.715152204f, 0.072175004f));
  }
  let x_1543 : vec4<f32> = u_xlat3;
  SV_Target0 = x_1543;
  return;
}

struct main_out {
  @location(0)
  SV_Target0_1 : vec4<f32>,
}

@fragment
fn main(@location(0) vs_TEXCOORD0_param : vec2<f32>, @location(1) vs_TEXCOORD1_param : vec2<f32>, @builtin(position) gl_FragCoord_param : vec4<f32>) -> main_out {
  vs_TEXCOORD0 = vs_TEXCOORD0_param;
  vs_TEXCOORD1 = vs_TEXCOORD1_param;
  gl_FragCoord = gl_FragCoord_param;
  main_1();
  return main_out(SV_Target0);
}

