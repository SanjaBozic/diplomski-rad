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
uniform vec4 _fa_freqLow [6];
uniform sampler2D samp_transmap;
uniform sampler2D samp_viewdepthmap;
uniform sampler2D samp_particleslightatlasmap;

in vec4 vofi_TexCoord0;
in vec4 vofi_TexCoord1;
in vec4 vofi_Color;
in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord3;
in vec4 vofi_TexCoord6;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
float asfloat ( uint x ) { return uintBitsToFloat( x ); }
float asfloat ( int x ) { return intBitsToFloat( x ); }
uint asuint ( float x ) { return floatBitsToUint( x ); }
vec2 asfloat ( uvec2 x ) { return uintBitsToFloat( x ); }
vec2 asfloat ( ivec2 x ) { return intBitsToFloat( x ); }
uvec2 asuint ( vec2 x ) { return floatBitsToUint( x ); }
vec3 asfloat ( uvec3 x ) { return uintBitsToFloat( x ); }
vec3 asfloat ( ivec3 x ) { return intBitsToFloat( x ); }
uvec3 asuint ( vec3 x ) { return floatBitsToUint( x ); }
vec4 asfloat ( uvec4 x ) { return uintBitsToFloat( x ); }
vec4 asfloat ( ivec4 x ) { return intBitsToFloat( x ); }
uvec4 asuint ( vec4 x ) { return floatBitsToUint( x ); }
float ApproxPow ( float fBase, float fPower ) {
	return asfloat( uint( fPower * float( asuint( fBase ) ) - ( fPower - 1 ) * 127 * ( 1 << 23 ) ) );
}
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
float GetLuma ( vec3 c ) {
	return dot( c, vec3( 0.2126, 0.7152, 0.0722 ) );
}
vec3 fresnelSchlick ( vec3 f0, float costheta ) {
	const float baked_spec_occl = saturate( 50.0 * dot( f0, vec3( 0.3333 ) ) );
	return saturate( f0 + ( baked_spec_occl - f0 ) * ApproxPow( saturate( 1.0 - costheta ), 5.0 ) );
}
vec3 specBRDF ( vec3 N, vec3 V, vec3 L, vec3 f0, float smoothness ) {
	const vec3 H = normalize( V + L );
	float m = ( 1 - smoothness * 0.8 );
	m *= m;
	m *= m;
	float m2 = m * m;
	float NdotH = saturate( dot( N, H ) );
	float spec = (NdotH * NdotH) * (m2 - 1) + 1;
	spec = m2 / ( spec * spec + 1e-8 );
	float Gv = saturate( dot( N, V ) ) * (1.0 - m) + m;
	float Gl = saturate( dot( N, L ) ) * (1.0 - m) + m;
	spec /= ( 4.0 * Gv * Gl + 1e-8 );
	return fresnelSchlick( f0, dot( L, H ) ) * spec;
}
float w0 (float a) { return (1.0/6.0)*(a*(a*(-a + 3.0) - 3.0) + 1.0); }
float w1 (float a) { return (1.0/6.0)*(a*a*(3.0*a - 6.0) + 4.0); }
float w2 (float a) { return (1.0/6.0)*(a*(a*(-3.0*a + 3.0) + 3.0) + 1.0); }
float w3 (float a) { return (1.0/6.0)*(a*a*a); }
float g0 (float a) { return w0(a) + w1(a); }
float g1 (float a) { return w2(a) + w3(a); }
float h0 (float a) { return -1.0 + w1(a) / (w0(a) + w1(a)); }
float h1 (float a) { return 1.0 + w3(a) / (w2(a) + w3(a)); }
vec4 tex2DBicubic ( sampler2D image,
vec2 uv, vec2 res ) {
	uv = uv * res + 0.5;
	const vec2 iuv = floor( uv );
	const vec2 fuv = fract( uv );
	const float g0x = g0( fuv.x );
	const float g1x = g1( fuv.x );
	const float h0x = h0( fuv.x );
	const float h1x = h1( fuv.x );
	const float h0y = h0( fuv.y );
	const float h1y = h1( fuv.y );
	const vec2 p0 = ( vec2( iuv.x + h0x, iuv.y + h0y ) - 0.5 ) / res;
	const vec2 p1 = ( vec2( iuv.x + h1x, iuv.y + h0y ) - 0.5 ) / res;
	const vec2 p2 = ( vec2( iuv.x + h0x, iuv.y + h1y ) - 0.5 ) / res;
	const vec2 p3 = ( vec2( iuv.x + h1x, iuv.y + h1y ) - 0.5 ) / res;
	const vec4 t0 = tex2Dlod( image, vec4( p0, 0, 0 ) );
	const vec4 t1 = tex2Dlod( image, vec4( p1, 0, 0 ) );
	const vec4 t2 = tex2Dlod( image, vec4( p2, 0, 0 ) );
	const vec4 t3 = tex2Dlod( image, vec4( p3, 0, 0 ) );
	return g0( fuv.y ) * ( g0x * t0 + g1x * t1 ) + g1( fuv.y ) * ( g0x * t2 + g1x * t3 );
}
void main() {
	{
		vec2 tc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
		vec4 curr_frame = tex2D( samp_transmap, vofi_TexCoord0.xy );
		vec4 next_frame = tex2D( samp_transmap, vofi_TexCoord0.zw );
		vec4 sampleNormal = mix( curr_frame, next_frame, vofi_TexCoord1.z );
		vec2 normalXY = sampleNormal.xy;
		float opacity = 1.0;
		opacity = mix ( sqrt( opacity ), opacity, vofi_TexCoord1.w ) * vofi_Color.a;
		float sampleOpacity = sampleNormal.y;
		sampleOpacity = saturate( sampleOpacity * 5.0 );
		clip( sampleOpacity * opacity - _fa_freqHigh[1 ].x );
		float opacitySoftZScale = 1.0;
		{
			float depth = tex2Ddepth( samp_viewdepthmap, tc );
			float r1 = 1.0 / ( 1.0 - depth );
			float r2 = 1.0 / ( 1.0 - gl_FragCoord.z );
			opacitySoftZScale = saturate( ( r1 - r2 ) * vofi_TexCoord1.y );
			opacitySoftZScale = saturate( mix( opacitySoftZScale, opacitySoftZScale * 500.0, _fa_freqHigh[2 ].x ) );
		};
		vec3 color = vec3( 0.0 ); if ( _fa_freqHigh[3 ].x == 0.0 ) {
			vec3 localNormal = vec3( ( normalXY * 2.0 ) - 1.0, 0.0 );
			localNormal.z = sqrt( 1.0 - min( dot3( localNormal, localNormal ), 1.0 ) );
			localNormal = normalize( localNormal );
			vec3 emissive = vofi_Color.xyz * vofi_TexCoord2.w;
			vec3 albedo = vec3( 0.63, 0.39, 0.39 );
			vec2 atlasTC = vec2( vofi_TexCoord1.x, vofi_TexCoord3.x );
			vec3 diffuse_lighting = tex2DBicubic( samp_particleslightatlasmap, atlasTC, _fa_freqLow[0 ].xy ).xyz * albedo;
			float lightLum = GetLuma( diffuse_lighting );
			vec3 view = normalize( vec3( 0, -0.5, 0.5 ) );
			vec3 spec = specBRDF( localNormal, view, vec3( lightLum ), vec3( _fa_freqHigh[4 ] ), _fa_freqHigh[5 ].x );
			spec = saturate( spec );
			color = vofi_Color.xyz * ( diffuse_lighting + emissive );
			color += vec3( spec ) * diffuse_lighting;
			vec3 fogColor;
			float fogAmount;
			{
				float FLT_EPSILON = 0.0001;
				vec3 fogLightInscatterScaledColor = _fa_freqLow[1 ].xyz * _fa_freqLow[2 ].x;
				vec3 heightFogColor = mix( fogLightInscatterScaledColor, _fa_freqLow[3 ].xyz, vofi_TexCoord6.z );
				fogAmount = saturate( vofi_TexCoord6.y + vofi_TexCoord6.x );
				float fogSafeAmount = max( fogAmount, FLT_EPSILON );
				float fogSelection = max( 0.0, ( fogSafeAmount - vofi_TexCoord6.x ) / fogSafeAmount );
				fogColor = mix( _fa_freqLow[4 ].xyz, heightFogColor, fogSelection );
				fogAmount = 1.0 - fogAmount;
			};
			color.xyz = mix( fogColor * vec3( _fa_freqLow[5 ].x ), color.xyz, fogAmount );
		}
		if ( _fa_freqHigh[3 ].x > 0.0 ) {
			color = vofi_Color.xyz + vec3( sampleNormal.x * sampleNormal.x ) * vec3( sampleNormal.y * sampleNormal.y );
			color = mix( color.xyz, color.xyz * ( _fa_freqHigh[6 ].x * vofi_TexCoord2.w + 1.0 ), vec3( _fa_freqHigh[3 ].x ) );
		}
		vec3 fogColor;
		float fogAmount;
		{
			float FLT_EPSILON = 0.0001;
			vec3 fogLightInscatterScaledColor = _fa_freqLow[1 ].xyz * _fa_freqLow[2 ].x;
			vec3 heightFogColor = mix( fogLightInscatterScaledColor, _fa_freqLow[3 ].xyz, vofi_TexCoord6.z );
			fogAmount = saturate( vofi_TexCoord6.y + vofi_TexCoord6.x );
			float fogSafeAmount = max( fogAmount, FLT_EPSILON );
			float fogSelection = max( 0.0, ( fogSafeAmount - vofi_TexCoord6.x ) / fogSafeAmount );
			fogColor = mix( _fa_freqLow[4 ].xyz, heightFogColor, fogSelection );
			fogAmount = 1.0 - fogAmount;
		};
		color.xyz = mix( fogColor * vec3( _fa_freqLow[5 ].x ), color.xyz, fogAmount );
		out_FragColor0.rgb = color;
		out_FragColor0.a = sampleOpacity * vofi_Color.w * opacitySoftZScale;
		{
			out_FragColor0.a = saturate( out_FragColor0.a );
			out_FragColor0.rgb *= out_FragColor0.a;
		};
	}
}