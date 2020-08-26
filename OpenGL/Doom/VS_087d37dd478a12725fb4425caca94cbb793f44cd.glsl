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
uniform vec4 _va_freqLow [5];

in vec4 in_Color;
in vec4 in_Position;
in vec4 in_Normal;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;
out vec4 vofi_Color;
out vec4 vofi_TexCoord1;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 vertexColor = in_Color;
		vec4 position = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		vec4 normal = in_Normal * 2.0 - 1.0;
		float fade = _va_freqHigh[0 ].w;
		fade *= fade * fade;
		fade *= 5.0; if ( _va_freqHigh[1 ].x == 1.0 ) {
			float timeVar = _va_freqHigh[0 ].w;
			float fadeInTime = saturate( timeVar * 2.0 );
			float fadeIn = saturate( ( ( fadeInTime + vertexColor.w ) - 1.0 ) * 3.0 );
			fadeIn = smoothstep( 0.0, 1.0, fadeIn );
			float fadeOutTime = saturate( ( timeVar - 0.5 ) * 2.0 );
			float fadeOut = 1.0 - fadeOutTime;
			fadeOut *= fadeOut * fadeOut;
			float fadeFlashTime = saturate( ( timeVar - 0.5 ) * 10.0 );
			float fadeFlash = fadeFlashTime * fadeOut;
			position.xyz -= normal.xyz * ( 1.0 - fadeIn ) * 4.0;
			fade = fadeIn + fadeFlash * 5.0;
		} if ( _va_freqHigh[1 ].x == 2.0 ) {
			fade = sin( _va_freqLow[2 ].x * 9.0 ) * 0.25 + 0.75;
			fade *= _va_freqHigh[0 ].w;
		} if ( _va_freqHigh[1 ].x == 3.0 ) {
			float timeVar = _va_freqHigh[0 ].w;
			float fadeInTime = timeVar * 2.0;
			float fadeIn = saturate( ( ( fadeInTime + vertexColor.x ) - 1.0 ) );
			fade = ( -cos( fadeIn * 6.28 ) * 0.5 + 0.5 );
			fade *= 5.0;
			position.xyz += normal.xyz * fadeIn * 8.0 * ( vertexColor.y + 0.5 );
		}
		gl_Position.x = dot4( position, _va_freqHigh[2 ] );
		gl_Position.y = dot4( position, _va_freqHigh[3 ] );
		gl_Position.z = dot4( position, _va_freqHigh[4 ] );
		gl_Position.w = dot4( position, _va_freqHigh[5 ] );
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.z = saturate( exp2( -( max( gl_Position.w - _va_freqLow[3 ].x, 0.0 ) * _va_freqLow[3 ].z ) ) );
		vofi_TexCoord0.w = exp2( -gl_Position.w * 0.001 );
		vec3 worldPos = vec3( 0.0 );
		worldPos.x = dot4( position, _va_freqHigh[6 ] );
		worldPos.y = dot4( position, _va_freqHigh[7 ] );
		worldPos.z = dot4( position, _va_freqHigh[8 ] );
		vec3 viewDir;
		viewDir = -normalize( worldPos - _va_freqLow[4 ].xyz );
		vec3 worldNormal = vec3( 0.0 );
		worldNormal.x = dot3( normal, _va_freqHigh[6 ] );
		worldNormal.y = dot3( normal, _va_freqHigh[7 ] );
		worldNormal.z = dot3( normal, _va_freqHigh[8 ] );
		worldNormal = normalize( worldNormal );
		vec3 screenNormal = vec3( 0.0 );
		screenNormal.x = dot3( normal, _va_freqHigh[2 ] );
		screenNormal.y = dot3( normal, _va_freqHigh[3 ] );
		screenNormal.z = dot3( normal, _va_freqHigh[4 ] );
		screenNormal = normalize( screenNormal );
		vofi_TexCoord1.xy = screenNormal.xy;
		vofi_TexCoord1.z = saturate( dot( viewDir, worldNormal ) );
		vofi_TexCoord1.w = fade;
		vofi_Color = in_Color;
	}
}