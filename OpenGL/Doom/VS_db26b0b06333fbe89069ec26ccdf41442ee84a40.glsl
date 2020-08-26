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
uniform vec4 _va_freqLow [1];

in vec4 in_Position;
in vec2 in_TexCoord;
in vec2 in_TexCoord1;
in vec4 in_Tangent;
in vec4 in_Normal;
in vec4 in_Color;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord1;
out vec4 vofi_Color;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord3;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		gl_Position.x = dot4( in_Position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( in_Position, _va_freqHigh[1 ] );
		gl_Position.z = dot4( in_Position, _va_freqHigh[2 ] ) * _va_freqHigh[3 ].x ;
		gl_Position.w = dot4( in_Position, _va_freqHigh[4 ] );
		gl_Position.z += _va_freqHigh[3 ].y * gl_Position.w;
		vec2 dc = gl_Position.xy / gl_Position.ww;
		gl_Position.xy = ( dc.xy + _va_freqHigh[5 ].xy ) * gl_Position.ww;
		vofi_TexCoord0.xy = in_TexCoord.xy * _va_freqLow[0 ].x + _va_freqLow[0 ].y;
		vofi_TexCoord0.zw = vec2( 0.0 );
		vofi_TexCoord1.xy = in_TexCoord1.xy * _va_freqLow[0 ].x + _va_freqLow[0 ].y;
		vofi_TexCoord1.z = in_Tangent.z;
		vofi_TexCoord1.w = 0.0;
		vofi_TexCoord2.x = in_Normal.x * 10 + 1;
		vofi_TexCoord2.y = in_Normal.y * 10 + 1;
		vofi_TexCoord2.z = in_Normal.z;
		vofi_TexCoord2.w = in_Normal.w;
		vofi_TexCoord3.xy = ( gl_Position.xy / gl_Position.w );
		vofi_TexCoord3.z = in_Normal.x;
		vofi_TexCoord3.w = in_Normal.y;
		vofi_Color = in_Color;
		vofi_Color.w *= _va_freqHigh[5 ].z;
	}
}