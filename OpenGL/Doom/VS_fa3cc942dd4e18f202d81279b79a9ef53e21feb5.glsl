#version 430 core
#extension GL_ARB_shader_clock : enable
float saturate( float v ) { return clamp( v, 0.0, 1.0 ); }
vec2 saturate( vec2 v ) { return clamp( v, 0.0, 1.0 ); }
vec3 saturate( vec3 v ) { return clamp( v, 0.0, 1.0 ); }
vec4 saturate( vec4 v ) { return clamp( v, 0.0, 1.0 ); }
vec4 tex2Dlod( sampler2D image, vec4 texcoord ) { return textureLod( image, texcoord.xy, texcoord.w ); }
vec4 tex3Dlod( sampler3D image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBElod( samplerCube image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 tex2DARRAYlod( sampler2DArray image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEARRAYlod( samplerCubeArray image, vec4 texcoord, float lod ) { return textureLod( image, texcoord.xyzw, lod ); }

uniform vec4 _va_freqHigh [7];
uniform vec4 _va_freqLow [7];

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec4 in_VmtrSB;
in vec2 in_TexCoord;
in vec2 in_TexCoord1;
in vec4 in_Color;
in vec2 in_VmtrTC;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord1;
out vec4 vofi_Color;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord3;
out vec4 vofi_TexCoord6;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
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
vec3 DecodeParticleNormal ( vec3 vertexN, vec3 camFront, float particle_curvature ) {
	const vec3 normal = ( vertexN.xyz / 255.0 ) * 2.0 - vec3( 1.0 );
	return mix( -camFront.xyz, normal, particle_curvature );
}
void main() {
	{
		gl_Position.x = dot4( in_Position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( in_Position, _va_freqHigh[1 ] );
		gl_Position.z = dot4( in_Position, _va_freqHigh[2 ] );
		gl_Position.w = dot4( in_Position, _va_freqHigh[3 ] );
		vec3 worldPos;
		worldPos.x = dot4( vec4(in_Position.xyz, 1 ), _va_freqHigh[4 ] );
		worldPos.y = dot4( vec4(in_Position.xyz, 1 ), _va_freqHigh[5 ] );
		worldPos.z = dot4( vec4(in_Position.xyz, 1 ), _va_freqHigh[6 ] );
		float emmissiveMul = in_Normal.x*10+1;
		float alphaMul = in_Normal.y*10+1;
		float alphaFade = in_Normal.w;
		float eyeDist = gl_Position.w;
		bool facingCamera = in_Tangent.y > 0.0;
		float frameFrac = in_Tangent.z;
		float depthAlphaMul = in_Tangent.w;
		vec3 normal = DecodeParticleNormal( in_VmtrSB.xyz, _va_freqLow[0 ].xyz, 0.5 );
		{
			float FLT_EPSILON = 0.0001;
			float heightFogAmount = 0.0;
			float inscatterAlpha = 0.0;
			float distanceFogAmount = 1.0 - saturate( exp2( -( clamp( gl_Position.w - _va_freqLow[1 ].x, 0.0, _va_freqLow[1 ].y ) * _va_freqLow[1 ].z ) ) );
			if ( _va_freqLow[2 ].z < 1.0 ) {
				vec3 cameraToPixel = worldPos - _va_freqLow[3 ].xyz;
				float distanceToPixel = length( cameraToPixel );
				float be = _va_freqLow[2 ].x * exp2( - _va_freqLow[4 ].w * ( _va_freqLow[3 ].z - _va_freqLow[4 ].x ) );
				float distanceInFog = max( distanceToPixel - _va_freqLow[2 ].y, 0.0 );
				float effectiveZ = max( cameraToPixel.z, FLT_EPSILON );
				if ( cameraToPixel.z < -FLT_EPSILON ) {
					effectiveZ = cameraToPixel.z;
				}
				float lineIntegral = be * distanceInFog;
				lineIntegral *= ( 1.0 - exp2( - _va_freqLow[4 ].w * effectiveZ ) ) / ( _va_freqLow[4 ].w * effectiveZ );
				heightFogAmount = 1.0 - max( saturate( exp2( -lineIntegral ) ), _va_freqLow[2 ].z );
				float cosL = dot( _va_freqLow[5 ].xyz, normalize( cameraToPixel ) );
				float blendValue = saturate( ( cosL - _va_freqLow[4 ].y ) * _va_freqLow[4 ].z );
				inscatterAlpha = 1.0 - ( blendValue * blendValue );
			}
			vofi_TexCoord6.x = distanceFogAmount;
			vofi_TexCoord6.y = heightFogAmount;
			vofi_TexCoord6.z = inscatterAlpha;
			vofi_TexCoord6.w = 0.0;
		};
		vofi_TexCoord0.xy = in_TexCoord.xy * _va_freqLow[6 ].x + _va_freqLow[6 ].y;
		vofi_TexCoord0.zw = in_TexCoord1.xy * _va_freqLow[6 ].x + _va_freqLow[6 ].y;
		vofi_TexCoord1.x = 0.0;
		vofi_TexCoord1.y = depthAlphaMul;
		vofi_TexCoord1.z = frameFrac;
		vofi_TexCoord1.w = alphaFade;
		float particleFade = saturate( abs( eyeDist ) / ( ( 1.0 - depthAlphaMul ) * 127.0 ) );
		vec4 vtxcol = SRGBlinearApprox( in_Color );
		vofi_Color.rgb = vtxcol.rgb;
		vofi_Color.w = particleFade * vtxcol.a * alphaMul;
		{
			if ( facingCamera == true ) {
				float opacityMin = 1.0 / 255.0;
				float opacityScale = 1.0 / ( 1.0 - opacityMin );
				if ( vofi_Color.w < opacityMin ) {
					gl_Position.xyz = vec3( 0.0 );
				}
				vofi_Color.w = ( vofi_Color.w - opacityMin ) * opacityScale;
			}
		};
		vofi_TexCoord2 = vec4( worldPos.xyz, max( emmissiveMul - 1.0, 0.0 ) );
		vec2 tc_atlas = vec2( in_VmtrTC.x, in_VmtrTC.y );
		float atlasY = tc_atlas.y;
		vofi_TexCoord1.x = tc_atlas.x;
		vofi_TexCoord3 = vec4( atlasY, 0.0, 0.0, 0.0 );
	}
}