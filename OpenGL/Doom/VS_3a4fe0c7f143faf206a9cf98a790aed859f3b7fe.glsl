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

uniform vec4 _va_freqHigh [8];
uniform vec4 _va_freqLow [5];

in vec4 in_Position;
in vec4 in_Normal;
in vec2 in_TexCoord;
in vec4 in_Color;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord2;
out vec4 vofi_Color;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
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
		vec4 position = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		vec4 normal = in_Normal * 2.0 - 1.0;
		float warp = 0.0;
		warp += sin( length( in_TexCoord.xy * vec2( 0.3, 0.7 ) ) * 43.0 + _va_freqLow[2 ].x * 15.0 );
		warp *= sin( length( in_TexCoord.xy * vec2( -0.3, 0.7 ) ) * 72.0 + _va_freqLow[2 ].x * 17.0 );
		warp *= sin( length( in_TexCoord.xy * vec2( -0.7, 0.3 ) ) * 52.0 + _va_freqLow[2 ].x * 10.0 );
		warp = warp * 0.5 + 0.5;
		warp = pow( warp, 2.0 );
		warp *= 7.0;
		position.xyz += ( normal.xyz * vec3( warp ) );
		gl_Position.x = dot4( position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( position, _va_freqHigh[1 ] );
		gl_Position.z = dot4( position, _va_freqHigh[2 ] );
		gl_Position.w = dot4( position, _va_freqHigh[3 ] );
		vofi_TexCoord0 = in_TexCoord.xyxy;
		vofi_TexCoord0.z = saturate( exp2( -( max( gl_Position.w - _va_freqLow[3 ].x, 0.0 ) * _va_freqLow[3 ].z ) ) );
		vec3 worldPos;
		worldPos.x = dot4( position, _va_freqHigh[4 ] );
		worldPos.y = dot4( position, _va_freqHigh[5 ] );
		worldPos.z = dot4( position, _va_freqHigh[6 ] );
		vec3 viewDir;
		viewDir = -normalize( worldPos - _va_freqLow[4 ].xyz );
		vofi_TexCoord1.xyz = viewDir;
		vec3 worldNormal = vec3( 0.0 );
		worldNormal.x = dot3( normal, _va_freqHigh[4 ] );
		worldNormal.y = dot3( normal, _va_freqHigh[5 ] );
		worldNormal.z = dot3( normal, _va_freqHigh[6 ] );
		worldNormal = normalize( worldNormal );
		vofi_TexCoord2.xyz = worldNormal;
		vofi_Color = SRGBlinearApprox( _va_freqHigh[7 ] ) * SRGBlinearApprox( in_Color );
	}
}