#line 63 "F:/src/Graphics/com.unity.postprocessing/PostProcessing/Shaders/StdLib.hlsl"
float rcp ( float value )
{
return 1.0 / value ;
}
#line 74
float Min3 ( float a , float b , float c )
{
return min ( min ( a , b ) , c ) ;
}

float2 Min3 ( float2 a , float2 b , float2 c )
{
return min ( min ( a , b ) , c ) ;
}

float3 Min3 ( float3 a , float3 b , float3 c )
{
return min ( min ( a , b ) , c ) ;
}

float4 Min3 ( float4 a , float4 b , float4 c )
{
return min ( min ( a , b ) , c ) ;
}

float Max3 ( float a , float b , float c )
{
return max ( max ( a , b ) , c ) ;
}

float2 Max3 ( float2 a , float2 b , float2 c )
{
return max ( max ( a , b ) , c ) ;
}

float3 Max3 ( float3 a , float3 b , float3 c )
{
return max ( max ( a , b ) , c ) ;
}

float4 Max3 ( float4 a , float4 b , float4 c )
{
return max ( max ( a , b ) , c ) ;
}
#line 117
float FastSign ( float x )
{
return saturate ( x * 3.402823466e+38 + 0.5 ) * 2.0 - 1.0 ;
}

float2 FastSign ( float2 x )
{
return saturate ( x * 3.402823466e+38 + 0.5 ) * 2.0 - 1.0 ;
}

float3 FastSign ( float3 x )
{
return saturate ( x * 3.402823466e+38 + 0.5 ) * 2.0 - 1.0 ;
}

float4 FastSign ( float4 x )
{
return saturate ( x * 3.402823466e+38 + 0.5 ) * 2.0 - 1.0 ;
}
#line 140
float PositivePow ( float base , float power )
{
return pow ( max ( abs ( base ) , float ( 1.192092896e-07 ) ) , power ) ;
}

float2 PositivePow ( float2 base , float2 power )
{
return pow ( max ( abs ( base ) , float2 ( 1.192092896e-07 , 1.192092896e-07 ) ) , power ) ;
}

float3 PositivePow ( float3 base , float3 power )
{
return pow ( max ( abs ( base ) , float3 ( 1.192092896e-07 , 1.192092896e-07 , 1.192092896e-07 ) ) , power ) ;
}

float4 PositivePow ( float4 base , float4 power )
{
return pow ( max ( abs ( base ) , float4 ( 1.192092896e-07 , 1.192092896e-07 , 1.192092896e-07 , 1.192092896e-07 ) ) , power ) ;
}
#line 162
bool IsNan ( float x )
{
#line 167
return ( x < 0.0 || x > 0.0 || x == 0.0 ) ? false : true ;
}

bool AnyIsNan ( float2 x )
{
return IsNan ( x . x ) || IsNan ( x . y ) ;
}

bool AnyIsNan ( float3 x )
{
return IsNan ( x . x ) || IsNan ( x . y ) || IsNan ( x . z ) ;
}

bool AnyIsNan ( float4 x )
{
return IsNan ( x . x ) || IsNan ( x . y ) || IsNan ( x . z ) || IsNan ( x . w ) ;
}
#line 188
float4x4 unity_CameraProjection ;
float4x4 unity_MatrixVP ;
float4x4 unity_ObjectToWorld ;
float4x4 unity_WorldToCamera ;
float3 _WorldSpaceCameraPos ;
float4 _ProjectionParams ;
float4 unity_ColorSpaceLuminance ;
float4 unity_DeltaTime ;
float4 unity_OrthoParams ;
float4 _ZBufferParams ;
float4 _ScreenParams ;
float4 _Time ;
float4 _SinTime ;
float4 _CosTime ;
#line 208
float Linear01Depth ( float z )
{
float isOrtho = unity_OrthoParams . w ;
float isPers = 1.0 - unity_OrthoParams . w ;
z *= _ZBufferParams . x ;
return ( 1.0 - isOrtho * z ) / ( isPers * z + _ZBufferParams . y ) ;
}

float LinearEyeDepth ( float z )
{
return rcp ( _ZBufferParams . z * z + _ZBufferParams . w ) ;
}
#line 222
half3 SafeHDR ( half3 c )
{
return min ( c , 65504.0 ) ;
}

half4 SafeHDR ( half4 c )
{
return min ( c , 65504.0 ) ;
}
#line 233
float3 DecodeViewNormalStereo ( float4 enc4 )
{
float kScale = 1.7777 ;
float3 nn = enc4 . xyz * float3 ( 2.0 * kScale , 2.0 * kScale , 0 ) + float3 ( - kScale , - kScale , 1 ) ;
float g = 2.0 / dot ( nn . xyz , nn . xyz ) ;
float3 n ;
n . xy = g * nn . xy ;
n . z = g - 1.0 ;
return n ;
}
#line 246
float GradientNoise ( float2 uv )
{
uv = floor ( uv * _ScreenParams . xy ) ;
float f = dot ( float2 ( 0.06711056 , 0.00583715 ) , uv ) ;
return frac ( 52.9829189 * frac ( f ) ) ;
}
#line 254
float2 TransformTriangleVertexToUV ( float2 vertex )
{
float2 uv = ( vertex + 1.0 ) * 0.5 ;
return uv ;
}
#line 27 "F:/src/Graphics/com.unity.postprocessing/PostProcessing/Shaders/xRLib.hlsl"
float _RenderViewportScaleFactor ;

float2 UnityStereoScreenSpaceUVAdjust ( float2 uv , float4 scaleAndOffset )
{
return uv . xy * scaleAndOffset . xy + scaleAndOffset . zw ;
}

float4 UnityStereoScreenSpaceUVAdjust ( float4 uv , float4 scaleAndOffset )
{
return float4 ( UnityStereoScreenSpaceUVAdjust ( uv . xy , scaleAndOffset ) , UnityStereoScreenSpaceUVAdjust ( uv . zw , scaleAndOffset ) ) ;
}

float2 UnityStereoClampScaleOffset ( float2 uv , float4 scaleAndOffset )
{
return clamp ( uv , scaleAndOffset . zw , scaleAndOffset . zw + scaleAndOffset . xy ) ;
}
#line 76
float2 TransformStereoScreenSpaceTex ( float2 uv , float w )
{
return uv * _RenderViewportScaleFactor ;
}

float2 UnityStereoTransformScreenSpaceTex ( float2 uv )
{
return TransformStereoScreenSpaceTex ( saturate ( uv ) , 1.0 ) ;
}

float2 UnityStereoClamp ( float2 uv )
{
float4 scaleOffset = float4 ( _RenderViewportScaleFactor , _RenderViewportScaleFactor , 0.f , 0.f ) ;
return UnityStereoClampScaleOffset ( uv , scaleOffset ) ;
}

float4 UnityStereoAdjustedTexelSize ( float4 texelSize )
{
return texelSize ;
}
#line 265 "F:/src/Graphics/com.unity.postprocessing/PostProcessing/Shaders/StdLib.hlsl"
struct AttributesDefault
{
float3 vertex : POSITION ;
} ;

struct VaryingsDefault
{
float4 vertex : SV_POSITION ;
float2 texcoord : TEXCOORD0 ;
float2 texcoordStereo : TEXCOORD1 ;
#line 278
} ;
#line 284
VaryingsDefault VertDefault ( AttributesDefault v )
{
VaryingsDefault o ;
o . vertex = float4 ( v . vertex . xy , 0.0 , 1.0 ) ;
o . texcoord = TransformTriangleVertexToUV ( v . vertex . xy ) ;
#line 291
o . texcoord = o . texcoord * float2 ( 1.0 , - 1.0 ) + float2 ( 0.0 , 1.0 ) ;
#line 294
o . texcoordStereo = TransformStereoScreenSpaceTex ( o . texcoord , 1.0 ) ;

return o ;
}

float4 _UVTransform ;
#line 305
VaryingsDefault VertUVTransform ( AttributesDefault v )
{
VaryingsDefault o ;
#line 312
o . vertex = float4 ( v . vertex . xy , 0.0 , 1.0 ) ;

o . texcoord = TransformTriangleVertexToUV ( v . vertex . xy ) * _UVTransform . xy + _UVTransform . zw ;
o . texcoordStereo = TransformStereoScreenSpaceTex ( o . texcoord , 1.0 ) ;
#line 319
return o ;
}
#line 54 "Packages/com.unity.postprocessing/PostProcessing/Shaders/Builtins/MultiScaleVORender.compute"
Texture2D < float2 > DepthTex ;
#line 58
RWTexture2D < float2 > Occlusion ;
#line 61
groupshared float2 DepthSamples [ 32 * 32 ] ;
#line 77
SamplerState samplerDepthTex ;

cbuffer CB1 {
float4 gInvThicknessTable [ 3 ] ;
float4 gSampleWeightTable [ 3 ] ;
float4 gInvSliceDimension ;
float2 AdditionalParams ;
} ;
#line 90
float2 TestSamplePair ( float frontDepth , float2 invRange , uint base , int offset )
{
#line 95
float2 disocclusion1 = DepthSamples [ base + offset ] * invRange - frontDepth ;
float2 disocclusion2 = DepthSamples [ base - offset ] * invRange - frontDepth ;

float2 pseudoDisocclusion1 = saturate ( AdditionalParams . x * disocclusion1 ) ;
float2 pseudoDisocclusion2 = saturate ( AdditionalParams . x * disocclusion2 ) ;

return saturate (
clamp ( disocclusion1 , pseudoDisocclusion2 , 1.0 ) +
clamp ( disocclusion2 , pseudoDisocclusion1 , 1.0 ) -
pseudoDisocclusion1 * pseudoDisocclusion2 ) ;
}

float2 TestSamples ( uint centerIdx , uint x , uint y , float2 invDepth , float invThickness )
{

x <<= 1 ;
y <<= 1 ;
#line 114
float2 invRange = invThickness * invDepth ;
float frontDepth = invThickness - 0.5 ;

if ( y == 0 )
{

return 0.5 * (
TestSamplePair ( frontDepth , invRange , centerIdx , x ) +
TestSamplePair ( frontDepth , invRange , centerIdx , x * 32 )
) ;
}
else if ( x == y )
{

return 0.5 * (
TestSamplePair ( frontDepth , invRange , centerIdx , x * 32 - x ) +
TestSamplePair ( frontDepth , invRange , centerIdx , x * 32 + x )
) ;
}
else
{

return 0.25 * (
TestSamplePair ( frontDepth , invRange , centerIdx , y * 32 + x ) +
TestSamplePair ( frontDepth , invRange , centerIdx , y * 32 - x ) +
TestSamplePair ( frontDepth , invRange , centerIdx , x * 32 + y ) +
TestSamplePair ( frontDepth , invRange , centerIdx , x * 32 - y )
) ;
}
}
#line 207
[ numthreads ( 16 , 16 , 1 ) ]
void MultiScaleVORender_MSAA ( uint3 Gid : SV_GroupID , uint GI : SV_GroupIndex , uint3 GTid : SV_GroupThreadID , uint3 DTid : SV_DispatchThreadID )
{

float2 QuadCenterUV = int2 ( DTid . xy + GTid . xy - 7 ) * gInvSliceDimension . xy ;
#line 222
float4 depths0 = DepthTex . GatherRed ( samplerDepthTex , QuadCenterUV ) ;
float4 depths1 = DepthTex . GatherGreen ( samplerDepthTex , QuadCenterUV ) ;

int destIdx = GTid . x * 2 + GTid . y * 2 * 32 ;
DepthSamples [ destIdx ] = float2 ( depths0 . w , depths1 . w ) ;
DepthSamples [ destIdx + 1 ] = float2 ( depths0 . z , depths1 . z ) ;
DepthSamples [ destIdx + 32 ] = float2 ( depths0 . x , depths1 . x ) ;
DepthSamples [ destIdx + 32 + 1 ] = float2 ( depths0 . y , depths1 . y ) ;
#line 243
GroupMemoryBarrierWithGroupSync ( ) ;
#line 246
uint thisIdx = GTid . x + GTid . y * 32 + 8 * 32 + 8 ;
#line 252
const float2 invThisDepth = float2 ( 1.0 / DepthSamples [ thisIdx ] . x , 1.0 / DepthSamples [ thisIdx ] . y ) ;
float2 ao = 0.0 ;
#line 278
ao += gSampleWeightTable [ 0 ] . y * TestSamples ( thisIdx , 2 , 0 , invThisDepth , gInvThicknessTable [ 0 ] . y ) ;
ao += gSampleWeightTable [ 0 ] . w * TestSamples ( thisIdx , 4 , 0 , invThisDepth , gInvThicknessTable [ 0 ] . w ) ;
ao += gSampleWeightTable [ 1 ] . x * TestSamples ( thisIdx , 1 , 1 , invThisDepth , gInvThicknessTable [ 1 ] . x ) ;
ao += gSampleWeightTable [ 2 ] . x * TestSamples ( thisIdx , 2 , 2 , invThisDepth , gInvThicknessTable [ 2 ] . x ) ;
ao += gSampleWeightTable [ 2 ] . w * TestSamples ( thisIdx , 3 , 3 , invThisDepth , gInvThicknessTable [ 2 ] . w ) ;
ao += gSampleWeightTable [ 1 ] . z * TestSamples ( thisIdx , 1 , 3 , invThisDepth , gInvThicknessTable [ 1 ] . z ) ;
ao += gSampleWeightTable [ 2 ] . z * TestSamples ( thisIdx , 2 , 4 , invThisDepth , gInvThicknessTable [ 2 ] . z ) ;
#line 290
uint2 OutPixel = DTid . xy ;

Occlusion [ OutPixel ] = lerp ( 1 , ao , AdditionalParams . y ) ;
}
