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

uniform vec4 _va_freqHigh [6];
uniform vec4 _va_freqLow [3];
uniform matrices_ubo { vec4 matrices[768]; };

in vec4 in_Position;
in vec4 in_Tangent;
in vec4 in_Normal;
in vec4 in_Color;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		{
			{
				vec4 localPosition;
				{
					localPosition = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
				};
				{ if ( _va_freqHigh[0 ].x != 0.0 ) {
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
					}
				};
				{
					gl_Position.x = dot4( localPosition, _va_freqHigh[1 ] );
					gl_Position.y = dot4( localPosition, _va_freqHigh[2 ] );
					gl_Position.z = dot4( localPosition, _va_freqHigh[3 ] );
					gl_Position.w = dot4( localPosition, _va_freqHigh[4 ] );
				};
			};
		};
		{
			vofi_TexCoord0 = ( in_TexCoord.xyxy * _va_freqLow[2 ].xyxy + _va_freqLow[2 ].zwzw ) + _va_freqHigh[5 ].xyzw;
		};
	}
}