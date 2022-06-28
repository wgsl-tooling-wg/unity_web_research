struct cb {
  x_Size : vec4<f32>,
}

struct S {
  value : array<u32, 1u>,
}

struct S_1 {
  value : array<u32, 1u>,
}

struct S_2 {
  value : array<u32, 1u>,
}

struct S_3 {
  value : array<u32, 1u>,
}

var<private> u_xlati0 : vec4<i32>;

var<private> gl_WorkGroupID : vec3<u32>;

var<private> u_xlati1 : vec4<i32>;

var<private> gl_LocalInvocationID : vec3<u32>;

var<private> u_xlat0 : vec4<f32>;

var<private> u_xlat2 : vec4<f32>;

@group(0) @binding(0) var<uniform> x_69 : cb;

var<private> u_xlat3 : vec4<f32>;

@group(0) @binding(1) var x_Source : texture_2d<f32>;

@group(0) @binding(3) var sampler_LinearClamp : sampler;

var<private> u_xlatu2 : vec4<u32>;

var<private> u_xlatu3 : vec4<u32>;

var<private> u_xlati2 : vec4<i32>;

var<private> u_xlati14 : vec2<i32>;

var<workgroup> TGSM0 : array<S, 128u>;

var<workgroup> TGSM1 : array<S_1, 128u>;

var<workgroup> TGSM2 : array<S_2, 128u>;

var<workgroup> TGSM3 : array<S_3, 128u>;

var<private> u_xlatu0 : vec4<u32>;

var<private> u_xlati40 : i32;

var<private> u_xlatu13 : vec3<u32>;

var<private> u_xlatu14 : u32;

var<private> u_xlatu40 : u32;

var<private> u_xlatu16 : vec3<u32>;

var<private> u_xlatu15 : u32;

var<private> u_xlatu4 : vec3<u32>;

var<private> u_xlatu17 : vec3<u32>;

var<private> u_xlatu5 : u32;

var<private> u_xlatu18 : u32;

var<private> u_xlatu28 : u32;

var<private> u_xlatu41 : u32;

var<private> u_xlat6 : vec4<f32>;

var<private> u_xlat7 : vec4<f32>;

var<private> u_xlat8 : vec4<f32>;

var<private> u_xlat9 : vec4<f32>;

var<private> u_xlat11 : vec4<f32>;

var<private> u_xlat10 : vec4<f32>;

var<private> u_xlat12 : vec4<f32>;

var<private> u_xlat4 : vec4<f32>;

var<private> u_xlat1 : vec4<f32>;

@group(0) @binding(2) var x_Result_origX0X : texture_storage_2d<rgba32float, write>;

var<private> gl_GlobalInvocationID : vec3<u32>;

fn main_1() {
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_15 : vec3<u32> = gl_WorkGroupID;
  u_xlati0 = (bitcast<vec4<i32>>(vec4<u32>(x_15.x, x_15.y, x_15.x, x_15.y)) << bitcast<vec4<u32>>(vec4<i32>(3i, 3i, 3i, 3i)));
  let x_23 : vec3<u32> = gl_LocalInvocationID;
  u_xlati1 = (bitcast<vec4<i32>>(vec4<u32>(x_23.x, x_23.y, x_23.x, x_23.y)) << bitcast<vec4<u32>>(vec4<i32>(1i, 1i, 1i, 1i)));
  let x_29 : vec4<i32> = u_xlati0;
  let x_30 : vec4<i32> = u_xlati1;
  u_xlati0 = (x_29 + x_30);
  let x_35 : u32 = gl_LocalInvocationID.y;
  let x_42 : i32 = u_xlati1.z;
  u_xlati1.x = ((bitcast<i32>(x_35) * 16i) + x_42);
  let x_46 : vec4<i32> = u_xlati0;
  u_xlati0 = (x_46 + vec4<i32>(-4i, -4i, -4i, -4i));
  let x_54 : vec4<i32> = u_xlati0;
  u_xlat0 = vec4<f32>(x_54);
  let x_57 : vec4<f32> = u_xlat0;
  u_xlat2 = (vec4<f32>(x_57.z, x_57.w, x_57.z, x_57.w) + vec4<f32>(0.5f, 0.5f, 1.5f, 0.5f));
  let x_63 : vec4<f32> = u_xlat0;
  u_xlat0 = (x_63 + vec4<f32>(0.5f, 1.5f, 1.5f, 1.5f));
  let x_66 : vec4<f32> = u_xlat0;
  let x_73 : vec4<f32> = x_69.x_Size;
  u_xlat0 = (x_66 * vec4<f32>(x_73.z, x_73.w, x_73.z, x_73.w));
  let x_76 : vec4<f32> = u_xlat2;
  let x_78 : vec4<f32> = x_69.x_Size;
  u_xlat2 = (x_76 * vec4<f32>(x_78.z, x_78.w, x_78.z, x_78.w));
  let x_93 : vec4<f32> = u_xlat2;
  let x_96 : vec4<f32> = textureSampleLevel(x_Source, sampler_LinearClamp, vec2<f32>(x_93.x, x_93.y), 0.0f);
  u_xlat3 = x_96;
  let x_100 : vec4<f32> = u_xlat2;
  let x_102 : vec4<f32> = textureSampleLevel(x_Source, sampler_LinearClamp, vec2<f32>(x_100.z, x_100.w), 0.0f);
  u_xlat2 = x_102;
  let x_107 : f32 = u_xlat2.x;
  u_xlatu2.x = pack2x16float(vec2<f32>(x_107, 0.0f));
  let x_113 : f32 = u_xlat2.y;
  u_xlatu2.y = pack2x16float(vec2<f32>(x_113, 0.0f));
  let x_118 : f32 = u_xlat2.z;
  u_xlatu2.z = pack2x16float(vec2<f32>(x_118, 0.0f));
  let x_124 : f32 = u_xlat2.w;
  u_xlatu2.w = pack2x16float(vec2<f32>(x_124, 0.0f));
  let x_130 : f32 = u_xlat3.x;
  u_xlatu3.x = pack2x16float(vec2<f32>(x_130, 0.0f));
  let x_135 : f32 = u_xlat3.y;
  u_xlatu3.y = pack2x16float(vec2<f32>(x_135, 0.0f));
  let x_140 : f32 = u_xlat3.z;
  u_xlatu3.z = pack2x16float(vec2<f32>(x_140, 0.0f));
  let x_145 : f32 = u_xlat3.w;
  u_xlatu3.w = pack2x16float(vec2<f32>(x_145, 0.0f));
  let x_150 : vec4<u32> = u_xlatu2;
  let x_155 : vec4<u32> = u_xlatu3;
  u_xlati2 = ((bitcast<vec4<i32>>(x_150) * vec4<i32>(65536i, 65536i, 65536i, 65536i)) + bitcast<vec4<i32>>(x_155));
  let x_162 : vec3<u32> = gl_LocalInvocationID;
  let x_168 : vec3<u32> = gl_LocalInvocationID;
  u_xlati14 = ((bitcast<vec2<i32>>(vec2<u32>(x_162.y, x_162.y)) * vec2<i32>(16i, 8i)) + bitcast<vec2<i32>>(vec2<u32>(x_168.x, x_168.x)));
  let x_179 : i32 = u_xlati14.x;
  let x_181 : i32 = u_xlati2.x;
  TGSM0[x_179].value[0i] = bitcast<u32>(x_181);
  let x_190 : i32 = u_xlati14.x;
  let x_192 : i32 = u_xlati2.y;
  TGSM1[x_190].value[0i] = bitcast<u32>(x_192);
  let x_200 : i32 = u_xlati14.x;
  let x_202 : i32 = u_xlati2.z;
  TGSM2[x_200].value[0i] = bitcast<u32>(x_202);
  let x_210 : i32 = u_xlati14.x;
  let x_212 : i32 = u_xlati2.w;
  TGSM3[x_210].value[0i] = bitcast<u32>(x_212);
  let x_218 : vec4<f32> = u_xlat0;
  let x_220 : vec4<f32> = textureSampleLevel(x_Source, sampler_LinearClamp, vec2<f32>(x_218.x, x_218.y), 0.0f);
  u_xlat2 = x_220;
  let x_224 : vec4<f32> = u_xlat0;
  let x_226 : vec4<f32> = textureSampleLevel(x_Source, sampler_LinearClamp, vec2<f32>(x_224.z, x_224.w), 0.0f);
  u_xlat0 = x_226;
  let x_229 : f32 = u_xlat0.x;
  u_xlatu0.x = pack2x16float(vec2<f32>(x_229, 0.0f));
  let x_234 : f32 = u_xlat0.y;
  u_xlatu0.y = pack2x16float(vec2<f32>(x_234, 0.0f));
  let x_239 : f32 = u_xlat0.z;
  u_xlatu0.z = pack2x16float(vec2<f32>(x_239, 0.0f));
  let x_244 : f32 = u_xlat0.w;
  u_xlatu0.w = pack2x16float(vec2<f32>(x_244, 0.0f));
  let x_249 : f32 = u_xlat2.x;
  u_xlatu2.x = pack2x16float(vec2<f32>(x_249, 0.0f));
  let x_254 : f32 = u_xlat2.y;
  u_xlatu2.y = pack2x16float(vec2<f32>(x_254, 0.0f));
  let x_259 : f32 = u_xlat2.z;
  u_xlatu2.z = pack2x16float(vec2<f32>(x_259, 0.0f));
  let x_264 : f32 = u_xlat2.w;
  u_xlatu2.w = pack2x16float(vec2<f32>(x_264, 0.0f));
  let x_268 : vec4<u32> = u_xlatu0;
  let x_271 : vec4<u32> = u_xlatu2;
  u_xlati0 = ((bitcast<vec4<i32>>(x_268) * vec4<i32>(65536i, 65536i, 65536i, 65536i)) + bitcast<vec4<i32>>(x_271));
  let x_276 : i32 = u_xlati14.x;
  u_xlati40 = (x_276 + 8i);
  let x_278 : i32 = u_xlati40;
  let x_280 : i32 = u_xlati0.x;
  TGSM0[x_278].value[0i] = bitcast<u32>(x_280);
  let x_283 : i32 = u_xlati40;
  let x_285 : i32 = u_xlati0.y;
  TGSM1[x_283].value[0i] = bitcast<u32>(x_285);
  let x_288 : i32 = u_xlati40;
  let x_290 : i32 = u_xlati0.z;
  TGSM2[x_288].value[0i] = bitcast<u32>(x_290);
  let x_293 : i32 = u_xlati40;
  let x_295 : i32 = u_xlati0.w;
  TGSM3[x_293].value[0i] = bitcast<u32>(x_295);
  workgroupBarrier();
  let x_300 : u32 = gl_LocalInvocationID.x;
  u_xlati0.x = bitcast<i32>((x_300 & 4u));
  let x_306 : i32 = u_xlati0.x;
  let x_308 : i32 = u_xlati14.x;
  u_xlati0.x = (x_306 + x_308);
  let x_314 : i32 = u_xlati0.x;
  let x_316 : u32 = TGSM0[x_314].value[0i];
  u_xlatu13.x = x_316;
  let x_319 : i32 = u_xlati0.x;
  let x_321 : u32 = TGSM1[x_319].value[0i];
  u_xlatu13.y = x_321;
  let x_324 : i32 = u_xlati0.x;
  let x_326 : u32 = TGSM2[x_324].value[0i];
  u_xlatu13.z = x_326;
  let x_330 : i32 = u_xlati0.x;
  let x_332 : u32 = TGSM3[x_330].value[0i];
  u_xlatu14 = x_332;
  let x_333 : vec4<i32> = u_xlati0;
  u_xlati2 = (vec4<i32>(x_333.x, x_333.x, x_333.x, x_333.x) + vec4<i32>(1i, 2i, 3i, 4i));
  let x_340 : i32 = u_xlati2.x;
  let x_342 : u32 = TGSM0[x_340].value[0i];
  u_xlatu0.x = x_342;
  let x_346 : i32 = u_xlati2.x;
  let x_348 : u32 = TGSM1[x_346].value[0i];
  u_xlatu40 = x_348;
  let x_350 : i32 = u_xlati2.x;
  let x_352 : u32 = TGSM2[x_350].value[0i];
  u_xlatu3.x = x_352;
  let x_355 : i32 = u_xlati2.x;
  let x_357 : u32 = TGSM3[x_355].value[0i];
  u_xlatu2.x = x_357;
  let x_361 : i32 = u_xlati2.y;
  let x_363 : u32 = TGSM0[x_361].value[0i];
  u_xlatu16.x = x_363;
  let x_366 : i32 = u_xlati2.y;
  let x_368 : u32 = TGSM1[x_366].value[0i];
  u_xlatu16.y = x_368;
  let x_371 : i32 = u_xlati2.y;
  let x_373 : u32 = TGSM2[x_371].value[0i];
  u_xlatu16.z = x_373;
  let x_377 : i32 = u_xlati2.y;
  let x_379 : u32 = TGSM3[x_377].value[0i];
  u_xlatu15 = x_379;
  let x_382 : i32 = u_xlati2.z;
  let x_384 : u32 = TGSM0[x_382].value[0i];
  u_xlatu4.x = x_384;
  let x_388 : i32 = u_xlati2.w;
  let x_390 : u32 = TGSM0[x_388].value[0i];
  u_xlatu17.x = x_390;
  let x_393 : i32 = u_xlati2.z;
  let x_395 : u32 = TGSM1[x_393].value[0i];
  u_xlatu4.z = x_395;
  let x_398 : i32 = u_xlati2.w;
  let x_400 : u32 = TGSM1[x_398].value[0i];
  u_xlatu17.z = x_400;
  let x_404 : i32 = u_xlati2.z;
  let x_406 : u32 = TGSM2[x_404].value[0i];
  u_xlatu5 = x_406;
  let x_409 : i32 = u_xlati2.w;
  let x_411 : u32 = TGSM2[x_409].value[0i];
  u_xlatu18 = x_411;
  let x_414 : i32 = u_xlati2.z;
  let x_416 : u32 = TGSM3[x_414].value[0i];
  u_xlatu28 = x_416;
  let x_419 : i32 = u_xlati2.w;
  let x_421 : u32 = TGSM3[x_419].value[0i];
  u_xlatu41 = x_421;
  let x_424 : u32 = u_xlatu16.x;
  u_xlat6.x = unpack2x16float(x_424).x;
  let x_429 : u32 = u_xlatu16.y;
  u_xlat6.y = unpack2x16float(x_429).x;
  let x_434 : u32 = u_xlatu16.z;
  u_xlat6.z = unpack2x16float(x_434).x;
  let x_439 : u32 = u_xlatu16.x;
  u_xlatu16.x = (x_439 >> 16u);
  let x_445 : u32 = u_xlatu16.x;
  u_xlat7.x = unpack2x16float(x_445).x;
  let x_450 : u32 = u_xlatu16.y;
  u_xlatu16.x = (x_450 >> 16u);
  let x_454 : u32 = u_xlatu16.x;
  u_xlat7.y = unpack2x16float(x_454).x;
  let x_459 : u32 = u_xlatu16.z;
  u_xlatu16.x = (x_459 >> 16u);
  let x_463 : u32 = u_xlatu16.x;
  u_xlat7.z = unpack2x16float(x_463).x;
  let x_467 : u32 = u_xlatu15;
  u_xlat6.w = unpack2x16float(x_467).x;
  let x_471 : u32 = u_xlatu15;
  u_xlatu15 = (x_471 >> 16u);
  let x_473 : u32 = u_xlatu15;
  u_xlat7.w = unpack2x16float(x_473).x;
  let x_478 : u32 = u_xlatu0.x;
  u_xlatu15 = (x_478 >> 16u);
  let x_482 : u32 = u_xlatu0.x;
  u_xlat8.x = unpack2x16float(x_482).x;
  let x_487 : u32 = u_xlatu15;
  u_xlat9.x = unpack2x16float(x_487).x;
  let x_491 : u32 = u_xlatu40;
  u_xlatu0.x = (x_491 >> 16u);
  let x_494 : u32 = u_xlatu40;
  u_xlat8.y = unpack2x16float(x_494).x;
  let x_499 : u32 = u_xlatu0.x;
  u_xlat9.y = unpack2x16float(x_499).x;
  let x_504 : u32 = u_xlatu3.x;
  u_xlatu0.x = (x_504 >> 16u);
  let x_508 : u32 = u_xlatu3.x;
  u_xlat8.z = unpack2x16float(x_508).x;
  let x_513 : u32 = u_xlatu0.x;
  u_xlat9.z = unpack2x16float(x_513).x;
  let x_518 : u32 = u_xlatu2.x;
  u_xlatu0.x = (x_518 >> 16u);
  let x_522 : u32 = u_xlatu2.x;
  u_xlat8.w = unpack2x16float(x_522).x;
  let x_527 : u32 = u_xlatu0.x;
  u_xlat9.w = unpack2x16float(x_527).x;
  let x_531 : vec4<f32> = u_xlat7;
  let x_532 : vec4<f32> = u_xlat9;
  u_xlat3 = (x_531 + x_532);
  let x_534 : vec4<f32> = u_xlat3;
  u_xlat3 = (x_534 * vec4<f32>(0.21875f, 0.21875f, 0.21875f, 0.21875f));
  let x_538 : vec4<f32> = u_xlat6;
  let x_542 : vec4<f32> = u_xlat3;
  u_xlat3 = ((x_538 * vec4<f32>(0.2734375f, 0.2734375f, 0.2734375f, 0.2734375f)) + x_542);
  let x_545 : u32 = u_xlatu4.x;
  u_xlatu0.x = (x_545 >> 16u);
  let x_550 : u32 = u_xlatu0.x;
  u_xlat11.x = unpack2x16float(x_550).x;
  let x_556 : u32 = u_xlatu4.x;
  u_xlat10.x = unpack2x16float(x_556).x;
  let x_561 : u32 = u_xlatu4.z;
  u_xlat10.y = unpack2x16float(x_561).x;
  let x_566 : u32 = u_xlatu4.z;
  u_xlatu0.x = (x_566 >> 16u);
  let x_570 : u32 = u_xlatu0.x;
  u_xlat11.y = unpack2x16float(x_570).x;
  let x_574 : u32 = u_xlatu5;
  u_xlat10.z = unpack2x16float(x_574).x;
  let x_578 : u32 = u_xlatu5;
  u_xlatu0.x = (x_578 >> 16u);
  let x_582 : u32 = u_xlatu0.x;
  u_xlat11.z = unpack2x16float(x_582).x;
  let x_586 : u32 = u_xlatu28;
  u_xlat10.w = unpack2x16float(x_586).x;
  let x_590 : u32 = u_xlatu28;
  u_xlatu0.x = (x_590 >> 16u);
  let x_594 : u32 = u_xlatu0.x;
  u_xlat11.w = unpack2x16float(x_594).x;
  let x_599 : vec4<f32> = u_xlat8;
  let x_600 : vec4<f32> = u_xlat10;
  u_xlat12 = (x_599 + x_600);
  let x_602 : vec4<f32> = u_xlat6;
  let x_603 : vec4<f32> = u_xlat10;
  u_xlat6 = (x_602 + x_603);
  let x_605 : vec4<f32> = u_xlat6;
  u_xlat6 = (x_605 * vec4<f32>(0.21875f, 0.21875f, 0.21875f, 0.21875f));
  let x_607 : vec4<f32> = u_xlat7;
  let x_609 : vec4<f32> = u_xlat6;
  u_xlat6 = ((x_607 * vec4<f32>(0.2734375f, 0.2734375f, 0.2734375f, 0.2734375f)) + x_609);
  let x_611 : vec4<f32> = u_xlat12;
  let x_615 : vec4<f32> = u_xlat3;
  u_xlat3 = ((x_611 * vec4<f32>(0.109375f, 0.109375f, 0.109375f, 0.109375f)) + x_615);
  let x_618 : u32 = u_xlatu13.x;
  u_xlatu0.x = (x_618 >> 16u);
  let x_622 : u32 = u_xlatu0.x;
  u_xlat10.x = unpack2x16float(x_622).x;
  let x_627 : u32 = u_xlatu13.y;
  u_xlatu0.x = (x_627 >> 16u);
  let x_631 : u32 = u_xlatu0.x;
  u_xlat10.y = unpack2x16float(x_631).x;
  let x_636 : u32 = u_xlatu13.z;
  u_xlatu0.x = (x_636 >> 16u);
  let x_640 : u32 = u_xlatu13.x;
  u_xlat7.x = unpack2x16float(x_640).x;
  let x_645 : u32 = u_xlatu13.y;
  u_xlat7.y = unpack2x16float(x_645).x;
  let x_650 : u32 = u_xlatu13.z;
  u_xlat7.z = unpack2x16float(x_650).x;
  let x_655 : u32 = u_xlatu0.x;
  u_xlat10.z = unpack2x16float(x_655).x;
  let x_659 : u32 = u_xlatu14;
  u_xlatu0.x = (x_659 >> 16u);
  let x_662 : u32 = u_xlatu14;
  u_xlat7.w = unpack2x16float(x_662).x;
  let x_667 : u32 = u_xlatu0.x;
  u_xlat10.w = unpack2x16float(x_667).x;
  let x_671 : vec4<f32> = u_xlat11;
  let x_672 : vec4<f32> = u_xlat10;
  u_xlat0 = (x_671 + x_672);
  let x_674 : vec4<f32> = u_xlat9;
  let x_675 : vec4<f32> = u_xlat11;
  u_xlat9 = (x_674 + x_675);
  let x_677 : vec4<f32> = u_xlat9;
  let x_679 : vec4<f32> = u_xlat6;
  u_xlat6 = ((x_677 * vec4<f32>(0.109375f, 0.109375f, 0.109375f, 0.109375f)) + x_679);
  let x_681 : vec4<f32> = u_xlat0;
  let x_685 : vec4<f32> = u_xlat3;
  u_xlat0 = ((x_681 * vec4<f32>(0.03125f, 0.03125f, 0.03125f, 0.03125f)) + x_685);
  let x_688 : u32 = u_xlatu17.x;
  u_xlatu14 = (x_688 >> 16u);
  let x_690 : u32 = u_xlatu14;
  u_xlat9.x = unpack2x16float(x_690).x;
  let x_695 : u32 = u_xlatu17.x;
  u_xlat3.x = unpack2x16float(x_695).x;
  let x_700 : u32 = u_xlatu17.z;
  u_xlat3.y = unpack2x16float(x_700).x;
  let x_705 : u32 = u_xlatu17.z;
  u_xlatu14 = (x_705 >> 16u);
  let x_707 : u32 = u_xlatu14;
  u_xlat9.y = unpack2x16float(x_707).x;
  let x_711 : u32 = u_xlatu18;
  u_xlat3.z = unpack2x16float(x_711).x;
  let x_715 : u32 = u_xlatu18;
  u_xlatu14 = (x_715 >> 16u);
  let x_717 : u32 = u_xlatu14;
  u_xlat9.z = unpack2x16float(x_717).x;
  let x_721 : u32 = u_xlatu41;
  u_xlat3.w = unpack2x16float(x_721).x;
  let x_725 : u32 = u_xlatu41;
  u_xlatu14 = (x_725 >> 16u);
  let x_727 : u32 = u_xlatu14;
  u_xlat9.w = unpack2x16float(x_727).x;
  let x_731 : vec4<f32> = u_xlat9;
  let x_732 : vec4<f32> = u_xlat10;
  u_xlat2 = (x_731 + x_732);
  let x_735 : vec4<f32> = u_xlat3;
  let x_736 : vec4<f32> = u_xlat7;
  u_xlat4 = (x_735 + x_736);
  let x_738 : vec4<f32> = u_xlat3;
  let x_739 : vec4<f32> = u_xlat8;
  u_xlat3 = (x_738 + x_739);
  let x_741 : vec4<f32> = u_xlat3;
  let x_743 : vec4<f32> = u_xlat6;
  u_xlat3 = ((x_741 * vec4<f32>(0.03125f, 0.03125f, 0.03125f, 0.03125f)) + x_743);
  let x_745 : vec4<f32> = u_xlat2;
  let x_749 : vec4<f32> = u_xlat3;
  u_xlat2 = ((x_745 * vec4<f32>(0.00390625f, 0.00390625f, 0.00390625f, 0.00390625f)) + x_749);
  let x_751 : vec4<f32> = u_xlat4;
  let x_753 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_751 * vec4<f32>(0.00390625f, 0.00390625f, 0.00390625f, 0.00390625f)) + x_753);
  let x_756 : i32 = u_xlati1.x;
  let x_758 : f32 = u_xlat0.x;
  TGSM0[x_756].value[0i] = bitcast<u32>(x_758);
  let x_762 : i32 = u_xlati1.x;
  let x_764 : f32 = u_xlat0.y;
  TGSM1[x_762].value[0i] = bitcast<u32>(x_764);
  let x_768 : i32 = u_xlati1.x;
  let x_770 : f32 = u_xlat0.z;
  TGSM2[x_768].value[0i] = bitcast<u32>(x_770);
  let x_774 : i32 = u_xlati1.x;
  let x_776 : f32 = u_xlat0.w;
  TGSM3[x_774].value[0i] = bitcast<u32>(x_776);
  let x_780 : i32 = u_xlati1.x;
  u_xlati0.x = (x_780 + 1i);
  let x_784 : i32 = u_xlati0.x;
  let x_786 : f32 = u_xlat2.x;
  TGSM0[x_784].value[0i] = bitcast<u32>(x_786);
  let x_790 : i32 = u_xlati0.x;
  let x_792 : f32 = u_xlat2.y;
  TGSM1[x_790].value[0i] = bitcast<u32>(x_792);
  let x_796 : i32 = u_xlati0.x;
  let x_798 : f32 = u_xlat2.z;
  TGSM2[x_796].value[0i] = bitcast<u32>(x_798);
  let x_802 : i32 = u_xlati0.x;
  let x_804 : f32 = u_xlat2.w;
  TGSM3[x_802].value[0i] = bitcast<u32>(x_804);
  workgroupBarrier();
  let x_807 : vec2<i32> = u_xlati14;
  u_xlati0 = (vec4<i32>(x_807.y, x_807.y, x_807.y, x_807.y) + vec4<i32>(8i, 16i, 24i, 32i));
  let x_814 : i32 = u_xlati0.w;
  let x_816 : u32 = TGSM0[x_814].value[0i];
  u_xlat2.x = bitcast<f32>(x_816);
  let x_820 : i32 = u_xlati0.w;
  let x_822 : u32 = TGSM1[x_820].value[0i];
  u_xlat2.y = bitcast<f32>(x_822);
  let x_826 : i32 = u_xlati0.w;
  let x_828 : u32 = TGSM2[x_826].value[0i];
  u_xlat2.z = bitcast<f32>(x_828);
  let x_832 : i32 = u_xlati0.w;
  let x_834 : u32 = TGSM3[x_832].value[0i];
  u_xlat2.w = bitcast<f32>(x_834);
  let x_838 : vec2<i32> = u_xlati14;
  let x_844 : vec3<i32> = (vec3<i32>(x_838.y, x_838.y, x_838.y) + vec3<i32>(40i, 48i, 56i));
  let x_845 : vec4<i32> = u_xlati1;
  u_xlati1 = vec4<i32>(x_844.x, x_844.y, x_845.z, x_844.z);
  let x_848 : i32 = u_xlati1.x;
  let x_850 : u32 = TGSM0[x_848].value[0i];
  u_xlat3.x = bitcast<f32>(x_850);
  let x_854 : i32 = u_xlati1.x;
  let x_856 : u32 = TGSM1[x_854].value[0i];
  u_xlat3.y = bitcast<f32>(x_856);
  let x_860 : i32 = u_xlati1.x;
  let x_862 : u32 = TGSM2[x_860].value[0i];
  u_xlat3.z = bitcast<f32>(x_862);
  let x_866 : i32 = u_xlati1.x;
  let x_868 : u32 = TGSM3[x_866].value[0i];
  u_xlat3.w = bitcast<f32>(x_868);
  let x_872 : i32 = u_xlati0.z;
  let x_874 : u32 = TGSM0[x_872].value[0i];
  u_xlat4.x = bitcast<f32>(x_874);
  let x_878 : i32 = u_xlati0.z;
  let x_880 : u32 = TGSM1[x_878].value[0i];
  u_xlat4.y = bitcast<f32>(x_880);
  let x_884 : i32 = u_xlati0.z;
  let x_886 : u32 = TGSM2[x_884].value[0i];
  u_xlat4.z = bitcast<f32>(x_886);
  let x_890 : i32 = u_xlati0.z;
  let x_892 : u32 = TGSM3[x_890].value[0i];
  u_xlat4.w = bitcast<f32>(x_892);
  let x_895 : vec4<f32> = u_xlat3;
  let x_896 : vec4<f32> = u_xlat4;
  u_xlat3 = (x_895 + x_896);
  let x_898 : vec4<f32> = u_xlat3;
  u_xlat3 = (x_898 * vec4<f32>(0.21875f, 0.21875f, 0.21875f, 0.21875f));
  let x_900 : vec4<f32> = u_xlat2;
  let x_902 : vec4<f32> = u_xlat3;
  u_xlat2 = ((x_900 * vec4<f32>(0.2734375f, 0.2734375f, 0.2734375f, 0.2734375f)) + x_902);
  let x_905 : i32 = u_xlati0.y;
  let x_907 : u32 = TGSM0[x_905].value[0i];
  u_xlat3.x = bitcast<f32>(x_907);
  let x_911 : i32 = u_xlati0.y;
  let x_913 : u32 = TGSM1[x_911].value[0i];
  u_xlat3.y = bitcast<f32>(x_913);
  let x_917 : i32 = u_xlati0.y;
  let x_919 : u32 = TGSM2[x_917].value[0i];
  u_xlat3.z = bitcast<f32>(x_919);
  let x_923 : i32 = u_xlati0.y;
  let x_925 : u32 = TGSM3[x_923].value[0i];
  u_xlat3.w = bitcast<f32>(x_925);
  let x_929 : i32 = u_xlati1.y;
  let x_931 : u32 = TGSM0[x_929].value[0i];
  u_xlat4.x = bitcast<f32>(x_931);
  let x_935 : i32 = u_xlati1.y;
  let x_937 : u32 = TGSM1[x_935].value[0i];
  u_xlat4.y = bitcast<f32>(x_937);
  let x_941 : i32 = u_xlati1.y;
  let x_943 : u32 = TGSM2[x_941].value[0i];
  u_xlat4.z = bitcast<f32>(x_943);
  let x_947 : i32 = u_xlati1.y;
  let x_949 : u32 = TGSM3[x_947].value[0i];
  u_xlat4.w = bitcast<f32>(x_949);
  let x_952 : vec4<f32> = u_xlat3;
  let x_953 : vec4<f32> = u_xlat4;
  u_xlat3 = (x_952 + x_953);
  let x_955 : vec4<f32> = u_xlat3;
  let x_957 : vec4<f32> = u_xlat2;
  u_xlat2 = ((x_955 * vec4<f32>(0.109375f, 0.109375f, 0.109375f, 0.109375f)) + x_957);
  let x_960 : i32 = u_xlati0.x;
  let x_962 : u32 = TGSM0[x_960].value[0i];
  u_xlat3.x = bitcast<f32>(x_962);
  let x_966 : i32 = u_xlati0.x;
  let x_968 : u32 = TGSM1[x_966].value[0i];
  u_xlat3.y = bitcast<f32>(x_968);
  let x_972 : i32 = u_xlati0.x;
  let x_974 : u32 = TGSM2[x_972].value[0i];
  u_xlat3.z = bitcast<f32>(x_974);
  let x_978 : i32 = u_xlati0.x;
  let x_980 : u32 = TGSM3[x_978].value[0i];
  u_xlat3.w = bitcast<f32>(x_980);
  let x_984 : i32 = u_xlati1.w;
  let x_986 : u32 = TGSM0[x_984].value[0i];
  u_xlat0.x = bitcast<f32>(x_986);
  let x_990 : i32 = u_xlati1.w;
  let x_992 : u32 = TGSM1[x_990].value[0i];
  u_xlat0.y = bitcast<f32>(x_992);
  let x_996 : i32 = u_xlati1.w;
  let x_998 : u32 = TGSM2[x_996].value[0i];
  u_xlat0.z = bitcast<f32>(x_998);
  let x_1002 : i32 = u_xlati1.w;
  let x_1004 : u32 = TGSM3[x_1002].value[0i];
  u_xlat0.w = bitcast<f32>(x_1004);
  let x_1007 : vec4<f32> = u_xlat0;
  let x_1008 : vec4<f32> = u_xlat3;
  u_xlat0 = (x_1007 + x_1008);
  let x_1010 : vec4<f32> = u_xlat0;
  let x_1012 : vec4<f32> = u_xlat2;
  u_xlat0 = ((x_1010 * vec4<f32>(0.03125f, 0.03125f, 0.03125f, 0.03125f)) + x_1012);
  let x_1015 : i32 = u_xlati14.y;
  let x_1017 : u32 = TGSM0[x_1015].value[0i];
  u_xlat2.x = bitcast<f32>(x_1017);
  let x_1021 : i32 = u_xlati14.y;
  let x_1023 : u32 = TGSM1[x_1021].value[0i];
  u_xlat2.y = bitcast<f32>(x_1023);
  let x_1027 : i32 = u_xlati14.y;
  let x_1029 : u32 = TGSM2[x_1027].value[0i];
  u_xlat2.z = bitcast<f32>(x_1029);
  let x_1033 : i32 = u_xlati14.y;
  let x_1035 : u32 = TGSM3[x_1033].value[0i];
  u_xlat2.w = bitcast<f32>(x_1035);
  let x_1039 : i32 = u_xlati14.y;
  u_xlati1.x = (x_1039 + 64i);
  let x_1044 : i32 = u_xlati1.x;
  let x_1046 : u32 = TGSM0[x_1044].value[0i];
  u_xlat3.x = bitcast<f32>(x_1046);
  let x_1050 : i32 = u_xlati1.x;
  let x_1052 : u32 = TGSM1[x_1050].value[0i];
  u_xlat3.y = bitcast<f32>(x_1052);
  let x_1056 : i32 = u_xlati1.x;
  let x_1058 : u32 = TGSM2[x_1056].value[0i];
  u_xlat3.z = bitcast<f32>(x_1058);
  let x_1062 : i32 = u_xlati1.x;
  let x_1064 : u32 = TGSM3[x_1062].value[0i];
  u_xlat3.w = bitcast<f32>(x_1064);
  let x_1068 : vec4<f32> = u_xlat2;
  let x_1069 : vec4<f32> = u_xlat3;
  u_xlat1 = (x_1068 + x_1069);
  let x_1071 : vec4<f32> = u_xlat1;
  let x_1073 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_1071 * vec4<f32>(0.00390625f, 0.00390625f, 0.00390625f, 0.00390625f)) + x_1073);
  let x_1080 : vec3<u32> = gl_GlobalInvocationID;
  let x_1083 : vec4<f32> = u_xlat0;
  textureStore(x_Result_origX0X, bitcast<vec2<i32>>(vec2<u32>(x_1080.x, x_1080.y)), x_1083);
  return;
}

@compute @workgroup_size(8i, 8i, 1i)
fn main(@builtin(workgroup_id) gl_WorkGroupID_param : vec3<u32>, @builtin(local_invocation_id) gl_LocalInvocationID_param : vec3<u32>, @builtin(global_invocation_id) gl_GlobalInvocationID_param : vec3<u32>) {
  gl_WorkGroupID = gl_WorkGroupID_param;
  gl_LocalInvocationID = gl_LocalInvocationID_param;
  gl_GlobalInvocationID = gl_GlobalInvocationID_param;
  main_1();
}

