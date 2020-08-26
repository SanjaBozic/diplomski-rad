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
uniform vec4 _va_freqLow [4];
uniform sampler3D samp_ambientatlas;
uniform sampler3D samp_ambientshatlas;

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord4;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord3;
out vec4 vofi_TexCoord8;
out vec4 vofi_TexCoord9;
out vec4 vofi_TexCoord10;

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
				vofi_TexCoord1.x = dot3( localTangent, _va_freqHigh[4 ] );
				vofi_TexCoord1.y = dot3( localBitangent, _va_freqHigh[4 ] );
				vofi_TexCoord1.z = dot3( localNormal, _va_freqHigh[4 ] );
				vofi_TexCoord1.w = 0.0;
				vofi_TexCoord2.x = dot3( localTangent, _va_freqHigh[5 ] );
				vofi_TexCoord2.y = dot3( localBitangent, _va_freqHigh[5 ] );
				vofi_TexCoord2.z = dot3( localNormal, _va_freqHigh[5 ] );
				vofi_TexCoord2.w = 0.0;
				vofi_TexCoord3.x = dot3( localTangent, _va_freqHigh[6 ] );
				vofi_TexCoord3.y = dot3( localBitangent, _va_freqHigh[6 ] );
				vofi_TexCoord3.z = dot3( localNormal, _va_freqHigh[6 ] );
				vofi_TexCoord3.w = 0.0;
			};
			{
				globalPosition.x = dot4( localPosition, _va_freqHigh[4 ] );
				globalPosition.y = dot4( localPosition, _va_freqHigh[5 ] );
				globalPosition.z = dot4( localPosition, _va_freqHigh[6 ] );
				globalPosition.w = 1.0;
			};
			vofi_TexCoord4 = globalPosition - _va_freqLow[2 ];
		};
		{
			vofi_TexCoord0 = ( in_TexCoord.xy * _va_freqLow[3 ].xy + _va_freqLow[3 ].zw ).xyxy;
		};
		vec3 worldPos = vofi_TexCoord4.xyz + _va_freqLow[2 ].xyz;
		{
			if ( _va_freqHigh[7 ].x > 0.0 && _va_freqHigh[7 ].y > 0.0 ) {
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
				vec4 sampleSHR = tex3Dlod( samp_ambientshatlas, vec4( shTC.xy, shTC.z + ( atlasSHCubeSize.z * 0.0 ), 0.0 ) ) * _va_freqHigh[7 ].y;
				vec4 sampleSHG = tex3Dlod( samp_ambientshatlas, vec4( shTC.xy, shTC.z + ( atlasSHCubeSize.z * 1.0 ), 0.0 ) ) * _va_freqHigh[7 ].y;
				vec4 sampleSHB = tex3Dlod( samp_ambientshatlas, vec4( shTC.xy, shTC.z + ( atlasSHCubeSize.z * 2.0 ), 0.0 ) ) * _va_freqHigh[7 ].y;
				vofi_TexCoord8 = vec4( sampleSHR.x, sampleSHG.x, sampleSHB.x, sampleSHR.y );
				vofi_TexCoord9 = vec4( sampleSHG.y, sampleSHB.y, sampleSHR.z, sampleSHG.z );
				vofi_TexCoord10 = vec4( sampleSHB.z, sampleSHR.w, sampleSHG.w, sampleSHB.w );
			} else {
				vofi_TexCoord8 = vec4( 0.0 );
				vofi_TexCoord9 = vec4( 0.0 );
				vofi_TexCoord10 = vec4( 0.0 );
			}
		};
	}
}