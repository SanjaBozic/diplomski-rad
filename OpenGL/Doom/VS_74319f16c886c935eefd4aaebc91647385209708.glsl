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
uniform vec4 _va_freqLow [4];

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec4 in_VmtrSB;
in vec2 in_TexCoord;
in vec2 in_TexCoord1;
in vec4 in_Color;
in vec2 in_VmtrTC;

out vec4 vofi_TexCoord5;
out vec4 vofi_TexCoord4;
out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord2;
out vec4 vofi_Color;
out vec4 vofi_TexCoord3;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
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
		float frameFrac = in_Tangent.z;
		float depthAlphaMul = in_Tangent.w;
		vec3 normal = DecodeParticleNormal( in_VmtrSB.xyz, _va_freqLow[0 ].xyz, 0.5 );
		float fogDensity = saturate( exp2( -( clamp( gl_Position.w - _va_freqLow[1 ].x, 0.0, _va_freqLow[1 ].y ) * _va_freqLow[1 ].z ) ) );
		float thickness = ( ( 1.0 - depthAlphaMul ) * 127.0 ) / eyeDist;
		vofi_TexCoord0.xy = in_TexCoord.xy * _va_freqLow[2 ].x + _va_freqLow[2 ].y;
		vofi_TexCoord0.zw = in_TexCoord1.xy * _va_freqLow[2 ].x + _va_freqLow[2 ].y;
		vofi_TexCoord1.x = fogDensity;
		vofi_TexCoord1.y = depthAlphaMul;
		vofi_TexCoord1.z = frameFrac;
		vofi_TexCoord1.w = alphaFade;
		gl_Position.z -= thickness * ( in_Normal.z * 10.0 + 1.0 );
		float particleFade = saturate( abs( eyeDist ) / ( ( 1.0 - depthAlphaMul ) * 127.0 ) );
		vec4 vtxcol = DeGamma( in_Color );
		vofi_Color.rgb = vtxcol.rgb;
		vofi_Color.w = particleFade * vtxcol.a * alphaMul;
		bool facingCamera = in_Tangent.y > 0.0;
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
		vofi_TexCoord2.x = emmissiveMul;
		vofi_TexCoord3 = vec4( normal.xyz, 0.0 );
		vofi_TexCoord3.w = length( worldPos.xyz - _va_freqLow[3 ].xyz );
		vec2 particle_uvs[ 4 ] = {
			vec2( 0, 0 ),
			vec2( 0, 1 ),
			vec2( 1, 0 ),
			vec2( 1, 1 )
		};
		vec2 tc = particle_uvs[ gl_VertexID & 3 ];
		vofi_TexCoord4 = vec4( tc.xy, 0, 0 );
		float particleId1 = in_VmtrTC.x;
		float particleId2 = in_VmtrTC.x * 1.5;
		float particleId3 = in_VmtrTC.x * 8.0;
		float particleId4 = in_VmtrTC.x * 64.0;
		vofi_TexCoord5 = vec4( particleId1, particleId2, particleId3, particleId4 );
	}
}