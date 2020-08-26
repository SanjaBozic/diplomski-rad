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

uniform vec4 _va_freqHigh [6];
uniform vec4 _va_freqLow [5];
uniform sampler2D samp_viewdepthmap;

in vec4 in_Position;
in vec2 in_TexCoord;
in vec4 in_Color;
in vec2 in_VmtrTC;

out vec4 vofi_TexCoord0;
out vec4 vofi_Color;
out vec4 vofi_TexCoord1;

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
		vec4 position = vec4( in_Position.xy, 0, 1 ) * _va_freqLow[0 ] + _va_freqLow[1 ];
		gl_Position.x = dot4( position, _va_freqHigh[0 ] );
		gl_Position.y = dot4( position, _va_freqHigh[1 ] );
		gl_Position.z = dot4( position, _va_freqHigh[2 ] );
		gl_Position.w = dot4( position, _va_freqHigh[3 ] );
		vofi_TexCoord0 = ( in_TexCoord.xy * _va_freqLow[2 ].xy + _va_freqLow[2 ].zw ).xyxy;
		vofi_Color = SRGBlinearApprox( in_Color ) * _va_freqHigh[4 ] * _va_freqLow[3 ].x;
		vec2 pos = in_VmtrTC.xy * 0.5 + 0.5;
		float centerZ = in_Position.z;
		int kernel_radius = 3;
		float occlusion_ratio = 0.0;
		for ( int y = -kernel_radius; y <= kernel_radius; y++ ) {
			for ( int x = -kernel_radius; x <= kernel_radius; x++ ) {
				vec2 tc = ( pos.xy + vec2( x, y ) * _va_freqHigh[5 ].zw );
				float ndcZ = tex2Dlod( samp_viewdepthmap, vec4( tc.xy * _va_freqLow[4 ].xy, 0, 0 ) ).x;
				occlusion_ratio += saturate( ndcZ > centerZ ? 1.0 : 0.0 );
			}
		}
		occlusion_ratio /= float( ( kernel_radius * 2 + 1 ) * ( kernel_radius * 2 + 1 ) );
		vofi_TexCoord1 = saturate( vec4( occlusion_ratio ) );
		{
			if ( true == true ) {
				float opacityMin = 1.0 / 255.0;
				float opacityScale = 1.0 / ( 1.0 - opacityMin );
				if ( vofi_Color.w < opacityMin ) {
					gl_Position.xyz = vec3( 0.0 );
				}
				vofi_Color.w = ( vofi_Color.w - opacityMin ) * opacityScale;
			}
		};
	}
}