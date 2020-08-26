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
uniform vec4 _fa_freqLow [5];
uniform sampler2D samp_transmap;
uniform sampler2D samp_viewdepthmap;

in vec4 vofi_TexCoord1;
in vec4 vofi_TexCoord0;
in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord3;
in vec4 vofi_TexCoord4;
in vec4 vofi_TexCoord5;
in vec4 vofi_Color;
in vec4 vofi_TexCoord6;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;

vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
float GetFragmentDepth ( vec4 fragmentPos ) { return fragmentPos.z; }
void main() {
	{
		vec3 step = _fa_freqHigh[0 ].xyz;
		vec3 viewdir = normalize( vofi_TexCoord1.xyz );
		viewdir *= 1.0 / viewdir.z;
		vec3 position = vec3( vofi_TexCoord0.xy, 1.0 );
		vec3 newPosition = position;
		vec4 accumulation = vec4( 0.0, 0.0, 0.0, 0.0 );
		vec4 texColor = vec4( 0.0, 0.0, 0.0, 0.0 );
		vec4 texColor2 = vec4( 0.0, 0.0, 0.0, 0.0 );
		float texHeight = 0.0;
		float accumFactor = 0.0;
		for ( int i = 0; accumFactor < 1.0 && i < 100; i++ ) {
			newPosition = position - ( viewdir * step * float( i ) );
			texColor = tex2D( samp_transmap, newPosition.xy * _fa_freqHigh[1 ].xy + vec2( _fa_freqLow[0 ].x ) * _fa_freqHigh[2 ].xy );
			texColor2 = tex2D( samp_transmap, newPosition.xy * _fa_freqHigh[1 ].xy * 0.43 + vec2( _fa_freqLow[0 ].x ) * _fa_freqHigh[2 ].xy );
			texColor *= texColor2;
			texColor = pow( texColor, vec4( 0.5 ) );
			texHeight = texColor.w;
			if ( texHeight >= newPosition.z ) {
				accumulation += texColor * 0.1;
				accumFactor += 0.1;
			}
		}
		float interpolatedDepth = GetFragmentDepth( gl_FragCoord );
		vec2 screenTC = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[3 ] );
		float depth = tex2Ddepth( samp_viewdepthmap, screenTC );
		float dstDepth = 1.0 / ( 1.0 - depth );
		float srcDepth = 1.0 / ( 1.0 - interpolatedDepth );
		srcDepth += ( 1.0 - accumulation.w ) * _fa_freqHigh[0 ].w * length( viewdir ) * ( 1 / 3.14 );
		float scale = saturate( ( dstDepth - srcDepth ) * ( 1.0 / _fa_freqHigh[4 ].x ) );
		vec3 worldNormal = ( accumulation.x * vofi_TexCoord2.xyz );
		worldNormal += ( accumulation.y * vofi_TexCoord3.xyz );
		worldNormal += ( accumulation.z * vofi_TexCoord4.xyz );
		vec3 worldPos = vofi_TexCoord5.xyz;
		float light1Atn = 1.0 - saturate( length( worldPos - _fa_freqHigh[5 ].xyz ) / _fa_freqHigh[5 ].w );
		light1Atn *= light1Atn;
		vec3 light1Dir = normalize( _fa_freqHigh[5 ].xyz - worldPos );
		float NdotL1 = dot( light1Dir, worldNormal );
		NdotL1 = saturate( NdotL1 );
		float light2Atn = 1.0 - saturate( length( worldPos - _fa_freqHigh[6 ].xyz ) / _fa_freqHigh[6 ].w );
		light2Atn *= light2Atn;
		vec3 light2Dir = normalize( _fa_freqHigh[6 ].xyz - worldPos );
		float NdotL2 = dot( light2Dir, worldNormal );
		NdotL2 = saturate( NdotL2 );
		vec3 ambient = _fa_freqHigh[7 ].xyz;
		vec3 lighting = ( light1Atn * NdotL1 * _fa_freqHigh[8 ].xyz * _fa_freqHigh[8 ].w ) + ( light2Atn * NdotL2 * _fa_freqHigh[9 ].xyz * _fa_freqHigh[9 ].w ) + ambient;
		vec4 final = accumulation;
		final.xyz = vec3( accumulation.w ) * lighting;
		final.w = 1.0 - ( 1.0 - scale ) * ( 1.0 - scale );
		final *= vofi_Color;
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
		final.xyz = mix( fogColor, final.xyz, fogAmount );
		out_FragColor0 = final;
		{
			out_FragColor0.a = saturate( out_FragColor0.a );
			out_FragColor0.rgb *= out_FragColor0.a;
		};
	}
}