struct VGlobals {
  x_WorldSpaceCameraPos : vec3<f32>,
  @size(4)
  padding : u32,
  unity_ObjectToWorld : mat4x4<f32>,
  unity_WorldToObject : mat4x4<f32>,
  unity_WorldTransformParams : vec4<f32>,
  unity_MatrixVP : mat4x4<f32>,
  x_MainTex_ST : vec4<f32>,
  x_DetailAlbedoMap_ST : vec4<f32>,
  x_UVSec : f32,
}

var<private> u_xlat0 : vec4<f32>;

var<private> in_POSITION0 : vec4<f32>;

@group(0) @binding(11) var<uniform> x_18 : VGlobals;

var<private> u_xlat1 : vec4<f32>;

var<private> u_xlatb0 : bool;

var<private> in_TEXCOORD0 : vec2<f32>;

var<private> in_TEXCOORD1 : vec2<f32>;

var<private> vs_TEXCOORD0 : vec4<f32>;

var<private> vs_TEXCOORD1 : vec3<f32>;

var<private> vs_TEXCOORD2 : vec4<f32>;

var<private> in_TANGENT0 : vec4<f32>;

var<private> u_xlat2 : vec3<f32>;

var<private> in_NORMAL0 : vec3<f32>;

var<private> u_xlat3 : vec3<f32>;

var<private> vs_TEXCOORD4 : vec4<f32>;

var<private> vs_TEXCOORD3 : vec4<f32>;

var<private> vs_TEXCOORD5 : vec4<f32>;

var<private> gl_Position : vec4<f32>;

fn main_1() {
  var x_94 : vec2<f32>;
  var u_xlat_precise_vec4 : vec4<f32>;
  var u_xlat_precise_ivec4 : vec4<i32>;
  var u_xlat_precise_bvec4 : vec4<bool>;
  var u_xlat_precise_uvec4 : vec4<u32>;
  let x_12 : vec4<f32> = in_POSITION0;
  let x_23 : vec4<f32> = x_18.unity_ObjectToWorld[1i];
  u_xlat0 = (vec4<f32>(x_12.y, x_12.y, x_12.y, x_12.y) * x_23);
  let x_27 : vec4<f32> = x_18.unity_ObjectToWorld[0i];
  let x_28 : vec4<f32> = in_POSITION0;
  let x_31 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_27 * vec4<f32>(x_28.x, x_28.x, x_28.x, x_28.x)) + x_31);
  let x_35 : vec4<f32> = x_18.unity_ObjectToWorld[2i];
  let x_36 : vec4<f32> = in_POSITION0;
  let x_39 : vec4<f32> = u_xlat0;
  u_xlat0 = ((x_35 * vec4<f32>(x_36.z, x_36.z, x_36.z, x_36.z)) + x_39);
  let x_41 : vec4<f32> = u_xlat0;
  let x_44 : vec4<f32> = x_18.unity_ObjectToWorld[3i];
  u_xlat0 = (x_41 + x_44);
  let x_47 : vec4<f32> = u_xlat0;
  let x_51 : vec4<f32> = x_18.unity_MatrixVP[1i];
  u_xlat1 = (vec4<f32>(x_47.y, x_47.y, x_47.y, x_47.y) * x_51);
  let x_54 : vec4<f32> = x_18.unity_MatrixVP[0i];
  let x_55 : vec4<f32> = u_xlat0;
  let x_58 : vec4<f32> = u_xlat1;
  u_xlat1 = ((x_54 * vec4<f32>(x_55.x, x_55.x, x_55.x, x_55.x)) + x_58);
  let x_61 : vec4<f32> = x_18.unity_MatrixVP[2i];
  let x_62 : vec4<f32> = u_xlat0;
  let x_65 : vec4<f32> = u_xlat1;
  u_xlat1 = ((x_61 * vec4<f32>(x_62.z, x_62.z, x_62.z, x_62.z)) + x_65);
  let x_74 : vec4<f32> = x_18.unity_MatrixVP[3i];
  let x_75 : vec4<f32> = u_xlat0;
  let x_78 : vec4<f32> = u_xlat1;
  gl_Position = ((x_74 * vec4<f32>(x_75.w, x_75.w, x_75.w, x_75.w)) + x_78);
  let x_88 : f32 = x_18.x_UVSec;
  u_xlatb0 = (x_88 == 0.0f);
  let x_91 : bool = u_xlatb0;
  if (x_91) {
    let x_99 : vec2<f32> = in_TEXCOORD0;
    x_94 = x_99;
  } else {
    let x_102 : vec2<f32> = in_TEXCOORD1;
    x_94 = x_102;
  }
  let x_103 : vec2<f32> = x_94;
  let x_104 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_103.x, x_103.y, x_104.z, x_104.w);
  let x_107 : vec4<f32> = u_xlat0;
  let x_111 : vec4<f32> = x_18.x_DetailAlbedoMap_ST;
  let x_115 : vec4<f32> = x_18.x_DetailAlbedoMap_ST;
  let x_117 : vec2<f32> = ((vec2<f32>(x_107.x, x_107.y) * vec2<f32>(x_111.x, x_111.y)) + vec2<f32>(x_115.z, x_115.w));
  let x_118 : vec4<f32> = vs_TEXCOORD0;
  vs_TEXCOORD0 = vec4<f32>(x_118.x, x_118.y, x_117.x, x_117.y);
  let x_120 : vec2<f32> = in_TEXCOORD0;
  let x_123 : vec4<f32> = x_18.x_MainTex_ST;
  let x_127 : vec4<f32> = x_18.x_MainTex_ST;
  let x_129 : vec2<f32> = ((x_120 * vec2<f32>(x_123.x, x_123.y)) + vec2<f32>(x_127.z, x_127.w));
  let x_130 : vec4<f32> = vs_TEXCOORD0;
  vs_TEXCOORD0 = vec4<f32>(x_129.x, x_129.y, x_130.z, x_130.w);
  let x_132 : vec4<f32> = in_POSITION0;
  let x_135 : vec4<f32> = x_18.unity_ObjectToWorld[1i];
  let x_137 : vec3<f32> = (vec3<f32>(x_132.y, x_132.y, x_132.y) * vec3<f32>(x_135.x, x_135.y, x_135.z));
  let x_138 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_137.x, x_137.y, x_137.z, x_138.w);
  let x_141 : vec4<f32> = x_18.unity_ObjectToWorld[0i];
  let x_143 : vec4<f32> = in_POSITION0;
  let x_146 : vec4<f32> = u_xlat0;
  let x_148 : vec3<f32> = ((vec3<f32>(x_141.x, x_141.y, x_141.z) * vec3<f32>(x_143.x, x_143.x, x_143.x)) + vec3<f32>(x_146.x, x_146.y, x_146.z));
  let x_149 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_148.x, x_148.y, x_148.z, x_149.w);
  let x_152 : vec4<f32> = x_18.unity_ObjectToWorld[2i];
  let x_154 : vec4<f32> = in_POSITION0;
  let x_157 : vec4<f32> = u_xlat0;
  let x_159 : vec3<f32> = ((vec3<f32>(x_152.x, x_152.y, x_152.z) * vec3<f32>(x_154.z, x_154.z, x_154.z)) + vec3<f32>(x_157.x, x_157.y, x_157.z));
  let x_160 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_159.x, x_159.y, x_159.z, x_160.w);
  let x_163 : vec4<f32> = x_18.unity_ObjectToWorld[3i];
  let x_165 : vec4<f32> = in_POSITION0;
  let x_168 : vec4<f32> = u_xlat0;
  let x_170 : vec3<f32> = ((vec3<f32>(x_163.x, x_163.y, x_163.z) * vec3<f32>(x_165.w, x_165.w, x_165.w)) + vec3<f32>(x_168.x, x_168.y, x_168.z));
  let x_171 : vec4<f32> = u_xlat0;
  u_xlat0 = vec4<f32>(x_170.x, x_170.y, x_170.z, x_171.w);
  let x_175 : vec4<f32> = u_xlat0;
  let x_179 : vec3<f32> = x_18.x_WorldSpaceCameraPos;
  vs_TEXCOORD1 = (vec3<f32>(x_175.x, x_175.y, x_175.z) + -(x_179));
  let x_186 : f32 = u_xlat0.x;
  vs_TEXCOORD2.w = x_186;
  let x_191 : vec4<f32> = in_TANGENT0;
  let x_194 : vec4<f32> = x_18.unity_ObjectToWorld[1i];
  let x_196 : vec3<f32> = (vec3<f32>(x_191.y, x_191.y, x_191.y) * vec3<f32>(x_194.x, x_194.y, x_194.z));
  let x_197 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_196.x, x_196.y, x_196.z, x_197.w);
  let x_200 : vec4<f32> = x_18.unity_ObjectToWorld[0i];
  let x_202 : vec4<f32> = in_TANGENT0;
  let x_205 : vec4<f32> = u_xlat1;
  let x_207 : vec3<f32> = ((vec3<f32>(x_200.x, x_200.y, x_200.z) * vec3<f32>(x_202.x, x_202.x, x_202.x)) + vec3<f32>(x_205.x, x_205.y, x_205.z));
  let x_208 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_207.x, x_207.y, x_207.z, x_208.w);
  let x_211 : vec4<f32> = x_18.unity_ObjectToWorld[2i];
  let x_213 : vec4<f32> = in_TANGENT0;
  let x_216 : vec4<f32> = u_xlat1;
  let x_218 : vec3<f32> = ((vec3<f32>(x_211.x, x_211.y, x_211.z) * vec3<f32>(x_213.z, x_213.z, x_213.z)) + vec3<f32>(x_216.x, x_216.y, x_216.z));
  let x_219 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_218.x, x_218.y, x_218.z, x_219.w);
  let x_221 : vec4<f32> = u_xlat1;
  let x_223 : vec4<f32> = u_xlat1;
  u_xlat0.x = dot(vec3<f32>(x_221.x, x_221.y, x_221.z), vec3<f32>(x_223.x, x_223.y, x_223.z));
  let x_228 : f32 = u_xlat0.x;
  u_xlat0.x = inverseSqrt(x_228);
  let x_231 : vec4<f32> = u_xlat0;
  let x_233 : vec4<f32> = u_xlat1;
  let x_235 : vec3<f32> = (vec3<f32>(x_231.x, x_231.x, x_231.x) * vec3<f32>(x_233.x, x_233.y, x_233.z));
  let x_236 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_235.x, x_235.y, x_235.z, x_236.w);
  let x_238 : vec4<f32> = u_xlat1;
  let x_239 : vec3<f32> = vec3<f32>(x_238.x, x_238.y, x_238.z);
  let x_240 : vec4<f32> = vs_TEXCOORD2;
  vs_TEXCOORD2 = vec4<f32>(x_239.x, x_239.y, x_239.z, x_240.w);
  let x_245 : vec3<f32> = in_NORMAL0;
  let x_247 : vec4<f32> = x_18.unity_WorldToObject[0i];
  u_xlat2.x = dot(x_245, vec3<f32>(x_247.x, x_247.y, x_247.z));
  let x_251 : vec3<f32> = in_NORMAL0;
  let x_253 : vec4<f32> = x_18.unity_WorldToObject[1i];
  u_xlat2.y = dot(x_251, vec3<f32>(x_253.x, x_253.y, x_253.z));
  let x_257 : vec3<f32> = in_NORMAL0;
  let x_259 : vec4<f32> = x_18.unity_WorldToObject[2i];
  u_xlat2.z = dot(x_257, vec3<f32>(x_259.x, x_259.y, x_259.z));
  let x_264 : vec3<f32> = u_xlat2;
  let x_265 : vec3<f32> = u_xlat2;
  u_xlat0.x = dot(x_264, x_265);
  let x_269 : f32 = u_xlat0.x;
  u_xlat0.x = inverseSqrt(x_269);
  let x_272 : vec4<f32> = u_xlat0;
  let x_274 : vec3<f32> = u_xlat2;
  u_xlat2 = (vec3<f32>(x_272.x, x_272.x, x_272.x) * x_274);
  let x_277 : vec4<f32> = u_xlat1;
  let x_279 : vec3<f32> = u_xlat2;
  u_xlat3 = (vec3<f32>(x_277.y, x_277.z, x_277.x) * vec3<f32>(x_279.z, x_279.x, x_279.y));
  let x_282 : vec3<f32> = u_xlat2;
  let x_284 : vec4<f32> = u_xlat1;
  let x_287 : vec3<f32> = u_xlat3;
  let x_289 : vec3<f32> = ((vec3<f32>(x_282.y, x_282.z, x_282.x) * vec3<f32>(x_284.z, x_284.x, x_284.y)) + -(x_287));
  let x_290 : vec4<f32> = u_xlat1;
  u_xlat1 = vec4<f32>(x_289.x, x_289.y, x_289.z, x_290.w);
  let x_293 : vec3<f32> = u_xlat2;
  let x_294 : vec4<f32> = vs_TEXCOORD4;
  vs_TEXCOORD4 = vec4<f32>(x_293.x, x_293.y, x_293.z, x_294.w);
  let x_298 : f32 = in_TANGENT0.w;
  let x_300 : f32 = x_18.unity_WorldTransformParams.w;
  u_xlat0.x = (x_298 * x_300);
  let x_304 : vec4<f32> = u_xlat0;
  let x_306 : vec4<f32> = u_xlat1;
  let x_308 : vec3<f32> = (vec3<f32>(x_304.x, x_304.x, x_304.x) * vec3<f32>(x_306.x, x_306.y, x_306.z));
  let x_309 : vec4<f32> = vs_TEXCOORD3;
  vs_TEXCOORD3 = vec4<f32>(x_308.x, x_308.y, x_308.z, x_309.w);
  let x_312 : f32 = u_xlat0.y;
  vs_TEXCOORD3.w = x_312;
  let x_315 : f32 = u_xlat0.z;
  vs_TEXCOORD4.w = x_315;
  vs_TEXCOORD5 = vec4<f32>(0.0f, 0.0f, 0.0f, 0.0f);
  return;
}

struct main_out {
  @builtin(position)
  gl_Position : vec4<f32>,
  @location(0)
  vs_TEXCOORD0_1 : vec4<f32>,
  @location(1)
  vs_TEXCOORD2_1 : vec4<f32>,
  @location(3)
  vs_TEXCOORD4_1 : vec4<f32>,
  @location(2)
  vs_TEXCOORD3_1 : vec4<f32>,
}

@vertex
fn main(@location(0) in_POSITION0_param : vec4<f32>, @location(2) in_TEXCOORD0_param : vec2<f32>, @location(3) in_TEXCOORD1_param : vec2<f32>, @location(4) in_TANGENT0_param : vec4<f32>, @location(1) in_NORMAL0_param : vec3<f32>) -> main_out {
  in_POSITION0 = in_POSITION0_param;
  in_TEXCOORD0 = in_TEXCOORD0_param;
  in_TEXCOORD1 = in_TEXCOORD1_param;
  in_TANGENT0 = in_TANGENT0_param;
  in_NORMAL0 = in_NORMAL0_param;
  main_1();
  return main_out(gl_Position, vs_TEXCOORD0, vs_TEXCOORD2, vs_TEXCOORD4, vs_TEXCOORD3);
}

