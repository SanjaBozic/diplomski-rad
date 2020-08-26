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

uniform vec4 _va_freqHigh [6];
uniform vec4 _va_freqLow [1];

in vec4 in_Position;
in vec2 in_TexCoord;
in vec2 in_TexCoord1;
in vec4 in_Tangent;
in vec4 in_Normal;
in vec4 in_Color;

out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord0;
out vec4 vofi_Color;
out vec4 vofi_TexCoord2;
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
void main() {
	{
		vec4 rotatedPosition = in_Position;
		vec2 vPos = in_Position.yz;
		float sinTheta = 0.0;
		float cosTheta = 1.0;
		sinTheta = sin( _va_freqHigh[0 ].w ); cosTheta = cos( _va_freqHigh[0 ].w );;
		rotatedPosition.y = ( cosTheta * vPos.x ) - ( sinTheta * vPos.y );
		rotatedPosition.z = ( sinTheta * vPos.x ) + ( cosTheta * vPos.y );
		gl_Position.x = dot4( rotatedPosition, _va_freqHigh[1 ] );
		gl_Position.y = dot4( rotatedPosition, _va_freqHigh[2 ] );
		gl_Position.z = dot4( in_Position, _va_freqHigh[3 ] ) * _va_freqHigh[4 ].x ;
		gl_Position.w = dot4( rotatedPosition, _va_freqHigh[5 ] );
		gl_Position.z += _va_freqHigh[4 ].y * gl_Position.w;
		vec2 dc = gl_Position.xy / gl_Position.ww;
		gl_Position.xy = ( dc.xy + _va_freqHigh[0 ].xy ) * gl_Position.ww;
		vofi_TexCoord0.xy = in_TexCoord.xy * _va_freqLow[0 ].x + _va_freqLow[0 ].y;
		vofi_TexCoord0.zw = vec2( 0.0 );
		vofi_TexCoord1.xy = in_TexCoord1.xy * _va_freqLow[0 ].x + _va_freqLow[0 ].y;
		vofi_TexCoord1.z = in_Tangent.z;
		vofi_TexCoord1.w = 0.0;
		vofi_TexCoord2.x = in_Normal.x * 10 + 1;
		vofi_TexCoord2.y = in_Normal.y * 10 + 1;
		vofi_TexCoord2.z = in_Normal.z;
		vofi_TexCoord2.w = in_Normal.w;
		vofi_TexCoord3.xy = ( gl_Position.xy / gl_Position.w );
		vofi_TexCoord3.z = in_Normal.x;
		vofi_TexCoord3.w = in_Normal.y;
		vofi_Color = DeGamma( in_Color );
		vofi_Color.w *= _va_freqHigh[0 ].z;
	}
}