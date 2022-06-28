type Arr = array<vec4<f32>, 4u>;

type Arr_1 = array<mat4x4<f32>, 4u>;

struct PGlobals {
  x_ZBufferParams : vec4<f32>,
  unity_OrthoParams : vec4<f32>,
  unity_CameraToWorld : mat4x4<f32>,
  unity_ShadowSplitSpheres : Arr,
  unity_ShadowSplitSqRadii : vec4<f32>,
  unity_WorldToShadow : Arr_1,
  x_LightShadowData : vec4<f32>,
  x_ShadowMapTexture_TexelSize : vec4<f32>,
}

var<private> u_xlat0 : vec4<f32>;

@group(0) @binding(1) var x_CameraDepthTexture : texture_2d<f32>;

@group(0) @binding(4) var sampler_CameraDepthTexture : sampler;

var<private> vs_TEXCOORD0 : vec4<f32>;

var<private> u_xlat9 : vec3<f32>;

@group(0) @binding(0) var<uniform> x_40 : PGlobals;

var<private> u_xlat18 : f32;

var<private> u_xlat1 : vec4<f32>;

var<private> vs_TEXCOORD2 : vec3<f32>;

var<private> vs_TEXCOORD3 : vec3<f32>;

var<private> vs_TEXCOORD1 : vec3<f32>;

var<private> u_xlat2 : vec4<f32>;

var<private> u_xlatb1 : vec4<bool>;

var<private> u_xlat3 : vec4<f32>;

var<private> u_xlat10 : vec2<f32>;

var<private> u_xlat4 : vec4<f32>;

var<private> u_xlat5 : vec4<f32>;

var<private> u_xlat6 : vec4<f32>;

var<private> u_xlat7 : vec4<f32>;

var<private> u_xlat8 : vec4<f32>;

@group(0) @binding(2) var x_ShadowMapTexture : texture_depth_2d;

@group(0) @binding(3) var sampler_ShadowMapTexture : sampler_comparison;

var<private> u_xlat27 : f32;

var<private> SV_Target0 : vec4<f32>;

var<private> gl_FragCoord : vec4<f32>;

fn main_1() {
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
  let x_45 : f32 = x_40.x_ZBufferParams.x;
  let x_47 : f32 = u_xlat0.x;
  let x_51 : f32 = x_40.x_ZBufferParams.y;
  u_xlat9.x = ((x_45 * x_47) + x_51);
  let x_56 : f32 = u_xlat9.x;
  u_xlat9.x = (1.0f / x_56);
  let x_61 : f32 = u_xlat9.x;
  let x_64 : f32 = u_xlat0.x;
  u_xlat18 = (-(x_61) + x_64);
  let x_69 : f32 = x_40.unity_OrthoParams.w;
  let x_70 : f32 = u_xlat18;
  let x_73 : f32 = u_xlat9.x;
  u_xlat9.x = ((x_69 * x_70) + x_73);
  let x_77 : f32 = u_xlat0.x;
  u_xlat0.x = (-(x_77) + 1.0f);
  let x_84 : vec3<f32> = vs_TEXCOORD2;
  let x_87 : vec3<f32> = vs_TEXCOORD3;
  let x_88 : vec3<f32> = (-(x_84) + x_87);
  let x_89 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_88.x, x_88.y, x_88.z, x_89.w);
  let x_91 : vec4<f32> = u_xlat0;
  let x_93 : vec4<f32> = u_xlat1;
  let x_96 : vec3<f32> = vs_TEXCOORD2;
  let x_97 : vec3<f32> = ((vec3<f32>(x_91.x, x_91.x, x_91.x) * vec3<f32>(x_93.x, x_93.y, x_93.z)) + x_96);
  let x_98 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_97.x, x_98.y, x_97.y, x_97.z);
  let x_101 : vec3<f32> = vs_TEXCOORD1;
  let x_103 : vec3<f32> = u_xlat9;
  let x_106 : vec4<f32> = u_xlat0;
  let x_108 : vec3<f32> = ((-(x_101) * vec3<f32>(x_103.x, x_103.x, x_103.x)) + vec3<f32>(x_106.x, x_106.z, x_106.w));
  let x_109 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_108.x, x_109.y, x_108.y, x_108.z);
  let x_111 : vec3<f32> = u_xlat9;
  let x_113 : vec3<f32> = vs_TEXCOORD1;
  let x_114 : vec3<f32> = (vec3<f32>(x_111.x, x_111.x, x_111.x) * x_113);
  let x_115 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_114.x, x_114.y, x_114.z, x_115.w);
  let x_119 : vec4<f32> = x_40.unity_OrthoParams;
  let x_121 : vec4<f32> = u_xlat0;
  let x_124 : vec4<f32> = u_xlat1;
  let x_126 : vec3<f32> = ((vec3<f32>(x_119.w, x_119.w, x_119.w) * vec3<f32>(x_121.x, x_121.z, x_121.w)) + vec3<f32>(x_124.x, x_124.y, x_124.z));
  let x_127 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_126.x, x_126.y, x_126.z, x_127.w);
  let x_129 : vec4<f32> = u_xlat0;
  let x_133 : vec4<f32> = x_40.unity_CameraToWorld[1i];
  u_xlat1 = (vec4<f32>(x_129.y, x_129.y, x_129.y, x_129.y) * x_133);
  let x_136 : vec4<f32> = x_40.unity_CameraToWorld[0i];
  let x_137 : vec4<f32> = u_xlat0;
  let x_140 : vec4<f32> = u_xlat1;
  u_xlat1 = ((x_136 * vec4<f32>(x_137.x, x_137.x, x_137.x, x_137.x)) + x_140);
  let x_143 : vec4<f32> = x_40.unity_CameraToWorld[2i];
  let x_144 : vec4<f32> = u_xlat0;
  let x_147 : vec4<f32> = u_xlat1;
  u_xlat0 = ((x_143 * vec4<f32>(x_144.z, x_144.z, x_144.z, x_144.z)) + x_147);
  let x_149 : vec4<f32> = u_xlat0;
  let x_152 : vec4<f32> = x_40.unity_CameraToWorld[3i];
  u_xlat0 = (x_149 + x_152);
  let x_154 : vec4<f32> = u_xlat0;
  let x_157 : vec4<f32> = x_40.unity_ShadowSplitSpheres[0i];
  let x_160 : vec3<f32> = (vec3<f32>(x_154.x, x_154.y, x_154.z) + -(vec3<f32>(x_157.x, x_157.y, x_157.z)));
  let x_161 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_160.x, x_160.y, x_160.z, x_161.w);
  let x_163 : vec4<f32> = u_xlat1;
  let x_165 : vec4<f32> = u_xlat1;
  u_xlat1.x = dot(vec3<f32>(x_163.x, x_163.y, x_163.z), vec3<f32>(x_165.x, x_165.y, x_165.z));
  let x_170 : vec4<f32> = u_xlat0;
  let x_173 : vec4<f32> = x_40.unity_ShadowSplitSpheres[1i];
  let x_176 : vec3<f32> = (vec3<f32>(x_170.x, x_170.y, x_170.z) + -(vec3<f32>(x_173.x, x_173.y, x_173.z)));
  let x_177 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_176.x, x_176.y, x_176.z, x_177.w);
  let x_179 : vec4<f32> = u_xlat2;
  let x_181 : vec4<f32> = u_xlat2;
  u_xlat1.y = dot(vec3<f32>(x_179.x, x_179.y, x_179.z), vec3<f32>(x_181.x, x_181.y, x_181.z));
  let x_185 : vec4<f32> = u_xlat0;
  let x_188 : vec4<f32> = x_40.unity_ShadowSplitSpheres[2i];
  let x_191 : vec3<f32> = (vec3<f32>(x_185.x, x_185.y, x_185.z) + -(vec3<f32>(x_188.x, x_188.y, x_188.z)));
  let x_192 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_191.x, x_191.y, x_191.z, x_192.w);
  let x_194 : vec4<f32> = u_xlat2;
  let x_196 : vec4<f32> = u_xlat2;
  u_xlat1.z = dot(vec3<f32>(x_194.x, x_194.y, x_194.z), vec3<f32>(x_196.x, x_196.y, x_196.z));
  let x_201 : vec4<f32> = u_xlat0;
  let x_204 : vec4<f32> = x_40.unity_ShadowSplitSpheres[3i];
  let x_207 : vec3<f32> = (vec3<f32>(x_201.x, x_201.y, x_201.z) + -(vec3<f32>(x_204.x, x_204.y, x_204.z)));
  let x_208 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_207.x, x_207.y, x_207.z, x_208.w);
  let x_210 : vec4<f32> = u_xlat2;
  let x_212 : vec4<f32> = u_xlat2;
  u_xlat1.w = dot(vec3<f32>(x_210.x, x_210.y, x_210.z), vec3<f32>(x_212.x, x_212.y, x_212.z));
  let x_220 : vec4<f32> = u_xlat1;
  let x_223 : vec4<f32> = x_40.unity_ShadowSplitSqRadii;
  u_xlatb1 = (x_220 < x_223);
  let x_227 : bool = u_xlatb1.x;
  u_xlat2.x = select(-0.0f, -1.0f, x_227);
  let x_233 : bool = u_xlatb1.y;
  u_xlat2.y = select(-0.0f, -1.0f, x_233);
  let x_237 : bool = u_xlatb1.z;
  u_xlat2.z = select(-0.0f, -1.0f, x_237);
  let x_241 : bool = u_xlatb1.x;
  u_xlat1.x = select(0.0f, 1.0f, x_241);
  let x_246 : bool = u_xlatb1.y;
  u_xlat1.y = select(0.0f, 1.0f, x_246);
  let x_250 : bool = u_xlatb1.z;
  u_xlat1.z = select(0.0f, 1.0f, x_250);
  let x_254 : bool = u_xlatb1.w;
  u_xlat1.w = select(0.0f, 1.0f, x_254);
  let x_257 : vec4<f32> = u_xlat2;
  let x_259 : vec4<f32> = u_xlat1;
  let x_261 : vec3<f32> = (vec3<f32>(x_257.x, x_257.y, x_257.z) + vec3<f32>(x_259.y, x_259.z, x_259.w));
  let x_262 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_261.x, x_261.y, x_261.z, x_262.w);
  let x_264 : vec4<f32> = u_xlat2;
  let x_267 : vec3<f32> = max(vec3<f32>(x_264.x, x_264.y, x_264.z), vec3<f32>(0.0f, 0.0f, 0.0f));
  let x_268 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_268.x, x_267.x, x_267.y, x_267.z);
  let x_270 : vec4<f32> = u_xlat0;
  let x_274 : vec4<f32> = x_40.unity_WorldToShadow[1i][1i];
  let x_276 : vec3<f32> = (vec3<f32>(x_270.y, x_270.y, x_270.y) * vec3<f32>(x_274.x, x_274.y, x_274.z));
  let x_277 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_276.x, x_276.y, x_276.z, x_277.w);
  let x_280 : vec4<f32> = x_40.unity_WorldToShadow[1i][0i];
  let x_282 : vec4<f32> = u_xlat0;
  let x_285 : vec4<f32> = u_xlat2;
  let x_287 : vec3<f32> = ((vec3<f32>(x_280.x, x_280.y, x_280.z) * vec3<f32>(x_282.x, x_282.x, x_282.x)) + vec3<f32>(x_285.x, x_285.y, x_285.z));
  let x_288 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_287.x, x_287.y, x_287.z, x_288.w);
  let x_291 : vec4<f32> = x_40.unity_WorldToShadow[1i][2i];
  let x_293 : vec4<f32> = u_xlat0;
  let x_296 : vec4<f32> = u_xlat2;
  let x_298 : vec3<f32> = ((vec3<f32>(x_291.x, x_291.y, x_291.z) * vec3<f32>(x_293.z, x_293.z, x_293.z)) + vec3<f32>(x_296.x, x_296.y, x_296.z));
  let x_299 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_298.x, x_298.y, x_298.z, x_299.w);
  let x_302 : vec4<f32> = x_40.unity_WorldToShadow[1i][3i];
  let x_304 : vec4<f32> = u_xlat0;
  let x_307 : vec4<f32> = u_xlat2;
  let x_309 : vec3<f32> = ((vec3<f32>(x_302.x, x_302.y, x_302.z) * vec3<f32>(x_304.w, x_304.w, x_304.w)) + vec3<f32>(x_307.x, x_307.y, x_307.z));
  let x_310 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_309.x, x_309.y, x_309.z, x_310.w);
  let x_312 : vec4<f32> = u_xlat1;
  let x_314 : vec4<f32> = u_xlat2;
  let x_316 : vec3<f32> = (vec3<f32>(x_312.y, x_312.y, x_312.y) * vec3<f32>(x_314.x, x_314.y, x_314.z));
  let x_317 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_316.x, x_316.y, x_316.z, x_317.w);
  let x_320 : vec4<f32> = u_xlat0;
  let x_323 : vec4<f32> = x_40.unity_WorldToShadow[0i][1i];
  let x_325 : vec3<f32> = (vec3<f32>(x_320.y, x_320.y, x_320.y) * vec3<f32>(x_323.x, x_323.y, x_323.z));
  let x_326 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_325.x, x_325.y, x_325.z, x_326.w);
  let x_329 : vec4<f32> = x_40.unity_WorldToShadow[0i][0i];
  let x_331 : vec4<f32> = u_xlat0;
  let x_334 : vec4<f32> = u_xlat3;
  let x_336 : vec3<f32> = ((vec3<f32>(x_329.x, x_329.y, x_329.z) * vec3<f32>(x_331.x, x_331.x, x_331.x)) + vec3<f32>(x_334.x, x_334.y, x_334.z));
  let x_337 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_336.x, x_336.y, x_336.z, x_337.w);
  let x_340 : vec4<f32> = x_40.unity_WorldToShadow[0i][2i];
  let x_342 : vec4<f32> = u_xlat0;
  let x_345 : vec4<f32> = u_xlat3;
  let x_347 : vec3<f32> = ((vec3<f32>(x_340.x, x_340.y, x_340.z) * vec3<f32>(x_342.z, x_342.z, x_342.z)) + vec3<f32>(x_345.x, x_345.y, x_345.z));
  let x_348 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_347.x, x_347.y, x_347.z, x_348.w);
  let x_351 : vec4<f32> = x_40.unity_WorldToShadow[0i][3i];
  let x_353 : vec4<f32> = u_xlat0;
  let x_356 : vec4<f32> = u_xlat3;
  let x_358 : vec3<f32> = ((vec3<f32>(x_351.x, x_351.y, x_351.z) * vec3<f32>(x_353.w, x_353.w, x_353.w)) + vec3<f32>(x_356.x, x_356.y, x_356.z));
  let x_359 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_358.x, x_358.y, x_358.z, x_359.w);
  let x_361 : vec4<f32> = u_xlat3;
  let x_363 : vec4<f32> = u_xlat1;
  let x_366 : vec4<f32> = u_xlat2;
  let x_368 : vec3<f32> = ((vec3<f32>(x_361.x, x_361.y, x_361.z) * vec3<f32>(x_363.x, x_363.x, x_363.x)) + vec3<f32>(x_366.x, x_366.y, x_366.z));
  let x_369 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_368.x, x_368.y, x_368.z, x_369.w);
  let x_371 : vec4<f32> = u_xlat1;
  u_xlat1.x = dot(x_371, vec4<f32>(1.0f, 1.0f, 1.0f, 1.0f));
  let x_375 : vec4<f32> = u_xlat0;
  let x_378 : vec4<f32> = x_40.unity_WorldToShadow[2i][1i];
  let x_380 : vec3<f32> = (vec3<f32>(x_375.y, x_375.y, x_375.y) * vec3<f32>(x_378.x, x_378.y, x_378.z));
  let x_381 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_380.x, x_380.y, x_380.z, x_381.w);
  let x_384 : vec4<f32> = x_40.unity_WorldToShadow[2i][0i];
  let x_386 : vec4<f32> = u_xlat0;
  let x_389 : vec4<f32> = u_xlat3;
  let x_391 : vec3<f32> = ((vec3<f32>(x_384.x, x_384.y, x_384.z) * vec3<f32>(x_386.x, x_386.x, x_386.x)) + vec3<f32>(x_389.x, x_389.y, x_389.z));
  let x_392 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_391.x, x_391.y, x_391.z, x_392.w);
  let x_395 : vec4<f32> = x_40.unity_WorldToShadow[2i][2i];
  let x_397 : vec4<f32> = u_xlat0;
  let x_400 : vec4<f32> = u_xlat3;
  let x_402 : vec3<f32> = ((vec3<f32>(x_395.x, x_395.y, x_395.z) * vec3<f32>(x_397.z, x_397.z, x_397.z)) + vec3<f32>(x_400.x, x_400.y, x_400.z));
  let x_403 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_402.x, x_402.y, x_402.z, x_403.w);
  let x_406 : vec4<f32> = x_40.unity_WorldToShadow[2i][3i];
  let x_408 : vec4<f32> = u_xlat0;
  let x_411 : vec4<f32> = u_xlat3;
  let x_413 : vec3<f32> = ((vec3<f32>(x_406.x, x_406.y, x_406.z) * vec3<f32>(x_408.w, x_408.w, x_408.w)) + vec3<f32>(x_411.x, x_411.y, x_411.z));
  let x_414 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_413.x, x_413.y, x_413.z, x_414.w);
  let x_416 : vec4<f32> = u_xlat3;
  let x_418 : vec4<f32> = u_xlat1;
  let x_421 : vec4<f32> = u_xlat2;
  let x_423 : vec3<f32> = ((vec3<f32>(x_416.x, x_416.y, x_416.z) * vec3<f32>(x_418.z, x_418.z, x_418.z)) + vec3<f32>(x_421.x, x_421.y, x_421.z));
  let x_424 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_423.x, x_423.y, x_423.z, x_424.w);
  let x_426 : vec4<f32> = u_xlat0;
  let x_429 : vec4<f32> = x_40.unity_WorldToShadow[3i][1i];
  let x_431 : vec3<f32> = (vec3<f32>(x_426.y, x_426.y, x_426.y) * vec3<f32>(x_429.x, x_429.y, x_429.z));
  let x_432 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_431.x, x_431.y, x_431.z, x_432.w);
  let x_435 : vec4<f32> = x_40.unity_WorldToShadow[3i][0i];
  let x_437 : vec4<f32> = u_xlat0;
  let x_440 : vec4<f32> = u_xlat3;
  let x_442 : vec3<f32> = ((vec3<f32>(x_435.x, x_435.y, x_435.z) * vec3<f32>(x_437.x, x_437.x, x_437.x)) + vec3<f32>(x_440.x, x_440.y, x_440.z));
  let x_443 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_442.x, x_442.y, x_442.z, x_443.w);
  let x_446 : vec4<f32> = x_40.unity_WorldToShadow[3i][2i];
  let x_448 : vec4<f32> = u_xlat0;
  let x_451 : vec4<f32> = u_xlat3;
  let x_453 : vec3<f32> = ((vec3<f32>(x_446.x, x_446.y, x_446.z) * vec3<f32>(x_448.z, x_448.z, x_448.z)) + vec3<f32>(x_451.x, x_451.y, x_451.z));
  let x_454 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_453.x, x_453.y, x_453.z, x_454.w);
  let x_457 : vec4<f32> = x_40.unity_WorldToShadow[3i][3i];
  let x_459 : vec4<f32> = u_xlat0;
  let x_462 : vec4<f32> = u_xlat0;
  let x_464 : vec3<f32> = ((vec3<f32>(x_457.x, x_457.y, x_457.z) * vec3<f32>(x_459.w, x_459.w, x_459.w)) + vec3<f32>(x_462.x, x_462.y, x_462.z));
  let x_465 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_464.x, x_464.y, x_464.z, x_465.w);
  let x_467 : vec4<f32> = u_xlat0;
  let x_469 : vec4<f32> = u_xlat1;
  let x_472 : vec4<f32> = u_xlat2;
  let x_474 : vec3<f32> = ((vec3<f32>(x_467.x, x_467.y, x_467.z) * vec3<f32>(x_469.w, x_469.w, x_469.w)) + vec3<f32>(x_472.x, x_472.y, x_472.z));
  let x_475 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_474.x, x_474.y, x_474.z, x_475.w);
  let x_479 : vec4<f32> = u_xlat0;
  let x_483 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  u_xlat10 = ((vec2<f32>(x_479.x, x_479.y) * vec2<f32>(x_483.z, x_483.w)) + vec2<f32>(0.5f, 0.5f));
  let x_489 : vec2<f32> = u_xlat10;
  u_xlat10 = floor(x_489);
  let x_491 : vec4<f32> = u_xlat0;
  let x_494 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_497 : vec2<f32> = u_xlat10;
  let x_499 : vec2<f32> = ((vec2<f32>(x_491.x, x_491.y) * vec2<f32>(x_494.z, x_494.w)) + -(x_497));
  let x_500 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_499.x, x_499.y, x_500.z, x_500.w);
  let x_503 : f32 = u_xlat1.x;
  let x_506 : f32 = u_xlat0.z;
  u_xlat18 = (-(x_503) + x_506);
  let x_508 : f32 = u_xlat18;
  u_xlat18 = (x_508 + 1.0f);
  let x_510 : vec4<f32> = u_xlat0;
  let x_514 : vec2<f32> = (-(vec2<f32>(x_510.x, x_510.y)) + vec2<f32>(1.0f, 1.0f));
  let x_515 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_514.x, x_515.y, x_515.z, x_514.y);
  let x_517 : vec4<f32> = u_xlat0;
  let x_520 : vec2<f32> = min(vec2<f32>(x_517.x, x_517.y), vec2<f32>(0.0f, 0.0f));
  let x_521 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_520.x, x_520.y, x_521.z, x_521.w);
  let x_523 : vec4<f32> = u_xlat2;
  let x_526 : vec4<f32> = u_xlat2;
  let x_529 : vec4<f32> = u_xlat1;
  let x_531 : vec2<f32> = ((-(vec2<f32>(x_523.x, x_523.y)) * vec2<f32>(x_526.x, x_526.y)) + vec2<f32>(x_529.x, x_529.w));
  let x_532 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_531.x, x_532.y, x_532.z, x_531.y);
  let x_534 : vec4<f32> = u_xlat1;
  let x_538 : vec2<f32> = (vec2<f32>(x_534.x, x_534.w) + vec2<f32>(2.0f, 2.0f));
  let x_539 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_538.x, x_539.y, x_539.z, x_538.y);
  let x_541 : vec4<f32> = u_xlat1;
  let x_545 : vec2<f32> = (vec2<f32>(x_541.x, x_541.w) * vec2<f32>(0.081632003f, 0.081632003f));
  let x_546 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_545.x, x_545.y, x_546.z, x_546.w);
  let x_549 : f32 = u_xlat2.x;
  u_xlat3.y = x_549;
  let x_551 : vec4<f32> = u_xlat0;
  let x_553 : vec2<f32> = max(vec2<f32>(x_551.x, x_551.y), vec2<f32>(0.0f, 0.0f));
  let x_554 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_553.x, x_554.y, x_554.z, x_553.y);
  let x_557 : vec4<f32> = u_xlat0;
  u_xlat4 = (vec4<f32>(x_557.x, x_557.x, x_557.y, x_557.y) + vec4<f32>(0.5f, 1.0f, 0.5f, 1.0f));
  let x_561 : vec4<f32> = u_xlat1;
  let x_564 : vec4<f32> = u_xlat1;
  let x_567 : vec4<f32> = u_xlat4;
  let x_569 : vec2<f32> = ((-(vec2<f32>(x_561.x, x_561.w)) * vec2<f32>(x_564.x, x_564.w)) + vec2<f32>(x_567.y, x_567.w));
  let x_570 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_569.x, x_570.y, x_570.z, x_569.y);
  let x_572 : vec4<f32> = u_xlat4;
  let x_574 : vec4<f32> = u_xlat4;
  u_xlat4 = (vec4<f32>(x_572.x, x_572.x, x_572.z, x_572.z) * vec4<f32>(x_574.x, x_574.x, x_574.z, x_574.z));
  let x_577 : vec4<f32> = u_xlat1;
  let x_579 : vec2<f32> = (vec2<f32>(x_577.x, x_577.w) + vec2<f32>(2.0f, 2.0f));
  let x_580 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_579.x, x_580.y, x_580.z, x_579.y);
  let x_584 : f32 = u_xlat1.x;
  u_xlat5.z = (x_584 * 0.081632003f);
  let x_589 : f32 = u_xlat1.w;
  u_xlat6.z = (x_589 * 0.081632003f);
  let x_592 : vec4<f32> = u_xlat0;
  let x_599 : vec2<f32> = ((vec2<f32>(x_592.x, x_592.x) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.163264006f, 0.081632003f));
  let x_600 : vec4<f32> = u_xlat5;
  u_xlat5 = vec4<f32>(x_600.x, x_599.x, x_600.z, x_599.y);
  let x_602 : vec4<f32> = u_xlat4;
  let x_605 : vec4<f32> = u_xlat0;
  let x_608 : vec2<f32> = ((vec2<f32>(x_602.x, x_602.z) * vec2<f32>(0.5f, 0.5f)) + -(vec2<f32>(x_605.x, x_605.y)));
  let x_609 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_608.x, x_609.y, x_609.z, x_608.y);
  let x_611 : vec4<f32> = u_xlat4;
  let x_615 : vec2<f32> = (vec2<f32>(x_611.y, x_611.w) * vec2<f32>(0.040816002f, 0.040816002f));
  let x_616 : vec4<f32> = u_xlat4;
  u_xlat4 = vec4<f32>(x_615.x, x_615.y, x_616.z, x_616.w);
  let x_618 : vec4<f32> = u_xlat1;
  let x_620 : vec2<f32> = (vec2<f32>(x_618.w, x_618.x) * vec2<f32>(0.081632003f, 0.081632003f));
  let x_621 : vec4<f32> = u_xlat6;
  u_xlat6 = vec4<f32>(x_620.x, x_620.y, x_621.z, x_621.w);
  let x_624 : f32 = u_xlat6.y;
  u_xlat5.x = x_624;
  let x_626 : vec4<f32> = u_xlat0;
  let x_630 : vec2<f32> = ((vec2<f32>(x_626.x, x_626.x) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.081632003f, 0.163264006f));
  let x_631 : vec4<f32> = u_xlat3;
  u_xlat3 = vec4<f32>(x_630.x, x_631.y, x_630.y, x_631.w);
  let x_634 : f32 = u_xlat4.x;
  u_xlat3.w = x_634;
  let x_637 : f32 = u_xlat4.y;
  u_xlat2.w = x_637;
  let x_639 : vec4<f32> = u_xlat3;
  let x_640 : vec4<f32> = u_xlat5;
  u_xlat4 = (x_639 + x_640);
  let x_642 : vec4<f32> = u_xlat3;
  let x_643 : vec4<f32> = u_xlat4;
  u_xlat3 = (x_642 / x_643);
  let x_645 : vec4<f32> = u_xlat3;
  u_xlat3 = (x_645 + vec4<f32>(-3.5f, -1.5f, 0.5f, 2.5f));
  let x_651 : vec4<f32> = u_xlat3;
  let x_654 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  u_xlat3 = (vec4<f32>(x_651.w, x_651.x, x_651.y, x_651.z) * vec4<f32>(x_654.x, x_654.x, x_654.x, x_654.x));
  let x_657 : vec4<f32> = u_xlat0;
  let x_660 : vec2<f32> = ((vec2<f32>(x_657.y, x_657.y) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.163264006f, 0.081632003f));
  let x_661 : vec4<f32> = u_xlat6;
  u_xlat6 = vec4<f32>(x_661.x, x_660.x, x_661.z, x_660.y);
  let x_663 : vec4<f32> = u_xlat0;
  let x_666 : vec2<f32> = ((vec2<f32>(x_663.y, x_663.y) * vec2<f32>(-0.081632003f, 0.081632003f)) + vec2<f32>(0.081632003f, 0.163264006f));
  let x_667 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_666.x, x_667.y, x_666.y, x_667.w);
  let x_669 : vec4<f32> = u_xlat2;
  let x_670 : vec4<f32> = u_xlat6;
  u_xlat5 = (x_669 + x_670);
  let x_672 : vec4<f32> = u_xlat2;
  let x_673 : vec4<f32> = u_xlat5;
  u_xlat2 = (x_672 / x_673);
  let x_675 : vec4<f32> = u_xlat2;
  u_xlat2 = (x_675 + vec4<f32>(-3.5f, -1.5f, 0.5f, 2.5f));
  let x_677 : vec4<f32> = u_xlat2;
  let x_680 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  u_xlat2 = (vec4<f32>(x_677.x, x_677.w, x_677.y, x_677.z) * vec4<f32>(x_680.y, x_680.y, x_680.y, x_680.y));
  let x_683 : vec4<f32> = u_xlat4;
  let x_684 : vec4<f32> = u_xlat5;
  u_xlat6 = (x_683 * vec4<f32>(x_684.x, x_684.x, x_684.x, x_684.x));
  let x_688 : vec4<f32> = u_xlat3;
  let x_689 : vec3<f32> = vec3<f32>(x_688.y, x_688.z, x_688.w);
  let x_690 : vec4<f32> = u_xlat7;
  u_xlat7 = vec4<f32>(x_689.x, x_690.y, x_689.y, x_689.z);
  let x_693 : f32 = u_xlat2.x;
  u_xlat7.y = x_693;
  let x_696 : vec2<f32> = u_xlat10;
  let x_699 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_702 : vec4<f32> = u_xlat7;
  u_xlat8 = ((vec4<f32>(x_696.x, x_696.y, x_696.x, x_696.y) * vec4<f32>(x_699.x, x_699.y, x_699.x, x_699.y)) + vec4<f32>(x_702.x, x_702.y, x_702.z, x_702.y));
  let x_707 : vec4<f32> = u_xlat8;
  let x_708 : vec2<f32> = vec2<f32>(x_707.x, x_707.y);
  let x_709 : f32 = u_xlat18;
  txVec0 = vec3<f32>(x_708.x, x_708.y, x_709);
  let x_721 : vec3<f32> = txVec0;
  let x_723 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_721.xy, x_721.z);
  u_xlat0.x = x_723;
  let x_726 : vec4<f32> = u_xlat8;
  let x_727 : vec2<f32> = vec2<f32>(x_726.z, x_726.w);
  let x_728 : f32 = u_xlat18;
  txVec1 = vec3<f32>(x_727.x, x_727.y, x_728);
  let x_735 : vec3<f32> = txVec1;
  let x_737 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_735.xy, x_735.z);
  u_xlat9.x = x_737;
  let x_740 : f32 = u_xlat9.x;
  let x_742 : f32 = u_xlat6.y;
  u_xlat9.x = (x_740 * x_742);
  let x_746 : f32 = u_xlat6.x;
  let x_748 : f32 = u_xlat0.x;
  let x_751 : f32 = u_xlat9.x;
  u_xlat0.x = ((x_746 * x_748) + x_751);
  let x_754 : vec2<f32> = u_xlat10;
  let x_756 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_759 : vec4<f32> = u_xlat7;
  let x_761 : vec2<f32> = ((x_754 * vec2<f32>(x_756.x, x_756.y)) + vec2<f32>(x_759.w, x_759.y));
  let x_762 : vec3<f32> = u_xlat9;
  u_xlat9 = vec3<f32>(x_761.x, x_762.y, x_761.y);
  let x_765 : f32 = u_xlat7.y;
  u_xlat3.y = x_765;
  let x_767 : vec2<f32> = u_xlat10;
  let x_769 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_772 : vec4<f32> = u_xlat3;
  let x_774 : vec2<f32> = ((x_767 * vec2<f32>(x_769.x, x_769.y)) + vec2<f32>(x_772.x, x_772.y));
  let x_775 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_774.x, x_775.y, x_775.z, x_774.y);
  let x_778 : vec4<f32> = u_xlat1;
  let x_779 : vec2<f32> = vec2<f32>(x_778.x, x_778.w);
  let x_780 : f32 = u_xlat18;
  txVec2 = vec3<f32>(x_779.x, x_779.y, x_780);
  let x_787 : vec3<f32> = txVec2;
  let x_789 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_787.xy, x_787.z);
  u_xlat1.x = x_789;
  let x_792 : vec3<f32> = u_xlat9;
  let x_793 : vec2<f32> = vec2<f32>(x_792.x, x_792.z);
  let x_794 : f32 = u_xlat18;
  txVec3 = vec3<f32>(x_793.x, x_793.y, x_794);
  let x_801 : vec3<f32> = txVec3;
  let x_803 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_801.xy, x_801.z);
  u_xlat9.x = x_803;
  let x_806 : f32 = u_xlat6.z;
  let x_808 : f32 = u_xlat9.x;
  let x_811 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_806 * x_808) + x_811);
  let x_815 : f32 = u_xlat6.w;
  let x_817 : f32 = u_xlat1.x;
  let x_820 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_815 * x_817) + x_820);
  let x_823 : vec4<f32> = u_xlat4;
  let x_824 : vec4<f32> = u_xlat5;
  u_xlat6 = (x_823 * vec4<f32>(x_824.y, x_824.y, x_824.y, x_824.y));
  let x_828 : f32 = u_xlat2.z;
  u_xlat7.y = x_828;
  let x_830 : vec2<f32> = u_xlat10;
  let x_833 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_836 : vec4<f32> = u_xlat7;
  u_xlat8 = ((vec4<f32>(x_830.x, x_830.y, x_830.x, x_830.y) * vec4<f32>(x_833.x, x_833.y, x_833.x, x_833.y)) + vec4<f32>(x_836.x, x_836.y, x_836.z, x_836.y));
  let x_840 : vec4<f32> = u_xlat8;
  let x_841 : vec2<f32> = vec2<f32>(x_840.x, x_840.y);
  let x_842 : f32 = u_xlat18;
  txVec4 = vec3<f32>(x_841.x, x_841.y, x_842);
  let x_849 : vec3<f32> = txVec4;
  let x_851 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_849.xy, x_849.z);
  u_xlat9.x = x_851;
  let x_854 : vec4<f32> = u_xlat8;
  let x_855 : vec2<f32> = vec2<f32>(x_854.z, x_854.w);
  let x_856 : f32 = u_xlat18;
  txVec5 = vec3<f32>(x_855.x, x_855.y, x_856);
  let x_864 : vec3<f32> = txVec5;
  let x_866 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_864.xy, x_864.z);
  u_xlat27 = x_866;
  let x_868 : f32 = u_xlat6.x;
  let x_870 : f32 = u_xlat9.x;
  let x_873 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_868 * x_870) + x_873);
  let x_877 : f32 = u_xlat6.y;
  let x_878 : f32 = u_xlat27;
  let x_881 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_877 * x_878) + x_881);
  let x_884 : vec2<f32> = u_xlat10;
  let x_886 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_889 : vec4<f32> = u_xlat7;
  let x_891 : vec2<f32> = ((x_884 * vec2<f32>(x_886.x, x_886.y)) + vec2<f32>(x_889.w, x_889.y));
  let x_892 : vec3<f32> = u_xlat9;
  u_xlat9 = vec3<f32>(x_891.x, x_892.y, x_891.y);
  let x_895 : f32 = u_xlat7.y;
  u_xlat3.z = x_895;
  let x_897 : vec2<f32> = u_xlat10;
  let x_899 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_902 : vec4<f32> = u_xlat3;
  let x_904 : vec2<f32> = ((x_897 * vec2<f32>(x_899.x, x_899.y)) + vec2<f32>(x_902.x, x_902.z));
  let x_905 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_904.x, x_905.y, x_905.z, x_904.y);
  let x_908 : vec4<f32> = u_xlat1;
  let x_909 : vec2<f32> = vec2<f32>(x_908.x, x_908.w);
  let x_910 : f32 = u_xlat18;
  txVec6 = vec3<f32>(x_909.x, x_909.y, x_910);
  let x_917 : vec3<f32> = txVec6;
  let x_919 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_917.xy, x_917.z);
  u_xlat1.x = x_919;
  let x_922 : vec3<f32> = u_xlat9;
  let x_923 : vec2<f32> = vec2<f32>(x_922.x, x_922.z);
  let x_924 : f32 = u_xlat18;
  txVec7 = vec3<f32>(x_923.x, x_923.y, x_924);
  let x_931 : vec3<f32> = txVec7;
  let x_933 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_931.xy, x_931.z);
  u_xlat9.x = x_933;
  let x_936 : f32 = u_xlat6.z;
  let x_938 : f32 = u_xlat9.x;
  let x_941 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_936 * x_938) + x_941);
  let x_945 : f32 = u_xlat6.w;
  let x_947 : f32 = u_xlat1.x;
  let x_950 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_945 * x_947) + x_950);
  let x_953 : vec4<f32> = u_xlat4;
  let x_954 : vec4<f32> = u_xlat5;
  u_xlat6 = (x_953 * vec4<f32>(x_954.z, x_954.z, x_954.z, x_954.z));
  let x_957 : vec4<f32> = u_xlat4;
  let x_958 : vec4<f32> = u_xlat5;
  u_xlat4 = (x_957 * vec4<f32>(x_958.w, x_958.w, x_958.w, x_958.w));
  let x_962 : f32 = u_xlat2.w;
  u_xlat7.y = x_962;
  let x_964 : vec2<f32> = u_xlat10;
  let x_967 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_970 : vec4<f32> = u_xlat7;
  u_xlat5 = ((vec4<f32>(x_964.x, x_964.y, x_964.x, x_964.y) * vec4<f32>(x_967.x, x_967.y, x_967.x, x_967.y)) + vec4<f32>(x_970.x, x_970.y, x_970.z, x_970.y));
  let x_974 : vec4<f32> = u_xlat5;
  let x_975 : vec2<f32> = vec2<f32>(x_974.x, x_974.y);
  let x_976 : f32 = u_xlat18;
  txVec8 = vec3<f32>(x_975.x, x_975.y, x_976);
  let x_983 : vec3<f32> = txVec8;
  let x_985 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_983.xy, x_983.z);
  u_xlat9.x = x_985;
  let x_988 : vec4<f32> = u_xlat5;
  let x_989 : vec2<f32> = vec2<f32>(x_988.z, x_988.w);
  let x_990 : f32 = u_xlat18;
  txVec9 = vec3<f32>(x_989.x, x_989.y, x_990);
  let x_997 : vec3<f32> = txVec9;
  let x_999 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_997.xy, x_997.z);
  u_xlat27 = x_999;
  let x_1001 : f32 = u_xlat6.x;
  let x_1003 : f32 = u_xlat9.x;
  let x_1006 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1001 * x_1003) + x_1006);
  let x_1010 : f32 = u_xlat6.y;
  let x_1011 : f32 = u_xlat27;
  let x_1014 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1010 * x_1011) + x_1014);
  let x_1017 : vec2<f32> = u_xlat10;
  let x_1019 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_1022 : vec4<f32> = u_xlat7;
  let x_1024 : vec2<f32> = ((x_1017 * vec2<f32>(x_1019.x, x_1019.y)) + vec2<f32>(x_1022.w, x_1022.y));
  let x_1025 : vec3<f32> = u_xlat9;
  u_xlat9 = vec3<f32>(x_1024.x, x_1025.y, x_1024.y);
  let x_1027 : vec4<f32> = u_xlat7;
  let x_1028 : vec3<f32> = vec3<f32>(x_1027.x, x_1027.z, x_1027.w);
  let x_1029 : vec4<f32> = u_xlat2;
  u_xlat2 = vec4<f32>(x_1028.x, x_1029.y, x_1028.y, x_1028.z);
  let x_1032 : f32 = u_xlat7.y;
  u_xlat3.w = x_1032;
  let x_1034 : vec2<f32> = u_xlat10;
  let x_1036 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_1039 : vec4<f32> = u_xlat3;
  let x_1041 : vec2<f32> = ((x_1034 * vec2<f32>(x_1036.x, x_1036.y)) + vec2<f32>(x_1039.x, x_1039.w));
  let x_1042 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1041.x, x_1042.y, x_1042.z, x_1041.y);
  let x_1045 : vec4<f32> = u_xlat1;
  let x_1046 : vec2<f32> = vec2<f32>(x_1045.x, x_1045.w);
  let x_1047 : f32 = u_xlat18;
  txVec10 = vec3<f32>(x_1046.x, x_1046.y, x_1047);
  let x_1054 : vec3<f32> = txVec10;
  let x_1056 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_1054.xy, x_1054.z);
  u_xlat1.x = x_1056;
  let x_1059 : vec3<f32> = u_xlat9;
  let x_1060 : vec2<f32> = vec2<f32>(x_1059.x, x_1059.z);
  let x_1061 : f32 = u_xlat18;
  txVec11 = vec3<f32>(x_1060.x, x_1060.y, x_1061);
  let x_1068 : vec3<f32> = txVec11;
  let x_1070 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_1068.xy, x_1068.z);
  u_xlat9.x = x_1070;
  let x_1073 : f32 = u_xlat6.z;
  let x_1075 : f32 = u_xlat9.x;
  let x_1078 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1073 * x_1075) + x_1078);
  let x_1082 : f32 = u_xlat6.w;
  let x_1084 : f32 = u_xlat1.x;
  let x_1087 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1082 * x_1084) + x_1087);
  let x_1090 : vec2<f32> = u_xlat10;
  let x_1093 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_1096 : vec4<f32> = u_xlat2;
  u_xlat5 = ((vec4<f32>(x_1090.x, x_1090.y, x_1090.x, x_1090.y) * vec4<f32>(x_1093.x, x_1093.y, x_1093.x, x_1093.y)) + vec4<f32>(x_1096.x, x_1096.y, x_1096.z, x_1096.y));
  let x_1099 : vec2<f32> = u_xlat10;
  let x_1101 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_1104 : vec4<f32> = u_xlat2;
  let x_1106 : vec2<f32> = ((x_1099 * vec2<f32>(x_1101.x, x_1101.y)) + vec2<f32>(x_1104.w, x_1104.y));
  let x_1107 : vec3<f32> = u_xlat9;
  u_xlat9 = vec3<f32>(x_1106.x, x_1107.y, x_1106.y);
  let x_1110 : f32 = u_xlat2.y;
  u_xlat3.y = x_1110;
  let x_1112 : vec2<f32> = u_xlat10;
  let x_1114 : vec4<f32> = x_40.x_ShadowMapTexture_TexelSize;
  let x_1117 : vec4<f32> = u_xlat3;
  let x_1119 : vec2<f32> = ((x_1112 * vec2<f32>(x_1114.x, x_1114.y)) + vec2<f32>(x_1117.x, x_1117.y));
  let x_1120 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_1119.x, x_1119.y, x_1120.z, x_1120.w);
  let x_1123 : vec4<f32> = u_xlat1;
  let x_1124 : vec2<f32> = vec2<f32>(x_1123.x, x_1123.y);
  let x_1125 : f32 = u_xlat18;
  txVec12 = vec3<f32>(x_1124.x, x_1124.y, x_1125);
  let x_1132 : vec3<f32> = txVec12;
  let x_1134 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_1132.xy, x_1132.z);
  u_xlat1.x = x_1134;
  let x_1137 : vec3<f32> = u_xlat9;
  let x_1138 : vec2<f32> = vec2<f32>(x_1137.x, x_1137.z);
  let x_1139 : f32 = u_xlat18;
  txVec13 = vec3<f32>(x_1138.x, x_1138.y, x_1139);
  let x_1146 : vec3<f32> = txVec13;
  let x_1148 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_1146.xy, x_1146.z);
  u_xlat9.x = x_1148;
  let x_1151 : vec4<f32> = u_xlat5;
  let x_1152 : vec2<f32> = vec2<f32>(x_1151.x, x_1151.y);
  let x_1153 : f32 = u_xlat18;
  txVec14 = vec3<f32>(x_1152.x, x_1152.y, x_1153);
  let x_1160 : vec3<f32> = txVec14;
  let x_1162 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_1160.xy, x_1160.z);
  u_xlat27 = x_1162;
  let x_1164 : vec4<f32> = u_xlat5;
  let x_1165 : vec2<f32> = vec2<f32>(x_1164.z, x_1164.w);
  let x_1166 : f32 = u_xlat18;
  txVec15 = vec3<f32>(x_1165.x, x_1165.y, x_1166);
  let x_1173 : vec3<f32> = txVec15;
  let x_1175 : f32 = textureSampleCompareLevel(x_ShadowMapTexture, sampler_ShadowMapTexture, x_1173.xy, x_1173.z);
  u_xlat18 = x_1175;
  let x_1177 : f32 = u_xlat4.x;
  let x_1178 : f32 = u_xlat27;
  let x_1181 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1177 * x_1178) + x_1181);
  let x_1185 : f32 = u_xlat4.y;
  let x_1186 : f32 = u_xlat18;
  let x_1189 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1185 * x_1186) + x_1189);
  let x_1193 : f32 = u_xlat4.z;
  let x_1195 : f32 = u_xlat9.x;
  let x_1198 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1193 * x_1195) + x_1198);
  let x_1202 : f32 = u_xlat4.w;
  let x_1204 : f32 = u_xlat1.x;
  let x_1207 : f32 = u_xlat0.x;
  u_xlat0.x = ((x_1202 * x_1204) + x_1207);
  let x_1212 : f32 = x_40.x_LightShadowData.x;
  u_xlat9.x = (-(x_1212) + 1.0f);
  let x_1218 : vec4<f32> = u_xlat0;
  let x_1220 : vec3<f32> = u_xlat9;
  let x_1224 : vec4<f32> = x_40.x_LightShadowData;
  SV_Target0 = ((vec4<f32>(x_1218.x, x_1218.x, x_1218.x, x_1218.x) * vec4<f32>(x_1220.x, x_1220.x, x_1220.x, x_1220.x)) + vec4<f32>(x_1224.x, x_1224.x, x_1224.x, x_1224.x));
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

