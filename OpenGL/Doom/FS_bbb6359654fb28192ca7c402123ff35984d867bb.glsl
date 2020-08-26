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
uniform vec4 _fa_freqLow [1];
uniform sampler2D samp_transmap1;

in vec4 vofi_Color;
in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord1;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
void main() {
	{
		clip( vofi_Color.w - 0.01 );
		vec3 normal = -normalize( cross( dFdx( vofi_TexCoord2.xyz ), dFdy( vofi_TexCoord2.xyz ) ) );
		vec3 lightDirection = normalize( vec3( 1.0, 1.0, -1.0 ) );
		vec3 color = 0.75 * saturate( vec3( dot3( normal, lightDirection ) ) ) * vofi_Color.xyz;
		color += vec3( 0.45 ) * vofi_Color.xyz;
		color = saturate( color );
		float addColorFactor = saturate( abs( vofi_TexCoord1.z - _fa_freqHigh[0 ].z ) / ( _fa_freqHigh[0 ].w * 0.7 ) );
		addColorFactor = saturate( addColorFactor - _fa_freqHigh[0 ].y ); if ( _fa_freqHigh[0 ].x > 0.0 ) {
			addColorFactor = 0.0;
		}
		vec3 toPlayer = _fa_freqLow[0 ].xyz - vofi_TexCoord1.xyz;
		float yellowContribution = 1.0 - saturate( length( toPlayer ) / ( 500.0 ) );
		vec3 V = normalize( _fa_freqHigh[1 ].xyz - gl_FragCoord.xyz );
		vec3 H = normalize( lightDirection + V );
		float specularLight = pow( max( dot (normal, H ), 0.0 ), 32.0 );
		vec3 specularContribution = vec3( 0.45 * specularLight ); if ( length( vofi_Color ) == 0.0 ) {
			specularContribution = vec3( 0.0 );
		}
		vec2 tc = vofi_TexCoord1.xy * 0.0025;
		vec4 textureColor = vec4( tex2Dlod( samp_transmap1, vec4( tc, 0.0, 0.0 ) ).z ) * ( 1.0 - addColorFactor );
		out_FragColor0.xyz = saturate( textureColor.xyz + ( 1.0 - addColorFactor ) * color + specularContribution ) + ( vec3( 0.75, 0.75, 0.0 ) * yellowContribution );
		out_FragColor0.w = 1.0;
		{
			if ( _fa_freqHigh[2 ].x == 0 ) {
			} else if ( _fa_freqHigh[2 ].x == 1 ) {
				{
					out_FragColor0.a = 0.0001;
				};
			} else if ( _fa_freqHigh[2 ].x == 2 ) {
				{
					out_FragColor0.a = 1.0;
				};
			} else if ( _fa_freqHigh[2 ].x == 3 ) {
				{
					out_FragColor0.a = saturate( out_FragColor0.a );
					out_FragColor0.rgb *= out_FragColor0.a;
				};
			} else if ( _fa_freqHigh[2 ].x == 4 ) {
				{
					out_FragColor0.a = saturate( out_FragColor0.a );
					out_FragColor0.rgb *= out_FragColor0.a;
				};
				{
					out_FragColor0.a = 0.0001;
				};
			}
		};
	}
}