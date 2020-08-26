#version 430 core
#extension GL_ARB_shader_clock : enable
//This is a compute Shader

float saturate( float v ) { return clamp( v, 0.0, 1.0 ); }
vec2 saturate( vec2 v ) { return clamp( v, 0.0, 1.0 ); }
vec3 saturate( vec3 v ) { return clamp( v, 0.0, 1.0 ); }
vec4 saturate( vec4 v ) { return clamp( v, 0.0, 1.0 ); }

vec4 tex2D( sampler2D image, vec2 texcoord ) { return texture( image, texcoord.xy ); }
vec4 tex2D( sampler2DShadow image, vec3 texcoord ) { return vec4( texture( image, texcoord.xyz ) ); }
vec4 tex2DARRAY( sampler2DArray image, vec3 texcoord ) { return texture( image, texcoord.xyz ); }

vec4 tex2D( sampler2D image, vec2 texcoord, vec2 dx, vec2 dy ) { return textureGrad( image, texcoord.xy, dx, dy ); }
vec4 tex2D( sampler2DShadow image, vec3 texcoord, vec2 dx, vec2 dy ) { return vec4( textureGrad( image, texcoord.xyz, dx, dy ) ); }
vec4 tex2DARRAY( sampler2DArray image, vec3 texcoord, vec2 dx, vec2 dy ) { return textureGrad( image, texcoord.xyz, dx, dy ); }

vec4 texCUBE( samplerCube image, vec3 texcoord ) { return texture( image, texcoord.xyz ); }
vec4 texCUBE( samplerCubeShadow image, vec4 texcoord ) { return vec4( texture( image, texcoord.xyzw ) ); }
vec4 texCUBEARRAY( samplerCubeArray image, vec4 texcoord ) { return texture( image, texcoord.xyzw ); }

vec4 tex1Dproj( sampler1D image, vec2 texcoord ) { return textureProj( image, texcoord ); }
vec4 tex2Dproj( sampler2D image, vec3 texcoord ) { return textureProj( image, texcoord ); }
vec4 tex3Dproj( sampler3D image, vec4 texcoord ) { return textureProj( image, texcoord ); }

vec4 tex1Dlod( sampler1D image, vec4 texcoord ) { return textureLod( image, texcoord.x, texcoord.w ); }
vec4 tex2Dlod( sampler2D image, vec4 texcoord ) { return textureLod( image, texcoord.xy, texcoord.w ); }
vec4 tex2DARRAYlod( sampler2DArray image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 tex3Dlod( sampler3D image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBElod( samplerCube image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEARRAYlod( samplerCubeArray image, vec4 texcoord, float lod ) { return textureLod( image, texcoord.xyzw, lod ); }

vec4 tex2DGatherRed( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 0 ); }
vec4 tex2DGatherGreen( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 1 ); }
vec4 tex2DGatherBlue( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 2 ); }
vec4 tex2DGatherAlpha( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 3 ); }

vec4 tex2DGatherOffsetRed( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 0 ); }
vec4 tex2DGatherOffsetGreen( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 1 ); }
vec4 tex2DGatherOffsetBlue( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 2 ); }
vec4 tex2DGatherOffsetAlpha( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 3 ); }

#define tex2DGatherOffsetsRed( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 0 )
#define tex2DGatherOffsetsGreen( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 1 )
#define tex2DGatherOffsetsBlue( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 2 )
#define tex2DGatherOffsetsAlpha( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 3 )

uniform vec4 _ca_freqHigh [18];
uniform vec4 _ca_freqLow [6];
layout( local_size_x = 64, local_size_y = 1, local_size_z = 1 ) in ;
uniform sampler3D samp_gpuparticlevectorfield0;
uniform sampler3D samp_gpuparticlevectorfield1;
uniform sampler2D samp_viewdepthmap;
uniform sampler2D samp_viewnormalmap;
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
struct vectorfield_t {
	vec4 axisX ;
	vec4 axisY ;
	vec3 axisZ ;
	bool repeat ;
	vec3 origin ;
	float strength ;
	vec3 sizeRcp ;
	float tightness ;
};
layout( std430 ) buffer particlerandom_b {
	restrict readonly vec4 particlerandom[ ];
};
layout( std430 ) buffer particleindirectdrawargs_b {
	restrict coherent int particleindirectdrawargs[ ];
};
layout( std430 ) buffer particles_b {
	restrict particle_t particles[ ];
};
layout( std430 ) buffer particlevectorfields_b {
	restrict readonly vectorfield_t particlevectorfields[ ];
};
float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
float dot4 ( vec4 a, vec4 b ) { return dot( a, b ); }
float dot4 ( vec2 a, vec4 b ) { return dot( vec4( a, 0.0, 1.0 ), b ); }
float GetLinearDepth ( float ndcZ, vec4 projectionMatrixZ, float rcpFarZ, bool bFirstPersonArmsRescale ) {
	float linearZ = projectionMatrixZ.w / ( ndcZ + projectionMatrixZ.z );
	if ( bFirstPersonArmsRescale ) {
		linearZ *= linearZ < 1.0 ? 10.0 : 1.0;
	}
	return linearZ * rcpFarZ;
}
vec2 OctWrap ( vec2 v ) {
	return ( 1.0 - abs( v.yx ) ) * vec2( ( v.x >= 0.0 ? 1.0 : -1.0 ), ( v.y >= 0.0 ? 1.0 : -1.0 ) );
}
vec3 NormalOctDecode ( vec2 encN, bool expand_range ) {
	if ( expand_range ) {
		encN = encN * 2.0 - 1.0;
	}
	vec3 n;
	n.z = 1.0 - abs( encN.x ) - abs( encN.y );
	n.xy = n.z >= 0.0 ? encN.xy : OctWrap( encN.xy );
	n = normalize( n );
	return n;
}
vec4 FetchRandomWithSeed ( int index, vec4 seed ) {
	vec4 random = particlerandom[ index & (8192 - 1) ];
	return fract( random + seed + 0.1234*floor( float( index ) * (1.0 / 8192) ) );
}
vec3 DistributeRectSurface ( vec4 random ) {
	return vec3( random.xy * 2.0 - 1.0, 0.0 );
}
vec3 DistributeBoxSurface ( vec4 random ) {
	vec3 distribution;
	if ( random.z < 1.0/3.0 ) {
		distribution.x = random.z < 1.0/6.0 ? -1.0 : 1.0;
		distribution.yz = random.xy * 2.0 - 1.0;
	} else if ( random.z < 2.0/3.0 ) {
		distribution.y = random.z < 3.0/6.0 ? -1.0 : 1.0;
		distribution.xz = random.xy * 2.0 - 1.0;
	} else {
		distribution.z = random.z < 5.0/6.0 ? -1.0 : 1.0;
		distribution.xy = random.xy * 2.0 - 1.0;
	}
	return distribution;
}
vec3 DistributeBox ( vec4 random ) {
	return random.xyz * 2.0 - 1.0;
}
vec3 DistributeSphereSurface ( vec4 random ) {
	const float a = 2.0 * 3.141592 * random.x;
	const float z = random.y * 2.0 - 1.0;
	const float k = sqrt( 1.0 - z*z );
	return vec3( k * cos( a ), k * sin( a ), z );
}
vec3 DistributeSphere ( vec4 random ) {
	return DistributeSphereSurface( random ) * sqrt( random.w );
}
vec3 DistributeCylinderSurface ( vec4 random ) {
	const float a = 2.0 * 3.141592 * random.x;
	return vec3( cos( a ), sin( a ), random.y );
}
vec3 DistributeCylinder ( vec4 random ) {
	vec3 distribution = DistributeCylinderSurface( random );
	distribution.xy *= sqrt( random.z );
	return distribution;
}
vec3 Distribute ( int type, vec4 random ) {
	switch ( type ) {
		case 0: return DistributeRectSurface( random );
		case 1: return DistributeBox( random );
		case 2: return DistributeBoxSurface( random );
		case 3: return DistributeSphere( random );
		case 4: return DistributeSphereSurface( random );
		case 5: return DistributeCylinder( random);
		default: return DistributeCylinderSurface( random );
	};
}
void CommitParticle ( int index ) {
	int commitListIndex;
	{ commitListIndex = atomicAdd( particleindirectdrawargs[0], 6 ); };
	commitListIndex /= 6;
	particles[commitListIndex].committedIndex = index;
}
void EmitParticle ( int index, int cycle, float lifetime ) {
	const vec4 random = FetchRandomWithSeed( index, _ca_freqHigh[0 ] );
	vec3 localPosition = Distribute( int( _ca_freqHigh[1 ].w ), random );
	vec3 localVelocity = Distribute( int( _ca_freqHigh[2 ].w ), random );
	localPosition = localPosition * _ca_freqHigh[1 ].xyz + _ca_freqHigh[3 ].xyz;
	localVelocity = localVelocity * _ca_freqHigh[2 ].xyz + _ca_freqHigh[4 ].xyz;
	vec3 position;
	position.x = dot3( localPosition, _ca_freqHigh[5 ].xyz );
	position.y = dot3( localPosition, _ca_freqHigh[6 ].xyz );
	position.z = dot3( localPosition, _ca_freqHigh[7 ].xyz );
	position += _ca_freqHigh[8 ].xyz;
	vec3 velocity;
	velocity.x = dot3( localVelocity, _ca_freqHigh[5 ].xyz );
	velocity.y = dot3( localVelocity, _ca_freqHigh[6 ].xyz );
	velocity.z = dot3( localVelocity, _ca_freqHigh[7 ].xyz );
	const vec3 acceleration = _ca_freqHigh[9 ].xyz;
	position += velocity * lifetime + acceleration * ( lifetime * lifetime * 0.5 );
	velocity += acceleration * lifetime;
	velocity += _ca_freqHigh[10 ].xyz;
	const float maxLifetime = mix( _ca_freqHigh[11 ].x, _ca_freqHigh[11 ].y, random.w ); particles[index].flags = 0; particles[index].cycle = cycle; particles[index].position = position; particles[index].velocity = velocity; particles[index].maxLifetime = maxLifetime;
}
void ApplyVectorFieldForces ( vec4 position, inout vec3 velocity, inout vec3 force ) {
	for ( int i = 0; i < 2; i++ ) {
		const float vectorFieldIndex = ( i == 0 ) ? _ca_freqHigh[12 ].x : _ca_freqHigh[12 ].y;
		if ( vectorFieldIndex >= 0.0 ) {
			const vectorfield_t vectorField = particlevectorfields[ int( vectorFieldIndex ) ];
			vec3 localOffset = position.xyz - vectorField.origin;
			vec3 localPosition;
			localPosition.x = dot3( localOffset, vectorField.axisX );
			localPosition.y = dot3( localOffset, vectorField.axisY );
			localPosition.z = dot3( localOffset, vectorField.axisZ );
			vec4 tc = vec4( localPosition * vectorField.sizeRcp + vec3( 0.5 ), 0.0 );
			const bool inRange = tc.x > 0.0 && tc.x < 1.0 && tc.y > 0.0 && tc.y < 1.0 && tc.z > 0.0 && tc.z < 1.0;
			if ( vectorField.repeat || inRange ) {
				if ( vectorField.repeat ) {
					tc.xyz = fract( abs( tc.xyz ) );
				}
				vec3 localVector;
				localVector = vec3( 0, 0, 0 );
				if ( i == 0 ) {
					localVector = tex3Dlod( samp_gpuparticlevectorfield0, tc ).xyz;
				} else {
					localVector = tex3Dlod( samp_gpuparticlevectorfield1, tc ).xyz;
				}
				vec3 transformedVector;
				transformedVector.x = dot3( localVector, vec3( vectorField.axisX.x, vectorField.axisY.x, vectorField.axisZ.x ) );
				transformedVector.y = dot3( localVector, vec3( vectorField.axisX.y, vectorField.axisY.y, vectorField.axisZ.y ) );
				transformedVector.z = dot3( localVector, vec3( vectorField.axisX.z, vectorField.axisY.z, vectorField.axisZ.z ) );
				transformedVector *= vectorField.strength;
				force += transformedVector * ( 1.0 - vectorField.tightness );
				velocity = mix( velocity, transformedVector, vectorField.tightness );
			}
		}
	}
}
bool DoCollisionTest ( vec4 screenPosition, out float penetration ) {
	const float sampleDepth = tex2Dlod( samp_viewdepthmap, vec4( screenPosition.xy, 0.0, 0.0 ) ).x;
	if ( sampleDepth < screenPosition.z ) {
		const float sampleDepthLinear = GetLinearDepth( sampleDepth, _ca_freqLow[0 ], 1.0, true );
		const float screenZLinear = GetLinearDepth( screenPosition.z, _ca_freqLow[0 ], 1.0, true );
		const float thickness = 100.0;
		penetration = abs( sampleDepthLinear - screenZLinear );
		return penetration < thickness;
	}
	return false;
}
void SimulateParticle ( int index, float lifetime ) {
	const vec4 random = FetchRandomWithSeed( index, _ca_freqHigh[0 ] );
	const bool moving = ( particles[index].flags & (1 << 0) ) == 0;
	vec4 position = vec4( particles[index].position, 1.0 );
	vec4 positionOld = position;
	vec3 velocity = particles[index].velocity;
	vec3 velocityOld = velocity;
	if ( moving ) {
		const float timeStep = _ca_freqHigh[13 ].x;
		const float lifetimeNormalized = lifetime / particles[index].maxLifetime;
		vec3 force = vec3( 0.0 );
		ApplyVectorFieldForces( position, velocity, force );
		const float mass = _ca_freqHigh[14 ].w + _ca_freqHigh[15 ].x * ( random.x * 2.0 - 1.0 );
		const vec3 acceleration = _ca_freqHigh[9 ].xyz + force / mass;
		velocity += acceleration * timeStep;
		position.xyz += ( velocity - acceleration * timeStep * 0.5 ) * timeStep;
	}
	vec4 screenPosition;
	screenPosition.x = dot4( position, _ca_freqLow[1 ] );
	screenPosition.y = dot4( position, _ca_freqLow[2 ] );
	screenPosition.z = dot4( position, _ca_freqLow[3 ] );
	screenPosition.w = dot4( position, _ca_freqLow[4 ] );
	const bool visibleZ = screenPosition.z >= -screenPosition.w && screenPosition.z <= screenPosition.w;
	const bool visible =
	screenPosition.x >= -screenPosition.w && screenPosition.x <= screenPosition.w &&
	screenPosition.y >= -screenPosition.w && screenPosition.y <= screenPosition.w &&
	visibleZ;
	if ( moving && visible && int( _ca_freqHigh[14 ].x ) > 0 ) {
		screenPosition.xyz *= 1.0 / screenPosition.w;
		screenPosition.xy = screenPosition.xy * 0.5 + 0.5;
		screenPosition.xy *= _ca_freqLow[5 ].xy;
		float penetration;
		if ( DoCollisionTest( screenPosition, penetration ) ) {
			const vec3 normal = NormalOctDecode( tex2Dlod( samp_viewnormalmap, vec4( screenPosition.xy, 0, 0 ) ).xy , false );
			position = positionOld;
			velocity = velocityOld;
			velocity = _ca_freqHigh[14 ].y * reflect( velocity, normal );
			velocity -= ( 1.0 - _ca_freqHigh[14 ].z ) * dot3( velocity, normal ) * normal;
			if ( penetration < 1.0 && dot( velocity, velocity ) < 1.0 ) { particles[index].flags |= (1 << 0);
			}
		}
	} particles[index].position = position.xyz; particles[index].velocity = velocity; particles[index].lifetime = lifetime;
	if ( visibleZ ) {
		CommitParticle( index );
	}
}
void main() {
	{
		int index = int(gl_GlobalInvocationID.x );
		if ( index == 0 ) { particleindirectdrawargs[0] = 0; particleindirectdrawargs[1] = 1;
		}
		memoryBarrier(); barrier();
		if ( index >= int( _ca_freqHigh[16 ].w ) ) {
			return;
		}
		if ( int( _ca_freqHigh[17 ].z ) != 0 ) { particles[index].cycle = -1; particles[index].lifetime = -1.0;
		}
		float age = _ca_freqHigh[16 ].x - index * _ca_freqHigh[16 ].z;
		if ( age < 0.0 ) {
			return;
		}
		int maxCycles = int( _ca_freqHigh[17 ].y );
		int cycle = int( age / _ca_freqHigh[16 ].y );
		float lifetime = age - cycle * _ca_freqHigh[16 ].y;
		if ( lifetime > _ca_freqHigh[11 ].y || maxCycles > 0 && cycle >= maxCycles ) {
			return;
		}
		if ( cycle != particles[index].cycle ) {
			EmitParticle( index, cycle, lifetime );
		}
		if ( lifetime <= particles[index].maxLifetime ) {
			SimulateParticle( index, lifetime );
		}
	}
}