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

uniform vec4 _va_freqHigh [14];
uniform vec4 _va_freqLow [5];

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec2 in_TexCoord;
in vec4 in_Color;

out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord0;
out vec4 vofi_Color;
out vec4 vofi_TexCoord2;

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
		gl_Position.x = dot4( position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( position, _va_freqHigh[1 ] );
		gl_Position.z = dot4( position, _va_freqHigh[2 ] );
		gl_Position.w = dot4( position, _va_freqHigh[3 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.z = saturate( exp2( -( max( gl_Position.w - _va_freqLow[2 ].x, 0.0 ) * _va_freqLow[2 ].z * _va_freqHigh[4 ].z ) ) );
		vofi_TexCoord0.w = 0.0;
		vec3 globalPos = vec3( 0.0 );
		globalPos.x = dot4( position, _va_freqHigh[5 ] );
		globalPos.y = dot4( position, _va_freqHigh[6 ] );
		globalPos.z = dot4( position, _va_freqHigh[7 ] );
		vec3 globalNormal = vec3( 0.0 );
		globalNormal.x = dot3( normal, _va_freqHigh[5 ] );
		globalNormal.y = dot3( normal, _va_freqHigh[6 ] );
		globalNormal.z = dot3( normal, _va_freqHigh[7 ] );
		vec3 toViewerTS = normalize( _va_freqLow[3 ].xyz - globalPos.xyz );
		vofi_TexCoord0.w = pow( saturate( dot( globalNormal, toViewerTS ) ) , _va_freqHigh[8 ].w );
		float speed1 = _va_freqHigh[9 ].x;
		vec2 tempTC;
		vec2 TC1 = in_TexCoord.xy - 0.5;
		tempTC = TC1;
		tempTC.x = cos( _va_freqLow[4 ].x * speed1 ) * TC1.x - sin( _va_freqLow[4 ].x * speed1 ) * TC1.y;
		tempTC.y = sin( _va_freqLow[4 ].x * speed1 ) * TC1.x + cos( _va_freqLow[4 ].x * speed1 ) * TC1.y;
		TC1 = tempTC + 0.5;
		vofi_TexCoord1.xy = TC1 * _va_freqHigh[10 ].xy + _va_freqLow[4 ].xx * _va_freqHigh[10 ].zw;
		vofi_TexCoord1.zw = in_TexCoord.xy * _va_freqHigh[11 ].xy + _va_freqLow[4 ].xx * _va_freqHigh[11 ].zw;
		vofi_TexCoord2.zw = vec2( 0.0 );
		vec4 vertcolor = in_Color;
		vofi_Color = _va_freqHigh[12 ] * _va_freqHigh[13 ];
		vofi_Color.w *= vertcolor.x;
	}
}