struct PGlobals {
  x_GlobalMipBias : vec2<f32>,
  @size(8)
  padding : u32,
  x_Lut_Params : vec4<f32>,
  x_UserLut_Params : vec4<f32>,
  x_Distortion_Params1 : vec4<f32>,
  x_Distortion_Params2 : vec4<f32>,
  x_Vignette_Params1 : vec4<f32>,
  x_Vignette_Params2 : vec4<f32>,
  x_Dithering_Params : vec4<f32>,
}

var<private> vs_TEXCOORD0 : vec2<f32>;

@group(1) @binding(0) var<uniform> x_26 : PGlobals;

@group(0) @binding(0) var x_BlitTexture : texture_2d<f32>;

@group(0) @binding(4) var sampler_LinearClamp : sampler;

@group(0) @binding(2) var x_UserLut : texture_2d<f32>;

@group(0) @binding(1) var x_InternalLut : texture_2d<f32>;

@group(0) @binding(3) var x_BlueNoise_Texture : texture_2d<f32>;

@group(0) @binding(5) var sampler_PointRepeat : sampler;

var<private> SV_Target0 : vec4<f32>;

var<private> gl_FragCoord : vec4<f32>;

fn main_1() {
  var u_xlat0 : vec3<f32>;
  var u_xlat10 : vec2<f32>;
  var u_xlat1 : vec4<f32>;
  var u_xlatb6 : bool;
  var u_xlat6 : vec3<f32>;
  var u_xlat2 : vec4<f32>;
  var u_xlat3 : vec3<f32>;
  var u_xlat11 : vec2<f32>;
  var u_xlat16 : f32;
  var u_xlat7 : f32;
  var u_xlat12 : f32;
  var u_xlatb17 : bool;
  var u_xlatb1 : bool;
  var x_229 : f32;
  var u_xlatb15 : bool;
  var u_xlat15 : f32;
  var u_xlat5 : vec3<f32>;
  var u_xlatb5 : bool;
  var x_542 : f32;
  var x_551 : f32;
  var u_xlatb10 : vec2<bool>;
  var u_xlatb8 : bool;
  var x_682 : f32;
  var u_xlatb16 : bool;
  var x_733 : f32;
  var x_760 : f32;
  var x_784 : f32;
  var x_795 : f32;
  var u_xlatb0 : vec3<bool>;
  var u_xlatb3 : vec3<bool>;
  var hlslcc_movcTemp : vec3<f32>;
  var x_1184 : f32;
  var x_1196 : f32;
  var x_1208 : f32;
  var u_xlat4 : vec2<f32>;
  var x_1353 : f32;
  var x_1365 : f32;
  var x_1377 : f32;
  var x_1551 : f32;
  var x_1563 : f32;
  var x_1575 : f32;
  var x_1627 : f32;
  var x_1639 : f32;
  var x_1651 : f32;
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
    let x_92 : vec2<f32> = (vec2<f32>(x_87.x, x_87.x) * vec2<f32>(x_90.x, x_90.y));
    let x_93 : vec3<f32> = u_xlat6;
    u_xlat6 = vec3<f32>(x_92.x, x_92.y, x_93.z);
    let x_97 : f32 = u_xlat6.x;
    u_xlat2.x = sin(x_97);
    let x_102 : f32 = u_xlat6.x;
    u_xlat3.x = cos(x_102);
    let x_106 : f32 = u_xlat2.x;
    let x_108 : f32 = u_xlat3.x;
    u_xlat6.x = (x_106 / x_108);
    let x_115 : f32 = u_xlat6.y;
    u_xlat11.x = (1.0f / x_115);
    let x_119 : f32 = u_xlat6.x;
    let x_121 : f32 = u_xlat11.x;
    u_xlat6.x = ((x_119 * x_121) + -1.0f);
    let x_126 : vec3<f32> = u_xlat0;
    let x_128 : vec3<f32> = u_xlat6;
    let x_131 : vec2<f32> = u_xlat10;
    let x_132 : vec2<f32> = ((vec2<f32>(x_126.x, x_126.y) * vec2<f32>(x_128.x, x_128.x)) + x_131);
    let x_133 : vec3<f32> = u_xlat6;
    u_xlat6 = vec3<f32>(x_132.x, x_132.y, x_133.z);
  } else {
    let x_138 : f32 = u_xlat1.x;
    u_xlat16 = (1.0f / x_138);
    let x_140 : f32 = u_xlat16;
    let x_142 : f32 = x_26.x_Distortion_Params2.x;
    u_xlat16 = (x_140 * x_142);
    let x_145 : f32 = u_xlat1.x;
    let x_147 : f32 = x_26.x_Distortion_Params2.y;
    u_xlat1.x = (x_145 * x_147);
    let x_151 : f32 = u_xlat1.x;
    u_xlat2.x = min(abs(x_151), 1.0f);
    let x_157 : f32 = u_xlat1.x;
    u_xlat7 = max(abs(x_157), 1.0f);
    let x_160 : f32 = u_xlat7;
    u_xlat7 = (1.0f / x_160);
    let x_162 : f32 = u_xlat7;
    let x_164 : f32 = u_xlat2.x;
    u_xlat2.x = (x_162 * x_164);
    let x_168 : f32 = u_xlat2.x;
    let x_170 : f32 = u_xlat2.x;
    u_xlat7 = (x_168 * x_170);
    let x_173 : f32 = u_xlat7;
    u_xlat12 = ((x_173 * 0.0208351f) + -0.085133001f);
    let x_178 : f32 = u_xlat7;
    let x_179 : f32 = u_xlat12;
    u_xlat12 = ((x_178 * x_179) + 0.180141002f);
    let x_183 : f32 = u_xlat7;
    let x_184 : f32 = u_xlat12;
    u_xlat12 = ((x_183 * x_184) + -0.330299497f);
    let x_188 : f32 = u_xlat7;
    let x_189 : f32 = u_xlat12;
    u_xlat7 = ((x_188 * x_189) + 0.999866009f);
    let x_193 : f32 = u_xlat7;
    let x_195 : f32 = u_xlat2.x;
    u_xlat12 = (x_193 * x_195);
    let x_199 : f32 = u_xlat1.x;
    u_xlatb17 = (1.0f < abs(x_199));
    let x_202 : f32 = u_xlat12;
    u_xlat12 = ((x_202 * -2.0f) + 1.570796371f);
    let x_207 : bool = u_xlatb17;
    let x_208 : f32 = u_xlat12;
    u_xlat12 = select(0.0f, x_208, x_207);
    let x_211 : f32 = u_xlat2.x;
    let x_212 : f32 = u_xlat7;
    let x_214 : f32 = u_xlat12;
    u_xlat2.x = ((x_211 * x_212) + x_214);
    let x_218 : f32 = u_xlat1.x;
    u_xlat1.x = min(x_218, 1.0f);
    let x_223 : f32 = u_xlat1.x;
    let x_225 : f32 = u_xlat1.x;
    u_xlatb1 = (x_223 < -(x_225));
    let x_228 : bool = u_xlatb1;
    if (x_228) {
      let x_233 : f32 = u_xlat2.x;
      x_229 = -(x_233);
    } else {
      let x_237 : f32 = u_xlat2.x;
      x_229 = x_237;
    }
    let x_238 : f32 = x_229;
    u_xlat1.x = x_238;
    let x_240 : f32 = u_xlat16;
    let x_242 : f32 = u_xlat1.x;
    u_xlat1.x = ((x_240 * x_242) + -1.0f);
    let x_246 : vec3<f32> = u_xlat0;
    let x_248 : vec4<f32> = u_xlat1;
    let x_251 : vec2<f32> = u_xlat10;
    let x_252 : vec2<f32> = ((vec2<f32>(x_246.x, x_246.y) * vec2<f32>(x_248.x, x_248.x)) + x_251);
    let x_253 : vec3<f32> = u_xlat6;
    u_xlat6 = vec3<f32>(x_252.x, x_252.y, x_253.z);
  }
  let x_265 : vec3<f32> = u_xlat6;
  let x_269 : f32 = x_26.x_GlobalMipBias.x;
  let x_270 : vec4<f32> = textureSampleBias(x_BlitTexture, sampler_LinearClamp, vec2<f32>(x_265.x, x_265.y), x_269);
  u_xlat0 = vec3<f32>(x_270.x, x_270.y, x_270.z);
  let x_276 : f32 = x_26.x_Vignette_Params2.z;
  u_xlatb15 = (0.0f < x_276);
  let x_278 : bool = u_xlatb15;
  if (x_278) {
    let x_281 : vec3<f32> = u_xlat6;
    let x_284 : vec4<f32> = x_26.x_Vignette_Params2;
    let x_287 : vec2<f32> = (vec2<f32>(x_281.x, x_281.y) + -(vec2<f32>(x_284.x, x_284.y)));
    let x_288 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_287.x, x_287.y, x_288.z, x_288.w);
    let x_290 : vec4<f32> = u_xlat1;
    let x_294 : vec4<f32> = x_26.x_Vignette_Params2;
    let x_296 : vec2<f32> = (abs(vec2<f32>(x_290.x, x_290.y)) * vec2<f32>(x_294.z, x_294.z));
    let x_297 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_297.x, x_296.x, x_296.y, x_297.w);
    let x_300 : f32 = u_xlat1.y;
    let x_303 : f32 = x_26.x_Vignette_Params1.w;
    u_xlat1.x = (x_300 * x_303);
    let x_307 : vec4<f32> = u_xlat1;
    let x_309 : vec4<f32> = u_xlat1;
    u_xlat15 = dot(vec2<f32>(x_307.x, x_307.z), vec2<f32>(x_309.x, x_309.z));
    let x_312 : f32 = u_xlat15;
    u_xlat15 = (-(x_312) + 1.0f);
    let x_315 : f32 = u_xlat15;
    u_xlat15 = max(x_315, 0.0f);
    let x_317 : f32 = u_xlat15;
    u_xlat15 = log2(x_317);
    let x_319 : f32 = u_xlat15;
    let x_321 : f32 = x_26.x_Vignette_Params2.w;
    u_xlat15 = (x_319 * x_321);
    let x_323 : f32 = u_xlat15;
    u_xlat15 = exp2(x_323);
    let x_326 : vec4<f32> = x_26.x_Vignette_Params1;
    let x_330 : vec3<f32> = (-(vec3<f32>(x_326.x, x_326.y, x_326.z)) + vec3<f32>(1.0f, 1.0f, 1.0f));
    let x_331 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_330.x, x_330.y, x_330.z, x_331.w);
    let x_333 : f32 = u_xlat15;
    let x_335 : vec4<f32> = u_xlat1;
    let x_339 : vec4<f32> = x_26.x_Vignette_Params1;
    let x_341 : vec3<f32> = ((vec3<f32>(x_333, x_333, x_333) * vec3<f32>(x_335.x, x_335.y, x_335.z)) + vec3<f32>(x_339.x, x_339.y, x_339.z));
    let x_342 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_341.x, x_341.y, x_341.z, x_342.w);
    let x_344 : vec3<f32> = u_xlat0;
    let x_345 : vec4<f32> = u_xlat1;
    u_xlat0 = (x_344 * vec3<f32>(x_345.x, x_345.y, x_345.z));
  }
  let x_348 : vec3<f32> = u_xlat0;
  let x_351 : vec4<f32> = x_26.x_Lut_Params;
  u_xlat0 = (x_348 * vec3<f32>(x_351.w, x_351.w, x_351.w));
  let x_358 : vec3<f32> = u_xlat0;
  u_xlat6.x = dot(vec3<f32>(0.439700991f, 0.382977992f, 0.177334994f), x_358);
  let x_365 : vec3<f32> = u_xlat0;
  u_xlat6.y = dot(vec3<f32>(0.089792296f, 0.813422978f, 0.096761599f), x_365);
  let x_372 : vec3<f32> = u_xlat0;
  u_xlat6.z = dot(vec3<f32>(0.017543999f, 0.111543998f, 0.870703995f), x_372);
  let x_376 : f32 = u_xlat6.y;
  let x_378 : f32 = u_xlat6.x;
  u_xlat0.x = min(x_376, x_378);
  let x_382 : f32 = u_xlat6.z;
  let x_384 : f32 = u_xlat0.x;
  u_xlat0.x = min(x_382, x_384);
  let x_389 : f32 = u_xlat6.y;
  let x_391 : f32 = u_xlat6.x;
  u_xlat5.x = max(x_389, x_391);
  let x_395 : f32 = u_xlat6.z;
  let x_397 : f32 = u_xlat5.x;
  u_xlat0.y = max(x_395, x_397);
  let x_400 : vec3<f32> = u_xlat0;
  u_xlat0 = max(vec3<f32>(x_400.x, x_400.y, x_400.y), vec3<f32>(0.0001f, 0.0001f, 0.01f));
  let x_407 : f32 = u_xlat0.x;
  let x_410 : f32 = u_xlat0.y;
  u_xlat0.x = (-(x_407) + x_410);
  let x_414 : f32 = u_xlat0.x;
  let x_416 : f32 = u_xlat0.z;
  u_xlat0.x = (x_414 / x_416);
  let x_419 : vec3<f32> = u_xlat6;
  let x_422 : vec3<f32> = u_xlat6;
  u_xlat5 = (-(vec3<f32>(x_419.y, x_419.x, x_419.z)) + vec3<f32>(x_422.z, x_422.y, x_422.x));
  let x_425 : vec3<f32> = u_xlat5;
  let x_427 : vec3<f32> = u_xlat6;
  let x_429 : vec2<f32> = (vec2<f32>(x_425.x, x_425.y) * vec2<f32>(x_427.z, x_427.y));
  let x_430 : vec3<f32> = u_xlat5;
  u_xlat5 = vec3<f32>(x_429.x, x_429.y, x_430.z);
  let x_433 : f32 = u_xlat5.y;
  let x_435 : f32 = u_xlat5.x;
  u_xlat5.x = (x_433 + x_435);
  let x_439 : f32 = u_xlat6.x;
  let x_441 : f32 = u_xlat5.z;
  let x_444 : f32 = u_xlat5.x;
  u_xlat5.x = ((x_439 * x_441) + x_444);
  let x_448 : f32 = u_xlat5.x;
  u_xlat5.x = max(x_448, 0.0f);
  let x_452 : f32 = u_xlat5.x;
  u_xlat5.x = sqrt(x_452);
  let x_456 : f32 = u_xlat6.y;
  let x_458 : f32 = u_xlat6.z;
  u_xlat10.x = (x_456 + x_458);
  let x_462 : f32 = u_xlat6.x;
  let x_464 : f32 = u_xlat10.x;
  u_xlat10.x = (x_462 + x_464);
  let x_468 : f32 = u_xlat5.x;
  let x_472 : f32 = u_xlat10.x;
  u_xlat5.x = ((x_468 * 1.75f) + x_472);
  let x_476 : f32 = u_xlat0.x;
  u_xlat15 = (x_476 + -0.400000006f);
  let x_479 : f32 = u_xlat15;
  u_xlat1.x = (x_479 * 2.5f);
  let x_484 : f32 = u_xlat1.x;
  u_xlat1.x = (-(abs(x_484)) + 1.0f);
  let x_490 : f32 = u_xlat1.x;
  u_xlat1.x = max(x_490, 0.0f);
  let x_493 : f32 = u_xlat15;
  u_xlatb15 = (x_493 >= 0.0f);
  let x_495 : bool = u_xlatb15;
  u_xlat15 = select(-1.0f, 1.0f, x_495);
  let x_498 : f32 = u_xlat1.x;
  let x_501 : f32 = u_xlat1.x;
  u_xlat1.x = ((-(x_498) * x_501) + 1.0f);
  let x_505 : f32 = u_xlat15;
  let x_507 : f32 = u_xlat1.x;
  u_xlat5.z = ((x_505 * x_507) + 1.0f);
  let x_511 : vec3<f32> = u_xlat5;
  u_xlat10 = (vec2<f32>(x_511.x, x_511.z) * vec2<f32>(0.333333343f, 0.025f));
  let x_519 : f32 = u_xlat5.x;
  u_xlatb1 = (0.159999996f >= x_519);
  let x_523 : f32 = u_xlat5.x;
  u_xlatb5 = (x_523 >= 0.479999989f);
  let x_528 : f32 = u_xlat10.x;
  u_xlat10.x = (0.079999998f / x_528);
  let x_532 : f32 = u_xlat10.x;
  u_xlat10.x = (x_532 + -0.5f);
  let x_536 : f32 = u_xlat10.x;
  let x_538 : f32 = u_xlat10.y;
  u_xlat10.x = (x_536 * x_538);
  let x_541 : bool = u_xlatb5;
  if (x_541) {
    x_542 = 0.0f;
  } else {
    let x_547 : f32 = u_xlat10.x;
    x_542 = x_547;
  }
  let x_548 : f32 = x_542;
  u_xlat5.x = x_548;
  let x_550 : bool = u_xlatb1;
  if (x_550) {
    let x_555 : f32 = u_xlat10.y;
    x_551 = x_555;
  } else {
    let x_558 : f32 = u_xlat5.x;
    x_551 = x_558;
  }
  let x_559 : f32 = x_551;
  u_xlat5.x = x_559;
  let x_562 : f32 = u_xlat5.x;
  u_xlat5.x = (x_562 + 1.0f);
  let x_565 : vec3<f32> = u_xlat5;
  let x_567 : vec3<f32> = u_xlat6;
  let x_568 : vec3<f32> = (vec3<f32>(x_565.x, x_565.x, x_565.x) * x_567);
  let x_569 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_569.x, x_568.x, x_568.y, x_568.z);
  let x_574 : vec4<f32> = u_xlat2;
  let x_576 : vec4<f32> = u_xlat2;
  let x_579 : vec4<bool> = (vec4<f32>(x_574.z, x_574.w, x_574.z, x_574.w) == vec4<f32>(x_576.y, x_576.z, x_576.y, x_576.z));
  u_xlatb10 = vec2<bool>(x_579.x, x_579.y);
  let x_582 : bool = u_xlatb10.y;
  let x_584 : bool = u_xlatb10.x;
  u_xlatb10.x = (x_582 & x_584);
  let x_588 : f32 = u_xlat6.y;
  let x_590 : f32 = u_xlat5.x;
  let x_593 : f32 = u_xlat2.w;
  u_xlat15 = ((x_588 * x_590) + -(x_593));
  let x_596 : f32 = u_xlat15;
  u_xlat15 = (x_596 * 1.732050776f);
  let x_600 : f32 = u_xlat2.y;
  let x_604 : f32 = u_xlat2.z;
  u_xlat1.x = ((x_600 * 2.0f) + -(x_604));
  let x_609 : f32 = u_xlat6.z;
  let x_612 : f32 = u_xlat5.x;
  let x_615 : f32 = u_xlat1.x;
  u_xlat1.x = ((-(x_609) * x_612) + x_615);
  let x_618 : f32 = u_xlat15;
  let x_621 : f32 = u_xlat1.x;
  u_xlat11.x = min(abs(x_618), abs(x_621));
  let x_625 : f32 = u_xlat15;
  let x_628 : f32 = u_xlat1.x;
  u_xlat16 = max(abs(x_625), abs(x_628));
  let x_631 : f32 = u_xlat16;
  u_xlat16 = (1.0f / x_631);
  let x_633 : f32 = u_xlat16;
  let x_635 : f32 = u_xlat11.x;
  u_xlat11.x = (x_633 * x_635);
  let x_639 : f32 = u_xlat11.x;
  let x_641 : f32 = u_xlat11.x;
  u_xlat16 = (x_639 * x_641);
  let x_643 : f32 = u_xlat16;
  u_xlat3.x = ((x_643 * 0.0208351f) + -0.085133001f);
  let x_647 : f32 = u_xlat16;
  let x_649 : f32 = u_xlat3.x;
  u_xlat3.x = ((x_647 * x_649) + 0.180141002f);
  let x_653 : f32 = u_xlat16;
  let x_655 : f32 = u_xlat3.x;
  u_xlat3.x = ((x_653 * x_655) + -0.330299497f);
  let x_659 : f32 = u_xlat16;
  let x_661 : f32 = u_xlat3.x;
  u_xlat16 = ((x_659 * x_661) + 0.999866009f);
  let x_664 : f32 = u_xlat16;
  let x_666 : f32 = u_xlat11.x;
  u_xlat3.x = (x_664 * x_666);
  let x_671 : f32 = u_xlat1.x;
  let x_673 : f32 = u_xlat15;
  u_xlatb8 = (abs(x_671) < abs(x_673));
  let x_677 : f32 = u_xlat3.x;
  u_xlat3.x = ((x_677 * -2.0f) + 1.570796371f);
  let x_681 : bool = u_xlatb8;
  if (x_681) {
    let x_686 : f32 = u_xlat3.x;
    x_682 = x_686;
  } else {
    x_682 = 0.0f;
  }
  let x_688 : f32 = x_682;
  u_xlat3.x = x_688;
  let x_691 : f32 = u_xlat11.x;
  let x_692 : f32 = u_xlat16;
  let x_695 : f32 = u_xlat3.x;
  u_xlat11.x = ((x_691 * x_692) + x_695);
  let x_700 : f32 = u_xlat1.x;
  let x_702 : f32 = u_xlat1.x;
  u_xlatb16 = (x_700 < -(x_702));
  let x_705 : bool = u_xlatb16;
  u_xlat16 = select(0.0f, -3.141592741f, x_705);
  let x_708 : f32 = u_xlat16;
  let x_710 : f32 = u_xlat11.x;
  u_xlat11.x = (x_708 + x_710);
  let x_713 : f32 = u_xlat15;
  let x_715 : f32 = u_xlat1.x;
  u_xlat16 = min(x_713, x_715);
  let x_717 : f32 = u_xlat15;
  let x_719 : f32 = u_xlat1.x;
  u_xlat15 = max(x_717, x_719);
  let x_721 : f32 = u_xlat16;
  let x_722 : f32 = u_xlat16;
  u_xlatb1 = (x_721 < -(x_722));
  let x_725 : f32 = u_xlat15;
  let x_726 : f32 = u_xlat15;
  u_xlatb15 = (x_725 >= -(x_726));
  let x_729 : bool = u_xlatb15;
  let x_730 : bool = u_xlatb1;
  u_xlatb15 = (x_729 & x_730);
  let x_732 : bool = u_xlatb15;
  if (x_732) {
    let x_737 : f32 = u_xlat11.x;
    x_733 = -(x_737);
  } else {
    let x_741 : f32 = u_xlat11.x;
    x_733 = x_741;
  }
  let x_742 : f32 = x_733;
  u_xlat15 = x_742;
  let x_743 : f32 = u_xlat15;
  u_xlat15 = (x_743 * 57.295780182f);
  let x_747 : bool = u_xlatb10.x;
  let x_748 : f32 = u_xlat15;
  u_xlat10.x = select(x_748, 0.0f, x_747);
  let x_752 : f32 = u_xlat10.x;
  u_xlatb15 = (x_752 < 0.0f);
  let x_755 : f32 = u_xlat10.x;
  u_xlat1.x = (x_755 + 360.0f);
  let x_759 : bool = u_xlatb15;
  if (x_759) {
    let x_764 : f32 = u_xlat1.x;
    x_760 = x_764;
  } else {
    let x_767 : f32 = u_xlat10.x;
    x_760 = x_767;
  }
  let x_768 : f32 = x_760;
  u_xlat10.x = x_768;
  let x_771 : f32 = u_xlat10.x;
  u_xlatb15 = (x_771 < -180.0f);
  let x_776 : f32 = u_xlat10.x;
  u_xlatb1 = (180.0f < x_776);
  let x_778 : vec2<f32> = u_xlat10;
  u_xlat11 = (vec2<f32>(x_778.x, x_778.x) + vec2<f32>(360.0f, -360.0f));
  let x_783 : bool = u_xlatb1;
  if (x_783) {
    let x_788 : f32 = u_xlat11.y;
    x_784 = x_788;
  } else {
    let x_791 : f32 = u_xlat10.x;
    x_784 = x_791;
  }
  let x_792 : f32 = x_784;
  u_xlat10.x = x_792;
  let x_794 : bool = u_xlatb15;
  if (x_794) {
    let x_799 : f32 = u_xlat11.x;
    x_795 = x_799;
  } else {
    let x_802 : f32 = u_xlat10.x;
    x_795 = x_802;
  }
  let x_803 : f32 = x_795;
  u_xlat10.x = x_803;
  let x_806 : f32 = u_xlat10.x;
  u_xlat10.x = (x_806 * 0.014814815f);
  let x_811 : f32 = u_xlat10.x;
  u_xlat10.x = (-(abs(x_811)) + 1.0f);
  let x_817 : f32 = u_xlat10.x;
  u_xlat10.x = max(x_817, 0.0f);
  let x_821 : f32 = u_xlat10.x;
  u_xlat15 = ((x_821 * -2.0f) + 3.0f);
  let x_826 : f32 = u_xlat10.x;
  let x_828 : f32 = u_xlat10.x;
  u_xlat10.x = (x_826 * x_828);
  let x_832 : f32 = u_xlat10.x;
  let x_833 : f32 = u_xlat15;
  u_xlat10.x = (x_832 * x_833);
  let x_837 : f32 = u_xlat10.x;
  let x_839 : f32 = u_xlat10.x;
  u_xlat10.x = (x_837 * x_839);
  let x_843 : f32 = u_xlat0.x;
  let x_845 : f32 = u_xlat10.x;
  u_xlat0.x = (x_843 * x_845);
  let x_849 : f32 = u_xlat6.x;
  let x_852 : f32 = u_xlat5.x;
  u_xlat5.x = ((-(x_849) * x_852) + 0.029999999f);
  let x_858 : f32 = u_xlat5.x;
  let x_860 : f32 = u_xlat0.x;
  u_xlat0.x = (x_858 * x_860);
  let x_864 : f32 = u_xlat0.x;
  let x_868 : f32 = u_xlat2.y;
  u_xlat2.x = ((x_864 * 0.180000007f) + x_868);
  let x_875 : vec4<f32> = u_xlat2;
  u_xlat0.x = dot(vec3<f32>(1.451439261f, -0.236510754f, -0.214928567f), vec3<f32>(x_875.x, x_875.z, x_875.w));
  let x_883 : vec4<f32> = u_xlat2;
  u_xlat0.y = dot(vec3<f32>(-0.076553777f, 1.176229715f, -0.099675924f), vec3<f32>(x_883.x, x_883.z, x_883.w));
  let x_891 : vec4<f32> = u_xlat2;
  u_xlat0.z = dot(vec3<f32>(0.008316148f, -0.00603244966f, 0.997716308f), vec3<f32>(x_891.x, x_891.z, x_891.w));
  let x_895 : vec3<f32> = u_xlat0;
  u_xlat0 = max(x_895, vec3<f32>(0.0f, 0.0f, 0.0f));
  let x_898 : vec3<f32> = u_xlat0;
  u_xlat15 = dot(x_898, vec3<f32>(0.272228986f, 0.674081981f, 0.053689498f));
  let x_904 : f32 = u_xlat15;
  let x_907 : vec3<f32> = u_xlat0;
  u_xlat0 = (-(vec3<f32>(x_904, x_904, x_904)) + x_907);
  let x_909 : vec3<f32> = u_xlat0;
  let x_913 : f32 = u_xlat15;
  u_xlat0 = ((x_909 * vec3<f32>(0.959999979f, 0.959999979f, 0.959999979f)) + vec3<f32>(x_913, x_913, x_913));
  let x_916 : vec3<f32> = u_xlat0;
  let x_919 : vec3<f32> = (x_916 + vec3<f32>(0.024578599f, 0.024578599f, 0.024578599f));
  let x_920 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_919.x, x_919.y, x_919.z, x_920.w);
  let x_922 : vec3<f32> = u_xlat0;
  let x_923 : vec4<f32> = u_xlat1;
  let x_928 : vec3<f32> = ((x_922 * vec3<f32>(x_923.x, x_923.y, x_923.z)) + vec3<f32>(-0.000090537f, -0.000090537f, -0.000090537f));
  let x_929 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_928.x, x_928.y, x_928.z, x_929.w);
  let x_931 : vec3<f32> = u_xlat0;
  let x_937 : vec3<f32> = ((x_931 * vec3<f32>(0.983729005f, 0.983729005f, 0.983729005f)) + vec3<f32>(0.432951003f, 0.432951003f, 0.432951003f));
  let x_938 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_937.x, x_937.y, x_937.z, x_938.w);
  let x_940 : vec3<f32> = u_xlat0;
  let x_941 : vec4<f32> = u_xlat2;
  u_xlat0 = ((x_940 * vec3<f32>(x_941.x, x_941.y, x_941.z)) + vec3<f32>(0.238080993f, 0.238080993f, 0.238080993f));
  let x_947 : vec4<f32> = u_xlat1;
  let x_949 : vec3<f32> = u_xlat0;
  u_xlat0 = (vec3<f32>(x_947.x, x_947.y, x_947.z) / x_949);
  let x_955 : vec3<f32> = u_xlat0;
  u_xlat1.x = dot(vec3<f32>(0.662454188f, 0.134004205f, 0.156187683f), x_955);
  let x_962 : vec3<f32> = u_xlat0;
  u_xlat1.y = dot(vec3<f32>(0.272228718f, 0.674081743f, 0.053689517f), x_962);
  let x_969 : vec3<f32> = u_xlat0;
  u_xlat1.z = dot(vec3<f32>(-0.00557464967f, 0.0040607336f, 1.010339141f), x_969);
  let x_972 : vec4<f32> = u_xlat1;
  u_xlat0.x = dot(vec3<f32>(x_972.x, x_972.y, x_972.z), vec3<f32>(1.0f, 1.0f, 1.0f));
  let x_977 : f32 = u_xlat0.x;
  u_xlat0.x = max(x_977, 0.0001f);
  let x_980 : vec4<f32> = u_xlat1;
  let x_982 : vec3<f32> = u_xlat0;
  let x_984 : vec2<f32> = (vec2<f32>(x_980.x, x_980.y) / vec2<f32>(x_982.x, x_982.x));
  let x_985 : vec3<f32> = u_xlat0;
  u_xlat0 = vec3<f32>(x_984.x, x_984.y, x_985.z);
  let x_988 : f32 = u_xlat1.y;
  u_xlat15 = max(x_988, 0.0f);
  let x_990 : f32 = u_xlat15;
  u_xlat15 = min(x_990, 65504.0f);
  let x_993 : f32 = u_xlat15;
  u_xlat15 = log2(x_993);
  let x_995 : f32 = u_xlat15;
  u_xlat15 = (x_995 * 0.981100023f);
  let x_998 : f32 = u_xlat15;
  u_xlat1.y = exp2(x_998);
  let x_1002 : f32 = u_xlat0.y;
  u_xlat15 = max(x_1002, 0.0001f);
  let x_1005 : f32 = u_xlat1.y;
  let x_1006 : f32 = u_xlat15;
  u_xlat15 = (x_1005 / x_1006);
  let x_1009 : f32 = u_xlat0.x;
  u_xlat16 = (-(x_1009) + 1.0f);
  let x_1013 : f32 = u_xlat0.y;
  let x_1015 : f32 = u_xlat16;
  u_xlat0.z = (-(x_1013) + x_1015);
  let x_1018 : f32 = u_xlat15;
  let x_1020 : vec3<f32> = u_xlat0;
  let x_1022 : vec2<f32> = (vec2<f32>(x_1018, x_1018) * vec2<f32>(x_1020.x, x_1020.z));
  let x_1023 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1022.x, x_1023.y, x_1022.y, x_1023.w);
  let x_1029 : vec4<f32> = u_xlat1;
  u_xlat0.x = dot(vec3<f32>(1.641023397f, -0.324803293f, -0.236424699f), vec3<f32>(x_1029.x, x_1029.y, x_1029.z));
  let x_1037 : vec4<f32> = u_xlat1;
  u_xlat0.y = dot(vec3<f32>(-0.663662851f, 1.61533165f, 0.016756348f), vec3<f32>(x_1037.x, x_1037.y, x_1037.z));
  let x_1045 : vec4<f32> = u_xlat1;
  u_xlat0.z = dot(vec3<f32>(0.011721894f, -0.008284442f, 0.988394856f), vec3<f32>(x_1045.x, x_1045.y, x_1045.z));
  let x_1049 : vec3<f32> = u_xlat0;
  u_xlat15 = dot(x_1049, vec3<f32>(0.272228986f, 0.674081981f, 0.053689498f));
  let x_1051 : f32 = u_xlat15;
  let x_1054 : vec3<f32> = u_xlat0;
  u_xlat0 = (-(vec3<f32>(x_1051, x_1051, x_1051)) + x_1054);
  let x_1056 : vec3<f32> = u_xlat0;
  let x_1060 : f32 = u_xlat15;
  u_xlat0 = ((x_1056 * vec3<f32>(0.930000007f, 0.930000007f, 0.930000007f)) + vec3<f32>(x_1060, x_1060, x_1060));
  let x_1063 : vec3<f32> = u_xlat0;
  u_xlat1.x = dot(vec3<f32>(0.662454188f, 0.134004205f, 0.156187683f), x_1063);
  let x_1066 : vec3<f32> = u_xlat0;
  u_xlat1.y = dot(vec3<f32>(0.272228718f, 0.674081743f, 0.053689517f), x_1066);
  let x_1069 : vec3<f32> = u_xlat0;
  u_xlat1.z = dot(vec3<f32>(-0.00557464967f, 0.0040607336f, 1.010339141f), x_1069);
  let x_1076 : vec4<f32> = u_xlat1;
  u_xlat0.x = dot(vec3<f32>(0.987223983f, -0.00611327f, 0.015953301f), vec3<f32>(x_1076.x, x_1076.y, x_1076.z));
  let x_1084 : vec4<f32> = u_xlat1;
  u_xlat0.y = dot(vec3<f32>(-0.00759836f, 1.001860023f, 0.0053302f), vec3<f32>(x_1084.x, x_1084.y, x_1084.z));
  let x_1092 : vec4<f32> = u_xlat1;
  u_xlat0.z = dot(vec3<f32>(0.00307257f, -0.00509595f, 1.081680059f), vec3<f32>(x_1092.x, x_1092.y, x_1092.z));
  let x_1100 : vec3<f32> = u_xlat0;
  u_xlat1.x = dot(vec3<f32>(3.240969896f, -1.537383199f, -0.498610765f), x_1100);
  let x_1104 : f32 = u_xlat1.x;
  u_xlat1.x = clamp(x_1104, 0.0f, 1.0f);
  let x_1111 : vec3<f32> = u_xlat0;
  u_xlat1.y = dot(vec3<f32>(-0.969243646f, 1.875967503f, 0.041555058f), x_1111);
  let x_1115 : f32 = u_xlat1.y;
  u_xlat1.y = clamp(x_1115, 0.0f, 1.0f);
  let x_1122 : vec3<f32> = u_xlat0;
  u_xlat1.z = dot(vec3<f32>(0.05563008f, -0.203976959f, 1.05697155f), x_1122);
  let x_1126 : f32 = u_xlat1.z;
  u_xlat1.z = clamp(x_1126, 0.0f, 1.0f);
  let x_1134 : f32 = x_26.x_UserLut_Params.w;
  u_xlatb0.x = (0.0f < x_1134);
  let x_1138 : bool = u_xlatb0.x;
  if (x_1138) {
    let x_1141 : vec4<f32> = u_xlat1;
    u_xlat0 = (vec3<f32>(x_1141.x, x_1141.y, x_1141.z) * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
    let x_1146 : vec4<f32> = u_xlat1;
    let x_1148 : vec3<f32> = log2(vec3<f32>(x_1146.x, x_1146.y, x_1146.z));
    let x_1149 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1148.x, x_1148.y, x_1148.z, x_1149.w);
    let x_1151 : vec4<f32> = u_xlat2;
    let x_1155 : vec3<f32> = (vec3<f32>(x_1151.x, x_1151.y, x_1151.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
    let x_1156 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1155.x, x_1155.y, x_1155.z, x_1156.w);
    let x_1158 : vec4<f32> = u_xlat2;
    let x_1160 : vec3<f32> = exp2(vec3<f32>(x_1158.x, x_1158.y, x_1158.z));
    let x_1161 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1160.x, x_1160.y, x_1160.z, x_1161.w);
    let x_1163 : vec4<f32> = u_xlat2;
    let x_1170 : vec3<f32> = ((vec3<f32>(x_1163.x, x_1163.y, x_1163.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    let x_1171 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1170.x, x_1170.y, x_1170.z, x_1171.w);
    let x_1176 : vec4<f32> = u_xlat1;
    let x_1178 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_1176.x, x_1176.y, x_1176.z, x_1176.x));
    u_xlatb3 = vec3<bool>(x_1178.x, x_1178.y, x_1178.z);
    let x_1181 : vec3<f32> = u_xlat0;
    hlslcc_movcTemp = x_1181;
    let x_1183 : bool = u_xlatb3.x;
    if (x_1183) {
      let x_1188 : f32 = u_xlat0.x;
      x_1184 = x_1188;
    } else {
      let x_1191 : f32 = u_xlat2.x;
      x_1184 = x_1191;
    }
    let x_1192 : f32 = x_1184;
    hlslcc_movcTemp.x = x_1192;
    let x_1195 : bool = u_xlatb3.y;
    if (x_1195) {
      let x_1200 : f32 = u_xlat0.y;
      x_1196 = x_1200;
    } else {
      let x_1203 : f32 = u_xlat2.y;
      x_1196 = x_1203;
    }
    let x_1204 : f32 = x_1196;
    hlslcc_movcTemp.y = x_1204;
    let x_1207 : bool = u_xlatb3.z;
    if (x_1207) {
      let x_1212 : f32 = u_xlat0.z;
      x_1208 = x_1212;
    } else {
      let x_1215 : f32 = u_xlat2.z;
      x_1208 = x_1215;
    }
    let x_1216 : f32 = x_1208;
    hlslcc_movcTemp.z = x_1216;
    let x_1218 : vec3<f32> = hlslcc_movcTemp;
    u_xlat0 = x_1218;
    let x_1219 : vec3<f32> = u_xlat0;
    let x_1222 : vec4<f32> = x_26.x_UserLut_Params;
    let x_1224 : vec3<f32> = (vec3<f32>(x_1219.z, x_1219.x, x_1219.y) * vec3<f32>(x_1222.z, x_1222.z, x_1222.z));
    let x_1225 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1224.x, x_1224.y, x_1224.z, x_1225.w);
    let x_1228 : f32 = u_xlat2.x;
    u_xlat15 = floor(x_1228);
    let x_1231 : vec4<f32> = x_26.x_UserLut_Params;
    let x_1233 : vec2<f32> = (vec2<f32>(x_1231.x, x_1231.y) * vec2<f32>(0.5f, 0.5f));
    let x_1234 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1233.x, x_1234.y, x_1234.z, x_1233.y);
    let x_1236 : vec4<f32> = u_xlat2;
    let x_1239 : vec4<f32> = x_26.x_UserLut_Params;
    let x_1242 : vec4<f32> = u_xlat2;
    let x_1244 : vec2<f32> = ((vec2<f32>(x_1236.y, x_1236.z) * vec2<f32>(x_1239.x, x_1239.y)) + vec2<f32>(x_1242.x, x_1242.w));
    let x_1245 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1245.x, x_1244.x, x_1244.y, x_1245.w);
    let x_1247 : f32 = u_xlat15;
    let x_1249 : f32 = x_26.x_UserLut_Params.y;
    let x_1252 : f32 = u_xlat2.y;
    u_xlat2.x = ((x_1247 * x_1249) + x_1252);
    let x_1259 : vec4<f32> = u_xlat2;
    let x_1261 : vec4<f32> = textureSampleLevel(x_UserLut, sampler_LinearClamp, vec2<f32>(x_1259.x, x_1259.z), 0.0f);
    u_xlat3 = vec3<f32>(x_1261.x, x_1261.y, x_1261.z);
    let x_1265 : f32 = x_26.x_UserLut_Params.y;
    u_xlat4.x = x_1265;
    u_xlat4.y = 0.0f;
    let x_1268 : vec4<f32> = u_xlat2;
    let x_1270 : vec2<f32> = u_xlat4;
    let x_1271 : vec2<f32> = (vec2<f32>(x_1268.x, x_1268.z) + x_1270);
    let x_1272 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1271.x, x_1271.y, x_1272.z, x_1272.w);
    let x_1277 : vec4<f32> = u_xlat2;
    let x_1279 : vec4<f32> = textureSampleLevel(x_UserLut, sampler_LinearClamp, vec2<f32>(x_1277.x, x_1277.y), 0.0f);
    let x_1280 : vec3<f32> = vec3<f32>(x_1279.x, x_1279.y, x_1279.z);
    let x_1281 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1280.x, x_1280.y, x_1280.z, x_1281.w);
    let x_1284 : f32 = u_xlat0.z;
    let x_1286 : f32 = x_26.x_UserLut_Params.z;
    let x_1288 : f32 = u_xlat15;
    u_xlat15 = ((x_1284 * x_1286) + -(x_1288));
    let x_1291 : vec3<f32> = u_xlat3;
    let x_1293 : vec4<f32> = u_xlat2;
    let x_1295 : vec3<f32> = (-(x_1291) + vec3<f32>(x_1293.x, x_1293.y, x_1293.z));
    let x_1296 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1295.x, x_1295.y, x_1295.z, x_1296.w);
    let x_1298 : f32 = u_xlat15;
    let x_1300 : vec4<f32> = u_xlat2;
    let x_1303 : vec3<f32> = u_xlat3;
    let x_1304 : vec3<f32> = ((vec3<f32>(x_1298, x_1298, x_1298) * vec3<f32>(x_1300.x, x_1300.y, x_1300.z)) + x_1303);
    let x_1305 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1304.x, x_1304.y, x_1304.z, x_1305.w);
    let x_1307 : vec3<f32> = u_xlat0;
    let x_1309 : vec4<f32> = u_xlat2;
    let x_1311 : vec3<f32> = (-(x_1307) + vec3<f32>(x_1309.x, x_1309.y, x_1309.z));
    let x_1312 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1311.x, x_1311.y, x_1311.z, x_1312.w);
    let x_1315 : vec4<f32> = x_26.x_UserLut_Params;
    let x_1317 : vec4<f32> = u_xlat2;
    let x_1320 : vec3<f32> = u_xlat0;
    u_xlat0 = ((vec3<f32>(x_1315.w, x_1315.w, x_1315.w) * vec3<f32>(x_1317.x, x_1317.y, x_1317.z)) + x_1320);
    let x_1322 : vec3<f32> = u_xlat0;
    let x_1325 : vec3<f32> = (x_1322 * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
    let x_1326 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_1325.x, x_1325.y, x_1325.z, x_1326.w);
    let x_1328 : vec3<f32> = u_xlat0;
    u_xlat3 = (x_1328 + vec3<f32>(0.055f, 0.055f, 0.055f));
    let x_1332 : vec3<f32> = u_xlat3;
    u_xlat3 = (x_1332 * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
    let x_1336 : vec3<f32> = u_xlat3;
    u_xlat3 = log2(abs(x_1336));
    let x_1339 : vec3<f32> = u_xlat3;
    u_xlat3 = (x_1339 * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
    let x_1343 : vec3<f32> = u_xlat3;
    u_xlat3 = exp2(x_1343);
    let x_1347 : vec3<f32> = u_xlat0;
    let x_1349 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_1347.x, x_1347.y, x_1347.z, x_1347.x));
    u_xlatb0 = vec3<bool>(x_1349.x, x_1349.y, x_1349.z);
    let x_1352 : bool = u_xlatb0.x;
    if (x_1352) {
      let x_1357 : f32 = u_xlat2.x;
      x_1353 = x_1357;
    } else {
      let x_1360 : f32 = u_xlat3.x;
      x_1353 = x_1360;
    }
    let x_1361 : f32 = x_1353;
    u_xlat1.x = x_1361;
    let x_1364 : bool = u_xlatb0.y;
    if (x_1364) {
      let x_1369 : f32 = u_xlat2.y;
      x_1365 = x_1369;
    } else {
      let x_1372 : f32 = u_xlat3.y;
      x_1365 = x_1372;
    }
    let x_1373 : f32 = x_1365;
    u_xlat1.y = x_1373;
    let x_1376 : bool = u_xlatb0.z;
    if (x_1376) {
      let x_1381 : f32 = u_xlat2.z;
      x_1377 = x_1381;
    } else {
      let x_1384 : f32 = u_xlat3.z;
      x_1377 = x_1384;
    }
    let x_1385 : f32 = x_1377;
    u_xlat1.z = x_1385;
  }
  let x_1387 : vec4<f32> = u_xlat1;
  let x_1390 : vec4<f32> = x_26.x_Lut_Params;
  u_xlat0 = (vec3<f32>(x_1387.z, x_1387.x, x_1387.y) * vec3<f32>(x_1390.z, x_1390.z, x_1390.z));
  let x_1394 : f32 = u_xlat0.x;
  u_xlat0.x = floor(x_1394);
  let x_1398 : vec4<f32> = x_26.x_Lut_Params;
  let x_1400 : vec2<f32> = (vec2<f32>(x_1398.x, x_1398.y) * vec2<f32>(0.5f, 0.5f));
  let x_1401 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1400.x, x_1400.y, x_1401.z, x_1401.w);
  let x_1403 : vec3<f32> = u_xlat0;
  let x_1406 : vec4<f32> = x_26.x_Lut_Params;
  let x_1409 : vec4<f32> = u_xlat1;
  let x_1411 : vec2<f32> = ((vec2<f32>(x_1403.y, x_1403.z) * vec2<f32>(x_1406.x, x_1406.y)) + vec2<f32>(x_1409.x, x_1409.y));
  let x_1412 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1412.x, x_1411.x, x_1411.y, x_1412.w);
  let x_1415 : f32 = u_xlat0.x;
  let x_1417 : f32 = x_26.x_Lut_Params.y;
  let x_1420 : f32 = u_xlat2.y;
  u_xlat2.x = ((x_1415 * x_1417) + x_1420);
  let x_1427 : vec4<f32> = u_xlat2;
  let x_1429 : vec4<f32> = textureSampleLevel(x_InternalLut, sampler_LinearClamp, vec2<f32>(x_1427.x, x_1427.z), 0.0f);
  u_xlat5 = vec3<f32>(x_1429.x, x_1429.y, x_1429.z);
  let x_1432 : f32 = x_26.x_Lut_Params.y;
  u_xlat1.x = x_1432;
  u_xlat1.y = 0.0f;
  let x_1435 : vec4<f32> = u_xlat1;
  let x_1437 : vec4<f32> = u_xlat2;
  let x_1439 : vec2<f32> = (vec2<f32>(x_1435.x, x_1435.y) + vec2<f32>(x_1437.x, x_1437.z));
  let x_1440 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1439.x, x_1439.y, x_1440.z, x_1440.w);
  let x_1445 : vec4<f32> = u_xlat1;
  let x_1447 : vec4<f32> = textureSampleLevel(x_InternalLut, sampler_LinearClamp, vec2<f32>(x_1445.x, x_1445.y), 0.0f);
  let x_1448 : vec3<f32> = vec3<f32>(x_1447.x, x_1447.y, x_1447.z);
  let x_1449 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1448.x, x_1448.y, x_1449.z, x_1448.z);
  let x_1452 : f32 = u_xlat1.z;
  let x_1454 : f32 = x_26.x_Lut_Params.z;
  let x_1457 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1452 * x_1454) + -(x_1457));
  let x_1461 : vec3<f32> = u_xlat5;
  let x_1463 : vec4<f32> = u_xlat1;
  let x_1465 : vec3<f32> = (-(x_1461) + vec3<f32>(x_1463.x, x_1463.y, x_1463.w));
  let x_1466 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1465.x, x_1465.y, x_1465.z, x_1466.w);
  let x_1468 : vec3<f32> = u_xlat0;
  let x_1470 : vec4<f32> = u_xlat1;
  let x_1473 : vec3<f32> = u_xlat5;
  u_xlat0 = ((vec3<f32>(x_1468.x, x_1468.x, x_1468.x) * vec3<f32>(x_1470.x, x_1470.y, x_1470.z)) + x_1473);
  let x_1475 : vec3<f32> = u_xlat0;
  u_xlat0 = sqrt(x_1475);
  let x_1477 : vec2<f32> = vs_TEXCOORD0;
  let x_1480 : vec4<f32> = x_26.x_Dithering_Params;
  let x_1484 : vec4<f32> = x_26.x_Dithering_Params;
  let x_1486 : vec2<f32> = ((x_1477 * vec2<f32>(x_1480.x, x_1480.y)) + vec2<f32>(x_1484.z, x_1484.w));
  let x_1487 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1486.x, x_1486.y, x_1487.z, x_1487.w);
  let x_1494 : vec4<f32> = u_xlat1;
  let x_1497 : f32 = x_26.x_GlobalMipBias.x;
  let x_1498 : vec4<f32> = textureSampleBias(x_BlueNoise_Texture, sampler_PointRepeat, vec2<f32>(x_1494.x, x_1494.y), x_1497);
  u_xlat15 = x_1498.w;
  let x_1500 : f32 = u_xlat15;
  u_xlat15 = ((x_1500 * 2.0f) + -1.0f);
  let x_1503 : f32 = u_xlat15;
  u_xlatb1 = (x_1503 >= 0.0f);
  let x_1505 : bool = u_xlatb1;
  u_xlat1.x = select(-1.0f, 1.0f, x_1505);
  let x_1508 : f32 = u_xlat15;
  u_xlat15 = (-(abs(x_1508)) + 1.0f);
  let x_1512 : f32 = u_xlat15;
  u_xlat15 = sqrt(x_1512);
  let x_1514 : f32 = u_xlat15;
  u_xlat15 = (-(x_1514) + 1.0f);
  let x_1517 : f32 = u_xlat15;
  let x_1519 : f32 = u_xlat1.x;
  u_xlat15 = (x_1517 * x_1519);
  let x_1521 : vec3<f32> = u_xlat0;
  let x_1522 : vec3<f32> = (x_1521 * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
  let x_1523 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1522.x, x_1522.y, x_1522.z, x_1523.w);
  let x_1525 : vec3<f32> = u_xlat0;
  let x_1526 : vec3<f32> = log2(x_1525);
  let x_1527 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1526.x, x_1526.y, x_1526.z, x_1527.w);
  let x_1529 : vec4<f32> = u_xlat2;
  let x_1531 : vec3<f32> = (vec3<f32>(x_1529.x, x_1529.y, x_1529.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
  let x_1532 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1531.x, x_1531.y, x_1531.z, x_1532.w);
  let x_1534 : vec4<f32> = u_xlat2;
  let x_1536 : vec3<f32> = exp2(vec3<f32>(x_1534.x, x_1534.y, x_1534.z));
  let x_1537 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1536.x, x_1536.y, x_1536.z, x_1537.w);
  let x_1539 : vec4<f32> = u_xlat2;
  let x_1542 : vec3<f32> = ((vec3<f32>(x_1539.x, x_1539.y, x_1539.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
  let x_1543 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1542.x, x_1542.y, x_1542.z, x_1543.w);
  let x_1545 : vec3<f32> = u_xlat0;
  let x_1547 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_1545.x, x_1545.y, x_1545.z, x_1545.x));
  u_xlatb0 = vec3<bool>(x_1547.x, x_1547.y, x_1547.z);
  let x_1550 : bool = u_xlatb0.x;
  if (x_1550) {
    let x_1555 : f32 = u_xlat1.x;
    x_1551 = x_1555;
  } else {
    let x_1558 : f32 = u_xlat2.x;
    x_1551 = x_1558;
  }
  let x_1559 : f32 = x_1551;
  u_xlat0.x = x_1559;
  let x_1562 : bool = u_xlatb0.y;
  if (x_1562) {
    let x_1567 : f32 = u_xlat1.y;
    x_1563 = x_1567;
  } else {
    let x_1570 : f32 = u_xlat2.y;
    x_1563 = x_1570;
  }
  let x_1571 : f32 = x_1563;
  u_xlat0.y = x_1571;
  let x_1574 : bool = u_xlatb0.z;
  if (x_1574) {
    let x_1579 : f32 = u_xlat1.z;
    x_1575 = x_1579;
  } else {
    let x_1582 : f32 = u_xlat2.z;
    x_1575 = x_1582;
  }
  let x_1583 : f32 = x_1575;
  u_xlat0.z = x_1583;
  let x_1585 : f32 = u_xlat15;
  let x_1590 : vec3<f32> = u_xlat0;
  u_xlat0 = ((vec3<f32>(x_1585, x_1585, x_1585) * vec3<f32>(0.003921569f, 0.003921569f, 0.003921569f)) + x_1590);
  let x_1592 : vec3<f32> = u_xlat0;
  let x_1593 : vec3<f32> = (x_1592 * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
  let x_1594 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1593.x, x_1593.y, x_1593.z, x_1594.w);
  let x_1596 : vec3<f32> = u_xlat0;
  let x_1597 : vec3<f32> = (x_1596 + vec3<f32>(0.055f, 0.055f, 0.055f));
  let x_1598 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1597.x, x_1597.y, x_1597.z, x_1598.w);
  let x_1600 : vec4<f32> = u_xlat2;
  let x_1602 : vec3<f32> = (vec3<f32>(x_1600.x, x_1600.y, x_1600.z) * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
  let x_1603 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1602.x, x_1602.y, x_1602.z, x_1603.w);
  let x_1605 : vec4<f32> = u_xlat2;
  let x_1608 : vec3<f32> = log2(abs(vec3<f32>(x_1605.x, x_1605.y, x_1605.z)));
  let x_1609 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1608.x, x_1608.y, x_1608.z, x_1609.w);
  let x_1611 : vec4<f32> = u_xlat2;
  let x_1613 : vec3<f32> = (vec3<f32>(x_1611.x, x_1611.y, x_1611.z) * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
  let x_1614 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1613.x, x_1613.y, x_1613.z, x_1614.w);
  let x_1616 : vec4<f32> = u_xlat2;
  let x_1618 : vec3<f32> = exp2(vec3<f32>(x_1616.x, x_1616.y, x_1616.z));
  let x_1619 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1618.x, x_1618.y, x_1618.z, x_1619.w);
  let x_1621 : vec3<f32> = u_xlat0;
  let x_1623 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_1621.x, x_1621.y, x_1621.z, x_1621.x));
  u_xlatb0 = vec3<bool>(x_1623.x, x_1623.y, x_1623.z);
  let x_1626 : bool = u_xlatb0.x;
  if (x_1626) {
    let x_1631 : f32 = u_xlat1.x;
    x_1627 = x_1631;
  } else {
    let x_1634 : f32 = u_xlat2.x;
    x_1627 = x_1634;
  }
  let x_1635 : f32 = x_1627;
  u_xlat0.x = x_1635;
  let x_1638 : bool = u_xlatb0.y;
  if (x_1638) {
    let x_1643 : f32 = u_xlat1.y;
    x_1639 = x_1643;
  } else {
    let x_1646 : f32 = u_xlat2.y;
    x_1639 = x_1646;
  }
  let x_1647 : f32 = x_1639;
  u_xlat0.y = x_1647;
  let x_1650 : bool = u_xlatb0.z;
  if (x_1650) {
    let x_1655 : f32 = u_xlat1.z;
    x_1651 = x_1655;
  } else {
    let x_1658 : f32 = u_xlat2.z;
    x_1651 = x_1658;
  }
  let x_1659 : f32 = x_1651;
  u_xlat0.z = x_1659;
  let x_1663 : vec3<f32> = u_xlat0;
  let x_1664 : vec3<f32> = max(x_1663, vec3<f32>(0.0f, 0.0f, 0.0f));
  let x_1665 : vec4<f32> = SV_Target0;
  SV_Target0 = vec4<f32>(x_1664.x, x_1664.y, x_1664.z, x_1665.w);
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

