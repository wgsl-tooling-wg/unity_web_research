struct VGlobals {
  unity_SHBr : vec4<f32>,
  unity_SHBg : vec4<f32>,
  unity_SHBb : vec4<f32>,
  unity_SHC : vec4<f32>,
  unity_ObjectToWorld : mat4x4<f32>,
  unity_WorldToObject : mat4x4<f32>,
  unity_MatrixVP : mat4x4<f32>,
  x_MainTex_ST : vec4<f32>,
}

var<private> u_xlat0 : vec4<f32>;

var<private> in_POSITION0 : vec4<f32>;

@group(0) @binding(5) var<uniform> x_17 : VGlobals;

var<private> u_xlat1 : vec4<f32>;

var<private> vs_TEXCOORD2 : vec3<f32>;

var<private> vs_TEXCOORD0 : vec2<f32>;

var<private> in_TEXCOORD0 : vec4<f32>;

var<private> in_NORMAL0 : vec3<f32>;

var<private> u_xlat6 : f32;

var<private> vs_TEXCOORD1 : vec3<f32>;

var<private> vs_COLOR0 : vec4<f32>;

var<private> in_COLOR0 : vec4<f32>;

var<private> vs_TEXCOORD4 : vec4<f32>;

var<private> vs_TEXCOORD5 : vec3<f32>;

var<private> gl_Position : vec4<f32>;

fn main_1() {
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_12 : vec4<f32> = in_POSITION0;
  let x_23 : vec4<f32> = x_17.unity_ObjectToWorld[1i];
  u_xlat0 = (vec4<f32>(x_12.y, x_12.y, x_12.y, x_12.y) * x_23);
  let x_27 : vec4<f32> = x_17.unity_ObjectToWorld[0i];
  let x_28 : vec4<f32> = in_POSITION0;
  let x_31 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_27 * vec4<f32>(x_28.x, x_28.x, x_28.x, x_28.x)) + x_31);
  let x_35 : vec4<f32> = x_17.unity_ObjectToWorld[2i];
  let x_36 : vec4<f32> = in_POSITION0;
  let x_39 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_35 * vec4<f32>(x_36.z, x_36.z, x_36.z, x_36.z)) + x_39);
  let x_42 : vec4<f32> = u_xlat0;
  let x_45 : vec4<f32> = x_17.unity_ObjectToWorld[3i];
  u_xlat1 = (x_42 + x_45);
  let x_51 : vec4<f32> = x_17.unity_ObjectToWorld[3i];
  let x_53 : vec4<f32> = in_POSITION0;
  let x_56 : vec4<f32> = u_xlat0;
  vs_TEXCOORD2 = ((vec3<f32>(x_51.x, x_51.y, x_51.z) * vec3<f32>(x_53.w, x_53.w, x_53.w)) + vec3<f32>(x_56.x, x_56.y, x_56.z));
  let x_59 : vec4<f32> = u_xlat1;
  let x_63 : vec4<f32> = x_17.unity_MatrixVP[1i];
  u_xlat0 = (vec4<f32>(x_59.y, x_59.y, x_59.y, x_59.y) * x_63);
  let x_66 : vec4<f32> = x_17.unity_MatrixVP[0i];
  let x_67 : vec4<f32> = u_xlat1;
  let x_70 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_66 * vec4<f32>(x_67.x, x_67.x, x_67.x, x_67.x)) + x_70);
  let x_73 : vec4<f32> = x_17.unity_MatrixVP[2i];
  let x_74 : vec4<f32> = u_xlat1;
  let x_77 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_73 * vec4<f32>(x_74.z, x_74.z, x_74.z, x_74.z)) + x_77);
  let x_86 : vec4<f32> = x_17.unity_MatrixVP[3i];
  let x_87 : vec4<f32> = u_xlat1;
  let x_90 : vec4<f32> = u_xlat0;
  gl_Position = ((x_86 * vec4<f32>(x_87.w, x_87.w, x_87.w, x_87.w)) + x_90);
  let x_98 : vec4<f32> = in_TEXCOORD0;
  let x_102 : vec4<f32> = x_17.x_MainTex_ST;
  let x_106 : vec4<f32> = x_17.x_MainTex_ST;
  vs_TEXCOORD0 = ((vec2<f32>(x_98.x, x_98.y) * vec2<f32>(x_102.x, x_102.y)) + vec2<f32>(x_106.z, x_106.w));
  let x_111 : vec3<f32> = in_NORMAL0;
  let x_114 : vec4<f32> = x_17.unity_WorldToObject[0i];
  u_xlat0.x = dot(x_111, vec3<f32>(x_114.x, x_114.y, x_114.z));
  let x_120 : vec3<f32> = in_NORMAL0;
  let x_122 : vec4<f32> = x_17.unity_WorldToObject[1i];
  u_xlat0.y = dot(x_120, vec3<f32>(x_122.x, x_122.y, x_122.z));
  let x_126 : vec3<f32> = in_NORMAL0;
  let x_128 : vec4<f32> = x_17.unity_WorldToObject[2i];
  u_xlat0.z = dot(x_126, vec3<f32>(x_128.x, x_128.y, x_128.z));
  let x_134 : vec4<f32> = u_xlat0;
  let x_136 : vec4<f32> = u_xlat0;
  u_xlat6 = dot(vec3<f32>(x_134.x, x_134.y, x_134.z), vec3<f32>(x_136.x, x_136.y, x_136.z));
  let x_139 : f32 = u_xlat6;
  u_xlat6 = inverseSqrt(x_139);
  let x_141 : f32 = u_xlat6;
  let x_143 : vec4<f32> = u_xlat0;
  let x_145 : vec3<f32> = (vec3<f32>(x_141, x_141, x_141) * vec3<f32>(x_143.x, x_143.y, x_143.z));
  let x_146 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_145.x, x_145.y, x_145.z, x_146.w);
  let x_149 : vec4<f32> = u_xlat0;
  vs_TEXCOORD1 = vec3<f32>(x_149.x, x_149.y, x_149.z);
  let x_153 : vec4<f32> = in_COLOR0;
  vs_COLOR0 = x_153;
  vs_TEXCOORD4 = vec4<f32>(0.0f, 0.0f, 0.0f, 0.0f);
  let x_158 : f32 = u_xlat0.y;
  let x_160 : f32 = u_xlat0.y;
  u_xlat6 = (x_158 * x_160);
  let x_163 : f32 = u_xlat0.x;
  let x_165 : f32 = u_xlat0.x;
  let x_167 : f32 = u_xlat6;
  u_xlat6 = ((x_163 * x_165) + -(x_167));
  let x_170 : vec4<f32> = u_xlat0;
  let x_172 : vec4<f32> = u_xlat0;
  u_xlat1 = (vec4<f32>(x_170.y, x_170.z, x_170.z, x_170.x) * vec4<f32>(x_172.x, x_172.y, x_172.z, x_172.z));
  let x_176 : vec4<f32> = x_17.unity_SHBr;
  let x_177 : vec4<f32> = u_xlat1;
  u_xlat0.x = dot(x_176, x_177);
  let x_181 : vec4<f32> = x_17.unity_SHBg;
  let x_182 : vec4<f32> = u_xlat1;
  u_xlat0.y = dot(x_181, x_182);
  let x_186 : vec4<f32> = x_17.unity_SHBb;
  let x_187 : vec4<f32> = u_xlat1;
  u_xlat0.z = dot(x_186, x_187);
  let x_192 : vec4<f32> = x_17.unity_SHC;
  let x_194 : f32 = u_xlat6;
  let x_197 : vec4<f32> = u_xlat0;
  vs_TEXCOORD5 = ((vec3<f32>(x_192.x, x_192.y, x_192.z) * vec3<f32>(x_194, x_194, x_194)) + vec3<f32>(x_197.x, x_197.y, x_197.z));
  return;
}

struct main_out {
  @location(2)
  vs_TEXCOORD2_1 : vec3<f32>,
  @builtin(position)
  gl_Position : vec4<f32>,
  @location(0)
  vs_TEXCOORD0_1 : vec2<f32>,
  @location(1)
  vs_TEXCOORD1_1 : vec3<f32>,
  @location(3)
  vs_COLOR0_1 : vec4<f32>,
  @location(4)
  vs_TEXCOORD5_1 : vec3<f32>,
}

@vertex
fn main(@location(0) in_POSITION0_param : vec4<f32>, @location(2) in_TEXCOORD0_param : vec4<f32>, @location(1) in_NORMAL0_param : vec3<f32>, @location(3) in_COLOR0_param : vec4<f32>) -> main_out {
  in_POSITION0 = in_POSITION0_param;
  in_TEXCOORD0 = in_TEXCOORD0_param;
  in_NORMAL0 = in_NORMAL0_param;
  in_COLOR0 = in_COLOR0_param;
  main_1();
  return main_out(vs_TEXCOORD2, gl_Position, vs_TEXCOORD0, vs_TEXCOORD1, vs_COLOR0, vs_TEXCOORD5);
}

