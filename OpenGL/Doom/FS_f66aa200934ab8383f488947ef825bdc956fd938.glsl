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
uniform vec4 _fa_freqLow [7];
uniform sampler2D samp_flowvariation;
uniform sampler2D samp_transmap;
uniform sampler2D samp_viewdepthmap;
uniform sampler2D samp_particleslightatlasmap;

in vec4 vofi_TexCoord5;
in vec4 vofi_TexCoord4;
in vec4 vofi_TexCoord0;
in vec4 vofi_TexCoord1;
in vec4 vofi_Color;
in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord6;
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
		vec2 timeOffset = vec2( vofi_TexCoord5.x );
		vec2 dtc = ( vofi_TexCoord4.xy - _fa_freqHigh[0 ].zw ) / _fa_freqHigh[0 ].xy;
		vec2 dtcControl = dtc * _fa_freqHigh[1 ].xy + timeOffset + vec2( ( _fa_freqLow[0 ].xy ) * _fa_freqHigh[1 ].zw );
		vec4 flowMap = tex2D( samp_flowvariation, dtcControl );
		flowMap.xy = flowMap.xy * 2.0 - 1.0;
		float flowMask = vofi_TexCoord4.x * ( 1.0 - vofi_TexCoord4.x ) * vofi_TexCoord4.y * ( 1.0 - vofi_TexCoord4.y );
		flowMask = 1.0 - flowMask;
		flowMask *= flowMask * flowMask * flowMask;
		flowMask = 1.0 - flowMask;
		flowMap.xy *= vofi_TexCoord4.xy;
		vec2 uvFlowDirection = vec2( flowMap.x * ( _fa_freqHigh[2 ].x * 0.001 ), flowMap.y * ( _fa_freqHigh[2 ].y * 0.001 ) );
		flowMap.xyzw = vec4( vofi_TexCoord0.xy, vofi_TexCoord0.zw ) + vec4( uvFlowDirection, uvFlowDirection );
		flowMap.xyzw = vec4( mix( vofi_TexCoord0.xy, flowMap.xy, flowMask), mix( vofi_TexCoord0.zw, flowMap.zw, flowMask) );
		flowMap.xyzw = ( flowMap.xyzw - _fa_freqHigh[0 ].zwzw ) / _fa_freqHigh[0 ].xyxy;
		flowMap.xyzw = flowMap.xyzw * _fa_freqHigh[0 ].xyxy + _fa_freqHigh[0 ].zwzw;
		vec2 tc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[3 ] );
		vec4 curr_frame = tex2DDeGammaApprox( samp_transmap, flowMap.xy );
		vec4 next_frame = tex2DDeGammaApprox( samp_transmap, flowMap.zw );
		vec3 albedo = mix( curr_frame.rrr , next_frame.rrr , vofi_TexCoord1.z ) * vofi_Color.rgb;
		float opacity = mix( curr_frame.g , next_frame.g , vofi_TexCoord1.z );
		opacity = mix ( sqrt( opacity ), opacity, vofi_TexCoord1.w ) * vofi_Color.a;
		clip( opacity - 1e-6 );
		float opacitySoftZScale = 1.0;
		{
			float depth = tex2Ddepth( samp_viewdepthmap, tc );
			float r1 = 1.0 / ( 1.0 - depth );
			float r2 = 1.0 / ( 1.0 - gl_FragCoord.z );
			opacitySoftZScale = saturate( ( r1 - r2 ) * vofi_TexCoord1.y );
			opacitySoftZScale = saturate( mix( opacitySoftZScale, opacitySoftZScale * 500.0, _fa_freqHigh[4 ].x ) );
		};
		out_FragColor0.a = opacity * opacitySoftZScale;
		float emissive = vofi_TexCoord2.w;
		vec3 diffuse_lighting = tex2DBicubic( samp_particleslightatlasmap, vofi_TexCoord4.zw, _fa_freqLow[1 ].xy ).xyz;
		vec3 color = ( diffuse_lighting + emissive ) * albedo;
		vec3 fogColor;
		float fogAmount;
		{
			float FLT_EPSILON = 0.0001;
			vec3 fogLightInscatterScaledColor = _fa_freqLow[2 ].xyz * _fa_freqLow[3 ].x;
			vec3 heightFogColor = mix( fogLightInscatterScaledColor, _fa_freqLow[4 ].xyz, vofi_TexCoord6.z );
			fogAmount = saturate( vofi_TexCoord6.y + vofi_TexCoord6.x );
			float fogSafeAmount = max( fogAmount, FLT_EPSILON );
			float fogSelection = max( 0.0, ( fogSafeAmount - vofi_TexCoord6.x ) / fogSafeAmount );
			fogColor = mix( _fa_freqLow[5 ].xyz, heightFogColor, fogSelection );
			fogAmount = 1.0 - fogAmount;
		};
		color.xyz = mix( fogColor * vec3( _fa_freqLow[6 ].x ), color.xyz, fogAmount );
		out_FragColor0.rgb = color;
		{
			out_FragColor0.a = saturate( out_FragColor0.a );
			out_FragColor0.rgb *= out_FragColor0.a;
		};
	}
}