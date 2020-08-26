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

uniform vec4 _va_freqHigh [9];
uniform vec4 _va_freqLow [7];
uniform matrices_ubo { vec4 matrices[768]; };

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec4 in_Color;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord1;
out vec4 vofi_Color;
out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord6;
out vec4 vofi_TexCoord2;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
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
		vofi_TexCoord0.z = 1.0;
		vec3 globalPos = vec3( 0.0 );
		globalPos.x = dot4( position, _va_freqHigh[5 ] );
		globalPos.y = dot4( position, _va_freqHigh[6 ] );
		globalPos.z = dot4( position, _va_freqHigh[7 ] );
		{
			float FLT_EPSILON = 0.0001;
			float heightFogAmount = 0.0;
			float inscatterAlpha = 0.0;
			float distanceFogAmount = 1.0 - saturate( exp2( -( clamp( gl_Position.w - _va_freqLow[2 ].x, 0.0, _va_freqLow[2 ].y ) * _va_freqLow[2 ].z ) ) );
			if ( _va_freqLow[3 ].z < 1.0 ) {
				vec3 cameraToPixel = globalPos - _va_freqLow[4 ].xyz;
				float distanceToPixel = length( cameraToPixel );
				float be = _va_freqLow[3 ].x * exp2( - _va_freqLow[5 ].w * ( _va_freqLow[4 ].z - _va_freqLow[5 ].x ) );
				float distanceInFog = max( distanceToPixel - _va_freqLow[3 ].y, 0.0 );
				float effectiveZ = max( cameraToPixel.z, FLT_EPSILON );
				if ( cameraToPixel.z < -FLT_EPSILON ) {
					effectiveZ = cameraToPixel.z;
				}
				float lineIntegral = be * distanceInFog;
				lineIntegral *= ( 1.0 - exp2( - _va_freqLow[5 ].w * effectiveZ ) ) / ( _va_freqLow[5 ].w * effectiveZ );
				heightFogAmount = 1.0 - max( saturate( exp2( -lineIntegral ) ), _va_freqLow[3 ].z );
				float cosL = dot( _va_freqLow[6 ].xyz, normalize( cameraToPixel ) );
				float blendValue = saturate( ( cosL - _va_freqLow[5 ].y ) * _va_freqLow[5 ].z );
				inscatterAlpha = 1.0 - ( blendValue * blendValue );
			}
			vofi_TexCoord6.x = distanceFogAmount;
			vofi_TexCoord6.y = heightFogAmount;
			vofi_TexCoord6.z = inscatterAlpha;
			vofi_TexCoord6.w = 0.0;
		};
		vec4 localCenter = vec4( 0.0, 0.0, 0.0, 1.0 );
		vec3 worldCenter = vec3( 0.0 );
		worldCenter.x = dot4( localCenter, _va_freqHigh[5 ] );
		worldCenter.y = dot4( localCenter, _va_freqHigh[6 ] );
		worldCenter.z = dot4( localCenter, _va_freqHigh[7 ] );
		vec3 globalNormal = vec3( 0.0 );
		globalNormal.x = dot3( normal, _va_freqHigh[5 ] );
		globalNormal.y = dot3( normal, _va_freqHigh[6 ] );
		globalNormal.z = dot3( normal, _va_freqHigh[7 ] );
		globalNormal = normalize( globalNormal );
		vec3 toViewerTS = normalize( _va_freqLow[4 ].xyz - globalPos.xyz );
		float falloff = saturate( abs( dot( globalNormal, toViewerTS ) ) );
		float diameter = length( globalPos - worldCenter ) * 2.0;
		float distance = length( _va_freqLow[4 ].xyz - globalPos.xyz );
		float scale = saturate( distance / diameter );
		vofi_TexCoord1.x = falloff;
		vofi_TexCoord1.y = scale;
		vofi_TexCoord1.z = diameter;
		vofi_TexCoord1.w = falloff * falloff;
		vofi_TexCoord2.zw = vec2( 0.0 );
		vofi_Color = _va_freqHigh[8 ];
		vofi_Color.w *= SRGBlinearApprox( in_Color.x );
	}
}