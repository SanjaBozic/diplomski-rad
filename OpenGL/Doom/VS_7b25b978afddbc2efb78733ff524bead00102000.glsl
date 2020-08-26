#version 430 core
#extension GL_ARB_shader_clock : enable
float saturate( float v ) { return clamp( v, 0.0, 1.0 ); }
vec2 saturate( vec2 v ) { return clamp( v, 0.0, 1.0 ); }
vec3 saturate( vec3 v ) { return clamp( v, 0.0, 1.0 ); }
vec4 saturate( vec4 v ) { return clamp( v, 0.0, 1.0 ); }
vec4 tex2Dlod( sampler2D image, vec4 texcoord ) { return textureLod( image, texcoord.xy, texcoord.w ); }
vec4 tex3Dlod( sampler3D image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBElod( samplerCube image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 tex2DARRAYlod( sampler2DArray image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEARRAYlod( samplerCubeArray image, vec4 texcoord, float lod ) { return textureLod( image, texcoord.xyzw, lod ); }

uniform vec4 _va_freqHigh [17];
uniform vec4 _va_freqLow [6];
layout( std430 ) buffer fogofwar_b {
	restrict readonly uint fogofwar[ ];
};

in vec4 in_Position;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord3;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord5;
out vec4 vofi_Color;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 position = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		vec4 tempPosition0, tempPosition1;
		tempPosition0.x = dot4( position, _va_freqHigh[0 ] );
		tempPosition0.y = dot4( position, _va_freqHigh[1 ] );
		tempPosition0.z = dot4( position, _va_freqHigh[2 ] );
		tempPosition0.w = dot4( position, _va_freqHigh[3 ] );
		tempPosition1.x = dot4( tempPosition0, _va_freqHigh[4 ] );
		tempPosition1.y = dot4( tempPosition0, _va_freqHigh[5 ] );
		tempPosition1.z = dot4( tempPosition0, _va_freqHigh[6 ] );
		tempPosition1.w = dot4( tempPosition0, _va_freqHigh[7 ] );
		vofi_TexCoord1 = tempPosition0;
		gl_Position.x = dot4( position, _va_freqHigh[8 ] );
		gl_Position.y = dot4( position, _va_freqHigh[9 ] );
		gl_Position.z = dot4( position, _va_freqHigh[10 ] );
		gl_Position.w = dot4( position, _va_freqHigh[11 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.zw = vec2( 0.0 );
		vofi_TexCoord2.xyz = tempPosition0.xyz;
		vofi_TexCoord2.w = 0.0;
		vofi_TexCoord3.xy = in_TexCoord.xy;
		vofi_TexCoord5.x = dot4( tempPosition1, _va_freqLow[2 ] );
		vofi_TexCoord5.y = dot4( tempPosition1, _va_freqLow[3 ] );
		vofi_TexCoord5.z = dot4( tempPosition1, _va_freqLow[4 ] );
		vofi_TexCoord5.w = dot4( tempPosition1, _va_freqLow[5 ] );
		vec4 vertColor = _va_freqHigh[12 ];
		int shift_divisor = 4;
		int and_modulus = 15;
		int bits_per_tile = 2;
		int min_val_to_clip = 1; if ( _va_freqHigh[13 ].x > 0.0 ) {
			int tile_row = int( ( tempPosition0.y - _va_freqHigh[14 ].y ) / _va_freqHigh[15 ].y );
			int tile_column = int( ( tempPosition0.x - _va_freqHigh[14 ].x ) / _va_freqHigh[15 ].x );
			int tile_layer = int( ( tempPosition0.z - _va_freqHigh[14 ].z ) / _va_freqHigh[15 ].w );
			int tile_Index = int( _va_freqHigh[14 ].w * tile_layer ) + tile_column + int( tile_row * _va_freqHigh[15 ].z );
			uint fogTile = fogofwar[ ( tile_Index >> shift_divisor ) ];
			uint shiftVal = ( tile_Index & and_modulus ) * bits_per_tile;
			uint bit_mask = 3 << shiftVal;
			uint val = fogTile & bit_mask; if ( ( val & bit_mask ) == 0 ) {
				vertColor = vec4( 0.0 );
			} if ( ( val & bit_mask ) == ( 1 << shiftVal ) ) {
				vertColor = _va_freqHigh[16 ];
			}
		}
		vofi_Color = vertColor;
	}
}