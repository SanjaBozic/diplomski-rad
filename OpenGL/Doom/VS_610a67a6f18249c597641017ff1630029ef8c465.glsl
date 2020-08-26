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

uniform vec4 _va_freqHigh [6];
uniform vec4 _va_freqLow [5];

in vec4 in_Position;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord3;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord2;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 position = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		gl_Position.x = dot4( position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( position, _va_freqHigh[1 ] );
		gl_Position.w = dot4( position, _va_freqHigh[2 ] );
		gl_Position.z = gl_Position.w;
		vec2 texcoord0 = in_TexCoord * _va_freqLow[2 ].xy + _va_freqLow[2 ].zw;
		vofi_TexCoord0.xy = texcoord0;
		vofi_TexCoord0.zw = vec2( 0.0 );
		vofi_TexCoord1.x = dot4( texcoord0, _va_freqHigh[3 ] );
		vofi_TexCoord1.y = dot4( texcoord0, _va_freqHigh[4 ] );
		vofi_TexCoord1.zw = vec2( 0.0 );
		vofi_TexCoord2.x = dot4( texcoord0, _va_freqLow[3 ] );
		vofi_TexCoord2.y = dot4( texcoord0, _va_freqLow[4 ] );
		vofi_TexCoord2.zw = vec2( 0.0 );
		vofi_TexCoord3.xyz = position.xyz - _va_freqHigh[5 ].xyz;
		vofi_TexCoord3.w = 0.0;
	}
}