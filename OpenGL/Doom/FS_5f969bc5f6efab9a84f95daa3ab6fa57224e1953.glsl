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

uniform vec4 _fa_freqHigh [9];
uniform vec4 _fa_freqLow [1];
uniform sampler2D samp_transmap;
uniform sampler2D samp_viewdepthmap;

in vec4 gl_FragCoord;

out vec4 out_FragColor0;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
float unpackFloatRGBA8 ( vec4 value ) {
	return dot4( value, vec4( 1.0, 1.0 / 255.0, 1.0 / 65025.0, 1.0 / 16581375.0 ) );
}
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
void main() {
	{
		vec2 tc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
		vec2 dc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[1 ] );
		float maxDistanceSqr = _fa_freqHigh[2 ].y * _fa_freqHigh[2 ].y;
		float translateOffset = ( 1.0 - clamp( _fa_freqHigh[2 ].x / maxDistanceSqr, 0.0, 1.0 ) ) * _fa_freqHigh[3 ].x;
		vec2 translate = _fa_freqHigh[0 ].zw * translateOffset;
		vec4 tex_01 = tex2D( samp_transmap, tc + vec2( -translate.x * 0.7, translate.y ) );
		vec4 tex_02 = tex2D( samp_transmap, tc + vec2( -translate.x * 0.7, -translate.y ) );
		vec4 tex_03 = tex2D( samp_transmap, tc + vec2( translate.x, 0.0 ) );
		float depths[ 3 ];
		depths[ 0 ] = 1.0 - unpackFloatRGBA8( tex_01 );
		depths[ 1 ] = 1.0 - unpackFloatRGBA8( tex_02 );
		depths[ 2 ] = 1.0 - unpackFloatRGBA8( tex_03 );
		float minDepth = 1.0;
		for ( int i = 0; i < 3; i++ ) {
			if ( depths[ i ] > 0.0 && depths[ i ] < minDepth ) {
				minDepth = depths[ i ];
			}
		}
		float destDepth = tex2Ddepth( samp_viewdepthmap, dc );
		if ( minDepth - destDepth > 0.00001 ) {
			discard;
		}
		float s_00 = tex_01.x != 0.0 ? 0.0 : 1.0;
		float s_01 = tex_02.x != 0.0 ? 0.0 : 1.0;
		float s_02 = tex_03.x != 0.0 ? 0.0 : 1.0;
		float outline = saturate( abs( s_00 - s_01 ) + abs( s_00 - s_02 ) + abs( s_01 - s_02 ) );
		float alphaScanFrequency = max( _fa_freqHigh[4 ].x * 3.14, 0.1 );
		float alphaScanAmplitude = ( _fa_freqLow[0 ].x * 4000.0 );
		float alphaScanFinal = pow( 1.0 - sin( alphaScanAmplitude / alphaScanFrequency ), 1.0 ) * _fa_freqHigh[5 ].x;
		alphaScanFinal = mix( _fa_freqHigh[5 ].x, alphaScanFinal , _fa_freqHigh[6 ].x );
		float l = gl_FragCoord.x + gl_FragCoord.y;
		float techPattern = ( ( sin( l * ( gl_FragCoord.x - gl_FragCoord.y ) ) ) * s_00 );
		vec2 sines = vec2( sin( _fa_freqLow[0 ].x * 1.7 ) , cos( _fa_freqLow[0 ].x * 1.5 ) );
		vec4 echoColor = ( ( ( ( sines.x / sines.y ) * tex_01 ) * techPattern ) * _fa_freqHigh[7 ] ) * _fa_freqHigh[8 ].x;
		out_FragColor0 = _fa_freqHigh[7 ];
	}
}