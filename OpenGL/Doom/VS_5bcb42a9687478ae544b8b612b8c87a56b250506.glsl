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
uniform vec4 _va_freqLow [3];

in vec4 in_Position;
in vec2 in_TexCoord;
in vec4 in_Color;
in vec4 in_Normal;

out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord0;
out vec4 vofi_Color;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 position = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		vec4 tempPosition0;
		tempPosition0.x = dot4( position, _va_freqHigh[0 ] );
		tempPosition0.y = dot4( position, _va_freqHigh[1 ] );
		tempPosition0.z = dot4( position, _va_freqHigh[2 ] );
		tempPosition0.w = dot4( position, _va_freqHigh[3 ] );
		vofi_TexCoord1 = tempPosition0;
		gl_Position.x = dot4( position, _va_freqHigh[4 ] );
		gl_Position.y = dot4( position, _va_freqHigh[5 ] );
		gl_Position.z = dot4( position, _va_freqHigh[6 ] );
		gl_Position.w = dot4( position, _va_freqHigh[7 ] );
		vofi_TexCoord0.xy = in_TexCoord * _va_freqLow[2 ].xy + _va_freqLow[2 ].zw;
		vofi_TexCoord0.x = dot4( vofi_TexCoord0.xy, _va_freqHigh[8 ] );
		vofi_TexCoord0.y = dot4( vofi_TexCoord0.xy, _va_freqHigh[9 ] );
		vofi_TexCoord0.zw = vec2( 0.0 );
		float test = 1.0 - step( 1.0, in_Color.w );
		float overbright = ( 1.0 - test ) + ( in_Color.w * 16.0 * test );
		vofi_Color = _va_freqHigh[10 ] * _va_freqHigh[11 ].x * _va_freqHigh[12 ] * vec4( in_Color.xyz, 1.0 ) * overbright;
		vec4 normal = in_Normal * 2.0 - 1.0;
		normal.xyz = normalize( normal.xyz );
		float uvScaleFactor = 0.0104166666;
		vec2 uv = vec2( 0 );
		vec3 scales;
		scales.x = length( vec3( _va_freqHigh[0 ].x, _va_freqHigh[1 ].x, _va_freqHigh[2 ].x ) );
		scales.y = length( vec3( _va_freqHigh[0 ].y, _va_freqHigh[1 ].y, _va_freqHigh[2 ].y ) );
		scales.z = length( vec3( _va_freqHigh[0 ].z, _va_freqHigh[1 ].z, _va_freqHigh[2 ].z ) );
		vec4 localPosition;
		{
			localPosition = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		};
		localPosition.x *= scales.x;
		localPosition.y *= scales.y;
		localPosition.z *= scales.z;
		localPosition.z -= (scales.z * 0.5);
		vec3 absNormal;
		absNormal.x = abs( normal.x );
		absNormal.y = abs( normal.y );
		absNormal.z = abs( normal.z );
		if ( absNormal.x > absNormal.y && absNormal.x > absNormal.z ) {
			uv = (scales.yz * 0.5 * -uvScaleFactor) + (localPosition.yz * -uvScaleFactor);
		} else if ( absNormal.y > absNormal.z && absNormal.y > absNormal.x ) {
			uv = (scales.xz * 0.5 * -uvScaleFactor) + (localPosition.xz * -uvScaleFactor);
		} else {
			uv = (scales.xy * 0.5 * -uvScaleFactor) + (localPosition.xy * -uvScaleFactor);
		}
		vofi_TexCoord0.xy = uv.xy * _va_freqHigh[13 ].xy;
	}
}