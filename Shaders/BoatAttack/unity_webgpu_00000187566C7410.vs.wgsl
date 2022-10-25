type Arr = array<vec4<f32>, 2u>;

struct UnityPerDraw {
  unity_ObjectToWorld : mat4x4<f32>,
  unity_WorldToObject : mat4x4<f32>,
  unity_LODFade : vec4<f32>,
  unity_WorldTransformParams : vec4<f32>,
  unity_RenderingLayer : vec4<f32>,
  unity_LightData : vec4<f32>,
  unity_LightIndices : Arr,
  unity_ProbesOcclusion : vec4<f32>,
  unity_SpecCube0_HDR : vec4<f32>,
  unity_SpecCube1_HDR : vec4<f32>,
  unity_SpecCube0_BoxMax : vec4<f32>,
  unity_SpecCube0_BoxMin : vec4<f32>,
  unity_SpecCube0_ProbePosition : vec4<f32>,
  unity_SpecCube1_BoxMax : vec4<f32>,
  unity_SpecCube1_BoxMin : vec4<f32>,
  unity_SpecCube1_ProbePosition : vec4<f32>,
  unity_LightmapST : vec4<f32>,
  unity_DynamicLightmapST : vec4<f32>,
  unity_SHAr : vec4<f32>,
  unity_SHAg : vec4<f32>,
  unity_SHAb : vec4<f32>,
  unity_SHBr : vec4<f32>,
  unity_SHBg : vec4<f32>,
  unity_SHBb : vec4<f32>,
  unity_SHC : vec4<f32>,
  unity_RendererBounds_Min : vec4<f32>,
  unity_RendererBounds_Max : vec4<f32>,
  unity_MatrixPreviousM : mat4x4<f32>,
  unity_MatrixPreviousMI : mat4x4<f32>,
  unity_MotionVectorsParams : vec4<f32>,
  unity_SpriteColor : vec4<f32>,
  unity_SpriteProps : vec4<f32>,
}

struct VGlobals {
  unity_MatrixVP : mat4x4<f32>,
}

var<private> in_POSITION0 : vec4<f32>;

@group(1) @binding(2) var<uniform> x_20 : UnityPerDraw;

@group(1) @binding(1) var<uniform> x_53 : VGlobals;

var<private> vs_TEXCOORD0 : vec4<f32>;

var<private> in_TEXCOORD0 : vec4<f32>;

var<private> vs_TEXCOORD1 : vec4<f32>;

var<private> in_TEXCOORD1 : vec4<f32>;

var<private> vs_TEXCOORD2 : vec4<f32>;

var<private> in_TEXCOORD2 : vec4<f32>;

var<private> vs_TEXCOORD3 : vec4<f32>;

var<private> in_TEXCOORD3 : vec4<f32>;

var<private> vs_COLOR0 : vec4<f32>;

var<private> in_COLOR0 : vec4<f32>;

var<private> vs_NORMAL0 : vec4<f32>;

var<private> in_NORMAL0 : vec4<f32>;

var<private> vs_TANGENT0 : vec4<f32>;

var<private> in_TANGENT0 : vec4<f32>;

var<private> gl_Position : vec4<f32>;

fn main_1() {
  var u_xlat0 : vec4<f32>;
  var u_xlat1 : vec4<f32>;
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_12 : vec4<f32> = in_POSITION0;
  let x_26 : vec4<f32> = x_20.unity_ObjectToWorld[1i];
  u_xlat0 = (vec4<f32>(x_12.y, x_12.y, x_12.y, x_12.y) * x_26);
  let x_29 : vec4<f32> = x_20.unity_ObjectToWorld[0i];
  let x_30 : vec4<f32> = in_POSITION0;
  let x_33 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_29 * vec4<f32>(x_30.x, x_30.x, x_30.x, x_30.x)) + x_33);
  let x_37 : vec4<f32> = x_20.unity_ObjectToWorld[2i];
  let x_38 : vec4<f32> = in_POSITION0;
  let x_41 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_37 * vec4<f32>(x_38.z, x_38.z, x_38.z, x_38.z)) + x_41);
  let x_43 : vec4<f32> = u_xlat0;
  let x_46 : vec4<f32> = x_20.unity_ObjectToWorld[3i];
  u_xlat0 = (x_43 + x_46);
  let x_49 : vec4<f32> = u_xlat0;
  let x_55 : vec4<f32> = x_53.unity_MatrixVP[1i];
  u_xlat1 = (vec4<f32>(x_49.y, x_49.y, x_49.y, x_49.y) * x_55);
  let x_58 : vec4<f32> = x_53.unity_MatrixVP[0i];
  let x_59 : vec4<f32> = u_xlat0;
  let x_62 : vec4<f32> = u_xlat1;
  u_xlat1 = ((x_58 * vec4<f32>(x_59.x, x_59.x, x_59.x, x_59.x)) + x_62);
  let x_65 : vec4<f32> = x_53.unity_MatrixVP[2i];
  let x_66 : vec4<f32> = u_xlat0;
  let x_69 : vec4<f32> = u_xlat1;
  u_xlat1 = ((x_65 * vec4<f32>(x_66.z, x_66.z, x_66.z, x_66.z)) + x_69);
  let x_77 : vec4<f32> = x_53.unity_MatrixVP[3i];
  let x_78 : vec4<f32> = u_xlat0;
  let x_81 : vec4<f32> = u_xlat1;
  gl_Position = ((x_77 * vec4<f32>(x_78.w, x_78.w, x_78.w, x_78.w)) + x_81);
  let x_87 : vec4<f32> = in_TEXCOORD0;
  vs_TEXCOORD0 = x_87;
  let x_90 : vec4<f32> = in_TEXCOORD1;
  vs_TEXCOORD1 = x_90;
  let x_93 : vec4<f32> = in_TEXCOORD2;
  vs_TEXCOORD2 = x_93;
  let x_96 : vec4<f32> = in_TEXCOORD3;
  vs_TEXCOORD3 = x_96;
  let x_99 : vec4<f32> = in_COLOR0;
  vs_COLOR0 = x_99;
  let x_102 : vec4<f32> = in_NORMAL0;
  vs_NORMAL0 = x_102;
  let x_105 : vec4<f32> = in_TANGENT0;
  vs_TANGENT0 = x_105;
  return;
}

struct main_out {
  @builtin(position)
  gl_Position : vec4<f32>,
  @location(0)
  vs_TEXCOORD0_1 : vec4<f32>,
  @location(1)
  vs_TEXCOORD1_1 : vec4<f32>,
  @location(2)
  vs_TEXCOORD2_1 : vec4<f32>,
  @location(3)
  vs_TEXCOORD3_1 : vec4<f32>,
  @location(4)
  vs_COLOR0_1 : vec4<f32>,
  @location(5)
  vs_NORMAL0_1 : vec4<f32>,
  @location(6)
  vs_TANGENT0_1 : vec4<f32>,
}

@vertex
fn main(@location(0) in_POSITION0_param : vec4<f32>, @location(1) in_TEXCOORD0_param : vec4<f32>, @location(2) in_TEXCOORD1_param : vec4<f32>, @location(3) in_TEXCOORD2_param : vec4<f32>, @location(4) in_TEXCOORD3_param : vec4<f32>, @location(5) in_COLOR0_param : vec4<f32>, @location(6) in_NORMAL0_param : vec4<f32>, @location(7) in_TANGENT0_param : vec4<f32>) -> main_out {
  in_POSITION0 = in_POSITION0_param;
  in_TEXCOORD0 = in_TEXCOORD0_param;
  in_TEXCOORD1 = in_TEXCOORD1_param;
  in_TEXCOORD2 = in_TEXCOORD2_param;
  in_TEXCOORD3 = in_TEXCOORD3_param;
  in_COLOR0 = in_COLOR0_param;
  in_NORMAL0 = in_NORMAL0_param;
  in_TANGENT0 = in_TANGENT0_param;
  main_1();
  return main_out(gl_Position, vs_TEXCOORD0, vs_TEXCOORD1, vs_TEXCOORD2, vs_TEXCOORD3, vs_COLOR0, vs_NORMAL0, vs_TANGENT0);
}

