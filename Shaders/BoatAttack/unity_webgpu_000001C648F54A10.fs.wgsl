struct PGlobals {
  x_GlobalMipBias : vec2<f32>,
  @size(8)
  padding : u32,
  x_Lut_Params : vec4<f32>,
  x_UserLut_Params : vec4<f32>,
  x_Bloom_Params : vec4<f32>,
  x_Bloom_RGBM : f32,
  @size(12)
  padding_1 : u32,
  x_LensDirt_Params : vec4<f32>,
  x_LensDirt_Intensity : f32,
  @size(12)
  padding_2 : u32,
  x_Distortion_Params1 : vec4<f32>,
  x_Distortion_Params2 : vec4<f32>,
  x_Vignette_Params1 : vec4<f32>,
  x_Vignette_Params2 : vec4<f32>,
  x_Dithering_Params : vec4<f32>,
}

var<private> vs_TEXCOORD0 : vec2<f32>;

@group(1) @binding(0) var<uniform> x_26 : PGlobals;

@group(0) @binding(0) var x_BlitTexture : texture_2d<f32>;

@group(0) @binding(6) var sampler_LinearClamp : sampler;

@group(0) @binding(1) var x_Bloom_Texture : texture_2d<f32>;

@group(0) @binding(2) var x_LensDirt_Texture : texture_2d<f32>;

@group(0) @binding(3) var x_InternalLut : texture_2d<f32>;

@group(0) @binding(4) var x_UserLut : texture_2d<f32>;

@group(0) @binding(5) var x_BlueNoise_Texture : texture_2d<f32>;

@group(0) @binding(7) var sampler_PointRepeat : sampler;

var<private> SV_Target0 : vec4<f32>;

var<private> gl_FragCoord : vec4<f32>;

fn main_1() {
  var u_xlat0 : vec3<f32>;
  var u_xlat10 : vec2<f32>;
  var u_xlat1 : vec4<f32>;
  var u_xlatb6 : bool;
  var u_xlat6 : vec2<f32>;
  var u_xlat2 : vec4<f32>;
  var u_xlat3 : vec3<f32>;
  var u_xlat11 : f32;
  var u_xlat16 : f32;
  var u_xlat7 : f32;
  var u_xlat12 : f32;
  var u_xlatb17 : bool;
  var u_xlatb1 : vec3<bool>;
  var x_227 : f32;
  var u_xlatb15 : bool;
  var u_xlat15 : f32;
  var u_xlat5 : vec3<f32>;
  var u_xlatb3 : vec3<bool>;
  var hlslcc_movcTemp : vec4<f32>;
  var x_591 : f32;
  var x_603 : f32;
  var x_615 : f32;
  var u_xlat4 : vec2<f32>;
  var x_766 : f32;
  var x_778 : f32;
  var x_790 : f32;
  var u_xlatb0 : vec3<bool>;
  var x_880 : f32;
  var x_892 : f32;
  var x_904 : f32;
  var x_956 : f32;
  var x_968 : f32;
  var x_980 : f32;
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_13 : vec2<f32> = vs_TEXCOORD0;
  let x_16 : vec2<f32> = (x_13 + vec2<f32>(-0.5f, -0.5f));
  let x_17 : vec3<f32> = u_xlat0;
  u_xlat0 = vec3<f32>(x_16.x, x_16.y, x_17.z);
  let x_21 : vec3<f32> = u_xlat0;
  let x_31 : vec4<f32> = x_26.x_Distortion_Params2;
  u_xlat10 = ((vec2<f32>(x_21.x, x_21.y) * vec2<f32>(x_31.z, x_31.z)) + vec2<f32>(0.5f, 0.5f));
  let x_37 : vec3<f32> = u_xlat0;
  let x_40 : vec4<f32> = x_26.x_Distortion_Params2;
  let x_45 : vec4<f32> = x_26.x_Distortion_Params1;
  let x_48 : vec2<f32> = ((vec2<f32>(x_37.x, x_37.y) * vec2<f32>(x_40.z, x_40.z)) + -(vec2<f32>(x_45.x, x_45.y)));
  let x_49 : vec3<f32> = u_xlat0;
  u_xlat0 = vec3<f32>(x_48.x, x_48.y, x_49.z);
  let x_51 : vec3<f32> = u_xlat0;
  let x_54 : vec4<f32> = x_26.x_Distortion_Params1;
  let x_56 : vec2<f32> = (vec2<f32>(x_51.x, x_51.y) * vec2<f32>(x_54.z, x_54.w));
  let x_57 : vec3<f32> = u_xlat0;
  u_xlat0 = vec3<f32>(x_56.x, x_56.y, x_57.z);
  let x_61 : vec3<f32> = u_xlat0;
  let x_63 : vec3<f32> = u_xlat0;
  u_xlat1.x = dot(vec2<f32>(x_61.x, x_61.y), vec2<f32>(x_63.x, x_63.y));
  let x_71 : f32 = u_xlat1.x;
  u_xlat1.x = sqrt(x_71);
  let x_81 : f32 = x_26.x_Distortion_Params2.w;
  u_xlatb6 = (0.0f < x_81);
  let x_83 : bool = u_xlatb6;
  if (x_83) {
    let x_87 : vec4<f32> = u_xlat1;
    let x_90 : vec4<f32> = x_26.x_Distortion_Params2;
    u_xlat6 = (vec2<f32>(x_87.x, x_87.x) * vec2<f32>(x_90.x, x_90.y));
    let x_95 : f32 = u_xlat6.x;
    u_xlat2.x = sin(x_95);
    let x_100 : f32 = u_xlat6.x;
    u_xlat3.x = cos(x_100);
    let x_104 : f32 = u_xlat2.x;
    let x_106 : f32 = u_xlat3.x;
    u_xlat6.x = (x_104 / x_106);
    let x_113 : f32 = u_xlat6.y;
    u_xlat11 = (1.0f / x_113);
    let x_116 : f32 = u_xlat6.x;
    let x_117 : f32 = u_xlat11;
    u_xlat6.x = ((x_116 * x_117) + -1.0f);
    let x_122 : vec3<f32> = u_xlat0;
    let x_124 : vec2<f32> = u_xlat6;
    let x_127 : vec2<f32> = u_xlat10;
    u_xlat6 = ((vec2<f32>(x_122.x, x_122.y) * vec2<f32>(x_124.x, x_124.x)) + x_127);
  } else {
    let x_132 : f32 = u_xlat1.x;
    u_xlat16 = (1.0f / x_132);
    let x_134 : f32 = u_xlat16;
    let x_136 : f32 = x_26.x_Distortion_Params2.x;
    u_xlat16 = (x_134 * x_136);
    let x_139 : f32 = u_xlat1.x;
    let x_141 : f32 = x_26.x_Distortion_Params2.y;
    u_xlat1.x = (x_139 * x_141);
    let x_145 : f32 = u_xlat1.x;
    u_xlat2.x = min(abs(x_145), 1.0f);
    let x_151 : f32 = u_xlat1.x;
    u_xlat7 = max(abs(x_151), 1.0f);
    let x_154 : f32 = u_xlat7;
    u_xlat7 = (1.0f / x_154);
    let x_156 : f32 = u_xlat7;
    let x_158 : f32 = u_xlat2.x;
    u_xlat2.x = (x_156 * x_158);
    let x_162 : f32 = u_xlat2.x;
    let x_164 : f32 = u_xlat2.x;
    u_xlat7 = (x_162 * x_164);
    let x_167 : f32 = u_xlat7;
    u_xlat12 = ((x_167 * 0.0208351f) + -0.085133001f);
    let x_172 : f32 = u_xlat7;
    let x_173 : f32 = u_xlat12;
    u_xlat12 = ((x_172 * x_173) + 0.180141002f);
    let x_177 : f32 = u_xlat7;
    let x_178 : f32 = u_xlat12;
    u_xlat12 = ((x_177 * x_178) + -0.330299497f);
    let x_182 : f32 = u_xlat7;
    let x_183 : f32 = u_xlat12;
    u_xlat7 = ((x_182 * x_183) + 0.999866009f);
    let x_187 : f32 = u_xlat7;
    let x_189 : f32 = u_xlat2.x;
    u_xlat12 = (x_187 * x_189);
    let x_193 : f32 = u_xlat1.x;
    u_xlatb17 = (1.0f < abs(x_193));
    let x_196 : f32 = u_xlat12;
    u_xlat12 = ((x_196 * -2.0f) + 1.570796371f);
    let x_201 : bool = u_xlatb17;
    let x_202 : f32 = u_xlat12;
    u_xlat12 = select(0.0f, x_202, x_201);
    let x_205 : f32 = u_xlat2.x;
    let x_206 : f32 = u_xlat7;
    let x_208 : f32 = u_xlat12;
    u_xlat2.x = ((x_205 * x_206) + x_208);
    let x_212 : f32 = u_xlat1.x;
    u_xlat1.x = min(x_212, 1.0f);
    let x_219 : f32 = u_xlat1.x;
    let x_221 : f32 = u_xlat1.x;
    u_xlatb1.x = (x_219 < -(x_221));
    let x_226 : bool = u_xlatb1.x;
    if (x_226) {
      let x_231 : f32 = u_xlat2.x;
      x_227 = -(x_231);
    } else {
      let x_235 : f32 = u_xlat2.x;
      x_227 = x_235;
    }
    let x_236 : f32 = x_227;
    u_xlat1.x = x_236;
    let x_238 : f32 = u_xlat16;
    let x_240 : f32 = u_xlat1.x;
    u_xlat1.x = ((x_238 * x_240) + -1.0f);
    let x_244 : vec3<f32> = u_xlat0;
    let x_246 : vec4<f32> = u_xlat1;
    let x_249 : vec2<f32> = u_xlat10;
    u_xlat6 = ((vec2<f32>(x_244.x, x_244.y) * vec2<f32>(x_246.x, x_246.x)) + x_249);
  }
  let x_261 : vec2<f32> = u_xlat6;
  let x_264 : f32 = x_26.x_GlobalMipBias.x;
  let x_265 : vec4<f32> = textureSampleBias(x_BlitTexture, sampler_LinearClamp, x_261, x_264);
  u_xlat0 = vec3<f32>(x_265.x, x_265.y, x_265.z);
  let x_271 : vec2<f32> = u_xlat6;
  let x_273 : f32 = x_26.x_GlobalMipBias.x;
  let x_274 : vec4<f32> = textureSampleBias(x_Bloom_Texture, sampler_LinearClamp, x_271, x_273);
  u_xlat2 = x_274;
  let x_278 : f32 = x_26.x_Bloom_RGBM;
  u_xlatb15 = (0.0f < x_278);
  let x_280 : bool = u_xlatb15;
  if (x_280) {
    let x_283 : vec4<f32> = u_xlat2;
    let x_285 : vec4<f32> = u_xlat2;
    u_xlat3 = (vec3<f32>(x_283.w, x_283.w, x_283.w) * vec3<f32>(x_285.x, x_285.y, x_285.z));
    let x_288 : vec3<f32> = u_xlat3;
    let x_291 : vec3<f32> = (x_288 * vec3<f32>(8.0f, 8.0f, 8.0f));
    let x_292 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_291.x, x_291.y, x_291.z, x_292.w);
  }
  let x_294 : vec4<f32> = u_xlat2;
  let x_298 : vec4<f32> = x_26.x_Bloom_Params;
  let x_300 : vec3<f32> = (vec3<f32>(x_294.x, x_294.y, x_294.z) * vec3<f32>(x_298.x, x_298.x, x_298.x));
  let x_301 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_300.x, x_300.y, x_300.z, x_301.w);
  let x_303 : vec4<f32> = u_xlat2;
  let x_306 : vec4<f32> = x_26.x_Bloom_Params;
  let x_309 : vec3<f32> = u_xlat0;
  u_xlat0 = ((vec3<f32>(x_303.x, x_303.y, x_303.z) * vec3<f32>(x_306.y, x_306.z, x_306.w)) + x_309);
  let x_311 : vec2<f32> = u_xlat6;
  let x_314 : vec4<f32> = x_26.x_LensDirt_Params;
  let x_318 : vec4<f32> = x_26.x_LensDirt_Params;
  let x_320 : vec2<f32> = ((x_311 * vec2<f32>(x_314.x, x_314.y)) + vec2<f32>(x_318.z, x_318.w));
  let x_321 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_320.x, x_321.y, x_321.z, x_320.y);
  let x_327 : vec4<f32> = u_xlat1;
  let x_330 : f32 = x_26.x_GlobalMipBias.x;
  let x_331 : vec4<f32> = textureSampleBias(x_LensDirt_Texture, sampler_LinearClamp, vec2<f32>(x_327.x, x_327.w), x_330);
  u_xlat3 = vec3<f32>(x_331.x, x_331.y, x_331.z);
  let x_333 : vec3<f32> = u_xlat3;
  let x_336 : f32 = x_26.x_LensDirt_Intensity;
  u_xlat3 = (x_333 * vec3<f32>(x_336, x_336, x_336));
  let x_339 : vec3<f32> = u_xlat3;
  let x_340 : vec4<f32> = u_xlat2;
  let x_343 : vec3<f32> = u_xlat0;
  u_xlat0 = ((x_339 * vec3<f32>(x_340.x, x_340.y, x_340.z)) + x_343);
  let x_348 : f32 = x_26.x_Vignette_Params2.z;
  u_xlatb15 = (0.0f < x_348);
  let x_350 : bool = u_xlatb15;
  if (x_350) {
    let x_353 : vec2<f32> = u_xlat6;
    let x_355 : vec4<f32> = x_26.x_Vignette_Params2;
    let x_358 : vec2<f32> = (x_353 + -(vec2<f32>(x_355.x, x_355.y)));
    let x_359 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_358.x, x_358.y, x_359.z, x_359.w);
    let x_361 : vec4<f32> = u_xlat1;
    let x_365 : vec4<f32> = x_26.x_Vignette_Params2;
    let x_367 : vec2<f32> = (abs(vec2<f32>(x_361.x, x_361.y)) * vec2<f32>(x_365.z, x_365.z));
    let x_368 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_368.x, x_367.x, x_367.y, x_368.w);
    let x_371 : f32 = u_xlat1.y;
    let x_374 : f32 = x_26.x_Vignette_Params1.w;
    u_xlat1.x = (x_371 * x_374);
    let x_378 : vec4<f32> = u_xlat1;
    let x_380 : vec4<f32> = u_xlat1;
    u_xlat15 = dot(vec2<f32>(x_378.x, x_378.z), vec2<f32>(x_380.x, x_380.z));
    let x_383 : f32 = u_xlat15;
    u_xlat15 = (-(x_383) + 1.0f);
    let x_386 : f32 = u_xlat15;
    u_xlat15 = max(x_386, 0.0f);
    let x_388 : f32 = u_xlat15;
    u_xlat15 = log2(x_388);
    let x_390 : f32 = u_xlat15;
    let x_392 : f32 = x_26.x_Vignette_Params2.w;
    u_xlat15 = (x_390 * x_392);
    let x_394 : f32 = u_xlat15;
    u_xlat15 = exp2(x_394);
    let x_397 : vec4<f32> = x_26.x_Vignette_Params1;
    let x_401 : vec3<f32> = (-(vec3<f32>(x_397.x, x_397.y, x_397.z)) + vec3<f32>(1.0f, 1.0f, 1.0f));
    let x_402 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_401.x, x_401.y, x_401.z, x_402.w);
    let x_404 : f32 = u_xlat15;
    let x_406 : vec4<f32> = u_xlat1;
    let x_410 : vec4<f32> = x_26.x_Vignette_Params1;
    let x_412 : vec3<f32> = ((vec3<f32>(x_404, x_404, x_404) * vec3<f32>(x_406.x, x_406.y, x_406.z)) + vec3<f32>(x_410.x, x_410.y, x_410.z));
    let x_413 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_412.x, x_412.y, x_412.z, x_413.w);
    let x_415 : vec3<f32> = u_xlat0;
    let x_416 : vec4<f32> = u_xlat1;
    u_xlat0 = (x_415 * vec3<f32>(x_416.x, x_416.y, x_416.z));
  }
  let x_419 : vec3<f32> = u_xlat0;
  let x_423 : vec4<f32> = x_26.x_Lut_Params;
  u_xlat0 = (vec3<f32>(x_419.z, x_419.x, x_419.y) * vec3<f32>(x_423.w, x_423.w, x_423.w));
  let x_426 : vec3<f32> = u_xlat0;
  u_xlat0 = ((x_426 * vec3<f32>(5.55555582f, 5.55555582f, 5.55555582f)) + vec3<f32>(0.047995999f, 0.047995999f, 0.047995999f));
  let x_433 : vec3<f32> = u_xlat0;
  u_xlat0 = max(x_433, vec3<f32>(0.0f, 0.0f, 0.0f));
  let x_436 : vec3<f32> = u_xlat0;
  u_xlat0 = log2(x_436);
  let x_438 : vec3<f32> = u_xlat0;
  u_xlat0 = ((x_438 * vec3<f32>(0.073499784f, 0.073499784f, 0.073499784f)) + vec3<f32>(0.386036009f, 0.386036009f, 0.386036009f));
  let x_445 : vec3<f32> = u_xlat0;
  u_xlat0 = clamp(x_445, vec3<f32>(0.0f, 0.0f, 0.0f), vec3<f32>(1.0f, 1.0f, 1.0f));
  let x_450 : vec3<f32> = u_xlat0;
  let x_452 : vec4<f32> = x_26.x_Lut_Params;
  u_xlat5 = (x_450 * vec3<f32>(x_452.z, x_452.z, x_452.z));
  let x_456 : f32 = u_xlat5.x;
  u_xlat5.x = floor(x_456);
  let x_460 : vec4<f32> = x_26.x_Lut_Params;
  let x_462 : vec2<f32> = (vec2<f32>(x_460.x, x_460.y) * vec2<f32>(0.5f, 0.5f));
  let x_463 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_462.x, x_462.y, x_463.z, x_463.w);
  let x_465 : vec3<f32> = u_xlat5;
  let x_468 : vec4<f32> = x_26.x_Lut_Params;
  let x_471 : vec4<f32> = u_xlat1;
  let x_473 : vec2<f32> = ((vec2<f32>(x_465.y, x_465.z) * vec2<f32>(x_468.x, x_468.y)) + vec2<f32>(x_471.x, x_471.y));
  let x_474 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_474.x, x_473.x, x_473.y, x_474.w);
  let x_477 : f32 = u_xlat5.x;
  let x_479 : f32 = x_26.x_Lut_Params.y;
  let x_482 : f32 = u_xlat1.y;
  u_xlat1.x = ((x_477 * x_479) + x_482);
  let x_489 : vec4<f32> = u_xlat1;
  let x_491 : vec4<f32> = textureSampleLevel(x_InternalLut, sampler_LinearClamp, vec2<f32>(x_489.x, x_489.z), 0.0f);
  let x_492 : vec3<f32> = vec3<f32>(x_491.x, x_491.y, x_491.z);
  let x_493 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_492.x, x_492.y, x_492.z, x_493.w);
  let x_496 : f32 = x_26.x_Lut_Params.y;
  u_xlat3.x = x_496;
  u_xlat3.y = 0.0f;
  let x_499 : vec4<f32> = u_xlat1;
  let x_501 : vec3<f32> = u_xlat3;
  u_xlat10 = (vec2<f32>(x_499.x, x_499.z) + vec2<f32>(x_501.x, x_501.y));
  let x_507 : vec2<f32> = u_xlat10;
  let x_508 : vec4<f32> = textureSampleLevel(x_InternalLut, sampler_LinearClamp, x_507, 0.0f);
  let x_509 : vec3<f32> = vec3<f32>(x_508.x, x_508.y, x_508.z);
  let x_510 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_509.x, x_509.y, x_509.z, x_510.w);
  let x_513 : f32 = u_xlat0.x;
  let x_515 : f32 = x_26.x_Lut_Params.z;
  let x_518 : f32 = u_xlat5.x;
  u_xlat0.x = ((x_513 * x_515) + -(x_518));
  let x_522 : vec4<f32> = u_xlat2;
  let x_525 : vec4<f32> = u_xlat1;
  u_xlat5 = (-(vec3<f32>(x_522.x, x_522.y, x_522.z)) + vec3<f32>(x_525.x, x_525.y, x_525.z));
  let x_528 : vec3<f32> = u_xlat0;
  let x_530 : vec3<f32> = u_xlat5;
  let x_532 : vec4<f32> = u_xlat2;
  u_xlat0 = ((vec3<f32>(x_528.x, x_528.x, x_528.x) * x_530) + vec3<f32>(x_532.x, x_532.y, x_532.z));
  let x_537 : f32 = x_26.x_UserLut_Params.w;
  u_xlatb15 = (0.0f < x_537);
  let x_539 : bool = u_xlatb15;
  if (x_539) {
    let x_542 : vec3<f32> = u_xlat0;
    u_xlat0 = x_542;
    let x_543 : vec3<f32> = u_xlat0;
    u_xlat0 = clamp(x_543, vec3<f32>(0.0f, 0.0f, 0.0f), vec3<f32>(1.0f, 1.0f, 1.0f));
    let x_547 : vec3<f32> = u_xlat0;
    let x_550 : vec3<f32> = (x_547 * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
    let x_551 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_550.x, x_550.y, x_550.z, x_551.w);
    let x_553 : vec3<f32> = u_xlat0;
    let x_554 : vec3<f32> = log2(x_553);
    let x_555 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_554.x, x_554.y, x_554.z, x_555.w);
    let x_557 : vec4<f32> = u_xlat2;
    let x_561 : vec3<f32> = (vec3<f32>(x_557.x, x_557.y, x_557.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
    let x_562 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_561.x, x_561.y, x_561.z, x_562.w);
    let x_564 : vec4<f32> = u_xlat2;
    let x_566 : vec3<f32> = exp2(vec3<f32>(x_564.x, x_564.y, x_564.z));
    let x_567 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_566.x, x_566.y, x_566.z, x_567.w);
    let x_569 : vec4<f32> = u_xlat2;
    let x_576 : vec3<f32> = ((vec3<f32>(x_569.x, x_569.y, x_569.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    let x_577 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_576.x, x_576.y, x_576.z, x_577.w);
    let x_582 : vec3<f32> = u_xlat0;
    let x_585 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_582.x, x_582.y, x_582.z, x_582.x));
    u_xlatb3 = vec3<bool>(x_585.x, x_585.y, x_585.z);
    let x_588 : vec4<f32> = u_xlat1;
    hlslcc_movcTemp = x_588;
    let x_590 : bool = u_xlatb3.x;
    if (x_590) {
      let x_595 : f32 = u_xlat1.x;
      x_591 = x_595;
    } else {
      let x_598 : f32 = u_xlat2.x;
      x_591 = x_598;
    }
    let x_599 : f32 = x_591;
    hlslcc_movcTemp.x = x_599;
    let x_602 : bool = u_xlatb3.y;
    if (x_602) {
      let x_607 : f32 = u_xlat1.y;
      x_603 = x_607;
    } else {
      let x_610 : f32 = u_xlat2.y;
      x_603 = x_610;
    }
    let x_611 : f32 = x_603;
    hlslcc_movcTemp.y = x_611;
    let x_614 : bool = u_xlatb3.z;
    if (x_614) {
      let x_619 : f32 = u_xlat1.z;
      x_615 = x_619;
    } else {
      let x_622 : f32 = u_xlat2.z;
      x_615 = x_622;
    }
    let x_623 : f32 = x_615;
    hlslcc_movcTemp.z = x_623;
    let x_625 : vec4<f32> = hlslcc_movcTemp;
    u_xlat1 = x_625;
    let x_626 : vec4<f32> = u_xlat1;
    let x_629 : vec4<f32> = x_26.x_UserLut_Params;
    let x_631 : vec3<f32> = (vec3<f32>(x_626.z, x_626.x, x_626.y) * vec3<f32>(x_629.z, x_629.z, x_629.z));
    let x_632 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_631.x, x_631.y, x_631.z, x_632.w);
    let x_635 : f32 = u_xlat2.x;
    u_xlat15 = floor(x_635);
    let x_638 : vec4<f32> = x_26.x_UserLut_Params;
    let x_640 : vec2<f32> = (vec2<f32>(x_638.x, x_638.y) * vec2<f32>(0.5f, 0.5f));
    let x_641 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_640.x, x_641.y, x_641.z, x_640.y);
    let x_643 : vec4<f32> = u_xlat2;
    let x_646 : vec4<f32> = x_26.x_UserLut_Params;
    let x_649 : vec4<f32> = u_xlat2;
    let x_651 : vec2<f32> = ((vec2<f32>(x_643.y, x_643.z) * vec2<f32>(x_646.x, x_646.y)) + vec2<f32>(x_649.x, x_649.w));
    let x_652 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_652.x, x_651.x, x_651.y, x_652.w);
    let x_654 : f32 = u_xlat15;
    let x_656 : f32 = x_26.x_UserLut_Params.y;
    let x_659 : f32 = u_xlat2.y;
    u_xlat2.x = ((x_654 * x_656) + x_659);
    let x_666 : vec4<f32> = u_xlat2;
    let x_668 : vec4<f32> = textureSampleLevel(x_UserLut, sampler_LinearClamp, vec2<f32>(x_666.x, x_666.z), 0.0f);
    u_xlat3 = vec3<f32>(x_668.x, x_668.y, x_668.z);
    let x_672 : f32 = x_26.x_UserLut_Params.y;
    u_xlat4.x = x_672;
    u_xlat4.y = 0.0f;
    let x_675 : vec4<f32> = u_xlat2;
    let x_677 : vec2<f32> = u_xlat4;
    let x_678 : vec2<f32> = (vec2<f32>(x_675.x, x_675.z) + x_677);
    let x_679 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_678.x, x_678.y, x_679.z, x_679.w);
    let x_684 : vec4<f32> = u_xlat2;
    let x_686 : vec4<f32> = textureSampleLevel(x_UserLut, sampler_LinearClamp, vec2<f32>(x_684.x, x_684.y), 0.0f);
    let x_687 : vec3<f32> = vec3<f32>(x_686.x, x_686.y, x_686.z);
    let x_688 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_687.x, x_687.y, x_687.z, x_688.w);
    let x_691 : f32 = u_xlat1.z;
    let x_693 : f32 = x_26.x_UserLut_Params.z;
    let x_695 : f32 = u_xlat15;
    u_xlat15 = ((x_691 * x_693) + -(x_695));
    let x_698 : vec3<f32> = u_xlat3;
    let x_700 : vec4<f32> = u_xlat2;
    let x_702 : vec3<f32> = (-(x_698) + vec3<f32>(x_700.x, x_700.y, x_700.z));
    let x_703 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_702.x, x_702.y, x_702.z, x_703.w);
    let x_705 : f32 = u_xlat15;
    let x_707 : vec4<f32> = u_xlat2;
    let x_710 : vec3<f32> = u_xlat3;
    let x_711 : vec3<f32> = ((vec3<f32>(x_705, x_705, x_705) * vec3<f32>(x_707.x, x_707.y, x_707.z)) + x_710);
    let x_712 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_711.x, x_711.y, x_711.z, x_712.w);
    let x_714 : vec4<f32> = u_xlat1;
    let x_717 : vec4<f32> = u_xlat2;
    let x_719 : vec3<f32> = (-(vec3<f32>(x_714.x, x_714.y, x_714.z)) + vec3<f32>(x_717.x, x_717.y, x_717.z));
    let x_720 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_719.x, x_719.y, x_719.z, x_720.w);
    let x_723 : vec4<f32> = x_26.x_UserLut_Params;
    let x_725 : vec4<f32> = u_xlat2;
    let x_728 : vec4<f32> = u_xlat1;
    let x_730 : vec3<f32> = ((vec3<f32>(x_723.w, x_723.w, x_723.w) * vec3<f32>(x_725.x, x_725.y, x_725.z)) + vec3<f32>(x_728.x, x_728.y, x_728.z));
    let x_731 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_730.x, x_730.y, x_730.z, x_731.w);
    let x_733 : vec4<f32> = u_xlat1;
    let x_737 : vec3<f32> = (vec3<f32>(x_733.x, x_733.y, x_733.z) * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
    let x_738 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_737.x, x_737.y, x_737.z, x_738.w);
    let x_740 : vec4<f32> = u_xlat1;
    u_xlat3 = (vec3<f32>(x_740.x, x_740.y, x_740.z) + vec3<f32>(0.055f, 0.055f, 0.055f));
    let x_745 : vec3<f32> = u_xlat3;
    u_xlat3 = (x_745 * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
    let x_749 : vec3<f32> = u_xlat3;
    u_xlat3 = log2(abs(x_749));
    let x_752 : vec3<f32> = u_xlat3;
    u_xlat3 = (x_752 * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
    let x_756 : vec3<f32> = u_xlat3;
    u_xlat3 = exp2(x_756);
    let x_760 : vec4<f32> = u_xlat1;
    let x_762 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_760.x, x_760.y, x_760.z, x_760.x));
    u_xlatb1 = vec3<bool>(x_762.x, x_762.y, x_762.z);
    let x_765 : bool = u_xlatb1.x;
    if (x_765) {
      let x_770 : f32 = u_xlat2.x;
      x_766 = x_770;
    } else {
      let x_773 : f32 = u_xlat3.x;
      x_766 = x_773;
    }
    let x_774 : f32 = x_766;
    u_xlat0.x = x_774;
    let x_777 : bool = u_xlatb1.y;
    if (x_777) {
      let x_782 : f32 = u_xlat2.y;
      x_778 = x_782;
    } else {
      let x_785 : f32 = u_xlat3.y;
      x_778 = x_785;
    }
    let x_786 : f32 = x_778;
    u_xlat0.y = x_786;
    let x_789 : bool = u_xlatb1.z;
    if (x_789) {
      let x_794 : f32 = u_xlat2.z;
      x_790 = x_794;
    } else {
      let x_797 : f32 = u_xlat3.z;
      x_790 = x_797;
    }
    let x_798 : f32 = x_790;
    u_xlat0.z = x_798;
  }
  let x_800 : vec3<f32> = u_xlat0;
  u_xlat0 = sqrt(x_800);
  let x_802 : vec2<f32> = vs_TEXCOORD0;
  let x_805 : vec4<f32> = x_26.x_Dithering_Params;
  let x_809 : vec4<f32> = x_26.x_Dithering_Params;
  let x_811 : vec2<f32> = ((x_802 * vec2<f32>(x_805.x, x_805.y)) + vec2<f32>(x_809.z, x_809.w));
  let x_812 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_811.x, x_811.y, x_812.z, x_812.w);
  let x_819 : vec4<f32> = u_xlat1;
  let x_822 : f32 = x_26.x_GlobalMipBias.x;
  let x_823 : vec4<f32> = textureSampleBias(x_BlueNoise_Texture, sampler_PointRepeat, vec2<f32>(x_819.x, x_819.y), x_822);
  u_xlat15 = x_823.w;
  let x_825 : f32 = u_xlat15;
  u_xlat15 = ((x_825 * 2.0f) + -1.0f);
  let x_829 : f32 = u_xlat15;
  u_xlatb1.x = (x_829 >= 0.0f);
  let x_833 : bool = u_xlatb1.x;
  u_xlat1.x = select(-1.0f, 1.0f, x_833);
  let x_836 : f32 = u_xlat15;
  u_xlat15 = (-(abs(x_836)) + 1.0f);
  let x_840 : f32 = u_xlat15;
  u_xlat15 = sqrt(x_840);
  let x_842 : f32 = u_xlat15;
  u_xlat15 = (-(x_842) + 1.0f);
  let x_845 : f32 = u_xlat15;
  let x_847 : f32 = u_xlat1.x;
  u_xlat15 = (x_845 * x_847);
  let x_849 : vec3<f32> = u_xlat0;
  let x_850 : vec3<f32> = (x_849 * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
  let x_851 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_850.x, x_850.y, x_850.z, x_851.w);
  let x_853 : vec3<f32> = u_xlat0;
  let x_854 : vec3<f32> = log2(x_853);
  let x_855 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_854.x, x_854.y, x_854.z, x_855.w);
  let x_857 : vec4<f32> = u_xlat2;
  let x_859 : vec3<f32> = (vec3<f32>(x_857.x, x_857.y, x_857.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
  let x_860 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_859.x, x_859.y, x_859.z, x_860.w);
  let x_862 : vec4<f32> = u_xlat2;
  let x_864 : vec3<f32> = exp2(vec3<f32>(x_862.x, x_862.y, x_862.z));
  let x_865 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_864.x, x_864.y, x_864.z, x_865.w);
  let x_867 : vec4<f32> = u_xlat2;
  let x_870 : vec3<f32> = ((vec3<f32>(x_867.x, x_867.y, x_867.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
  let x_871 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_870.x, x_870.y, x_870.z, x_871.w);
  let x_874 : vec3<f32> = u_xlat0;
  let x_876 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_874.x, x_874.y, x_874.z, x_874.x));
  u_xlatb0 = vec3<bool>(x_876.x, x_876.y, x_876.z);
  let x_879 : bool = u_xlatb0.x;
  if (x_879) {
    let x_884 : f32 = u_xlat1.x;
    x_880 = x_884;
  } else {
    let x_887 : f32 = u_xlat2.x;
    x_880 = x_887;
  }
  let x_888 : f32 = x_880;
  u_xlat0.x = x_888;
  let x_891 : bool = u_xlatb0.y;
  if (x_891) {
    let x_896 : f32 = u_xlat1.y;
    x_892 = x_896;
  } else {
    let x_899 : f32 = u_xlat2.y;
    x_892 = x_899;
  }
  let x_900 : f32 = x_892;
  u_xlat0.y = x_900;
  let x_903 : bool = u_xlatb0.z;
  if (x_903) {
    let x_908 : f32 = u_xlat1.z;
    x_904 = x_908;
  } else {
    let x_911 : f32 = u_xlat2.z;
    x_904 = x_911;
  }
  let x_912 : f32 = x_904;
  u_xlat0.z = x_912;
  let x_914 : f32 = u_xlat15;
  let x_919 : vec3<f32> = u_xlat0;
  u_xlat0 = ((vec3<f32>(x_914, x_914, x_914) * vec3<f32>(0.003921569f, 0.003921569f, 0.003921569f)) + x_919);
  let x_921 : vec3<f32> = u_xlat0;
  let x_922 : vec3<f32> = (x_921 * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
  let x_923 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_922.x, x_922.y, x_922.z, x_923.w);
  let x_925 : vec3<f32> = u_xlat0;
  let x_926 : vec3<f32> = (x_925 + vec3<f32>(0.055f, 0.055f, 0.055f));
  let x_927 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_926.x, x_926.y, x_926.z, x_927.w);
  let x_929 : vec4<f32> = u_xlat2;
  let x_931 : vec3<f32> = (vec3<f32>(x_929.x, x_929.y, x_929.z) * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
  let x_932 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_931.x, x_931.y, x_931.z, x_932.w);
  let x_934 : vec4<f32> = u_xlat2;
  let x_937 : vec3<f32> = log2(abs(vec3<f32>(x_934.x, x_934.y, x_934.z)));
  let x_938 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_937.x, x_937.y, x_937.z, x_938.w);
  let x_940 : vec4<f32> = u_xlat2;
  let x_942 : vec3<f32> = (vec3<f32>(x_940.x, x_940.y, x_940.z) * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
  let x_943 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_942.x, x_942.y, x_942.z, x_943.w);
  let x_945 : vec4<f32> = u_xlat2;
  let x_947 : vec3<f32> = exp2(vec3<f32>(x_945.x, x_945.y, x_945.z));
  let x_948 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_947.x, x_947.y, x_947.z, x_948.w);
  let x_950 : vec3<f32> = u_xlat0;
  let x_952 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_950.x, x_950.y, x_950.z, x_950.x));
  u_xlatb0 = vec3<bool>(x_952.x, x_952.y, x_952.z);
  let x_955 : bool = u_xlatb0.x;
  if (x_955) {
    let x_960 : f32 = u_xlat1.x;
    x_956 = x_960;
  } else {
    let x_963 : f32 = u_xlat2.x;
    x_956 = x_963;
  }
  let x_964 : f32 = x_956;
  u_xlat0.x = x_964;
  let x_967 : bool = u_xlatb0.y;
  if (x_967) {
    let x_972 : f32 = u_xlat1.y;
    x_968 = x_972;
  } else {
    let x_975 : f32 = u_xlat2.y;
    x_968 = x_975;
  }
  let x_976 : f32 = x_968;
  u_xlat0.y = x_976;
  let x_979 : bool = u_xlatb0.z;
  if (x_979) {
    let x_984 : f32 = u_xlat1.z;
    x_980 = x_984;
  } else {
    let x_987 : f32 = u_xlat2.z;
    x_980 = x_987;
  }
  let x_988 : f32 = x_980;
  u_xlat0.z = x_988;
  let x_992 : vec3<f32> = u_xlat0;
  let x_993 : vec3<f32> = max(x_992, vec3<f32>(0.0f, 0.0f, 0.0f));
  let x_994 : vec4<f32> = SV_Target0;
  SV_Target0 = vec4<f32>(x_993.x, x_993.y, x_993.z, x_994.w);
  SV_Target0.w = 1.0f;
  return;
}

struct main_out {
  @location(0)
  SV_Target0_1 : vec4<f32>,
}

@fragment
fn main(@location(0) vs_TEXCOORD0_param : vec2<f32>, @builtin(position) gl_FragCoord_param : vec4<f32>) -> main_out {
  vs_TEXCOORD0 = vs_TEXCOORD0_param;
  gl_FragCoord = gl_FragCoord_param;
  main_1();
  return main_out(SV_Target0);
}

