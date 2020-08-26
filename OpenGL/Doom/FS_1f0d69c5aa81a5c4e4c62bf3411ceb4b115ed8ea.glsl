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

uniform vec4 _fa_freqHigh [1];
uniform sampler2D samp_searchtex;
uniform sampler2D samp_edgestex;
uniform sampler2D samp_areatex;

in vec4 gl_FragCoord;

out vec4 out_FragColor0;
out vec4 out_FragColor1;

vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
float SMAASearchLength ( vec2 e, float bias, float scale ) {
	e.r = bias + e.r * scale;
	return 255.0 * tex2Dlod( samp_searchtex, vec4( e, 0, 0 ) ).r;
}
float SMAASearchXLeft ( vec2 texcoord, float end ) {
	vec2 e = vec2(0.0, 1.0); while ( texcoord.x > end && e.g > 0.8281 && e.r == 0.0 ) {
		e = tex2Dlod( samp_edgestex, vec4( texcoord, 0, 0 ) ).rg;
		texcoord -= vec2( 2.0, 0.0 ) * _fa_freqHigh[0 ].zw;
	}
	texcoord.x += 0.25 * _fa_freqHigh[0 ].z;
	texcoord.x += _fa_freqHigh[0 ].z;
	texcoord.x += 2.0 * _fa_freqHigh[0 ].z;
	texcoord.x -= _fa_freqHigh[0 ].z * SMAASearchLength( e, 0.0, 0.5 );
	return texcoord.x;
}
float SMAASearchXRight ( vec2 texcoord, float end ) {
	vec2 e = vec2( 0.0, 1.0 ); while ( texcoord.x < end && e.g > 0.8281 && e.r == 0.0 ) {
		e = tex2Dlod( samp_edgestex, vec4( texcoord, 0, 0 ) ).rg;
		texcoord += vec2( 2.0, 0.0 ) * _fa_freqHigh[0 ].zw;
	}
	texcoord.x -= 0.25 * _fa_freqHigh[0 ].z;
	texcoord.x -= _fa_freqHigh[0 ].z;
	texcoord.x -= 2.0 * _fa_freqHigh[0 ].z;
	texcoord.x += _fa_freqHigh[0 ].z * SMAASearchLength( e, 0.5, 0.5 );
	return texcoord.x;
}
float SMAASearchYUp ( vec2 texcoord, float end ) {
	vec2 e = vec2( 1.0, 0.0 ); while ( texcoord.y > end && e.r > 0.8281 && e.g == 0.0 ) {
		e = tex2Dlod( samp_edgestex, vec4( texcoord, 0, 0 ) ).rg;
		texcoord -= vec2( 0.0, 2.0 ) * _fa_freqHigh[0 ].zw;
	}
	texcoord.y += 0.25 * _fa_freqHigh[0 ].w;
	texcoord.y += _fa_freqHigh[0 ].w;
	texcoord.y += 2.0 * _fa_freqHigh[0 ].w;
	texcoord.y -= _fa_freqHigh[0 ].w * SMAASearchLength( e.gr, 0.0, 0.5 );
	return texcoord.y;
}
float SMAASearchYDown ( vec2 texcoord, float end ) {
	vec2 e = vec2( 1.0, 0.0 ); while ( texcoord.y < end && e.r > 0.8281 && e.g == 0.0 ) {
		e = tex2Dlod( samp_edgestex, vec4( texcoord, 0, 0 ) ).rg;
		texcoord += vec2(0.0, 2.0) * _fa_freqHigh[0 ].zw;
	}
	texcoord.y -= 0.25 * _fa_freqHigh[0 ].w;
	texcoord.y -= _fa_freqHigh[0 ].w;
	texcoord.y -= 2.0 * _fa_freqHigh[0 ].w;
	texcoord.y += _fa_freqHigh[0 ].w * SMAASearchLength( e.gr, 0.5, 0.5 );
	return texcoord.y;
}
vec2 SMAAArea ( vec2 distance, float e1, float e2, float offset ) {
	vec2 texcoord = 16 * round( 4.0 * vec2( e1, e2 ) ) + distance;
	vec2 SMAA_AREATEX_PIXEL_SIZE = 1.0 / vec2( 160.0, 560.0 );
	texcoord = SMAA_AREATEX_PIXEL_SIZE * texcoord + ( 0.5 * SMAA_AREATEX_PIXEL_SIZE );
	texcoord.y += 0.1428571 * offset;
	return tex2Dlod( samp_areatex, vec4( texcoord, 0, 0 ) ).rg;
}
void main() {
	{
		vec2 tc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
		vec4 weights = vec4( 0.0 );
		vec2 pixcoord = tc.xy / _fa_freqHigh[0 ].zw;
		vec4 offset[3] = {
			vec4( tc.xyxy + vec4( -0.25, -0.125, 1.25, -0.125 ) * _fa_freqHigh[0 ].zwzw ),
			vec4( tc.xyxy + vec4( -0.125, -0.25, -0.125, 1.25 ) * _fa_freqHigh[0 ].zwzw ),
			vec4( tc.xyxy)
		};
		offset[2] = vec4( offset[0].xz, offset[1].yw ) + vec4( -2, 2, -2, 2 ) * _fa_freqHigh[0 ].zzww * 8;
		vec2 e = tex2Dlod( samp_edgestex, vec4( tc.xy, 0, 0 ) ).rg;
		vec4 vSubSampleIndices = vec4( 0 ); if ( e.g > 0.0 ) {
			vec2 d;
			vec2 coords;
			coords.x = SMAASearchXLeft( offset[0].xy, offset[2].x );
			coords.y = offset[1].y;
			d.x = coords.x;
			float e1 = tex2Dlod( samp_edgestex, vec4( coords, 0, 0 ) ).r;
			coords.x = SMAASearchXRight( offset[0].zw, offset[2].y );
			d.y = coords.x;
			d = d / _fa_freqHigh[0 ].z - pixcoord.x;
			vec2 sqrt_d = sqrt( abs( d ) );
			float e2 = tex2Dlod( samp_edgestex, vec4( coords + vec2( 1, 0 ) * _fa_freqHigh[0 ].zw, 0, 0 ) ).r;
			weights.rg = SMAAArea( sqrt_d, e1, e2, vSubSampleIndices.y );
		} if ( e.r > 0.0 ) {
			vec2 d;
			vec2 coords;
			coords.y = SMAASearchYUp( offset[1].xy, offset[2].z );
			coords.x = offset[0].x;
			d.x = coords.y;
			float e1 = tex2Dlod( samp_edgestex, vec4( coords, 0, 0 ) ).g;
			coords.y = SMAASearchYDown( offset[1].zw, offset[2].w );
			d.y = coords.y;
			d = d / _fa_freqHigh[0 ].w - pixcoord.y;
			vec2 sqrt_d = sqrt( abs( d ) );
			float e2 = tex2Dlod( samp_edgestex, vec4( coords + vec2( 0, 1 ) * _fa_freqHigh[0 ].zw, 0, 0 ) ).g;
			weights.ba = SMAAArea( sqrt_d, e1, e2, vSubSampleIndices.x );
		}
		out_FragColor0.rgb = weights.rgb;
		out_FragColor1.r = weights.a;
	}
}