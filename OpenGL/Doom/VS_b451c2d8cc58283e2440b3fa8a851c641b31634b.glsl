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

uniform vec4 _va_freqHigh [11];
uniform vec4 _va_freqLow [8];

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec2 in_TexCoord;
in vec4 in_Color;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord3;
out vec4 vofi_TexCoord1;
out vec4 vofi_Color;
out vec4 vofi_TexCoord2;

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
		vec4 tangent = in_Tangent * 2.0 - 1.0;
		vec3 bitangent = normalize( cross( normal.xyz, tangent.xyz ) * tangent.w );
		vec3 wobbleAmount;
		wobbleAmount.x = position.x * 0.023 + _va_freqLow[2 ].x * 5.91 * _va_freqHigh[0 ].y;
		wobbleAmount.y = position.y * 0.031 + _va_freqLow[2 ].x * 7.73 * _va_freqHigh[0 ].y;
		wobbleAmount.z = position.y * 0.043 + _va_freqLow[2 ].x * 9.57 * _va_freqHigh[0 ].y;
		wobbleAmount = sin( wobbleAmount ) * _va_freqHigh[0 ].x;
		position.xyz += normal.xyz * vec3( wobbleAmount.x + wobbleAmount.y + wobbleAmount.z ) * vec3( 4.0 ) + normal.xyz * vec3( _va_freqHigh[1 ].x );
		gl_Position.x = dot4( position, _va_freqHigh[2 ] );
		gl_Position.y = dot4( position, _va_freqHigh[3 ] );
		gl_Position.z = dot4( position, _va_freqHigh[4 ] );
		gl_Position.w = dot4( position, _va_freqHigh[5 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.z = saturate( exp2( -( max( gl_Position.w - _va_freqLow[3 ].x, 0.0 ) * _va_freqLow[3 ].z ) ) );
		vofi_TexCoord0.w = exp2( -gl_Position.w * 0.001 );
		vec3 globalPos = vec3( 0.0 );
		globalPos.x = dot4( position, _va_freqHigh[6 ] );
		globalPos.y = dot4( position, _va_freqHigh[7 ] );
		globalPos.z = dot4( position, _va_freqHigh[8 ] );
		vec4 localCenter = vec4( 0.0, 0.0, 0.0, 1.0 );
		vec3 worldCenter = vec3( 0.0 );
		worldCenter.x = dot4( localCenter, _va_freqHigh[6 ] );
		worldCenter.y = dot4( localCenter, _va_freqHigh[7 ] );
		worldCenter.z = dot4( localCenter, _va_freqHigh[8 ] );
		vec3 globalNormal = vec3( 0.0 );
		globalNormal.x = dot3( normal, _va_freqHigh[6 ] );
		globalNormal.y = dot3( normal, _va_freqHigh[7 ] );
		globalNormal.z = dot3( normal, _va_freqHigh[8 ] );
		globalNormal = normalize( globalNormal );
		vec3 toViewerTS = normalize( _va_freqLow[4 ].xyz - globalPos.xyz );
		float falloff = saturate( abs( dot( globalNormal, toViewerTS ) ) );
		float falloff2 = 1.0 - saturate( abs( dot( normal.xyz, vec3( 0.0, 1.0, 0.0 ) ) ) );
		float diameter = length( globalPos - worldCenter ) * 2.0;
		float distance = length( _va_freqLow[4 ].xyz - globalPos.xyz );
		float scale = saturate( distance / diameter );
		vofi_TexCoord1.x = falloff;
		vofi_TexCoord1.y = falloff2;
		vec3 screenNormal = vec3( 0.0 );
		screenNormal.x = dot3( normal, _va_freqLow[5 ] );
		screenNormal.y = dot3( normal, _va_freqLow[6 ] );
		screenNormal.z = dot3( normal, _va_freqLow[7 ] );
		screenNormal = normalize( screenNormal );
		vofi_TexCoord2.xy = screenNormal.xy;
		vec3 screenWorldUp = vec3( 0.0 );
		screenWorldUp.x = dot3( vec3( 0.0, 0.0, 1.0 ), _va_freqLow[5 ] );
		screenWorldUp.y = dot3( vec3( 0.0, 0.0, 1.0 ), _va_freqLow[6 ] );
		screenWorldUp.z = dot3( vec3( 0.0, 0.0, 1.0 ), _va_freqLow[7 ] );
		screenWorldUp = normalize( screenWorldUp );
		vec3 screenSide = vec3( 0.0 );
		screenSide.x = dot3( vec3( 1.0, 0.0, 0.0 ), _va_freqLow[5 ] );
		screenSide.y = dot3( vec3( 1.0, 0.0, 0.0 ), _va_freqLow[6 ] );
		screenSide.z = dot3( vec3( 1.0, 0.0, 0.0 ), _va_freqLow[7 ] );
		screenSide = normalize( screenSide );
		vofi_TexCoord1.zw = screenWorldUp.xy;
		vofi_TexCoord2.zw = screenSide.xy;
		vec3 invTanMatX = tangent.xyz;
		vec3 invTanMatY = bitangent.xyz;
		vec3 invTanMatZ = normal.xyz;
		vec3 tangentDir = vec3( 0.0 );
		tangentDir.x = dot3( vec3( 1.0, 0.0, 0.0 ), invTanMatX );
		tangentDir.y = dot3( vec3( 1.0, 0.0, 0.0 ), invTanMatY );
		tangentDir.z = dot3( vec3( 1.0, 0.0, 0.0 ), invTanMatZ );
		tangentDir = normalize( tangentDir );
		vofi_TexCoord3.xy = tangentDir.xy;
		vofi_TexCoord3.zw = vec2( 0.0 );
		vofi_Color = _va_freqHigh[9 ] * SRGBlinearApprox( in_Color ) * _va_freqHigh[10 ];
	}
}