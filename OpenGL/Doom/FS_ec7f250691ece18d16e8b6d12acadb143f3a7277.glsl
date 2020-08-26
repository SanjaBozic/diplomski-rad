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
uniform vec4 _fa_freqLow [4];
uniform sampler2D samp_flowvariation;
uniform sampler2D samp_transmap;
uniform sampler2D samp_viewdepthmap;

in vec4 vofi_TexCoord5;
in vec4 vofi_TexCoord4;
in vec4 vofi_TexCoord0;
in vec4 vofi_TexCoord1;
in vec4 vofi_TexCoord2;
in vec4 vofi_Color;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;

float SRGBlinear ( float value ) { if ( value <= 0.04045 ) {
		return ( value / 12.92 );
	} else {
		return pow( ( value / 1.055 ) + 0.0521327, 2.4 );
	}
}
vec3 SRGBlinear ( vec3 sRGB ) {
	vec3 outLinear;
	outLinear.r = SRGBlinear( sRGB.r );
	outLinear.g = SRGBlinear( sRGB.g );
	outLinear.b = SRGBlinear( sRGB.b );
	return outLinear;
}
vec4 SRGBlinear ( vec4 sRGBA ) {
	vec4 outLinear = vec4( SRGBlinear( sRGBA.rgb ), 1 );
	outLinear.a = SRGBlinear( sRGBA.a );
	return outLinear;
}
float DeGamma ( float value ) {
	return SRGBlinear( value );
}
vec4 DeGamma ( vec4 color ) {
	return SRGBlinear( color );
}
vec3 DeGamma ( vec3 color ) {
	return SRGBlinear( color );
}
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
vec4 tex2DDeGamma ( sampler2D image, vec2 texcoord ) {
	vec4 color = tex2D( image, texcoord );
	color = DeGamma( color );
	return color;
}
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
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
		vec4 curr_frame = tex2DDeGamma( samp_transmap, flowMap.xy );
		vec4 next_frame = tex2DDeGamma( samp_transmap, flowMap.zw );
		vec4 final = mix( curr_frame, next_frame, vofi_TexCoord1.z );
		final.w = final.y;
		final.xyz = final.xxx;
		clip( final.w - 1e-6 );
		float opacitySoftZScale = 1.0;
		{
			float depth = tex2Ddepth( samp_viewdepthmap, tc );
			float r1 = 1.0 / ( 1.0 - depth );
			float r2 = 1.0 / ( 1.0 - gl_FragCoord.z );
			opacitySoftZScale = saturate( ( r1 - r2 ) * vofi_TexCoord1.y );
			opacitySoftZScale = saturate( mix( opacitySoftZScale, opacitySoftZScale * 500.0, _fa_freqHigh[4 ].x ) );
		};
		final.xyz *= vec3( vofi_TexCoord2.x );
		final.w *= opacitySoftZScale;
		final.xyz *= vofi_Color.xyz;
		final.w = mix( final.w - ( 1.0 - pow( vofi_Color.w, 0.5 ) ), final.w * vofi_Color.a, vofi_TexCoord1.w );
		float fogDensity = saturate( vofi_TexCoord1.x );
		final.xyz = mix( _fa_freqLow[1 ].xyz * vec3( _fa_freqLow[2 ].x ), final.xyz, fogDensity );
		final.xyz = mix( final.xyz * _fa_freqHigh[5 ].x, final.xyz * _fa_freqLow[3 ].x, ( 1.0 - _fa_freqHigh[6 ].x ) );
		out_FragColor0.rgb = final.xyz;
		out_FragColor0.a = saturate( final.w );
		{
			out_FragColor0.a = saturate( out_FragColor0.a );
			out_FragColor0.rgb *= out_FragColor0.a;
		};
	}
}