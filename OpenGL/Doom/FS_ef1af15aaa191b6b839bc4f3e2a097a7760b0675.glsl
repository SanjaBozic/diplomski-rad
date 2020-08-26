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

in vec4 vofi_TexCoord1;
in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord3;
in vec4 vofi_TexCoord4;
in vec4 vofi_TexCoord0;
in vec4 vofi_Color;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;

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
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
vec4 tex2DDeGammaApprox ( sampler2D image, vec2 texcoord ) {
	vec4 color = tex2D( image, texcoord );
	color = SRGBlinearApprox( color );
	return color;
}
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
float GetFragmentDepth ( vec4 fragmentPos ) { return fragmentPos.z; }
void main() {
	{
		vec3 globalNormal;
		{
			globalNormal.x = vofi_TexCoord1.xyz.z;
			globalNormal.y = vofi_TexCoord2.xyz.z;
			globalNormal.z = vofi_TexCoord3.xyz.z;
			globalNormal = normalize( globalNormal );
		};
		float interpolatedDepth = GetFragmentDepth( gl_FragCoord );
		vec2 screenTC = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
		float depth = tex2Ddepth( samp_viewdepthmap, screenTC );
		float dstDepth = 1.0 / ( 1.0 - depth );
		float srcDepth = 1.0 / ( 1.0 - interpolatedDepth );
		float intersect = 1.0 - ( saturate ( ( dstDepth - srcDepth) / 32.0 ) );
		intersect = ( cos( intersect * 3.14 ) * -0.5 + 0.6 ) * intersect;
		float falloff = saturate( ( dstDepth - srcDepth ) * ( 0.05 ) );
		intersect *= falloff;
		vec3 viewOffset = vofi_TexCoord4.xyz;
		float fresnel = 1.0 - dot( globalNormal, normalize( -viewOffset ) );
		fresnel = saturate( pow( fresnel, _fa_freqHigh[1 ].x) );
		fresnel = abs( 1.0 - fresnel );
		vec4 edgeFire = tex2DDeGammaApprox( samp_transmap, vofi_TexCoord0.xy * vec2( _fa_freqHigh[2 ].x, _fa_freqHigh[2 ].y ) + vec2( _fa_freqLow[0 ].x * _fa_freqHigh[2 ].z, _fa_freqLow[0 ].x * _fa_freqHigh[2 ].w ) );
		vec4 surfaceFire = tex2DDeGammaApprox( samp_transmap, vofi_TexCoord0.xy * vec2( _fa_freqHigh[3 ].x, _fa_freqHigh[3 ].y ) + vec2( _fa_freqLow[0 ].x * _fa_freqHigh[3 ].z, _fa_freqLow[0 ].x * _fa_freqHigh[3 ].w ) );
		edgeFire *= edgeFire * ( _fa_freqHigh[4 ].x * 2.0 );
		surfaceFire *= surfaceFire;
		float blueToRed = _fa_freqHigh[5 ].w * _fa_freqHigh[5 ].w * _fa_freqHigh[5 ].w;
		vec3 mainColor = mix( _fa_freqHigh[6 ].xyz, _fa_freqHigh[7 ].xyz, blueToRed );
		vec3 edgeColor = mix( _fa_freqHigh[8 ].xyz, _fa_freqHigh[7 ].xyz, blueToRed );
		vec3 colorize = mix( edgeColor, mainColor, intersect );
		vec4 finalColor = ( edgeFire * intersect + surfaceFire * falloff * fresnel ) * vofi_Color * vofi_Color * _fa_freqHigh[4 ].x;
		finalColor.xyz *= colorize * _fa_freqHigh[5 ].xyz;
		out_FragColor0 = finalColor * _fa_freqHigh[9 ].x;
		out_FragColor0.w *= _fa_freqHigh[5 ].w;
	}
}