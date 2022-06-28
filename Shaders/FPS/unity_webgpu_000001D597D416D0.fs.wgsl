struct PGlobals {
  x_RenderViewportScaleFactor : f32,
  @size(12)
  padding : u32,
  x_Distortion_Amount : vec4<f32>,
  x_Distortion_CenterScale : vec4<f32>,
  x_Dithering_Coords : vec4<f32>,
  x_MainTex_TexelSize : vec4<f32>,
  x_BloomTex_TexelSize : vec4<f32>,
  x_Bloom_DirtTileOffset : vec4<f32>,
  x_Bloom_Settings : vec3<f32>,
  @size(4)
  padding_1 : u32,
  x_Bloom_Color : vec3<f32>,
  x_ChromaticAberration_Amount : f32,
  x_Lut2D_Params : vec3<f32>,
}

var<private> u_xlat0 : vec4<f32>;

var<private> vs_TEXCOORD0 : vec2<f32>;

var<private> u_xlat20 : vec2<f32>;

@group(0) @binding(0) var<uniform> x_26 : PGlobals;

var<private> u_xlat1 : vec4<f32>;

var<private> u_xlatb11 : bool;

var<private> u_xlat21 : vec2<f32>;

var<private> u_xlat2 : vec3<f32>;

var<private> u_xlat3 : vec4<f32>;

var<private> u_xlat31 : f32;

var<private> u_xlat12 : f32;

var<private> u_xlat22 : vec2<f32>;

var<private> u_xlat32 : f32;

var<private> u_xlatb3 : bool;

var<private> u_xlatb1 : bool;

@group(0) @binding(3) var x_AutoExposureTex : texture_2d<f32>;

@group(0) @binding(10) var sampler_AutoExposureTex : sampler;

var<private> u_xlat10 : vec2<f32>;

var<private> u_xlat30 : f32;

var<private> u_xlati30 : i32;

var<private> u_xlat4 : vec4<f32>;

var<private> u_xlat5 : vec4<f32>;

var<private> u_xlat6 : vec2<f32>;

var<private> u_xlat36 : f32;

var<private> u_xlat7 : vec4<f32>;

var<private> u_xlat27 : vec2<f32>;

var<private> u_xlat8 : vec2<f32>;

var<private> u_xlat9 : f32;

var<private> u_xlat18 : f32;

var<private> u_xlat28 : f32;

var<private> u_xlat38 : f32;

var<private> u_xlat19 : f32;

var<private> u_xlatb29 : bool;

var<private> u_xlatb36 : bool;

@group(0) @binding(2) var x_MainTex : texture_2d<f32>;

@group(0) @binding(9) var sampler_MainTex : sampler;

@group(0) @binding(6) var x_ChromaticAberration_SpectralLut : texture_2d<f32>;

@group(0) @binding(13) var sampler_ChromaticAberration_SpectralLut : sampler;

@group(0) @binding(4) var x_BloomTex : texture_2d<f32>;

@group(0) @binding(11) var sampler_BloomTex : sampler;

@group(0) @binding(5) var x_Bloom_DirtTex : texture_2d<f32>;

@group(0) @binding(12) var sampler_Bloom_DirtTex : sampler;

var<private> u_xlatb0 : vec3<bool>;

@group(0) @binding(7) var x_Lut2D : texture_2d<f32>;

@group(0) @binding(14) var sampler_Lut2D : sampler;

@group(0) @binding(1) var x_DitheringTex : texture_2d<f32>;

@group(0) @binding(8) var sampler_DitheringTex : sampler;

var<private> u_xlat11 : vec3<f32>;

var<private> SV_Target0 : vec4<f32>;

var<private> gl_FragCoord : vec4<f32>;

var<private> u_xlati26 : i32;

fn main_1() {
  var x_231 : f32;
  var u_xlati_loop_1 : i32;
  var x_520 : f32;
  var x_803 : f32;
  var x_815 : f32;
  var x_827 : f32;
  var x_968 : f32;
  var x_980 : f32;
  var x_992 : f32;
  var x_1087 : f32;
  var x_1099 : f32;
  var x_1111 : f32;
  var x_1158 : f32;
  var x_1171 : f32;
  var x_1183 : f32;
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
    let x_141 : f32 = u_xlat1.x;
    let x_143 : f32 = x_26.x_Distortion_Amount.y;
    u_xlat1.x = (x_141 * x_143);
    let x_148 : f32 = u_xlat1.x;
    u_xlat12 = min(abs(x_148), 1.0f);
    let x_153 : f32 = u_xlat1.x;
    u_xlat22.x = max(abs(x_153), 1.0f);
    let x_158 : f32 = u_xlat22.x;
    u_xlat22.x = (1.0f / x_158);
    let x_162 : f32 = u_xlat22.x;
    let x_163 : f32 = u_xlat12;
    u_xlat12 = (x_162 * x_163);
    let x_165 : f32 = u_xlat12;
    let x_166 : f32 = u_xlat12;
    u_xlat22.x = (x_165 * x_166);
    let x_171 : f32 = u_xlat22.x;
    u_xlat32 = ((x_171 * 0.0208351f) + -0.085133001f);
    let x_177 : f32 = u_xlat22.x;
    let x_178 : f32 = u_xlat32;
    u_xlat32 = ((x_177 * x_178) + 0.180141002f);
    let x_183 : f32 = u_xlat22.x;
    let x_184 : f32 = u_xlat32;
    u_xlat32 = ((x_183 * x_184) + -0.330299497f);
    let x_189 : f32 = u_xlat22.x;
    let x_190 : f32 = u_xlat32;
    u_xlat22.x = ((x_189 * x_190) + 0.999866009f);
    let x_196 : f32 = u_xlat22.x;
    let x_197 : f32 = u_xlat12;
    u_xlat32 = (x_196 * x_197);
    let x_201 : f32 = u_xlat1.x;
    u_xlatb3 = (1.0f < abs(x_201));
    let x_204 : f32 = u_xlat32;
    u_xlat32 = ((x_204 * -2.0f) + 1.570796371f);
    let x_209 : bool = u_xlatb3;
    let x_210 : f32 = u_xlat32;
    u_xlat32 = select(0.0f, x_210, x_209);
    let x_212 : f32 = u_xlat12;
    let x_214 : f32 = u_xlat22.x;
    let x_216 : f32 = u_xlat32;
    u_xlat12 = ((x_212 * x_214) + x_216);
    let x_219 : f32 = u_xlat1.x;
    u_xlat1.x = min(x_219, 1.0f);
    let x_224 : f32 = u_xlat1.x;
    let x_226 : f32 = u_xlat1.x;
    u_xlatb1 = (x_224 < -(x_226));
    let x_229 : bool = u_xlatb1;
    if (x_229) {
      let x_234 : f32 = u_xlat12;
      x_231 = -(x_234);
    } else {
      let x_237 : f32 = u_xlat12;
      x_231 = x_237;
    }
    let x_238 : f32 = x_231;
    u_xlat1.x = x_238;
    let x_241 : f32 = u_xlat2.x;
    let x_243 : f32 = u_xlat1.x;
    u_xlat1.x = ((x_241 * x_243) + -1.0f);
    let x_247 : vec4<f32> = u_xlat0;
    let x_249 : vec4<f32> = u_xlat1;
    let x_252 : vec2<f32> = u_xlat20;
    u_xlat21 = ((vec2<f32>(x_247.x, x_247.y) * vec2<f32>(x_249.x, x_249.x)) + x_252);
  }
  let x_264 : vec2<f32> = vs_TEXCOORD0;
  let x_265 : vec4<f32> = textureSample(x_AutoExposureTex, sampler_AutoExposureTex, x_264);
  u_xlat0.x = x_265.x;
  let x_269 : vec2<f32> = vs_TEXCOORD0;
  u_xlat10 = ((x_269 * vec2<f32>(2.0f, 2.0f)) + vec2<f32>(-1.0f, -1.0f));
  let x_276 : vec2<f32> = u_xlat10;
  let x_277 : vec2<f32> = u_xlat10;
  u_xlat30 = dot(x_276, x_277);
  let x_279 : f32 = u_xlat30;
  let x_281 : vec2<f32> = u_xlat10;
  u_xlat10 = (vec2<f32>(x_279, x_279) * x_281);
  let x_283 : vec2<f32> = u_xlat10;
  let x_286 : f32 = x_26.x_ChromaticAberration_Amount;
  let x_288 : f32 = x_26.x_ChromaticAberration_Amount;
  let x_289 : vec2<f32> = vec2<f32>(x_286, x_288);
  u_xlat10 = (x_283 * vec2<f32>(x_289.x, x_289.y));
  let x_294 : vec2<f32> = u_xlat10;
  let x_298 : vec4<f32> = x_26.x_MainTex_TexelSize;
  let x_300 : vec2<f32> = (-(x_294) * vec2<f32>(x_298.z, x_298.w));
  let x_301 : vec3<f32> = u_xlat2;
  u_xlat2 = vec3<f32>(x_300.x, x_300.y, x_301.z);
  let x_303 : vec3<f32> = u_xlat2;
  let x_305 : vec2<f32> = (vec2<f32>(x_303.x, x_303.y) * vec2<f32>(0.5f, 0.5f));
  let x_306 : vec3<f32> = u_xlat2;
  u_xlat2 = vec3<f32>(x_305.x, x_305.y, x_306.z);
  let x_308 : vec3<f32> = u_xlat2;
  let x_310 : vec3<f32> = u_xlat2;
  u_xlat30 = dot(vec2<f32>(x_308.x, x_308.y), vec2<f32>(x_310.x, x_310.y));
  let x_313 : f32 = u_xlat30;
  u_xlat30 = sqrt(x_313);
  let x_317 : f32 = u_xlat30;
  u_xlati30 = i32(x_317);
  let x_319 : i32 = u_xlati30;
  u_xlati30 = max(x_319, 3i);
  let x_322 : i32 = u_xlati30;
  u_xlati30 = min(x_322, 16i);
  let x_325 : i32 = u_xlati30;
  u_xlat1.x = f32(x_325);
  let x_328 : vec2<f32> = u_xlat10;
  let x_330 : vec4<f32> = u_xlat1;
  u_xlat10 = (-(x_328) / vec2<f32>(x_330.x, x_330.x));
  u_xlat2.y = 0.0f;
  u_xlat22.y = 0.0f;
  u_xlat3.w = 1.0f;
  u_xlat4.x = 0.0f;
  u_xlat4.y = 0.0f;
  u_xlat4.z = 0.0f;
  u_xlat4.w = 0.0f;
  u_xlat5.x = 0.0f;
  u_xlat5.y = 0.0f;
  u_xlat5.z = 0.0f;
  u_xlat5.w = 0.0f;
  let x_348 : vec2<f32> = vs_TEXCOORD0;
  u_xlat6 = x_348;
  u_xlati_loop_1 = 0i;
  loop {
    let x_357 : i32 = u_xlati_loop_1;
    let x_358 : i32 = u_xlati30;
    if ((x_357 < x_358)) {
    } else {
      break;
    }
    let x_361 : i32 = u_xlati_loop_1;
    u_xlat36 = f32(x_361);
    let x_363 : f32 = u_xlat36;
    u_xlat36 = (x_363 + 0.5f);
    let x_365 : f32 = u_xlat36;
    let x_367 : f32 = u_xlat1.x;
    u_xlat2.x = (x_365 / x_367);
    let x_371 : vec2<f32> = u_xlat6;
    let x_372 : vec2<f32> = (x_371 + vec2<f32>(-0.5f, -0.5f));
    let x_373 : vec4<f32> = u_xlat7;
    u_xlat7 = vec4<f32>(x_372.x, x_372.y, x_373.z, x_373.w);
    let x_376 : vec4<f32> = u_xlat7;
    let x_379 : vec4<f32> = x_26.x_Distortion_Amount;
    u_xlat27 = ((vec2<f32>(x_376.x, x_376.y) * vec2<f32>(x_379.z, x_379.z)) + vec2<f32>(0.5f, 0.5f));
    let x_383 : vec4<f32> = u_xlat7;
    let x_386 : vec4<f32> = x_26.x_Distortion_Amount;
    let x_390 : vec4<f32> = x_26.x_Distortion_CenterScale;
    let x_393 : vec2<f32> = ((vec2<f32>(x_383.x, x_383.y) * vec2<f32>(x_386.z, x_386.z)) + -(vec2<f32>(x_390.x, x_390.y)));
    let x_394 : vec4<f32> = u_xlat7;
    u_xlat7 = vec4<f32>(x_393.x, x_393.y, x_394.z, x_394.w);
    let x_396 : vec4<f32> = u_xlat7;
    let x_399 : vec4<f32> = x_26.x_Distortion_CenterScale;
    let x_401 : vec2<f32> = (vec2<f32>(x_396.x, x_396.y) * vec2<f32>(x_399.z, x_399.w));
    let x_402 : vec4<f32> = u_xlat7;
    u_xlat7 = vec4<f32>(x_401.x, x_401.y, x_402.z, x_402.w);
    let x_404 : vec4<f32> = u_xlat7;
    let x_406 : vec4<f32> = u_xlat7;
    u_xlat36 = dot(vec2<f32>(x_404.x, x_404.y), vec2<f32>(x_406.x, x_406.y));
    let x_409 : f32 = u_xlat36;
    u_xlat36 = sqrt(x_409);
    let x_411 : bool = u_xlatb11;
    if (x_411) {
      let x_415 : f32 = u_xlat36;
      let x_418 : vec4<f32> = x_26.x_Distortion_Amount;
      u_xlat8 = (vec2<f32>(x_415, x_415) * vec2<f32>(x_418.x, x_418.y));
      let x_423 : f32 = u_xlat8.x;
      u_xlat9 = cos(x_423);
      let x_426 : f32 = u_xlat8.x;
      u_xlat8.x = sin(x_426);
      let x_430 : f32 = u_xlat8.x;
      let x_431 : f32 = u_xlat9;
      u_xlat8.x = (x_430 / x_431);
      let x_436 : f32 = u_xlat8.y;
      u_xlat18 = (1.0f / x_436);
      let x_439 : f32 = u_xlat8.x;
      let x_440 : f32 = u_xlat18;
      u_xlat8.x = ((x_439 * x_440) + -1.0f);
      let x_444 : vec4<f32> = u_xlat7;
      let x_446 : vec2<f32> = u_xlat8;
      let x_449 : vec2<f32> = u_xlat27;
      u_xlat8 = ((vec2<f32>(x_444.x, x_444.y) * vec2<f32>(x_446.x, x_446.x)) + x_449);
    } else {
      let x_453 : f32 = u_xlat36;
      u_xlat28 = (1.0f / x_453);
      let x_455 : f32 = u_xlat28;
      let x_457 : f32 = x_26.x_Distortion_Amount.x;
      u_xlat28 = (x_455 * x_457);
      let x_459 : f32 = u_xlat36;
      let x_461 : f32 = x_26.x_Distortion_Amount.y;
      u_xlat36 = (x_459 * x_461);
      let x_464 : f32 = u_xlat36;
      u_xlat38 = min(abs(x_464), 1.0f);
      let x_467 : f32 = u_xlat36;
      u_xlat9 = max(abs(x_467), 1.0f);
      let x_470 : f32 = u_xlat9;
      u_xlat9 = (1.0f / x_470);
      let x_472 : f32 = u_xlat38;
      let x_473 : f32 = u_xlat9;
      u_xlat38 = (x_472 * x_473);
      let x_475 : f32 = u_xlat38;
      let x_476 : f32 = u_xlat38;
      u_xlat9 = (x_475 * x_476);
      let x_479 : f32 = u_xlat9;
      u_xlat19 = ((x_479 * 0.0208351f) + -0.085133001f);
      let x_482 : f32 = u_xlat9;
      let x_483 : f32 = u_xlat19;
      u_xlat19 = ((x_482 * x_483) + 0.180141002f);
      let x_486 : f32 = u_xlat9;
      let x_487 : f32 = u_xlat19;
      u_xlat19 = ((x_486 * x_487) + -0.330299497f);
      let x_490 : f32 = u_xlat9;
      let x_491 : f32 = u_xlat19;
      u_xlat9 = ((x_490 * x_491) + 0.999866009f);
      let x_494 : f32 = u_xlat38;
      let x_495 : f32 = u_xlat9;
      u_xlat19 = (x_494 * x_495);
      let x_498 : f32 = u_xlat36;
      u_xlatb29 = (1.0f < abs(x_498));
      let x_501 : f32 = u_xlat19;
      u_xlat19 = ((x_501 * -2.0f) + 1.570796371f);
      let x_504 : bool = u_xlatb29;
      let x_505 : f32 = u_xlat19;
      u_xlat19 = select(0.0f, x_505, x_504);
      let x_507 : f32 = u_xlat38;
      let x_508 : f32 = u_xlat9;
      let x_510 : f32 = u_xlat19;
      u_xlat38 = ((x_507 * x_508) + x_510);
      let x_512 : f32 = u_xlat36;
      u_xlat36 = min(x_512, 1.0f);
      let x_515 : f32 = u_xlat36;
      let x_516 : f32 = u_xlat36;
      u_xlatb36 = (x_515 < -(x_516));
      let x_519 : bool = u_xlatb36;
      if (x_519) {
        let x_523 : f32 = u_xlat38;
        x_520 = -(x_523);
      } else {
        let x_526 : f32 = u_xlat38;
        x_520 = x_526;
      }
      let x_527 : f32 = x_520;
      u_xlat36 = x_527;
      let x_528 : f32 = u_xlat28;
      let x_529 : f32 = u_xlat36;
      u_xlat36 = ((x_528 * x_529) + -1.0f);
      let x_532 : vec4<f32> = u_xlat7;
      let x_534 : f32 = u_xlat36;
      let x_537 : vec2<f32> = u_xlat27;
      u_xlat8 = ((vec2<f32>(x_532.x, x_532.y) * vec2<f32>(x_534, x_534)) + x_537);
    }
    let x_539 : vec2<f32> = u_xlat8;
    u_xlat8 = x_539;
    let x_540 : vec2<f32> = u_xlat8;
    u_xlat8 = clamp(x_540, vec2<f32>(0.0f, 0.0f), vec2<f32>(1.0f, 1.0f));
    let x_544 : vec2<f32> = u_xlat8;
    let x_546 : f32 = x_26.x_RenderViewportScaleFactor;
    let x_548 : vec2<f32> = (x_544 * vec2<f32>(x_546, x_546));
    let x_549 : vec4<f32> = u_xlat7;
    u_xlat7 = vec4<f32>(x_548.x, x_548.y, x_549.z, x_549.w);
    let x_556 : vec4<f32> = u_xlat7;
    let x_558 : vec4<f32> = textureSampleLevel(x_MainTex, sampler_MainTex, vec2<f32>(x_556.x, x_556.y), 0.0f);
    u_xlat7 = x_558;
    let x_564 : vec3<f32> = u_xlat2;
    let x_566 : vec4<f32> = textureSampleLevel(x_ChromaticAberration_SpectralLut, sampler_ChromaticAberration_SpectralLut, vec2<f32>(x_564.x, x_564.y), 0.0f);
    let x_567 : vec3<f32> = vec3<f32>(x_566.x, x_566.y, x_566.z);
    let x_568 : vec4<f32> = u_xlat3;
    u_xlat3 = vec4<f32>(x_567.x, x_567.y, x_567.z, x_568.w);
    let x_570 : vec4<f32> = u_xlat7;
    let x_571 : vec4<f32> = u_xlat3;
    let x_573 : vec4<f32> = u_xlat4;
    u_xlat4 = ((x_570 * x_571) + x_573);
    let x_575 : vec4<f32> = u_xlat3;
    let x_576 : vec4<f32> = u_xlat5;
    u_xlat5 = (x_575 + x_576);
    let x_578 : vec2<f32> = u_xlat10;
    let x_579 : vec2<f32> = u_xlat6;
    u_xlat6 = (x_578 + x_579);

    continuing {
      let x_581 : i32 = u_xlati_loop_1;
      u_xlati_loop_1 = (x_581 + 1i);
    }
  }
  let x_583 : vec4<f32> = u_xlat4;
  let x_584 : vec4<f32> = u_xlat5;
  u_xlat3 = (x_583 / x_584);
  let x_586 : vec4<f32> = u_xlat0;
  let x_588 : vec4<f32> = u_xlat3;
  let x_590 : vec3<f32> = (vec3<f32>(x_586.x, x_586.x, x_586.x) * vec3<f32>(x_588.x, x_588.y, x_588.z));
  let x_591 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_590.x, x_590.y, x_590.z, x_591.w);
  let x_595 : vec4<f32> = x_26.x_BloomTex_TexelSize;
  u_xlat0 = (vec4<f32>(x_595.x, x_595.y, x_595.x, x_595.y) * vec4<f32>(-1.0f, -1.0f, 1.0f, 1.0f));
  let x_601 : f32 = x_26.x_Bloom_Settings.x;
  u_xlat1.x = (x_601 * 0.5f);
  let x_604 : vec4<f32> = u_xlat0;
  let x_606 : vec4<f32> = u_xlat1;
  let x_609 : vec2<f32> = u_xlat21;
  u_xlat4 = ((vec4<f32>(x_604.x, x_604.y, x_604.z, x_604.y) * vec4<f32>(x_606.x, x_606.x, x_606.x, x_606.x)) + vec4<f32>(x_609.x, x_609.y, x_609.x, x_609.y));
  let x_612 : vec4<f32> = u_xlat4;
  u_xlat4 = clamp(x_612, vec4<f32>(0.0f, 0.0f, 0.0f, 0.0f), vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_616 : vec4<f32> = u_xlat4;
  let x_618 : f32 = x_26.x_RenderViewportScaleFactor;
  u_xlat4 = (x_616 * vec4<f32>(x_618, x_618, x_618, x_618));
  let x_626 : vec4<f32> = u_xlat4;
  let x_628 : vec4<f32> = textureSample(x_BloomTex, sampler_BloomTex, vec2<f32>(x_626.x, x_626.y));
  u_xlat5 = x_628;
  let x_632 : vec4<f32> = u_xlat4;
  let x_634 : vec4<f32> = textureSample(x_BloomTex, sampler_BloomTex, vec2<f32>(x_632.z, x_632.w));
  u_xlat4 = x_634;
  let x_635 : vec4<f32> = u_xlat4;
  let x_636 : vec4<f32> = u_xlat5;
  u_xlat4 = (x_635 + x_636);
  let x_638 : vec4<f32> = u_xlat0;
  let x_640 : vec4<f32> = u_xlat1;
  let x_643 : vec2<f32> = u_xlat21;
  u_xlat0 = ((vec4<f32>(x_638.x, x_638.w, x_638.z, x_638.w) * vec4<f32>(x_640.x, x_640.x, x_640.x, x_640.x)) + vec4<f32>(x_643.x, x_643.y, x_643.x, x_643.y));
  let x_646 : vec4<f32> = u_xlat0;
  u_xlat0 = clamp(x_646, vec4<f32>(0.0f, 0.0f, 0.0f, 0.0f), vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_650 : vec4<f32> = u_xlat0;
  let x_652 : f32 = x_26.x_RenderViewportScaleFactor;
  u_xlat0 = (x_650 * vec4<f32>(x_652, x_652, x_652, x_652));
  let x_658 : vec4<f32> = u_xlat0;
  let x_660 : vec4<f32> = textureSample(x_BloomTex, sampler_BloomTex, vec2<f32>(x_658.x, x_658.y));
  u_xlat5 = x_660;
  let x_661 : vec4<f32> = u_xlat4;
  let x_662 : vec4<f32> = u_xlat5;
  u_xlat4 = (x_661 + x_662);
  let x_667 : vec4<f32> = u_xlat0;
  let x_669 : vec4<f32> = textureSample(x_BloomTex, sampler_BloomTex, vec2<f32>(x_667.z, x_667.w));
  u_xlat0 = x_669;
  let x_670 : vec4<f32> = u_xlat0;
  let x_671 : vec4<f32> = u_xlat4;
  u_xlat0 = (x_670 + x_671);
  let x_673 : vec4<f32> = u_xlat0;
  let x_676 : vec3<f32> = x_26.x_Bloom_Settings;
  u_xlat0 = (x_673 * vec4<f32>(x_676.y, x_676.y, x_676.y, x_676.y));
  let x_679 : vec2<f32> = u_xlat21;
  let x_682 : vec4<f32> = x_26.x_Bloom_DirtTileOffset;
  let x_686 : vec4<f32> = x_26.x_Bloom_DirtTileOffset;
  let x_688 : vec2<f32> = ((x_679 * vec2<f32>(x_682.x, x_682.y)) + vec2<f32>(x_686.z, x_686.w));
  let x_689 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_688.x, x_688.y, x_689.z, x_689.w);
  let x_696 : vec4<f32> = u_xlat1;
  let x_698 : vec4<f32> = textureSample(x_Bloom_DirtTex, sampler_Bloom_DirtTex, vec2<f32>(x_696.x, x_696.y));
  let x_699 : vec3<f32> = vec3<f32>(x_698.x, x_698.y, x_698.z);
  let x_700 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_699.x, x_699.y, x_699.z, x_700.w);
  let x_702 : vec4<f32> = u_xlat0;
  let x_706 : vec3<f32> = (vec3<f32>(x_702.x, x_702.y, x_702.z) * vec3<f32>(0.25f, 0.25f, 0.25f));
  let x_707 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_706.x, x_706.y, x_706.z, x_707.w);
  let x_709 : vec4<f32> = u_xlat1;
  let x_712 : vec3<f32> = x_26.x_Bloom_Settings;
  let x_714 : vec3<f32> = (vec3<f32>(x_709.x, x_709.y, x_709.z) * vec3<f32>(x_712.z, x_712.z, x_712.z));
  let x_715 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_714.x, x_714.y, x_714.z, x_715.w);
  let x_717 : vec4<f32> = u_xlat0;
  u_xlat0 = (x_717 * vec4<f32>(0.25f, 0.25f, 0.25f, 1.0f));
  let x_720 : vec4<f32> = u_xlat0;
  let x_724 : vec3<f32> = x_26.x_Bloom_Color;
  let x_725 : vec3<f32> = (vec3<f32>(x_720.x, x_720.y, x_720.z) * x_724);
  let x_726 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_725.x, x_725.y, x_725.z, x_726.w);
  let x_729 : f32 = u_xlat0.w;
  u_xlat5.w = (x_729 * 0.25f);
  let x_732 : vec4<f32> = u_xlat3;
  let x_733 : vec4<f32> = u_xlat5;
  u_xlat0 = (x_732 + x_733);
  let x_735 : vec4<f32> = u_xlat4;
  let x_737 : vec4<f32> = u_xlat1;
  let x_739 : vec3<f32> = (vec3<f32>(x_735.x, x_735.y, x_735.z) * vec3<f32>(x_737.x, x_737.y, x_737.z));
  let x_740 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_739.x, x_739.y, x_739.z, x_740.w);
  u_xlat1.w = 0.0f;
  let x_743 : vec4<f32> = u_xlat0;
  let x_744 : vec4<f32> = u_xlat1;
  u_xlat0 = (x_743 + x_744);
  let x_746 : vec4<f32> = u_xlat0;
  u_xlat0 = clamp(x_746, vec4<f32>(0.0f, 0.0f, 0.0f, 0.0f), vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_750 : vec4<f32> = u_xlat0;
  let x_754 : vec3<f32> = (vec3<f32>(x_750.z, x_750.x, x_750.y) * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
  let x_755 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_754.x, x_754.y, x_754.z, x_755.w);
  let x_757 : vec4<f32> = u_xlat0;
  let x_761 : vec3<f32> = max(vec3<f32>(x_757.z, x_757.x, x_757.y), vec3<f32>(1.1920929e-07f, 1.1920929e-07f, 1.1920929e-07f));
  let x_762 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_761.x, x_761.y, x_761.z, x_762.w);
  let x_764 : vec4<f32> = u_xlat3;
  let x_766 : vec3<f32> = log2(vec3<f32>(x_764.x, x_764.y, x_764.z));
  let x_767 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_766.x, x_766.y, x_766.z, x_767.w);
  let x_769 : vec4<f32> = u_xlat3;
  let x_773 : vec3<f32> = (vec3<f32>(x_769.x, x_769.y, x_769.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
  let x_774 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_773.x, x_773.y, x_773.z, x_774.w);
  let x_776 : vec4<f32> = u_xlat3;
  let x_778 : vec3<f32> = exp2(vec3<f32>(x_776.x, x_776.y, x_776.z));
  let x_779 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_778.x, x_778.y, x_778.z, x_779.w);
  let x_781 : vec4<f32> = u_xlat3;
  let x_788 : vec3<f32> = ((vec3<f32>(x_781.x, x_781.y, x_781.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
  let x_789 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_788.x, x_788.y, x_788.z, x_789.w);
  let x_796 : vec4<f32> = u_xlat0;
  let x_799 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_796.z, x_796.x, x_796.y, x_796.z));
  u_xlatb0 = vec3<bool>(x_799.x, x_799.y, x_799.z);
  let x_802 : bool = u_xlatb0.x;
  if (x_802) {
    let x_807 : f32 = u_xlat1.x;
    x_803 = x_807;
  } else {
    let x_810 : f32 = u_xlat3.x;
    x_803 = x_810;
  }
  let x_811 : f32 = x_803;
  u_xlat0.x = x_811;
  let x_814 : bool = u_xlatb0.y;
  if (x_814) {
    let x_819 : f32 = u_xlat1.y;
    x_815 = x_819;
  } else {
    let x_822 : f32 = u_xlat3.y;
    x_815 = x_822;
  }
  let x_823 : f32 = x_815;
  u_xlat0.y = x_823;
  let x_826 : bool = u_xlatb0.z;
  if (x_826) {
    let x_831 : f32 = u_xlat1.z;
    x_827 = x_831;
  } else {
    let x_834 : f32 = u_xlat3.z;
    x_827 = x_834;
  }
  let x_835 : f32 = x_827;
  u_xlat0.z = x_835;
  let x_837 : vec4<f32> = u_xlat0;
  let x_841 : vec3<f32> = x_26.x_Lut2D_Params;
  let x_843 : vec3<f32> = (vec3<f32>(x_837.x, x_837.y, x_837.z) * vec3<f32>(x_841.z, x_841.z, x_841.z));
  let x_844 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_843.x, x_843.y, x_843.z, x_844.w);
  let x_847 : f32 = u_xlat1.x;
  u_xlat10.x = floor(x_847);
  let x_851 : vec3<f32> = x_26.x_Lut2D_Params;
  let x_853 : vec2<f32> = (vec2<f32>(x_851.x, x_851.y) * vec2<f32>(0.5f, 0.5f));
  let x_854 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_853.x, x_854.y, x_854.z, x_853.y);
  let x_856 : vec4<f32> = u_xlat1;
  let x_859 : vec3<f32> = x_26.x_Lut2D_Params;
  let x_862 : vec4<f32> = u_xlat1;
  let x_864 : vec2<f32> = ((vec2<f32>(x_856.y, x_856.z) * vec2<f32>(x_859.x, x_859.y)) + vec2<f32>(x_862.x, x_862.w));
  let x_865 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_865.x, x_864.x, x_864.y, x_865.w);
  let x_868 : f32 = u_xlat10.x;
  let x_870 : f32 = x_26.x_Lut2D_Params.y;
  let x_873 : f32 = u_xlat1.y;
  u_xlat1.x = ((x_868 * x_870) + x_873);
  let x_881 : vec4<f32> = u_xlat1;
  let x_883 : vec4<f32> = textureSample(x_Lut2D, sampler_Lut2D, vec2<f32>(x_881.x, x_881.z));
  let x_884 : vec3<f32> = vec3<f32>(x_883.x, x_883.y, x_883.z);
  let x_885 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_884.x, x_884.y, x_884.z, x_885.w);
  let x_888 : f32 = x_26.x_Lut2D_Params.y;
  u_xlat22.x = x_888;
  let x_890 : vec2<f32> = u_xlat22;
  let x_891 : vec4<f32> = u_xlat1;
  let x_893 : vec2<f32> = (x_890 + vec2<f32>(x_891.x, x_891.z));
  let x_894 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_893.x, x_893.y, x_894.z, x_894.w);
  let x_899 : vec4<f32> = u_xlat1;
  let x_901 : vec4<f32> = textureSample(x_Lut2D, sampler_Lut2D, vec2<f32>(x_899.x, x_899.y));
  let x_902 : vec3<f32> = vec3<f32>(x_901.x, x_901.y, x_901.z);
  let x_903 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_902.x, x_902.y, x_902.z, x_903.w);
  let x_906 : f32 = u_xlat0.x;
  let x_908 : f32 = x_26.x_Lut2D_Params.z;
  let x_911 : f32 = u_xlat10.x;
  u_xlat0.x = ((x_906 * x_908) + -(x_911));
  let x_915 : vec4<f32> = u_xlat3;
  let x_918 : vec4<f32> = u_xlat1;
  let x_920 : vec3<f32> = (-(vec3<f32>(x_915.x, x_915.y, x_915.z)) + vec3<f32>(x_918.x, x_918.y, x_918.z));
  let x_921 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_920.x, x_920.y, x_920.z, x_921.w);
  let x_923 : vec4<f32> = u_xlat0;
  let x_925 : vec4<f32> = u_xlat1;
  let x_928 : vec4<f32> = u_xlat3;
  let x_930 : vec3<f32> = ((vec3<f32>(x_923.x, x_923.x, x_923.x) * vec3<f32>(x_925.x, x_925.y, x_925.z)) + vec3<f32>(x_928.x, x_928.y, x_928.z));
  let x_931 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_930.x, x_930.y, x_930.z, x_931.w);
  let x_933 : vec4<f32> = u_xlat0;
  let x_937 : vec3<f32> = (vec3<f32>(x_933.x, x_933.y, x_933.z) * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
  let x_938 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_937.x, x_937.y, x_937.z, x_938.w);
  let x_940 : vec4<f32> = u_xlat0;
  u_xlat2 = (vec3<f32>(x_940.x, x_940.y, x_940.z) + vec3<f32>(0.055f, 0.055f, 0.055f));
  let x_945 : vec3<f32> = u_xlat2;
  u_xlat2 = (x_945 * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
  let x_949 : vec3<f32> = u_xlat2;
  u_xlat2 = max(abs(x_949), vec3<f32>(1.1920929e-07f, 1.1920929e-07f, 1.1920929e-07f));
  let x_952 : vec3<f32> = u_xlat2;
  u_xlat2 = log2(x_952);
  let x_954 : vec3<f32> = u_xlat2;
  u_xlat2 = (x_954 * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
  let x_958 : vec3<f32> = u_xlat2;
  u_xlat2 = exp2(x_958);
  let x_962 : vec4<f32> = u_xlat0;
  let x_964 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_962.x, x_962.y, x_962.z, x_962.x));
  u_xlatb0 = vec3<bool>(x_964.x, x_964.y, x_964.z);
  let x_967 : bool = u_xlatb0.x;
  if (x_967) {
    let x_972 : f32 = u_xlat1.x;
    x_968 = x_972;
  } else {
    let x_975 : f32 = u_xlat2.x;
    x_968 = x_975;
  }
  let x_976 : f32 = x_968;
  u_xlat0.x = x_976;
  let x_979 : bool = u_xlatb0.y;
  if (x_979) {
    let x_984 : f32 = u_xlat1.y;
    x_980 = x_984;
  } else {
    let x_987 : f32 = u_xlat2.y;
    x_980 = x_987;
  }
  let x_988 : f32 = x_980;
  u_xlat0.y = x_988;
  let x_991 : bool = u_xlatb0.z;
  if (x_991) {
    let x_996 : f32 = u_xlat1.z;
    x_992 = x_996;
  } else {
    let x_999 : f32 = u_xlat2.z;
    x_992 = x_999;
  }
  let x_1000 : f32 = x_992;
  u_xlat0.z = x_1000;
  let x_1002 : vec2<f32> = vs_TEXCOORD0;
  let x_1004 : vec4<f32> = x_26.x_Dithering_Coords;
  let x_1008 : vec4<f32> = x_26.x_Dithering_Coords;
  let x_1010 : vec2<f32> = ((x_1002 * vec2<f32>(x_1004.x, x_1004.y)) + vec2<f32>(x_1008.z, x_1008.w));
  let x_1011 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1010.x, x_1010.y, x_1011.z, x_1011.w);
  let x_1018 : vec4<f32> = u_xlat1;
  let x_1020 : vec4<f32> = textureSample(x_DitheringTex, sampler_DitheringTex, vec2<f32>(x_1018.x, x_1018.y));
  u_xlat1.x = x_1020.w;
  let x_1024 : f32 = u_xlat1.x;
  u_xlat1.x = ((x_1024 * 2.0f) + -1.0f);
  let x_1030 : f32 = u_xlat1.x;
  u_xlat11.x = ((x_1030 * 340282346638528859811704183484516925440.0f) + 0.5f);
  let x_1036 : f32 = u_xlat11.x;
  u_xlat11.x = clamp(x_1036, 0.0f, 1.0f);
  let x_1040 : f32 = u_xlat11.x;
  u_xlat11.x = ((x_1040 * 2.0f) + -1.0f);
  let x_1045 : f32 = u_xlat1.x;
  u_xlat1.x = (-(abs(x_1045)) + 1.0f);
  let x_1051 : f32 = u_xlat1.x;
  u_xlat1.x = sqrt(x_1051);
  let x_1055 : f32 = u_xlat1.x;
  u_xlat1.x = (-(x_1055) + 1.0f);
  let x_1060 : f32 = u_xlat1.x;
  let x_1062 : f32 = u_xlat11.x;
  u_xlat1.x = (x_1060 * x_1062);
  let x_1065 : vec4<f32> = u_xlat0;
  u_xlat11 = (vec3<f32>(x_1065.x, x_1065.y, x_1065.z) * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
  let x_1068 : vec4<f32> = u_xlat0;
  u_xlat2 = max(abs(vec3<f32>(x_1068.x, x_1068.y, x_1068.z)), vec3<f32>(1.1920929e-07f, 1.1920929e-07f, 1.1920929e-07f));
  let x_1072 : vec3<f32> = u_xlat2;
  u_xlat2 = log2(x_1072);
  let x_1074 : vec3<f32> = u_xlat2;
  u_xlat2 = (x_1074 * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
  let x_1076 : vec3<f32> = u_xlat2;
  u_xlat2 = exp2(x_1076);
  let x_1078 : vec3<f32> = u_xlat2;
  u_xlat2 = ((x_1078 * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
  let x_1081 : vec4<f32> = u_xlat0;
  let x_1083 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_1081.x, x_1081.y, x_1081.z, x_1081.x));
  u_xlatb0 = vec3<bool>(x_1083.x, x_1083.y, x_1083.z);
  let x_1086 : bool = u_xlatb0.x;
  if (x_1086) {
    let x_1091 : f32 = u_xlat11.x;
    x_1087 = x_1091;
  } else {
    let x_1094 : f32 = u_xlat2.x;
    x_1087 = x_1094;
  }
  let x_1095 : f32 = x_1087;
  u_xlat0.x = x_1095;
  let x_1098 : bool = u_xlatb0.y;
  if (x_1098) {
    let x_1103 : f32 = u_xlat11.y;
    x_1099 = x_1103;
  } else {
    let x_1106 : f32 = u_xlat2.y;
    x_1099 = x_1106;
  }
  let x_1107 : f32 = x_1099;
  u_xlat0.y = x_1107;
  let x_1110 : bool = u_xlatb0.z;
  if (x_1110) {
    let x_1115 : f32 = u_xlat11.z;
    x_1111 = x_1115;
  } else {
    let x_1118 : f32 = u_xlat2.z;
    x_1111 = x_1118;
  }
  let x_1119 : f32 = x_1111;
  u_xlat0.z = x_1119;
  let x_1121 : vec4<f32> = u_xlat1;
  let x_1126 : vec4<f32> = u_xlat0;
  let x_1128 : vec3<f32> = ((vec3<f32>(x_1121.x, x_1121.x, x_1121.x) * vec3<f32>(0.003921569f, 0.003921569f, 0.003921569f)) + vec3<f32>(x_1126.x, x_1126.y, x_1126.z));
  let x_1129 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_1128.x, x_1128.y, x_1128.z, x_1129.w);
  let x_1131 : vec4<f32> = u_xlat0;
  let x_1133 : vec3<f32> = (vec3<f32>(x_1131.x, x_1131.y, x_1131.z) * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
  let x_1134 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1133.x, x_1133.y, x_1133.z, x_1134.w);
  let x_1136 : vec4<f32> = u_xlat0;
  u_xlat2 = (vec3<f32>(x_1136.x, x_1136.y, x_1136.z) + vec3<f32>(0.055f, 0.055f, 0.055f));
  let x_1139 : vec3<f32> = u_xlat2;
  u_xlat2 = (x_1139 * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
  let x_1141 : vec3<f32> = u_xlat2;
  u_xlat2 = max(abs(x_1141), vec3<f32>(1.1920929e-07f, 1.1920929e-07f, 1.1920929e-07f));
  let x_1144 : vec3<f32> = u_xlat2;
  u_xlat2 = log2(x_1144);
  let x_1146 : vec3<f32> = u_xlat2;
  u_xlat2 = (x_1146 * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
  let x_1148 : vec3<f32> = u_xlat2;
  u_xlat2 = exp2(x_1148);
  let x_1150 : vec4<f32> = u_xlat0;
  let x_1152 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_1150.x, x_1150.y, x_1150.z, x_1150.x));
  u_xlatb0 = vec3<bool>(x_1152.x, x_1152.y, x_1152.z);
  let x_1157 : bool = u_xlatb0.x;
  if (x_1157) {
    let x_1162 : f32 = u_xlat1.x;
    x_1158 = x_1162;
  } else {
    let x_1165 : f32 = u_xlat2.x;
    x_1158 = x_1165;
  }
  let x_1166 : f32 = x_1158;
  SV_Target0.x = x_1166;
  let x_1170 : bool = u_xlatb0.y;
  if (x_1170) {
    let x_1175 : f32 = u_xlat1.y;
    x_1171 = x_1175;
  } else {
    let x_1178 : f32 = u_xlat2.y;
    x_1171 = x_1178;
  }
  let x_1179 : f32 = x_1171;
  SV_Target0.y = x_1179;
  let x_1182 : bool = u_xlatb0.z;
  if (x_1182) {
    let x_1187 : f32 = u_xlat1.z;
    x_1183 = x_1187;
  } else {
    let x_1190 : f32 = u_xlat2.z;
    x_1183 = x_1190;
  }
  let x_1191 : f32 = x_1183;
  SV_Target0.z = x_1191;
  let x_1194 : f32 = u_xlat0.w;
  SV_Target0.w = x_1194;
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

