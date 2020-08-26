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

uniform vec4 _va_freqHigh [4];
uniform vec4 _va_freqLow [7];

in vec4 in_Color;
in vec4 in_Position;
in vec2 in_TexCoord;

out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord6;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
void main() {
	{
		vec4 vertexColor = in_Color;
		vec4 position = in_Position * _va_freqLow[0 ] + _va_freqLow[1 ];
		gl_Position.x = dot4( position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( position, _va_freqHigh[1 ] );
		gl_Position.z = dot4( position, _va_freqHigh[2 ] );
		gl_Position.w = dot4( position, _va_freqHigh[3 ] );
		{
			float FLT_EPSILON = 0.0001;
			float heightFogAmount = 0.0;
			float inscatterAlpha = 0.0;
			float distanceFogAmount = 1.0 - saturate( exp2( -( clamp( gl_Position.w - _va_freqLow[2 ].x, 0.0, _va_freqLow[2 ].y ) * _va_freqLow[2 ].z ) ) );
			if ( _va_freqLow[3 ].z < 1.0 ) {
				vec3 cameraToPixel = gl_Position.xyz - _va_freqLow[4 ].xyz;
				float distanceToPixel = length( cameraToPixel );
				float be = _va_freqLow[3 ].x * exp2( - _va_freqLow[5 ].w * ( _va_freqLow[4 ].z - _va_freqLow[5 ].x ) );
				float distanceInFog = max( distanceToPixel - _va_freqLow[3 ].y, 0.0 );
				float effectiveZ = max( cameraToPixel.z, FLT_EPSILON );
				if ( cameraToPixel.z < -FLT_EPSILON ) {
					effectiveZ = cameraToPixel.z;
				}
				float lineIntegral = be * distanceInFog;
				lineIntegral *= ( 1.0 - exp2( - _va_freqLow[5 ].w * effectiveZ ) ) / ( _va_freqLow[5 ].w * effectiveZ );
				heightFogAmount = 1.0 - max( saturate( exp2( -lineIntegral ) ), _va_freqLow[3 ].z );
				float cosL = dot( _va_freqLow[6 ].xyz, normalize( cameraToPixel ) );
				float blendValue = saturate( ( cosL - _va_freqLow[5 ].y ) * _va_freqLow[5 ].z );
				inscatterAlpha = 1.0 - ( blendValue * blendValue );
			}
			vofi_TexCoord6.x = distanceFogAmount;
			vofi_TexCoord6.y = heightFogAmount;
			vofi_TexCoord6.z = inscatterAlpha;
			vofi_TexCoord6.w = 0.0;
		};
		vofi_TexCoord0.xy = in_TexCoord.xy;
		vofi_TexCoord0.zw = vec2( 1.0 );
	}
}