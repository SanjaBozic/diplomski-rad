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

uniform vec4 _va_freqHigh [10];
uniform vec4 _va_freqLow [3];

in vec4 in_Position;
in vec2 in_TexCoord;
in vec4 in_Tangent;
in vec4 in_Normal;
in vec4 in_Color;

out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord0;
out vec4 vofi_Color;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord3;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		gl_Position.x = dot4( in_Position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( in_Position, _va_freqHigh[1 ] );
		gl_Position.z = dot4( in_Position, _va_freqHigh[2 ] );
		gl_Position.w = dot4( in_Position, _va_freqHigh[3 ] );
		vec3 worldPos = vec3( 0.0 );
		worldPos.x = dot4( in_Position, _va_freqHigh[4 ] );
		worldPos.y = dot4( in_Position, _va_freqHigh[5 ] );
		worldPos.z = dot4( in_Position, _va_freqHigh[6 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.z = 0.0;
		vofi_TexCoord0.w = saturate( exp2( -( clamp( gl_Position.w - _va_freqLow[0 ].x, 0.0, _va_freqLow[0 ].y ) * _va_freqLow[0 ].z ) ) );
		vofi_TexCoord1.xyz = in_Tangent.xyz;
		vec3 ribbonDir = in_Normal.xyz * 2.0 - 1.0;
		vec3 viewDir = normalize( worldPos - _va_freqLow[1 ].xyz );
		float viewFalloff = 1.0 - pow( saturate( abs( dot( ribbonDir, viewDir ) ) ), 30.0 );
		vofi_TexCoord1.w = viewFalloff;
		float myTime = _va_freqLow[2 ].x * ( in_Tangent.z * 0.3 + 1.0 ) + in_Tangent.z * 73.0;
		float fracX = fract( floor( myTime * _va_freqHigh[7 ].z ) / _va_freqHigh[7 ].x );
		float fracY = fract( floor( ( myTime * _va_freqHigh[7 ].z ) / _va_freqHigh[7 ].x ) / _va_freqHigh[7 ].y );
		vofi_TexCoord2.x = ( in_TexCoord.x * _va_freqHigh[8 ].x + myTime * _va_freqHigh[8 ].z ) * ( 1.0 / _va_freqHigh[7 ].x ) + fracX;
		vofi_TexCoord2.y = ( in_TexCoord.y * _va_freqHigh[8 ].y + myTime * _va_freqHigh[8 ].w ) * ( 1.0 / _va_freqHigh[7 ].y ) + fracY;
		fracX = fract( floor( myTime * _va_freqHigh[7 ].z + 1.0 ) / _va_freqHigh[7 ].x );
		fracY = fract( floor( ( myTime * _va_freqHigh[7 ].z + 1.0 ) / _va_freqHigh[7 ].x ) / _va_freqHigh[7 ].y );
		vofi_TexCoord2.z = ( in_TexCoord.x * _va_freqHigh[8 ].x + myTime * _va_freqHigh[8 ].z ) * ( 1.0 / _va_freqHigh[7 ].x ) + fracX;
		vofi_TexCoord2.w = ( in_TexCoord.y * _va_freqHigh[8 ].y + myTime * _va_freqHigh[8 ].w ) * ( 1.0 / _va_freqHigh[7 ].y ) + fracY;
		vofi_TexCoord3.x = fract( myTime * _va_freqHigh[7 ].z );
		float fade = saturate( abs( gl_Position.w ) * _va_freqHigh[9 ].x );
		vofi_Color = in_Color;
	}
}