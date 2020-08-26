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

uniform vec4 _fa_freqHigh [5];
uniform vec4 _fa_freqLow [3];
uniform sampler2D samp_vmtrpagetablemap;
uniform sampler2D samp_vmtrphysicalmappingsmap;
uniform sampler2DArray samp_vmtrphysicalpagesmaparray0;

in vec4 vofi_TexCoord0;
in vec4 vofi_Color;
in vec4 vofi_TexCoord1;

out vec4 out_FragColor0;

float dot2 ( vec2 a, vec2 b ) { return dot( a, b ); }
float linearSRGB ( float value ) { if ( value > 0.0031308 ) {
		return pow( value, 1.0 / 2.4 ) * 1.055 - 0.055;
	} else {
		return value * 12.92;
	}
}
vec3 linearSRGB ( vec3 inLinear ) {
	vec3 sRGB;
	sRGB.r = linearSRGB( inLinear.r );
	sRGB.g = linearSRGB( inLinear.g );
	sRGB.b = linearSRGB( inLinear.b );
	return sRGB;
}
vec4 linearSRGB ( vec4 inLinear ) {
	vec4 sRGBA = vec4( linearSRGB( inLinear.rgb ), 1 );
	sRGBA.a = linearSRGB( inLinear.a );
	return sRGBA;
}
vec4 tex2DArray ( sampler2DArray image, float slice, vec2 texcoord ) { return tex2DARRAY( image, vec3( texcoord, slice ) ); }
vec4 tex2DArrayGrad ( sampler2DArray image, float slice, vec2 texcoord, vec2 dx, vec2 dy ) { return tex2DARRAY( image, vec3( texcoord, slice ), dx, dy ); }
vec4 texPhysArray ( sampler2DArray image, float slice, vec2 texcoord ) { return tex2DArray( image, slice, texcoord ); }
vec4 texPhysArray ( sampler2DArray image, float slice, vec2 texcoord, vec2 dx, vec2 dy ) { return tex2DArrayGrad( image, slice, texcoord, dx, dy ); }
void main() {
	{
		vec4 sampleDiffuse;
		float sampleAlpha;
		{
			vec2 texCoords = saturate( vofi_TexCoord0.xy ) * _fa_freqHigh[0 ].xy + _fa_freqHigh[0 ].zw;
			vec2 texCoordsLOD = vofi_TexCoord0.xy * _fa_freqHigh[0 ].xy;
			float anisoLOD;
			float sampleLOD;
			{
				float widthInTexels = _fa_freqLow[0 ].z;
				float maxAnisoLog2 = _fa_freqHigh[1 ].z;
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
						vec2 dx = dFdx( texCoords.xy.xy ) * physCoords.z;
						vec2 dy = dFdy( texCoords.xy.xy ) * physCoords.z;
						sampleDiffuse = linearSRGB( texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy ) );
						sampleAlpha = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy ).w;
					};
					if ( twoSamples ) {
						vec4 sampleDiffuse2;
						float sampleAlpha2;
						{
							vec4 virtCoordsLod = vec4( texCoords.xy.x, texCoords.xy.y, 0, sampleLOD2 );
							vec2 physPage = tex2Dlod( samp_vmtrpagetablemap, virtCoordsLod ).xy;
							vec4 xform = tex2D( samp_vmtrphysicalmappingsmap, physPage );
							physCoords.x = texCoords.xy.x * xform.x + xform.z;
							physCoords.y = texCoords.xy.y * ( xform.x * _fa_freqLow[2 ].x ) + xform.w;
							physCoords.z = xform.y;
						};
						{
							vec2 dx = dFdx( texCoords.xy.xy ) * physCoords.z;
							vec2 dy = dFdy( texCoords.xy.xy ) * physCoords.z;
							sampleDiffuse2 = linearSRGB( texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy ) );
							sampleAlpha2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy ).w;
						};
						float lerpFactor = 0.0;
						{
							float triStart = 0.5 - 0.25 / 2.0;
							lerpFactor = saturate( ( trilinearFraction - triStart ) * ( 1.0 / 0.25 ) );
						};
						sampleDiffuse = mix( sampleDiffuse, sampleDiffuse2, lerpFactor );
						sampleAlpha = mix( sampleAlpha, sampleAlpha2, lerpFactor );
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
						vec2 dx = dFdx( texCoords.xy.xy ) * physCoords.z;
						vec2 dy = dFdy( texCoords.xy.xy ) * physCoords.z;
						sampleDiffuse = linearSRGB( texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy ) );
						sampleAlpha = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy ).w;
					};
				}
			};
		};
		vec4 diffuse;
		diffuse.xyz = sampleDiffuse.xyz;
		diffuse.w = sampleAlpha;
		float scale = 1.0 - _fa_freqHigh[2 ].x;
		float bias = _fa_freqHigh[2 ].x;
		diffuse *= vofi_Color;
		diffuse += vofi_TexCoord1;
		out_FragColor0.xyz = saturate( diffuse.xyz * scale + bias ) * diffuse.w * _fa_freqHigh[3 ].x;
		out_FragColor0.w = diffuse.w;
		{
			if ( _fa_freqHigh[4 ].x == 0 ) {
			} else if ( _fa_freqHigh[4 ].x == 1 ) {
				{
					out_FragColor0.a = 0.0001;
				};
			} else if ( _fa_freqHigh[4 ].x == 2 ) {
				{
					out_FragColor0.a = 1.0;
				};
			} else if ( _fa_freqHigh[4 ].x == 3 ) {
				{
					out_FragColor0.a = saturate( out_FragColor0.a );
					out_FragColor0.rgb *= out_FragColor0.a;
				};
			} else if ( _fa_freqHigh[4 ].x == 4 ) {
				{
					out_FragColor0.a = saturate( out_FragColor0.a );
					out_FragColor0.rgb *= out_FragColor0.a;
				};
				{
					out_FragColor0.a = 0.0001;
				};
			}
		};
	}
}