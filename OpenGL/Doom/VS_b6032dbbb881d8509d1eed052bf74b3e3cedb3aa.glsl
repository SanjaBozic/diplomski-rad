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

uniform vec4 _va_freqHigh [8];
uniform vec4 _va_freqLow [7];
uniform matrices_ubo { vec4 matrices[768]; };

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec4 in_Color;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;
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
		vec4 position;
		vec4 normal;
		vec4 tangent;
		vec4 bitangent;
		{
			float morphScale;
			{
				position = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
				normal = in_Normal * 2.0 - 1.0;
				tangent = in_Tangent * 2.0 - 1.0;
				tangent.w = floor( in_Tangent.w * 255.1 / 128.0 ) * 2.0 - 1.0;
			};
			{
				morphScale = 0.0; if ( _va_freqHigh[0 ].x != 0.0 ) {
					vec4 tempPosition = position;
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
					position.x = dot4( tempPosition, matX );
					position.y = dot4( tempPosition, matY );
					position.z = dot4( tempPosition, matZ );
					position.w = 1.0;
					vec4 tempNormal = normal;
					normal.x = dot3( tempNormal, matX );
					normal.y = dot3( tempNormal, matY );
					normal.z = dot3( tempNormal, matZ );
					vec4 tempTangent = tangent;
					tangent.x = dot3( tempTangent, matX );
					tangent.y = dot3( tempTangent, matY );
					tangent.z = dot3( tempTangent, matZ );
				}
			};
			{
				bitangent.xyz = cross( normal.xyz, tangent.xyz ) * tangent.w;
				bitangent.w = 0.0;
			};
		};
		gl_Position.x = dot4( position, _va_freqHigh[1 ] );
		gl_Position.y = dot4( position, _va_freqHigh[2 ] );
		gl_Position.z = dot4( position, _va_freqHigh[3 ] );
		gl_Position.w = dot4( position, _va_freqHigh[4 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.z = saturate( exp2( -( max( gl_Position.w - _va_freqLow[2 ].x, 0.0 ) * _va_freqLow[2 ].z ) ) );
		vofi_TexCoord0.w = exp2( -gl_Position.w * 0.001 );
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
			vofi_TexCoord4 = globalPosition - _va_freqLow[3 ];
		};
		vec3 worldPos = vec3( 0.0 );
		worldPos.x = dot4( position, _va_freqHigh[5 ] );
		worldPos.y = dot4( position, _va_freqHigh[6 ] );
		worldPos.z = dot4( position, _va_freqHigh[7 ] );
		vec3 viewDir;
		viewDir = -normalize( worldPos - _va_freqLow[3 ].xyz );
		vec3 worldNormal = vec3( 0.0 );
		worldNormal.x = dot3( normal, _va_freqHigh[5 ] );
		worldNormal.y = dot3( normal, _va_freqHigh[6 ] );
		worldNormal.z = dot3( normal, _va_freqHigh[7 ] );
		worldNormal = normalize( worldNormal );
		vec3 screenNormal = vec3( 0.0 );
		screenNormal.x = dot3( normal, _va_freqHigh[1 ] );
		screenNormal.y = dot3( normal, _va_freqHigh[2 ] );
		screenNormal.z = dot3( normal, _va_freqHigh[3 ] );
		screenNormal = normalize( screenNormal );
		vofi_TexCoord1.xy = screenNormal.xy;
		vec3 dir = vec3( 0.0 );
		dir.x = sin( _va_freqLow[4 ].x * 5.7 + in_Position.y * 0.5 );
		dir.y = sin( _va_freqLow[4 ].x * 7.1 + in_Position.z * 0.63 );
		dir.z = sin( _va_freqLow[4 ].x * 9.3 + in_Position.x * 0.77 );
		dir = normalize( dir );
		vofi_TexCoord2.x = dot3( dir, _va_freqLow[5 ] );
		vofi_TexCoord2.y = dot3( dir, _va_freqLow[6 ] );
		vec4 vertColor = in_Color;
	}
}