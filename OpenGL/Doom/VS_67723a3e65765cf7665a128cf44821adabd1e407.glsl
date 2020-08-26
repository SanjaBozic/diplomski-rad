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

uniform vec4 _va_freqHigh [4];

in vec4 in_Position;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;

void main() {
	{
		gl_Position.x = dot( in_Position, _va_freqHigh[0 ] );
		gl_Position.y = dot( in_Position, _va_freqHigh[1 ] );
		gl_Position.z = dot( in_Position, _va_freqHigh[2 ] );
		gl_Position.w = dot( in_Position, _va_freqHigh[3 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.zw = vec2( 0.0 );
	}
}