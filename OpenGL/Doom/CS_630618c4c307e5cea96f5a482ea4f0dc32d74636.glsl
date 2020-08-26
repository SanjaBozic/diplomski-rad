#version 430 core
#extension GL_ARB_shader_clock : enable
//This is a compute Shader

float saturate( float v ) { return clamp( v, 0.0, 1.0 ); }
vec2 saturate( vec2 v ) { return clamp( v, 0.0, 1.0 ); }
vec3 saturate( vec3 v ) { return clamp( v, 0.0, 1.0 ); }
vec4 saturate( vec4 v ) { return clamp( v, 0.0, 1.0 ); }

vec4 tex2D( sampler2D image, vec2 texcoord ) { return texture( image, texcoord.xy ); }
vec4 tex2D( sampler2DShadow image, vec3 texcoord ) { return vec4( texture( image, texcoord.xyz ) ); }
vec4 tex2DARRAY( sampler2DArray image, vec3 texcoord ) { return texture( image, texcoord.xyz ); }

vec4 tex2D( sampler2D image, vec2 texcoord, vec2 dx, vec2 dy ) { return textureGrad( image, texcoord.xy, dx, dy ); }
vec4 tex2D( sampler2DShadow image, vec3 texcoord, vec2 dx, vec2 dy ) { return vec4( textureGrad( image, texcoord.xyz, dx, dy ) ); }
vec4 tex2DARRAY( sampler2DArray image, vec3 texcoord, vec2 dx, vec2 dy ) { return textureGrad( image, texcoord.xyz, dx, dy ); }

vec4 texCUBE( samplerCube image, vec3 texcoord ) { return texture( image, texcoord.xyz ); }
vec4 texCUBE( samplerCubeShadow image, vec4 texcoord ) { return vec4( texture( image, texcoord.xyzw ) ); }
vec4 texCUBEARRAY( samplerCubeArray image, vec4 texcoord ) { return texture( image, texcoord.xyzw ); }

vec4 tex1Dproj( sampler1D image, vec2 texcoord ) { return textureProj( image, texcoord ); }
vec4 tex2Dproj( sampler2D image, vec3 texcoord ) { return textureProj( image, texcoord ); }
vec4 tex3Dproj( sampler3D image, vec4 texcoord ) { return textureProj( image, texcoord ); }

vec4 tex1Dlod( sampler1D image, vec4 texcoord ) { return textureLod( image, texcoord.x, texcoord.w ); }
vec4 tex2Dlod( sampler2D image, vec4 texcoord ) { return textureLod( image, texcoord.xy, texcoord.w ); }
vec4 tex2DARRAYlod( sampler2DArray image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 tex3Dlod( sampler3D image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBElod( samplerCube image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEARRAYlod( samplerCubeArray image, vec4 texcoord, float lod ) { return textureLod( image, texcoord.xyzw, lod ); }

vec4 tex2DGatherRed( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 0 ); }
vec4 tex2DGatherGreen( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 1 ); }
vec4 tex2DGatherBlue( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 2 ); }
vec4 tex2DGatherAlpha( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 3 ); }

vec4 tex2DGatherOffsetRed( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 0 ); }
vec4 tex2DGatherOffsetGreen( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 1 ); }
vec4 tex2DGatherOffsetBlue( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 2 ); }
vec4 tex2DGatherOffsetAlpha( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 3 ); }

#define tex2DGatherOffsetsRed( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 0 )
#define tex2DGatherOffsetsGreen( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 1 )
#define tex2DGatherOffsetsBlue( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 2 )
#define tex2DGatherOffsetsAlpha( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 3 )

uniform vec4 _ca_freqHigh [3];
uniform vec4 _ca_freqLow [2];
layout( local_size_x = 8, local_size_y = 8, local_size_z = 1 ) in ;
uniform sampler2D samp_tex0;
uniform sampler2D samp_viewdepthmap;
layout( binding = 0, r11f_g11f_b10f ) uniform image2D ib_computepostprocesstarget ;
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
float GetLinearDepth ( float ndcZ, vec4 projectionMatrixZ, float rcpFarZ, bool bFirstPersonArmsRescale ) {
	float linearZ = projectionMatrixZ.w / ( ndcZ + projectionMatrixZ.z );
	if ( bFirstPersonArmsRescale ) {
		linearZ *= linearZ < 1.0 ? 10.0 : 1.0;
	}
	return linearZ * rcpFarZ;
}
float w0 (float a) { return (1.0/6.0)*(a*(a*(-a + 3.0) - 3.0) + 1.0); }
float w1 (float a) { return (1.0/6.0)*(a*a*(3.0*a - 6.0) + 4.0); }
float w2 (float a) { return (1.0/6.0)*(a*(a*(-3.0*a + 3.0) + 3.0) + 1.0); }
float w3 (float a) { return (1.0/6.0)*(a*a*a); }
float g0 (float a) { return w0(a) + w1(a); }
float g1 (float a) { return w2(a) + w3(a); }
float h0 (float a) { return -1.0 + w1(a) / (w0(a) + w1(a)); }
float h1 (float a) { return 1.0 + w3(a) / (w2(a) + w3(a)); }
vec4 tex2DBicubic ( sampler2D image,
vec2 uv, vec2 res ) {
	uv = uv * res + 0.5;
	const vec2 iuv = floor( uv );
	const vec2 fuv = fract( uv );
	const float g0x = g0( fuv.x );
	const float g1x = g1( fuv.x );
	const float h0x = h0( fuv.x );
	const float h1x = h1( fuv.x );
	const float h0y = h0( fuv.y );
	const float h1y = h1( fuv.y );
	const vec2 p0 = ( vec2( iuv.x + h0x, iuv.y + h0y ) - 0.5 ) / res;
	const vec2 p1 = ( vec2( iuv.x + h1x, iuv.y + h0y ) - 0.5 ) / res;
	const vec2 p2 = ( vec2( iuv.x + h0x, iuv.y + h1y ) - 0.5 ) / res;
	const vec2 p3 = ( vec2( iuv.x + h1x, iuv.y + h1y ) - 0.5 ) / res;
	const vec4 t0 = tex2Dlod( image, vec4( p0, 0, 0 ) );
	const vec4 t1 = tex2Dlod( image, vec4( p1, 0, 0 ) );
	const vec4 t2 = tex2Dlod( image, vec4( p2, 0, 0 ) );
	const vec4 t3 = tex2Dlod( image, vec4( p3, 0, 0 ) );
	return g0( fuv.y ) * ( g0x * t0 + g1x * t1 ) + g1( fuv.y ) * ( g0x * t2 + g1x * t3 );
}
void main() {
	{
		ivec3 pixelLocation = ivec3(gl_GlobalInvocationID );
		vec2 texcoord = ( pixelLocation.xy + 0.5 ) * _ca_freqHigh[0 ].zw;
		vec4 outputColor;
		{
			vec4 far = tex2DBicubic( samp_tex0, texcoord.xy, _ca_freqHigh[1 ].xy );
			float dz = tex2Ddepth( samp_viewdepthmap, texcoord.xy * _ca_freqLow[0 ].zw );
			float lz = GetLinearDepth( dz, _ca_freqLow[1 ], 1.0, true );
			float cocFar = 0.0;
			if ( lz >= _ca_freqHigh[2 ].x ) {
				float farfield_bias = 1.0;
				cocFar = saturate( ( lz - _ca_freqHigh[2 ].x - farfield_bias ) / ( _ca_freqHigh[2 ].z - _ca_freqHigh[2 ].x - farfield_bias ) );
				float blendRatio = 10.0;
				outputColor = vec4( far.xyz * saturate( sqrt( cocFar * blendRatio) ), saturate( 1 - sqrt( cocFar * blendRatio ) ) );
			} else {
				outputColor = vec4(0, 0, 0, 1);
			}
		};
		vec3 dstColor = imageLoad( ib_computepostprocesstarget, pixelLocation.xy ).xyz;
		dstColor.xyz = outputColor.xyz + dstColor.xyz * outputColor.w;
		imageStore( ib_computepostprocesstarget, pixelLocation.xy, vec4( dstColor.xyz, 0.0 ) );
	}
}