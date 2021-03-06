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
uniform vec4 _va_freqLow [8];
uniform matrices_ubo { vec4 matrices[768]; };
uniform sampler3D samp_ambientatlas;
uniform sampler3D samp_ambientshatlas;

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec4 in_Color;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord4;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord3;
out vec4 vofi_TexCoord8;
out vec4 vofi_TexCoord9;
out vec4 vofi_TexCoord10;
out vec4 vofi_TexCoord5;
out vec4 vofi_TexCoord6;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
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
				mat3x3 correctionMatrix;
				correctionMatrix[0].xyz = _va_freqHigh[5 ].xyz;
				correctionMatrix[1].xyz = _va_freqHigh[6 ].xyz;
				correctionMatrix[2].xyz = _va_freqHigh[7 ].xyz;
				correctionMatrix = transpose( correctionMatrix );
				vofi_TexCoord1.x = dot3( localTangent, correctionMatrix[0] );
				vofi_TexCoord1.y = dot3( localBitangent, correctionMatrix[0] );
				vofi_TexCoord1.z = dot3( localNormal, correctionMatrix[0] );
				vofi_TexCoord1.xyz = normalize( vofi_TexCoord1.xyz );
				vofi_TexCoord1.w = morphScale;
				vofi_TexCoord2.x = dot3( localTangent, correctionMatrix[1] );
				vofi_TexCoord2.y = dot3( localBitangent, correctionMatrix[1] );
				vofi_TexCoord2.z = dot3( localNormal, correctionMatrix[1] );
				vofi_TexCoord2.xyz = normalize( vofi_TexCoord2.xyz );
				vofi_TexCoord2.w = 0.0;
				vofi_TexCoord3.x = dot3( localTangent, correctionMatrix[2] );
				vofi_TexCoord3.y = dot3( localBitangent, correctionMatrix[2] );
				vofi_TexCoord3.z = dot3( localNormal, correctionMatrix[2] );
				vofi_TexCoord3.xyz = normalize( vofi_TexCoord3.xyz );
				vofi_TexCoord3.w = 0.0;
			};
			{
				globalPosition.x = dot4( localPosition, _va_freqHigh[8 ] );
				globalPosition.y = dot4( localPosition, _va_freqHigh[9 ] );
				globalPosition.z = dot4( localPosition, _va_freqHigh[10 ] );
				globalPosition.w = 1.0;
			};
			vofi_TexCoord4 = globalPosition - _va_freqLow[2 ];
		};
		{
			vofi_TexCoord0 = ( in_TexCoord.xyxy * _va_freqLow[3 ].xyxy + _va_freqLow[3 ].zwzw ) + _va_freqHigh[11 ].xyzw;
		};
		vec3 worldPos = vofi_TexCoord4.xyz + _va_freqLow[2 ].xyz;
		{
			if ( _va_freqHigh[12 ].x > 0.0 && _va_freqHigh[12 ].y > 0.0 ) {
				float AMBIENT_MIN_WORLD = -32 * 1024;
				float AMBIENT_MAX_WORLD = 32 * 1024;
				float ambientAtlasWidth = 256;
				float ambientAtlasHeight = 256;
				float ambientAtlasDepth = 32;
				float ambientSHAtlasWidth = 256;
				float ambientSHAtlasHeight = 256;
				float ambientSHAtlasDepth = 96;
				vec3 atlasSHPixelSize = vec3(
				1.0 / ambientSHAtlasWidth,
				1.0 / ambientSHAtlasHeight,
				1.0 / ambientSHAtlasDepth
				);
				vec3 atlasSHCubeSize = vec3(
				2.0 / ambientSHAtlasWidth,
				2.0 / ambientSHAtlasHeight,
				2.0 / ambientSHAtlasDepth
				);
				vec3 atlasPixelSize = vec3(
				1.0 / ambientAtlasWidth,
				1.0 / ambientAtlasHeight,
				1.0 / ambientAtlasDepth
				);
				float leafWidth = 1.0 / ( AMBIENT_MAX_WORLD - AMBIENT_MIN_WORLD );
				vec3 normSamplePoint = saturate( ( worldPos - vec3( AMBIENT_MIN_WORLD ) ) * leafWidth );
				vec4 atlasSample = vec4( 0.0 );
				uvec3 octantIndices = uvec3( 0, 0, 0 );
				for ( uint i = 0; i < 10; ++i ) {
					vec3 atlasQuadrant = vec3( 0.5 ) + floor( vec3( 2.0 ) * normSamplePoint );
					vec4 atlasTC = vec4( atlasPixelSize * ( octantIndices + atlasQuadrant ), 0.0 );
					atlasSample = tex3Dlod( samp_ambientatlas, atlasTC );
					normSamplePoint = fract( normSamplePoint * vec3( 2.0 ) );
					octantIndices = uvec3( atlasSample.zyx * vec3( 255.0 ) );
					if ( atlasSample.w > 0.0 ) {
						break;
					}
				}
				uint ambientSHHashKey =
				( uint( atlasSample.w * 255.0 ) << 24 ) |
				( uint( atlasSample.z * 255.0 ) << 16 ) |
				( uint( atlasSample.y * 255.0 ) << 8 ) |
				( uint( atlasSample.x * 255.0 )
				);
				uvec3 ambientSHKey = uvec3(
				( ambientSHHashKey >> 19) & 0x00000FFF,
				( ambientSHHashKey >> 7 ) & 0x00000FFF,
				( ambientSHHashKey & 0x0000007F )
				);
				vec3 shQuadrant = vec3( 2.0 ) * ( normSamplePoint * vec3( 0.50 ) + vec3( 0.25 ) );
				vec4 shTC = vec4( atlasSHPixelSize * ( ambientSHKey + shQuadrant ), 0.0 );
				vec4 sampleSHR = tex3Dlod( samp_ambientshatlas, vec4( shTC.xy, shTC.z + ( atlasSHCubeSize.z * 0.0 ), 0.0 ) ) * _va_freqHigh[12 ].y;
				vec4 sampleSHG = tex3Dlod( samp_ambientshatlas, vec4( shTC.xy, shTC.z + ( atlasSHCubeSize.z * 1.0 ), 0.0 ) ) * _va_freqHigh[12 ].y;
				vec4 sampleSHB = tex3Dlod( samp_ambientshatlas, vec4( shTC.xy, shTC.z + ( atlasSHCubeSize.z * 2.0 ), 0.0 ) ) * _va_freqHigh[12 ].y;
				vofi_TexCoord8 = vec4( sampleSHR.x, sampleSHG.x, sampleSHB.x, sampleSHR.y );
				vofi_TexCoord9 = vec4( sampleSHG.y, sampleSHB.y, sampleSHR.z, sampleSHG.z );
				vofi_TexCoord10 = vec4( sampleSHB.z, sampleSHR.w, sampleSHG.w, sampleSHB.w );
			} else {
				vofi_TexCoord8 = vec4( 0.0 );
				vofi_TexCoord9 = vec4( 0.0 );
				vofi_TexCoord10 = vec4( 0.0 );
			}
		};
		{
			float FLT_EPSILON = 0.0001;
			float heightFogAmount = 0.0;
			float inscatterAlpha = 0.0;
			float distanceFogAmount = 1.0 - saturate( exp2( -( clamp( gl_Position.w - _va_freqLow[4 ].x, 0.0, _va_freqLow[4 ].y ) * _va_freqLow[4 ].z ) ) );
			if ( _va_freqLow[5 ].z < 1.0 ) {
				vec3 cameraToPixel = worldPos - _va_freqLow[2 ].xyz;
				float distanceToPixel = length( cameraToPixel );
				float be = _va_freqLow[5 ].x * exp2( - _va_freqLow[6 ].w * ( _va_freqLow[2 ].z - _va_freqLow[6 ].x ) );
				float distanceInFog = max( distanceToPixel - _va_freqLow[5 ].y, 0.0 );
				float effectiveZ = max( cameraToPixel.z, FLT_EPSILON );
				if ( cameraToPixel.z < -FLT_EPSILON ) {
					effectiveZ = cameraToPixel.z;
				}
				float lineIntegral = be * distanceInFog;
				lineIntegral *= ( 1.0 - exp2( - _va_freqLow[6 ].w * effectiveZ ) ) / ( _va_freqLow[6 ].w * effectiveZ );
				heightFogAmount = 1.0 - max( saturate( exp2( -lineIntegral ) ), _va_freqLow[5 ].z );
				float cosL = dot( _va_freqLow[7 ].xyz, normalize( cameraToPixel ) );
				float blendValue = saturate( ( cosL - _va_freqLow[6 ].y ) * _va_freqLow[6 ].z );
				inscatterAlpha = 1.0 - ( blendValue * blendValue );
			}
			vofi_TexCoord6.x = distanceFogAmount;
			vofi_TexCoord6.y = heightFogAmount;
			vofi_TexCoord6.z = inscatterAlpha;
			vofi_TexCoord6.w = 0.0;
		};
		vec4 normal = in_Normal * 2.0 - 1.0;
		normal.xyz = normalize( normal.xyz );
		float uvScaleFactor = .00234375;
		vec2 uv = vec2( 0 );
		vec3 scales;
		scales.x = length( vec3( _va_freqHigh[8 ].x, _va_freqHigh[9 ].x, _va_freqHigh[10 ].x ) );
		scales.y = length( vec3( _va_freqHigh[8 ].y, _va_freqHigh[9 ].y, _va_freqHigh[10 ].y ) );
		scales.z = length( vec3( _va_freqHigh[8 ].z, _va_freqHigh[9 ].z, _va_freqHigh[10 ].z ) );
		vec4 localPosition;
		{
			localPosition = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		};
		localPosition.x *= scales.x;
		localPosition.y *= scales.y;
		localPosition.z *= scales.z;
		localPosition.z -= (scales.z * 0.5);
		vec3 absNormal;
		absNormal.x = abs( normal.x );
		absNormal.y = abs( normal.y );
		absNormal.z = abs( normal.z );
		if ( absNormal.x > absNormal.y && absNormal.x > absNormal.z ) {
			uv = (scales.yz * 0.5 * -uvScaleFactor) + (localPosition.yz * -uvScaleFactor);
		} else if ( absNormal.y > absNormal.z && absNormal.y > absNormal.x ) {
			uv = (scales.xz * 0.5 * -uvScaleFactor) + (localPosition.xz * -uvScaleFactor);
		} else {
			uv = (scales.xy * 0.5 * -uvScaleFactor) + (localPosition.xy * -uvScaleFactor);
		}
		vofi_TexCoord0.xy = uv.xy * _va_freqHigh[13 ].xy;
		vofi_TexCoord5 = vec4( 0.0 );
	}
}