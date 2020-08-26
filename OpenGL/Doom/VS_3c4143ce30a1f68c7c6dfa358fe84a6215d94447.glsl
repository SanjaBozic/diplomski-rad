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

uniform vec4 _va_freqHigh [5];
uniform vec4 _va_freqLow [2];

in vec4 in_Position;
in vec4 in_Tangent;
in vec2 in_TexCoord;
in vec2 in_TexCoord1;
in vec4 in_Normal;
in vec4 in_Color;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord2;
out vec4 vofi_Color;

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
void main() {
	{
		gl_Position.x = dot4( in_Position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( in_Position, _va_freqHigh[1 ] );
		gl_Position.z = dot4( in_Position, _va_freqHigh[2 ] );
		gl_Position.w = dot4( in_Position, _va_freqHigh[3 ] );
		float eyeDist = gl_Position.w;
		bool facingCamera = in_Tangent.y > 0.0;
		float frameFrac = in_Tangent.z;
		float alphascale = in_Tangent.w;
		float fogVal = saturate( exp2( -( clamp( gl_Position.w - _va_freqLow[0 ].x, 0.0, _va_freqLow[0 ].y ) * _va_freqLow[0 ].z ) ) );
		float thickness = ( ( 1.0 - alphascale ) * 127.0 ) / eyeDist;
		vofi_TexCoord0.xy = in_TexCoord.xy * _va_freqLow[1 ].x + _va_freqLow[1 ].y;
		vofi_TexCoord0.z = fogVal;
		vofi_TexCoord0.w = alphascale;
		vofi_TexCoord1.xy = in_TexCoord1.xy * _va_freqLow[1 ].x + _va_freqLow[1 ].y;
		vofi_TexCoord1.z = frameFrac;
		vofi_TexCoord1.w = 0.0;
		vofi_TexCoord2.x = in_Normal.x * 10.0 + 1.0;
		vofi_TexCoord2.y = in_Normal.y * 10.0 + 1.0;
		vofi_TexCoord2.z = 1.0 - in_Normal.z;
		vofi_TexCoord2.w = in_Normal.w;
		gl_Position.z -= thickness;
		float particleFade = saturate( abs( eyeDist ) / ( ( 1.0 - alphascale ) * 127.0 ) );
		gl_Position.z *= 1.0 * _va_freqHigh[4 ].x;
		vofi_Color = SRGBlinearApprox( in_Color );
		vofi_Color.w *= particleFade;
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
	}
}