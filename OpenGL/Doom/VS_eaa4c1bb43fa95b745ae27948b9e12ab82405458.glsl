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

uniform vec4 _va_freqHigh [9];
uniform vec4 _va_freqLow [2];

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord1;
out vec4 vofi_Color;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 position = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		vec4 normal = in_Normal * 2.0 - 1.0;
		vec4 tangent = in_Tangent * 2.0 - 1.0;
		vec3 bitangent = cross( normal.xyz, tangent.xyz ) * tangent.w;
		vec4 tempPosition0, tempPosition1, tempPosition2;
		tempPosition0.x = dot4( position, _va_freqHigh[0 ] );
		tempPosition0.y = dot4( position, _va_freqHigh[1 ] );
		tempPosition0.z = dot4( position, _va_freqHigh[2 ] );
		tempPosition0.w = dot4( position, _va_freqHigh[3 ] );
		tempPosition1.x = dot4( normal, _va_freqHigh[0 ] );
		tempPosition1.y = dot4( normal, _va_freqHigh[1 ] );
		tempPosition1.z = dot4( normal, _va_freqHigh[2 ] );
		tempPosition1.w = dot4( normal, _va_freqHigh[3 ] );
		gl_Position.x = dot4( position, _va_freqHigh[4 ] );
		gl_Position.y = dot4( position, _va_freqHigh[5 ] );
		gl_Position.z = dot4( position, _va_freqHigh[6 ] );
		gl_Position.w = dot4( position, _va_freqHigh[7 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.zw = vec2( 0.0 );
		vofi_TexCoord1.xyz = tempPosition1.xyz;
		vofi_TexCoord1.w = 0.0;
		vofi_TexCoord2.xyz = tempPosition0.xyz;
		vofi_TexCoord2.w = 0.0;
		vofi_Color = _va_freqHigh[8 ];
	}
}