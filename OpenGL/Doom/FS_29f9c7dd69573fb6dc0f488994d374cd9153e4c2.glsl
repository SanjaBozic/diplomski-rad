#version 430 core
#extension GL_ARB_shader_clock : enable
void clip( float v ) { if ( v < 0.0 ) { discard; } }
void clip( vec2 v ) { if ( any( lessThan( v, vec2( 0.0 ) ) ) ) { discard; } }
void clip( vec3 v ) { if ( any( lessThan( v, vec3( 0.0 ) ) ) ) { discard; } }
void clip( vec4 v ) { if ( any( lessThan( v, vec4( 0.0 ) ) ) ) { discard; } }

float saturate( float v ) { return clamp( v, 0.0, 1.0 ); }
vec2 saturate( vec2 v ) { return clamp( v, 0.0, 1.0 ); }
vec3 saturate( vec3 v ) { return clamp( v, 0.0, 1.0 ); }
vec4 saturate( vec4 v ) { return clamp( v, 0.0, 1.0 ); }

vec4 tex2D( sampler2D image, vec2 texcoord ) { return texture( image, texcoord.xy ); }
vec4 tex2D( sampler2DShadow image, vec3 texcoord ) { return vec4( texture( image, texcoord.xyz ) ); }
vec4 tex2DARRAY( sampler2DArray image, vec3 texcoord ) { return texture( image, texcoord.xyz ); }

vec4 tex2D( sampler2D image, vec2 texcoord, vec2 dx, vec2 dy ) { return textureGrad( image, texcoord.xy, dx, dy ); }
vec4 tex2D( sampler2DShadow image, vec3 texcoord, vec2 dx, vec2 dy ) { return vec4( textureGrad( image, texcoord.xyz, dx, dy ) ); }
vec4 tex2DARRAY( sampler2DArray image, vec3 texcoord, vec2 dx, vec2 dy ) { return textureGrad( image, texcoord.xyz, dx, dy ); }

vec4 texCUBE( samplerCube image, vec3 texcoord ) { return texture( image, texcoord.xyz ); }
vec4 texCUBE( samplerCubeShadow image, vec4 texcoord ) { return vec4( texture( image, texcoord.xyzw ) ); }
vec4 texCUBEARRAY( samplerCubeArray image, vec4 texcoord ) { return texture( image, texcoord.xyzw ); }

vec4 tex1Dproj( sampler1D image, vec2 texcoord ) { return textureProj( image, texcoord ); }
vec4 tex2Dproj( sampler2D image, vec3 texcoord ) { return textureProj( image, texcoord ); }
vec4 tex3Dproj( sampler3D image, vec4 texcoord ) { return textureProj( image, texcoord ); }

vec4 tex1Dbias( sampler1D image, vec4 texcoord ) { return texture( image, texcoord.x, texcoord.w ); }
vec4 tex2Dbias( sampler2D image, vec4 texcoord ) { return texture( image, texcoord.xy, texcoord.w ); }
vec4 tex2DARRAYbias( sampler2DArray image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 tex3Dbias( sampler3D image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEbias( samplerCube image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEARRAYbias( samplerCubeArray image, vec4 texcoord, float bias ) { return texture( image, texcoord.xyzw, bias); }

vec4 tex1Dlod( sampler1D image, vec4 texcoord ) { return textureLod( image, texcoord.x, texcoord.w ); }
vec4 tex2Dlod( sampler2D image, vec4 texcoord ) { return textureLod( image, texcoord.xy, texcoord.w ); }
vec4 tex2DARRAYlod( sampler2DArray image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 tex3Dlod( sampler3D image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBElod( samplerCube image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEARRAYlod( samplerCubeArray image, vec4 texcoord, float lod ) { return textureLod( image, texcoord.xyzw, lod ); }

vec4 tex2DGatherRed( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 0 ); }
vec4 tex2DGatherGreen( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 1 ); }
vec4 tex2DGatherBlue( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 2 ); }
vec4 tex2DGatherAlpha( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 3 ); }

vec4 tex2DGatherOffsetRed( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 0 ); }
vec4 tex2DGatherOffsetGreen( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 1 ); }
vec4 tex2DGatherOffsetBlue( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 2 ); }
vec4 tex2DGatherOffsetAlpha( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 3 ); }

#define tex2DGatherOffsetsRed( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 0 )
#define tex2DGatherOffsetsGreen( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 1 )
#define tex2DGatherOffsetsBlue( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 2 )
#define tex2DGatherOffsetsAlpha( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 3 )

uniform vec4 _fa_freqHigh [3];
uniform vec4 _fa_freqLow [3];
uniform sampler2D samp_vmtrpagetablemap;
uniform sampler2D samp_vmtrphysicalmappingsmap;
uniform sampler2DArray samp_vmtrphysicalpagesmaparray0;
uniform sampler2D samp_vmtrphysicalpagesmap3;

in vec4 vofi_TexCoord0;

out vec4 out_FragColor0;

float dot2 ( vec2 a, vec2 b ) { return dot( a, b ); }
float SRGBlinear ( float value ) { if ( value <= 0.04045 ) {
		return ( value / 12.92 );
	} else {
		return pow( ( value / 1.055 ) + 0.0521327, 2.4 );
	}
}
vec3 SRGBlinear ( vec3 sRGB ) {
	vec3 outLinear;
	outLinear.r = SRGBlinear( sRGB.r );
	outLinear.g = SRGBlinear( sRGB.g );
	outLinear.b = SRGBlinear( sRGB.b );
	return outLinear;
}
vec4 SRGBlinear ( vec4 sRGBA ) {
	vec4 outLinear = vec4( SRGBlinear( sRGBA.rgb ), 1 );
	outLinear.a = SRGBlinear( sRGBA.a );
	return outLinear;
}
float DeGamma ( float value ) {
	return SRGBlinear( value );
}
vec4 DeGamma ( vec4 color ) {
	return SRGBlinear( color );
}
vec3 DeGamma ( vec3 color ) {
	return SRGBlinear( color );
}
vec4 texPhys ( sampler2D image, vec2 texcoord ) { return tex2D( image, texcoord ); }
vec4 texPhys ( sampler2D image, vec2 texcoord, vec2 dx, vec2 dy ) { return tex2D( image, texcoord, dx, dy ); }
vec4 tex2DArray ( sampler2DArray image, float slice, vec2 texcoord ) { return tex2DARRAY( image, vec3( texcoord, slice ) ); }
vec4 tex2DArrayGrad ( sampler2DArray image, float slice, vec2 texcoord, vec2 dx, vec2 dy ) { return tex2DARRAY( image, vec3( texcoord, slice ), dx, dy ); }
vec4 texPhysArray ( sampler2DArray image, float slice, vec2 texcoord ) { return tex2DArray( image, slice, texcoord ); }
vec4 texPhysArray ( sampler2DArray image, float slice, vec2 texcoord, vec2 dx, vec2 dy ) { return tex2DArrayGrad( image, slice, texcoord, dx, dy ); }
void main() {
	{
		vec4 sampleSpecular;
		vec4 sampleDiffuse;
		vec4 sampleNormal;
		vec4 sampleLightmap;
		vec4 sampleMask;
		{
			vec2 texCoords = vofi_TexCoord0.xy;
			vec2 texCoordsLOD = vofi_TexCoord0.xy; if ( _fa_freqHigh[0 ].x > 0 ) {
				texCoords = fract( vofi_TexCoord0.xy ) * _fa_freqHigh[1 ].xy + _fa_freqHigh[1 ].zw;
				texCoordsLOD = vofi_TexCoord0.xy * _fa_freqHigh[1 ].xy;
			}
			float anisoLOD;
			float sampleLOD;
			{
				float widthInTexels = _fa_freqLow[0 ].z;
				float maxAnisoLog2 = _fa_freqHigh[2 ].z;
				vec2 texelCoords = texCoordsLOD.xy * widthInTexels;
				vec2 dx = dFdx( texelCoords );
				vec2 dy = dFdy( texelCoords );
				float px = dot2( dx, dx );
				float py = dot2( dy, dy );
				float maxLod = 0.5 * log2( max( px, py ) );
				float minLod = 0.5 * log2( min( px, py ) );
				anisoLOD = maxLod - min( maxAnisoLog2, maxLod - minLod );
			};
			{
				sampleLOD = anisoLOD;
			};
			{
				vec3 physCoords;
				if ( _fa_freqLow[1 ].y != 0.0 ) {
					float trilinearFraction = fract( sampleLOD );
					bool twoSamples;
					float sampleLOD1, sampleLOD2;
					{
						float triStart = 0.5 - 0.25 / 2.0;
						float triEnd = 0.5 + 0.25 / 2.0;
						if ( trilinearFraction <= triStart ) {
							twoSamples = false;
							sampleLOD1 = sampleLOD - 0.5;
							sampleLOD2 = 0.0;
						} else if ( trilinearFraction >= triEnd ) {
							twoSamples = false;
							sampleLOD1 = sampleLOD + 0.5;
							sampleLOD2 = 0.0;
						} else {
							twoSamples = true;
							sampleLOD1 = sampleLOD - 0.5;
							sampleLOD2 = sampleLOD + 0.5;
						}
					};
					{
						vec4 virtCoordsLod = vec4( texCoords.xy.x, texCoords.xy.y, 0, sampleLOD1 );
						vec2 physPage = tex2Dlod( samp_vmtrpagetablemap, virtCoordsLod ).xy;
						vec4 xform = tex2D( samp_vmtrphysicalmappingsmap, physPage );
						physCoords.x = texCoords.xy.x * xform.x + xform.z;
						physCoords.y = texCoords.xy.y * ( xform.x * _fa_freqLow[2 ].x ) + xform.w;
						physCoords.z = xform.y;
					};
					{
						vec2 dx = dFdx( texCoordsLOD.xy ) * physCoords.z;
						vec2 dy = dFdy( texCoordsLOD.xy ) * physCoords.z;
						sampleDiffuse = texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy );
						sampleSpecular = texPhysArray( samp_vmtrphysicalpagesmaparray0, 1.0, physCoords.xy, dx, dy );
						sampleLightmap = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy );
						sampleMask = texPhys( samp_vmtrphysicalpagesmap3, physCoords.xy, dx, dy );
						sampleNormal = vec4( 0.0 );
						float cover = sampleLightmap.z;
						float power = DeGamma( sampleLightmap.w );
						sampleNormal.y = sampleSpecular.w;
						sampleNormal.w = sampleDiffuse.w;
						sampleSpecular.w = cover;
						sampleLightmap.w = power;
					};
					if ( twoSamples ) {
						vec4 sampleSpecular2, sampleDiffuse2, samplePower2, sampleColorMask2, sampleLightmap2;
						{
							vec4 virtCoordsLod = vec4( texCoords.xy.x, texCoords.xy.y, 0, sampleLOD2 );
							vec2 physPage = tex2Dlod( samp_vmtrpagetablemap, virtCoordsLod ).xy;
							vec4 xform = tex2D( samp_vmtrphysicalmappingsmap, physPage );
							physCoords.x = texCoords.xy.x * xform.x + xform.z;
							physCoords.y = texCoords.xy.y * ( xform.x * _fa_freqLow[2 ].x ) + xform.w;
							physCoords.z = xform.y;
						};
						{
							vec2 dx = dFdx( texCoordsLOD.xy ) * physCoords.z;
							vec2 dy = dFdy( texCoordsLOD.xy ) * physCoords.z;
							sampleDiffuse2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy );
							sampleSpecular2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 1.0, physCoords.xy, dx, dy );
							sampleLightmap2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy );
							sampleColorMask2 = texPhys( samp_vmtrphysicalpagesmap3, physCoords.xy, dx, dy );
							samplePower2 = vec4( 0.0 );
							float cover = sampleLightmap2.z;
							float power = DeGamma( sampleLightmap2.w );
							samplePower2.y = sampleSpecular2.w;
							samplePower2.w = sampleDiffuse2.w;
							sampleSpecular2.w = cover;
							sampleLightmap2.w = power;
						};
						float lerpFactor = 0.0;
						{
							float triStart = 0.5 - 0.25 / 2.0;
							lerpFactor = saturate( ( trilinearFraction - triStart ) * ( 1.0 / 0.25 ) );
						};
						sampleSpecular = mix( sampleSpecular, sampleSpecular2, lerpFactor );
						sampleDiffuse = mix( sampleDiffuse, sampleDiffuse2, lerpFactor );
						sampleNormal = mix( sampleNormal, samplePower2, lerpFactor );
						sampleLightmap = mix( sampleLightmap, sampleLightmap2, lerpFactor );
						sampleMask = mix( sampleMask, sampleColorMask2, lerpFactor );
					}
				} else
				{
					{
						vec4 virtCoordsLod = vec4( texCoords.xy.x, texCoords.xy.y, 0, sampleLOD - 0.5 );
						vec2 physPage = tex2Dlod( samp_vmtrpagetablemap, virtCoordsLod ).xy;
						vec4 xform = tex2D( samp_vmtrphysicalmappingsmap, physPage );
						physCoords.x = texCoords.xy.x * xform.x + xform.z;
						physCoords.y = texCoords.xy.y * ( xform.x * _fa_freqLow[2 ].x ) + xform.w;
						physCoords.z = xform.y;
					};
					{
						vec2 dx = dFdx( texCoordsLOD.xy ) * physCoords.z;
						vec2 dy = dFdy( texCoordsLOD.xy ) * physCoords.z;
						sampleDiffuse = texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy );
						sampleSpecular = texPhysArray( samp_vmtrphysicalpagesmaparray0, 1.0, physCoords.xy, dx, dy );
						sampleLightmap = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy );
						sampleMask = texPhys( samp_vmtrphysicalpagesmap3, physCoords.xy, dx, dy );
						sampleNormal = vec4( 0.0 );
						float cover = sampleLightmap.z;
						float power = DeGamma( sampleLightmap.w );
						sampleNormal.y = sampleSpecular.w;
						sampleNormal.w = sampleDiffuse.w;
						sampleSpecular.w = cover;
						sampleLightmap.w = power;
					};
				}
			};
		};
		clip( sampleSpecular.w - 0.5 );
		out_FragColor0 = vec4( 0.0 );
	}
}