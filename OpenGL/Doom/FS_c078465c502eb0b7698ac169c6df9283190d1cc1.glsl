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
uniform vec4 _fa_freqLow [1];
uniform sampler2D samp_rendercolorafterpost;
uniform sampler2D samp_tex1;

in vec4 gl_FragCoord;

out vec4 out_FragColor0;

vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
void main() {
	{
		vec2 tc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ], _fa_freqLow[0 ] );
		vec2 step = vec2( 1.0, 1.0 ) * ( _fa_freqHigh[0 ].zw ) * _fa_freqLow[0 ].xy;
		float w[ 121 ] = {
			0.004411, 0.005278, 0.006068, 0.006704, 0.007117, 0.00726, 0.007117, 0.006704, 0.006068, 0.005278, 0.004411,
			0.005278, 0.006315, 0.00726, 0.008021, 0.008515, 0.008687, 0.008515, 0.008021, 0.00726, 0.006315, 0.005278,
			0.006068, 0.00726, 0.008347, 0.009222, 0.00979, 0.009988, 0.00979, 0.009222, 0.008347, 0.00726, 0.006068,
			0.006704, 0.008021, 0.009222, 0.010189, 0.010817, 0.011034, 0.010817, 0.010189, 0.009222, 0.008021, 0.006704,
			0.007117, 0.008515, 0.00979, 0.010817, 0.011483, 0.011714, 0.011483, 0.010817, 0.00979, 0.008515, 0.007117,
			0.00726, 0.008687, 0.009988, 0.011034, 0.011714, 0.01195, 0.011714, 0.011034, 0.009988, 0.008687, 0.00726,
			0.007117, 0.008515, 0.00979, 0.010817, 0.011483, 0.011714, 0.011483, 0.010817, 0.00979, 0.008515, 0.007117,
			0.006704, 0.008021, 0.009222, 0.010189, 0.010817, 0.011034, 0.010817, 0.010189, 0.009222, 0.008021, 0.006704,
			0.006068, 0.00726, 0.008347, 0.009222, 0.00979, 0.009988, 0.00979, 0.009222, 0.008347, 0.00726, 0.006068,
			0.005278, 0.006315, 0.00726, 0.008021, 0.008515, 0.008687, 0.008515, 0.008021, 0.00726, 0.006315, 0.005278,
			0.004411, 0.005278, 0.006068, 0.006704, 0.007117, 0.00726, 0.007117, 0.006704, 0.006068, 0.005278, 0.004411
		};
		vec3 sum = vec3(0,0,0); for ( int y = -5; y <= 5; y++ ) { for ( int x = -5; x <= 5; x++ ) {
				int ndx = ( ( y + 5 ) * ( 5 * 2 - 1 ) ) + ( x + 5 );
				vec2 off = vec2( x, y );
				sum += max( tex2Dlod( samp_rendercolorafterpost, vec4( tc + step * off, 0, 0 ) ).xyz, vec3( 0 ) ) * w[ ndx ];
			}
		}
		out_FragColor0.xyz = ( ( sum.xyz * 1.0 ) + ( max( tex2D( samp_tex1, tc ).xyz, vec3( 0 ) ) * 0.0 ) ) * 1.0;
		out_FragColor0.w = 1.0;
		{
			if ( _fa_freqHigh[1 ].x == 0 ) {
			} else if ( _fa_freqHigh[1 ].x == 1 ) {
				{
					out_FragColor0.a = 0.0001;
				};
			} else if ( _fa_freqHigh[1 ].x == 2 ) {
				{
					out_FragColor0.a = 1.0;
				};
			} else if ( _fa_freqHigh[1 ].x == 3 ) {
				{
					out_FragColor0.a = saturate( out_FragColor0.a );
					out_FragColor0.rgb *= out_FragColor0.a;
				};
			} else if ( _fa_freqHigh[1 ].x == 4 ) {
				{
					out_FragColor0.a = saturate( out_FragColor0.a );
					out_FragColor0.rgb *= out_FragColor0.a;
				};
				{
					out_FragColor0.a = 0.0001;
				};
			}
		};
	}
}