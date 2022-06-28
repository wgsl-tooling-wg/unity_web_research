## Unity WGSL testing shader source code

The shaders in this repository have been extracted at various points of the compilation process for the WebGPU Shading Language. They are intended for shader compilation research only.

Shaders are compiled to multiple variants, so there may be multiple shaders that are similar.
The filename is a unique identifier for the shader. Each shader goes through multiple stages of
compilation:

**.hlsl**: The original code for the shader.
**.glsl**: HLSL shader code is tranlsated to GLSL.
**.spv**: GLSL shader code is translated to SPIR-V.
**.wgsl**: SPIR-V is translated to WGSL using the Tint library.
**.wgsl_error**: If there was an error translating SPIR-V into WGSL, this the error message generated by Tint.

License: MIT (see LICENSE.md)

Unless expressly provided otherwise, the software under this
license is made available strictly on an "AS IS" BASIS WITHOUT
WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. Please review the
license for details on these and other terms and conditions.
