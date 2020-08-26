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
uniform vec4 _va_freqLow [3];

in vec2 in_TexCoord;
in vec2 in_VmtrTC;
in vec4 in_Position;
in vec3 in_PackedTnputs;
in vec4 in_VmtrSB;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord3;
out vec4 vofi_TexCoord5;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
uint asuint ( float x ) { return floatBitsToUint( x ); }
uvec2 asuint ( vec2 x ) { return floatBitsToUint( x ); }
uvec3 asuint ( vec3 x ) { return floatBitsToUint( x ); }
uvec4 asuint ( vec4 x ) { return floatBitsToUint( x ); }
const int NUM_VIRTUAL_PAGES_LOG2 = 11;
const int NUM_VIRTUAL_PAGES = 1 << NUM_VIRTUAL_PAGES_LOG2;
vec4 unpackR8G8B8A8 ( uint value ) {
	return vec4( ( value >> 24 ) & 0xFF, ( value >> 16 ) & 0xFF, ( value >> 8 ) & 0xFF, value & 0xFF ) / 255.0;
}
void main() {
	{
		{
			{
				vofi_TexCoord0 = ( in_TexCoord.xy * _va_freqLow[0 ].xy + _va_freqLow[0 ].zw ).xyxy;
			};
			vofi_TexCoord0.zw = ( in_VmtrTC.xy * _va_freqLow[0 ].xy + _va_freqLow[0 ].zw );
			vec4 localPosition;
			vec4 localNormal;
			vec4 localTangent;
			{
				localPosition = in_Position * _va_freqLow[1 ] + _va_freqLow[2 ];
				localNormal = unpackR8G8B8A8( asuint( in_PackedTnputs.x ) ).wzyx * 2.0 - 1.0;
				vec4 unpacked_tangent = unpackR8G8B8A8( asuint( in_PackedTnputs.y ) ).wzyx;
				localTangent.xyz = unpacked_tangent.xyz * 2.0 - 1.0;
				localTangent.w = floor( unpacked_tangent.w * 255.1 / 128.0 ) * 2.0 - 1.0;
			};
			gl_Position.x = dot4( localPosition, _va_freqHigh[0 ] );
			gl_Position.y = dot4( localPosition, _va_freqHigh[1 ] );
			gl_Position.z = dot4( localPosition, _va_freqHigh[2 ] );
			gl_Position.w = dot4( localPosition, _va_freqHigh[3 ] );
			vofi_TexCoord3 = in_VmtrSB;
			vofi_TexCoord5 = vofi_TexCoord3 / vec4( NUM_VIRTUAL_PAGES );
		};
	}
}