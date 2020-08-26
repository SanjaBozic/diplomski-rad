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
uniform vec4 _va_freqLow [7];

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord3;
out vec4 vofi_Color;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 position = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		vec4 normal = in_Normal * 2.0 - 1.0;
		vec4 tangent = in_Tangent * 2.0 - 1.0;
		gl_Position.x = dot4( position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( position, _va_freqHigh[1 ] );
		gl_Position.z = dot4( position, _va_freqHigh[2 ] );
		gl_Position.w = dot4( position, _va_freqHigh[3 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.z = saturate( exp2( -( max( gl_Position.w - _va_freqLow[2 ].x, 0.0 ) * _va_freqLow[2 ].z ) ) );
		vofi_TexCoord0.w = exp2( -gl_Position.w * 0.001 );
		vec3 globalPos = vec3( 0.0 );
		globalPos.x = dot4( position, _va_freqHigh[4 ] );
		globalPos.y = dot4( position, _va_freqHigh[5 ] );
		globalPos.z = dot4( position, _va_freqHigh[6 ] );
		vec4 localCenter = vec4( 0.0, 0.0, 0.0, 1.0 );
		vec3 worldCenter = vec3( 0.0 );
		worldCenter.x = dot4( localCenter, _va_freqHigh[4 ] );
		worldCenter.y = dot4( localCenter, _va_freqHigh[5 ] );
		worldCenter.z = dot4( localCenter, _va_freqHigh[6 ] );
		vec3 globalNormal = vec3( 0.0 );
		globalNormal.x = dot3( normal, _va_freqHigh[4 ] );
		globalNormal.y = dot3( normal, _va_freqHigh[5 ] );
		globalNormal.z = dot3( normal, _va_freqHigh[6 ] );
		globalNormal = normalize( globalNormal );
		vec3 toViewerTS = normalize( _va_freqLow[3 ].xyz - globalPos.xyz );
		float falloff = saturate( abs( dot( globalNormal, toViewerTS ) ) );
		float diameter = length( globalPos - worldCenter ) * 2.0;
		float distance = length( _va_freqLow[3 ].xyz - globalPos.xyz );
		float scale = saturate( distance / diameter );
		vofi_TexCoord1.x = falloff;
		vofi_TexCoord1.y = scale;
		vofi_TexCoord1.z = diameter;
		vofi_TexCoord1.w = falloff * falloff;
		vec3 screenNormal = vec3( 0.0 );
		screenNormal.x = dot3( normal, _va_freqLow[4 ] );
		screenNormal.y = dot3( normal, _va_freqLow[5 ] );
		screenNormal.z = dot3( normal, _va_freqLow[6 ] );
		screenNormal = normalize( screenNormal );
		vofi_TexCoord2.xyz = screenNormal;
		vofi_TexCoord3.zw = vec2( 0.0 );
		vofi_Color = _va_freqHigh[7 ];
	}
}