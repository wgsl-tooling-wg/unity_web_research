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
  x_Distortion_Params1 : vec4<f32>,
  x_Distortion_Params2 : vec4<f32>,
  x_Chroma_Params : f32,
  @size(12)
  padding_2 : u32,
  x_Vignette_Params1 : vec4<f32>,
  x_Vignette_Params2 : vec4<f32>,
  x_Bloom_Texture_TexelSize : vec4<f32>,
  x_Dithering_Params : vec4<f32>,
}

var<private> vs_TEXCOORD0 : vec2<f32>;

@group(1) @binding(0) var<uniform> x_25 : PGlobals;

@group(0) @binding(0) var x_BlitTexture : texture_2d<f32>;

@group(0) @binding(5) var sampler_LinearClamp : sampler;

@group(0) @binding(1) var x_Bloom_Texture : texture_2d<f32>;

@group(0) @binding(3) var x_UserLut : texture_2d<f32>;

@group(0) @binding(2) var x_InternalLut : texture_2d<f32>;

@group(0) @binding(4) var x_BlueNoise_Texture : texture_2d<f32>;

@group(0) @binding(6) var sampler_PointRepeat : sampler;

var<private> SV_Target0 : vec4<f32>;

var<private> gl_FragCoord : vec4<f32>;

fn main_1() {
  var u_xlat0 : vec4<f32>;
  var u_xlat14 : vec2<f32>;
  var u_xlat1 : vec3<f32>;
  var u_xlatb8 : bool;
  var u_xlat15 : vec2<f32>;
  var u_xlat2 : vec4<f32>;
  var u_xlat3 : vec4<f32>;
  var u_xlat22 : f32;
  var u_xlat9 : f32;
  var u_xlat16 : f32;
  var u_xlat23 : f32;
  var u_xlatb3 : vec3<bool>;
  var u_xlatb1 : vec3<bool>;
  var x_224 : f32;
  var u_xlat4 : vec4<f32>;
  var u_xlat5 : vec4<f32>;
  var u_xlat18 : f32;
  var u_xlat25 : f32;
  var u_xlatb12 : bool;
  var x_443 : f32;
  var x_470 : f32;
  var u_xlat7 : vec3<f32>;
  var u_xlat10 : f32;
  var u_xlatb4 : bool;
  var u_xlatb0 : vec3<bool>;
  var x_656 : f32;
  var u_xlat17 : vec2<f32>;
  var u_xlat6 : vec4<f32>;
  var u_xlatb21 : bool;
  var u_xlat21 : f32;
  var hlslcc_movcTemp : vec3<f32>;
  var x_1145 : f32;
  var x_1157 : f32;
  var x_1169 : f32;
  var x_1332 : f32;
  var x_1344 : f32;
  var x_1356 : f32;
  var x_1484 : f32;
  var x_1496 : f32;
  var x_1508 : f32;
  var x_1595 : f32;
  var x_1607 : f32;
  var x_1619 : f32;
  var x_1674 : f32;
  var x_1686 : f32;
  var x_1698 : f32;
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_13 : vec2<f32> = vs_TEXCOORD0;
  let x_16 : vec2<f32> = (x_13 + vec2<f32>(-0.5f, -0.5f));
  let x_17 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_16.x, x_16.y, x_17.z, x_17.w);
  let x_21 : vec4<f32> = u_xlat0;
  let x_30 : vec4<f32> = x_25.x_Distortion_Params2;
  u_xlat14 = ((vec2<f32>(x_21.x, x_21.y) * vec2<f32>(x_30.z, x_30.z)) + vec2<f32>(0.5f, 0.5f));
  let x_36 : vec4<f32> = u_xlat0;
  let x_39 : vec4<f32> = x_25.x_Distortion_Params2;
  let x_44 : vec4<f32> = x_25.x_Distortion_Params1;
  let x_47 : vec2<f32> = ((vec2<f32>(x_36.x, x_36.y) * vec2<f32>(x_39.z, x_39.z)) + -(vec2<f32>(x_44.x, x_44.y)));
  let x_48 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_47.x, x_47.y, x_48.z, x_48.w);
  let x_50 : vec4<f32> = u_xlat0;
  let x_53 : vec4<f32> = x_25.x_Distortion_Params1;
  let x_55 : vec2<f32> = (vec2<f32>(x_50.x, x_50.y) * vec2<f32>(x_53.z, x_53.w));
  let x_56 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_55.x, x_55.y, x_56.z, x_56.w);
  let x_61 : vec4<f32> = u_xlat0;
  let x_63 : vec4<f32> = u_xlat0;
  u_xlat1.x = dot(vec2<f32>(x_61.x, x_61.y), vec2<f32>(x_63.x, x_63.y));
  let x_71 : f32 = u_xlat1.x;
  u_xlat1.x = sqrt(x_71);
  let x_81 : f32 = x_25.x_Distortion_Params2.w;
  u_xlatb8 = (0.0f < x_81);
  let x_83 : bool = u_xlatb8;
  if (x_83) {
    let x_87 : vec3<f32> = u_xlat1;
    let x_90 : vec4<f32> = x_25.x_Distortion_Params2;
    u_xlat15 = (vec2<f32>(x_87.x, x_87.x) * vec2<f32>(x_90.x, x_90.y));
    let x_95 : f32 = u_xlat15.x;
    u_xlat2.x = sin(x_95);
    let x_100 : f32 = u_xlat15.x;
    u_xlat3.x = cos(x_100);
    let x_104 : f32 = u_xlat2.x;
    let x_106 : f32 = u_xlat3.x;
    u_xlat15.x = (x_104 / x_106);
    let x_113 : f32 = u_xlat15.y;
    u_xlat22 = (1.0f / x_113);
    let x_116 : f32 = u_xlat15.x;
    let x_117 : f32 = u_xlat22;
    u_xlat15.x = ((x_116 * x_117) + -1.0f);
    let x_122 : vec4<f32> = u_xlat0;
    let x_124 : vec2<f32> = u_xlat15;
    let x_127 : vec2<f32> = u_xlat14;
    u_xlat15 = ((vec2<f32>(x_122.x, x_122.y) * vec2<f32>(x_124.x, x_124.x)) + x_127);
  } else {
    let x_131 : f32 = u_xlat1.x;
    u_xlat2.x = (1.0f / x_131);
    let x_135 : f32 = u_xlat2.x;
    let x_137 : f32 = x_25.x_Distortion_Params2.x;
    u_xlat2.x = (x_135 * x_137);
    let x_141 : f32 = u_xlat1.x;
    let x_143 : f32 = x_25.x_Distortion_Params2.y;
    u_xlat1.x = (x_141 * x_143);
    let x_148 : f32 = u_xlat1.x;
    u_xlat9 = min(abs(x_148), 1.0f);
    let x_153 : f32 = u_xlat1.x;
    u_xlat16 = max(abs(x_153), 1.0f);
    let x_156 : f32 = u_xlat16;
    u_xlat16 = (1.0f / x_156);
    let x_158 : f32 = u_xlat16;
    let x_159 : f32 = u_xlat9;
    u_xlat9 = (x_158 * x_159);
    let x_161 : f32 = u_xlat9;
    let x_162 : f32 = u_xlat9;
    u_xlat16 = (x_161 * x_162);
    let x_165 : f32 = u_xlat16;
    u_xlat23 = ((x_165 * 0.0208351f) + -0.085133001f);
    let x_170 : f32 = u_xlat16;
    let x_171 : f32 = u_xlat23;
    u_xlat23 = ((x_170 * x_171) + 0.180141002f);
    let x_175 : f32 = u_xlat16;
    let x_176 : f32 = u_xlat23;
    u_xlat23 = ((x_175 * x_176) + -0.330299497f);
    let x_180 : f32 = u_xlat16;
    let x_181 : f32 = u_xlat23;
    u_xlat16 = ((x_180 * x_181) + 0.999866009f);
    let x_185 : f32 = u_xlat16;
    let x_186 : f32 = u_xlat9;
    u_xlat23 = (x_185 * x_186);
    let x_192 : f32 = u_xlat1.x;
    u_xlatb3.x = (1.0f < abs(x_192));
    let x_196 : f32 = u_xlat23;
    u_xlat23 = ((x_196 * -2.0f) + 1.570796371f);
    let x_202 : bool = u_xlatb3.x;
    let x_203 : f32 = u_xlat23;
    u_xlat23 = select(0.0f, x_203, x_202);
    let x_205 : f32 = u_xlat9;
    let x_206 : f32 = u_xlat16;
    let x_208 : f32 = u_xlat23;
    u_xlat9 = ((x_205 * x_206) + x_208);
    let x_211 : f32 = u_xlat1.x;
    u_xlat1.x = min(x_211, 1.0f);
    let x_216 : f32 = u_xlat1.x;
    let x_218 : f32 = u_xlat1.x;
    u_xlatb1.x = (x_216 < -(x_218));
    let x_223 : bool = u_xlatb1.x;
    if (x_223) {
      let x_227 : f32 = u_xlat9;
      x_224 = -(x_227);
    } else {
      let x_230 : f32 = u_xlat9;
      x_224 = x_230;
    }
    let x_231 : f32 = x_224;
    u_xlat1.x = x_231;
    let x_234 : f32 = u_xlat2.x;
    let x_236 : f32 = u_xlat1.x;
    u_xlat1.x = ((x_234 * x_236) + -1.0f);
    let x_240 : vec4<f32> = u_xlat0;
    let x_242 : vec3<f32> = u_xlat1;
    let x_245 : vec2<f32> = u_xlat14;
    u_xlat15 = ((vec2<f32>(x_240.x, x_240.y) * vec2<f32>(x_242.x, x_242.x)) + x_245);
  }
  let x_247 : vec2<f32> = vs_TEXCOORD0;
  u_xlat0 = ((vec4<f32>(x_247.x, x_247.y, x_247.x, x_247.y) * vec4<f32>(2.0f, 2.0f, 2.0f, 2.0f)) + vec4<f32>(-1.0f, -1.0f, -1.0f, -1.0f));
  let x_254 : vec4<f32> = u_xlat0;
  let x_256 : vec4<f32> = u_xlat0;
  u_xlat1.x = dot(vec2<f32>(x_254.z, x_254.w), vec2<f32>(x_256.z, x_256.w));
  let x_260 : vec4<f32> = u_xlat0;
  let x_261 : vec3<f32> = u_xlat1;
  u_xlat0 = (x_260 * vec4<f32>(x_261.x, x_261.x, x_261.x, x_261.x));
  let x_264 : vec4<f32> = u_xlat0;
  let x_267 : f32 = x_25.x_Chroma_Params;
  u_xlat0 = (x_264 * vec4<f32>(x_267, x_267, x_267, x_267));
  let x_280 : vec2<f32> = u_xlat15;
  let x_283 : f32 = x_25.x_GlobalMipBias.x;
  let x_284 : vec4<f32> = textureSampleBias(x_BlitTexture, sampler_LinearClamp, x_280, x_283);
  u_xlat2.x = x_284.x;
  let x_287 : vec4<f32> = u_xlat0;
  let x_292 : vec2<f32> = vs_TEXCOORD0;
  u_xlat0 = ((x_287 * vec4<f32>(-0.333333343f, -0.333333343f, -0.666666687f, -0.666666687f)) + vec4<f32>(x_292.x, x_292.y, x_292.x, x_292.y));
  let x_295 : vec4<f32> = u_xlat0;
  u_xlat0 = (x_295 + vec4<f32>(-0.5f, -0.5f, -0.5f, -0.5f));
  let x_298 : vec4<f32> = u_xlat0;
  let x_300 : vec4<f32> = x_25.x_Distortion_Params2;
  u_xlat3 = ((x_298 * vec4<f32>(x_300.z, x_300.z, x_300.z, x_300.z)) + vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
  let x_305 : vec4<f32> = u_xlat0;
  let x_307 : vec4<f32> = x_25.x_Distortion_Params2;
  let x_311 : vec4<f32> = x_25.x_Distortion_Params1;
  u_xlat0 = ((x_305 * vec4<f32>(x_307.z, x_307.z, x_307.z, x_307.z)) + -(vec4<f32>(x_311.x, x_311.y, x_311.x, x_311.y)));
  let x_315 : vec4<f32> = u_xlat0;
  let x_317 : vec4<f32> = x_25.x_Distortion_Params1;
  u_xlat0 = (x_315 * vec4<f32>(x_317.z, x_317.w, x_317.z, x_317.w));
  let x_320 : vec4<f32> = u_xlat0;
  let x_322 : vec4<f32> = u_xlat0;
  u_xlat1.x = dot(vec2<f32>(x_320.x, x_320.y), vec2<f32>(x_322.x, x_322.y));
  let x_327 : f32 = u_xlat1.x;
  u_xlat1.x = sqrt(x_327);
  let x_330 : bool = u_xlatb8;
  if (x_330) {
    let x_334 : vec3<f32> = u_xlat1;
    let x_337 : vec4<f32> = x_25.x_Distortion_Params2;
    let x_339 : vec2<f32> = (vec2<f32>(x_334.x, x_334.x) * vec2<f32>(x_337.x, x_337.y));
    let x_340 : vec4<f32> = u_xlat4;
    u_xlat4 = vec4<f32>(x_339.x, x_339.y, x_340.z, x_340.w);
    let x_344 : f32 = u_xlat4.x;
    u_xlat5.x = cos(x_344);
    let x_348 : f32 = u_xlat4.x;
    u_xlat4.x = sin(x_348);
    let x_352 : f32 = u_xlat4.x;
    let x_354 : f32 = u_xlat5.x;
    u_xlat23 = (x_352 / x_354);
    let x_357 : f32 = u_xlat4.y;
    u_xlat4.x = (1.0f / x_357);
    let x_360 : f32 = u_xlat23;
    let x_362 : f32 = u_xlat4.x;
    u_xlat23 = ((x_360 * x_362) + -1.0f);
    let x_365 : vec4<f32> = u_xlat0;
    let x_367 : f32 = u_xlat23;
    let x_370 : vec4<f32> = u_xlat3;
    let x_372 : vec2<f32> = ((vec2<f32>(x_365.x, x_365.y) * vec2<f32>(x_367, x_367)) + vec2<f32>(x_370.x, x_370.y));
    let x_373 : vec4<f32> = u_xlat4;
    u_xlat4 = vec4<f32>(x_372.x, x_372.y, x_373.z, x_373.w);
  } else {
    let x_377 : f32 = u_xlat1.x;
    u_xlat23 = (1.0f / x_377);
    let x_379 : f32 = u_xlat23;
    let x_381 : f32 = x_25.x_Distortion_Params2.x;
    u_xlat23 = (x_379 * x_381);
    let x_384 : f32 = u_xlat1.x;
    let x_386 : f32 = x_25.x_Distortion_Params2.y;
    u_xlat1.x = (x_384 * x_386);
    let x_391 : f32 = u_xlat1.x;
    u_xlat18 = min(abs(x_391), 1.0f);
    let x_396 : f32 = u_xlat1.x;
    u_xlat25 = max(abs(x_396), 1.0f);
    let x_399 : f32 = u_xlat25;
    u_xlat25 = (1.0f / x_399);
    let x_401 : f32 = u_xlat25;
    let x_402 : f32 = u_xlat18;
    u_xlat18 = (x_401 * x_402);
    let x_404 : f32 = u_xlat18;
    let x_405 : f32 = u_xlat18;
    u_xlat25 = (x_404 * x_405);
    let x_407 : f32 = u_xlat25;
    u_xlat5.x = ((x_407 * 0.0208351f) + -0.085133001f);
    let x_411 : f32 = u_xlat25;
    let x_413 : f32 = u_xlat5.x;
    u_xlat5.x = ((x_411 * x_413) + 0.180141002f);
    let x_417 : f32 = u_xlat25;
    let x_419 : f32 = u_xlat5.x;
    u_xlat5.x = ((x_417 * x_419) + -0.330299497f);
    let x_423 : f32 = u_xlat25;
    let x_425 : f32 = u_xlat5.x;
    u_xlat25 = ((x_423 * x_425) + 0.999866009f);
    let x_428 : f32 = u_xlat25;
    let x_429 : f32 = u_xlat18;
    u_xlat5.x = (x_428 * x_429);
    let x_434 : f32 = u_xlat1.x;
    u_xlatb12 = (1.0f < abs(x_434));
    let x_438 : f32 = u_xlat5.x;
    u_xlat5.x = ((x_438 * -2.0f) + 1.570796371f);
    let x_442 : bool = u_xlatb12;
    if (x_442) {
      let x_447 : f32 = u_xlat5.x;
      x_443 = x_447;
    } else {
      x_443 = 0.0f;
    }
    let x_449 : f32 = x_443;
    u_xlat5.x = x_449;
    let x_451 : f32 = u_xlat18;
    let x_452 : f32 = u_xlat25;
    let x_455 : f32 = u_xlat5.x;
    u_xlat18 = ((x_451 * x_452) + x_455);
    let x_458 : f32 = u_xlat1.x;
    u_xlat1.x = min(x_458, 1.0f);
    let x_462 : f32 = u_xlat1.x;
    let x_464 : f32 = u_xlat1.x;
    u_xlatb1.x = (x_462 < -(x_464));
    let x_469 : bool = u_xlatb1.x;
    if (x_469) {
      let x_473 : f32 = u_xlat18;
      x_470 = -(x_473);
    } else {
      let x_476 : f32 = u_xlat18;
      x_470 = x_476;
    }
    let x_477 : f32 = x_470;
    u_xlat1.x = x_477;
    let x_479 : f32 = u_xlat23;
    let x_481 : f32 = u_xlat1.x;
    u_xlat1.x = ((x_479 * x_481) + -1.0f);
    let x_485 : vec4<f32> = u_xlat0;
    let x_487 : vec3<f32> = u_xlat1;
    let x_490 : vec4<f32> = u_xlat3;
    let x_492 : vec2<f32> = ((vec2<f32>(x_485.x, x_485.y) * vec2<f32>(x_487.x, x_487.x)) + vec2<f32>(x_490.x, x_490.y));
    let x_493 : vec4<f32> = u_xlat4;
    u_xlat4 = vec4<f32>(x_492.x, x_492.y, x_493.z, x_493.w);
  }
  let x_498 : vec4<f32> = u_xlat4;
  let x_501 : f32 = x_25.x_GlobalMipBias.x;
  let x_502 : vec4<f32> = textureSampleBias(x_BlitTexture, sampler_LinearClamp, vec2<f32>(x_498.x, x_498.y), x_501);
  u_xlat2.y = x_502.y;
  let x_505 : vec4<f32> = u_xlat0;
  let x_507 : vec4<f32> = u_xlat0;
  u_xlat0.x = dot(vec2<f32>(x_505.z, x_505.w), vec2<f32>(x_507.z, x_507.w));
  let x_512 : f32 = u_xlat0.x;
  u_xlat0.x = sqrt(x_512);
  let x_515 : bool = u_xlatb8;
  if (x_515) {
    let x_518 : vec4<f32> = u_xlat0;
    let x_521 : vec4<f32> = x_25.x_Distortion_Params2;
    let x_523 : vec2<f32> = (vec2<f32>(x_518.x, x_518.x) * vec2<f32>(x_521.x, x_521.y));
    let x_524 : vec3<f32> = u_xlat1;
    u_xlat1 = vec3<f32>(x_523.x, x_523.y, x_524.z);
    let x_527 : f32 = u_xlat1.x;
    u_xlat3.x = cos(x_527);
    let x_531 : f32 = u_xlat1.x;
    u_xlat1.x = sin(x_531);
    let x_536 : f32 = u_xlat1.x;
    let x_538 : f32 = u_xlat3.x;
    u_xlat7.x = (x_536 / x_538);
    let x_542 : f32 = u_xlat1.y;
    u_xlat1.x = (1.0f / x_542);
    let x_546 : f32 = u_xlat7.x;
    let x_548 : f32 = u_xlat1.x;
    u_xlat7.x = ((x_546 * x_548) + -1.0f);
    let x_552 : vec4<f32> = u_xlat0;
    let x_554 : vec3<f32> = u_xlat7;
    let x_557 : vec4<f32> = u_xlat3;
    let x_559 : vec2<f32> = ((vec2<f32>(x_552.z, x_552.w) * vec2<f32>(x_554.x, x_554.x)) + vec2<f32>(x_557.z, x_557.w));
    let x_560 : vec3<f32> = u_xlat1;
    u_xlat1 = vec3<f32>(x_559.x, x_559.y, x_560.z);
  } else {
    let x_564 : f32 = u_xlat0.x;
    u_xlat7.x = (1.0f / x_564);
    let x_568 : f32 = u_xlat7.x;
    let x_570 : f32 = x_25.x_Distortion_Params2.x;
    u_xlat7.x = (x_568 * x_570);
    let x_574 : f32 = u_xlat0.x;
    let x_576 : f32 = x_25.x_Distortion_Params2.y;
    u_xlat0.x = (x_574 * x_576);
    let x_580 : f32 = u_xlat0.x;
    u_xlat23 = min(abs(x_580), 1.0f);
    let x_584 : f32 = u_xlat0.x;
    u_xlat3.x = max(abs(x_584), 1.0f);
    let x_589 : f32 = u_xlat3.x;
    u_xlat3.x = (1.0f / x_589);
    let x_592 : f32 = u_xlat23;
    let x_594 : f32 = u_xlat3.x;
    u_xlat23 = (x_592 * x_594);
    let x_596 : f32 = u_xlat23;
    let x_597 : f32 = u_xlat23;
    u_xlat3.x = (x_596 * x_597);
    let x_602 : f32 = u_xlat3.x;
    u_xlat10 = ((x_602 * 0.0208351f) + -0.085133001f);
    let x_606 : f32 = u_xlat3.x;
    let x_607 : f32 = u_xlat10;
    u_xlat10 = ((x_606 * x_607) + 0.180141002f);
    let x_611 : f32 = u_xlat3.x;
    let x_612 : f32 = u_xlat10;
    u_xlat10 = ((x_611 * x_612) + -0.330299497f);
    let x_616 : f32 = u_xlat3.x;
    let x_617 : f32 = u_xlat10;
    u_xlat3.x = ((x_616 * x_617) + 0.999866009f);
    let x_621 : f32 = u_xlat23;
    let x_623 : f32 = u_xlat3.x;
    u_xlat10 = (x_621 * x_623);
    let x_627 : f32 = u_xlat0.x;
    u_xlatb4 = (1.0f < abs(x_627));
    let x_630 : f32 = u_xlat10;
    u_xlat10 = ((x_630 * -2.0f) + 1.570796371f);
    let x_633 : bool = u_xlatb4;
    let x_634 : f32 = u_xlat10;
    u_xlat10 = select(0.0f, x_634, x_633);
    let x_636 : f32 = u_xlat23;
    let x_638 : f32 = u_xlat3.x;
    let x_640 : f32 = u_xlat10;
    u_xlat23 = ((x_636 * x_638) + x_640);
    let x_643 : f32 = u_xlat0.x;
    u_xlat0.x = min(x_643, 1.0f);
    let x_648 : f32 = u_xlat0.x;
    let x_650 : f32 = u_xlat0.x;
    u_xlatb0.x = (x_648 < -(x_650));
    let x_655 : bool = u_xlatb0.x;
    if (x_655) {
      let x_659 : f32 = u_xlat23;
      x_656 = -(x_659);
    } else {
      let x_662 : f32 = u_xlat23;
      x_656 = x_662;
    }
    let x_663 : f32 = x_656;
    u_xlat0.x = x_663;
    let x_666 : f32 = u_xlat7.x;
    let x_668 : f32 = u_xlat0.x;
    u_xlat0.x = ((x_666 * x_668) + -1.0f);
    let x_672 : vec4<f32> = u_xlat0;
    let x_674 : vec4<f32> = u_xlat0;
    let x_677 : vec4<f32> = u_xlat3;
    let x_679 : vec2<f32> = ((vec2<f32>(x_672.z, x_672.w) * vec2<f32>(x_674.x, x_674.x)) + vec2<f32>(x_677.z, x_677.w));
    let x_680 : vec3<f32> = u_xlat1;
    u_xlat1 = vec3<f32>(x_679.x, x_679.y, x_680.z);
  }
  let x_685 : vec3<f32> = u_xlat1;
  let x_688 : f32 = x_25.x_GlobalMipBias.x;
  let x_689 : vec4<f32> = textureSampleBias(x_BlitTexture, sampler_LinearClamp, vec2<f32>(x_685.x, x_685.y), x_688);
  u_xlat2.z = x_689.z;
  let x_693 : vec2<f32> = u_xlat15;
  let x_696 : vec4<f32> = x_25.x_Bloom_Texture_TexelSize;
  let x_699 : vec2<f32> = ((x_693 * vec2<f32>(x_696.z, x_696.w)) + vec2<f32>(0.5f, 0.5f));
  let x_700 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_699.x, x_699.y, x_700.z, x_700.w);
  let x_702 : vec4<f32> = u_xlat0;
  u_xlat14 = floor(vec2<f32>(x_702.x, x_702.y));
  let x_705 : vec4<f32> = u_xlat0;
  let x_707 : vec2<f32> = fract(vec2<f32>(x_705.x, x_705.y));
  let x_708 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_707.x, x_707.y, x_708.z, x_708.w);
  let x_710 : vec4<f32> = u_xlat0;
  u_xlat3 = ((-(vec4<f32>(x_710.x, x_710.y, x_710.x, x_710.y)) * vec4<f32>(0.5f, 0.5f, 0.166666672f, 0.166666672f)) + vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
  let x_717 : vec4<f32> = u_xlat0;
  let x_719 : vec4<f32> = u_xlat3;
  u_xlat3 = ((vec4<f32>(x_717.x, x_717.y, x_717.x, x_717.y) * x_719) + vec4<f32>(0.5f, 0.5f, -0.5f, -0.5f));
  let x_723 : vec4<f32> = u_xlat0;
  let x_727 : vec2<f32> = ((vec2<f32>(x_723.x, x_723.y) * vec2<f32>(0.5f, 0.5f)) + vec2<f32>(-1.0f, -1.0f));
  let x_728 : vec3<f32> = u_xlat1;
  u_xlat1 = vec3<f32>(x_727.x, x_727.y, x_728.z);
  let x_730 : vec4<f32> = u_xlat0;
  let x_732 : vec4<f32> = u_xlat0;
  let x_734 : vec2<f32> = (vec2<f32>(x_730.x, x_730.y) * vec2<f32>(x_732.x, x_732.y));
  let x_735 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_734.x, x_734.y, x_735.z, x_735.w);
  let x_737 : vec4<f32> = u_xlat4;
  let x_739 : vec3<f32> = u_xlat1;
  let x_744 : vec2<f32> = ((vec2<f32>(x_737.x, x_737.y) * vec2<f32>(x_739.x, x_739.y)) + vec2<f32>(0.666666687f, 0.666666687f));
  let x_745 : vec3<f32> = u_xlat1;
  u_xlat1 = vec3<f32>(x_744.x, x_744.y, x_745.z);
  let x_747 : vec4<f32> = u_xlat0;
  let x_749 : vec4<f32> = u_xlat3;
  u_xlat3 = ((vec4<f32>(x_747.x, x_747.y, x_747.x, x_747.y) * x_749) + vec4<f32>(0.166666672f, 0.166666672f, 0.166666672f, 0.166666672f));
  let x_753 : vec3<f32> = u_xlat1;
  let x_757 : vec2<f32> = (-(vec2<f32>(x_753.x, x_753.y)) + vec2<f32>(1.0f, 1.0f));
  let x_758 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_757.x, x_757.y, x_758.z, x_758.w);
  let x_760 : vec4<f32> = u_xlat3;
  let x_763 : vec4<f32> = u_xlat0;
  let x_765 : vec2<f32> = (-(vec2<f32>(x_760.x, x_760.y)) + vec2<f32>(x_763.x, x_763.y));
  let x_766 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_765.x, x_765.y, x_766.z, x_766.w);
  let x_768 : vec4<f32> = u_xlat3;
  let x_771 : vec4<f32> = u_xlat0;
  let x_773 : vec2<f32> = (-(vec2<f32>(x_768.z, x_768.w)) + vec2<f32>(x_771.x, x_771.y));
  let x_774 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_773.x, x_773.y, x_774.z, x_774.w);
  let x_777 : vec3<f32> = u_xlat1;
  let x_779 : vec4<f32> = u_xlat3;
  u_xlat17 = (vec2<f32>(x_777.x, x_777.y) + vec2<f32>(x_779.z, x_779.w));
  let x_782 : vec4<f32> = u_xlat0;
  let x_784 : vec4<f32> = u_xlat3;
  let x_786 : vec2<f32> = (vec2<f32>(x_782.x, x_782.y) + vec2<f32>(x_784.x, x_784.y));
  let x_787 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_786.x, x_786.y, x_787.z, x_787.w);
  let x_789 : vec2<f32> = u_xlat17;
  let x_793 : vec2<f32> = (vec2<f32>(1.0f, 1.0f) / vec2<f32>(x_789.x, x_789.y));
  let x_794 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_793.x, x_793.y, x_794.z, x_794.w);
  let x_796 : vec3<f32> = u_xlat1;
  let x_798 : vec4<f32> = u_xlat4;
  let x_801 : vec2<f32> = ((vec2<f32>(x_796.x, x_796.y) * vec2<f32>(x_798.x, x_798.y)) + vec2<f32>(-1.0f, -1.0f));
  let x_802 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_802.x, x_802.y, x_801.x, x_801.y);
  let x_804 : vec4<f32> = u_xlat3;
  let x_805 : vec2<f32> = vec2<f32>(x_804.x, x_804.y);
  let x_809 : vec2<f32> = (vec2<f32>(1.0f, 1.0f) / vec2<f32>(x_805.x, x_805.y));
  let x_810 : vec3<f32> = u_xlat1;
  u_xlat1 = vec3<f32>(x_809.x, x_809.y, x_810.z);
  let x_812 : vec4<f32> = u_xlat0;
  let x_814 : vec3<f32> = u_xlat1;
  let x_817 : vec2<f32> = ((vec2<f32>(x_812.x, x_812.y) * vec2<f32>(x_814.x, x_814.y)) + vec2<f32>(1.0f, 1.0f));
  let x_818 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_817.x, x_817.y, x_818.z, x_818.w);
  let x_820 : vec2<f32> = u_xlat14;
  let x_822 : vec4<f32> = u_xlat4;
  u_xlat5 = (vec4<f32>(x_820.x, x_820.y, x_820.x, x_820.y) + vec4<f32>(x_822.z, x_822.w, x_822.x, x_822.w));
  let x_825 : vec4<f32> = u_xlat5;
  u_xlat5 = (x_825 + vec4<f32>(-0.5f, -0.5f, -0.5f, -0.5f));
  let x_827 : vec4<f32> = u_xlat5;
  let x_829 : vec4<f32> = x_25.x_Bloom_Texture_TexelSize;
  u_xlat5 = (x_827 * vec4<f32>(x_829.x, x_829.y, x_829.x, x_829.y));
  let x_832 : vec4<f32> = u_xlat5;
  u_xlat5 = min(x_832, vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_840 : vec4<f32> = u_xlat5;
  let x_842 : vec4<f32> = textureSampleLevel(x_Bloom_Texture, sampler_LinearClamp, vec2<f32>(x_840.x, x_840.y), 0.0f);
  u_xlat6 = x_842;
  let x_846 : vec4<f32> = u_xlat5;
  let x_848 : vec4<f32> = textureSampleLevel(x_Bloom_Texture, sampler_LinearClamp, vec2<f32>(x_846.z, x_846.w), 0.0f);
  u_xlat5 = x_848;
  let x_849 : vec4<f32> = u_xlat3;
  let x_851 : vec4<f32> = u_xlat5;
  u_xlat5 = (vec4<f32>(x_849.x, x_849.x, x_849.x, x_849.x) * x_851);
  let x_853 : vec2<f32> = u_xlat17;
  let x_855 : vec4<f32> = u_xlat6;
  let x_857 : vec4<f32> = u_xlat5;
  u_xlat5 = ((vec4<f32>(x_853.x, x_853.x, x_853.x, x_853.x) * x_855) + x_857);
  let x_859 : vec2<f32> = u_xlat14;
  let x_861 : vec4<f32> = u_xlat4;
  u_xlat0 = (vec4<f32>(x_859.x, x_859.y, x_859.x, x_859.y) + vec4<f32>(x_861.z, x_861.y, x_861.x, x_861.y));
  let x_864 : vec4<f32> = u_xlat0;
  u_xlat0 = (x_864 + vec4<f32>(-0.5f, -0.5f, -0.5f, -0.5f));
  let x_866 : vec4<f32> = u_xlat0;
  let x_868 : vec4<f32> = x_25.x_Bloom_Texture_TexelSize;
  u_xlat0 = (x_866 * vec4<f32>(x_868.x, x_868.y, x_868.x, x_868.y));
  let x_871 : vec4<f32> = u_xlat0;
  u_xlat0 = min(x_871, vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_876 : vec4<f32> = u_xlat0;
  let x_878 : vec4<f32> = textureSampleLevel(x_Bloom_Texture, sampler_LinearClamp, vec2<f32>(x_876.x, x_876.y), 0.0f);
  u_xlat4 = x_878;
  let x_882 : vec4<f32> = u_xlat0;
  let x_884 : vec4<f32> = textureSampleLevel(x_Bloom_Texture, sampler_LinearClamp, vec2<f32>(x_882.z, x_882.w), 0.0f);
  u_xlat0 = x_884;
  let x_885 : vec4<f32> = u_xlat0;
  let x_886 : vec4<f32> = u_xlat3;
  u_xlat0 = (x_885 * vec4<f32>(x_886.x, x_886.x, x_886.x, x_886.x));
  let x_889 : vec2<f32> = u_xlat17;
  let x_891 : vec4<f32> = u_xlat4;
  let x_893 : vec4<f32> = u_xlat0;
  u_xlat0 = ((vec4<f32>(x_889.x, x_889.x, x_889.x, x_889.x) * x_891) + x_893);
  let x_895 : vec4<f32> = u_xlat0;
  let x_896 : vec4<f32> = u_xlat3;
  u_xlat0 = (x_895 * vec4<f32>(x_896.y, x_896.y, x_896.y, x_896.y));
  let x_899 : vec2<f32> = u_xlat17;
  let x_901 : vec4<f32> = u_xlat5;
  let x_903 : vec4<f32> = u_xlat0;
  u_xlat0 = ((vec4<f32>(x_899.y, x_899.y, x_899.y, x_899.y) * x_901) + x_903);
  let x_907 : f32 = x_25.x_Bloom_RGBM;
  u_xlatb1.x = (0.0f < x_907);
  let x_911 : bool = u_xlatb1.x;
  if (x_911) {
    let x_914 : vec4<f32> = u_xlat0;
    let x_916 : vec4<f32> = u_xlat0;
    let x_918 : vec3<f32> = (vec3<f32>(x_914.w, x_914.w, x_914.w) * vec3<f32>(x_916.x, x_916.y, x_916.z));
    let x_919 : vec4<f32> = u_xlat3;
    u_xlat3 = vec4<f32>(x_918.x, x_918.y, x_918.z, x_919.w);
    let x_921 : vec4<f32> = u_xlat3;
    let x_925 : vec3<f32> = (vec3<f32>(x_921.x, x_921.y, x_921.z) * vec3<f32>(8.0f, 8.0f, 8.0f));
    let x_926 : vec4<f32> = u_xlat0;
    u_xlat0 = vec4<f32>(x_925.x, x_925.y, x_925.z, x_926.w);
  }
  let x_928 : vec4<f32> = u_xlat0;
  let x_932 : vec4<f32> = x_25.x_Bloom_Params;
  let x_934 : vec3<f32> = (vec3<f32>(x_928.x, x_928.y, x_928.z) * vec3<f32>(x_932.x, x_932.x, x_932.x));
  let x_935 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_934.x, x_934.y, x_934.z, x_935.w);
  let x_937 : vec4<f32> = u_xlat0;
  let x_940 : vec4<f32> = x_25.x_Bloom_Params;
  let x_943 : vec4<f32> = u_xlat2;
  let x_945 : vec3<f32> = ((vec3<f32>(x_937.x, x_937.y, x_937.z) * vec3<f32>(x_940.y, x_940.z, x_940.w)) + vec3<f32>(x_943.x, x_943.y, x_943.z));
  let x_946 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_945.x, x_945.y, x_945.z, x_946.w);
  let x_951 : f32 = x_25.x_Vignette_Params2.z;
  u_xlatb21 = (0.0f < x_951);
  let x_953 : bool = u_xlatb21;
  if (x_953) {
    let x_956 : vec2<f32> = u_xlat15;
    let x_958 : vec4<f32> = x_25.x_Vignette_Params2;
    let x_961 : vec2<f32> = (x_956 + -(vec2<f32>(x_958.x, x_958.y)));
    let x_962 : vec3<f32> = u_xlat1;
    u_xlat1 = vec3<f32>(x_961.x, x_961.y, x_962.z);
    let x_964 : vec3<f32> = u_xlat1;
    let x_968 : vec4<f32> = x_25.x_Vignette_Params2;
    let x_970 : vec2<f32> = (abs(vec2<f32>(x_964.x, x_964.y)) * vec2<f32>(x_968.z, x_968.z));
    let x_971 : vec3<f32> = u_xlat1;
    u_xlat1 = vec3<f32>(x_971.x, x_970.x, x_970.y);
    let x_974 : f32 = u_xlat1.y;
    let x_977 : f32 = x_25.x_Vignette_Params1.w;
    u_xlat1.x = (x_974 * x_977);
    let x_981 : vec3<f32> = u_xlat1;
    let x_983 : vec3<f32> = u_xlat1;
    u_xlat21 = dot(vec2<f32>(x_981.x, x_981.z), vec2<f32>(x_983.x, x_983.z));
    let x_986 : f32 = u_xlat21;
    u_xlat21 = (-(x_986) + 1.0f);
    let x_989 : f32 = u_xlat21;
    u_xlat21 = max(x_989, 0.0f);
    let x_991 : f32 = u_xlat21;
    u_xlat21 = log2(x_991);
    let x_993 : f32 = u_xlat21;
    let x_995 : f32 = x_25.x_Vignette_Params2.w;
    u_xlat21 = (x_993 * x_995);
    let x_997 : f32 = u_xlat21;
    u_xlat21 = exp2(x_997);
    let x_1000 : vec4<f32> = x_25.x_Vignette_Params1;
    u_xlat1 = (-(vec3<f32>(x_1000.x, x_1000.y, x_1000.z)) + vec3<f32>(1.0f, 1.0f, 1.0f));
    let x_1005 : f32 = u_xlat21;
    let x_1007 : vec3<f32> = u_xlat1;
    let x_1010 : vec4<f32> = x_25.x_Vignette_Params1;
    u_xlat1 = ((vec3<f32>(x_1005, x_1005, x_1005) * x_1007) + vec3<f32>(x_1010.x, x_1010.y, x_1010.z));
    let x_1013 : vec4<f32> = u_xlat0;
    let x_1015 : vec3<f32> = u_xlat1;
    let x_1016 : vec3<f32> = (vec3<f32>(x_1013.x, x_1013.y, x_1013.z) * x_1015);
    let x_1017 : vec4<f32> = u_xlat0;
    u_xlat0 = vec4<f32>(x_1016.x, x_1016.y, x_1016.z, x_1017.w);
  }
  let x_1019 : vec4<f32> = u_xlat0;
  let x_1023 : vec4<f32> = x_25.x_Lut_Params;
  let x_1025 : vec3<f32> = (vec3<f32>(x_1019.x, x_1019.y, x_1019.z) * vec3<f32>(x_1023.w, x_1023.w, x_1023.w));
  let x_1026 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1025.x, x_1025.y, x_1025.z, x_1026.w);
  let x_1028 : vec4<f32> = u_xlat0;
  u_xlat1 = (vec3<f32>(x_1028.x, x_1028.y, x_1028.z) * vec3<f32>(1.313386083f, 1.313386083f, 1.313386083f));
  let x_1033 : vec4<f32> = u_xlat0;
  let x_1040 : vec3<f32> = ((vec3<f32>(x_1033.x, x_1033.y, x_1033.z) * vec3<f32>(0.262677222f, 0.262677222f, 0.262677222f)) + vec3<f32>(0.069599994f, 0.069599994f, 0.069599994f));
  let x_1041 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1040.x, x_1040.y, x_1040.z, x_1041.w);
  let x_1043 : vec3<f32> = u_xlat1;
  let x_1044 : vec4<f32> = u_xlat2;
  let x_1049 : vec3<f32> = ((x_1043 * vec3<f32>(x_1044.x, x_1044.y, x_1044.z)) + vec3<f32>(0.00544f, 0.00544f, 0.00544f));
  let x_1050 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1049.x, x_1049.y, x_1049.z, x_1050.w);
  let x_1052 : vec4<f32> = u_xlat0;
  let x_1057 : vec3<f32> = ((vec3<f32>(x_1052.x, x_1052.y, x_1052.z) * vec3<f32>(0.262677222f, 0.262677222f, 0.262677222f)) + vec3<f32>(0.289999992f, 0.289999992f, 0.289999992f));
  let x_1058 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1057.x, x_1057.y, x_1057.z, x_1058.w);
  let x_1060 : vec3<f32> = u_xlat1;
  let x_1061 : vec4<f32> = u_xlat0;
  let x_1066 : vec3<f32> = ((x_1060 * vec3<f32>(x_1061.x, x_1061.y, x_1061.z)) + vec3<f32>(0.08160001f, 0.08160001f, 0.08160001f));
  let x_1067 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1066.x, x_1066.y, x_1066.z, x_1067.w);
  let x_1069 : vec4<f32> = u_xlat2;
  let x_1071 : vec4<f32> = u_xlat0;
  let x_1073 : vec3<f32> = (vec3<f32>(x_1069.x, x_1069.y, x_1069.z) / vec3<f32>(x_1071.x, x_1071.y, x_1071.z));
  let x_1074 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1073.x, x_1073.y, x_1073.z, x_1074.w);
  let x_1076 : vec4<f32> = u_xlat0;
  let x_1080 : vec3<f32> = (vec3<f32>(x_1076.x, x_1076.y, x_1076.z) + vec3<f32>(-0.066666663f, -0.066666663f, -0.066666663f));
  let x_1081 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1080.x, x_1080.y, x_1080.z, x_1081.w);
  let x_1083 : vec4<f32> = u_xlat0;
  let x_1085 : vec3<f32> = (vec3<f32>(x_1083.x, x_1083.y, x_1083.z) * vec3<f32>(1.313386083f, 1.313386083f, 1.313386083f));
  let x_1086 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1085.x, x_1085.y, x_1085.z, x_1086.w);
  let x_1088 : vec4<f32> = u_xlat0;
  let x_1092 : vec3<f32> = clamp(vec3<f32>(x_1088.x, x_1088.y, x_1088.z), vec3<f32>(0.0f, 0.0f, 0.0f), vec3<f32>(1.0f, 1.0f, 1.0f));
  let x_1093 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1092.x, x_1092.y, x_1092.z, x_1093.w);
  let x_1097 : f32 = x_25.x_UserLut_Params.w;
  u_xlatb21 = (0.0f < x_1097);
  let x_1099 : bool = u_xlatb21;
  if (x_1099) {
    let x_1102 : vec4<f32> = u_xlat0;
    u_xlat1 = (vec3<f32>(x_1102.x, x_1102.y, x_1102.z) * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
    let x_1107 : vec4<f32> = u_xlat0;
    let x_1109 : vec3<f32> = log2(vec3<f32>(x_1107.x, x_1107.y, x_1107.z));
    let x_1110 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1109.x, x_1109.y, x_1109.z, x_1110.w);
    let x_1112 : vec4<f32> = u_xlat2;
    let x_1116 : vec3<f32> = (vec3<f32>(x_1112.x, x_1112.y, x_1112.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
    let x_1117 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1116.x, x_1116.y, x_1116.z, x_1117.w);
    let x_1119 : vec4<f32> = u_xlat2;
    let x_1121 : vec3<f32> = exp2(vec3<f32>(x_1119.x, x_1119.y, x_1119.z));
    let x_1122 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1121.x, x_1121.y, x_1121.z, x_1122.w);
    let x_1124 : vec4<f32> = u_xlat2;
    let x_1131 : vec3<f32> = ((vec3<f32>(x_1124.x, x_1124.y, x_1124.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    let x_1132 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1131.x, x_1131.y, x_1131.z, x_1132.w);
    let x_1136 : vec4<f32> = u_xlat0;
    let x_1139 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_1136.x, x_1136.y, x_1136.z, x_1136.x));
    u_xlatb3 = vec3<bool>(x_1139.x, x_1139.y, x_1139.z);
    let x_1142 : vec3<f32> = u_xlat1;
    hlslcc_movcTemp = x_1142;
    let x_1144 : bool = u_xlatb3.x;
    if (x_1144) {
      let x_1149 : f32 = u_xlat1.x;
      x_1145 = x_1149;
    } else {
      let x_1152 : f32 = u_xlat2.x;
      x_1145 = x_1152;
    }
    let x_1153 : f32 = x_1145;
    hlslcc_movcTemp.x = x_1153;
    let x_1156 : bool = u_xlatb3.y;
    if (x_1156) {
      let x_1161 : f32 = u_xlat1.y;
      x_1157 = x_1161;
    } else {
      let x_1164 : f32 = u_xlat2.y;
      x_1157 = x_1164;
    }
    let x_1165 : f32 = x_1157;
    hlslcc_movcTemp.y = x_1165;
    let x_1168 : bool = u_xlatb3.z;
    if (x_1168) {
      let x_1173 : f32 = u_xlat1.z;
      x_1169 = x_1173;
    } else {
      let x_1176 : f32 = u_xlat2.z;
      x_1169 = x_1176;
    }
    let x_1177 : f32 = x_1169;
    hlslcc_movcTemp.z = x_1177;
    let x_1179 : vec3<f32> = hlslcc_movcTemp;
    u_xlat1 = x_1179;
    let x_1180 : vec3<f32> = u_xlat1;
    let x_1183 : vec4<f32> = x_25.x_UserLut_Params;
    let x_1185 : vec3<f32> = (vec3<f32>(x_1180.z, x_1180.x, x_1180.y) * vec3<f32>(x_1183.z, x_1183.z, x_1183.z));
    let x_1186 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1185.x, x_1185.y, x_1185.z, x_1186.w);
    let x_1189 : f32 = u_xlat2.x;
    u_xlat21 = floor(x_1189);
    let x_1192 : vec4<f32> = x_25.x_UserLut_Params;
    let x_1194 : vec2<f32> = (vec2<f32>(x_1192.x, x_1192.y) * vec2<f32>(0.5f, 0.5f));
    let x_1195 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1194.x, x_1195.y, x_1195.z, x_1194.y);
    let x_1197 : vec4<f32> = u_xlat2;
    let x_1200 : vec4<f32> = x_25.x_UserLut_Params;
    let x_1203 : vec4<f32> = u_xlat2;
    let x_1205 : vec2<f32> = ((vec2<f32>(x_1197.y, x_1197.z) * vec2<f32>(x_1200.x, x_1200.y)) + vec2<f32>(x_1203.x, x_1203.w));
    let x_1206 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1206.x, x_1205.x, x_1205.y, x_1206.w);
    let x_1208 : f32 = u_xlat21;
    let x_1210 : f32 = x_25.x_UserLut_Params.y;
    let x_1213 : f32 = u_xlat2.y;
    u_xlat2.x = ((x_1208 * x_1210) + x_1213);
    let x_1220 : vec4<f32> = u_xlat2;
    let x_1222 : vec4<f32> = textureSampleLevel(x_UserLut, sampler_LinearClamp, vec2<f32>(x_1220.x, x_1220.z), 0.0f);
    let x_1223 : vec3<f32> = vec3<f32>(x_1222.x, x_1222.y, x_1222.z);
    let x_1224 : vec4<f32> = u_xlat3;
    u_xlat3 = vec4<f32>(x_1223.x, x_1223.y, x_1223.z, x_1224.w);
    let x_1227 : f32 = x_25.x_UserLut_Params.y;
    u_xlat4.x = x_1227;
    u_xlat4.y = 0.0f;
    let x_1230 : vec4<f32> = u_xlat2;
    let x_1232 : vec4<f32> = u_xlat4;
    let x_1234 : vec2<f32> = (vec2<f32>(x_1230.x, x_1230.z) + vec2<f32>(x_1232.x, x_1232.y));
    let x_1235 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1234.x, x_1234.y, x_1235.z, x_1235.w);
    let x_1240 : vec4<f32> = u_xlat2;
    let x_1242 : vec4<f32> = textureSampleLevel(x_UserLut, sampler_LinearClamp, vec2<f32>(x_1240.x, x_1240.y), 0.0f);
    let x_1243 : vec3<f32> = vec3<f32>(x_1242.x, x_1242.y, x_1242.z);
    let x_1244 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1243.x, x_1243.y, x_1243.z, x_1244.w);
    let x_1247 : f32 = u_xlat1.z;
    let x_1249 : f32 = x_25.x_UserLut_Params.z;
    let x_1251 : f32 = u_xlat21;
    u_xlat21 = ((x_1247 * x_1249) + -(x_1251));
    let x_1254 : vec4<f32> = u_xlat3;
    let x_1257 : vec4<f32> = u_xlat2;
    let x_1259 : vec3<f32> = (-(vec3<f32>(x_1254.x, x_1254.y, x_1254.z)) + vec3<f32>(x_1257.x, x_1257.y, x_1257.z));
    let x_1260 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1259.x, x_1259.y, x_1259.z, x_1260.w);
    let x_1262 : f32 = u_xlat21;
    let x_1264 : vec4<f32> = u_xlat2;
    let x_1267 : vec4<f32> = u_xlat3;
    let x_1269 : vec3<f32> = ((vec3<f32>(x_1262, x_1262, x_1262) * vec3<f32>(x_1264.x, x_1264.y, x_1264.z)) + vec3<f32>(x_1267.x, x_1267.y, x_1267.z));
    let x_1270 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1269.x, x_1269.y, x_1269.z, x_1270.w);
    let x_1272 : vec3<f32> = u_xlat1;
    let x_1274 : vec4<f32> = u_xlat2;
    let x_1276 : vec3<f32> = (-(x_1272) + vec3<f32>(x_1274.x, x_1274.y, x_1274.z));
    let x_1277 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1276.x, x_1276.y, x_1276.z, x_1277.w);
    let x_1280 : vec4<f32> = x_25.x_UserLut_Params;
    let x_1282 : vec4<f32> = u_xlat2;
    let x_1285 : vec3<f32> = u_xlat1;
    u_xlat1 = ((vec3<f32>(x_1280.w, x_1280.w, x_1280.w) * vec3<f32>(x_1282.x, x_1282.y, x_1282.z)) + x_1285);
    let x_1287 : vec3<f32> = u_xlat1;
    let x_1290 : vec3<f32> = (x_1287 * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
    let x_1291 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1290.x, x_1290.y, x_1290.z, x_1291.w);
    let x_1293 : vec3<f32> = u_xlat1;
    let x_1296 : vec3<f32> = (x_1293 + vec3<f32>(0.055f, 0.055f, 0.055f));
    let x_1297 : vec4<f32> = u_xlat3;
    u_xlat3 = vec4<f32>(x_1296.x, x_1296.y, x_1296.z, x_1297.w);
    let x_1299 : vec4<f32> = u_xlat3;
    let x_1303 : vec3<f32> = (vec3<f32>(x_1299.x, x_1299.y, x_1299.z) * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
    let x_1304 : vec4<f32> = u_xlat3;
    u_xlat3 = vec4<f32>(x_1303.x, x_1303.y, x_1303.z, x_1304.w);
    let x_1306 : vec4<f32> = u_xlat3;
    let x_1309 : vec3<f32> = log2(abs(vec3<f32>(x_1306.x, x_1306.y, x_1306.z)));
    let x_1310 : vec4<f32> = u_xlat3;
    u_xlat3 = vec4<f32>(x_1309.x, x_1309.y, x_1309.z, x_1310.w);
    let x_1312 : vec4<f32> = u_xlat3;
    let x_1316 : vec3<f32> = (vec3<f32>(x_1312.x, x_1312.y, x_1312.z) * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
    let x_1317 : vec4<f32> = u_xlat3;
    u_xlat3 = vec4<f32>(x_1316.x, x_1316.y, x_1316.z, x_1317.w);
    let x_1319 : vec4<f32> = u_xlat3;
    let x_1321 : vec3<f32> = exp2(vec3<f32>(x_1319.x, x_1319.y, x_1319.z));
    let x_1322 : vec4<f32> = u_xlat3;
    u_xlat3 = vec4<f32>(x_1321.x, x_1321.y, x_1321.z, x_1322.w);
    let x_1326 : vec3<f32> = u_xlat1;
    let x_1328 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_1326.x, x_1326.y, x_1326.z, x_1326.x));
    u_xlatb1 = vec3<bool>(x_1328.x, x_1328.y, x_1328.z);
    let x_1331 : bool = u_xlatb1.x;
    if (x_1331) {
      let x_1336 : f32 = u_xlat2.x;
      x_1332 = x_1336;
    } else {
      let x_1339 : f32 = u_xlat3.x;
      x_1332 = x_1339;
    }
    let x_1340 : f32 = x_1332;
    u_xlat0.x = x_1340;
    let x_1343 : bool = u_xlatb1.y;
    if (x_1343) {
      let x_1348 : f32 = u_xlat2.y;
      x_1344 = x_1348;
    } else {
      let x_1351 : f32 = u_xlat3.y;
      x_1344 = x_1351;
    }
    let x_1352 : f32 = x_1344;
    u_xlat0.y = x_1352;
    let x_1355 : bool = u_xlatb1.z;
    if (x_1355) {
      let x_1360 : f32 = u_xlat2.z;
      x_1356 = x_1360;
    } else {
      let x_1363 : f32 = u_xlat3.z;
      x_1356 = x_1363;
    }
    let x_1364 : f32 = x_1356;
    u_xlat0.z = x_1364;
  }
  let x_1366 : vec4<f32> = u_xlat0;
  let x_1369 : vec4<f32> = x_25.x_Lut_Params;
  let x_1371 : vec3<f32> = (vec3<f32>(x_1366.x, x_1366.y, x_1366.z) * vec3<f32>(x_1369.z, x_1369.z, x_1369.z));
  let x_1372 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1371.x, x_1371.y, x_1372.z, x_1371.z);
  let x_1375 : f32 = u_xlat0.w;
  u_xlat21 = floor(x_1375);
  let x_1378 : vec4<f32> = x_25.x_Lut_Params;
  let x_1380 : vec2<f32> = (vec2<f32>(x_1378.x, x_1378.y) * vec2<f32>(0.5f, 0.5f));
  let x_1381 : vec3<f32> = u_xlat1;
  u_xlat1 = vec3<f32>(x_1380.x, x_1380.y, x_1381.z);
  let x_1383 : vec4<f32> = u_xlat0;
  let x_1386 : vec4<f32> = x_25.x_Lut_Params;
  let x_1389 : vec3<f32> = u_xlat1;
  let x_1391 : vec2<f32> = ((vec2<f32>(x_1383.x, x_1383.y) * vec2<f32>(x_1386.x, x_1386.y)) + vec2<f32>(x_1389.x, x_1389.y));
  let x_1392 : vec3<f32> = u_xlat1;
  u_xlat1 = vec3<f32>(x_1392.x, x_1391.x, x_1391.y);
  let x_1394 : f32 = u_xlat21;
  let x_1396 : f32 = x_25.x_Lut_Params.y;
  let x_1399 : f32 = u_xlat1.y;
  u_xlat1.x = ((x_1394 * x_1396) + x_1399);
  let x_1406 : vec3<f32> = u_xlat1;
  let x_1408 : vec4<f32> = textureSampleLevel(x_InternalLut, sampler_LinearClamp, vec2<f32>(x_1406.x, x_1406.z), 0.0f);
  let x_1409 : vec3<f32> = vec3<f32>(x_1408.x, x_1408.y, x_1408.z);
  let x_1410 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1409.x, x_1409.y, x_1409.z, x_1410.w);
  let x_1413 : f32 = x_25.x_Lut_Params.y;
  u_xlat0.x = x_1413;
  u_xlat0.y = 0.0f;
  let x_1416 : vec4<f32> = u_xlat0;
  let x_1418 : vec3<f32> = u_xlat1;
  let x_1420 : vec2<f32> = (vec2<f32>(x_1416.x, x_1416.y) + vec2<f32>(x_1418.x, x_1418.z));
  let x_1421 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1420.x, x_1420.y, x_1421.z, x_1421.w);
  let x_1426 : vec4<f32> = u_xlat0;
  let x_1428 : vec4<f32> = textureSampleLevel(x_InternalLut, sampler_LinearClamp, vec2<f32>(x_1426.x, x_1426.y), 0.0f);
  u_xlat1 = vec3<f32>(x_1428.x, x_1428.y, x_1428.z);
  let x_1431 : f32 = u_xlat0.z;
  let x_1433 : f32 = x_25.x_Lut_Params.z;
  let x_1435 : f32 = u_xlat21;
  u_xlat0.x = ((x_1431 * x_1433) + -(x_1435));
  let x_1439 : vec4<f32> = u_xlat2;
  let x_1442 : vec3<f32> = u_xlat1;
  u_xlat7 = (-(vec3<f32>(x_1439.x, x_1439.y, x_1439.z)) + x_1442);
  let x_1444 : vec4<f32> = u_xlat0;
  let x_1446 : vec3<f32> = u_xlat7;
  let x_1448 : vec4<f32> = u_xlat2;
  let x_1450 : vec3<f32> = ((vec3<f32>(x_1444.x, x_1444.x, x_1444.x) * x_1446) + vec3<f32>(x_1448.x, x_1448.y, x_1448.z));
  let x_1451 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1450.x, x_1450.y, x_1450.z, x_1451.w);
  let x_1453 : vec4<f32> = u_xlat0;
  u_xlat1 = (vec3<f32>(x_1453.x, x_1453.y, x_1453.z) * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
  let x_1456 : vec4<f32> = u_xlat0;
  let x_1459 : vec3<f32> = log2(abs(vec3<f32>(x_1456.x, x_1456.y, x_1456.z)));
  let x_1460 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1459.x, x_1459.y, x_1459.z, x_1460.w);
  let x_1462 : vec4<f32> = u_xlat2;
  let x_1464 : vec3<f32> = (vec3<f32>(x_1462.x, x_1462.y, x_1462.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
  let x_1465 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1464.x, x_1464.y, x_1464.z, x_1465.w);
  let x_1467 : vec4<f32> = u_xlat2;
  let x_1469 : vec3<f32> = exp2(vec3<f32>(x_1467.x, x_1467.y, x_1467.z));
  let x_1470 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1469.x, x_1469.y, x_1469.z, x_1470.w);
  let x_1472 : vec4<f32> = u_xlat2;
  let x_1475 : vec3<f32> = ((vec3<f32>(x_1472.x, x_1472.y, x_1472.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
  let x_1476 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1475.x, x_1475.y, x_1475.z, x_1476.w);
  let x_1478 : vec4<f32> = u_xlat0;
  let x_1480 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_1478.x, x_1478.y, x_1478.z, x_1478.x));
  u_xlatb0 = vec3<bool>(x_1480.x, x_1480.y, x_1480.z);
  let x_1483 : bool = u_xlatb0.x;
  if (x_1483) {
    let x_1488 : f32 = u_xlat1.x;
    x_1484 = x_1488;
  } else {
    let x_1491 : f32 = u_xlat2.x;
    x_1484 = x_1491;
  }
  let x_1492 : f32 = x_1484;
  u_xlat0.x = x_1492;
  let x_1495 : bool = u_xlatb0.y;
  if (x_1495) {
    let x_1500 : f32 = u_xlat1.y;
    x_1496 = x_1500;
  } else {
    let x_1503 : f32 = u_xlat2.y;
    x_1496 = x_1503;
  }
  let x_1504 : f32 = x_1496;
  u_xlat0.y = x_1504;
  let x_1507 : bool = u_xlatb0.z;
  if (x_1507) {
    let x_1512 : f32 = u_xlat1.z;
    x_1508 = x_1512;
  } else {
    let x_1515 : f32 = u_xlat2.z;
    x_1508 = x_1515;
  }
  let x_1516 : f32 = x_1508;
  u_xlat0.z = x_1516;
  let x_1518 : vec2<f32> = vs_TEXCOORD0;
  let x_1521 : vec4<f32> = x_25.x_Dithering_Params;
  let x_1525 : vec4<f32> = x_25.x_Dithering_Params;
  let x_1527 : vec2<f32> = ((x_1518 * vec2<f32>(x_1521.x, x_1521.y)) + vec2<f32>(x_1525.z, x_1525.w));
  let x_1528 : vec3<f32> = u_xlat1;
  u_xlat1 = vec3<f32>(x_1527.x, x_1527.y, x_1528.z);
  let x_1535 : vec3<f32> = u_xlat1;
  let x_1538 : f32 = x_25.x_GlobalMipBias.x;
  let x_1539 : vec4<f32> = textureSampleBias(x_BlueNoise_Texture, sampler_PointRepeat, vec2<f32>(x_1535.x, x_1535.y), x_1538);
  u_xlat21 = x_1539.w;
  let x_1541 : f32 = u_xlat21;
  u_xlat21 = ((x_1541 * 2.0f) + -1.0f);
  let x_1544 : f32 = u_xlat21;
  u_xlatb1.x = (x_1544 >= 0.0f);
  let x_1548 : bool = u_xlatb1.x;
  u_xlat1.x = select(-1.0f, 1.0f, x_1548);
  let x_1551 : f32 = u_xlat21;
  u_xlat21 = (-(abs(x_1551)) + 1.0f);
  let x_1555 : f32 = u_xlat21;
  u_xlat21 = sqrt(x_1555);
  let x_1557 : f32 = u_xlat21;
  u_xlat21 = (-(x_1557) + 1.0f);
  let x_1560 : f32 = u_xlat21;
  let x_1562 : f32 = u_xlat1.x;
  u_xlat21 = (x_1560 * x_1562);
  let x_1564 : vec4<f32> = u_xlat0;
  u_xlat1 = (vec3<f32>(x_1564.x, x_1564.y, x_1564.z) * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
  let x_1567 : vec4<f32> = u_xlat0;
  let x_1570 : vec3<f32> = log2(abs(vec3<f32>(x_1567.x, x_1567.y, x_1567.z)));
  let x_1571 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1570.x, x_1570.y, x_1570.z, x_1571.w);
  let x_1573 : vec4<f32> = u_xlat2;
  let x_1575 : vec3<f32> = (vec3<f32>(x_1573.x, x_1573.y, x_1573.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
  let x_1576 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1575.x, x_1575.y, x_1575.z, x_1576.w);
  let x_1578 : vec4<f32> = u_xlat2;
  let x_1580 : vec3<f32> = exp2(vec3<f32>(x_1578.x, x_1578.y, x_1578.z));
  let x_1581 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1580.x, x_1580.y, x_1580.z, x_1581.w);
  let x_1583 : vec4<f32> = u_xlat2;
  let x_1586 : vec3<f32> = ((vec3<f32>(x_1583.x, x_1583.y, x_1583.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
  let x_1587 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1586.x, x_1586.y, x_1586.z, x_1587.w);
  let x_1589 : vec4<f32> = u_xlat0;
  let x_1591 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_1589.x, x_1589.y, x_1589.z, x_1589.x));
  u_xlatb0 = vec3<bool>(x_1591.x, x_1591.y, x_1591.z);
  let x_1594 : bool = u_xlatb0.x;
  if (x_1594) {
    let x_1599 : f32 = u_xlat1.x;
    x_1595 = x_1599;
  } else {
    let x_1602 : f32 = u_xlat2.x;
    x_1595 = x_1602;
  }
  let x_1603 : f32 = x_1595;
  u_xlat0.x = x_1603;
  let x_1606 : bool = u_xlatb0.y;
  if (x_1606) {
    let x_1611 : f32 = u_xlat1.y;
    x_1607 = x_1611;
  } else {
    let x_1614 : f32 = u_xlat2.y;
    x_1607 = x_1614;
  }
  let x_1615 : f32 = x_1607;
  u_xlat0.y = x_1615;
  let x_1618 : bool = u_xlatb0.z;
  if (x_1618) {
    let x_1623 : f32 = u_xlat1.z;
    x_1619 = x_1623;
  } else {
    let x_1626 : f32 = u_xlat2.z;
    x_1619 = x_1626;
  }
  let x_1627 : f32 = x_1619;
  u_xlat0.z = x_1627;
  let x_1629 : f32 = u_xlat21;
  let x_1634 : vec4<f32> = u_xlat0;
  let x_1636 : vec3<f32> = ((vec3<f32>(x_1629, x_1629, x_1629) * vec3<f32>(0.003921569f, 0.003921569f, 0.003921569f)) + vec3<f32>(x_1634.x, x_1634.y, x_1634.z));
  let x_1637 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1636.x, x_1636.y, x_1636.z, x_1637.w);
  let x_1639 : vec4<f32> = u_xlat0;
  u_xlat1 = (vec3<f32>(x_1639.x, x_1639.y, x_1639.z) * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
  let x_1642 : vec4<f32> = u_xlat0;
  let x_1644 : vec3<f32> = (vec3<f32>(x_1642.x, x_1642.y, x_1642.z) + vec3<f32>(0.055f, 0.055f, 0.055f));
  let x_1645 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1644.x, x_1644.y, x_1644.z, x_1645.w);
  let x_1647 : vec4<f32> = u_xlat2;
  let x_1649 : vec3<f32> = (vec3<f32>(x_1647.x, x_1647.y, x_1647.z) * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
  let x_1650 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1649.x, x_1649.y, x_1649.z, x_1650.w);
  let x_1652 : vec4<f32> = u_xlat2;
  let x_1655 : vec3<f32> = log2(abs(vec3<f32>(x_1652.x, x_1652.y, x_1652.z)));
  let x_1656 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1655.x, x_1655.y, x_1655.z, x_1656.w);
  let x_1658 : vec4<f32> = u_xlat2;
  let x_1660 : vec3<f32> = (vec3<f32>(x_1658.x, x_1658.y, x_1658.z) * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
  let x_1661 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1660.x, x_1660.y, x_1660.z, x_1661.w);
  let x_1663 : vec4<f32> = u_xlat2;
  let x_1665 : vec3<f32> = exp2(vec3<f32>(x_1663.x, x_1663.y, x_1663.z));
  let x_1666 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1665.x, x_1665.y, x_1665.z, x_1666.w);
  let x_1668 : vec4<f32> = u_xlat0;
  let x_1670 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_1668.x, x_1668.y, x_1668.z, x_1668.x));
  u_xlatb0 = vec3<bool>(x_1670.x, x_1670.y, x_1670.z);
  let x_1673 : bool = u_xlatb0.x;
  if (x_1673) {
    let x_1678 : f32 = u_xlat1.x;
    x_1674 = x_1678;
  } else {
    let x_1681 : f32 = u_xlat2.x;
    x_1674 = x_1681;
  }
  let x_1682 : f32 = x_1674;
  u_xlat0.x = x_1682;
  let x_1685 : bool = u_xlatb0.y;
  if (x_1685) {
    let x_1690 : f32 = u_xlat1.y;
    x_1686 = x_1690;
  } else {
    let x_1693 : f32 = u_xlat2.y;
    x_1686 = x_1693;
  }
  let x_1694 : f32 = x_1686;
  u_xlat0.y = x_1694;
  let x_1697 : bool = u_xlatb0.z;
  if (x_1697) {
    let x_1702 : f32 = u_xlat1.z;
    x_1698 = x_1702;
  } else {
    let x_1705 : f32 = u_xlat2.z;
    x_1698 = x_1705;
  }
  let x_1706 : f32 = x_1698;
  u_xlat0.z = x_1706;
  let x_1710 : vec4<f32> = u_xlat0;
  let x_1713 : vec3<f32> = max(vec3<f32>(x_1710.x, x_1710.y, x_1710.z), vec3<f32>(0.0f, 0.0f, 0.0f));
  let x_1714 : vec4<f32> = SV_Target0;
  SV_Target0 = vec4<f32>(x_1713.x, x_1713.y, x_1713.z, x_1714.w);
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

