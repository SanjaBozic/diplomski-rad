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
uniform vec4 _fa_freqLow [1];
uniform sampler2D samp_transmap;
uniform sampler2D samp_viewdepthmap;

in vec4 vofi_TexCoord0;
in vec4 vofi_TexCoord3;
in vec4 vofi_TexCoord1;
in vec4 vofi_Color;
in vec4 vofi_TexCoord2;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;

vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
float GetFragmentDepth ( vec4 fragmentPos ) { return fragmentPos.z; }
vec4 ComputeDistortionMV ( vec2 distortVec, float blur ) {
	vec4 final;
	final.xy = saturate( distortVec * 0.5 + 0.5 );
	final.z = blur * 0.5 + 0.5;
	final.w = 1.0;
	return final;
}
void main() {
	{
		float localTime = _fa_freqLow[0 ].x * _fa_freqHigh[0 ].x;
		vec2 waveTC1 = vofi_TexCoord0.xy + vofi_TexCoord3.xy * ( 1.0 - fract( localTime ) );
		vec2 waveTC2 = vofi_TexCoord0.xy + vofi_TexCoord3.xy * ( 1.0 - fract( localTime + 0.5 ) );
		vec4 waves1 = tex2D( samp_transmap, waveTC1 );
		vec4 waves2 = tex2D( samp_transmap, waveTC2 );
		float lerpVal = abs( fract( localTime ) * 2.0 - 1.0 );
		vec4 waves = mix( waves1, waves2, lerpVal );
		float interpolatedDepth = GetFragmentDepth( gl_FragCoord );
		vec2 tc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[1 ] );
		float depth = tex2Ddepth( samp_viewdepthmap, tc );
		float dstDepth = 1.0 / ( 1.0 - depth );
		float srcDepth = 1.0 / ( 1.0 - interpolatedDepth );
		float diameter = ( vofi_TexCoord1.z / 3.14 ) * vofi_TexCoord1.x;
		float viewScale = 1.0 - saturate( ( srcDepth - dstDepth ) / 16.0 );
		float viewFalloff = saturate( srcDepth * 0.05 );
		float mask = 1.0;
		mask *= viewScale * viewFalloff;
		mask *= vofi_Color.w;
		mask *= vofi_TexCoord1.x;
		mask *= 1.0 - vofi_Color.y;
		vec2 dir = mix( vofi_TexCoord1.zw, vofi_TexCoord2.zw, vec2( vofi_TexCoord1.y ) );
		vec2 distortion = vec2( waves.w * mask * mask ) * dir * 0.4;
		float fog = vofi_TexCoord0.z;
		distortion *= vec2( fog );
		out_FragColor0 = ComputeDistortionMV( distortion.xy, 0.00 );
	}
}