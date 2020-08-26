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

uniform vec4 _va_freqHigh [5];
uniform vec4 _va_freqLow [1];

in vec4 in_Position;
in vec2 in_TexCoord;
in vec4 in_Normal;
in vec4 in_Color;

out vec4 vofi_TexCoord0;
out vec4 vofi_Color;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord2;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		gl_Position.x = dot4( in_Position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( in_Position, _va_freqHigh[1 ] );
		gl_Position.z = dot4( in_Position, _va_freqHigh[2 ] );
		gl_Position.w = dot4( in_Position, _va_freqHigh[3 ] );
		vec2 uv = in_TexCoord.xy * vec2( _va_freqLow[0 ].x ) + vec2( _va_freqLow[0 ].y );
		vec2 resolution = _va_freqHigh[4 ].xy;
		float aspectRatio = resolution.y / resolution.x;
		vofi_TexCoord0.xy = uv;
		vec2 screenUV = ( uv - vec2( 0.5 ) ) * vec2( aspectRatio, 1.0 ) * vec2( 1.35 / ( in_Normal.x + 1 ) ) + vec2( 0.5 );
		screenUV.x = 1.0 - screenUV.x;
		screenUV.y = 1.0 - screenUV.y;
		vofi_TexCoord0.zw = screenUV;
		vofi_TexCoord1.xy = ( screenUV - vec2( 0.5 ) ) * vec2( 0.99 ) + vec2( 0.5 );
		vofi_TexCoord1.zw = ( screenUV - vec2( 0.5 ) ) * vec2( 0.98 ) + vec2( 0.5 );
		vofi_TexCoord2.xy = uv * vec2( 8.0 * ( in_Normal.y * 10 + 1 ) );
		vofi_TexCoord2.z = ( in_Normal.z * 10 + 1 );
		vofi_TexCoord2.w = 0.0;
		vofi_Color = in_Color;
	}
}