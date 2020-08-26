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
uniform vec4 _va_freqLow [4];

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord0;

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
		vec3 bitangent = cross( normal.xyz, tangent.xyz ) * tangent.w;
		position.x *= _va_freqHigh[0 ].w;
		vec3 tempPosition = position.xyz;
		vec3 tempNormal = normal.xyz;
		gl_Position.x = dot4( position, _va_freqHigh[1 ] );
		gl_Position.y = dot4( position, _va_freqHigh[2 ] );
		gl_Position.z = dot4( position, _va_freqHigh[3 ] );
		gl_Position.w = dot4( position, _va_freqHigh[4 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.z = saturate( exp2( -( max( gl_Position.w - _va_freqLow[2 ].x, 0.0 ) * _va_freqLow[2 ].z ) ) );
		vofi_TexCoord0.w = exp2( -gl_Position.w * 0.001 );
		vec3 worldPos = vec3( 0.0 );
		worldPos.x = dot4( position, _va_freqHigh[5 ] );
		worldPos.y = dot4( position, _va_freqHigh[6 ] );
		worldPos.z = dot4( position, _va_freqHigh[7 ] );
		vec3 viewDir;
		viewDir = -normalize( worldPos - _va_freqLow[3 ].xyz );
		vec3 worldNormal = vec3( 0.0 );
		worldNormal.x = dot3( normal, _va_freqHigh[5 ] );
		worldNormal.y = dot3( normal, _va_freqHigh[6 ] );
		worldNormal.z = dot3( normal, _va_freqHigh[7 ] );
		worldNormal = normalize( worldNormal );
		vec3 screenNormal = vec3( 0.0 );
		screenNormal.x = dot3( normal, _va_freqHigh[1 ] );
		screenNormal.y = dot3( normal, _va_freqHigh[2 ] );
		screenNormal.z = dot3( normal, _va_freqHigh[3 ] );
		screenNormal = normalize( screenNormal );
		vofi_TexCoord1.xyz = 1.0 - ( cos( abs( worldNormal ) * 3.14 ) * 0.5 + 0.5 );
		vofi_TexCoord1.w = pow( saturate( dot( viewDir, worldNormal ) ), 5.0 );
		vofi_TexCoord2.xyz = saturate( in_Position.xyz * _va_freqLow[0 ].xyz + _va_freqLow[1 ].xyz );
		vofi_TexCoord2.w = 0.0;
	}
}