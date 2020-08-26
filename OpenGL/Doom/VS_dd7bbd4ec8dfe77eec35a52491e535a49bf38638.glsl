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

uniform vec4 _va_freqHigh [16];
uniform vec4 _va_freqLow [5];
layout( std430 ) buffer fogofwar_b {
	restrict readonly uint fogofwar[ ];
};

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec2 in_TexCoord;

out vec4 vofi_Color;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 position = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		vec4 normal = in_Normal * 2.0 - 1.0;
		vec4 tangent = in_Tangent * 2.0 - 1.0;
		vec3 bitangent = cross( normal.xyz, tangent.xyz ) * tangent.w;
		vec4 tempPosition0;
		tempPosition0.x = dot4( position, _va_freqHigh[0 ] );
		tempPosition0.y = dot4( position, _va_freqHigh[1 ] );
		tempPosition0.z = dot4( position, _va_freqHigh[2 ] );
		tempPosition0.w = dot4( position, _va_freqHigh[3 ] );
		gl_Position.x = dot4( position, _va_freqHigh[4 ] );
		gl_Position.y = dot4( position, _va_freqHigh[5 ] );
		gl_Position.z = dot4( position, _va_freqHigh[6 ] );
		gl_Position.w = dot4( position, _va_freqHigh[7 ] );
		vec3 tempTangent0, tempTangent1, ssTangent;
		tempTangent0.x = dot3( tangent, _va_freqHigh[0 ] );
		tempTangent0.y = dot3( tangent, _va_freqHigh[1 ] );
		tempTangent0.z = dot3( tangent, _va_freqHigh[2 ] );
		tempTangent1.x = dot3( tempTangent0, _va_freqHigh[8 ] );
		tempTangent1.y = dot3( tempTangent0, _va_freqHigh[9 ] );
		tempTangent1.z = dot3( tempTangent0, _va_freqHigh[10 ] );
		ssTangent.x = dot3( tempTangent1, _va_freqLow[2 ] );
		ssTangent.y = dot3( tempTangent1, _va_freqLow[3 ] );
		ssTangent.z = dot3( tempTangent1, _va_freqLow[4 ] );
		vec3 ssBitangent = cross( ssTangent.xyz, vec3( 0.0, 0.0, 1.0 ) );
		ssBitangent.z = 0.0;
		ssBitangent = normalize( ssBitangent );
		gl_Position.xy += ssBitangent.xy * ( in_TexCoord.y * 2.0 - 1.0 ) * vec2( 0.0015, 0.002 ) * gl_Position.w;
		vec4 vertColor = _va_freqHigh[11 ];
		int shift_divisor = 4;
		int and_modulus = 15;
		int bits_per_tile = 2;
		int min_val_to_clip = 1; if ( _va_freqHigh[12 ].x > 0.0 ) {
			int tile_row = int( ( tempPosition0.y - _va_freqHigh[13 ].y ) / _va_freqHigh[14 ].y );
			int tile_column = int( ( tempPosition0.x - _va_freqHigh[13 ].x ) / _va_freqHigh[14 ].x );
			int tile_layer = int( ( tempPosition0.z - _va_freqHigh[13 ].z ) / _va_freqHigh[14 ].w );
			int tile_Index = int( _va_freqHigh[13 ].w * tile_layer ) + tile_column + int( tile_row * _va_freqHigh[14 ].z );
			uint fogTile = fogofwar[ ( tile_Index >> shift_divisor ) ];
			uint shiftVal = ( tile_Index & and_modulus ) * bits_per_tile;
			uint bit_mask = 3 << shiftVal;
			uint val = fogTile & bit_mask; if ( ( val & bit_mask ) == 0 ) {
				vertColor = vec4( 0.0 );
			} if ( ( val & bit_mask ) == ( 1 << shiftVal ) ) {
				vertColor.xyz = _va_freqHigh[15 ].xyz;
			}
		}
		vofi_Color = vertColor;
	}
}