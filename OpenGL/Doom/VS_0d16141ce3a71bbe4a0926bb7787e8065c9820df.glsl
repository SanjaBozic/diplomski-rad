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

uniform vec4 _va_freqHigh [1];
uniform vec4 _va_freqLow [7];

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord0;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 position = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		vec4 normal = in_Normal * 2.0 - 1.0;
		vec4 tangent = in_Tangent * 2.0 - 1.0;
		vec3 bitangent = cross( normal.xyz, tangent.xyz ) * tangent.w;
		vec4 worldPos;
		worldPos.xyz = _va_freqLow[2 ].xyz + position.xyz;
		worldPos.w = 1.0;
		gl_Position.x = dot4( worldPos, _va_freqLow[3 ] );
		gl_Position.y = dot4( worldPos, _va_freqLow[4 ] );
		gl_Position.z = dot4( worldPos, _va_freqLow[5 ] ) - 0.00001;
		gl_Position.w = dot4( worldPos, _va_freqLow[5 ] );
		vofi_TexCoord0 = in_TexCoord.xyxy;
		vofi_TexCoord0.z = saturate( exp2( -( max( gl_Position.w - _va_freqLow[6 ].x, 0.0 ) * _va_freqLow[6 ].z * _va_freqHigh[0 ].x ) ) );
		vofi_TexCoord0.w = worldPos.z;
		vofi_TexCoord1.xyz = normalize( -position.xyz );
	}
}