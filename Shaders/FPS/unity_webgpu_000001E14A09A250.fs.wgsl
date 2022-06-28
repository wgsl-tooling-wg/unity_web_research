type Arr = array<mat4x4<f32>, 4u>;

struct PGlobals {
  x_WorldSpaceCameraPos : vec3<f32>,
  @size(4)
  padding : u32,
  unity_OcclusionMaskSelector : vec4<f32>,
  unity_WorldToShadow : Arr,
  x_LightShadowData : vec4<f32>,
  unity_ShadowFadeCenterAndType : vec4<f32>,
  unity_MatrixV : mat4x4<f32>,
  unity_ProbeVolumeParams : vec4<f32>,
  unity_ProbeVolumeWorldToObject : mat4x4<f32>,
  unity_ProbeVolumeSizeInv : vec3<f32>,
  @size(4)
  padding_1 : u32,
  unity_ProbeVolumeMin : vec3<f32>,
  @size(4)
  padding_2 : u32,
  x_LightColor0 : vec4<f32>,
  x_ShadowMapTexture_TexelSize : vec4<f32>,
  x_Color : vec4<f32>,
  x_BumpScale : f32,
  x_GlossMapScale : f32,
  @size(8)
  padding_3 : u32,
  unity_WorldToLight : mat4x4<f32>,
}

var<private> u_xlat0 : vec4<f32>;

@group(0) @binding(2) var x_MetallicGlossMap : texture_2d<f32>;

@group(0) @binding(12) var sampler_MetallicGlossMap : sampler;

var<private> vs_TEXCOORD0 : vec4<f32>;

var<private> u_xlat1 : vec3<f32>;

@group(0) @binding(1) var x_MainTex : texture_2d<f32>;

@group(0) @binding(10) var sampler_MainTex : sampler;

var<private> u_xlat2 : vec4<f32>;

@group(0) @binding(0) var<uniform> x_49 : PGlobals;

@group(0) @binding(3) var x_BumpMap : texture_2d<f32>;

@group(0) @binding(11) var sampler_BumpMap : sampler;

var<private> u_xlat34 : f32;

var<private> u_xlat13 : vec3<f32>;

var<private> vs_TEXCOORD3 : vec4<f32>;

var<private> vs_TEXCOORD2 : vec4<f32>;

var<private> vs_TEXCOORD4 : vec4<f32>;

var<private> vs_TEXCOORD1 : vec4<f32>;

var<private> u_xlat3 : vec3<f32>;

var<private> u_xlat4 : vec4<f32>;

var<private> vs_TEXCOORD5 : vec3<f32>;

var<private> u_xlat5 : vec4<f32>;

var<private> u_xlat6 : vec4<f32>;

var<private> u_xlat35 : f32;

var<private> u_xlatb35 : bool;

var<private> u_xlat36 : f32;

@group(0) @binding(6) var unity_ProbeVolumeSH : texture_3d<f32>;

@group(0) @binding(8) var samplerunity_ProbeVolumeSH : sampler;

var<private> u_xlatb36 : bool;

var<private> u_xlat7 : vec4<f32>;

var<private> u_xlat8 : vec4<f32>;

var<private> u_xlat28 : vec2<f32>;

var<private> u_xlat9 : vec4<f32>;

var<private> u_xlat10 : vec4<f32>;

@group(0) @binding(7) var x_ShadowMapTexture : texture_depth_2d;

@group(0) @binding(9) var sampler_ShadowMapTexture : sampler_comparison;

@group(0) @binding(4) var x_LightTexture0 : texture_2d<f32>;

@group(0) @binding(13) var sampler_LightTexture0 : sampler;

@group(0) @binding(5) var x_LightTextureB0 : texture_2d<f32>;

@group(0) @binding(14) var sampler_LightTextureB0 : sampler;

var<private> u_xlat11 : f32;

var<private> u_xlat24 : f32;

var<private> u_xlat14 : f32;

var<private> u_xlat25 : f32;

var<private> u_xlatb34 : bool;

var<private> SV_Target0 : vec4<f32>;

var<private> gl_FragCoord : vec4<f32>;

fn main_1() {
  var x_347 : vec3<f32>;
  var txVec0 : vec3<f32>;
  var txVec1 : vec3<f32>;
  var txVec2 : vec3<f32>;
  var txVec3 : vec3<f32>;
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_23 : vec4<f32> = vs_TEXCOORD0;
  let x_25 : vec4<f32> = textureSample(x_MetallicGlossMap, sampler_MetallicGlossMap, vec2<f32>(x_23.x, x_23.y));
  let x_26 : vec2<f32> = vec2<f32>(x_25.x, x_25.w);
  let x_27 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_26.x, x_26.y, x_27.z, x_27.w);
  let x_37 : vec4<f32> = vs_TEXCOORD0;
  let x_39 : vec4<f32> = textureSample(x_MainTex, sampler_MainTex, vec2<f32>(x_37.x, x_37.y));
  u_xlat1 = vec3<f32>(x_39.x, x_39.y, x_39.z);
  let x_42 : vec3<f32> = u_xlat1;
  let x_54 : vec4<f32> = x_49.x_Color;
  let x_56 : vec3<f32> = (x_42 * vec3<f32>(x_54.x, x_54.y, x_54.z));
  let x_57 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_56.x, x_56.y, x_56.z, x_57.w);
  let x_60 : vec4<f32> = x_49.x_Color;
  let x_62 : vec3<f32> = u_xlat1;
  u_xlat1 = ((vec3<f32>(x_60.x, x_60.y, x_60.z) * x_62) + vec3<f32>(-0.039999999f, -0.039999999f, -0.039999999f));
  let x_67 : vec4<f32> = u_xlat0;
  let x_69 : vec3<f32> = u_xlat1;
  u_xlat1 = ((vec3<f32>(x_67.x, x_67.x, x_67.x) * x_69) + vec3<f32>(0.039999999f, 0.039999999f, 0.039999999f));
  let x_77 : f32 = u_xlat0.x;
  u_xlat0.x = ((-(x_77) * 0.959999979f) + 0.959999979f);
  let x_83 : vec4<f32> = u_xlat0;
  let x_85 : vec4<f32> = u_xlat2;
  let x_87 : vec3<f32> = (vec3<f32>(x_83.x, x_83.x, x_83.x) * vec3<f32>(x_85.x, x_85.y, x_85.z));
  let x_88 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_87.x, x_88.y, x_87.y, x_87.z);
  let x_95 : vec4<f32> = vs_TEXCOORD0;
  let x_97 : vec4<f32> = textureSample(x_BumpMap, sampler_BumpMap, vec2<f32>(x_95.x, x_95.y));
  let x_98 : vec3<f32> = vec3<f32>(x_97.x, x_97.y, x_97.w);
  let x_99 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_98.x, x_98.y, x_98.z, x_99.w);
  let x_103 : f32 = u_xlat2.z;
  let x_105 : f32 = u_xlat2.x;
  u_xlat2.x = (x_103 * x_105);
  let x_108 : vec4<f32> = u_xlat2;
  let x_115 : vec2<f32> = ((vec2<f32>(x_108.x, x_108.y) * vec2<f32>(2.0f, 2.0f)) + vec2<f32>(-1.0f, -1.0f));
  let x_116 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_115.x, x_115.y, x_116.z, x_116.w);
  let x_118 : vec4<f32> = u_xlat2;
  let x_123 : f32 = x_49.x_BumpScale;
  let x_125 : vec2<f32> = (vec2<f32>(x_118.x, x_118.y) * vec2<f32>(x_123, x_123));
  let x_126 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_125.x, x_125.y, x_126.z, x_126.w);
  let x_129 : vec4<f32> = u_xlat2;
  let x_131 : vec4<f32> = u_xlat2;
  u_xlat34 = dot(vec2<f32>(x_129.x, x_129.y), vec2<f32>(x_131.x, x_131.y));
  let x_134 : f32 = u_xlat34;
  u_xlat34 = min(x_134, 1.0f);
  let x_137 : f32 = u_xlat34;
  u_xlat34 = (-(x_137) + 1.0f);
  let x_140 : f32 = u_xlat34;
  u_xlat34 = sqrt(x_140);
  let x_143 : vec4<f32> = u_xlat2;
  let x_146 : vec4<f32> = vs_TEXCOORD3;
  u_xlat13 = (vec3<f32>(x_143.y, x_143.y, x_143.y) * vec3<f32>(x_146.x, x_146.y, x_146.z));
  let x_150 : vec4<f32> = vs_TEXCOORD2;
  let x_152 : vec4<f32> = u_xlat2;
  let x_155 : vec3<f32> = u_xlat13;
  let x_156 : vec3<f32> = ((vec3<f32>(x_150.x, x_150.y, x_150.z) * vec3<f32>(x_152.x, x_152.x, x_152.x)) + x_155);
  let x_157 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_156.x, x_156.y, x_156.z, x_157.w);
  let x_160 : vec4<f32> = vs_TEXCOORD4;
  let x_162 : f32 = u_xlat34;
  let x_165 : vec4<f32> = u_xlat2;
  let x_167 : vec3<f32> = ((vec3<f32>(x_160.x, x_160.y, x_160.z) * vec3<f32>(x_162, x_162, x_162)) + vec3<f32>(x_165.x, x_165.y, x_165.z));
  let x_168 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_167.x, x_167.y, x_167.z, x_168.w);
  let x_170 : vec4<f32> = u_xlat2;
  let x_172 : vec4<f32> = u_xlat2;
  u_xlat34 = dot(vec3<f32>(x_170.x, x_170.y, x_170.z), vec3<f32>(x_172.x, x_172.y, x_172.z));
  let x_175 : f32 = u_xlat34;
  u_xlat34 = inverseSqrt(x_175);
  let x_177 : f32 = u_xlat34;
  let x_179 : vec4<f32> = u_xlat2;
  let x_181 : vec3<f32> = (vec3<f32>(x_177, x_177, x_177) * vec3<f32>(x_179.x, x_179.y, x_179.z));
  let x_182 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_181.x, x_181.y, x_181.z, x_182.w);
  let x_185 : vec4<f32> = vs_TEXCOORD1;
  let x_187 : vec4<f32> = vs_TEXCOORD1;
  u_xlat34 = dot(vec3<f32>(x_185.x, x_185.y, x_185.z), vec3<f32>(x_187.x, x_187.y, x_187.z));
  let x_190 : f32 = u_xlat34;
  u_xlat34 = inverseSqrt(x_190);
  let x_193 : f32 = u_xlat34;
  let x_195 : vec4<f32> = vs_TEXCOORD1;
  u_xlat3 = (vec3<f32>(x_193, x_193, x_193) * vec3<f32>(x_195.x, x_195.y, x_195.z));
  let x_201 : vec3<f32> = vs_TEXCOORD5;
  let x_206 : vec4<f32> = x_49.unity_WorldToLight[1i];
  u_xlat4 = (vec4<f32>(x_201.y, x_201.y, x_201.y, x_201.y) * x_206);
  let x_210 : vec4<f32> = x_49.unity_WorldToLight[0i];
  let x_211 : vec3<f32> = vs_TEXCOORD5;
  let x_214 : vec4<f32> = u_xlat4;
  u_xlat4 = ((x_210 * vec4<f32>(x_211.x, x_211.x, x_211.x, x_211.x)) + x_214);
  let x_218 : vec4<f32> = x_49.unity_WorldToLight[2i];
  let x_219 : vec3<f32> = vs_TEXCOORD5;
  let x_222 : vec4<f32> = u_xlat4;
  u_xlat4 = ((x_218 * vec4<f32>(x_219.z, x_219.z, x_219.z, x_219.z)) + x_222);
  let x_224 : vec4<f32> = u_xlat4;
  let x_227 : vec4<f32> = x_49.unity_WorldToLight[3i];
  u_xlat4 = (x_224 + x_227);
  let x_230 : vec3<f32> = vs_TEXCOORD5;
  let x_234 : vec3<f32> = x_49.x_WorldSpaceCameraPos;
  let x_235 : vec3<f32> = (-(x_230) + x_234);
  let x_236 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_235.x, x_235.y, x_235.z, x_236.w);
  let x_241 : f32 = x_49.unity_MatrixV[0i].z;
  u_xlat6.x = x_241;
  let x_244 : f32 = x_49.unity_MatrixV[1i].z;
  u_xlat6.y = x_244;
  let x_248 : f32 = x_49.unity_MatrixV[2i].z;
  u_xlat6.z = x_248;
  let x_250 : vec4<f32> = u_xlat5;
  let x_252 : vec4<f32> = u_xlat6;
  u_xlat34 = dot(vec3<f32>(x_250.x, x_250.y, x_250.z), vec3<f32>(x_252.x, x_252.y, x_252.z));
  let x_255 : vec3<f32> = vs_TEXCOORD5;
  let x_258 : vec4<f32> = x_49.unity_ShadowFadeCenterAndType;
  let x_261 : vec3<f32> = (x_255 + -(vec3<f32>(x_258.x, x_258.y, x_258.z)));
  let x_262 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_261.x, x_261.y, x_261.z, x_262.w);
  let x_265 : vec4<f32> = u_xlat5;
  let x_267 : vec4<f32> = u_xlat5;
  u_xlat35 = dot(vec3<f32>(x_265.x, x_265.y, x_265.z), vec3<f32>(x_267.x, x_267.y, x_267.z));
  let x_270 : f32 = u_xlat35;
  u_xlat35 = sqrt(x_270);
  let x_272 : f32 = u_xlat34;
  let x_274 : f32 = u_xlat35;
  u_xlat35 = (-(x_272) + x_274);
  let x_278 : f32 = x_49.unity_ShadowFadeCenterAndType.w;
  let x_279 : f32 = u_xlat35;
  let x_281 : f32 = u_xlat34;
  u_xlat34 = ((x_278 * x_279) + x_281);
  let x_283 : f32 = u_xlat34;
  let x_285 : f32 = x_49.x_LightShadowData.z;
  let x_288 : f32 = x_49.x_LightShadowData.w;
  u_xlat34 = ((x_283 * x_285) + x_288);
  let x_290 : f32 = u_xlat34;
  u_xlat34 = clamp(x_290, 0.0f, 1.0f);
  let x_298 : f32 = x_49.unity_ProbeVolumeParams.x;
  u_xlatb35 = (x_298 == 1.0f);
  let x_300 : bool = u_xlatb35;
  if (x_300) {
    let x_304 : f32 = x_49.unity_ProbeVolumeParams.y;
    u_xlatb35 = (x_304 == 1.0f);
    let x_306 : vec3<f32> = vs_TEXCOORD5;
    let x_310 : vec4<f32> = x_49.unity_ProbeVolumeWorldToObject[1i];
    let x_312 : vec3<f32> = (vec3<f32>(x_306.y, x_306.y, x_306.y) * vec3<f32>(x_310.x, x_310.y, x_310.z));
    let x_313 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_312.x, x_312.y, x_312.z, x_313.w);
    let x_316 : vec4<f32> = x_49.unity_ProbeVolumeWorldToObject[0i];
    let x_318 : vec3<f32> = vs_TEXCOORD5;
    let x_321 : vec4<f32> = u_xlat5;
    let x_323 : vec3<f32> = ((vec3<f32>(x_316.x, x_316.y, x_316.z) * vec3<f32>(x_318.x, x_318.x, x_318.x)) + vec3<f32>(x_321.x, x_321.y, x_321.z));
    let x_324 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_323.x, x_323.y, x_323.z, x_324.w);
    let x_327 : vec4<f32> = x_49.unity_ProbeVolumeWorldToObject[2i];
    let x_329 : vec3<f32> = vs_TEXCOORD5;
    let x_332 : vec4<f32> = u_xlat5;
    let x_334 : vec3<f32> = ((vec3<f32>(x_327.x, x_327.y, x_327.z) * vec3<f32>(x_329.z, x_329.z, x_329.z)) + vec3<f32>(x_332.x, x_332.y, x_332.z));
    let x_335 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_334.x, x_334.y, x_334.z, x_335.w);
    let x_337 : vec4<f32> = u_xlat5;
    let x_340 : vec4<f32> = x_49.unity_ProbeVolumeWorldToObject[3i];
    let x_342 : vec3<f32> = (vec3<f32>(x_337.x, x_337.y, x_337.z) + vec3<f32>(x_340.x, x_340.y, x_340.z));
    let x_343 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_342.x, x_342.y, x_342.z, x_343.w);
    let x_345 : bool = u_xlatb35;
    if (x_345) {
      let x_350 : vec4<f32> = u_xlat5;
      x_347 = vec3<f32>(x_350.x, x_350.y, x_350.z);
    } else {
      let x_353 : vec3<f32> = vs_TEXCOORD5;
      x_347 = x_353;
    }
    let x_354 : vec3<f32> = x_347;
    let x_355 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_354.x, x_354.y, x_354.z, x_355.w);
    let x_357 : vec4<f32> = u_xlat5;
    let x_361 : vec3<f32> = x_49.unity_ProbeVolumeMin;
    let x_363 : vec3<f32> = (vec3<f32>(x_357.x, x_357.y, x_357.z) + -(x_361));
    let x_364 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_363.x, x_363.y, x_363.z, x_364.w);
    let x_366 : vec4<f32> = u_xlat5;
    let x_370 : vec3<f32> = x_49.unity_ProbeVolumeSizeInv;
    let x_371 : vec3<f32> = (vec3<f32>(x_366.x, x_366.y, x_366.z) * x_370);
    let x_372 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_372.x, x_371.x, x_371.y, x_371.z);
    let x_375 : f32 = u_xlat5.y;
    u_xlat35 = ((x_375 * 0.25f) + 0.75f);
    let x_382 : f32 = x_49.unity_ProbeVolumeParams.z;
    u_xlat36 = ((x_382 * 0.5f) + 0.75f);
    let x_386 : f32 = u_xlat35;
    let x_387 : f32 = u_xlat36;
    u_xlat5.x = max(x_386, x_387);
    let x_398 : vec4<f32> = u_xlat5;
    let x_400 : vec4<f32> = textureSample(unity_ProbeVolumeSH, samplerunity_ProbeVolumeSH, vec3<f32>(x_398.x, x_398.z, x_398.w));
    u_xlat5 = x_400;
  } else {
    u_xlat5.x = 1.0f;
    u_xlat5.y = 1.0f;
    u_xlat5.z = 1.0f;
    u_xlat5.w = 1.0f;
  }
  let x_406 : vec4<f32> = u_xlat5;
  let x_408 : vec4<f32> = x_49.unity_OcclusionMaskSelector;
  u_xlat35 = dot(x_406, x_408);
  let x_410 : f32 = u_xlat35;
  u_xlat35 = clamp(x_410, 0.0f, 1.0f);
  let x_413 : f32 = u_xlat34;
  u_xlatb36 = (x_413 < 0.99000001f);
  let x_416 : bool = u_xlatb36;
  if (x_416) {
    let x_419 : vec3<f32> = vs_TEXCOORD5;
    let x_422 : vec4<f32> = x_49.unity_WorldToShadow[0i][1i];
    u_xlat5 = (vec4<f32>(x_419.y, x_419.y, x_419.y, x_419.y) * x_422);
    let x_425 : vec4<f32> = x_49.unity_WorldToShadow[0i][0i];
    let x_426 : vec3<f32> = vs_TEXCOORD5;
    let x_429 : vec4<f32> = u_xlat5;
    u_xlat5 = ((x_425 * vec4<f32>(x_426.x, x_426.x, x_426.x, x_426.x)) + x_429);
    let x_432 : vec4<f32> = x_49.unity_WorldToShadow[0i][2i];
    let x_433 : vec3<f32> = vs_TEXCOORD5;
    let x_436 : vec4<f32> = u_xlat5;
    u_xlat5 = ((x_432 * vec4<f32>(x_433.z, x_433.z, x_433.z, x_433.z)) + x_436);
    let x_438 : vec4<f32> = u_xlat5;
    let x_440 : vec4<f32> = x_49.unity_WorldToShadow[0i][3i];
    u_xlat5 = (x_438 + x_440);
    let x_442 : vec4<f32> = u_xlat5;
    let x_444 : vec4<f32> = u_xlat5;
    let x_446 : vec3<f32> = (vec3<f32>(x_442.x, x_442.y, x_442.z) / vec3<f32>(x_444.w, x_444.w, x_444.w));
    let x_447 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_446.x, x_446.y, x_446.z, x_447.w);
    let x_449 : vec4<f32> = u_xlat5;
    let x_453 : vec4<f32> = x_49.x_ShadowMapTexture_TexelSize;
    let x_457 : vec2<f32> = ((vec2<f32>(x_449.x, x_449.y) * vec2<f32>(x_453.z, x_453.w)) + vec2<f32>(0.5f, 0.5f));
    let x_458 : vec4<f32> = u_xlat6;
    u_xlat6 = vec4<f32>(x_457.x, x_457.y, x_458.z, x_458.w);
    let x_460 : vec4<f32> = u_xlat6;
    let x_462 : vec2<f32> = floor(vec2<f32>(x_460.x, x_460.y));
    let x_463 : vec4<f32> = u_xlat6;
    u_xlat6 = vec4<f32>(x_462.x, x_462.y, x_463.z, x_463.w);
    let x_465 : vec4<f32> = u_xlat5;
    let x_468 : vec4<f32> = x_49.x_ShadowMapTexture_TexelSize;
    let x_471 : vec4<f32> = u_xlat6;
    let x_474 : vec2<f32> = ((vec2<f32>(x_465.x, x_465.y) * vec2<f32>(x_468.z, x_468.w)) + -(vec2<f32>(x_471.x, x_471.y)));
    let x_475 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_474.x, x_474.y, x_475.z, x_475.w);
    let x_478 : vec4<f32> = u_xlat5;
    u_xlat7 = (vec4<f32>(x_478.x, x_478.x, x_478.y, x_478.y) + vec4<f32>(0.5f, 1.0f, 0.5f, 1.0f));
    let x_483 : vec4<f32> = u_xlat7;
    let x_485 : vec4<f32> = u_xlat7;
    let x_487 : vec2<f32> = (vec2<f32>(x_483.x, x_483.z) * vec2<f32>(x_485.x, x_485.z));
    let x_488 : vec4<f32> = u_xlat8;
    u_xlat8 = vec4<f32>(x_487.x, x_488.y, x_488.z, x_487.y);
    let x_492 : vec4<f32> = u_xlat8;
    let x_495 : vec4<f32> = u_xlat5;
    u_xlat28 = ((vec2<f32>(x_492.x, x_492.w) * vec2<f32>(0.5f, 0.5f)) + -(vec2<f32>(x_495.x, x_495.y)));
    let x_499 : vec4<f32> = u_xlat5;
    let x_503 : vec2<f32> = (-(vec2<f32>(x_499.x, x_499.y)) + vec2<f32>(1.0f, 1.0f));
    let x_504 : vec4<f32> = u_xlat7;
    u_xlat7 = vec4<f32>(x_503.x, x_504.y, x_503.y, x_504.w);
    let x_507 : vec4<f32> = u_xlat5;
    let x_510 : vec2<f32> = min(vec2<f32>(x_507.x, x_507.y), vec2<f32>(0.0f, 0.0f));
    let x_511 : vec4<f32> = u_xlat9;
    u_xlat9 = vec4<f32>(x_510.x, x_510.y, x_511.z, x_511.w);
    let x_513 : vec4<f32> = u_xlat9;
    let x_516 : vec4<f32> = u_xlat9;
    let x_519 : vec4<f32> = u_xlat7;
    let x_521 : vec2<f32> = ((-(vec2<f32>(x_513.x, x_513.y)) * vec2<f32>(x_516.x, x_516.y)) + vec2<f32>(x_519.x, x_519.z));
    let x_522 : vec4<f32> = u_xlat7;
    u_xlat7 = vec4<f32>(x_521.x, x_522.y, x_521.y, x_522.w);
    let x_524 : vec4<f32> = u_xlat5;
    let x_526 : vec2<f32> = max(vec2<f32>(x_524.x, x_524.y), vec2<f32>(0.0f, 0.0f));
    let x_527 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_526.x, x_526.y, x_527.z, x_527.w);
    let x_529 : vec4<f32> = u_xlat5;
    let x_532 : vec4<f32> = u_xlat5;
    let x_535 : vec4<f32> = u_xlat7;
    let x_537 : vec2<f32> = ((-(vec2<f32>(x_529.x, x_529.y)) * vec2<f32>(x_532.x, x_532.y)) + vec2<f32>(x_535.y, x_535.w));
    let x_538 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_537.x, x_537.y, x_538.z, x_538.w);
    let x_541 : f32 = u_xlat28.x;
    u_xlat9.x = x_541;
    let x_544 : f32 = u_xlat7.x;
    u_xlat9.y = x_544;
    let x_547 : f32 = u_xlat5.x;
    u_xlat9.z = x_547;
    let x_550 : f32 = u_xlat8.x;
    u_xlat9.w = x_550;
    let x_552 : vec4<f32> = u_xlat9;
    u_xlat9 = (x_552 * vec4<f32>(0.444440007f, 0.444440007f, 0.444440007f, 0.222220004f));
    let x_558 : f32 = u_xlat28.y;
    u_xlat8.x = x_558;
    let x_561 : f32 = u_xlat7.z;
    u_xlat8.y = x_561;
    let x_564 : f32 = u_xlat5.y;
    u_xlat8.z = x_564;
    let x_566 : vec4<f32> = u_xlat8;
    u_xlat7 = (x_566 * vec4<f32>(0.444440007f, 0.444440007f, 0.444440007f, 0.222220004f));
    let x_568 : vec4<f32> = u_xlat9;
    let x_570 : vec4<f32> = u_xlat9;
    u_xlat8 = (vec4<f32>(x_568.y, x_568.w, x_568.y, x_568.w) + vec4<f32>(x_570.x, x_570.z, x_570.x, x_570.z));
    let x_574 : vec4<f32> = u_xlat7;
    let x_576 : vec4<f32> = u_xlat7;
    u_xlat10 = (vec4<f32>(x_574.y, x_574.y, x_574.w, x_574.w) + vec4<f32>(x_576.x, x_576.x, x_576.z, x_576.z));
    let x_579 : vec4<f32> = u_xlat9;
    let x_581 : vec4<f32> = u_xlat8;
    let x_583 : vec2<f32> = (vec2<f32>(x_579.y, x_579.w) / vec2<f32>(x_581.z, x_581.w));
    let x_584 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_583.x, x_583.y, x_584.z, x_584.w);
    let x_586 : vec4<f32> = u_xlat5;
    let x_590 : vec2<f32> = (vec2<f32>(x_586.x, x_586.y) + vec2<f32>(-1.5f, 0.5f));
    let x_591 : vec4<f32> = u_xlat5;
    u_xlat5 = vec4<f32>(x_590.x, x_590.y, x_591.z, x_591.w);
    let x_593 : vec4<f32> = u_xlat7;
    let x_595 : vec4<f32> = u_xlat10;
    u_xlat28 = (vec2<f32>(x_593.y, x_593.w) / vec2<f32>(x_595.y, x_595.w));
    let x_598 : vec2<f32> = u_xlat28;
    u_xlat28 = (x_598 + vec2<f32>(-1.5f, 0.5f));
    let x_600 : vec4<f32> = u_xlat5;
    let x_603 : vec4<f32> = x_49.x_ShadowMapTexture_TexelSize;
    let x_605 : vec2<f32> = (vec2<f32>(x_600.x, x_600.y) * vec2<f32>(x_603.x, x_603.x));
    let x_606 : vec4<f32> = u_xlat7;
    u_xlat7 = vec4<f32>(x_605.x, x_605.y, x_606.z, x_606.w);
    let x_608 : vec2<f32> = u_xlat28;
    let x_610 : vec4<f32> = x_49.x_ShadowMapTexture_TexelSize;
    let x_612 : vec2<f32> = (x_608 * vec2<f32>(x_610.y, x_610.y));
    let x_613 : vec4<f32> = u_xlat7;
    u_xlat7 = vec4<f32>(x_613.x, x_613.y, x_612.x, x_612.y);
    let x_615 : vec4<f32> = u_xlat8;
    let x_616 : vec4<f32> = u_xlat10;
    u_xlat8 = (x_615 * x_616);
    let x_618 : vec4<f32> = u_xlat6;
    let x_621 : vec4<f32> = x_49.x_ShadowMapTexture_TexelSize;
    let x_624 : vec4<f32> = u_xlat7;
    u_xlat9 = ((vec4<f32>(x_618.x, x_618.y, x_618.x, x_618.y) * vec4<f32>(x_621.x, x_621.y, x_621.x, x_621.y)) + vec4<f32>(x_624.x, x_624.z, x_624.y, x_624.z));
    let x_628 : vec4<f32> = u_xlat9;
    let x_629 : vec2<f32> = vec2<f32>(x_628.x, x_628.y);
    let x_631 : f32 = u_xlat5.z;
    txVec0 = vec3<f32>(x_629.x, x_629.y, x_631);
    let x_643 : vec3<f32> = txVec0;
    let x_645 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_643.xy, x_643.z);
    u_xlat36 = x_645;
    let x_647 : vec4<f32> = u_xlat9;
    let x_648 : vec2<f32> = vec2<f32>(x_647.z, x_647.w);
    let x_650 : f32 = u_xlat5.z;
    txVec1 = vec3<f32>(x_648.x, x_648.y, x_650);
    let x_657 : vec3<f32> = txVec1;
    let x_659 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_657.xy, x_657.z);
    u_xlat5.x = x_659;
    let x_662 : f32 = u_xlat5.x;
    let x_664 : f32 = u_xlat8.y;
    u_xlat5.x = (x_662 * x_664);
    let x_668 : f32 = u_xlat8.x;
    let x_669 : f32 = u_xlat36;
    let x_672 : f32 = u_xlat5.x;
    u_xlat36 = ((x_668 * x_669) + x_672);
    let x_674 : vec4<f32> = u_xlat6;
    let x_677 : vec4<f32> = x_49.x_ShadowMapTexture_TexelSize;
    let x_680 : vec4<f32> = u_xlat7;
    u_xlat6 = ((vec4<f32>(x_674.x, x_674.y, x_674.x, x_674.y) * vec4<f32>(x_677.x, x_677.y, x_677.x, x_677.y)) + vec4<f32>(x_680.x, x_680.w, x_680.y, x_680.w));
    let x_684 : vec4<f32> = u_xlat6;
    let x_685 : vec2<f32> = vec2<f32>(x_684.x, x_684.y);
    let x_687 : f32 = u_xlat5.z;
    txVec2 = vec3<f32>(x_685.x, x_685.y, x_687);
    let x_694 : vec3<f32> = txVec2;
    let x_696 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_694.xy, x_694.z);
    u_xlat5.x = x_696;
    let x_699 : f32 = u_xlat8.z;
    let x_701 : f32 = u_xlat5.x;
    let x_703 : f32 = u_xlat36;
    u_xlat36 = ((x_699 * x_701) + x_703);
    let x_706 : vec4<f32> = u_xlat6;
    let x_707 : vec2<f32> = vec2<f32>(x_706.z, x_706.w);
    let x_709 : f32 = u_xlat5.z;
    txVec3 = vec3<f32>(x_707.x, x_707.y, x_709);
    let x_716 : vec3<f32> = txVec3;
    let x_718 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_716.xy, x_716.z);
    u_xlat5.x = x_718;
    let x_721 : f32 = u_xlat8.w;
    let x_723 : f32 = u_xlat5.x;
    let x_725 : f32 = u_xlat36;
    u_xlat36 = ((x_721 * x_723) + x_725);
    let x_728 : f32 = x_49.x_LightShadowData.x;
    u_xlat5.x = (-(x_728) + 1.0f);
    let x_732 : f32 = u_xlat36;
    let x_734 : f32 = u_xlat5.x;
    let x_737 : f32 = x_49.x_LightShadowData.x;
    u_xlat36 = ((x_732 * x_734) + x_737);
  } else {
    u_xlat36 = 1.0f;
  }
  let x_740 : f32 = u_xlat35;
  let x_741 : f32 = u_xlat36;
  u_xlat35 = (x_740 + -(x_741));
  let x_744 : f32 = u_xlat34;
  let x_745 : f32 = u_xlat35;
  let x_747 : f32 = u_xlat36;
  u_xlat34 = ((x_744 * x_745) + x_747);
  let x_750 : f32 = u_xlat4.z;
  u_xlatb35 = (0.0f < x_750);
  let x_752 : bool = u_xlatb35;
  u_xlat35 = select(0.0f, 1.0f, x_752);
  let x_754 : vec4<f32> = u_xlat4;
  let x_756 : vec4<f32> = u_xlat4;
  let x_758 : vec2<f32> = (vec2<f32>(x_754.x, x_754.y) / vec2<f32>(x_756.w, x_756.w));
  let x_759 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_758.x, x_758.y, x_759.z, x_759.w);
  let x_761 : vec4<f32> = u_xlat5;
  let x_763 : vec2<f32> = (vec2<f32>(x_761.x, x_761.y) + vec2<f32>(0.5f, 0.5f));
  let x_764 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_763.x, x_763.y, x_764.z, x_764.w);
  let x_771 : vec4<f32> = u_xlat5;
  let x_773 : vec4<f32> = textureSample(x_LightTexture0, sampler_LightTexture0, vec2<f32>(x_771.x, x_771.y));
  u_xlat36 = x_773.w;
  let x_775 : f32 = u_xlat35;
  let x_776 : f32 = u_xlat36;
  u_xlat35 = (x_775 * x_776);
  let x_778 : vec4<f32> = u_xlat4;
  let x_780 : vec4<f32> = u_xlat4;
  u_xlat36 = dot(vec3<f32>(x_778.x, x_778.y, x_778.z), vec3<f32>(x_780.x, x_780.y, x_780.z));
  let x_788 : f32 = u_xlat36;
  let x_790 : vec4<f32> = textureSample(x_LightTextureB0, sampler_LightTextureB0, vec2<f32>(x_788, x_788));
  u_xlat36 = x_790.x;
  let x_792 : f32 = u_xlat35;
  let x_793 : f32 = u_xlat36;
  u_xlat35 = (x_792 * x_793);
  let x_795 : f32 = u_xlat34;
  let x_796 : f32 = u_xlat35;
  u_xlat34 = (x_795 * x_796);
  let x_800 : f32 = vs_TEXCOORD2.w;
  u_xlat4.x = x_800;
  let x_803 : f32 = vs_TEXCOORD3.w;
  u_xlat4.y = x_803;
  let x_806 : f32 = vs_TEXCOORD4.w;
  u_xlat4.z = x_806;
  let x_808 : vec4<f32> = u_xlat4;
  let x_810 : vec4<f32> = u_xlat4;
  u_xlat35 = dot(vec3<f32>(x_808.x, x_808.y, x_808.z), vec3<f32>(x_810.x, x_810.y, x_810.z));
  let x_813 : f32 = u_xlat35;
  u_xlat35 = inverseSqrt(x_813);
  let x_815 : f32 = u_xlat35;
  let x_817 : vec4<f32> = u_xlat4;
  let x_819 : vec3<f32> = (vec3<f32>(x_815, x_815, x_815) * vec3<f32>(x_817.x, x_817.y, x_817.z));
  let x_820 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_819.x, x_819.y, x_819.z, x_820.w);
  let x_822 : f32 = u_xlat34;
  let x_826 : vec4<f32> = x_49.x_LightColor0;
  let x_828 : vec3<f32> = (vec3<f32>(x_822, x_822, x_822) * vec3<f32>(x_826.x, x_826.y, x_826.z));
  let x_829 : vec4<f32> = u_xlat6;
  u_xlat6 = vec4<f32>(x_828.x, x_828.y, x_828.z, x_829.w);
  let x_833 : f32 = u_xlat0.y;
  let x_837 : f32 = x_49.x_GlossMapScale;
  u_xlat11 = ((-(x_833) * x_837) + 1.0f);
  let x_840 : vec4<f32> = u_xlat4;
  let x_842 : f32 = u_xlat35;
  let x_845 : vec3<f32> = u_xlat3;
  let x_847 : vec3<f32> = ((vec3<f32>(x_840.x, x_840.y, x_840.z) * vec3<f32>(x_842, x_842, x_842)) + -(x_845));
  let x_848 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_847.x, x_847.y, x_847.z, x_848.w);
  let x_850 : vec4<f32> = u_xlat4;
  let x_852 : vec4<f32> = u_xlat4;
  u_xlat34 = dot(vec3<f32>(x_850.x, x_850.y, x_850.z), vec3<f32>(x_852.x, x_852.y, x_852.z));
  let x_855 : f32 = u_xlat34;
  u_xlat34 = max(x_855, 0.001f);
  let x_858 : f32 = u_xlat34;
  u_xlat34 = inverseSqrt(x_858);
  let x_860 : f32 = u_xlat34;
  let x_862 : vec4<f32> = u_xlat4;
  let x_864 : vec3<f32> = (vec3<f32>(x_860, x_860, x_860) * vec3<f32>(x_862.x, x_862.y, x_862.z));
  let x_865 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_864.x, x_864.y, x_864.z, x_865.w);
  let x_867 : vec4<f32> = u_xlat2;
  let x_869 : vec3<f32> = u_xlat3;
  u_xlat34 = dot(vec3<f32>(x_867.x, x_867.y, x_867.z), -(x_869));
  let x_872 : vec4<f32> = u_xlat2;
  let x_874 : vec4<f32> = u_xlat5;
  u_xlat35 = dot(vec3<f32>(x_872.x, x_872.y, x_872.z), vec3<f32>(x_874.x, x_874.y, x_874.z));
  let x_877 : f32 = u_xlat35;
  u_xlat35 = clamp(x_877, 0.0f, 1.0f);
  let x_879 : vec4<f32> = u_xlat2;
  let x_881 : vec4<f32> = u_xlat4;
  u_xlat2.x = dot(vec3<f32>(x_879.x, x_879.y, x_879.z), vec3<f32>(x_881.x, x_881.y, x_881.z));
  let x_886 : f32 = u_xlat2.x;
  u_xlat2.x = clamp(x_886, 0.0f, 1.0f);
  let x_889 : vec4<f32> = u_xlat5;
  let x_891 : vec4<f32> = u_xlat4;
  u_xlat13.x = dot(vec3<f32>(x_889.x, x_889.y, x_889.z), vec3<f32>(x_891.x, x_891.y, x_891.z));
  let x_896 : f32 = u_xlat13.x;
  u_xlat13.x = clamp(x_896, 0.0f, 1.0f);
  let x_901 : f32 = u_xlat13.x;
  let x_903 : f32 = u_xlat13.x;
  u_xlat24 = (x_901 * x_903);
  let x_905 : f32 = u_xlat24;
  let x_907 : f32 = u_xlat11;
  u_xlat24 = dot(vec2<f32>(x_905, x_905), vec2<f32>(x_907, x_907));
  let x_910 : f32 = u_xlat24;
  u_xlat24 = (x_910 + -0.5f);
  let x_913 : f32 = u_xlat35;
  u_xlat3.x = (-(x_913) + 1.0f);
  let x_919 : f32 = u_xlat3.x;
  let x_921 : f32 = u_xlat3.x;
  u_xlat14 = (x_919 * x_921);
  let x_923 : f32 = u_xlat14;
  let x_924 : f32 = u_xlat14;
  u_xlat14 = (x_923 * x_924);
  let x_927 : f32 = u_xlat3.x;
  let x_928 : f32 = u_xlat14;
  u_xlat3.x = (x_927 * x_928);
  let x_931 : f32 = u_xlat24;
  let x_933 : f32 = u_xlat3.x;
  u_xlat3.x = ((x_931 * x_933) + 1.0f);
  let x_937 : f32 = u_xlat34;
  u_xlat14 = (-(abs(x_937)) + 1.0f);
  let x_942 : f32 = u_xlat14;
  let x_943 : f32 = u_xlat14;
  u_xlat25 = (x_942 * x_943);
  let x_945 : f32 = u_xlat25;
  let x_946 : f32 = u_xlat25;
  u_xlat25 = (x_945 * x_946);
  let x_948 : f32 = u_xlat14;
  let x_949 : f32 = u_xlat25;
  u_xlat14 = (x_948 * x_949);
  let x_951 : f32 = u_xlat24;
  let x_952 : f32 = u_xlat14;
  u_xlat24 = ((x_951 * x_952) + 1.0f);
  let x_955 : f32 = u_xlat24;
  let x_957 : f32 = u_xlat3.x;
  u_xlat24 = (x_955 * x_957);
  let x_959 : f32 = u_xlat35;
  let x_960 : f32 = u_xlat24;
  u_xlat24 = (x_959 * x_960);
  let x_962 : f32 = u_xlat11;
  let x_963 : f32 = u_xlat11;
  u_xlat11 = (x_962 * x_963);
  let x_965 : f32 = u_xlat11;
  u_xlat11 = max(x_965, 0.002f);
  let x_968 : f32 = u_xlat11;
  u_xlat3.x = (-(x_968) + 1.0f);
  let x_972 : f32 = u_xlat34;
  let x_975 : f32 = u_xlat3.x;
  let x_977 : f32 = u_xlat11;
  u_xlat14 = ((abs(x_972) * x_975) + x_977);
  let x_979 : f32 = u_xlat35;
  let x_981 : f32 = u_xlat3.x;
  let x_983 : f32 = u_xlat11;
  u_xlat3.x = ((x_979 * x_981) + x_983);
  let x_986 : f32 = u_xlat34;
  let x_989 : f32 = u_xlat3.x;
  u_xlat34 = (abs(x_986) * x_989);
  let x_991 : f32 = u_xlat35;
  let x_992 : f32 = u_xlat14;
  let x_994 : f32 = u_xlat34;
  u_xlat34 = ((x_991 * x_992) + x_994);
  let x_996 : f32 = u_xlat34;
  u_xlat34 = (x_996 + 0.00001f);
  let x_999 : f32 = u_xlat34;
  u_xlat34 = (0.5f / x_999);
  let x_1001 : f32 = u_xlat11;
  let x_1002 : f32 = u_xlat11;
  u_xlat11 = (x_1001 * x_1002);
  let x_1005 : f32 = u_xlat2.x;
  let x_1006 : f32 = u_xlat11;
  let x_1009 : f32 = u_xlat2.x;
  u_xlat3.x = ((x_1005 * x_1006) + -(x_1009));
  let x_1014 : f32 = u_xlat3.x;
  let x_1016 : f32 = u_xlat2.x;
  u_xlat2.x = ((x_1014 * x_1016) + 1.0f);
  let x_1020 : f32 = u_xlat11;
  u_xlat11 = (x_1020 * 0.318309873f);
  let x_1024 : f32 = u_xlat2.x;
  let x_1026 : f32 = u_xlat2.x;
  u_xlat2.x = ((x_1024 * x_1026) + 0.0000001f);
  let x_1031 : f32 = u_xlat11;
  let x_1033 : f32 = u_xlat2.x;
  u_xlat11 = (x_1031 / x_1033);
  let x_1035 : f32 = u_xlat11;
  let x_1036 : f32 = u_xlat34;
  u_xlat11 = (x_1035 * x_1036);
  let x_1038 : f32 = u_xlat35;
  let x_1039 : f32 = u_xlat11;
  u_xlat11 = (x_1038 * x_1039);
  let x_1041 : f32 = u_xlat11;
  u_xlat11 = (x_1041 * 3.141592741f);
  let x_1044 : f32 = u_xlat11;
  u_xlat11 = max(x_1044, 0.0f);
  let x_1046 : vec3<f32> = u_xlat1;
  let x_1047 : vec3<f32> = u_xlat1;
  u_xlat34 = dot(x_1046, x_1047);
  let x_1050 : f32 = u_xlat34;
  u_xlatb34 = !((x_1050 == 0.0f));
  let x_1052 : bool = u_xlatb34;
  u_xlat34 = select(0.0f, 1.0f, x_1052);
  let x_1054 : f32 = u_xlat11;
  let x_1055 : f32 = u_xlat34;
  u_xlat11 = (x_1054 * x_1055);
  let x_1057 : f32 = u_xlat24;
  let x_1059 : vec4<f32> = u_xlat6;
  let x_1061 : vec3<f32> = (vec3<f32>(x_1057, x_1057, x_1057) * vec3<f32>(x_1059.x, x_1059.y, x_1059.z));
  let x_1062 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1061.x, x_1062.y, x_1061.y, x_1061.z);
  let x_1064 : vec4<f32> = u_xlat6;
  let x_1066 : f32 = u_xlat11;
  u_xlat3 = (vec3<f32>(x_1064.x, x_1064.y, x_1064.z) * vec3<f32>(x_1066, x_1066, x_1066));
  let x_1070 : f32 = u_xlat13.x;
  u_xlat11 = (-(x_1070) + 1.0f);
  let x_1073 : f32 = u_xlat11;
  let x_1074 : f32 = u_xlat11;
  u_xlat34 = (x_1073 * x_1074);
  let x_1076 : f32 = u_xlat34;
  let x_1077 : f32 = u_xlat34;
  u_xlat34 = (x_1076 * x_1077);
  let x_1079 : f32 = u_xlat11;
  let x_1080 : f32 = u_xlat34;
  u_xlat11 = (x_1079 * x_1080);
  let x_1082 : vec3<f32> = u_xlat1;
  let x_1085 : vec3<f32> = (-(x_1082) + vec3<f32>(1.0f, 1.0f, 1.0f));
  let x_1086 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_1085.x, x_1085.y, x_1085.z, x_1086.w);
  let x_1088 : vec4<f32> = u_xlat4;
  let x_1090 : f32 = u_xlat11;
  let x_1093 : vec3<f32> = u_xlat1;
  u_xlat1 = ((vec3<f32>(x_1088.x, x_1088.y, x_1088.z) * vec3<f32>(x_1090, x_1090, x_1090)) + x_1093);
  let x_1095 : vec3<f32> = u_xlat1;
  let x_1096 : vec3<f32> = u_xlat3;
  u_xlat1 = (x_1095 * x_1096);
  let x_1100 : vec4<f32> = u_xlat0;
  let x_1102 : vec4<f32> = u_xlat2;
  let x_1105 : vec3<f32> = u_xlat1;
  let x_1106 : vec3<f32> = ((vec3<f32>(x_1100.x, x_1100.z, x_1100.w) * vec3<f32>(x_1102.x, x_1102.z, x_1102.w)) + x_1105);
  let x_1107 : vec4<f32> = SV_Target0;
  SV_Target0 = vec4<f32>(x_1106.x, x_1106.y, x_1106.z, x_1107.w);
  SV_Target0.w = 1.0f;
  return;
}

struct main_out {
  @location(0)
  SV_Target0_1 : vec4<f32>,
}

@fragment
fn main(@location(0) vs_TEXCOORD0_param : vec4<f32>, @location(3) vs_TEXCOORD3_param : vec4<f32>, @location(2) vs_TEXCOORD2_param : vec4<f32>, @location(4) vs_TEXCOORD4_param : vec4<f32>, @location(1) vs_TEXCOORD1_param : vec4<f32>, @location(5) vs_TEXCOORD5_param : vec3<f32>, @builtin(position) gl_FragCoord_param : vec4<f32>) -> main_out {
  vs_TEXCOORD0 = vs_TEXCOORD0_param;
  vs_TEXCOORD3 = vs_TEXCOORD3_param;
  vs_TEXCOORD2 = vs_TEXCOORD2_param;
  vs_TEXCOORD4 = vs_TEXCOORD4_param;
  vs_TEXCOORD1 = vs_TEXCOORD1_param;
  vs_TEXCOORD5 = vs_TEXCOORD5_param;
  gl_FragCoord = gl_FragCoord_param;
  main_1();
  return main_out(SV_Target0);
}

