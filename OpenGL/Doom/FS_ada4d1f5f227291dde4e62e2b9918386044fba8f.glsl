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
uniform vec4 _fa_freqLow [2];
uniform sampler2D samp_sparediffusemap;
uniform sampler2D samp_sparebumpmap;

in vec4 vofi_TexCoord0;
in vec4 vofi_Color;
in vec4 vofi_TexCoord5;
in vec4 vofi_TexCoord1;
in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord3;
in vec4 vofi_TexCoord6;

out vec4 out_FragColor0;
out vec4 out_FragColor1;
out vec4 out_FragColor2;

float asfloat ( uint x ) { return uintBitsToFloat( x ); }
float asfloat ( int x ) { return intBitsToFloat( x ); }
int asint ( float x ) { return floatBitsToInt( x ); }
vec2 asfloat ( uvec2 x ) { return uintBitsToFloat( x ); }
vec2 asfloat ( ivec2 x ) { return intBitsToFloat( x ); }
ivec2 asint ( vec2 x ) { return floatBitsToInt( x ); }
vec3 asfloat ( uvec3 x ) { return uintBitsToFloat( x ); }
vec3 asfloat ( ivec3 x ) { return intBitsToFloat( x ); }
ivec3 asint ( vec3 x ) { return floatBitsToInt( x ); }
vec4 asfloat ( uvec4 x ) { return uintBitsToFloat( x ); }
vec4 asfloat ( ivec4 x ) { return intBitsToFloat( x ); }
ivec4 asint ( vec4 x ) { return floatBitsToInt( x ); }
float sqrtIEEEIntApproximation ( float inX, int inSqrtConst ) {
	int x = asint(inX);
	x = inSqrtConst + (x >> 1);
	return asfloat(x);
}
float fastSqrtNR0 ( float inX ) {
	return sqrtIEEEIntApproximation( inX, 0x1FBD1DF5 );
}
void main() {
	{
		vec4 color = vec4( 0.0 );
		vec2 tc = vofi_TexCoord0.xy;
		vec2 lavaFlow_tc = tc * _fa_freqHigh[0 ].xy + vec2( _fa_freqLow[0 ].x ) * _fa_freqHigh[0 ].zw;
		vec4 lavaFlow = tex2D( samp_sparediffusemap, lavaFlow_tc.xy );
		vec4 lavaFlowNormal = tex2D( samp_sparebumpmap, lavaFlow_tc.xy );
		vec4 mask = vofi_Color;
		vec3 toViewer = normalize( _fa_freqLow[1 ].xyz - vofi_TexCoord5.xyz );
		vec3 modelNormal = vec3( vofi_TexCoord1.z, vofi_TexCoord2.z, vofi_TexCoord3.z );
		float fresnel = saturate( dot( toViewer, modelNormal ) );
		fresnel = 1.0 - ( ( 1.0 - fresnel ) * ( 1.0 - mask.w ) );
		mask.x *= fresnel * fresnel;
		float lavaMaskHeight = mix( mask.x, lavaFlow.w, 0.7 );
		float lavaMask = smoothstep( 0.23, 0.9, lavaMaskHeight );
		float lavaMeltMaskHeight = mix( mask.x, lavaFlow.w, 0.7 );
		float lavaMeltMask = smoothstep( 0.15, 0.6, lavaMaskHeight );
		float lavaGlow = lavaMeltMask * ( 1.0 - lavaFlow.w ) + mask.z * vofi_TexCoord6.x;
		vec3 lavaGlowColor = ( _fa_freqHigh[1 ].xyz * lavaGlow * _fa_freqHigh[2 ].x );
		vec4 lavaSpec = vec4( mix( lavaFlow.x, lavaMeltMask, 0.5 ) );
		lavaSpec.w = ( mix( lavaFlow.x, lavaMeltMask, 0.8 ) );
		lavaFlowNormal = mix( lavaFlowNormal, vec4( 0.5 ), vec4( lavaMeltMask * 0.8 ) );
		vec3 lavaFlowNormalWorld;
		{
			vec3 N = lavaFlowNormal.wyz * 2.0 - 1.0;
			N.z = fastSqrtNR0( saturate( 1 - N.x * N.x - N.y * N.y ) );
			lavaFlowNormalWorld.xyz = normalize( vec3( dot( N, vofi_TexCoord1.xyz.xyz ), dot( N, vofi_TexCoord2.xyz.xyz ), dot( N, vofi_TexCoord3.xyz.xyz ) ) );
		};
		vec3 diffuse = lavaFlow.xyz;
		vec3 specular = lavaSpec.xyz;
		float gloss = lavaSpec.w;
		vec3 globalNormal = lavaFlowNormalWorld.xyz;
		vec4 sampleLightmap = vec4( 0.0 );
		out_FragColor0 = color;
		out_FragColor0.xyz += lavaGlowColor;
		out_FragColor0.xyz *= vec3( fresnel );
		out_FragColor1 = vec4( 0.0 );
		{
			out_FragColor1.xyz = globalNormal.xyz * vec3( 0.5 ) + vec3( 0.5 );
			out_FragColor2 = vec4( 0, 0, 0, 0.0 );
		};
	}
}