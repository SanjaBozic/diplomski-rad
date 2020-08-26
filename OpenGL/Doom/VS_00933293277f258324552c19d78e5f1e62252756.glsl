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

uniform vec4 _va_freqHigh [9];

in vec4 in_Tangent;
in vec4 in_Position;
in vec2 in_TexCoord;
in vec4 in_Color;

out vec4 vofi_TexCoord0;
out vec4 vofi_Color;

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
		vec4 position;
		{
			vec3 parms = in_Tangent.xyz;
			parms.yz = parms.yz * 2.0 - 1.0;
			float radius = parms.x * 255.0;
			float signLeft = parms.y;
			float signUp = parms.z;
			vec3 scaledLeft = normalize( _va_freqHigh[0 ].xyz ) * radius;
			vec3 scaledUp = normalize( _va_freqHigh[1 ].xyz ) * radius;
			position.xyz = ( in_Position.xyz + ( signLeft * scaledLeft ) + ( signUp * scaledUp ) );
		};
		position.w = in_Position.w;
		gl_Position.x = dot4( position, _va_freqHigh[2 ] );
		gl_Position.y = dot4( position, _va_freqHigh[3 ] );
		gl_Position.z = dot4( position, _va_freqHigh[4 ] );
		gl_Position.w = dot4( position, _va_freqHigh[5 ] );
		vofi_TexCoord0.x = dot4( in_TexCoord, _va_freqHigh[6 ] );
		vofi_TexCoord0.y = dot4( in_TexCoord, _va_freqHigh[7 ] );
		vofi_TexCoord0.zw = vec2( 0.0 );
		float fade = saturate( abs( gl_Position.w ) * _va_freqHigh[8 ].x );
		vofi_Color = DeGamma( in_Color );
		vofi_Color.w *= fade;
	}
}