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
uniform vec4 _va_freqLow [6];

in vec4 in_Position;
in vec4 in_Tangent;
in vec2 in_TexCoord;
in vec2 in_TexCoord1;
in vec4 in_Color;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord1;
out vec4 vofi_Color;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord6;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		gl_Position.x = dot4( in_Position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( in_Position, _va_freqHigh[1 ] );
		gl_Position.z = dot4( in_Position, _va_freqHigh[2 ] );
		gl_Position.w = dot4( in_Position, _va_freqHigh[3 ] );
		float eyeDist = gl_Position.w;
		bool facingCamera = in_Tangent.y > 0.0;
		float frameFrac = in_Tangent.z;
		float alphascale = in_Tangent.w;
		vofi_TexCoord0.xy = in_TexCoord.xy * _va_freqLow[0 ].x + _va_freqLow[0 ].y;
		vofi_TexCoord0.z = 0.0;
		vofi_TexCoord0.w = 0.0;
		vofi_TexCoord1.xy = in_TexCoord1.xy * _va_freqLow[0 ].x + _va_freqLow[0 ].y;
		vofi_TexCoord1.z = frameFrac;
		vofi_TexCoord1.w = 0.0;
		float thickness = ( ( 1.0 - alphascale ) * 127.0 ) / eyeDist;
		vec4 vertColor = in_Color;
		gl_Position.z -= thickness;
		float fade = saturate( abs( eyeDist ) / ( ( 1.0 - alphascale ) * 127.0 ) );
		vec3 worldPos;
		worldPos.x = dot4( vec4( in_Position.xyz, 1 ), _va_freqHigh[4 ] );
		worldPos.y = dot4( vec4( in_Position.xyz, 1 ), _va_freqHigh[5 ] );
		worldPos.z = dot4( vec4( in_Position.xyz, 1 ), _va_freqHigh[6 ] );
		vofi_TexCoord2.xyz = normalize( worldPos - _va_freqLow[1 ].xyz + _va_freqHigh[7 ].xyz );
		vofi_TexCoord2.w = 0.0;
		vofi_Color = vertColor;
		vofi_Color.w *= fade;
		{
			float FLT_EPSILON = 0.0001;
			float heightFogAmount = 0.0;
			float inscatterAlpha = 0.0;
			float distanceFogAmount = 1.0 - saturate( exp2( -( clamp( gl_Position.w - _va_freqLow[2 ].x, 0.0, _va_freqLow[2 ].y ) * _va_freqLow[2 ].z ) ) );
			if ( _va_freqLow[3 ].z < 1.0 ) {
				vec3 cameraToPixel = worldPos - _va_freqLow[1 ].xyz;
				float distanceToPixel = length( cameraToPixel );
				float be = _va_freqLow[3 ].x * exp2( - _va_freqLow[4 ].w * ( _va_freqLow[1 ].z - _va_freqLow[4 ].x ) );
				float distanceInFog = max( distanceToPixel - _va_freqLow[3 ].y, 0.0 );
				float effectiveZ = max( cameraToPixel.z, FLT_EPSILON );
				if ( cameraToPixel.z < -FLT_EPSILON ) {
					effectiveZ = cameraToPixel.z;
				}
				float lineIntegral = be * distanceInFog;
				lineIntegral *= ( 1.0 - exp2( - _va_freqLow[4 ].w * effectiveZ ) ) / ( _va_freqLow[4 ].w * effectiveZ );
				heightFogAmount = 1.0 - max( saturate( exp2( -lineIntegral ) ), _va_freqLow[3 ].z );
				float cosL = dot( _va_freqLow[5 ].xyz, normalize( cameraToPixel ) );
				float blendValue = saturate( ( cosL - _va_freqLow[4 ].y ) * _va_freqLow[4 ].z );
				inscatterAlpha = 1.0 - ( blendValue * blendValue );
			}
			vofi_TexCoord6.x = distanceFogAmount;
			vofi_TexCoord6.y = heightFogAmount;
			vofi_TexCoord6.z = inscatterAlpha;
			vofi_TexCoord6.w = 0.0;
		};
	}
}