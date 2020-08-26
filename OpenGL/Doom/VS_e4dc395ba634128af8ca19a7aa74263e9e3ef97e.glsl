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

uniform vec4 _va_freqHigh [30];
uniform vec4 _va_freqLow [4];
uniform matrices_ubo { vec4 matrices[768]; };

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec4 in_Color;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord6;
out vec4 vofi_TexCoord7;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord3;
out vec4 vofi_TexCoord4;

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
		{
			localPosition = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
			localNormal = in_Normal * 2.0 - 1.0;
			localTangent = in_Tangent * 2.0 - 1.0;
			localTangent.w = floor( in_Tangent.w * 255.1 / 128.0 ) * 2.0 - 1.0;
		};
		{
			vec4 localBitangent;
			vec4 globalPosition;
			float morphScale;
			{
				morphScale = 0.0; if ( _va_freqHigh[0 ].x != 0.0 ) {
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
				gl_Position.x = dot4( localPosition, _va_freqHigh[1 ] );
				gl_Position.y = dot4( localPosition, _va_freqHigh[2 ] );
				gl_Position.z = dot4( localPosition, _va_freqHigh[3 ] );
				gl_Position.w = dot4( localPosition, _va_freqHigh[4 ] );
				vofi_TexCoord1.x = dot3( localTangent, _va_freqHigh[5 ] );
				vofi_TexCoord1.y = dot3( localBitangent, _va_freqHigh[5 ] );
				vofi_TexCoord1.z = dot3( localNormal, _va_freqHigh[5 ] );
				vofi_TexCoord1.w = morphScale;
				vofi_TexCoord2.x = dot3( localTangent, _va_freqHigh[6 ] );
				vofi_TexCoord2.y = dot3( localBitangent, _va_freqHigh[6 ] );
				vofi_TexCoord2.z = dot3( localNormal, _va_freqHigh[6 ] );
				vofi_TexCoord2.w = 0.0;
				vofi_TexCoord3.x = dot3( localTangent, _va_freqHigh[7 ] );
				vofi_TexCoord3.y = dot3( localBitangent, _va_freqHigh[7 ] );
				vofi_TexCoord3.z = dot3( localNormal, _va_freqHigh[7 ] );
				vofi_TexCoord3.w = 0.0;
			};
			{
				globalPosition.x = dot4( localPosition, _va_freqHigh[5 ] );
				globalPosition.y = dot4( localPosition, _va_freqHigh[6 ] );
				globalPosition.z = dot4( localPosition, _va_freqHigh[7 ] );
				globalPosition.w = 1.0;
			};
			vofi_TexCoord4 = globalPosition - _va_freqLow[2 ];
		};
		vofi_TexCoord1 = gl_Position;
		{
			vofi_TexCoord0 = ( in_TexCoord.xyxy * _va_freqLow[3 ].xyxy + _va_freqLow[3 ].zwzw ) + _va_freqHigh[8 ].xyzw;
		};
		{
			vec3 vertexPos = in_Position.xyz;
			vofi_TexCoord6 = vec4( 0.0 );
			vec3 wound3A =( _va_freqHigh[9 ].xyz - vertexPos.xyz ) * _va_freqHigh[9 ].w;
			vec3 wound3B =( _va_freqHigh[10 ].xyz - vertexPos.xyz ) * _va_freqHigh[10 ].w;
			vec3 wound3C =( _va_freqHigh[11 ].xyz - vertexPos.xyz ) * _va_freqHigh[11 ].w;
			vec3 wound3D =( _va_freqHigh[12 ].xyz - vertexPos.xyz ) * _va_freqHigh[12 ].w;
			vec3 wound3E =( _va_freqHigh[13 ].xyz - vertexPos.xyz ) * _va_freqHigh[13 ].w;
			vec3 wound3F =( _va_freqHigh[14 ].xyz - vertexPos.xyz ) * _va_freqHigh[14 ].w;
			vec3 wound3G =( _va_freqHigh[15 ].xyz - vertexPos.xyz ) * _va_freqHigh[15 ].w;
			vec3 wound3H =( _va_freqHigh[16 ].xyz - vertexPos.xyz ) * _va_freqHigh[16 ].w;
			vec3 wound3I =( _va_freqHigh[17 ].xyz - vertexPos.xyz ) * _va_freqHigh[17 ].w;
			vec3 wound3J =( _va_freqHigh[18 ].xyz - vertexPos.xyz ) * _va_freqHigh[18 ].w;
			vec3 wound3K =( _va_freqHigh[19 ].xyz - vertexPos.xyz ) * _va_freqHigh[19 ].w;
			vec3 wound3L =( _va_freqHigh[20 ].xyz - vertexPos.xyz ) * _va_freqHigh[20 ].w;
			vec3 wound3M =( _va_freqHigh[21 ].xyz - vertexPos.xyz ) * _va_freqHigh[21 ].w;
			vec3 wound3N =( _va_freqHigh[22 ].xyz - vertexPos.xyz ) * _va_freqHigh[22 ].w;
			vec3 wound3O =( _va_freqHigh[23 ].xyz - vertexPos.xyz ) * _va_freqHigh[23 ].w;
			vec3 wound3P =( _va_freqHigh[24 ].xyz - vertexPos.xyz ) * _va_freqHigh[24 ].w;
			vec3 wound3Q =( _va_freqHigh[25 ].xyz - vertexPos.xyz ) * _va_freqHigh[25 ].w;
			vec3 wound3R =( _va_freqHigh[26 ].xyz - vertexPos.xyz ) * _va_freqHigh[26 ].w;
			vec3 wound3S =( _va_freqHigh[27 ].xyz - vertexPos.xyz ) * _va_freqHigh[27 ].w;
			vec3 wound3T =( _va_freqHigh[28 ].xyz - vertexPos.xyz ) * _va_freqHigh[28 ].w;
			float wound3A_DOT = dot3( wound3A,wound3A );
			float wound3B_DOT = dot3( wound3B,wound3B );
			float wound3C_DOT = dot3( wound3C,wound3C );
			float wound3D_DOT = dot3( wound3D,wound3D );
			float wound3E_DOT = dot3( wound3E,wound3E );
			float wound3F_DOT = dot3( wound3F,wound3F );
			float wound3G_DOT = dot3( wound3G,wound3G );
			float wound3H_DOT = dot3( wound3H,wound3H );
			float wound3I_DOT = dot3( wound3I,wound3I );
			float wound3J_DOT = dot3( wound3J,wound3J );
			float wound3K_DOT = dot3( wound3K,wound3K );
			float wound3L_DOT = dot3( wound3L,wound3L );
			float wound3M_DOT = dot3( wound3M,wound3M );
			float wound3N_DOT = dot3( wound3N,wound3N );
			float wound3O_DOT = dot3( wound3O,wound3O );
			float wound3P_DOT = dot3( wound3P,wound3P );
			float wound3Q_DOT = dot3( wound3Q,wound3Q );
			float wound3R_DOT = dot3( wound3R,wound3R );
			float wound3S_DOT = dot3( wound3S,wound3S );
			float wound3T_DOT = dot3( wound3T,wound3T );
			float mask;
			mask = min( wound3A_DOT, wound3B_DOT );
			mask = min( mask, wound3C_DOT );
			mask = min( mask, wound3D_DOT );
			mask = min( mask, wound3E_DOT );
			mask = min( mask, wound3F_DOT );
			mask = min( mask, wound3G_DOT );
			mask = min( mask, wound3H_DOT );
			mask = min( mask, wound3K_DOT );
			mask = min( mask, wound3L_DOT );
			mask = min( mask, wound3M_DOT );
			mask = min( mask, wound3N_DOT );
			mask = min( mask, wound3O_DOT );
			mask = min( mask, wound3P_DOT );
			mask = min( mask, wound3Q_DOT );
			mask = min( mask, wound3R_DOT );
			float bloodSphereMask = sqrt( min( mask, min( min( wound3S_DOT, wound3T_DOT ), min( wound3I_DOT, wound3J_DOT ) ) ) ) - 1.0;
			float woundMask = sqrt( mask ) - 1.0;
			vofi_TexCoord6 = vec4( bloodSphereMask, 0.0, 0.0, woundMask );
		};
		vofi_TexCoord7.xy = vofi_TexCoord0.xy * _va_freqHigh[29 ].xy;
		vofi_TexCoord7.zw = vec2( 0.0 );
		gl_Position.z -= 0.01;
	}
}