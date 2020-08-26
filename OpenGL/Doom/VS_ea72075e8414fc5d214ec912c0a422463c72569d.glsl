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

uniform vec4 _va_freqHigh [14];
uniform vec4 _va_freqLow [6];
uniform matrices_ubo { vec4 matrices[768]; };

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec4 in_Color;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;
out vec4 vofi_Color;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord3;
out vec4 vofi_TexCoord4;
out vec4 vofi_TexCoord5;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 localPosition;
		vec4 localNormal;
		vec4 localTangent;
		vec4 localBitangent;
		vec4 globalPosition;
		float morphScale;
		{
			localPosition = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
			localNormal = in_Normal * 2.0 - 1.0;
			localTangent = in_Tangent * 2.0 - 1.0;
			localTangent.w = floor( in_Tangent.w * 255.1 / 128.0 ) * 2.0 - 1.0;
		};
		vec4 vertexColor = in_Color;
		float globMask = sin( _va_freqLow[2 ].x * 7.0 - in_TexCoord.y * 5.0 + localPosition.x * 0.003 + localPosition.y * 0.003 + vertexColor.z * 3.0 );
		globMask += sin( _va_freqLow[2 ].x * 5.0 - in_TexCoord.y * 11.0 + localPosition.x * 0.01 + localPosition.y * 0.01 + vertexColor.z * 3.0 );
		localPosition.xyz += localNormal.xyz * vec3( globMask * 2.0 * vertexColor.y ) * _va_freqHigh[0 ].x;
		{
			morphScale = 0.0; if ( _va_freqHigh[1 ].x != 0.0 ) {
				vec4 tempPosition = localPosition;
				vec4 matX = vec4( 0 ), matY = vec4( 0 ), matZ = vec4( 0 );
				{
					vec4 weights;
					{
						float hiweight = in_Tangent.w * 255.1;
						weights[ 1 ] = hiweight - floor( hiweight / 128.0 ) * 128.0;
						float packedWeights = in_Normal.w * 255.1;
						weights[ 2 ] = floor( packedWeights / 16.0 );
						weights[ 3 ] = packedWeights - ( weights[ 2 ] * 16.0 );
						weights[ 1 ] *= 1.0 / 254.0;
						weights[ 2 ] *= 1.0 / 45.0;
						weights[ 3 ] *= 1.0 / 60.0;
						weights[ 0 ] = 1 - ( weights[ 1 ] + weights[ 2 ] + weights[ 3 ] );
					};
					uvec4 indices = uvec4( in_Color * 255.0 ); for( uint i = 0; i < 4; i++ ) {
						matX += matrices[ indices[ i ] * 3 + 0 ] * weights[ i ];
					} for( uint i = 0; i < 4; i++ ) {
						matY += matrices[ indices[ i ] * 3 + 1 ] * weights[ i ];
					} for( uint i = 0; i < 4; i++ ) {
						matZ += matrices[ indices[ i ] * 3 + 2 ] * weights[ i ];
					}
				};
				localPosition.x = dot4( tempPosition, matX );
				localPosition.y = dot4( tempPosition, matY );
				localPosition.z = dot4( tempPosition, matZ );
				localPosition.w = 1.0;
				vec4 tempNormal = localNormal;
				localNormal.x = dot3( tempNormal, matX );
				localNormal.y = dot3( tempNormal, matY );
				localNormal.z = dot3( tempNormal, matZ );
				vec4 tempTangent = localTangent;
				localTangent.x = dot3( tempTangent, matX );
				localTangent.y = dot3( tempTangent, matY );
				localTangent.z = dot3( tempTangent, matZ );
			}
		};
		{
			localBitangent.xyz = cross( localNormal.xyz, localTangent.xyz ) * localTangent.w;
			localBitangent.w = 0.0;
		};
		{
			gl_Position.x = dot4( localPosition, _va_freqHigh[2 ] );
			gl_Position.y = dot4( localPosition, _va_freqHigh[3 ] );
			gl_Position.z = dot4( localPosition, _va_freqHigh[4 ] );
			gl_Position.w = dot4( localPosition, _va_freqHigh[5 ] );
			vofi_TexCoord1.x = dot3( localTangent, _va_freqHigh[6 ] );
			vofi_TexCoord1.y = dot3( localBitangent, _va_freqHigh[6 ] );
			vofi_TexCoord1.z = dot3( localNormal, _va_freqHigh[6 ] );
			vofi_TexCoord1.w = morphScale;
			vofi_TexCoord2.x = dot3( localTangent, _va_freqHigh[7 ] );
			vofi_TexCoord2.y = dot3( localBitangent, _va_freqHigh[7 ] );
			vofi_TexCoord2.z = dot3( localNormal, _va_freqHigh[7 ] );
			vofi_TexCoord2.w = 0.0;
			vofi_TexCoord3.x = dot3( localTangent, _va_freqHigh[8 ] );
			vofi_TexCoord3.y = dot3( localBitangent, _va_freqHigh[8 ] );
			vofi_TexCoord3.z = dot3( localNormal, _va_freqHigh[8 ] );
			vofi_TexCoord3.w = 0.0;
		};
		{
			globalPosition.x = dot4( localPosition, _va_freqHigh[6 ] );
			globalPosition.y = dot4( localPosition, _va_freqHigh[7 ] );
			globalPosition.z = dot4( localPosition, _va_freqHigh[8 ] );
			globalPosition.w = 1.0;
		};
		vofi_TexCoord4 = globalPosition - _va_freqLow[3 ];
		{
			vofi_TexCoord0 = ( in_TexCoord.xyxy * _va_freqLow[4 ].xyxy + _va_freqLow[4 ].zwzw ) + _va_freqHigh[9 ].xyzw;
		};
		vofi_TexCoord5.x = globalPosition.x;
		vofi_TexCoord5.y = globalPosition.y;
		vofi_TexCoord5.z = globalPosition.z;
		vofi_TexCoord5.w = - dot4( globalPosition, _va_freqLow[5 ] );
		float test = 1.0 - step( 1.0, in_Color.w );
		float overbright = ( 1.0 - test ) + ( in_Color.w * 16.0 * test );
		vofi_Color.xyz = _va_freqHigh[10 ].xyz * _va_freqHigh[11 ].x * _va_freqHigh[12 ].x * _va_freqHigh[13 ].xyz * in_Color.xyz * overbright;
		vofi_Color.w = saturate( _va_freqHigh[10 ].w * _va_freqHigh[13 ].w );
	}
}