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
uniform vec4 _va_freqLow [4];

in vec4 in_Color;
in vec4 in_Tangent;
in vec4 in_Position;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;
out vec4 vofi_Color;
out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord3;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 vertexColor = in_Color;
		float sizeRamp = 1 - (vertexColor.w * vertexColor.w);
		float size = mix( _va_freqHigh[0 ].x, _va_freqHigh[1 ].x, sizeRamp );
		vertexColor.w *= smoothstep( 1.0, 0.99, vertexColor.w );
		float wobble = ( sin( in_Tangent.x * 173.0 ) + sin( in_Tangent.z * 93.0 ) ) * 0.3 + 1.0;
		vec4 globalPos = in_Position;
		globalPos.xyz += ( _va_freqLow[0 ].xyz * ( in_TexCoord.x - 0.5 ) * size * 0.5 * wobble );
		globalPos.xyz += ( _va_freqLow[1 ].xyz * ( in_TexCoord.y - 0.5 ) * size * 0.5 * wobble );
		gl_Position.x = dot4( globalPos, _va_freqHigh[2 ] );
		gl_Position.y = dot4( globalPos, _va_freqHigh[3 ] );
		gl_Position.z = dot4( globalPos, _va_freqHigh[4 ] );
		gl_Position.w = dot4( globalPos, _va_freqHigh[5 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.z = saturate( exp2( -( clamp( gl_Position.w - _va_freqLow[2 ].x, 0.0, _va_freqLow[2 ].y ) * _va_freqLow[2 ].z ) ) );
		vofi_TexCoord0.w = exp2( -gl_Position.w * 0.001 );
		vofi_TexCoord1.xyz = in_Tangent.xyz;
		float myTime = _va_freqLow[3 ].x * _va_freqLow[3 ].x * ( in_Tangent.x * 0.3 + 1.0 + wobble * 5.0 ) + in_Tangent.y * 73.0;
		float fracX = fract( floor( myTime * _va_freqHigh[6 ].z ) / _va_freqHigh[6 ].x );
		float fracY = fract( floor( ( myTime * _va_freqHigh[6 ].z ) / _va_freqHigh[6 ].x ) / _va_freqHigh[6 ].y );
		vofi_TexCoord2.x = in_TexCoord.x * ( 1.0 / _va_freqHigh[6 ].x ) + fracX;
		vofi_TexCoord2.y = in_TexCoord.y * ( 1.0 / _va_freqHigh[6 ].y ) + fracY;
		fracX = fract( floor( myTime * _va_freqHigh[6 ].z + 1.0 ) / _va_freqHigh[6 ].x );
		fracY = fract( floor( ( myTime * _va_freqHigh[6 ].z + 1.0 ) / _va_freqHigh[6 ].x ) / _va_freqHigh[6 ].y );
		vofi_TexCoord2.z = in_TexCoord.x * ( 1.0 / _va_freqHigh[6 ].x ) + fracX;
		vofi_TexCoord2.w = in_TexCoord.y * ( 1.0 / _va_freqHigh[6 ].y ) + fracY;
		vofi_TexCoord3.x = fract( myTime * _va_freqHigh[6 ].z );
		vofi_TexCoord3.y = 1.0 - vofi_TexCoord3.x;
		float fade = saturate( abs( gl_Position.w ) * _va_freqHigh[7 ].x );
		vofi_Color = vertexColor;
		vofi_Color.xyz *= _va_freqHigh[8 ].xyz;
		vofi_Color.w *= _va_freqHigh[8 ].w;
		vofi_Color.w *= fade;
	}
}