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
uniform vec4 _va_freqLow [8];
struct particle_t {
	int committedIndex ;
	int padding ;
	int cycle ;
	int flags ;
	vec3 position ;
	float maxLifetime ;
	vec3 velocity ;
	float lifetime ;
};
layout( std430 ) buffer particlerandom_b {
	restrict readonly vec4 particlerandom[ ];
};
layout( std430 ) buffer particles_b {
	restrict readonly particle_t particles[ ];
};


out vec4 vofi_TexCoord0;
out vec4 vofi_TexCoord1;
out vec4 vofi_Color;

float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
vec4 FetchRandom ( int index ) {
	vec4 random = particlerandom[ index & (8192 - 1) ];
	return fract( random + 0.1234*floor( float( index ) * (1.0 / 8192) ) );
}
vec2 AnimateTexCoord ( vec2 texCoord, float frame, float numFrames, float numColumns, float numRows, bool useRandomRow, float randomValue ) {
	const float columnFrame = floor( mod( frame, numColumns ) );
	const float rowFrame = useRandomRow ?
	floor( randomValue * numFrames - 1e-6 ) :
	floor( mod( frame, numFrames ) / numColumns );
	return vec2( ( texCoord.x + columnFrame ) / numColumns, ( texCoord.y + rowFrame ) / numRows );
}
void main() {
	{
		vec2 quadVertices[4] = { vec2( -1.0, -1.0 ), vec2( -1.0, 1.0 ), vec2( 1.0, 1.0 ), vec2( 1.0, -1.0 ) };
		int vertexIndex = gl_VertexID & 3;
		int commitListIndex = gl_VertexID >> 2;
		int particleIndex = particles[commitListIndex].committedIndex;
		particle_t particle = particles[particleIndex];
		float lifetime = particle.lifetime;
		float lifetimeNormalized = lifetime / particle.maxLifetime;
		vec4 random = FetchRandom( particleIndex + 1 );
		vec2 size = mix( _va_freqHigh[0 ].xy, _va_freqHigh[0 ].zw, lifetimeNormalized );
		size += size * _va_freqHigh[1 ].xy * ( random.x * 2.0 - 1.0 );
		vec4 position = vec4( particle.position.xyz, 1.0 );
		vec4 viewPosition;
		viewPosition.x = dot4( position, _va_freqLow[0 ] );
		viewPosition.y = dot4( position, _va_freqLow[1 ] );
		viewPosition.z = dot4( position, _va_freqLow[2 ] );
		viewPosition.w = dot4( position, _va_freqLow[3 ] );
		if ( int( _va_freqHigh[2 ].x ) == 1 ) {
			vec4 velocity = vec4( particle.velocity, 0.0 );
			vec2 viewVelocity;
			viewVelocity.x = dot4( position + velocity, _va_freqLow[0 ] ) - viewPosition.x;
			viewVelocity.y = dot4( position + velocity, _va_freqLow[1 ] ) - viewPosition.y;
			vec2 viewTangent = normalize( vec2( -viewVelocity.y, viewVelocity.x ) );
			viewPosition.xy += quadVertices[vertexIndex].x * size.x * viewVelocity;
			viewPosition.xy += quadVertices[vertexIndex].y * size.y * viewTangent;
		} else {
			viewPosition.xy += quadVertices[vertexIndex] * size.xy;
		}
		float fadeOutTime = 1.0 - _va_freqHigh[3 ].y;
		float fadeBlend;
		if ( lifetimeNormalized < _va_freqHigh[3 ].x ) {
			fadeBlend = 1.0 - lifetimeNormalized / _va_freqHigh[3 ].x;
		} else if ( lifetimeNormalized > fadeOutTime ) {
			fadeBlend = ( lifetimeNormalized - fadeOutTime ) / _va_freqHigh[3 ].y;
		} else {
			fadeBlend = 0.0;
		}
		vec2 texCoord = quadVertices[vertexIndex] * vec2( 0.5, -0.5 ) + vec2( 0.5 );
		bool useRandomRow = _va_freqHigh[4 ].x > 0.5;
		float texAnimRows = _va_freqHigh[5 ].y;
		float texAnimColumns = _va_freqHigh[5 ].z;
		float texAnimFrames = useRandomRow ? texAnimColumns : texAnimColumns * texAnimRows;
		if ( texAnimFrames > 1 ) {
			float startFrame = _va_freqHigh[5 ].w;
			float frame = startFrame >= 0.0 ? startFrame : random.z * texAnimFrames;
			if ( int( _va_freqHigh[5 ].x ) == 0 ) {
				float animationRate = mix( _va_freqHigh[4 ].z, _va_freqHigh[4 ].w, random.y );
				frame += lifetime * animationRate;
			} else if ( int( _va_freqHigh[5 ].x ) == 1 ) {
				float animationRate = mix( _va_freqHigh[4 ].z, _va_freqHigh[4 ].w, random.y );
				frame += lifetime * animationRate;
				frame = min( frame, texAnimFrames - 1.0 );
			} else {
				frame += lifetimeNormalized * texAnimFrames;
			}
			vofi_TexCoord0.xy = AnimateTexCoord( texCoord, frame, texAnimFrames, texAnimColumns, texAnimRows, useRandomRow, random.w );
			if ( int( _va_freqHigh[4 ].y ) != 0 ) {
				vofi_TexCoord1.xy = AnimateTexCoord( texCoord, frame + 1.0, texAnimFrames, texAnimColumns, texAnimRows, useRandomRow, random.w );
				vofi_TexCoord0.w = fract( frame );
			} else {
				vofi_TexCoord1.xy = vofi_TexCoord0.xy;
				vofi_TexCoord0.w = 0.0;
			}
		} else {
			vofi_TexCoord0.xy = texCoord;
			vofi_TexCoord1.xy = texCoord;
			vofi_TexCoord0.w = 0.0;
		}
		gl_Position.x = dot4( viewPosition, _va_freqLow[4 ] );
		gl_Position.y = dot4( viewPosition, _va_freqLow[5 ] );
		gl_Position.z = dot4( viewPosition, _va_freqLow[6 ] );
		gl_Position.w = dot4( viewPosition, _va_freqLow[7 ] );
		vofi_Color = mix( _va_freqHigh[6 ], _va_freqHigh[7 ], lifetimeNormalized );
		vofi_Color = mix( vofi_Color, _va_freqHigh[8 ], fadeBlend );
	}
}