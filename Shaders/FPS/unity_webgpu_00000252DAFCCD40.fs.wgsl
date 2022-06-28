struct PGlobals {
  x_Time : vec4<f32>,
  x_WorldSpaceCameraPos : vec3<f32>,
  @size(4)
  padding : u32,
  x_WorldSpaceLightPos0 : vec4<f32>,
  unity_OcclusionMaskSelector : vec4<f32>,
  unity_ProbeVolumeParams : vec4<f32>,
  unity_ProbeVolumeWorldToObject : mat4x4<f32>,
  unity_ProbeVolumeSizeInv : vec3<f32>,
  @size(4)
  padding_1 : u32,
  unity_ProbeVolumeMin : vec3<f32>,
  @size(4)
  padding_2 : u32,
  x_LightColor0 : vec4<f32>,
  x_SpecColor : vec4<f32>,
  unity_WorldToLight : mat4x4<f32>,
  x_FaceUVSpeedX : f32,
  x_FaceUVSpeedY : f32,
  @size(8)
  padding_3 : u32,
  x_FaceColor : vec4<f32>,
  x_OutlineSoftness : f32,
  x_OutlineUVSpeedX : f32,
  x_OutlineUVSpeedY : f32,
  @size(4)
  padding_4 : u32,
  x_OutlineColor : vec4<f32>,
  x_OutlineWidth : f32,
  x_Bevel : f32,
  x_BevelOffset : f32,
  x_BevelWidth : f32,
  x_BevelClamp : f32,
  x_BevelRoundness : f32,
  x_BumpOutline : f32,
  x_BumpFace : f32,
  x_ShaderFlags : f32,
  x_ScaleRatioA : f32,
  x_TextureWidth : f32,
  x_TextureHeight : f32,
  x_GradientScale : f32,
  x_FaceShininess : f32,
  x_OutlineShininess : f32,
}

var<private> u_xlat0 : vec4<f32>;

var<private> vs_TEXCOORD5 : vec3<f32>;

@group(0) @binding(0) var<uniform> x_18 : PGlobals;

var<private> u_xlat18 : f32;

var<private> u_xlat1 : vec4<f32>;

var<private> u_xlat2 : vec4<f32>;

var<private> vs_TEXCOORD0 : vec4<f32>;

var<private> u_xlat3 : vec4<f32>;

@group(0) @binding(1) var x_MainTex : texture_2d<f32>;

@group(0) @binding(12) var sampler_MainTex : sampler;

var<private> vs_TEXCOORD6 : vec2<f32>;

var<private> u_xlat7 : vec3<f32>;

var<private> vs_COLOR0 : vec4<f32>;

var<private> u_xlat4 : vec4<f32>;

var<private> u_xlat10 : vec3<f32>;

var<private> u_xlat5 : vec4<f32>;

@group(0) @binding(2) var x_FaceTex : texture_2d<f32>;

@group(0) @binding(9) var sampler_FaceTex : sampler;

var<private> vs_TEXCOORD1 : vec2<f32>;

@group(0) @binding(3) var x_OutlineTex : texture_2d<f32>;

@group(0) @binding(10) var sampler_OutlineTex : sampler;

var<private> u_xlat19 : f32;

var<private> u_xlat13 : f32;

var<private> u_xlatb8 : bool;

var<private> u_xlatb2 : bool;

var<private> u_xlat8 : vec2<f32>;

@group(0) @binding(4) var x_BumpMap : texture_2d<f32>;

@group(0) @binding(11) var sampler_BumpMap : sampler;

var<private> u_xlat21 : f32;

var<private> u_xlatb15 : bool;

var<private> u_xlat15 : f32;

@group(0) @binding(6) var unity_ProbeVolumeSH : texture_3d<f32>;

@group(0) @binding(7) var samplerunity_ProbeVolumeSH : sampler;

@group(0) @binding(5) var x_LightTexture0 : texture_2d<f32>;

@group(0) @binding(8) var sampler_LightTexture0 : sampler;

var<private> vs_TEXCOORD2 : vec3<f32>;

var<private> vs_TEXCOORD3 : vec3<f32>;

var<private> vs_TEXCOORD4 : vec3<f32>;

var<private> u_xlat6 : f32;

var<private> SV_Target0 : vec4<f32>;

var<private> gl_FragCoord : vec4<f32>;

fn main_1() {
  var x_361 : f32;
  var x_777 : vec3<f32>;
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_13 : vec3<f32> = vs_TEXCOORD5;
  let x_23 : vec3<f32> = x_18.x_WorldSpaceCameraPos;
  let x_24 : vec3<f32> = (-(x_13) + x_23);
  let x_25 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_24.x, x_24.y, x_24.z, x_25.w);
  let x_29 : vec4<f32> = u_xlat0;
  let x_31 : vec4<f32> = u_xlat0;
  u_xlat18 = dot(vec3<f32>(x_29.x, x_29.y, x_29.z), vec3<f32>(x_31.x, x_31.y, x_31.z));
  let x_34 : f32 = u_xlat18;
  u_xlat18 = inverseSqrt(x_34);
  let x_43 : f32 = x_18.x_TextureWidth;
  let x_46 : f32 = x_18.x_TextureHeight;
  let x_48 : vec2<f32> = (vec2<f32>(1.0f, 1.0f) / vec2<f32>(x_43, x_46));
  let x_49 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_48.x, x_48.y, x_49.z, x_49.w);
  u_xlat1.z = 0.0f;
  let x_56 : vec4<f32> = u_xlat1;
  let x_61 : vec4<f32> = vs_TEXCOORD0;
  u_xlat2 = (-(vec4<f32>(x_56.x, x_56.z, x_56.z, x_56.y)) + vec4<f32>(x_61.x, x_61.y, x_61.x, x_61.y));
  let x_75 : vec4<f32> = u_xlat2;
  let x_77 : vec4<f32> = textureSample(x_MainTex, sampler_MainTex, vec2<f32>(x_75.x, x_75.y));
  u_xlat3.x = x_77.w;
  let x_82 : vec4<f32> = u_xlat1;
  let x_84 : vec4<f32> = vs_TEXCOORD0;
  u_xlat1 = (vec4<f32>(x_82.x, x_82.z, x_82.z, x_82.y) + vec4<f32>(x_84.x, x_84.y, x_84.x, x_84.y));
  let x_90 : vec4<f32> = u_xlat1;
  let x_92 : vec4<f32> = textureSample(x_MainTex, sampler_MainTex, vec2<f32>(x_90.x, x_90.y));
  u_xlat3.y = x_92.w;
  let x_99 : vec4<f32> = u_xlat2;
  let x_101 : vec4<f32> = textureSample(x_MainTex, sampler_MainTex, vec2<f32>(x_99.z, x_99.w));
  u_xlat3.z = x_101.w;
  let x_107 : vec4<f32> = u_xlat1;
  let x_109 : vec4<f32> = textureSample(x_MainTex, sampler_MainTex, vec2<f32>(x_107.z, x_107.w));
  u_xlat3.w = x_109.w;
  let x_115 : vec4<f32> = vs_TEXCOORD0;
  let x_117 : vec4<f32> = textureSample(x_MainTex, sampler_MainTex, vec2<f32>(x_115.x, x_115.y));
  u_xlat1.x = x_117.w;
  let x_121 : f32 = u_xlat1.x;
  u_xlat1.x = (-(x_121) + 0.5f);
  let x_127 : f32 = u_xlat1.x;
  let x_132 : f32 = vs_TEXCOORD6.x;
  u_xlat1.x = (x_127 + -(x_132));
  let x_137 : f32 = u_xlat1.x;
  let x_139 : f32 = vs_TEXCOORD6.y;
  u_xlat1.x = ((x_137 * x_139) + 0.5f);
  let x_147 : f32 = x_18.x_OutlineWidth;
  let x_150 : f32 = x_18.x_ScaleRatioA;
  u_xlat7.x = (x_147 * x_150);
  let x_155 : f32 = x_18.x_OutlineSoftness;
  let x_157 : f32 = x_18.x_ScaleRatioA;
  u_xlat7.y = (x_155 * x_157);
  let x_160 : vec3<f32> = u_xlat7;
  let x_162 : vec2<f32> = vs_TEXCOORD6;
  let x_164 : vec2<f32> = (vec2<f32>(x_160.x, x_160.y) * vec2<f32>(x_162.y, x_162.y));
  let x_165 : vec3<f32> = u_xlat7;
  u_xlat7 = vec3<f32>(x_164.x, x_165.y, x_164.y);
  let x_168 : vec4<f32> = vs_COLOR0;
  let x_172 : vec4<f32> = x_18.x_FaceColor;
  u_xlat2 = (x_168 * x_172);
  let x_176 : f32 = vs_COLOR0.w;
  let x_179 : f32 = x_18.x_OutlineColor.w;
  u_xlat4.x = (x_176 * x_179);
  let x_185 : f32 = x_18.x_FaceUVSpeedX;
  let x_188 : f32 = x_18.x_FaceUVSpeedY;
  let x_192 : vec4<f32> = x_18.x_Time;
  let x_195 : vec4<f32> = vs_TEXCOORD0;
  let x_197 : vec2<f32> = ((vec2<f32>(x_185, x_188) * vec2<f32>(x_192.y, x_192.y)) + vec2<f32>(x_195.z, x_195.w));
  let x_198 : vec3<f32> = u_xlat10;
  u_xlat10 = vec3<f32>(x_197.x, x_197.y, x_198.z);
  let x_206 : vec3<f32> = u_xlat10;
  let x_208 : vec4<f32> = textureSample(x_FaceTex, sampler_FaceTex, vec2<f32>(x_206.x, x_206.y));
  u_xlat5 = x_208;
  let x_209 : vec4<f32> = u_xlat2;
  let x_210 : vec4<f32> = u_xlat5;
  u_xlat2 = (x_209 * x_210);
  let x_214 : f32 = x_18.x_OutlineUVSpeedX;
  let x_217 : f32 = x_18.x_OutlineUVSpeedY;
  let x_220 : vec4<f32> = x_18.x_Time;
  let x_224 : vec2<f32> = vs_TEXCOORD1;
  let x_225 : vec2<f32> = ((vec2<f32>(x_214, x_217) * vec2<f32>(x_220.y, x_220.y)) + x_224);
  let x_226 : vec3<f32> = u_xlat10;
  u_xlat10 = vec3<f32>(x_225.x, x_225.y, x_226.z);
  let x_233 : vec3<f32> = u_xlat10;
  let x_235 : vec4<f32> = textureSample(x_OutlineTex, sampler_OutlineTex, vec2<f32>(x_233.x, x_233.y));
  u_xlat5 = x_235;
  let x_236 : vec4<f32> = u_xlat5;
  let x_239 : vec4<f32> = x_18.x_OutlineColor;
  u_xlat10 = (vec3<f32>(x_236.x, x_236.y, x_236.z) * vec3<f32>(x_239.x, x_239.y, x_239.z));
  let x_243 : f32 = u_xlat4.x;
  let x_245 : f32 = u_xlat5.w;
  u_xlat5.w = (x_243 * x_245);
  let x_249 : f32 = u_xlat7.x;
  let x_253 : f32 = u_xlat1.x;
  u_xlat4.x = ((-(x_249) * 0.5f) + x_253);
  let x_258 : f32 = u_xlat7.z;
  let x_261 : f32 = u_xlat4.x;
  u_xlat19 = ((x_258 * 0.5f) + x_261);
  let x_265 : f32 = u_xlat7.y;
  let x_267 : f32 = vs_TEXCOORD6.y;
  u_xlat13 = ((x_265 * x_267) + 1.0f);
  let x_270 : f32 = u_xlat19;
  let x_271 : f32 = u_xlat13;
  u_xlat13 = (x_270 / x_271);
  let x_273 : f32 = u_xlat13;
  u_xlat13 = clamp(x_273, 0.0f, 1.0f);
  let x_275 : f32 = u_xlat13;
  u_xlat13 = (-(x_275) + 1.0f);
  let x_279 : f32 = u_xlat7.x;
  let x_282 : f32 = u_xlat1.x;
  u_xlat1.x = ((x_279 * 0.5f) + x_282);
  let x_286 : f32 = u_xlat1.x;
  u_xlat1.x = clamp(x_286, 0.0f, 1.0f);
  let x_290 : f32 = u_xlat7.x;
  u_xlat7.x = min(x_290, 1.0f);
  let x_294 : f32 = u_xlat7.x;
  u_xlat7.x = sqrt(x_294);
  let x_298 : f32 = u_xlat7.x;
  let x_300 : f32 = u_xlat1.x;
  u_xlat7.x = (x_298 * x_300);
  let x_303 : vec4<f32> = u_xlat2;
  let x_305 : vec4<f32> = u_xlat2;
  let x_307 : vec3<f32> = (vec3<f32>(x_303.w, x_303.w, x_303.w) * vec3<f32>(x_305.x, x_305.y, x_305.z));
  let x_308 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_307.x, x_307.y, x_307.z, x_308.w);
  let x_310 : vec3<f32> = u_xlat10;
  let x_311 : vec4<f32> = u_xlat5;
  let x_313 : vec3<f32> = (x_310 * vec3<f32>(x_311.w, x_311.w, x_311.w));
  let x_314 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_313.x, x_313.y, x_313.z, x_314.w);
  let x_316 : vec4<f32> = u_xlat2;
  let x_318 : vec4<f32> = u_xlat5;
  u_xlat4 = (-(x_316) + x_318);
  let x_320 : vec3<f32> = u_xlat7;
  let x_322 : vec4<f32> = u_xlat4;
  let x_324 : vec4<f32> = u_xlat2;
  u_xlat2 = ((vec4<f32>(x_320.x, x_320.x, x_320.x, x_320.x) * x_322) + x_324);
  let x_326 : f32 = u_xlat13;
  let x_328 : vec4<f32> = u_xlat2;
  u_xlat2 = (vec4<f32>(x_326, x_326, x_326, x_326) * x_328);
  let x_331 : f32 = u_xlat2.w;
  u_xlat7.x = max(x_331, 0.0001f);
  let x_335 : vec4<f32> = u_xlat2;
  let x_337 : vec3<f32> = u_xlat7;
  u_xlat7 = (vec3<f32>(x_335.x, x_335.y, x_335.z) / vec3<f32>(x_337.x, x_337.x, x_337.x));
  let x_342 : f32 = x_18.x_ShaderFlags;
  u_xlat2.x = (x_342 * 0.5f);
  let x_349 : f32 = u_xlat2.x;
  let x_351 : f32 = u_xlat2.x;
  u_xlatb8 = (x_349 >= -(x_351));
  let x_355 : f32 = u_xlat2.x;
  u_xlat2.x = fract(abs(x_355));
  let x_359 : bool = u_xlatb8;
  if (x_359) {
    let x_365 : f32 = u_xlat2.x;
    x_361 = x_365;
  } else {
    let x_368 : f32 = u_xlat2.x;
    x_361 = -(x_368);
  }
  let x_370 : f32 = x_361;
  u_xlat2.x = x_370;
  let x_374 : f32 = u_xlat2.x;
  u_xlatb2 = (x_374 >= 0.5f);
  let x_379 : f32 = vs_TEXCOORD6.x;
  let x_382 : f32 = x_18.x_BevelOffset;
  u_xlat8.x = (x_379 + x_382);
  let x_385 : vec2<f32> = u_xlat8;
  let x_387 : vec4<f32> = u_xlat3;
  u_xlat3 = (vec4<f32>(x_385.x, x_385.x, x_385.x, x_385.x) + x_387);
  let x_391 : f32 = x_18.x_BevelWidth;
  let x_393 : f32 = x_18.x_OutlineWidth;
  u_xlat8.x = (x_391 + x_393);
  let x_397 : f32 = u_xlat8.x;
  u_xlat8.x = max(x_397, 0.01f);
  let x_401 : vec4<f32> = u_xlat3;
  u_xlat3 = (x_401 + vec4<f32>(-0.5f, -0.5f, -0.5f, -0.5f));
  let x_405 : vec4<f32> = u_xlat3;
  let x_406 : vec2<f32> = u_xlat8;
  u_xlat3 = (x_405 / vec4<f32>(x_406.x, x_406.x, x_406.x, x_406.x));
  let x_409 : vec4<f32> = u_xlat3;
  u_xlat3 = (x_409 + vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
  let x_412 : vec4<f32> = u_xlat3;
  u_xlat3 = clamp(x_412, vec4<f32>(0.0f, 0.0f, 0.0f, 0.0f), vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_416 : vec4<f32> = u_xlat3;
  u_xlat4 = ((x_416 * vec4<f32>(2.0f, 2.0f, 2.0f, 2.0f)) + vec4<f32>(-1.0f, -1.0f, -1.0f, -1.0f));
  let x_423 : vec4<f32> = u_xlat4;
  u_xlat4 = (-(abs(x_423)) + vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_428 : bool = u_xlatb2;
  let x_429 : vec4<f32> = u_xlat4;
  let x_430 : vec4<f32> = u_xlat3;
  u_xlat3 = select(x_430, x_429, vec4<bool>(x_428, x_428, x_428, x_428));
  let x_434 : vec4<f32> = u_xlat3;
  u_xlat4 = (x_434 * vec4<f32>(1.570796013f, 1.570796013f, 1.570796013f, 1.570796013f));
  let x_438 : vec4<f32> = u_xlat4;
  u_xlat4 = sin(x_438);
  let x_440 : vec4<f32> = u_xlat3;
  let x_442 : vec4<f32> = u_xlat4;
  u_xlat4 = (-(x_440) + x_442);
  let x_446 : f32 = x_18.x_BevelRoundness;
  let x_448 : f32 = x_18.x_BevelRoundness;
  let x_450 : f32 = x_18.x_BevelRoundness;
  let x_452 : f32 = x_18.x_BevelRoundness;
  let x_453 : vec4<f32> = vec4<f32>(x_446, x_448, x_450, x_452);
  let x_459 : vec4<f32> = u_xlat4;
  let x_461 : vec4<f32> = u_xlat3;
  u_xlat3 = ((vec4<f32>(x_453.x, x_453.y, x_453.z, x_453.w) * x_459) + x_461);
  let x_465 : f32 = x_18.x_BevelClamp;
  u_xlat2.x = (-(x_465) + 1.0f);
  let x_469 : vec4<f32> = u_xlat2;
  let x_471 : vec4<f32> = u_xlat3;
  u_xlat3 = min(vec4<f32>(x_469.x, x_469.x, x_469.x, x_469.x), x_471);
  let x_474 : f32 = u_xlat8.x;
  let x_477 : f32 = x_18.x_Bevel;
  u_xlat2.x = (x_474 * x_477);
  let x_481 : f32 = u_xlat2.x;
  let x_484 : f32 = x_18.x_GradientScale;
  u_xlat2.x = (x_481 * x_484);
  let x_488 : f32 = u_xlat2.x;
  u_xlat2.x = (x_488 * -2.0f);
  let x_492 : vec4<f32> = u_xlat2;
  let x_494 : vec4<f32> = u_xlat3;
  u_xlat8 = (vec2<f32>(x_492.x, x_492.x) * vec2<f32>(x_494.x, x_494.z));
  let x_497 : vec4<f32> = u_xlat3;
  let x_499 : vec4<f32> = u_xlat2;
  let x_502 : vec2<f32> = u_xlat8;
  let x_505 : vec2<f32> = ((vec2<f32>(x_497.w, x_497.y) * vec2<f32>(x_499.x, x_499.x)) + -(vec2<f32>(x_502.y, x_502.x)));
  let x_506 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_506.x, x_505.x, x_505.y, x_506.w);
  u_xlat3.x = -1.0f;
  u_xlat3.w = 1.0f;
  let x_510 : vec4<f32> = u_xlat3;
  let x_512 : vec4<f32> = u_xlat3;
  u_xlat2.x = dot(vec2<f32>(x_510.z, x_510.w), vec2<f32>(x_512.z, x_512.w));
  let x_517 : f32 = u_xlat2.x;
  u_xlat2.x = inverseSqrt(x_517);
  let x_520 : vec4<f32> = u_xlat2;
  let x_523 : vec2<f32> = (vec2<f32>(x_520.x, x_520.x) * vec2<f32>(1.0f, 0.0f));
  let x_524 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_524.x, x_523.x, x_523.y, x_524.w);
  let x_527 : f32 = u_xlat2.x;
  let x_529 : f32 = u_xlat3.z;
  u_xlat4.x = (x_527 * x_529);
  let x_532 : vec4<f32> = u_xlat3;
  let x_534 : vec4<f32> = u_xlat3;
  u_xlat2.x = dot(vec2<f32>(x_532.x, x_532.y), vec2<f32>(x_534.x, x_534.y));
  let x_539 : f32 = u_xlat2.x;
  u_xlat2.x = inverseSqrt(x_539);
  u_xlat3.z = 0.0f;
  let x_543 : vec4<f32> = u_xlat2;
  let x_545 : vec4<f32> = u_xlat3;
  let x_547 : vec3<f32> = (vec3<f32>(x_543.x, x_543.x, x_543.x) * vec3<f32>(x_545.x, x_545.y, x_545.z));
  let x_548 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_547.x, x_547.y, x_547.z, x_548.w);
  let x_550 : vec4<f32> = u_xlat2;
  let x_552 : vec4<f32> = u_xlat4;
  let x_554 : vec3<f32> = (vec3<f32>(x_550.x, x_550.y, x_550.z) * vec3<f32>(x_552.x, x_552.y, x_552.z));
  let x_555 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_554.x, x_554.y, x_554.z, x_555.w);
  let x_557 : vec4<f32> = u_xlat4;
  let x_559 : vec4<f32> = u_xlat2;
  let x_562 : vec4<f32> = u_xlat3;
  let x_565 : vec3<f32> = ((vec3<f32>(x_557.z, x_557.x, x_557.y) * vec3<f32>(x_559.y, x_559.z, x_559.x)) + -(vec3<f32>(x_562.x, x_562.y, x_562.z)));
  let x_566 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_565.x, x_565.y, x_565.z, x_566.w);
  let x_573 : vec4<f32> = vs_TEXCOORD0;
  let x_575 : vec4<f32> = textureSample(x_BumpMap, sampler_BumpMap, vec2<f32>(x_573.z, x_573.w));
  let x_576 : vec3<f32> = vec3<f32>(x_575.x, x_575.y, x_575.w);
  let x_577 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_576.x, x_576.y, x_576.z, x_577.w);
  let x_580 : f32 = u_xlat3.z;
  let x_582 : f32 = u_xlat3.x;
  u_xlat3.x = (x_580 * x_582);
  let x_585 : vec4<f32> = u_xlat3;
  let x_590 : vec2<f32> = ((vec2<f32>(x_585.x, x_585.y) * vec2<f32>(2.0f, 2.0f)) + vec2<f32>(-1.0f, -1.0f));
  let x_591 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_590.x, x_590.y, x_591.z, x_591.w);
  let x_594 : vec4<f32> = u_xlat3;
  let x_596 : vec4<f32> = u_xlat3;
  u_xlat21 = dot(vec2<f32>(x_594.x, x_594.y), vec2<f32>(x_596.x, x_596.y));
  let x_599 : f32 = u_xlat21;
  u_xlat21 = min(x_599, 1.0f);
  let x_601 : f32 = u_xlat21;
  u_xlat21 = (-(x_601) + 1.0f);
  let x_604 : f32 = u_xlat21;
  u_xlat3.z = sqrt(x_604);
  let x_609 : f32 = x_18.x_BumpFace;
  let x_613 : f32 = x_18.x_BumpOutline;
  u_xlat21 = (-(x_609) + x_613);
  let x_616 : f32 = u_xlat1.x;
  let x_617 : f32 = u_xlat21;
  let x_620 : f32 = x_18.x_BumpFace;
  u_xlat21 = ((x_616 * x_617) + x_620);
  let x_622 : vec4<f32> = u_xlat3;
  let x_624 : f32 = u_xlat21;
  let x_629 : vec3<f32> = ((vec3<f32>(x_622.x, x_622.y, x_622.z) * vec3<f32>(x_624, x_624, x_624)) + vec3<f32>(-0.0f, -0.0f, -1.0f));
  let x_630 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_629.x, x_629.y, x_629.z, x_630.w);
  let x_632 : vec4<f32> = u_xlat2;
  let x_634 : vec4<f32> = u_xlat3;
  let x_638 : vec3<f32> = ((vec3<f32>(x_632.w, x_632.w, x_632.w) * vec3<f32>(x_634.x, x_634.y, x_634.z)) + vec3<f32>(0.0f, 0.0f, 1.0f));
  let x_639 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_638.x, x_638.y, x_638.z, x_639.w);
  let x_641 : vec4<f32> = u_xlat2;
  let x_643 : vec4<f32> = u_xlat3;
  let x_646 : vec3<f32> = (vec3<f32>(x_641.x, x_641.y, x_641.z) + -(vec3<f32>(x_643.x, x_643.y, x_643.z)));
  let x_647 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_646.x, x_646.y, x_646.z, x_647.w);
  let x_649 : vec4<f32> = u_xlat2;
  let x_651 : vec4<f32> = u_xlat2;
  u_xlat3.x = dot(vec3<f32>(x_649.x, x_649.y, x_649.z), vec3<f32>(x_651.x, x_651.y, x_651.z));
  let x_656 : f32 = u_xlat3.x;
  u_xlat3.x = inverseSqrt(x_656);
  let x_659 : vec4<f32> = u_xlat2;
  let x_661 : vec4<f32> = u_xlat3;
  let x_663 : vec3<f32> = (vec3<f32>(x_659.x, x_659.y, x_659.z) * vec3<f32>(x_661.x, x_661.x, x_661.x));
  let x_664 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_663.x, x_663.y, x_663.z, x_664.w);
  let x_668 : f32 = x_18.x_FaceShininess;
  let x_672 : f32 = x_18.x_OutlineShininess;
  u_xlat3.x = (-(x_668) + x_672);
  let x_676 : f32 = u_xlat1.x;
  let x_678 : f32 = u_xlat3.x;
  let x_681 : f32 = x_18.x_FaceShininess;
  u_xlat1.x = ((x_676 * x_678) + x_681);
  let x_684 : vec3<f32> = vs_TEXCOORD5;
  let x_688 : vec4<f32> = x_18.unity_WorldToLight[1i];
  let x_690 : vec2<f32> = (vec2<f32>(x_684.y, x_684.y) * vec2<f32>(x_688.x, x_688.y));
  let x_691 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_690.x, x_690.y, x_691.z, x_691.w);
  let x_694 : vec4<f32> = x_18.unity_WorldToLight[0i];
  let x_696 : vec3<f32> = vs_TEXCOORD5;
  let x_699 : vec4<f32> = u_xlat3;
  let x_701 : vec2<f32> = ((vec2<f32>(x_694.x, x_694.y) * vec2<f32>(x_696.x, x_696.x)) + vec2<f32>(x_699.x, x_699.y));
  let x_702 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_701.x, x_701.y, x_702.z, x_702.w);
  let x_706 : vec4<f32> = x_18.unity_WorldToLight[2i];
  let x_708 : vec3<f32> = vs_TEXCOORD5;
  let x_711 : vec4<f32> = u_xlat3;
  let x_713 : vec2<f32> = ((vec2<f32>(x_706.x, x_706.y) * vec2<f32>(x_708.z, x_708.z)) + vec2<f32>(x_711.x, x_711.y));
  let x_714 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_713.x, x_713.y, x_714.z, x_714.w);
  let x_716 : vec4<f32> = u_xlat3;
  let x_720 : vec4<f32> = x_18.unity_WorldToLight[3i];
  let x_722 : vec2<f32> = (vec2<f32>(x_716.x, x_716.y) + vec2<f32>(x_720.x, x_720.y));
  let x_723 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_722.x, x_722.y, x_723.z, x_723.w);
  let x_728 : f32 = x_18.unity_ProbeVolumeParams.x;
  u_xlatb15 = (x_728 == 1.0f);
  let x_730 : bool = u_xlatb15;
  if (x_730) {
    let x_734 : f32 = x_18.unity_ProbeVolumeParams.y;
    u_xlatb15 = (x_734 == 1.0f);
    let x_736 : vec3<f32> = vs_TEXCOORD5;
    let x_740 : vec4<f32> = x_18.unity_ProbeVolumeWorldToObject[1i];
    let x_742 : vec3<f32> = (vec3<f32>(x_736.y, x_736.y, x_736.y) * vec3<f32>(x_740.x, x_740.y, x_740.z));
    let x_743 : vec4<f32> = u_xlat4;
    u_xlat4 = vec4<f32>(x_742.x, x_742.y, x_742.z, x_743.w);
    let x_746 : vec4<f32> = x_18.unity_ProbeVolumeWorldToObject[0i];
    let x_748 : vec3<f32> = vs_TEXCOORD5;
    let x_751 : vec4<f32> = u_xlat4;
    let x_753 : vec3<f32> = ((vec3<f32>(x_746.x, x_746.y, x_746.z) * vec3<f32>(x_748.x, x_748.x, x_748.x)) + vec3<f32>(x_751.x, x_751.y, x_751.z));
    let x_754 : vec4<f32> = u_xlat4;
    u_xlat4 = vec4<f32>(x_753.x, x_753.y, x_753.z, x_754.w);
    let x_757 : vec4<f32> = x_18.unity_ProbeVolumeWorldToObject[2i];
    let x_759 : vec3<f32> = vs_TEXCOORD5;
    let x_762 : vec4<f32> = u_xlat4;
    let x_764 : vec3<f32> = ((vec3<f32>(x_757.x, x_757.y, x_757.z) * vec3<f32>(x_759.z, x_759.z, x_759.z)) + vec3<f32>(x_762.x, x_762.y, x_762.z));
    let x_765 : vec4<f32> = u_xlat4;
    u_xlat4 = vec4<f32>(x_764.x, x_764.y, x_764.z, x_765.w);
    let x_767 : vec4<f32> = u_xlat4;
    let x_770 : vec4<f32> = x_18.unity_ProbeVolumeWorldToObject[3i];
    let x_772 : vec3<f32> = (vec3<f32>(x_767.x, x_767.y, x_767.z) + vec3<f32>(x_770.x, x_770.y, x_770.z));
    let x_773 : vec4<f32> = u_xlat4;
    u_xlat4 = vec4<f32>(x_772.x, x_772.y, x_772.z, x_773.w);
    let x_775 : bool = u_xlatb15;
    if (x_775) {
      let x_780 : vec4<f32> = u_xlat4;
      x_777 = vec3<f32>(x_780.x, x_780.y, x_780.z);
    } else {
      let x_783 : vec3<f32> = vs_TEXCOORD5;
      x_777 = x_783;
    }
    let x_784 : vec3<f32> = x_777;
    let x_785 : vec4<f32> = u_xlat4;
    u_xlat4 = vec4<f32>(x_784.x, x_784.y, x_784.z, x_785.w);
    let x_787 : vec4<f32> = u_xlat4;
    let x_791 : vec3<f32> = x_18.unity_ProbeVolumeMin;
    let x_793 : vec3<f32> = (vec3<f32>(x_787.x, x_787.y, x_787.z) + -(x_791));
    let x_794 : vec4<f32> = u_xlat4;
    u_xlat4 = vec4<f32>(x_793.x, x_793.y, x_793.z, x_794.w);
    let x_796 : vec4<f32> = u_xlat4;
    let x_800 : vec3<f32> = x_18.unity_ProbeVolumeSizeInv;
    let x_801 : vec3<f32> = (vec3<f32>(x_796.x, x_796.y, x_796.z) * x_800);
    let x_802 : vec4<f32> = u_xlat4;
    u_xlat4 = vec4<f32>(x_802.x, x_801.x, x_801.y, x_801.z);
    let x_806 : f32 = u_xlat4.y;
    u_xlat15 = ((x_806 * 0.25f) + 0.75f);
    let x_812 : f32 = x_18.unity_ProbeVolumeParams.z;
    u_xlat21 = ((x_812 * 0.5f) + 0.75f);
    let x_815 : f32 = u_xlat21;
    let x_816 : f32 = u_xlat15;
    u_xlat4.x = max(x_815, x_816);
    let x_827 : vec4<f32> = u_xlat4;
    let x_829 : vec4<f32> = textureSample(unity_ProbeVolumeSH, samplerunity_ProbeVolumeSH, vec3<f32>(x_827.x, x_827.z, x_827.w));
    u_xlat4 = x_829;
  } else {
    u_xlat4.x = 1.0f;
    u_xlat4.y = 1.0f;
    u_xlat4.z = 1.0f;
    u_xlat4.w = 1.0f;
  }
  let x_835 : vec4<f32> = u_xlat4;
  let x_837 : vec4<f32> = x_18.unity_OcclusionMaskSelector;
  u_xlat15 = dot(x_835, x_837);
  let x_839 : f32 = u_xlat15;
  u_xlat15 = clamp(x_839, 0.0f, 1.0f);
  let x_846 : vec4<f32> = u_xlat3;
  let x_848 : vec4<f32> = textureSample(x_LightTexture0, sampler_LightTexture0, vec2<f32>(x_846.x, x_846.y));
  u_xlat3.x = x_848.w;
  let x_851 : f32 = u_xlat15;
  let x_853 : f32 = u_xlat3.x;
  u_xlat3.x = (x_851 * x_853);
  let x_857 : vec3<f32> = vs_TEXCOORD2;
  let x_858 : vec4<f32> = u_xlat2;
  u_xlat4.x = dot(x_857, -(vec3<f32>(x_858.x, x_858.y, x_858.z)));
  let x_864 : vec3<f32> = vs_TEXCOORD3;
  let x_865 : vec4<f32> = u_xlat2;
  u_xlat4.y = dot(x_864, -(vec3<f32>(x_865.x, x_865.y, x_865.z)));
  let x_871 : vec3<f32> = vs_TEXCOORD4;
  let x_872 : vec4<f32> = u_xlat2;
  u_xlat4.z = dot(x_871, -(vec3<f32>(x_872.x, x_872.y, x_872.z)));
  let x_877 : vec4<f32> = u_xlat4;
  let x_879 : vec4<f32> = u_xlat4;
  u_xlat2.x = dot(vec3<f32>(x_877.x, x_877.y, x_877.z), vec3<f32>(x_879.x, x_879.y, x_879.z));
  let x_884 : f32 = u_xlat2.x;
  u_xlat2.x = inverseSqrt(x_884);
  let x_887 : vec4<f32> = u_xlat2;
  let x_889 : vec4<f32> = u_xlat4;
  let x_891 : vec3<f32> = (vec3<f32>(x_887.x, x_887.x, x_887.x) * vec3<f32>(x_889.x, x_889.y, x_889.z));
  let x_892 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_891.x, x_891.y, x_891.z, x_892.w);
  let x_894 : vec4<f32> = u_xlat3;
  let x_898 : vec4<f32> = x_18.x_LightColor0;
  let x_900 : vec3<f32> = (vec3<f32>(x_894.x, x_894.x, x_894.x) * vec3<f32>(x_898.x, x_898.y, x_898.z));
  let x_901 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_900.x, x_900.y, x_900.z, x_901.w);
  let x_903 : vec4<f32> = u_xlat0;
  let x_905 : f32 = u_xlat18;
  let x_909 : vec4<f32> = x_18.x_WorldSpaceLightPos0;
  let x_911 : vec3<f32> = ((vec3<f32>(x_903.x, x_903.y, x_903.z) * vec3<f32>(x_905, x_905, x_905)) + vec3<f32>(x_909.x, x_909.y, x_909.z));
  let x_912 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_911.x, x_911.y, x_911.z, x_912.w);
  let x_914 : vec4<f32> = u_xlat0;
  let x_916 : vec4<f32> = u_xlat0;
  u_xlat18 = dot(vec3<f32>(x_914.x, x_914.y, x_914.z), vec3<f32>(x_916.x, x_916.y, x_916.z));
  let x_919 : f32 = u_xlat18;
  u_xlat18 = inverseSqrt(x_919);
  let x_921 : f32 = u_xlat18;
  let x_923 : vec4<f32> = u_xlat0;
  let x_925 : vec3<f32> = (vec3<f32>(x_921, x_921, x_921) * vec3<f32>(x_923.x, x_923.y, x_923.z));
  let x_926 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_925.x, x_925.y, x_925.z, x_926.w);
  let x_928 : vec4<f32> = u_xlat2;
  let x_931 : vec4<f32> = x_18.x_WorldSpaceLightPos0;
  u_xlat0.w = dot(vec3<f32>(x_928.x, x_928.y, x_928.z), vec3<f32>(x_931.x, x_931.y, x_931.z));
  let x_935 : vec4<f32> = u_xlat2;
  let x_937 : vec4<f32> = u_xlat0;
  u_xlat0.x = dot(vec3<f32>(x_935.x, x_935.y, x_935.z), vec3<f32>(x_937.x, x_937.y, x_937.z));
  let x_941 : vec4<f32> = u_xlat0;
  let x_944 : vec2<f32> = max(vec2<f32>(x_941.x, x_941.w), vec2<f32>(0.0f, 0.0f));
  let x_945 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_944.x, x_945.y, x_945.z, x_944.y);
  let x_949 : f32 = u_xlat1.x;
  u_xlat6 = (x_949 * 128.0f);
  let x_953 : f32 = u_xlat0.x;
  u_xlat0.x = log2(x_953);
  let x_957 : f32 = u_xlat0.x;
  let x_958 : f32 = u_xlat6;
  u_xlat0.x = (x_957 * x_958);
  let x_962 : f32 = u_xlat0.x;
  u_xlat0.x = exp2(x_962);
  let x_965 : vec3<f32> = u_xlat7;
  let x_966 : vec4<f32> = u_xlat3;
  let x_968 : vec3<f32> = (x_965 * vec3<f32>(x_966.x, x_966.y, x_966.z));
  let x_969 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_968.x, x_968.y, x_968.z, x_969.w);
  let x_971 : vec4<f32> = u_xlat3;
  let x_975 : vec4<f32> = x_18.x_SpecColor;
  let x_977 : vec3<f32> = (vec3<f32>(x_971.x, x_971.y, x_971.z) * vec3<f32>(x_975.x, x_975.y, x_975.z));
  let x_978 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_977.x, x_977.y, x_977.z, x_978.w);
  let x_980 : vec4<f32> = u_xlat0;
  let x_982 : vec4<f32> = u_xlat2;
  let x_984 : vec3<f32> = (vec3<f32>(x_980.x, x_980.x, x_980.x) * vec3<f32>(x_982.x, x_982.y, x_982.z));
  let x_985 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_984.x, x_984.y, x_984.z, x_985.w);
  let x_989 : vec4<f32> = u_xlat1;
  let x_991 : vec4<f32> = u_xlat0;
  let x_994 : vec4<f32> = u_xlat0;
  let x_996 : vec3<f32> = ((vec3<f32>(x_989.x, x_989.y, x_989.z) * vec3<f32>(x_991.w, x_991.w, x_991.w)) + vec3<f32>(x_994.x, x_994.y, x_994.z));
  let x_997 : vec4<f32> = SV_Target0;
  SV_Target0 = vec4<f32>(x_996.x, x_996.y, x_996.z, x_997.w);
  let x_1000 : f32 = u_xlat2.w;
  SV_Target0.w = x_1000;
  return;
}

struct main_out {
  @location(0)
  SV_Target0_1 : vec4<f32>,
}

@fragment
fn main(@location(6) vs_TEXCOORD5_param : vec3<f32>, @location(0) vs_TEXCOORD0_param : vec4<f32>, @location(2) vs_TEXCOORD6_param : vec2<f32>, @location(7) vs_COLOR0_param : vec4<f32>, @location(1) vs_TEXCOORD1_param : vec2<f32>, @location(3) vs_TEXCOORD2_param : vec3<f32>, @location(4) vs_TEXCOORD3_param : vec3<f32>, @location(5) vs_TEXCOORD4_param : vec3<f32>, @builtin(position) gl_FragCoord_param : vec4<f32>) -> main_out {
  vs_TEXCOORD5 = vs_TEXCOORD5_param;
  vs_TEXCOORD0 = vs_TEXCOORD0_param;
  vs_TEXCOORD6 = vs_TEXCOORD6_param;
  vs_COLOR0 = vs_COLOR0_param;
  vs_TEXCOORD1 = vs_TEXCOORD1_param;
  vs_TEXCOORD2 = vs_TEXCOORD2_param;
  vs_TEXCOORD3 = vs_TEXCOORD3_param;
  vs_TEXCOORD4 = vs_TEXCOORD4_param;
  gl_FragCoord = gl_FragCoord_param;
  main_1();
  return main_out(SV_Target0);
}

