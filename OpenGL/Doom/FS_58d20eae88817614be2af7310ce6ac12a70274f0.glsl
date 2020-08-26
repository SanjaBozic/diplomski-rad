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
uniform vec4 _fa_freqLow [4];
uniform sampler2D samp_viewdepthmap;
uniform sampler2D samp_transmap;
uniform sampler2D samp_transmap1;

in vec4 gl_FragCoord;

out vec4 out_FragColor0;

vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
void main() {
	{
		vec4 final = vec4( 0.0 ); if ( _fa_freqHigh[0 ].w > 0.0 ) {
			vec2 texcoord = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[1 ] );
			float ndcZ = tex2Ddepth( samp_viewdepthmap, texcoord.xy );
			vec4 device = vec4( texcoord.x * 2.0 - 1.0, texcoord.y * 2.0 - 1.0, ndcZ, 1.0 );
			clip( device.z - 0.1 );
			vec4 globalPos;
			globalPos.x = dot( device, _fa_freqLow[0 ] );
			globalPos.y = dot( device, _fa_freqLow[1 ] );
			globalPos.z = dot( device, _fa_freqLow[2 ] );
			globalPos.w = dot( device, _fa_freqLow[3 ] );
			globalPos.xyzw /= vec4( globalPos.w );
			vec3 posDDX = normalize( dFdx( globalPos.xyz ) );
			vec3 posDDY = normalize( dFdy( globalPos.xyz ) );
			vec3 globalNormal = normalize( cross( posDDX, posDDY ) );
			vec4 hexagonsX = tex2D( samp_transmap, globalPos.yz * _fa_freqHigh[2 ].xy );
			vec4 hexagonsY = tex2D( samp_transmap, globalPos.xz * _fa_freqHigh[2 ].xy );
			vec4 hexagonsZ = tex2D( samp_transmap, globalPos.xy * _fa_freqHigh[2 ].xy );
			float maskX = saturate( ( abs( globalNormal.x ) - 0.4 ) * 5.0 );
			float maskY = saturate( ( abs( globalNormal.y ) - 0.4 ) * 5.0 );
			float maskZ = saturate( ( abs( globalNormal.z ) - 0.4 ) * 5.0 );
			vec4 hexagons = ( hexagonsX * vec4( maskX ) ) +( hexagonsY * vec4( maskY ) ) + ( hexagonsZ * vec4( maskZ ) );
			float distance = length( globalPos.xyz - _fa_freqHigh[0 ].xyz );
			float maskTC1 = 1.0 - saturate( ( distance - _fa_freqHigh[0 ].w + 500 ) / 500 );
			vec4 mask1 = tex2D( samp_transmap1, vec2( maskTC1, 0.5 ) );
			final.xyz += vec3( mask1.x * ( 1.0 - hexagons.w ) * 0.2 ) * vec3( 0.1, 0.3, 1.0 );
			final.xyz += vec3( mask1.x * mask1.x * mask1.x * mask1.x ) * vec3( 0.3, 0.5, 1.0 );
			float maskTC2 = saturate( ( distance - _fa_freqHigh[0 ].w + 250 ) / 250 + ( hexagons.x - 1.0 ) );
			vec4 mask2 = tex2D( samp_transmap1, vec2( maskTC2, 0.5 ) );
			final.xyz += vec3( mask2.x * hexagons.w * 0.2 ) * vec3( 0.2, 0.2, 1.0 ) * 10.0;
			final.w = 1.0;
		}
		out_FragColor0 = final;
	}
}