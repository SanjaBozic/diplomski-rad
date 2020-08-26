#version 430 core
#extension GL_ARB_shader_clock : enable
//This is a compute Shader

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

uniform vec4 _ca_freqHigh [4];
uniform vec4 _ca_freqLow [3];
layout( local_size_x = 8, local_size_y = 8, local_size_z = 1 ) in ;
uniform sampler2D samp_viewcolormap;
uniform sampler2D samp_tex0;
layout( binding = 0, r11f_g11f_b10f ) uniform image2D ib_computeupsampletex ;
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
float linearSRGB ( float value ) { if ( value > 0.0031308 ) {
		return pow( value, 1.0 / 2.4 ) * 1.055 - 0.055;
	} else {
		return value * 12.92;
	}
}
vec3 linearSRGB ( vec3 inLinear ) {
	vec3 sRGB;
	sRGB.r = linearSRGB( inLinear.r );
	sRGB.g = linearSRGB( inLinear.g );
	sRGB.b = linearSRGB( inLinear.b );
	return sRGB;
}
vec4 linearSRGB ( vec4 inLinear ) {
	vec4 sRGBA = vec4( linearSRGB( inLinear.rgb ), 1 );
	sRGBA.a = linearSRGB( inLinear.a );
	return sRGBA;
}
vec4 MatrixMul ( vec3 pos, mat4x4 mat ) {
	return vec4( ( pos.x * mat[0].x + ( pos.y * mat[0].y + ( pos.z * mat[0].z + mat[0].w ) ) ),
	( pos.x * mat[1].x + ( pos.y * mat[1].y + ( pos.z * mat[1].z + mat[1].w ) ) ),
	( pos.x * mat[2].x + ( pos.y * mat[2].y + ( pos.z * mat[2].z + mat[2].w ) ) ),
	( pos.x * mat[3].x + ( pos.y * mat[3].y + ( pos.z * mat[3].z + mat[3].w ) ) ) );
}
vec3 MatrixMul ( vec3 pos, mat3x4 mat ) {
	return vec3( ( pos.x * mat[0].x + ( pos.y * mat[0].y + ( pos.z * mat[0].z + mat[0].w ) ) ),
	( pos.x * mat[1].x + ( pos.y * mat[1].y + ( pos.z * mat[1].z + mat[1].w ) ) ),
	( pos.x * mat[2].x + ( pos.y * mat[2].y + ( pos.z * mat[2].z + mat[2].w ) ) ) );
}
vec4 MatrixMul ( vec3 pos, vec4 matX, vec4 matY, vec4 matZ, vec4 matW ) {
	return vec4( ( pos.x * matX.x + ( pos.y * matX.y + ( pos.z * matX.z + matX.w ) ) ),
	( pos.x * matY.x + ( pos.y * matY.y + ( pos.z * matY.z + matY.w ) ) ),
	( pos.x * matZ.x + ( pos.y * matZ.y + ( pos.z * matZ.z + matZ.w ) ) ),
	( pos.x * matW.x + ( pos.y * matW.y + ( pos.z * matW.z + matW.w ) ) ) );
}
vec3 MatrixMul ( vec3 pos, vec4 matX, vec4 matY, vec4 matZ ) {
	return vec3( ( pos.x * matX.x + ( pos.y * matX.y + ( pos.z * matX.z + matX.w ) ) ),
	( pos.x * matY.x + ( pos.y * matY.y + ( pos.z * matY.z + matY.w ) ) ),
	( pos.x * matZ.x + ( pos.y * matZ.y + ( pos.z * matZ.z + matZ.w ) ) ) );
}
vec4 MatrixMul ( mat4x4 m, vec4 v ) {
	return m * v;
}
vec4 MatrixMul ( vec4 v, mat4x4 m ) {
	return v * m;
}
vec3 MatrixMul ( mat3x3 m, vec3 v ) {
	return m * v;
}
vec3 MatrixMul ( vec3 v, mat3x3 m ) {
	return v * m;
}
vec2 MatrixMul ( mat2x2 m, vec2 v ) {
	return m * v;
}
vec2 MatrixMul ( vec2 v, mat2x2 m ) {
	return v * m;
}
vec4 tex2DlodClamped ( sampler2D image, vec4 texcoord, vec4 scalingInfos ) {
	vec2 pixelSize = scalingInfos.zw;
	vec2 clampedTex = clamp( texcoord.xy, vec2( 0 ), scalingInfos.xy - pixelSize / 2. );
	return tex2Dlod( image, vec4( clampedTex, texcoord.zw ) );
}
float GetLuma ( vec3 c ) {
	return dot( c, vec3( 0.2126, 0.7152, 0.0722 ) );
}
float w0 (float a) { return (1.0/6.0)*(a*(a*(-a + 3.0) - 3.0) + 1.0); }
float w1 (float a) { return (1.0/6.0)*(a*a*(3.0*a - 6.0) + 4.0); }
float w2 (float a) { return (1.0/6.0)*(a*(a*(-3.0*a + 3.0) + 3.0) + 1.0); }
float w3 (float a) { return (1.0/6.0)*(a*a*a); }
float g0 (float a) { return w0(a) + w1(a); }
float g1 (float a) { return w2(a) + w3(a); }
float h0 (float a) { return -1.0 + w1(a) / (w0(a) + w1(a)); }
float h1 (float a) { return 1.0 + w3(a) / (w2(a) + w3(a)); }
vec4 tex2DBicubicClamped ( sampler2D image,
vec2 uv, vec2 res,
vec4 scalingInfos ) {
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
	const vec4 t0 = tex2DlodClamped( image, vec4( p0, 0, 0 ), scalingInfos );
	const vec4 t1 = tex2DlodClamped( image, vec4( p1, 0, 0 ), scalingInfos );
	const vec4 t2 = tex2DlodClamped( image, vec4( p2, 0, 0 ), scalingInfos );
	const vec4 t3 = tex2DlodClamped( image, vec4( p3, 0, 0 ), scalingInfos );
	return g0( fuv.y ) * ( g0x * t0 + g1x * t1 ) + g1( fuv.y ) * ( g0x * t2 + g1x * t3 );
}
void main() {
	{
		ivec3 pixelLocation = ivec3(gl_GlobalInvocationID );
		vec2 texcoord = ( pixelLocation.xy + 0.5 ) * _ca_freqHigh[0 ].zw;
		vec4 outputColor;
		{
			vec4 scalingInfos = vec4( _ca_freqLow[0 ].xy, vec2( 1. / _ca_freqHigh[0 ].xy ) );
			vec3 linearColor;
			if ( _ca_freqLow[1 ].x < 3 ) {
				vec3 linearColorLowPass = tex2DBicubicClamped( samp_viewcolormap, texcoord.xy, _ca_freqHigh[0 ].xy, scalingInfos ).rgb;
				linearColor = SRGBlinear( saturate( mix( linearColorLowPass, tex2DlodClamped( samp_viewcolormap, vec4( texcoord, 0, 0 ), scalingInfos ).rgb, _ca_freqLow[0 ].www ) ) ); if ( _ca_freqLow[1 ].x == 2 ) {
					linearColor *= ( texcoord.y < 0.05 * _ca_freqLow[0 ].y || texcoord.y > 0.95 * _ca_freqLow[0 ].y ) ? 0.0 : 1.0;
				}
			}
			else {
				vec2 classic_scale = vec2( 320, 240 );
				linearColor = SRGBlinear( tex2DlodClamped( samp_viewcolormap, vec4( ( floor( texcoord * classic_scale + 0.5 ) ) / classic_scale, 0, 0 ), scalingInfos ).rgb );
				linearColor = floor( linearColor * 512 ) / 512;
			}
			vec4 guiColor = tex2Dlod( samp_tex0, vec4( texcoord / _ca_freqLow[0 ].xy, 0, 0 ) );
			guiColor.xyz = SRGBlinear( guiColor.xyz );
			float guiSaturation = ( _ca_freqLow[1 ].x == 0 ) ? 1.0 : 0.9;
			float guiBlendScale = ( _ca_freqLow[1 ].x == 0 ) ? 1.0 : 0.9;
			guiColor.xyz = mix( GetLuma( guiColor.xyz ).xxx, guiColor.xyz, guiSaturation.xxx ) * guiBlendScale;
			vec3 finalColor = linearColor.xyz * ( 1.0 - guiColor.a ) + guiColor.xyz;
			outputColor.xyz = linearSRGB( finalColor ); if ( _ca_freqHigh[1 ].x != 1.0 ) {
				outputColor.xyz = pow( outputColor.xyz, _ca_freqHigh[1 ].xxx );
			}
			{ if ( _ca_freqHigh[2 ].w > 0.0 ) {
					vec2 grain_tc = texcoord.xy + ( ivec2( _ca_freqLow[2 ].xy ) & 1023 ) / 1023.0;
					float grain = fract( sin( grain_tc.x + grain_tc.y * 521.0 ) * 493013.0 ) * 2.0 - 1.0;
					outputColor.xyz = saturate( outputColor.xyz + saturate( 1 - GetLuma( outputColor.xyz ) ) * grain.xxx * _ca_freqHigh[2 ].w );
				}
			};
			{
				mat3x3 RGBtoOpponentMat = mat3x3( 0.2814, -0.0971, -0.0930,
				0.6938, 0.1458,-0.2529,
				0.0638, -0.0250, 0.4665 );
				mat3x3 OpponentToRGBMat = mat3x3( 1.1677, 0.9014, 0.7214,
				-6.4315, 2.5970, 0.1257,
				-0.5044, 0.0159, 2.0517 ); if ( _ca_freqHigh[2 ].x == 1.0 ) {
					vec3 blindVisionR = vec3( 0.20, 0.99, -0.19 );
					vec3 blindVisionG = vec3( 0.16, 0.79, 0.04 );
					vec3 blindVisionB = vec3( 0.01, -0.01, 1.00 );
					vec3 opponentColor = MatrixMul( RGBtoOpponentMat , outputColor.xyz );
					opponentColor.x -= opponentColor.y * 1.5;
					outputColor.xyz = MatrixMul( OpponentToRGBMat , opponentColor );
					outputColor.xyz = vec3( dot( outputColor.xyz, blindVisionR ), dot( outputColor.xyz, blindVisionG ), dot( outputColor.xyz, blindVisionB ) );
				}
				else if ( _ca_freqHigh[2 ].x == 2.0 ) {
					vec3 blindVisionR = vec3( 0.43, 0.72, -0.15 );
					vec3 blindVisionG = vec3( 0.34, 0.57, 0.09 );
					vec3 blindVisionB = vec3(-0.02, 0.03, 1.00 );
					vec3 opponentColor = MatrixMul( RGBtoOpponentMat , outputColor.xyz );
					opponentColor.x -= opponentColor.y * 1.5;
					outputColor.xyz = MatrixMul( OpponentToRGBMat , opponentColor );
					outputColor.xyz = vec3( dot( outputColor.xyz, blindVisionR ), dot( outputColor.xyz, blindVisionG ), dot( outputColor.xyz, blindVisionB ) );
				}
				else if ( _ca_freqHigh[2 ].x == 3.0 ) {
					vec3 blindVisionR = vec3( 0.97, 0.11, -0.08 );
					vec3 blindVisionG = vec3( 0.02, 0.82, 0.16 );
					vec3 blindVisionB = vec3(-0.06, 0.88, 0.18 );
					vec3 opponentColor = MatrixMul( RGBtoOpponentMat , outputColor.xyz );
					opponentColor.x -= ( ( 3 * opponentColor.z ) - opponentColor.y ) * 0.25;
					outputColor.xyz = MatrixMul( OpponentToRGBMat , opponentColor );
					outputColor.xyz = vec3( dot( outputColor.xyz, blindVisionR ), dot( outputColor.xyz, blindVisionG ), dot( outputColor.xyz, blindVisionB ) );
				}
			};
			outputColor.w = 1.0;
		};
		imageStore( ib_computeupsampletex, pixelLocation.xy, texcoord.x <= 0.05 ? _ca_freqHigh[3 ] : outputColor );
	}
}