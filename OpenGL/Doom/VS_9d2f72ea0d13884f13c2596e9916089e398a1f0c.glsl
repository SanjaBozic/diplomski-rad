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

uniform vec4 _va_freqHigh [11];
uniform vec4 _va_freqLow [3];
uniform matrices_ubo { vec4 matrices[768]; };

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec4 in_Color;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord0;

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
		vofi_TexCoord0 = in_TexCoord.xyxy;
		vec3 globalPosition;
		globalPosition.x = dot4( position, _va_freqHigh[5 ] );
		globalPosition.y = dot4( position, _va_freqHigh[6 ] );
		globalPosition.z = dot4( position, _va_freqHigh[7 ] );
		vec3 toViewer = normalize( _va_freqLow[2 ].xyz - globalPosition.xyz );
		vec3 localToViewer;
		localToViewer.x = dot3( toViewer, _va_freqHigh[8 ].xyz );
		localToViewer.y = dot3( toViewer, _va_freqHigh[9 ].xyz );
		localToViewer.z = dot3( toViewer, _va_freqHigh[10 ].xyz );
		vofi_TexCoord1.x = dot3( localToViewer, tangent.xyz );
		vofi_TexCoord1.y = dot3( localToViewer, bitangent.xyz );
		vofi_TexCoord1.z = dot3( localToViewer, normal.xyz );
		vofi_TexCoord1.w = 0.0;
	}
}