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

uniform vec4 _va_freqHigh [7];
uniform vec4 _va_freqLow [3];

in vec4 in_Position;
in vec2 in_TexCoord;
in vec4 in_Color;

out vec4 vofi_TexCoord0;
out vec4 vofi_Color;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 texcoord0;
		{
			vec4 localPosition;
			{
				localPosition = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
			};
			{
				{
					gl_Position.x = dot4( localPosition, _va_freqHigh[0 ] );
					gl_Position.y = dot4( localPosition, _va_freqHigh[1 ] );
					gl_Position.z = dot4( localPosition, _va_freqHigh[2 ] );
					gl_Position.w = dot4( localPosition, _va_freqHigh[3 ] );
				};
			};
		};
		{
			texcoord0 = ( in_TexCoord.xy * _va_freqLow[2 ].xy + _va_freqLow[2 ].zw ).xyxy;
		};
		vofi_TexCoord0.x = dot4( texcoord0.xy, _va_freqHigh[4 ] );
		vofi_TexCoord0.y = dot4( texcoord0.xy, _va_freqHigh[5 ] );
		vofi_TexCoord0.zw = vec2( 0.0 );
		vofi_Color = _va_freqHigh[6 ] * in_Color;
	}
}