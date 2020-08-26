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

in vec4 in_Color;
in vec4 in_Normal;
in vec4 in_Position;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 col = in_Color;
		vec4 position;
		{
			float s = in_Normal.w * 2.0 - 1.0;
			vec3 axis = in_Normal.xyz * 2.0 - 1.0;
			float len = col.x * 255.0 * s;
			vec3 dir = normalize( in_Position.xyz - _va_freqHigh[0 ].xyz );
			vec3 minor = cross( axis, dir );
			position.xyz = ( in_Position.xyz + len * minor );
		};
		position.w = in_Position.w;
		gl_Position.x = dot4( position, _va_freqHigh[1 ] );
		gl_Position.y = dot4( position, _va_freqHigh[2 ] );
		gl_Position.z = dot4( position, _va_freqHigh[3 ] );
		gl_Position.w = dot4( position, _va_freqHigh[4 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.zw = vec2( 0.0 );
	}
}