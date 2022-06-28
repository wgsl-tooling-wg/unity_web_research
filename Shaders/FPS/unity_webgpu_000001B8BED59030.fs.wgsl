struct PGlobals {
  x_RenderViewportScaleFactor : f32,
  @size(12)
  padding : u32,
  x_Distortion_Amount : vec4<f32>,
  x_Distortion_CenterScale : vec4<f32>,
  x_Dithering_Coords : vec4<f32>,
  x_BloomTex_TexelSize : vec4<f32>,
  x_Bloom_DirtTileOffset : vec4<f32>,
  x_Bloom_Settings : vec3<f32>,
  @size(4)
  padding_1 : u32,
  x_Bloom_Color : vec3<f32>,
  x_ChromaticAberration_Amount : f32,
  x_Lut2D_Params : vec3<f32>,
  @size(4)
  padding_2 : u32,
  x_Grain_Params1 : vec2<f32>,
  @size(8)
  padding_3 : u32,
  x_Grain_Params2 : vec4<f32>,
}

var<private> u_xlat0 : vec4<f32>;

var<private> vs_TEXCOORD0 : vec2<f32>;

var<private> u_xlat20 : vec2<f32>;

@group(0) @binding(0) var<uniform> x_26 : PGlobals;

var<private> u_xlat1 : vec4<f32>;

var<private> u_xlatb11 : bool;

var<private> u_xlat21 : vec2<f32>;

var<private> u_xlat2 : vec4<f32>;

var<private> u_xlat3 : vec4<f32>;

var<private> u_xlat31 : f32;

var<private> u_xlat12 : vec3<f32>;

var<private> u_xlat22 : f32;

var<private> u_xlat32 : f32;

var<private> u_xlatb13 : bool;

var<private> u_xlatb12 : bool;

@group(0) @binding(3) var x_AutoExposureTex : texture_2d<f32>;

@group(0) @binding(11) var sampler_AutoExposureTex : sampler;

var<private> u_xlat4 : vec4<f32>;

@group(0) @binding(6) var x_ChromaticAberration_SpectralLut : texture_2d<f32>;

@group(0) @binding(14) var sampler_ChromaticAberration_SpectralLut : sampler;

var<private> u_xlat5 : vec4<f32>;

var<private> u_xlat6 : vec4<f32>;

var<private> u_xlat7 : vec4<f32>;

var<private> u_xlat8 : vec4<f32>;

var<private> u_xlat17 : f32;

var<private> u_xlat27 : f32;

var<private> u_xlatb37 : bool;

var<private> u_xlatb1 : bool;

@group(0) @binding(2) var x_MainTex : texture_2d<f32>;

@group(0) @binding(10) var sampler_MainTex : sampler;

var<private> u_xlat9 : f32;

var<private> u_xlat18 : f32;

var<private> u_xlat28 : f32;

var<private> u_xlatb38 : bool;

var<private> u_xlat11 : vec3<f32>;

var<private> u_xlat13 : f32;

var<private> u_xlatb7 : bool;

@group(0) @binding(4) var x_BloomTex : texture_2d<f32>;

@group(0) @binding(12) var sampler_BloomTex : sampler;

@group(0) @binding(5) var x_Bloom_DirtTex : texture_2d<f32>;

@group(0) @binding(13) var sampler_Bloom_DirtTex : sampler;

var<private> vs_TEXCOORD1 : vec2<f32>;

@group(0) @binding(8) var x_GrainTex : texture_2d<f32>;

@group(0) @binding(16) var sampler_GrainTex : sampler;

var<private> u_xlat30 : f32;

var<private> u_xlatb0 : vec3<bool>;

var<private> u_xlat10 : f32;

@group(0) @binding(7) var x_Lut2D : texture_2d<f32>;

@group(0) @binding(15) var sampler_Lut2D : sampler;

@group(0) @binding(1) var x_DitheringTex : texture_2d<f32>;

@group(0) @binding(9) var sampler_DitheringTex : sampler;

var<private> SV_Target0 : vec4<f32>;

var<private> gl_FragCoord : vec4<f32>;

fn main_1() {
  var x_209 : f32;
  var x_235 : f32;
  var x_468 : f32;
  var x_693 : f32;
  var x_893 : f32;
  var x_1273 : f32;
  var x_1285 : f32;
  var x_1298 : f32;
  var x_1456 : f32;
  var x_1468 : f32;
  var x_1480 : f32;
  var x_1589 : f32;
  var x_1601 : f32;
  var x_1613 : f32;
  var x_1677 : f32;
  var x_1690 : f32;
  var x_1702 : f32;
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
  let x_60 : vec4<f32> = u_xlat0;
  let x_62 : vec4<f32> = u_xlat0;
  u_xlat1.x = dot(vec2<f32>(x_60.x, x_60.y), vec2<f32>(x_62.x, x_62.y));
  let x_70 : f32 = u_xlat1.x;
  u_xlat1.x = sqrt(x_70);
  let x_80 : f32 = x_26.x_Distortion_Amount.w;
  u_xlatb11 = (0.0f < x_80);
  let x_82 : bool = u_xlatb11;
  if (x_82) {
    let x_86 : vec4<f32> = u_xlat1;
    let x_89 : vec4<f32> = x_26.x_Distortion_Amount;
    u_xlat21 = (vec2<f32>(x_86.x, x_86.x) * vec2<f32>(x_89.x, x_89.y));
    let x_94 : f32 = u_xlat21.x;
    u_xlat2.x = sin(x_94);
    let x_99 : f32 = u_xlat21.x;
    u_xlat3.x = cos(x_99);
    let x_103 : f32 = u_xlat2.x;
    let x_105 : f32 = u_xlat3.x;
    u_xlat21.x = (x_103 / x_105);
    let x_112 : f32 = u_xlat21.y;
    u_xlat31 = (1.0f / x_112);
    let x_115 : f32 = u_xlat21.x;
    let x_116 : f32 = u_xlat31;
    u_xlat21.x = ((x_115 * x_116) + -1.0f);
    let x_121 : vec4<f32> = u_xlat0;
    let x_123 : vec2<f32> = u_xlat21;
    let x_126 : vec2<f32> = u_xlat20;
    u_xlat21 = ((vec2<f32>(x_121.x, x_121.y) * vec2<f32>(x_123.x, x_123.x)) + x_126);
  } else {
    let x_130 : f32 = u_xlat1.x;
    u_xlat2.x = (1.0f / x_130);
    let x_134 : f32 = u_xlat2.x;
    let x_136 : f32 = x_26.x_Distortion_Amount.x;
    u_xlat2.x = (x_134 * x_136);
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
    let x_253 : vec4<f32> = u_xlat2;
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
    let x_340 : vec4<f32> = u_xlat1;
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
    let x_487 : vec4<f32> = u_xlat1;
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
    let x_568 : vec4<f32> = u_xlat1;
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
    let x_712 : vec4<f32> = u_xlat1;
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
    let x_758 : vec4<f32> = u_xlat1;
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
    let x_911 : vec4<f32> = u_xlat1;
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
  let x_936 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_935.x, x_935.y, x_936.z, x_936.w);
  let x_941 : vec4<f32> = u_xlat1;
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
  let x_976 : vec4<f32> = u_xlat2;
  let x_978 : vec4<f32> = u_xlat0;
  let x_980 : vec3<f32> = (vec3<f32>(x_976.x, x_976.x, x_976.x) * vec3<f32>(x_978.x, x_978.y, x_978.z));
  let x_981 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_980.x, x_980.y, x_980.z, x_981.w);
  let x_985 : vec4<f32> = x_26.x_BloomTex_TexelSize;
  u_xlat2 = (vec4<f32>(x_985.x, x_985.y, x_985.x, x_985.y) * vec4<f32>(-1.0f, -1.0f, 1.0f, 1.0f));
  let x_991 : f32 = x_26.x_Bloom_Settings.x;
  u_xlat1.x = (x_991 * 0.5f);
  let x_994 : vec4<f32> = u_xlat2;
  let x_996 : vec4<f32> = u_xlat1;
  let x_999 : vec2<f32> = u_xlat21;
  u_xlat3 = ((vec4<f32>(x_994.x, x_994.y, x_994.z, x_994.y) * vec4<f32>(x_996.x, x_996.x, x_996.x, x_996.x)) + vec4<f32>(x_999.x, x_999.y, x_999.x, x_999.y));
  let x_1002 : vec4<f32> = u_xlat3;
  u_xlat3 = clamp(x_1002, vec4<f32>(0.0f, 0.0f, 0.0f, 0.0f), vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_1006 : vec4<f32> = u_xlat3;
  let x_1008 : f32 = x_26.x_RenderViewportScaleFactor;
  u_xlat3 = (x_1006 * vec4<f32>(x_1008, x_1008, x_1008, x_1008));
  let x_1016 : vec4<f32> = u_xlat3;
  let x_1018 : vec4<f32> = textureSample(x_BloomTex, sampler_BloomTex, vec2<f32>(x_1016.x, x_1016.y));
  u_xlat4 = x_1018;
  let x_1022 : vec4<f32> = u_xlat3;
  let x_1024 : vec4<f32> = textureSample(x_BloomTex, sampler_BloomTex, vec2<f32>(x_1022.z, x_1022.w));
  u_xlat3 = x_1024;
  let x_1025 : vec4<f32> = u_xlat3;
  let x_1026 : vec4<f32> = u_xlat4;
  u_xlat3 = (x_1025 + x_1026);
  let x_1028 : vec4<f32> = u_xlat2;
  let x_1030 : vec4<f32> = u_xlat1;
  let x_1033 : vec2<f32> = u_xlat21;
  u_xlat2 = ((vec4<f32>(x_1028.x, x_1028.w, x_1028.z, x_1028.w) * vec4<f32>(x_1030.x, x_1030.x, x_1030.x, x_1030.x)) + vec4<f32>(x_1033.x, x_1033.y, x_1033.x, x_1033.y));
  let x_1036 : vec4<f32> = u_xlat2;
  u_xlat2 = clamp(x_1036, vec4<f32>(0.0f, 0.0f, 0.0f, 0.0f), vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_1040 : vec4<f32> = u_xlat2;
  let x_1042 : f32 = x_26.x_RenderViewportScaleFactor;
  u_xlat2 = (x_1040 * vec4<f32>(x_1042, x_1042, x_1042, x_1042));
  let x_1048 : vec4<f32> = u_xlat2;
  let x_1050 : vec4<f32> = textureSample(x_BloomTex, sampler_BloomTex, vec2<f32>(x_1048.x, x_1048.y));
  u_xlat4 = x_1050;
  let x_1051 : vec4<f32> = u_xlat3;
  let x_1052 : vec4<f32> = u_xlat4;
  u_xlat3 = (x_1051 + x_1052);
  let x_1057 : vec4<f32> = u_xlat2;
  let x_1059 : vec4<f32> = textureSample(x_BloomTex, sampler_BloomTex, vec2<f32>(x_1057.z, x_1057.w));
  u_xlat2 = x_1059;
  let x_1060 : vec4<f32> = u_xlat2;
  let x_1061 : vec4<f32> = u_xlat3;
  u_xlat2 = (x_1060 + x_1061);
  let x_1063 : vec4<f32> = u_xlat2;
  let x_1066 : vec3<f32> = x_26.x_Bloom_Settings;
  u_xlat2 = (x_1063 * vec4<f32>(x_1066.y, x_1066.y, x_1066.y, x_1066.y));
  let x_1069 : vec2<f32> = u_xlat21;
  let x_1072 : vec4<f32> = x_26.x_Bloom_DirtTileOffset;
  let x_1076 : vec4<f32> = x_26.x_Bloom_DirtTileOffset;
  let x_1078 : vec2<f32> = ((x_1069 * vec2<f32>(x_1072.x, x_1072.y)) + vec2<f32>(x_1076.z, x_1076.w));
  let x_1079 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1078.x, x_1078.y, x_1079.z, x_1079.w);
  let x_1086 : vec4<f32> = u_xlat1;
  let x_1088 : vec4<f32> = textureSample(x_Bloom_DirtTex, sampler_Bloom_DirtTex, vec2<f32>(x_1086.x, x_1086.y));
  let x_1089 : vec3<f32> = vec3<f32>(x_1088.x, x_1088.y, x_1088.z);
  let x_1090 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1089.x, x_1089.y, x_1089.z, x_1090.w);
  let x_1092 : vec4<f32> = u_xlat2;
  u_xlat3 = (x_1092 * vec4<f32>(0.25f, 0.25f, 0.25f, 0.25f));
  let x_1096 : vec4<f32> = u_xlat1;
  let x_1099 : vec3<f32> = x_26.x_Bloom_Settings;
  let x_1101 : vec3<f32> = (vec3<f32>(x_1096.x, x_1096.y, x_1096.z) * vec3<f32>(x_1099.z, x_1099.z, x_1099.z));
  let x_1102 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1101.x, x_1101.y, x_1101.z, x_1102.w);
  u_xlat1.w = 0.0f;
  let x_1105 : vec4<f32> = u_xlat2;
  u_xlat2 = (x_1105 * vec4<f32>(0.25f, 0.25f, 0.25f, 1.0f));
  let x_1108 : vec4<f32> = u_xlat2;
  let x_1112 : vec3<f32> = x_26.x_Bloom_Color;
  let x_1113 : vec3<f32> = (vec3<f32>(x_1108.x, x_1108.y, x_1108.z) * x_1112);
  let x_1114 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_1113.x, x_1113.y, x_1113.z, x_1114.w);
  let x_1117 : f32 = u_xlat2.w;
  u_xlat4.w = (x_1117 * 0.25f);
  let x_1120 : vec4<f32> = u_xlat0;
  let x_1121 : vec4<f32> = u_xlat4;
  u_xlat0 = (x_1120 + x_1121);
  let x_1123 : vec4<f32> = u_xlat1;
  let x_1124 : vec4<f32> = u_xlat3;
  let x_1126 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_1123 * x_1124) + x_1126);
  let x_1129 : vec2<f32> = vs_TEXCOORD1;
  let x_1132 : vec4<f32> = x_26.x_Grain_Params2;
  let x_1136 : vec4<f32> = x_26.x_Grain_Params2;
  let x_1138 : vec2<f32> = ((x_1129 * vec2<f32>(x_1132.x, x_1132.y)) + vec2<f32>(x_1136.z, x_1136.w));
  let x_1139 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1138.x, x_1138.y, x_1139.z, x_1139.w);
  let x_1146 : vec4<f32> = u_xlat1;
  let x_1148 : vec4<f32> = textureSample(x_GrainTex, sampler_GrainTex, vec2<f32>(x_1146.x, x_1146.y));
  let x_1149 : vec3<f32> = vec3<f32>(x_1148.x, x_1148.y, x_1148.z);
  let x_1150 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1149.x, x_1149.y, x_1149.z, x_1150.w);
  let x_1152 : vec4<f32> = u_xlat0;
  let x_1153 : vec3<f32> = vec3<f32>(x_1152.x, x_1152.y, x_1152.z);
  let x_1154 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1153.x, x_1153.y, x_1153.z, x_1154.w);
  let x_1156 : vec4<f32> = u_xlat2;
  let x_1160 : vec3<f32> = clamp(vec3<f32>(x_1156.x, x_1156.y, x_1156.z), vec3<f32>(0.0f, 0.0f, 0.0f), vec3<f32>(1.0f, 1.0f, 1.0f));
  let x_1161 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1160.x, x_1160.y, x_1160.z, x_1161.w);
  let x_1163 : vec4<f32> = u_xlat2;
  u_xlat31 = dot(vec3<f32>(x_1163.x, x_1163.y, x_1163.z), vec3<f32>(0.212672904f, 0.715152204f, 0.072175004f));
  let x_1170 : f32 = u_xlat31;
  u_xlat31 = sqrt(x_1170);
  let x_1174 : f32 = x_26.x_Grain_Params1.x;
  let x_1175 : f32 = u_xlat31;
  u_xlat31 = ((x_1174 * -(x_1175)) + 1.0f);
  let x_1179 : vec4<f32> = u_xlat0;
  let x_1181 : vec4<f32> = u_xlat1;
  let x_1183 : vec3<f32> = (vec3<f32>(x_1179.x, x_1179.y, x_1179.z) * vec3<f32>(x_1181.x, x_1181.y, x_1181.z));
  let x_1184 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1183.x, x_1183.y, x_1183.z, x_1184.w);
  let x_1186 : vec4<f32> = u_xlat1;
  let x_1189 : f32 = x_26.x_Grain_Params1.y;
  let x_1191 : f32 = x_26.x_Grain_Params1.y;
  let x_1193 : f32 = x_26.x_Grain_Params1.y;
  let x_1195 : vec3<f32> = (vec3<f32>(x_1186.x, x_1186.y, x_1186.z) * vec3<f32>(x_1189, x_1191, x_1193));
  let x_1196 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1195.x, x_1195.y, x_1195.z, x_1196.w);
  let x_1198 : vec4<f32> = u_xlat1;
  let x_1200 : f32 = u_xlat31;
  let x_1203 : vec4<f32> = u_xlat0;
  let x_1205 : vec3<f32> = ((vec3<f32>(x_1198.x, x_1198.y, x_1198.z) * vec3<f32>(x_1200, x_1200, x_1200)) + vec3<f32>(x_1203.x, x_1203.y, x_1203.z));
  let x_1206 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1205.x, x_1205.y, x_1205.z, x_1206.w);
  let x_1208 : vec4<f32> = u_xlat0;
  let x_1212 : vec3<f32> = clamp(vec3<f32>(x_1208.x, x_1208.y, x_1208.z), vec3<f32>(0.0f, 0.0f, 0.0f), vec3<f32>(1.0f, 1.0f, 1.0f));
  let x_1213 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1212.x, x_1212.y, x_1212.z, x_1213.w);
  let x_1217 : f32 = u_xlat0.w;
  u_xlat30 = x_1217;
  let x_1218 : f32 = u_xlat30;
  u_xlat30 = clamp(x_1218, 0.0f, 1.0f);
  let x_1220 : vec4<f32> = u_xlat0;
  let x_1224 : vec3<f32> = (vec3<f32>(x_1220.z, x_1220.x, x_1220.y) * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
  let x_1225 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1224.x, x_1224.y, x_1224.z, x_1225.w);
  let x_1227 : vec4<f32> = u_xlat0;
  let x_1231 : vec3<f32> = max(vec3<f32>(x_1227.z, x_1227.x, x_1227.y), vec3<f32>(1.1920929e-07f, 1.1920929e-07f, 1.1920929e-07f));
  let x_1232 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1231.x, x_1231.y, x_1231.z, x_1232.w);
  let x_1234 : vec4<f32> = u_xlat2;
  let x_1236 : vec3<f32> = log2(vec3<f32>(x_1234.x, x_1234.y, x_1234.z));
  let x_1237 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1236.x, x_1236.y, x_1236.z, x_1237.w);
  let x_1239 : vec4<f32> = u_xlat2;
  let x_1243 : vec3<f32> = (vec3<f32>(x_1239.x, x_1239.y, x_1239.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
  let x_1244 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1243.x, x_1243.y, x_1243.z, x_1244.w);
  let x_1246 : vec4<f32> = u_xlat2;
  let x_1248 : vec3<f32> = exp2(vec3<f32>(x_1246.x, x_1246.y, x_1246.z));
  let x_1249 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1248.x, x_1248.y, x_1248.z, x_1249.w);
  let x_1251 : vec4<f32> = u_xlat2;
  let x_1258 : vec3<f32> = ((vec3<f32>(x_1251.x, x_1251.y, x_1251.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
  let x_1259 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1258.x, x_1258.y, x_1258.z, x_1259.w);
  let x_1266 : vec4<f32> = u_xlat0;
  let x_1269 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_1266.z, x_1266.x, x_1266.y, x_1266.z));
  u_xlatb0 = vec3<bool>(x_1269.x, x_1269.y, x_1269.z);
  let x_1272 : bool = u_xlatb0.x;
  if (x_1272) {
    let x_1277 : f32 = u_xlat1.x;
    x_1273 = x_1277;
  } else {
    let x_1280 : f32 = u_xlat2.x;
    x_1273 = x_1280;
  }
  let x_1281 : f32 = x_1273;
  u_xlat0.x = x_1281;
  let x_1284 : bool = u_xlatb0.y;
  if (x_1284) {
    let x_1289 : f32 = u_xlat1.y;
    x_1285 = x_1289;
  } else {
    let x_1292 : f32 = u_xlat2.y;
    x_1285 = x_1292;
  }
  let x_1293 : f32 = x_1285;
  u_xlat0.y = x_1293;
  let x_1297 : bool = u_xlatb0.z;
  if (x_1297) {
    let x_1302 : f32 = u_xlat1.z;
    x_1298 = x_1302;
  } else {
    let x_1305 : f32 = u_xlat2.z;
    x_1298 = x_1305;
  }
  let x_1306 : f32 = x_1298;
  u_xlat0.z = x_1306;
  let x_1308 : vec4<f32> = u_xlat0;
  let x_1312 : vec3<f32> = x_26.x_Lut2D_Params;
  let x_1314 : vec3<f32> = (vec3<f32>(x_1308.x, x_1308.y, x_1308.z) * vec3<f32>(x_1312.z, x_1312.z, x_1312.z));
  let x_1315 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1314.x, x_1314.y, x_1314.z, x_1315.w);
  let x_1319 : f32 = u_xlat1.x;
  u_xlat10 = floor(x_1319);
  let x_1322 : vec3<f32> = x_26.x_Lut2D_Params;
  let x_1324 : vec2<f32> = (vec2<f32>(x_1322.x, x_1322.y) * vec2<f32>(0.5f, 0.5f));
  let x_1325 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1324.x, x_1325.y, x_1325.z, x_1324.y);
  let x_1327 : vec4<f32> = u_xlat1;
  let x_1330 : vec3<f32> = x_26.x_Lut2D_Params;
  let x_1333 : vec4<f32> = u_xlat1;
  let x_1335 : vec2<f32> = ((vec2<f32>(x_1327.y, x_1327.z) * vec2<f32>(x_1330.x, x_1330.y)) + vec2<f32>(x_1333.x, x_1333.w));
  let x_1336 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1336.x, x_1335.x, x_1335.y, x_1336.w);
  let x_1338 : f32 = u_xlat10;
  let x_1340 : f32 = x_26.x_Lut2D_Params.y;
  let x_1343 : f32 = u_xlat1.y;
  u_xlat1.x = ((x_1338 * x_1340) + x_1343);
  let x_1351 : vec4<f32> = u_xlat1;
  let x_1353 : vec4<f32> = textureSample(x_Lut2D, sampler_Lut2D, vec2<f32>(x_1351.x, x_1351.z));
  let x_1354 : vec3<f32> = vec3<f32>(x_1353.x, x_1353.y, x_1353.z);
  let x_1355 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1354.x, x_1354.y, x_1354.z, x_1355.w);
  let x_1358 : f32 = x_26.x_Lut2D_Params.y;
  u_xlat3.x = x_1358;
  u_xlat3.y = 0.0f;
  let x_1361 : vec4<f32> = u_xlat1;
  let x_1363 : vec4<f32> = u_xlat3;
  let x_1365 : vec2<f32> = (vec2<f32>(x_1361.x, x_1361.z) + vec2<f32>(x_1363.x, x_1363.y));
  let x_1366 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1365.x, x_1365.y, x_1366.z, x_1366.w);
  let x_1371 : vec4<f32> = u_xlat1;
  let x_1373 : vec4<f32> = textureSample(x_Lut2D, sampler_Lut2D, vec2<f32>(x_1371.x, x_1371.y));
  let x_1374 : vec3<f32> = vec3<f32>(x_1373.x, x_1373.y, x_1373.z);
  let x_1375 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1374.x, x_1374.y, x_1374.z, x_1375.w);
  let x_1378 : f32 = u_xlat0.x;
  let x_1380 : f32 = x_26.x_Lut2D_Params.z;
  let x_1382 : f32 = u_xlat10;
  u_xlat0.x = ((x_1378 * x_1380) + -(x_1382));
  let x_1386 : vec4<f32> = u_xlat2;
  let x_1389 : vec4<f32> = u_xlat1;
  let x_1391 : vec3<f32> = (-(vec3<f32>(x_1386.x, x_1386.y, x_1386.z)) + vec3<f32>(x_1389.x, x_1389.y, x_1389.z));
  let x_1392 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1391.x, x_1391.y, x_1391.z, x_1392.w);
  let x_1394 : vec4<f32> = u_xlat0;
  let x_1396 : vec4<f32> = u_xlat1;
  let x_1399 : vec4<f32> = u_xlat2;
  let x_1401 : vec3<f32> = ((vec3<f32>(x_1394.x, x_1394.x, x_1394.x) * vec3<f32>(x_1396.x, x_1396.y, x_1396.z)) + vec3<f32>(x_1399.x, x_1399.y, x_1399.z));
  let x_1402 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1401.x, x_1401.y, x_1401.z, x_1402.w);
  let x_1404 : vec4<f32> = u_xlat0;
  let x_1408 : vec3<f32> = (vec3<f32>(x_1404.x, x_1404.y, x_1404.z) * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
  let x_1409 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1408.x, x_1408.y, x_1408.z, x_1409.w);
  let x_1411 : vec4<f32> = u_xlat0;
  let x_1415 : vec3<f32> = (vec3<f32>(x_1411.x, x_1411.y, x_1411.z) + vec3<f32>(0.055f, 0.055f, 0.055f));
  let x_1416 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1415.x, x_1415.y, x_1415.z, x_1416.w);
  let x_1418 : vec4<f32> = u_xlat2;
  let x_1422 : vec3<f32> = (vec3<f32>(x_1418.x, x_1418.y, x_1418.z) * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
  let x_1423 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1422.x, x_1422.y, x_1422.z, x_1423.w);
  let x_1425 : vec4<f32> = u_xlat2;
  let x_1428 : vec3<f32> = max(abs(vec3<f32>(x_1425.x, x_1425.y, x_1425.z)), vec3<f32>(1.1920929e-07f, 1.1920929e-07f, 1.1920929e-07f));
  let x_1429 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1428.x, x_1428.y, x_1428.z, x_1429.w);
  let x_1431 : vec4<f32> = u_xlat2;
  let x_1433 : vec3<f32> = log2(vec3<f32>(x_1431.x, x_1431.y, x_1431.z));
  let x_1434 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1433.x, x_1433.y, x_1433.z, x_1434.w);
  let x_1436 : vec4<f32> = u_xlat2;
  let x_1440 : vec3<f32> = (vec3<f32>(x_1436.x, x_1436.y, x_1436.z) * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
  let x_1441 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1440.x, x_1440.y, x_1440.z, x_1441.w);
  let x_1443 : vec4<f32> = u_xlat2;
  let x_1445 : vec3<f32> = exp2(vec3<f32>(x_1443.x, x_1443.y, x_1443.z));
  let x_1446 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1445.x, x_1445.y, x_1445.z, x_1446.w);
  let x_1450 : vec4<f32> = u_xlat0;
  let x_1452 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_1450.x, x_1450.y, x_1450.z, x_1450.x));
  u_xlatb0 = vec3<bool>(x_1452.x, x_1452.y, x_1452.z);
  let x_1455 : bool = u_xlatb0.x;
  if (x_1455) {
    let x_1460 : f32 = u_xlat1.x;
    x_1456 = x_1460;
  } else {
    let x_1463 : f32 = u_xlat2.x;
    x_1456 = x_1463;
  }
  let x_1464 : f32 = x_1456;
  u_xlat0.x = x_1464;
  let x_1467 : bool = u_xlatb0.y;
  if (x_1467) {
    let x_1472 : f32 = u_xlat1.y;
    x_1468 = x_1472;
  } else {
    let x_1475 : f32 = u_xlat2.y;
    x_1468 = x_1475;
  }
  let x_1476 : f32 = x_1468;
  u_xlat0.y = x_1476;
  let x_1479 : bool = u_xlatb0.z;
  if (x_1479) {
    let x_1484 : f32 = u_xlat1.z;
    x_1480 = x_1484;
  } else {
    let x_1487 : f32 = u_xlat2.z;
    x_1480 = x_1487;
  }
  let x_1488 : f32 = x_1480;
  u_xlat0.z = x_1488;
  let x_1490 : vec2<f32> = vs_TEXCOORD0;
  let x_1493 : vec4<f32> = x_26.x_Dithering_Coords;
  let x_1497 : vec4<f32> = x_26.x_Dithering_Coords;
  let x_1499 : vec2<f32> = ((x_1490 * vec2<f32>(x_1493.x, x_1493.y)) + vec2<f32>(x_1497.z, x_1497.w));
  let x_1500 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1499.x, x_1499.y, x_1500.z, x_1500.w);
  let x_1507 : vec4<f32> = u_xlat1;
  let x_1509 : vec4<f32> = textureSample(x_DitheringTex, sampler_DitheringTex, vec2<f32>(x_1507.x, x_1507.y));
  u_xlat1.x = x_1509.w;
  let x_1513 : f32 = u_xlat1.x;
  u_xlat1.x = ((x_1513 * 2.0f) + -1.0f);
  let x_1518 : f32 = u_xlat1.x;
  u_xlat11.x = ((x_1518 * 340282346638528859811704183484516925440.0f) + 0.5f);
  let x_1524 : f32 = u_xlat11.x;
  u_xlat11.x = clamp(x_1524, 0.0f, 1.0f);
  let x_1528 : f32 = u_xlat11.x;
  u_xlat11.x = ((x_1528 * 2.0f) + -1.0f);
  let x_1533 : f32 = u_xlat1.x;
  u_xlat1.x = (-(abs(x_1533)) + 1.0f);
  let x_1539 : f32 = u_xlat1.x;
  u_xlat1.x = sqrt(x_1539);
  let x_1543 : f32 = u_xlat1.x;
  u_xlat1.x = (-(x_1543) + 1.0f);
  let x_1548 : f32 = u_xlat1.x;
  let x_1550 : f32 = u_xlat11.x;
  u_xlat1.x = (x_1548 * x_1550);
  let x_1553 : vec4<f32> = u_xlat0;
  u_xlat11 = (vec3<f32>(x_1553.x, x_1553.y, x_1553.z) * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
  let x_1556 : vec4<f32> = u_xlat0;
  let x_1559 : vec3<f32> = max(abs(vec3<f32>(x_1556.x, x_1556.y, x_1556.z)), vec3<f32>(1.1920929e-07f, 1.1920929e-07f, 1.1920929e-07f));
  let x_1560 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1559.x, x_1559.y, x_1559.z, x_1560.w);
  let x_1562 : vec4<f32> = u_xlat2;
  let x_1564 : vec3<f32> = log2(vec3<f32>(x_1562.x, x_1562.y, x_1562.z));
  let x_1565 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1564.x, x_1564.y, x_1564.z, x_1565.w);
  let x_1567 : vec4<f32> = u_xlat2;
  let x_1569 : vec3<f32> = (vec3<f32>(x_1567.x, x_1567.y, x_1567.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
  let x_1570 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1569.x, x_1569.y, x_1569.z, x_1570.w);
  let x_1572 : vec4<f32> = u_xlat2;
  let x_1574 : vec3<f32> = exp2(vec3<f32>(x_1572.x, x_1572.y, x_1572.z));
  let x_1575 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1574.x, x_1574.y, x_1574.z, x_1575.w);
  let x_1577 : vec4<f32> = u_xlat2;
  let x_1580 : vec3<f32> = ((vec3<f32>(x_1577.x, x_1577.y, x_1577.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
  let x_1581 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1580.x, x_1580.y, x_1580.z, x_1581.w);
  let x_1583 : vec4<f32> = u_xlat0;
  let x_1585 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_1583.x, x_1583.y, x_1583.z, x_1583.x));
  u_xlatb0 = vec3<bool>(x_1585.x, x_1585.y, x_1585.z);
  let x_1588 : bool = u_xlatb0.x;
  if (x_1588) {
    let x_1593 : f32 = u_xlat11.x;
    x_1589 = x_1593;
  } else {
    let x_1596 : f32 = u_xlat2.x;
    x_1589 = x_1596;
  }
  let x_1597 : f32 = x_1589;
  u_xlat0.x = x_1597;
  let x_1600 : bool = u_xlatb0.y;
  if (x_1600) {
    let x_1605 : f32 = u_xlat11.y;
    x_1601 = x_1605;
  } else {
    let x_1608 : f32 = u_xlat2.y;
    x_1601 = x_1608;
  }
  let x_1609 : f32 = x_1601;
  u_xlat0.y = x_1609;
  let x_1612 : bool = u_xlatb0.z;
  if (x_1612) {
    let x_1617 : f32 = u_xlat11.z;
    x_1613 = x_1617;
  } else {
    let x_1620 : f32 = u_xlat2.z;
    x_1613 = x_1620;
  }
  let x_1621 : f32 = x_1613;
  u_xlat0.z = x_1621;
  let x_1623 : vec4<f32> = u_xlat1;
  let x_1628 : vec4<f32> = u_xlat0;
  let x_1630 : vec3<f32> = ((vec3<f32>(x_1623.x, x_1623.x, x_1623.x) * vec3<f32>(0.003921569f, 0.003921569f, 0.003921569f)) + vec3<f32>(x_1628.x, x_1628.y, x_1628.z));
  let x_1631 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1630.x, x_1630.y, x_1630.z, x_1631.w);
  let x_1633 : vec4<f32> = u_xlat0;
  let x_1635 : vec3<f32> = (vec3<f32>(x_1633.x, x_1633.y, x_1633.z) * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
  let x_1636 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1635.x, x_1635.y, x_1635.z, x_1636.w);
  let x_1638 : vec4<f32> = u_xlat0;
  let x_1640 : vec3<f32> = (vec3<f32>(x_1638.x, x_1638.y, x_1638.z) + vec3<f32>(0.055f, 0.055f, 0.055f));
  let x_1641 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1640.x, x_1640.y, x_1640.z, x_1641.w);
  let x_1643 : vec4<f32> = u_xlat2;
  let x_1645 : vec3<f32> = (vec3<f32>(x_1643.x, x_1643.y, x_1643.z) * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
  let x_1646 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1645.x, x_1645.y, x_1645.z, x_1646.w);
  let x_1648 : vec4<f32> = u_xlat2;
  let x_1651 : vec3<f32> = max(abs(vec3<f32>(x_1648.x, x_1648.y, x_1648.z)), vec3<f32>(1.1920929e-07f, 1.1920929e-07f, 1.1920929e-07f));
  let x_1652 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1651.x, x_1651.y, x_1651.z, x_1652.w);
  let x_1654 : vec4<f32> = u_xlat2;
  let x_1656 : vec3<f32> = log2(vec3<f32>(x_1654.x, x_1654.y, x_1654.z));
  let x_1657 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1656.x, x_1656.y, x_1656.z, x_1657.w);
  let x_1659 : vec4<f32> = u_xlat2;
  let x_1661 : vec3<f32> = (vec3<f32>(x_1659.x, x_1659.y, x_1659.z) * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
  let x_1662 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1661.x, x_1661.y, x_1661.z, x_1662.w);
  let x_1664 : vec4<f32> = u_xlat2;
  let x_1666 : vec3<f32> = exp2(vec3<f32>(x_1664.x, x_1664.y, x_1664.z));
  let x_1667 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1666.x, x_1666.y, x_1666.z, x_1667.w);
  let x_1669 : vec4<f32> = u_xlat0;
  let x_1671 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_1669.x, x_1669.y, x_1669.z, x_1669.x));
  u_xlatb0 = vec3<bool>(x_1671.x, x_1671.y, x_1671.z);
  let x_1676 : bool = u_xlatb0.x;
  if (x_1676) {
    let x_1681 : f32 = u_xlat1.x;
    x_1677 = x_1681;
  } else {
    let x_1684 : f32 = u_xlat2.x;
    x_1677 = x_1684;
  }
  let x_1685 : f32 = x_1677;
  SV_Target0.x = x_1685;
  let x_1689 : bool = u_xlatb0.y;
  if (x_1689) {
    let x_1694 : f32 = u_xlat1.y;
    x_1690 = x_1694;
  } else {
    let x_1697 : f32 = u_xlat2.y;
    x_1690 = x_1697;
  }
  let x_1698 : f32 = x_1690;
  SV_Target0.y = x_1698;
  let x_1701 : bool = u_xlatb0.z;
  if (x_1701) {
    let x_1706 : f32 = u_xlat1.z;
    x_1702 = x_1706;
  } else {
    let x_1709 : f32 = u_xlat2.z;
    x_1702 = x_1709;
  }
  let x_1710 : f32 = x_1702;
  SV_Target0.z = x_1710;
  let x_1712 : f32 = u_xlat30;
  SV_Target0.w = x_1712;
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

