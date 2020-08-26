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
uniform vec4 _va_freqLow [4];

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord4;
out vec4 vofi_TexCoord2;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 localToGlobalX;
		vec4 localToGlobalY;
		vec4 localToGlobalZ;
		vec4 viewOriginToVertex;
		{
			vec4 localPosition;
			vec4 localNormal;
			vec4 localTangent;
			vec4 localBitangent;
			vec4 globalPosition;
			{
				localPosition = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
				localNormal = in_Normal * 2.0 - 1.0;
				localTangent = in_Tangent * 2.0 - 1.0;
				localTangent.w = floor( in_Tangent.w * 255.1 / 128.0 ) * 2.0 - 1.0;
			};
			{
				localBitangent.xyz = cross( localNormal.xyz, localTangent.xyz ) * localTangent.w;
				localBitangent.w = 0.0;
			};
			{
				gl_Position.x = dot4( localPosition, _va_freqHigh[0 ] );
				gl_Position.y = dot4( localPosition, _va_freqHigh[1 ] );
				gl_Position.z = dot4( localPosition, _va_freqHigh[2 ] );
				gl_Position.w = dot4( localPosition, _va_freqHigh[3 ] );
				localToGlobalX.x = dot3( localTangent, _va_freqHigh[4 ] );
				localToGlobalX.y = dot3( localBitangent, _va_freqHigh[4 ] );
				localToGlobalX.z = dot3( localNormal, _va_freqHigh[4 ] );
				localToGlobalX.w = 0.0;
				localToGlobalY.x = dot3( localTangent, _va_freqHigh[5 ] );
				localToGlobalY.y = dot3( localBitangent, _va_freqHigh[5 ] );
				localToGlobalY.z = dot3( localNormal, _va_freqHigh[5 ] );
				localToGlobalY.w = 0.0;
				localToGlobalZ.x = dot3( localTangent, _va_freqHigh[6 ] );
				localToGlobalZ.y = dot3( localBitangent, _va_freqHigh[6 ] );
				localToGlobalZ.z = dot3( localNormal, _va_freqHigh[6 ] );
				localToGlobalZ.w = 0.0;
			};
			{
				globalPosition.x = dot4( localPosition, _va_freqHigh[4 ] );
				globalPosition.y = dot4( localPosition, _va_freqHigh[5 ] );
				globalPosition.z = dot4( localPosition, _va_freqHigh[6 ] );
				globalPosition.w = 1.0;
			};
			viewOriginToVertex = globalPosition - _va_freqLow[2 ];
		};
		vofi_TexCoord2 = vec4(localToGlobalX.z, localToGlobalY.z, localToGlobalZ.z, 0.0);
		vofi_TexCoord4 = viewOriginToVertex;
		{
			vofi_TexCoord0 = ( in_TexCoord.xy * _va_freqLow[3 ].xy + _va_freqLow[3 ].zw ).xyxy;
		};
	}
}