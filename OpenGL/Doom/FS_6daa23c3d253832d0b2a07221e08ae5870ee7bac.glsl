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

uniform vec4 _fa_freqHigh [10];
uniform vec4 _fa_freqLow [1];
uniform sampler2D samp_viewdepthmap;
uniform sampler2D samp_transmap;
uniform sampler2D samp_transmap1;
uniform sampler2D samp_transmap2;
uniform sampler2D samp_transmap4;
uniform sampler2D samp_transmap3;

in vec4 vofi_TexCoord1;
in vec4 vofi_TexCoord0;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;

vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
float GetFragmentDepth ( vec4 fragmentPos ) { return fragmentPos.z; }
void main() {
	{
		float interpolatedDepth = GetFragmentDepth( gl_FragCoord );
		vec2 tc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
		float depth = tex2Ddepth( samp_viewdepthmap, tc );
		float dstDepth = 1.0 / ( 1.0 - depth );
		float srcDepth = 1.0 / ( 1.0 - interpolatedDepth );
		float diameter = ( vofi_TexCoord1.z / 3.14 ) * vofi_TexCoord1.x;
		float viewScale = 1.0 - saturate( ( srcDepth - dstDepth ) / diameter );
		float viewFalloff = saturate( srcDepth * 0.05 );
		vec4 mask = tex2D( samp_transmap, vofi_TexCoord0.xy * _fa_freqHigh[1 ].xy );
		vec4 flicker = tex2Dlod( samp_transmap1, vec4( mask.x + _fa_freqLow[0 ].x, 0.5 , 0.0, 0.0 ) );
		vec4 smoke = tex2D( samp_transmap2, vofi_TexCoord0.xy * _fa_freqHigh[2 ].xy + vec2( _fa_freqLow[0 ].x ) * _fa_freqHigh[2 ].zw );
		vec4 mask2 = tex2D( samp_transmap4, vofi_TexCoord0.xy );
		vec2 pos = vofi_TexCoord0.xy * 2.0 - 1.0;
		float mag = length( pos.xy );
		vec2 pos2 = 1.0 - abs( vofi_TexCoord0.xy * 2.0 - 1.0 );
		float mag2 = 1.0 - length( pos2 );
		float angle = atan( pos.x, pos.y );
		float angle2 = atan( pos2.x, pos2.y );
		angle = angle / 6.28318530718;
		angle = angle + 0.5;
		angle2 = angle2 / 6.28318530718;
		angle2 = angle2 + 0.5;
		vec4 electricity = tex2D( samp_transmap3, vec2( angle2 * _fa_freqHigh[3 ].x + _fa_freqLow[0 ].x * _fa_freqHigh[3 ].z , mag2 * _fa_freqHigh[3 ].y + _fa_freqLow[0 ].x * _fa_freqHigh[3 ].w + mask.x * 0.1 ) );
		float centerMask = smoothstep( 0.0, 0.3, mag );
		float centerMask2 = 1.0 - pow( 1.0 - saturate( mag2 ), 5.0 );
		electricity *= centerMask2;
		vec4 final = vec4( 0.0 ); if ( _fa_freqHigh[4 ].x != 0 ) {
			final.w = mask.y * ( smoke.x + centerMask * 0.2 );
			final.w += flicker.x * mask.z * 0.15;
			final.w = mix( final.w, smoke.x, 0.5 );
			final.w += electricity.x * ( mask.z * 0.5 );
			final.w *= final.w * final.w;
		} if ( _fa_freqHigh[4 ].x > 0 && _fa_freqHigh[4 ].x < 1 ) {
			float ramp = ( 1.0 - _fa_freqHigh[4 ].x ) * 1.5 - 0.2;
			float fadeInBlocks = mix( mask.x , mag, 0.8 );
			float fadeInBlocksFlash = smoothstep( 0.0, 0.1, fadeInBlocks - ramp );
			fadeInBlocksFlash *= smoothstep( 0.2, 0.1, fadeInBlocks - ramp );
			fadeInBlocksFlash *= mask.z;
			float fadeInEdges = mix( smoke.x, mag, 0.6 );
			float fadeInEdgesFlash = smoothstep( 0.0, 0.1, fadeInEdges - ramp );
			fadeInEdgesFlash *= smoothstep( 0.3, 0.1, fadeInEdges - ramp );
			fadeInEdgesFlash *= mask.y;
			float fadeMask =smoothstep( 0.0, 0.1, fadeInBlocks - ramp );
			final.w += fadeInBlocksFlash + fadeInEdgesFlash;
			final.w *= fadeMask;
		} if ( _fa_freqHigh[5 ].x > 0 ) {
			final.w += flicker.x * mask.z * smoke.x * _fa_freqHigh[5 ].x;
			final.w += electricity.x * smoke.x * _fa_freqHigh[5 ].x;
		}
		final.w *= vofi_TexCoord1.z;
		final.w *= _fa_freqHigh[6 ].w;
		final.w *= _fa_freqHigh[7 ].w;
		final.w *= mask2.x;
		final.w *= viewFalloff;
		final.xyz = _fa_freqHigh[6 ].xyz;
		final.xyz *= _fa_freqHigh[7 ].xyz;
		final.xyz += electricity.x * ( mask.z + 0.5 ) * _fa_freqHigh[8 ].xyz;
		final.xyz -= _fa_freqHigh[9 ].x;
		final.xyz = max( final.xyz, vec3( 0.0 ) );
		out_FragColor0 = final;
		{
			out_FragColor0.a = saturate( out_FragColor0.a );
			out_FragColor0.rgb *= out_FragColor0.a;
		};
		{
			out_FragColor0.a = 0.0001;
		};
	}
}