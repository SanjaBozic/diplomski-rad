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
uniform vec4 _va_freqLow [2];
uniform sampler3D samp_ambientatlas;
uniform sampler3D samp_ambientshatlas;

in vec2 in_VmtrTC;
in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec4 in_VmtrSB;
in vec2 in_TexCoord;
in vec2 in_TexCoord1;
in vec4 in_Color;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord1;
out vec4 vofi_Color;
out vec4 vofi_TexCoord4;
out vec4 vofi_TexCoord3;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord8;
out vec4 vofi_TexCoord9;
out vec4 vofi_TexCoord10;

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
vec3 DecodeParticleNormal ( vec3 vertexN, vec3 camFront, float particle_curvature ) {
	const vec3 normal = ( vertexN.xyz / 255.0 ) * 2.0 - vec3( 1.0 );
	return mix( -camFront.xyz, normal, particle_curvature );
}
void main() {
	{
		vec2 atlasTilePos = vec2( in_VmtrTC.x, in_VmtrTC.y );
		gl_Position = vec4( atlasTilePos.xy * 2.0 - vec2( 1.0 ), vec2( 0, 1 ) );
		vec3 worldPos;
		worldPos.x = dot4( vec4(in_Position.xyz, 1 ), _va_freqHigh[0 ] );
		worldPos.y = dot4( vec4(in_Position.xyz, 1 ), _va_freqHigh[1 ] );
		worldPos.z = dot4( vec4(in_Position.xyz, 1 ), _va_freqHigh[2 ] );
		float emmissiveMul = in_Normal.x*10+1;
		float alphaMul = in_Normal.y*10+1;
		float alphaFade = in_Normal.w;
		float eyeDist = gl_Position.w;
		bool facingCamera = in_Tangent.y > 0.0;
		float frameFrac = in_Tangent.z;
		float depthAlphaMul = in_Tangent.w;
		float particle_curvature = in_Tangent.x;
		vec3 normal = DecodeParticleNormal( in_VmtrSB.xyz, _va_freqLow[0 ].xyz, particle_curvature );
		float thickness = ( ( 1.0 - depthAlphaMul ) * 127.0 ) / eyeDist;
		vofi_TexCoord0.xy = in_TexCoord.xy * _va_freqLow[1 ].x + _va_freqLow[1 ].y;
		vofi_TexCoord0.zw = in_TexCoord1.xy * _va_freqLow[1 ].x + _va_freqLow[1 ].y;
		vofi_TexCoord1.x = 0;
		vofi_TexCoord1.y = depthAlphaMul;
		vofi_TexCoord1.z = frameFrac;
		vofi_TexCoord1.w = alphaFade;
		float particleFade = saturate( abs( eyeDist ) / ( ( 1.0 - depthAlphaMul ) * 127.0 ) );
		vec4 vtxcol = SRGBlinearApprox( in_Color );
		vofi_Color.rgb = vtxcol.rgb;
		vofi_Color.w = particleFade * vtxcol.a * alphaMul;
		vofi_TexCoord2 = vec4( worldPos.xyz, 0 );
		vofi_TexCoord3 = vec4( normal.xyz, 0 );
		vofi_TexCoord4 = vec4( dot( vec4( in_Position.xyz, 1 ), _va_freqHigh[3 ] ),
		dot( vec4( in_Position.xyz, 1 ), _va_freqHigh[4 ] ),
		dot( vec4( in_Position.xyz, 1 ), _va_freqHigh[5 ] ),
		dot( vec4( in_Position.xyz, 1 ), _va_freqHigh[6 ] ) );
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