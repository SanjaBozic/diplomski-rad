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
uniform vec4 _fa_freqLow [4];
uniform sampler2D samp_transmap;
uniform samplerCube samp_sparecube1map;

in vec4 vofi_TexCoord0;
in vec4 vofi_TexCoord1;
in vec4 vofi_Color;
in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord6;

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
vec4 tex2DDeGammaApprox ( sampler2D image, vec2 texcoord ) {
	vec4 color = tex2D( image, texcoord );
	color = SRGBlinearApprox( color );
	return color;
}
void main() {
	{
		float fogVal = vofi_TexCoord0.z;
		float frameFrac = vofi_TexCoord1.z;
		vec4 color;
		{
			vec4 result0 = tex2DDeGammaApprox( samp_transmap, vofi_TexCoord0.xy ) * ( 1.0 - frameFrac );
			vec4 result1 = tex2DDeGammaApprox( samp_transmap, vofi_TexCoord1.xy ) * ( frameFrac );
			color = ( result0 + result1 );
		};
		color.w = color.y;
		color.xyz = color.xxx;
		float opacity = color.w * vofi_Color.w;
		clip( opacity - 1e-6 );
		vec3 fromViewer = normalize( vofi_TexCoord2.xyz );
		color.xyz *= texCUBE( samp_sparecube1map, fromViewer ).xyz;
		color *= vofi_Color;
		vec3 fogColor;
		float fogAmount;
		{
			float FLT_EPSILON = 0.0001;
			vec3 fogLightInscatterScaledColor = _fa_freqLow[0 ].xyz * _fa_freqLow[1 ].x;
			vec3 heightFogColor = mix( fogLightInscatterScaledColor, _fa_freqLow[2 ].xyz, vofi_TexCoord6.z );
			fogAmount = saturate( vofi_TexCoord6.y + vofi_TexCoord6.x );
			float fogSafeAmount = max( fogAmount, FLT_EPSILON );
			float fogSelection = max( 0.0, ( fogSafeAmount - vofi_TexCoord6.x ) / fogSafeAmount );
			fogColor = mix( _fa_freqLow[3 ].xyz, heightFogColor, fogSelection );
			fogAmount = 1.0 - fogAmount;
		};
		color.xyz = mix( fogColor.xyz, color.xyz, fogAmount * ( 1.0 - _fa_freqHigh[0 ].w ) );
		out_FragColor0 = color;
		{
			out_FragColor0.a = saturate( out_FragColor0.a );
			out_FragColor0.rgb *= out_FragColor0.a;
		};
	}
}