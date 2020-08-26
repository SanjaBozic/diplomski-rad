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

uniform vec4 _va_freqHigh [10];
uniform vec4 _va_freqLow [7];

in vec4 in_Position;
in vec4 in_Normal;
in vec4 in_Tangent;
in vec2 in_TexCoord;
in vec4 in_Color;

out vec4 vofi_TexCoord1;
out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord2;
out vec4 vofi_TexCoord3;
out vec4 vofi_TexCoord4;
out vec4 vofi_TexCoord5;
out vec4 vofi_Color;
out vec4 vofi_TexCoord6;

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
		vec3 globalNormal;
		globalNormal.x = dot3( normal, _va_freqHigh[4 ] );
		globalNormal.y = dot3( normal, _va_freqHigh[5 ] );
		globalNormal.z = dot3( normal, _va_freqHigh[6 ] );
		globalNormal = normalize( globalNormal );
		vec3 globalPos;
		globalPos.x = dot4( position, _va_freqHigh[4 ] );
		globalPos.y = dot4( position, _va_freqHigh[5 ] );
		globalPos.z = dot4( position, _va_freqHigh[6 ] );
		vec3 toViewer = normalize( _va_freqLow[4 ].xyz - globalPos.xyz );
		vec3 localToViewer;
		localToViewer.x = dot3( toViewer, _va_freqHigh[7 ].xyz );
		localToViewer.y = dot3( toViewer, _va_freqHigh[8 ].xyz );
		localToViewer.z = dot3( toViewer, _va_freqHigh[9 ].xyz );
		vofi_TexCoord1.x = dot3( localToViewer, tangent.xyz );
		vofi_TexCoord1.y = dot3( localToViewer, bitangent.xyz );
		vofi_TexCoord1.z = dot3( localToViewer, normal.xyz );
		vofi_TexCoord2.xyz = bitangent.xyz;
		vofi_TexCoord3.xyz = tangent.xyz;
		vofi_TexCoord4.xyz = normal.xyz;
		vofi_TexCoord5.xyz = globalPos.xyz;
		vofi_Color = in_Color;
	}
}