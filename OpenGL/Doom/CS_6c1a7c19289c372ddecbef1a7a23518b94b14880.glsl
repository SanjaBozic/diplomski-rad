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

uniform vec4 _ca_freqHigh [5];
uniform vec4 _ca_freqLow [7];
layout( local_size_x = 16, local_size_y = 16, local_size_z = 1 ) in ;
uniform sampler2D samp_tex1;
uniform sampler2D samp_tex0;
layout( binding = 0, rg16f ) uniform image2D ib_computevelocitytarget ;
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
vec4 tex2DFetch ( sampler2D image, ivec2 texcoord, int mip ) { return texelFetch( image, texcoord, mip ); }
float GetLinearDepth ( float ndcZ, vec4 projectionMatrixZ, float rcpFarZ, bool bFirstPersonArmsRescale ) {
	float linearZ = projectionMatrixZ.w / ( ndcZ + projectionMatrixZ.z );
	if ( bFirstPersonArmsRescale ) {
		linearZ *= linearZ < 1.0 ? 10.0 : 1.0;
	}
	return linearZ * rcpFarZ;
}
shared vec2 packedVelocitiesGSM [ 16 * 16 ];
float LenghtSqr ( vec2 v ) { return dot( v, v ); }
vec2 OutputVelocityTargetTile ( vec4 mbParms, vec2 v ) {
	v *= mbParms.z;
	const float len = inversesqrt( dot( v.xy, v.xy ) );
	v *= saturate( mbParms.w * len );
	v *= mbParms.xy;
	return vec2( v );
}
vec2 computeVelocity ( ivec2 pixCoords ) {
	const vec2 winPos = screenPosToTexcoord( vec2( pixCoords.xy ), _ca_freqHigh[0 ] );
	const vec2 resScale = _ca_freqLow[0 ].zw;
	const float ndcZ = tex2DFetch( samp_tex1, pixCoords, 0 ).x;
	const float linearZ = GetLinearDepth( ndcZ, _ca_freqLow[1 ], 1.0, true );
	const vec2 objV = tex2DFetch( samp_tex0, pixCoords, 0 ).xy;
	const vec3 frustumVecX0 = mix( _ca_freqLow[2 ].xyz, _ca_freqLow[3 ].xyz, winPos.x * _ca_freqLow[0 ].z );
	const vec3 frustumVecX1 = mix( _ca_freqLow[4 ].xyz, _ca_freqLow[5 ].xyz, winPos.x * _ca_freqLow[0 ].z );
	const vec3 frustumVec = mix( frustumVecX1.xyz, frustumVecX0.xyz, winPos.y * _ca_freqLow[0 ].w );
	const vec3 world_pos = _ca_freqLow[6 ].xyz + frustumVec * linearZ;
	const float rcpHW = 1.0 / ( world_pos.x * _ca_freqHigh[1 ].x + ( world_pos.y * _ca_freqHigh[1 ].y + ( world_pos.z * _ca_freqHigh[1 ].z + _ca_freqHigh[1 ].w ) ) );
	const vec2 winPosPrev = vec2( ( world_pos.x * _ca_freqHigh[2 ].x + ( world_pos.y * _ca_freqHigh[2 ].y + ( world_pos.z * _ca_freqHigh[2 ].z + _ca_freqHigh[2 ].w ) ) ),
	( world_pos.x * _ca_freqHigh[3 ].x + ( world_pos.y * _ca_freqHigh[3 ].y + ( world_pos.z * _ca_freqHigh[3 ].z + _ca_freqHigh[3 ].w ) ) ) ) * rcpHW;
	const vec2 velocity = ( objV.x < 1.0 ) ? objV.xy : winPos.xy - winPosPrev.xy * _ca_freqLow[0 ].xy;
	return OutputVelocityTargetTile( _ca_freqHigh[4 ], velocity ) ;
}
void main() {
	{
		vec2 MaxVMinZ = computeVelocity( ivec2(gl_GlobalInvocationID.xy ) * 4 + ivec2( 0, 0 ) );
		vec2 MaxVMinZCurr = computeVelocity( ivec2(gl_GlobalInvocationID.xy ) * 4 + ivec2( 1, 0 ) );
		MaxVMinZ.xy = ( LenghtSqr( MaxVMinZ.xy ) > LenghtSqr( MaxVMinZCurr.xy ) ) ? MaxVMinZ.xy : MaxVMinZCurr.xy;
		MaxVMinZCurr = computeVelocity( ivec2(gl_GlobalInvocationID.xy ) * 4 + ivec2( 0, 1 ) );
		MaxVMinZ.xy = ( LenghtSqr( MaxVMinZ.xy ) > LenghtSqr( MaxVMinZCurr.xy ) ) ? MaxVMinZ.xy : MaxVMinZCurr.xy;
		MaxVMinZCurr = computeVelocity( ivec2(gl_GlobalInvocationID.xy ) * 4 + ivec2( 1, 1 ) );
		MaxVMinZ.xy = ( LenghtSqr( MaxVMinZ.xy ) > LenghtSqr( MaxVMinZCurr.xy ) ) ? MaxVMinZ.xy : MaxVMinZCurr.xy;
		packedVelocitiesGSM[gl_LocalInvocationID.x +gl_LocalInvocationID.y * 16 ] = MaxVMinZ;
		memoryBarrier(); barrier();
		MaxVMinZ = vec2( 0 ); if ( (gl_LocalInvocationID.x & 3 ) == 0 ) {
			vec2 v0 = packedVelocitiesGSM[gl_LocalInvocationID.x + 0 +gl_LocalInvocationID.y * 16 ];
			vec2 v1 = packedVelocitiesGSM[gl_LocalInvocationID.x + 1 +gl_LocalInvocationID.y * 16 ];
			vec2 v2 = packedVelocitiesGSM[gl_LocalInvocationID.x + 2 +gl_LocalInvocationID.y * 16 ];
			vec2 v3 = packedVelocitiesGSM[gl_LocalInvocationID.x + 3 +gl_LocalInvocationID.y * 16 ];
			MaxVMinZ.xy = ( LenghtSqr( v0.xy ) > LenghtSqr( v1.xy ) ) ? v0.xy : v1.xy;
			MaxVMinZ.xy = ( LenghtSqr( MaxVMinZ.xy ) > LenghtSqr( v2.xy ) ) ? MaxVMinZ.xy : v2.xy;
			MaxVMinZ.xy = ( LenghtSqr( MaxVMinZ.xy ) > LenghtSqr( v3.xy ) ) ? MaxVMinZ.xy : v3.xy;
			packedVelocitiesGSM[gl_LocalInvocationID.x +gl_LocalInvocationID.y * 16 ] = MaxVMinZ;
		}
		memoryBarrier(); barrier();
		MaxVMinZ = vec2( 0 ); if ( (gl_LocalInvocationID.x & 3 ) == 0 && (gl_LocalInvocationID.y & 3 ) == 0 ) {
			vec2 v0 = packedVelocitiesGSM[gl_LocalInvocationID.x + (gl_LocalInvocationID.y + 0 ) * 16 ];
			vec2 v1 = packedVelocitiesGSM[gl_LocalInvocationID.x + (gl_LocalInvocationID.y + 1 ) * 16 ];
			vec2 v2 = packedVelocitiesGSM[gl_LocalInvocationID.x + (gl_LocalInvocationID.y + 2 ) * 16 ];
			vec2 v3 = packedVelocitiesGSM[gl_LocalInvocationID.x + (gl_LocalInvocationID.y + 3 ) * 16 ];
			MaxVMinZ.xy = ( LenghtSqr( v0.xy ) > LenghtSqr( v1.xy ) ) ? v0.xy : v1.xy;
			MaxVMinZ.xy = ( LenghtSqr( MaxVMinZ.xy ) > LenghtSqr( v2.xy ) ) ? MaxVMinZ.xy : v2.xy;
			MaxVMinZ.xy = ( LenghtSqr( MaxVMinZ.xy ) > LenghtSqr( v3.xy ) ) ? MaxVMinZ.xy : v3.xy;
			packedVelocitiesGSM[gl_LocalInvocationID.x +gl_LocalInvocationID.y * 16 ] = MaxVMinZ;
		}
		memoryBarrier(); barrier();
		MaxVMinZ = vec2( 0 ); if ( (gl_LocalInvocationID.x ) == 0 ) {
			vec2 v0 = packedVelocitiesGSM[gl_LocalInvocationID.x + 0 +gl_LocalInvocationID.y * 16 ];
			vec2 v1 = packedVelocitiesGSM[gl_LocalInvocationID.x + 4 +gl_LocalInvocationID.y * 16 ];
			vec2 v2 = packedVelocitiesGSM[gl_LocalInvocationID.x + 8 +gl_LocalInvocationID.y * 16 ];
			vec2 v3 = packedVelocitiesGSM[gl_LocalInvocationID.x + 12 +gl_LocalInvocationID.y * 16 ];
			MaxVMinZ.xy = ( LenghtSqr( v0.xy ) > LenghtSqr( v1.xy ) ) ? v0.xy : v1.xy;
			MaxVMinZ.xy = ( LenghtSqr( MaxVMinZ.xy ) > LenghtSqr( v2.xy ) ) ? MaxVMinZ.xy : v2.xy;
			MaxVMinZ.xy = ( LenghtSqr( MaxVMinZ.xy ) > LenghtSqr( v3.xy ) ) ? MaxVMinZ.xy : v3.xy;
			packedVelocitiesGSM[gl_LocalInvocationID.x +gl_LocalInvocationID.y * 16 ] = MaxVMinZ;
		}
		memoryBarrier(); barrier();
		MaxVMinZ = vec2( 0 ); if ( (gl_LocalInvocationID.x ) == 0 && (gl_LocalInvocationID.y ) == 0 ) {
			vec2 v0 = packedVelocitiesGSM[gl_LocalInvocationID.x + (gl_LocalInvocationID.y + 0 ) * 16 ];
			vec2 v1 = packedVelocitiesGSM[gl_LocalInvocationID.x + (gl_LocalInvocationID.y + 4 ) * 16 ];
			vec2 v2 = packedVelocitiesGSM[gl_LocalInvocationID.x + (gl_LocalInvocationID.y + 8 ) * 16 ];
			vec2 v3 = packedVelocitiesGSM[gl_LocalInvocationID.x + (gl_LocalInvocationID.y + 12 ) * 16 ];
			MaxVMinZ.xy = ( LenghtSqr( v0.xy ) > LenghtSqr( v1.xy ) ) ? v0.xy : v1.xy;
			MaxVMinZ.xy = ( LenghtSqr( MaxVMinZ.xy ) > LenghtSqr( v2.xy ) ) ? MaxVMinZ.xy : v2.xy;
			MaxVMinZ.xy = ( LenghtSqr( MaxVMinZ.xy ) > LenghtSqr( v3.xy ) ) ? MaxVMinZ.xy : v3.xy;
			imageStore( ib_computevelocitytarget, ivec2(gl_WorkGroupID.xy ), vec4( MaxVMinZ.xy, 0, 0 ) );
		}
	}
}