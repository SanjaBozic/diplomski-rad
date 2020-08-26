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

uniform vec4 _fa_freqHigh [4];
uniform sampler2D samp_dither256map;
uniform sampler2D samp_woundtexture;
uniform sampler2D samp_transmap1;
uniform sampler2D samp_transmap2;
uniform sampler2D samp_transmap;
uniform samplerCube samp_dynamicenvmap;
uniform samplerCube samp_dynamicdiffuseenvmap;

in vec4 vofi_TexCoord8;
in vec4 vofi_TexCoord7;
in vec4 vofi_TexCoord0;
in vec4 vofi_TexCoord5;
in vec4 vofi_TexCoord6;
in vec4 vofi_TexCoord1;
in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord3;
in vec4 vofi_TexCoord4;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;
out vec4 out_FragColor1;
out vec4 out_FragColor2;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
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
		{ if ( _fa_freqHigh[0 ].x < 1.0 ) {
				vec2 texcoord = gl_FragCoord.xy * ( 1.0 / 256.0 );
				float dither = tex2Dlod( samp_dither256map, vec4(texcoord.xy, 0, 0 ) ).x;
				clip( _fa_freqHigh[0 ].x - 0.2 - dither * 0.6 );
			}
		};
		vec4 woundMap3 = tex2D( samp_woundtexture, vofi_TexCoord8.xy );
		{
			float clipValue = vofi_TexCoord7.w + ( woundMap3.w - 0.5 ) * 0.1;
			clip( clipValue );
		};
		vec4 normalTex = tex2D( samp_transmap1, vofi_TexCoord0.xy );
		vec4 shadowTex = tex2DDeGammaApprox( samp_transmap2, vofi_TexCoord5.xy );
		vec2 texCoords = vofi_TexCoord0.xy - ( vofi_TexCoord6.xy * normalTex.w * 0.15 );
		texCoords = texCoords - vec2( 0.5 );
		float pupilDilateClamp = clamp( _fa_freqHigh[1 ].x, -0.3, -0.05 );
		float dilateMask = saturate( length( texCoords * ( 2.5 / pupilDilateClamp ) ) );
		float dilateMask2 = 1.0 - saturate( length( vec3( texCoords, 0.0 ) * 5.3 ) );
		vec2 dilation = normalize( vec3( texCoords, 0.0 ) ).xy * dilateMask * dilateMask2 * pupilDilateClamp;
		texCoords += dilation;
		texCoords += 0.5;
		vec4 diffuseTex = tex2DDeGammaApprox( samp_transmap, texCoords );
		vec3 eyeColor = diffuseTex.xyz * mix( _fa_freqHigh[2 ].xyz, _fa_freqHigh[3 ].xyz, vec3( diffuseTex.w ) ) * 2.0;
		vec3 localNormal = normalTex.xyz * 2.0 - 1.0;
		vec3 specNormal;
		specNormal.x = dot3( localNormal, vofi_TexCoord1 );
		specNormal.y = dot3( localNormal, vofi_TexCoord2 );
		specNormal.z = dot3( localNormal, vofi_TexCoord3 );
		specNormal = normalize( specNormal );
		localNormal.xy = mix( localNormal.xy * vec2( -2.0 ), localNormal.xy, vec2( diffuseTex.w ) );
		localNormal = normalize( localNormal );
		vec3 globalNormal;
		globalNormal.x = dot3( localNormal, vofi_TexCoord1 );
		globalNormal.y = dot3( localNormal, vofi_TexCoord2 );
		globalNormal.z = dot3( localNormal, vofi_TexCoord3 );
		globalNormal = normalize( globalNormal );
		vec3 fromViewer = normalize( vofi_TexCoord4.xyz );
		vec4 reflection;
		reflection.xyz = normalize( fromViewer - ( specNormal * dot3( fromViewer, specNormal ) * 2.0 ) );
		reflection.w = 0.0;
		vec3 envColor = texCUBElod( samp_dynamicenvmap, reflection ).xyz;
		float fresnel = 1.0 - saturate( dot( -fromViewer, specNormal ) );
		envColor *= ( ( 1.0 - diffuseTex.w ) + 0.2 ) * ( vofi_TexCoord5.w + 0.5 ) * fresnel;
		float specularScale = 16 * saturate( 1.05 - diffuseTex.w );
		vec4 color;
		vec3 diffuseProbe = texCUBElod( samp_dynamicdiffuseenvmap, reflection ).xyz;
		diffuseProbe = SRGBlinearApprox( diffuseProbe );
		diffuseProbe *= ( ( 1.0 - diffuseTex.w ) + 0.2 ) * ( vofi_TexCoord5.w + 0.5 ) * fresnel;
		color.xyz = diffuseProbe * shadowTex.xyz;
		color.w = 1.0;
		out_FragColor0 = color;
		out_FragColor1 = color;
		out_FragColor2 = vec4( 0.0 );
	}
}