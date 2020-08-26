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

uniform vec4 _fa_freqHigh [13];
uniform vec4 _fa_freqLow [1];
uniform sampler2D samp_viewdepthmap;
uniform sampler2D samp_transmap;
uniform sampler2D samp_transmap2;
uniform sampler2D samp_transmap3;

in vec4 vofi_TexCoord0;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;

vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
float GetFragmentDepth ( vec4 fragmentPos ) { return fragmentPos.z; }
void main() {
	{
		float interpolatedDepth = GetFragmentDepth( gl_FragCoord );
		vec2 screenTC = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
		float depth = tex2Ddepth( samp_viewdepthmap, screenTC );
		vec4 edgeWidth = _fa_freqHigh[1 ];
		vec4 gOpacity = _fa_freqHigh[2 ] ;
		vec4 edgeColor = _fa_freqHigh[3 ];
		vec4 edgeOpacity = _fa_freqHigh[2 ];
		vec4 mask = out_FragColor0;
		float dstDepth = 1.0 / ( 1.0 - depth );
		float srcDepth = 1.0 / ( 1.0 - interpolatedDepth );
		float relativeDepth = dstDepth - srcDepth + 1.0;
		float intersect = 1- (saturate ( ( dstDepth - srcDepth) / edgeWidth.x) );
		intersect = (cos( intersect * 6.28 ) * -0.5 + .6 ) * intersect ;
		float foreground = saturate( relativeDepth );
		vec2 tcWorld = vofi_TexCoord0.xy;
		vec2 tcPulse = vofi_TexCoord0.xy;
		vec2 tcMainSurface = vofi_TexCoord0.xy;
		vec2 edgeDiffuseTC1 = tcWorld * _fa_freqHigh[4 ].xy + vec2( _fa_freqLow[0 ].x ) * _fa_freqHigh[4 ].zw;
		vec2 edgeDiffuseTC2 = tcWorld * _fa_freqHigh[5 ].xy + vec2( _fa_freqLow[0 ].x ) * _fa_freqHigh[5 ].zw;
		vec2 edgePulseTC = tcPulse * _fa_freqHigh[5 ].xy - 0.5 + vec2( ( _fa_freqLow[0 ].x ) - 0.15 )* _fa_freqHigh[5 ].zw;
		float horizontalScrollSpeed = _fa_freqLow[0 ].x * _fa_freqHigh[6 ].z ;
		vec2 mainSurfaceTC = tcMainSurface * _fa_freqHigh[6 ].xy + (vec2( horizontalScrollSpeed , _fa_freqLow[0 ].x * _fa_freqHigh[7 ].w) );
		vec3 edgeDiffuse1 = tex2D( samp_transmap, edgeDiffuseTC1 ).xyz * _fa_freqHigh[8 ].x ;
		vec3 edgeDiffuse2 = tex2D( samp_transmap, edgeDiffuseTC2 ).xyz * _fa_freqHigh[8 ].y ;
		vec3 pulse = vec3( tex2D( samp_transmap, edgePulseTC ) * _fa_freqHigh[8 ].z ) ;
		vec3 mainSurface = vec3( tex2D( samp_transmap2, mainSurfaceTC ) * _fa_freqHigh[6 ].w ) * clamp((srcDepth * 0.005), 0.0, 0.7);
		vec3 mainSurface2 = vec3( tex2D( samp_transmap2, edgeDiffuseTC1 ) * _fa_freqHigh[6 ].w ) * clamp((srcDepth * 0.005), 0.0, 0.7);
		vec3 edgeSurface = (edgeDiffuse1 * edgeDiffuse2 * pulse ) * _fa_freqHigh[8 ].w;
		vec3 mainSurfaceMask = tex2D( samp_transmap3, edgeDiffuseTC2 ).xyz * _fa_freqHigh[8 ].y ;
		vec4 colBlue = vec4(0.1, 0.2, 1.0, 0.0) * 0.6;
		vec4 colRed = vec4(0.8, 0.03, 0.02, 0.0) * 0.8;
		vec4 colDefault = _fa_freqHigh[9 ];
		vec4 boundaryColor = mix(mix( colDefault, colBlue, clamp( _fa_freqHigh[10 ].x, 0.0, 1.0) ) , colRed, clamp(( _fa_freqHigh[10 ].x - 1), 0.0, 1.0) ) ;
		vec4 boundaryEdgeColor = intersect * (boundaryColor * edgeOpacity.y) ;
		vec3 normalColor = boundaryColor.xyz * (mainSurface * mainSurface2 ) * mainSurfaceMask.x ;
		vec4 final = vec4( 0.0 );
		final.xyz = mix( normalColor.xyz , boundaryEdgeColor.xyz /srcDepth ,intersect );
		final.w = mix( mainSurface.x ,edgeSurface.x , intersect * saturate(vofi_TexCoord0.x - _fa_freqHigh[11 ].x)* edgeWidth.x ) * foreground ;
		final.w *= gOpacity.x * _fa_freqHigh[12 ].x;
		out_FragColor0 = final;
		{
			out_FragColor0.a = saturate( out_FragColor0.a );
			out_FragColor0.rgb *= out_FragColor0.a;
		};
		{
			out_FragColor0.a = 0.0001;
		};
	}
}