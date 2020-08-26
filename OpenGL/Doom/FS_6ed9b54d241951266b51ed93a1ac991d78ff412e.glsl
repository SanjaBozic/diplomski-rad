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
uniform vec4 _fa_freqLow [1];
uniform sampler2D samp_transmap;
uniform sampler2D samp_viewdepthmap;

in vec4 gl_FragCoord;

out vec4 out_FragColor0;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
float unpackFloatRGBA8 ( vec4 value ) {
	return dot4( value, vec4( 1.0, 1.0 / 255.0, 1.0 / 65025.0, 1.0 / 16581375.0 ) );
}
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
float GetLuma ( vec3 c ) {
	return dot( c, vec3( 0.2126, 0.7152, 0.0722 ) );
}
void main() {
	{
		vec2 tc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
		vec2 dc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[1 ] );
		float maxDistanceSqr = _fa_freqHigh[2 ].y * _fa_freqHigh[2 ].y;
		float alpha = ( 1.0 - clamp( _fa_freqHigh[2 ].x / maxDistanceSqr, 0.0, 1.0 ) );
		float translateOffset = alpha * _fa_freqHigh[3 ].x;
		vec2 translate = _fa_freqHigh[0 ].zw * translateOffset;
		vec4 sample_00 = tex2D( samp_transmap, tc + vec2( -translate.x, -translate.y ) );
		vec4 sample_01 = tex2D( samp_transmap, tc + vec2( 0.0, -translate.y ) );
		vec4 sample_02 = tex2D( samp_transmap, tc + vec2( translate.x, -translate.y ) );
		vec4 sample_10 = tex2D( samp_transmap, tc + vec2( -translate.x, 0.0 ) );
		vec4 sample_12 = tex2D( samp_transmap, tc + vec2( translate.x, 0.0 ) );
		vec4 sample_20 = tex2D( samp_transmap, tc + vec2( -translate.x, translate.y ) );
		vec4 sample_21 = tex2D( samp_transmap, tc + vec2( 0.0, translate.y ) );
		vec4 sample_22 = tex2D( samp_transmap, tc + vec2( translate.x, translate.y ) );
		float depths[ 8 ];
		depths[ 0 ] = 1.0 - unpackFloatRGBA8( sample_00 );
		depths[ 1 ] = 1.0 - unpackFloatRGBA8( sample_01 );
		depths[ 2 ] = 1.0 - unpackFloatRGBA8( sample_02 );
		depths[ 3 ] = 1.0 - unpackFloatRGBA8( sample_10 );
		depths[ 4 ] = 1.0 - unpackFloatRGBA8( sample_12 );
		depths[ 5 ] = 1.0 - unpackFloatRGBA8( sample_20 );
		depths[ 6 ] = 1.0 - unpackFloatRGBA8( sample_21 );
		depths[ 7 ] = 1.0 - unpackFloatRGBA8( sample_22 );
		depths[ 0 ] = min( depths[ 0 ], depths[ 1 ] );
		depths[ 1 ] = min( depths[ 2 ], depths[ 3 ] );
		depths[ 2 ] = min( depths[ 4 ], depths[ 5 ] );
		depths[ 3 ] = min( depths[ 6 ], depths[ 7 ] );
		depths[ 0 ] = min( depths[ 0 ], depths[ 1 ] );
		depths[ 1 ] = min( depths[ 2 ], depths[ 3 ] );
		depths[ 0 ] = min( depths[ 0 ], depths[ 1 ] );
		float destDepth = tex2Ddepth( samp_viewdepthmap, dc );
		float depthReject = destDepth - depths[ 0 ];
		clip( depthReject );
		float s_00 = ceil( sample_00.x );
		float s_01 = ceil( sample_01.x );
		float s_02 = ceil( sample_02.x );
		float s_10 = ceil( sample_10.x );
		float s_12 = ceil( sample_12.x );
		float s_20 = ceil( sample_20.x );
		float s_21 = ceil( sample_21.x );
		float s_22 = ceil( sample_22.x );
		float sx = s_00 + 2.0 * s_10 + s_20 - s_02 - 2.0 * s_12 - s_22;
		float sy = s_00 + 2.0 * s_01 + s_02 - s_20 - 2.0 * s_21 - s_22;
		float edge = sx * sx + sy * sy;
		float fade = max( edge, 0.0 ) * 0.1;
		vec3 finalColor = alpha * fade * _fa_freqHigh[4 ].xyz;
		float finalColorLum = GetLuma( finalColor );
		float defaultSaturation = 1.0, defaultBlendScale = 1.0;
		float renderModeSaturation = 1.0, renderModeBlendScale = 0.1;
		float saturation = ( _fa_freqLow[0 ].x == 0 ) ? defaultSaturation : renderModeSaturation;
		float blendScale = ( _fa_freqLow[0 ].x == 0 ) ? defaultBlendScale : renderModeBlendScale;
		out_FragColor0.xyz = mix( finalColorLum.xxx, finalColor, saturation.xxx ) * blendScale;
		out_FragColor0.w = alpha * blendScale;
	}
}