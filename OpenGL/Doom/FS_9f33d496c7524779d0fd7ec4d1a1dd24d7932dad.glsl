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

uniform vec4 _fa_freqHigh [1];
uniform vec4 _fa_freqLow [1];
uniform sampler2D samp_viewdepthmap;

in vec4 gl_FragCoord;

out vec4 out_FragColor0;

vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
void main() {
	{
		vec2 tc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
		float MAX_FLAT_DEPTH = 10.0;
		float MIN_CRACK_DEPTH = 100.0;
		float MAX_CRACK_DISTANCE = 500.0;
		vec3 foundCrack = vec3( 0.0 );
		for ( float x = -4.0; x <= 4.0; x += 1.0 ) {
			for ( float y = -4.0; y <= 4.0; y += 1.0 ) {
				vec2 localTC = tc + vec2( x, y ) * _fa_freqHigh[0 ].zw;
				float centerDepth = tex2Ddepth( samp_viewdepthmap, localTC );
				vec4 surroundingDepth;
				surroundingDepth.x = tex2Ddepth( samp_viewdepthmap, localTC + vec2( +1, 0 ) * _fa_freqHigh[0 ].zw );
				surroundingDepth.y = tex2Ddepth( samp_viewdepthmap, localTC + vec2( 0, +1 ) * _fa_freqHigh[0 ].zw );
				surroundingDepth.z = tex2Ddepth( samp_viewdepthmap, localTC + vec2( -1, 0 ) * _fa_freqHigh[0 ].zw );
				surroundingDepth.w = tex2Ddepth( samp_viewdepthmap, localTC + vec2( 0, -1 ) * _fa_freqHigh[0 ].zw );
				centerDepth = centerDepth * 2.0 - 1.0;
				surroundingDepth = surroundingDepth * 2.0 - 1.0;
				float centerClipZ = -( _fa_freqLow[0 ].w / ( -centerDepth - _fa_freqLow[0 ].z ) ) * centerDepth;
				vec4 surroundingClipZ = -( _fa_freqLow[0 ].w / ( -surroundingDepth - _fa_freqLow[0 ].z ) ) * surroundingDepth;
				float minClipX = min( surroundingClipZ.x, surroundingClipZ.z );
				float minClipY = min( surroundingClipZ.y, surroundingClipZ.w );
				float minClipZ = min( minClipX, minClipY );
				vec2 averageSurroundingClipZ = ( surroundingClipZ.xy + surroundingClipZ.zw ) * 0.5;
				if ( abs( averageSurroundingClipZ.x - surroundingClipZ.x ) < MAX_FLAT_DEPTH &&
				centerClipZ - averageSurroundingClipZ.x > MIN_CRACK_DEPTH && averageSurroundingClipZ.x < MAX_CRACK_DISTANCE ) {
					foundCrack = vec3( localTC.x, localTC.y, minClipZ );
				}
				if ( abs( averageSurroundingClipZ.y - surroundingClipZ.y ) < MAX_FLAT_DEPTH &&
				centerClipZ - averageSurroundingClipZ.y > MIN_CRACK_DEPTH && averageSurroundingClipZ.y < MAX_CRACK_DISTANCE ) {
					foundCrack = vec3( localTC.x, localTC.y, minClipZ );
				}
			}
		}
		if ( foundCrack.z != 0.0 ) {
			for ( float x = -16.0; x <= 16.0; x += 4.0 ) {
				for ( float y = -16.0; y <= 16.0; y += 4.0 ) {
					vec2 localTC = foundCrack.xy + vec2( x, y ) * _fa_freqHigh[0 ].zw;
					float centerDepth = tex2Ddepth( samp_viewdepthmap, localTC );
					vec4 surroundingDepth;
					surroundingDepth.x = tex2Ddepth( samp_viewdepthmap, localTC + vec2( +1, 0 ) * _fa_freqHigh[0 ].zw );
					surroundingDepth.y = tex2Ddepth( samp_viewdepthmap, localTC + vec2( 0, +1 ) * _fa_freqHigh[0 ].zw );
					surroundingDepth.z = tex2Ddepth( samp_viewdepthmap, localTC + vec2( -1, 0 ) * _fa_freqHigh[0 ].zw );
					surroundingDepth.w = tex2Ddepth( samp_viewdepthmap, localTC + vec2( 0, -1 ) * _fa_freqHigh[0 ].zw );
					centerDepth = centerDepth * 2.0 - 1.0;
					surroundingDepth = surroundingDepth * 2.0 - 1.0;
					float centerClipZ = -( _fa_freqLow[0 ].w / ( -centerDepth - _fa_freqLow[0 ].z ) ) * centerDepth;
					vec4 surroundingClipZ = -( _fa_freqLow[0 ].w / ( -surroundingDepth - _fa_freqLow[0 ].z ) ) * surroundingDepth;
					vec2 averageSurroundingClipZ = ( surroundingClipZ.xy + surroundingClipZ.zw ) * 0.5;
					if ( abs( averageSurroundingClipZ.x - surroundingClipZ.x ) < MAX_FLAT_DEPTH &&
					centerClipZ - averageSurroundingClipZ.x > MIN_CRACK_DEPTH && averageSurroundingClipZ.x < MAX_CRACK_DISTANCE ) {
					} else if ( abs( averageSurroundingClipZ.y - surroundingClipZ.y ) < MAX_FLAT_DEPTH &&
					centerClipZ - averageSurroundingClipZ.y > MIN_CRACK_DEPTH && averageSurroundingClipZ.y < MAX_CRACK_DISTANCE ) {
					} else if ( centerClipZ > foundCrack.z + MIN_CRACK_DEPTH ) {
						foundCrack.z = 0.0;
					}
				}
			}
		}
		if ( foundCrack.z != 0.0 ) {
			out_FragColor0 = vec4( 1.0, 0.25, 0.25, 1.0 );
		} else {
			float centerDepth = tex2Ddepth( samp_viewdepthmap, tc );
			centerDepth = centerDepth * 2.0 - 1.0;
			float centerClipZ = -( _fa_freqLow[0 ].w / ( -centerDepth - _fa_freqLow[0 ].z ) ) * centerDepth;
			out_FragColor0 = vec4( centerClipZ / 1000 );
		}
	}
}