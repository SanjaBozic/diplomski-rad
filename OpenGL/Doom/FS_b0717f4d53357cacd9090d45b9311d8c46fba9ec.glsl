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

uniform vec4 _fa_freqHigh [2];
uniform vec4 _fa_freqLow [4];
uniform sampler2D samp_viewdepthmap;
uniform sampler2D samp_transmap;
uniform sampler2D samp_spheremap_spec;
uniform sampler2D samp_particleslightatlasmap;
uniform sampler2D samp_lightsatlasmap;
uniform sampler2DShadow samp_shadowatlasdepthcomparemap;
uniform samplerCubeArray samp_envprobesmaparray;

in vec4 vofi_TexCoord0;
in vec4 vofi_TexCoord1;
in vec4 vofi_TexCoord8;
in vec4 vofi_Color;
in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord4;
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
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
float shadow2Ddepth ( sampler2DShadow image, vec3 texcoord ) { return textureLod( image, texcoord, 0 ).x; }
float GetFragmentDepth ( vec4 fragmentPos ) { return fragmentPos.z; }
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
		float interpolatedDepth = GetFragmentDepth( gl_FragCoord );
		float fogVal = vofi_TexCoord0.z;
		float alphaScale = vofi_TexCoord0.w;
		float frameFrac = vofi_TexCoord1.z;
		vec2 screenTC = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
		float scale;
		{
			float depth = tex2Ddepth( samp_viewdepthmap, screenTC );
			float r1 = 1.0 / ( 1.0 - depth );
			float r2 = 1.0 / ( 1.0 - interpolatedDepth );
			scale = saturate( ( r1 - r2 ) * alphaScale );
			scale = saturate( mix( scale, scale * 500.0, 0.0 ) );
		};
		vec4 color;
		{
			vec4 result0 = tex2Dlod( samp_transmap, vec4( vofi_TexCoord0.xy, 0.0, 0.0 ) ) * ( 1.0 - frameFrac );
			vec4 result1 = tex2Dlod( samp_transmap, vec4( vofi_TexCoord1.xy, 0.0, 0.0 ) ) * ( frameFrac );
			color = ( result0 + result1 );
		};
		vec3 toViewer;
		toViewer = normalize( _fa_freqLow[0 ].xyz - vofi_TexCoord8.xyz );
		vec3 particleNormal;
		particleNormal = normalize( vofi_TexCoord8.xyz - _fa_freqLow[0 ].xyz );
		vec4 globalReflection;
		globalReflection.xyz = reflect( -toViewer, particleNormal);
		globalReflection.w = 0.0;
		vec4 texel = SRGBlinearApprox( color );
		clip( texel.w - 0.05 );
		vec4 final = vec4( 0.0 );
		vec4 spec = vec4( 0.0 );
		final.xyz = vec3( texel.x * texel.y );
		final.w = texel.w;
		spec = vec4( texel.z );
		vec4 environmentColor;
		vec3 n = vec3( color.xy * 2 - 1, 0 );
		n.z = sqrt( saturate( 1 - dot( n.xy, n.xy ) ) ) ;
		vec3 R = n.xyz;
		vec2 tc_sm =( R.xy / sqrt( R.x * R.x + R.y * R.y + ( R.z + 1 ) * ( R.z + 1 ) ) ) * 0.5 + 0.5;
		environmentColor = tex2D( samp_spheremap_spec, tc_sm.xy );
		environmentColor *= environmentColor;
		environmentColor = vec4( dot( environmentColor.rgb, vec3( 0.3 ) ) );
		final.xyz *= vofi_Color.xyz * vofi_TexCoord2.x;
		vec3 emission = final.xyz * 10.0;
		float spec_ratio = 0.1;
		vec3 diffuse_lighting = tex2DBicubic( samp_particleslightatlasmap, vofi_TexCoord4.xy, _fa_freqLow[1 ].xy ).xyz;
		final.xyz = ( saturate( final.xyz * 4.0 ) + spec_ratio * environmentColor.xyz ) * diffuse_lighting;
		final.w *= vofi_Color.w * vofi_TexCoord2.y;
		final.w *= scale;
		final.w = saturate( final.w );
		float fogDensity = saturate( fogVal );
		final.xyz = mix( _fa_freqLow[2 ].xyz * vec3( _fa_freqLow[3 ].x ), final.xyz, fogDensity );
		color.xyz += 0.0*tex2Dlod( samp_lightsatlasmap, vec4( 0 ) ).xyz;
		color.xyz += 0.0*vec3( shadow2Ddepth( samp_shadowatlasdepthcomparemap, vec3( 0, 0, 0 ) ) );
		color.xyz += 0.0*texCUBEARRAYlod( samp_envprobesmaparray, vec4( 0, 0, 0, 0 ), 6 ).xyz;
		final.xyz = mix(final.xyz, emission, _fa_freqHigh[1 ].x);
		out_FragColor0 = final;
		{
			out_FragColor0.a = saturate( out_FragColor0.a );
			out_FragColor0.rgb *= out_FragColor0.a;
		};
	}
}