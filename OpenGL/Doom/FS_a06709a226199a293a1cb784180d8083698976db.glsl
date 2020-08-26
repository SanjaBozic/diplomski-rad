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

uniform vec4 _fa_freqHigh [7];
uniform vec4 _fa_freqLow [1];
uniform sampler2D samp_transmap2;
uniform sampler2D samp_transmap;
uniform sampler2D samp_transmap3;
uniform sampler2D samp_transmap1;
uniform sampler2D samp_viewdepthmap;
uniform sampler2D samp_transmap4;

in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord0;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;

vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
float GetFragmentDepth ( vec4 fragmentPos ) { return fragmentPos.z; }
void main() {
	{
		float edgeGlowIntensity = 15.0;
		float edgeWidth = 15.0;
		float alphaEdgeWidth = 1.5;
		vec2 uvDistortion = vec2( 0.35, -0.05 );
		float boundaryHeight = 256.0;
		float depthOffsetPower = 2.5;
		float glitchPower = 0.25;
		float dispersalStrength = 10.5;
		vec3 fromOrigin = vofi_TexCoord2.xyz - _fa_freqHigh[0 ].xyz;
		float vComponent = 1.0 - saturate( fromOrigin.z / boundaryHeight );
		float expirePercentage = _fa_freqHigh[1 ].x;
		float introOutro = _fa_freqHigh[1 ].y;
		float crescendoRatio = _fa_freqHigh[1 ].z;
		float contested = _fa_freqHigh[1 ].w;
		vec4 boundaryColor = _fa_freqHigh[2 ]; if ( _fa_freqHigh[0 ].xyz == vec3(0.0, 0.0, 0.0) ) {
			vComponent = vofi_TexCoord0.y;
			expirePercentage = 0.5;
			introOutro = 1.0;
			crescendoRatio = 1.0;
			boundaryColor = vec4( 1.0, 1.0, 0.0, 1.0 );
		}
		vec2 worldUV = vec2( vofi_TexCoord0.x, vComponent );
		vec2 uvTime = vec2( _fa_freqLow[0 ].x );
		vec2 scrollingTileUV = worldUV * _fa_freqHigh[3 ].xy + ( uvTime * vec2( _fa_freqHigh[3 ].z, 0.0 ) );
		vec2 scrollingTileUV1 = worldUV * _fa_freqHigh[4 ].xy + ( uvTime * _fa_freqHigh[4 ].zw );
		float invCrescendoRatio = 1.0 - crescendoRatio;
		float captureRatio = mix( expirePercentage, 1.0, step(0.0001, crescendoRatio) );
		vec2 captureUVScale = _fa_freqHigh[5 ].xy;
		vec2 captureUVOffsetAnimated = _fa_freqHigh[5 ].zw * captureRatio;
		vec2 captureUV = worldUV * captureUVScale + captureUVOffsetAnimated;
		vec4 scrollingNoise = tex2D( samp_transmap2, scrollingTileUV1 );
		vec2 uvOffset = vec2( scrollingNoise.y, scrollingNoise.y );
		vec4 colorMap = tex2D( samp_transmap, scrollingTileUV + uvOffset * uvDistortion );
		captureUV = captureUV + uvOffset * uvDistortion * 0.35;
		float captureIntensity = 0.5;
		vec4 captureMix = tex2D( samp_transmap3, captureUV ) * captureIntensity * boundaryColor;
		float colorMapIntensity = _fa_freqHigh[3 ].w;
		colorMap.xyz *= colorMapIntensity;
		vec4 luminanceValues = vec4( 0.299, 0.587, 0.114, 0.0 );
		float luminance = dot( colorMap, luminanceValues );
		vec2 glitchUV = scrollingTileUV1 + vec2( scrollingNoise.b, scrollingNoise.r ) * 0.035;
		vec4 glitchSample = tex2D( samp_transmap2, glitchUV );
		glitchSample *= luminance;
		float dispersal = 1.0 - worldUV.y;
		dispersal *= dispersal;
		vec2 progressiveScanlineGlitch = mix( glitchUV, glitchUV + vec2( scrollingNoise.r, scrollingNoise.b ) * glitchPower, dispersal * dispersalStrength );
		vec4 scanlines = tex2D( samp_transmap1, progressiveScanlineGlitch );
		scanlines *= pow( luminance, 3.0 );
		float interpolatedDepth = GetFragmentDepth( gl_FragCoord );
		vec2 screenTC = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[6 ] );
		float depth = tex2Ddepth( samp_viewdepthmap, screenTC );
		float dstDepth = 1.0 / ( 1.0 - depth );
		float depthOffset = scrollingNoise.b * depthOffsetPower;
		float srcDepth = 1.0 / ( 1.0 - interpolatedDepth ) + depthOffset;
		float intersection = saturate( ( dstDepth - srcDepth ) / edgeWidth );
		intersection = cos( intersection * 3.14159 ) * 0.5 + 0.5;
		intersection *= intersection;
		float alphaIntersection = saturate( ( dstDepth - srcDepth ) / alphaEdgeWidth );
		alphaIntersection *= alphaIntersection;
		vec4 primaryGradient = colorMap * scrollingNoise.r * glitchSample.g * glitchSample.r;
		vec4 final = ( primaryGradient + scanlines ) * _fa_freqHigh[2 ];
		final = mix( final, final + captureMix, captureRatio );
		final.xyz = mix( final.xyz, (final.xyz / srcDepth.x) + final.xyz * edgeGlowIntensity, intersection );
		float quadraticTaper = worldUV.y * worldUV.y;
		final.xyz *= quadraticTaper;
		final.xyz *= alphaIntersection;
		final *= introOutro;
		vec2 crescendoUV = worldUV + vec2(0.0, crescendoRatio * 0.333 - 0.1);
		crescendoUV.x *= 0.333;
		vec2 crescendoCrackleOffset = mix( uvOffset * 0.01, uvOffset * 0.25, crescendoRatio );
		vec4 crescendo = tex2D( samp_transmap4, crescendoUV + crescendoCrackleOffset );
		crescendo *= glitchSample.b * (10.0 * (invCrescendoRatio * invCrescendoRatio)) * quadraticTaper;
		crescendo *= step(0.0001, crescendoRatio) * _fa_freqHigh[2 ] * (1.0 - pow(crescendoRatio, 5.0));
		final.xyz += crescendo.xyz;
		final.xyz *= mix(1.0, sin( _fa_freqLow[0 ].x * 10.0) * 0.45 + 0.55, contested);
		out_FragColor0 = final;
	}
}