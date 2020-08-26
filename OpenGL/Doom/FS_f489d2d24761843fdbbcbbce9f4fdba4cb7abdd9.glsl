#version 430 core
#extension GL_ARB_shader_clock : enable
void clip( float v ) { if ( v < 0.0 ) { discard; } }
void clip( vec2 v ) { if ( any( lessThan( v, vec2( 0.0 ) ) ) ) { discard; } }
void clip( vec3 v ) { if ( any( lessThan( v, vec3( 0.0 ) ) ) ) { discard; } }
void clip( vec4 v ) { if ( any( lessThan( v, vec4( 0.0 ) ) ) ) { discard; } }

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

vec4 tex1Dbias( sampler1D image, vec4 texcoord ) { return texture( image, texcoord.x, texcoord.w ); }
vec4 tex2Dbias( sampler2D image, vec4 texcoord ) { return texture( image, texcoord.xy, texcoord.w ); }
vec4 tex2DARRAYbias( sampler2DArray image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 tex3Dbias( sampler3D image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEbias( samplerCube image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEARRAYbias( samplerCubeArray image, vec4 texcoord, float bias ) { return texture( image, texcoord.xyzw, bias); }

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

uniform vec4 _fa_freqHigh [2];
uniform sampler2D samp_tex0;
uniform sampler2D samp_tex1;

in vec4 gl_FragCoord;

out vec4 out_FragColor0;

float fmax3 ( float f1, float f2, float f3 ) { return max( f1, max( f2, f3 ) ); }
float fmin3 ( float f1, float f2, float f3 ) { return min( f1, min( f2, f3 ) ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
vec4 tex2DFetch ( sampler2D image, ivec2 texcoord, int mip ) { return texelFetch( image, texcoord, mip ); }
float GetLuma ( vec3 c ) {
	return dot( c, vec3( 0.2126, 0.7152, 0.0722 ) );
}
const float bias = 128.0;
const float scale = 1.0;
vec4 toneMap ( vec4 linearHDR ) {
	const vec3 toneMapped = saturate( linearHDR.rgb / ( bias + scale * GetLuma( linearHDR.rgb ) ) );
	return vec4( sqrt( toneMapped ), linearHDR.a );
}
vec4 toneMapInverse ( vec4 toneMapped ) {
	const vec3 linearHDR = toneMapped.rgb * toneMapped.rgb;
	return vec4( ( linearHDR.rgb * bias / ( 1.0 - scale * GetLuma( linearHDR.rgb ) ) ), toneMapped.a );
}
void main() {
	{
		vec2 texcoord = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
		ivec2 pixelLocation = ivec2( gl_FragCoord.xy );
		{
			vec4 curr_frame = vec4( 0 );
			vec4 curr_frame_lowpass = vec4( 0 );
			vec4 cMax = vec4( 0 );
			vec4 cMin = vec4( 0 );
			vec4 M = toneMap( tex2DFetch( samp_tex0, pixelLocation, 0 ) );
			{
				vec4 ML = toneMap( tex2DFetch( samp_tex0, pixelLocation + ivec2( -1, 0 ), 0 ) );
				vec4 MR = toneMap( tex2DFetch( samp_tex0, pixelLocation + ivec2( 1, 0 ), 0 ) );
				vec4 T = toneMap( tex2DFetch( samp_tex0, pixelLocation + ivec2( 0, -1 ), 0 ) );
				vec4 B = toneMap( tex2DFetch( samp_tex0, pixelLocation + ivec2( 0, 1 ), 0 ) );
				cMax.xyz = vec3( fmax3( fmax3( T.x, M.x, B.x ), ML.x, MR.x ), fmax3( fmax3( T.y, M.y, B.y ), ML.y, MR.y ), fmax3( fmax3( T.z, M.z, B.z ), ML.z, MR.z ) );
				cMin.xyz = vec3( fmin3( fmin3( T.x, M.x, B.x ), ML.x, MR.x ), fmin3( fmin3( T.y, M.y, B.y ), ML.y, MR.y ), fmin3( fmin3( T.z, M.z, B.z ), ML.z, MR.z ) );
				cMax.w = fmax3( fmax3( T.w, M.w, B.w ), ML.w, MR.w );
				cMin.w = fmin3( fmin3( T.w, M.w, B.w ), ML.w, MR.w );
			}
			{
				vec4 TL = toneMap( tex2DFetch( samp_tex0, pixelLocation + ivec2( -1, -1 ), 0 ) );
				vec4 TR = toneMap( tex2DFetch( samp_tex0, pixelLocation + ivec2( 1, -1 ), 0 ) );
				vec4 BL = toneMap( tex2DFetch( samp_tex0, pixelLocation + ivec2( -1, 1 ), 0 ) );
				vec4 BR = toneMap( tex2DFetch( samp_tex0, pixelLocation + ivec2( 1, 1 ), 0 ) );
				cMax.xyz = ( vec3( fmax3( fmax3( TL.x, TR.x, BL.x ), BR.x, cMax.x ), fmax3( fmax3( TL.y, TR.y, BL.y ), BR.y, cMax.y ), fmax3( fmax3( TL.z, TR.z, BL.z ), BR.z, cMax.z ) ) + cMax.xyz ) * 0.5;
				cMin.xyz = ( vec3( fmin3( fmin3( TL.x, TR.x, BL.x ), BR.x, cMin.x ), fmin3( fmin3( TL.y, TR.y, BL.y ), BR.y, cMin.y ), fmin3( fmin3( TL.z, TR.z, BL.z ), BR.z, cMin.z ) ) + cMin.xyz ) * 0.5;
				cMax.w = ( fmax3( fmax3( TL.w, TR.w, BL.w ), BR.w, cMax.w ) + cMax.w ) * 0.5;
				cMin.w = ( fmin3( fmin3( TL.w, TR.w, BL.w ), BR.w, cMin.w ) + cMin.w ) * 0.5;
			}
			curr_frame = saturate( M );
			vec4 prev_frame = toneMap( tex2Dlod( samp_tex1, vec4( texcoord.xy, 0, 0 ) ) );
			vec4 cubeBlendRatios = saturate( ( cMax - prev_frame ) / ( cMax - cMin ) );
			prev_frame = mix( cMax, cMin, cubeBlendRatios );
			out_FragColor0 = max( vec4( 0 ), toneMapInverse( mix( prev_frame, curr_frame, vec4( _fa_freqHigh[1 ].x ) ) ) );
		};
	}
}