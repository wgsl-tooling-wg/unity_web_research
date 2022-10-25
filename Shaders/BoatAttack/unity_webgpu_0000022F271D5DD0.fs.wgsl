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
  x_Vignette_Params1 : vec4<f32>,
  x_Vignette_Params2 : vec4<f32>,
}

@group(0) @binding(0) var x_BlitTexture : texture_2d<f32>;

@group(0) @binding(4) var sampler_LinearClamp : sampler;

var<private> vs_TEXCOORD0 : vec2<f32>;

@group(1) @binding(0) var<uniform> x_26 : PGlobals;

@group(0) @binding(1) var x_Bloom_Texture : texture_2d<f32>;

@group(0) @binding(3) var x_UserLut : texture_2d<f32>;

@group(0) @binding(2) var x_InternalLut : texture_2d<f32>;

var<private> SV_Target0 : vec4<f32>;

var<private> gl_FragCoord : vec4<f32>;

fn main_1() {
  var u_xlat0 : vec4<f32>;
  var u_xlat1 : vec4<f32>;
  var u_xlatb15 : bool;
  var u_xlat2 : vec4<f32>;
  var u_xlat15 : f32;
  var u_xlatb3 : vec3<bool>;
  var hlslcc_movcTemp : vec4<f32>;
  var x_247 : f32;
  var x_259 : f32;
  var x_271 : f32;
  var u_xlat3 : vec3<f32>;
  var u_xlat4 : vec2<f32>;
  var u_xlatb1 : vec3<bool>;
  var x_428 : f32;
  var x_440 : f32;
  var x_452 : f32;
  var u_xlat5 : vec3<f32>;
  var u_xlatb0 : vec3<bool>;
  var x_589 : f32;
  var x_602 : f32;
  var x_614 : f32;
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_23 : vec2<f32> = vs_TEXCOORD0;
  let x_33 : f32 = x_26.x_GlobalMipBias.x;
  let x_34 : vec4<f32> = textureSampleBias(x_BlitTexture, sampler_LinearClamp, x_23, x_33);
  let x_36 : vec3<f32> = vec3<f32>(x_34.x, x_34.y, x_34.z);
  let x_37 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_36.x, x_36.y, x_36.z, x_37.w);
  let x_44 : vec2<f32> = vs_TEXCOORD0;
  let x_46 : f32 = x_26.x_GlobalMipBias.x;
  let x_47 : vec4<f32> = textureSampleBias(x_Bloom_Texture, sampler_LinearClamp, x_44, x_46);
  u_xlat1 = x_47;
  let x_54 : f32 = x_26.x_Bloom_RGBM;
  u_xlatb15 = (0.0f < x_54);
  let x_56 : bool = u_xlatb15;
  if (x_56) {
    let x_60 : vec4<f32> = u_xlat1;
    let x_62 : vec4<f32> = u_xlat1;
    let x_64 : vec3<f32> = (vec3<f32>(x_60.w, x_60.w, x_60.w) * vec3<f32>(x_62.x, x_62.y, x_62.z));
    let x_65 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_64.x, x_64.y, x_64.z, x_65.w);
    let x_67 : vec4<f32> = u_xlat2;
    let x_71 : vec3<f32> = (vec3<f32>(x_67.x, x_67.y, x_67.z) * vec3<f32>(8.0f, 8.0f, 8.0f));
    let x_72 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_71.x, x_71.y, x_71.z, x_72.w);
  }
  let x_74 : vec4<f32> = u_xlat1;
  let x_79 : vec4<f32> = x_26.x_Bloom_Params;
  let x_81 : vec3<f32> = (vec3<f32>(x_74.x, x_74.y, x_74.z) * vec3<f32>(x_79.x, x_79.x, x_79.x));
  let x_82 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_81.x, x_81.y, x_81.z, x_82.w);
  let x_84 : vec4<f32> = u_xlat1;
  let x_87 : vec4<f32> = x_26.x_Bloom_Params;
  let x_90 : vec4<f32> = u_xlat0;
  let x_92 : vec3<f32> = ((vec3<f32>(x_84.x, x_84.y, x_84.z) * vec3<f32>(x_87.y, x_87.z, x_87.w)) + vec3<f32>(x_90.x, x_90.y, x_90.z));
  let x_93 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_92.x, x_92.y, x_92.z, x_93.w);
  let x_98 : f32 = x_26.x_Vignette_Params2.z;
  u_xlatb15 = (0.0f < x_98);
  let x_100 : bool = u_xlatb15;
  if (x_100) {
    let x_103 : vec2<f32> = vs_TEXCOORD0;
    let x_105 : vec4<f32> = x_26.x_Vignette_Params2;
    let x_108 : vec2<f32> = (x_103 + -(vec2<f32>(x_105.x, x_105.y)));
    let x_109 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_108.x, x_108.y, x_109.z, x_109.w);
    let x_111 : vec4<f32> = u_xlat1;
    let x_115 : vec4<f32> = x_26.x_Vignette_Params2;
    let x_117 : vec2<f32> = (abs(vec2<f32>(x_111.x, x_111.y)) * vec2<f32>(x_115.z, x_115.z));
    let x_118 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_118.x, x_117.x, x_117.y, x_118.w);
    let x_123 : f32 = u_xlat1.y;
    let x_127 : f32 = x_26.x_Vignette_Params1.w;
    u_xlat1.x = (x_123 * x_127);
    let x_131 : vec4<f32> = u_xlat1;
    let x_133 : vec4<f32> = u_xlat1;
    u_xlat15 = dot(vec2<f32>(x_131.x, x_131.z), vec2<f32>(x_133.x, x_133.z));
    let x_136 : f32 = u_xlat15;
    u_xlat15 = (-(x_136) + 1.0f);
    let x_140 : f32 = u_xlat15;
    u_xlat15 = max(x_140, 0.0f);
    let x_142 : f32 = u_xlat15;
    u_xlat15 = log2(x_142);
    let x_144 : f32 = u_xlat15;
    let x_146 : f32 = x_26.x_Vignette_Params2.w;
    u_xlat15 = (x_144 * x_146);
    let x_148 : f32 = u_xlat15;
    u_xlat15 = exp2(x_148);
    let x_151 : vec4<f32> = x_26.x_Vignette_Params1;
    let x_155 : vec3<f32> = (-(vec3<f32>(x_151.x, x_151.y, x_151.z)) + vec3<f32>(1.0f, 1.0f, 1.0f));
    let x_156 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_155.x, x_155.y, x_155.z, x_156.w);
    let x_158 : f32 = u_xlat15;
    let x_160 : vec4<f32> = u_xlat1;
    let x_164 : vec4<f32> = x_26.x_Vignette_Params1;
    let x_166 : vec3<f32> = ((vec3<f32>(x_158, x_158, x_158) * vec3<f32>(x_160.x, x_160.y, x_160.z)) + vec3<f32>(x_164.x, x_164.y, x_164.z));
    let x_167 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_166.x, x_166.y, x_166.z, x_167.w);
    let x_169 : vec4<f32> = u_xlat0;
    let x_171 : vec4<f32> = u_xlat1;
    let x_173 : vec3<f32> = (vec3<f32>(x_169.x, x_169.y, x_169.z) * vec3<f32>(x_171.x, x_171.y, x_171.z));
    let x_174 : vec4<f32> = u_xlat0;
    u_xlat0 = vec4<f32>(x_173.x, x_173.y, x_173.z, x_174.w);
  }
  let x_176 : vec4<f32> = u_xlat0;
  let x_180 : vec4<f32> = x_26.x_Lut_Params;
  let x_182 : vec3<f32> = (vec3<f32>(x_176.x, x_176.y, x_176.z) * vec3<f32>(x_180.w, x_180.w, x_180.w));
  let x_183 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_182.x, x_182.y, x_182.z, x_183.w);
  let x_185 : vec4<f32> = u_xlat0;
  let x_189 : vec3<f32> = clamp(vec3<f32>(x_185.x, x_185.y, x_185.z), vec3<f32>(0.0f, 0.0f, 0.0f), vec3<f32>(1.0f, 1.0f, 1.0f));
  let x_190 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_189.x, x_189.y, x_189.z, x_190.w);
  let x_194 : f32 = x_26.x_UserLut_Params.w;
  u_xlatb15 = (0.0f < x_194);
  let x_196 : bool = u_xlatb15;
  if (x_196) {
    let x_199 : vec4<f32> = u_xlat0;
    let x_203 : vec3<f32> = (vec3<f32>(x_199.x, x_199.y, x_199.z) * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
    let x_204 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_203.x, x_203.y, x_203.z, x_204.w);
    let x_206 : vec4<f32> = u_xlat0;
    let x_208 : vec3<f32> = log2(vec3<f32>(x_206.x, x_206.y, x_206.z));
    let x_209 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_208.x, x_208.y, x_208.z, x_209.w);
    let x_211 : vec4<f32> = u_xlat2;
    let x_215 : vec3<f32> = (vec3<f32>(x_211.x, x_211.y, x_211.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
    let x_216 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_215.x, x_215.y, x_215.z, x_216.w);
    let x_218 : vec4<f32> = u_xlat2;
    let x_220 : vec3<f32> = exp2(vec3<f32>(x_218.x, x_218.y, x_218.z));
    let x_221 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_220.x, x_220.y, x_220.z, x_221.w);
    let x_223 : vec4<f32> = u_xlat2;
    let x_230 : vec3<f32> = ((vec3<f32>(x_223.x, x_223.y, x_223.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    let x_231 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_230.x, x_230.y, x_230.z, x_231.w);
    let x_238 : vec4<f32> = u_xlat0;
    let x_241 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_238.x, x_238.y, x_238.z, x_238.x));
    u_xlatb3 = vec3<bool>(x_241.x, x_241.y, x_241.z);
    let x_244 : vec4<f32> = u_xlat1;
    hlslcc_movcTemp = x_244;
    let x_246 : bool = u_xlatb3.x;
    if (x_246) {
      let x_251 : f32 = u_xlat1.x;
      x_247 = x_251;
    } else {
      let x_254 : f32 = u_xlat2.x;
      x_247 = x_254;
    }
    let x_255 : f32 = x_247;
    hlslcc_movcTemp.x = x_255;
    let x_258 : bool = u_xlatb3.y;
    if (x_258) {
      let x_263 : f32 = u_xlat1.y;
      x_259 = x_263;
    } else {
      let x_266 : f32 = u_xlat2.y;
      x_259 = x_266;
    }
    let x_267 : f32 = x_259;
    hlslcc_movcTemp.y = x_267;
    let x_270 : bool = u_xlatb3.z;
    if (x_270) {
      let x_275 : f32 = u_xlat1.z;
      x_271 = x_275;
    } else {
      let x_278 : f32 = u_xlat2.z;
      x_271 = x_278;
    }
    let x_279 : f32 = x_271;
    hlslcc_movcTemp.z = x_279;
    let x_281 : vec4<f32> = hlslcc_movcTemp;
    u_xlat1 = x_281;
    let x_282 : vec4<f32> = u_xlat1;
    let x_285 : vec4<f32> = x_26.x_UserLut_Params;
    let x_287 : vec3<f32> = (vec3<f32>(x_282.z, x_282.x, x_282.y) * vec3<f32>(x_285.z, x_285.z, x_285.z));
    let x_288 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_287.x, x_287.y, x_287.z, x_288.w);
    let x_291 : f32 = u_xlat2.x;
    u_xlat15 = floor(x_291);
    let x_294 : vec4<f32> = x_26.x_UserLut_Params;
    let x_298 : vec2<f32> = (vec2<f32>(x_294.x, x_294.y) * vec2<f32>(0.5f, 0.5f));
    let x_299 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_298.x, x_299.y, x_299.z, x_298.y);
    let x_301 : vec4<f32> = u_xlat2;
    let x_304 : vec4<f32> = x_26.x_UserLut_Params;
    let x_307 : vec4<f32> = u_xlat2;
    let x_309 : vec2<f32> = ((vec2<f32>(x_301.y, x_301.z) * vec2<f32>(x_304.x, x_304.y)) + vec2<f32>(x_307.x, x_307.w));
    let x_310 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_310.x, x_309.x, x_309.y, x_310.w);
    let x_312 : f32 = u_xlat15;
    let x_314 : f32 = x_26.x_UserLut_Params.y;
    let x_317 : f32 = u_xlat2.y;
    u_xlat2.x = ((x_312 * x_314) + x_317);
    let x_326 : vec4<f32> = u_xlat2;
    let x_328 : vec4<f32> = textureSampleLevel(x_UserLut, sampler_LinearClamp, vec2<f32>(x_326.x, x_326.z), 0.0f);
    u_xlat3 = vec3<f32>(x_328.x, x_328.y, x_328.z);
    let x_333 : f32 = x_26.x_UserLut_Params.y;
    u_xlat4.x = x_333;
    u_xlat4.y = 0.0f;
    let x_336 : vec4<f32> = u_xlat2;
    let x_338 : vec2<f32> = u_xlat4;
    let x_339 : vec2<f32> = (vec2<f32>(x_336.x, x_336.z) + x_338);
    let x_340 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_339.x, x_339.y, x_340.z, x_340.w);
    let x_345 : vec4<f32> = u_xlat2;
    let x_347 : vec4<f32> = textureSampleLevel(x_UserLut, sampler_LinearClamp, vec2<f32>(x_345.x, x_345.y), 0.0f);
    let x_348 : vec3<f32> = vec3<f32>(x_347.x, x_347.y, x_347.z);
    let x_349 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_348.x, x_348.y, x_348.z, x_349.w);
    let x_352 : f32 = u_xlat1.z;
    let x_354 : f32 = x_26.x_UserLut_Params.z;
    let x_356 : f32 = u_xlat15;
    u_xlat15 = ((x_352 * x_354) + -(x_356));
    let x_359 : vec3<f32> = u_xlat3;
    let x_361 : vec4<f32> = u_xlat2;
    let x_363 : vec3<f32> = (-(x_359) + vec3<f32>(x_361.x, x_361.y, x_361.z));
    let x_364 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_363.x, x_363.y, x_363.z, x_364.w);
    let x_366 : f32 = u_xlat15;
    let x_368 : vec4<f32> = u_xlat2;
    let x_371 : vec3<f32> = u_xlat3;
    let x_372 : vec3<f32> = ((vec3<f32>(x_366, x_366, x_366) * vec3<f32>(x_368.x, x_368.y, x_368.z)) + x_371);
    let x_373 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_372.x, x_372.y, x_372.z, x_373.w);
    let x_375 : vec4<f32> = u_xlat1;
    let x_378 : vec4<f32> = u_xlat2;
    let x_380 : vec3<f32> = (-(vec3<f32>(x_375.x, x_375.y, x_375.z)) + vec3<f32>(x_378.x, x_378.y, x_378.z));
    let x_381 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_380.x, x_380.y, x_380.z, x_381.w);
    let x_384 : vec4<f32> = x_26.x_UserLut_Params;
    let x_386 : vec4<f32> = u_xlat2;
    let x_389 : vec4<f32> = u_xlat1;
    let x_391 : vec3<f32> = ((vec3<f32>(x_384.w, x_384.w, x_384.w) * vec3<f32>(x_386.x, x_386.y, x_386.z)) + vec3<f32>(x_389.x, x_389.y, x_389.z));
    let x_392 : vec4<f32> = u_xlat1;
    u_xlat1 = vec4<f32>(x_391.x, x_391.y, x_391.z, x_392.w);
    let x_394 : vec4<f32> = u_xlat1;
    let x_398 : vec3<f32> = (vec3<f32>(x_394.x, x_394.y, x_394.z) * vec3<f32>(0.077399381f, 0.077399381f, 0.077399381f));
    let x_399 : vec4<f32> = u_xlat2;
    u_xlat2 = vec4<f32>(x_398.x, x_398.y, x_398.z, x_399.w);
    let x_401 : vec4<f32> = u_xlat1;
    u_xlat3 = (vec3<f32>(x_401.x, x_401.y, x_401.z) + vec3<f32>(0.055f, 0.055f, 0.055f));
    let x_406 : vec3<f32> = u_xlat3;
    u_xlat3 = (x_406 * vec3<f32>(0.947867334f, 0.947867334f, 0.947867334f));
    let x_410 : vec3<f32> = u_xlat3;
    u_xlat3 = log2(abs(x_410));
    let x_413 : vec3<f32> = u_xlat3;
    u_xlat3 = (x_413 * vec3<f32>(2.400000095f, 2.400000095f, 2.400000095f));
    let x_417 : vec3<f32> = u_xlat3;
    u_xlat3 = exp2(x_417);
    let x_422 : vec4<f32> = u_xlat1;
    let x_424 : vec4<bool> = (vec4<f32>(0.040449999f, 0.040449999f, 0.040449999f, 0.0f) >= vec4<f32>(x_422.x, x_422.y, x_422.z, x_422.x));
    u_xlatb1 = vec3<bool>(x_424.x, x_424.y, x_424.z);
    let x_427 : bool = u_xlatb1.x;
    if (x_427) {
      let x_432 : f32 = u_xlat2.x;
      x_428 = x_432;
    } else {
      let x_435 : f32 = u_xlat3.x;
      x_428 = x_435;
    }
    let x_436 : f32 = x_428;
    u_xlat0.x = x_436;
    let x_439 : bool = u_xlatb1.y;
    if (x_439) {
      let x_444 : f32 = u_xlat2.y;
      x_440 = x_444;
    } else {
      let x_447 : f32 = u_xlat3.y;
      x_440 = x_447;
    }
    let x_448 : f32 = x_440;
    u_xlat0.y = x_448;
    let x_451 : bool = u_xlatb1.z;
    if (x_451) {
      let x_456 : f32 = u_xlat2.z;
      x_452 = x_456;
    } else {
      let x_459 : f32 = u_xlat3.z;
      x_452 = x_459;
    }
    let x_460 : f32 = x_452;
    u_xlat0.z = x_460;
  }
  let x_462 : vec4<f32> = u_xlat0;
  let x_465 : vec4<f32> = x_26.x_Lut_Params;
  let x_467 : vec3<f32> = (vec3<f32>(x_462.x, x_462.y, x_462.z) * vec3<f32>(x_465.z, x_465.z, x_465.z));
  let x_468 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_467.x, x_467.y, x_468.z, x_467.z);
  let x_471 : f32 = u_xlat0.w;
  u_xlat15 = floor(x_471);
  let x_474 : vec4<f32> = x_26.x_Lut_Params;
  let x_476 : vec2<f32> = (vec2<f32>(x_474.x, x_474.y) * vec2<f32>(0.5f, 0.5f));
  let x_477 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_476.x, x_476.y, x_477.z, x_477.w);
  let x_479 : vec4<f32> = u_xlat0;
  let x_482 : vec4<f32> = x_26.x_Lut_Params;
  let x_485 : vec4<f32> = u_xlat1;
  let x_487 : vec2<f32> = ((vec2<f32>(x_479.x, x_479.y) * vec2<f32>(x_482.x, x_482.y)) + vec2<f32>(x_485.x, x_485.y));
  let x_488 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_488.x, x_487.x, x_487.y, x_488.w);
  let x_490 : f32 = u_xlat15;
  let x_492 : f32 = x_26.x_Lut_Params.y;
  let x_495 : f32 = u_xlat1.y;
  u_xlat1.x = ((x_490 * x_492) + x_495);
  let x_502 : vec4<f32> = u_xlat1;
  let x_504 : vec4<f32> = textureSampleLevel(x_InternalLut, sampler_LinearClamp, vec2<f32>(x_502.x, x_502.z), 0.0f);
  let x_505 : vec3<f32> = vec3<f32>(x_504.x, x_504.y, x_504.z);
  let x_506 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_505.x, x_505.y, x_505.z, x_506.w);
  let x_509 : f32 = x_26.x_Lut_Params.y;
  u_xlat0.x = x_509;
  u_xlat0.y = 0.0f;
  let x_512 : vec4<f32> = u_xlat0;
  let x_514 : vec4<f32> = u_xlat1;
  let x_516 : vec2<f32> = (vec2<f32>(x_512.x, x_512.y) + vec2<f32>(x_514.x, x_514.z));
  let x_517 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_516.x, x_516.y, x_517.z, x_517.w);
  let x_522 : vec4<f32> = u_xlat0;
  let x_524 : vec4<f32> = textureSampleLevel(x_InternalLut, sampler_LinearClamp, vec2<f32>(x_522.x, x_522.y), 0.0f);
  let x_525 : vec3<f32> = vec3<f32>(x_524.x, x_524.y, x_524.z);
  let x_526 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_525.x, x_525.y, x_525.z, x_526.w);
  let x_529 : f32 = u_xlat0.z;
  let x_531 : f32 = x_26.x_Lut_Params.z;
  let x_533 : f32 = u_xlat15;
  u_xlat0.x = ((x_529 * x_531) + -(x_533));
  let x_538 : vec4<f32> = u_xlat2;
  let x_541 : vec4<f32> = u_xlat1;
  u_xlat5 = (-(vec3<f32>(x_538.x, x_538.y, x_538.z)) + vec3<f32>(x_541.x, x_541.y, x_541.z));
  let x_544 : vec4<f32> = u_xlat0;
  let x_546 : vec3<f32> = u_xlat5;
  let x_548 : vec4<f32> = u_xlat2;
  let x_550 : vec3<f32> = ((vec3<f32>(x_544.x, x_544.x, x_544.x) * x_546) + vec3<f32>(x_548.x, x_548.y, x_548.z));
  let x_551 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_550.x, x_550.y, x_550.z, x_551.w);
  let x_553 : vec4<f32> = u_xlat0;
  let x_555 : vec3<f32> = (vec3<f32>(x_553.x, x_553.y, x_553.z) * vec3<f32>(12.920000076f, 12.920000076f, 12.920000076f));
  let x_556 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_555.x, x_555.y, x_555.z, x_556.w);
  let x_558 : vec4<f32> = u_xlat0;
  let x_561 : vec3<f32> = log2(abs(vec3<f32>(x_558.x, x_558.y, x_558.z)));
  let x_562 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_561.x, x_561.y, x_561.z, x_562.w);
  let x_564 : vec4<f32> = u_xlat2;
  let x_566 : vec3<f32> = (vec3<f32>(x_564.x, x_564.y, x_564.z) * vec3<f32>(0.416666657f, 0.416666657f, 0.416666657f));
  let x_567 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_566.x, x_566.y, x_566.z, x_567.w);
  let x_569 : vec4<f32> = u_xlat2;
  let x_571 : vec3<f32> = exp2(vec3<f32>(x_569.x, x_569.y, x_569.z));
  let x_572 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_571.x, x_571.y, x_571.z, x_572.w);
  let x_574 : vec4<f32> = u_xlat2;
  let x_577 : vec3<f32> = ((vec3<f32>(x_574.x, x_574.y, x_574.z) * vec3<f32>(1.054999948f, 1.054999948f, 1.054999948f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
  let x_578 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_577.x, x_577.y, x_577.z, x_578.w);
  let x_581 : vec4<f32> = u_xlat0;
  let x_583 : vec4<bool> = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0.0f) >= vec4<f32>(x_581.x, x_581.y, x_581.z, x_581.x));
  u_xlatb0 = vec3<bool>(x_583.x, x_583.y, x_583.z);
  let x_588 : bool = u_xlatb0.x;
  if (x_588) {
    let x_593 : f32 = u_xlat1.x;
    x_589 = x_593;
  } else {
    let x_596 : f32 = u_xlat2.x;
    x_589 = x_596;
  }
  let x_597 : f32 = x_589;
  SV_Target0.x = x_597;
  let x_601 : bool = u_xlatb0.y;
  if (x_601) {
    let x_606 : f32 = u_xlat1.y;
    x_602 = x_606;
  } else {
    let x_609 : f32 = u_xlat2.y;
    x_602 = x_609;
  }
  let x_610 : f32 = x_602;
  SV_Target0.y = x_610;
  let x_613 : bool = u_xlatb0.z;
  if (x_613) {
    let x_618 : f32 = u_xlat1.z;
    x_614 = x_618;
  } else {
    let x_621 : f32 = u_xlat2.z;
    x_614 = x_621;
  }
  let x_622 : f32 = x_614;
  SV_Target0.z = x_622;
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

