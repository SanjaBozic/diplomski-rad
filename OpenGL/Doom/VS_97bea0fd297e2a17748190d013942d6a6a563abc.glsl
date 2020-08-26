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

uniform vec4 _va_freqHigh [13];
uniform vec4 _va_freqLow [8];
uniform matrices_ubo { vec4 matrices[768]; };

in vec4 in_Position;
in vec4 in_Tangent;
in vec4 in_Normal;
in vec4 in_Color;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;
out vec4 vofi_Color;
out vec4 vofi_TexCoord6;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
float SRGBlinearApprox ( float value ) {
	return value * ( value * ( value * 0.305306011 + 0.682171111 ) + 0.012522878 );
}
vec3 SRGBlinearApprox ( vec3 sRGB ) {
	vec3 outLinear;
	outLinear.r = SRGBlinearApprox( sRGB.r );
	outLinear.g = SRGBlinearApprox( sRGB.g );
	outLinear.b = SRGBlinearApprox( sRGB.b );
	return outLinear;
}
vec4 SRGBlinearApprox ( vec4 sRGBA ) {
	vec4 outLinear = vec4( SRGBlinearApprox( sRGBA.rgb ), 1 );
	outLinear.a = SRGBlinearApprox( sRGBA.a );
	return outLinear;
}
void main() {
	{
		vec4 texcoord0;
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
			texcoord0 = ( in_TexCoord.xy * _va_freqLow[2 ].xy + _va_freqLow[2 ].zw ).xyxy;
		};
		vofi_TexCoord0.x = dot4( texcoord0.xy, _va_freqHigh[5 ] );
		vofi_TexCoord0.y = dot4( texcoord0.xy, _va_freqHigh[6 ] );
		vofi_TexCoord0.zw = vec2( 0.0 );
		vofi_Color = _va_freqHigh[7 ] * _va_freqHigh[8 ].x * _va_freqHigh[9 ] * SRGBlinearApprox( in_Color );
		vec3 worldPos;
		worldPos.x = dot4( vec4(in_Position.xyz, 1 ), _va_freqHigh[10 ] );
		worldPos.y = dot4( vec4(in_Position.xyz, 1 ), _va_freqHigh[11 ] );
		worldPos.z = dot4( vec4(in_Position.xyz, 1 ), _va_freqHigh[12 ] );
		{
			float FLT_EPSILON = 0.0001;
			float heightFogAmount = 0.0;
			float inscatterAlpha = 0.0;
			float distanceFogAmount = 1.0 - saturate( exp2( -( clamp( gl_Position.w - _va_freqLow[3 ].x, 0.0, _va_freqLow[3 ].y ) * _va_freqLow[3 ].z ) ) );
			if ( _va_freqLow[4 ].z < 1.0 ) {
				vec3 cameraToPixel = worldPos - _va_freqLow[5 ].xyz;
				float distanceToPixel = length( cameraToPixel );
				float be = _va_freqLow[4 ].x * exp2( - _va_freqLow[6 ].w * ( _va_freqLow[5 ].z - _va_freqLow[6 ].x ) );
				float distanceInFog = max( distanceToPixel - _va_freqLow[4 ].y, 0.0 );
				float effectiveZ = max( cameraToPixel.z, FLT_EPSILON );
				if ( cameraToPixel.z < -FLT_EPSILON ) {
					effectiveZ = cameraToPixel.z;
				}
				float lineIntegral = be * distanceInFog;
				lineIntegral *= ( 1.0 - exp2( - _va_freqLow[6 ].w * effectiveZ ) ) / ( _va_freqLow[6 ].w * effectiveZ );
				heightFogAmount = 1.0 - max( saturate( exp2( -lineIntegral ) ), _va_freqLow[4 ].z );
				float cosL = dot( _va_freqLow[7 ].xyz, normalize( cameraToPixel ) );
				float blendValue = saturate( ( cosL - _va_freqLow[6 ].y ) * _va_freqLow[6 ].z );
				inscatterAlpha = 1.0 - ( blendValue * blendValue );
			}
			vofi_TexCoord6.x = distanceFogAmount;
			vofi_TexCoord6.y = heightFogAmount;
			vofi_TexCoord6.z = inscatterAlpha;
			vofi_TexCoord6.w = 0.0;
		};
	}
}