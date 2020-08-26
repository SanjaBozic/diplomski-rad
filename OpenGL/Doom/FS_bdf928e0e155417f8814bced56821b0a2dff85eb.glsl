#version 430 core
#extension GL_ARB_shader_clock : enable
void clip( float v ) { if ( v < 0.0 ) { discard; } }
void clip( vec2 v ) { if ( any( lessThan( v, vec2( 0.0 ) ) ) ) { discard; } }
void clip( vec3 v ) { if ( any( lessThan( v, vec3( 0.0 ) ) ) ) { discard; } }
void clip( vec4 v ) { if ( any( lessThan( v, vec4( 0.0 ) ) ) ) { discard; } }

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

vec4 tex1Dbias( sampler1D image, vec4 texcoord ) { return texture( image, texcoord.x, texcoord.w ); }
vec4 tex2Dbias( sampler2D image, vec4 texcoord ) { return texture( image, texcoord.xy, texcoord.w ); }
vec4 tex2DARRAYbias( sampler2DArray image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 tex3Dbias( sampler3D image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEbias( samplerCube image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEARRAYbias( samplerCubeArray image, vec4 texcoord, float bias ) { return texture( image, texcoord.xyzw, bias); }

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

uniform vec4 _fa_freqHigh [6];
uniform vec4 _fa_freqLow [7];
uniform sampler2D samp_tex4;
uniform sampler2D samp_tex2;
uniform sampler2D samp_tex0;

in vec4 gl_FragCoord;

out vec4 out_FragColor0;
out vec4 out_FragColor1;

vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
vec4 tex2DFetch ( sampler2D image, ivec2 texcoord, int mip ) { return texelFetch( image, texcoord, mip ); }
vec4 OutputVelocityTarget ( vec4 mbParms, vec2 v, float z ) {
	const vec2 v_orig = v;
	float alpha = 1.0;
	v *= mbParms.z * alpha;
	const float len = inversesqrt( dot( v.xy, v.xy ) );
	v *= saturate( mbParms.w * len );
	v *= mbParms.xy;
	return vec4( v_orig, vec2( length( v.xy ), z ) );
}
float GetLinearDepth ( float ndcZ, vec4 projectionMatrixZ, float rcpFarZ, bool bFirstPersonArmsRescale ) {
	float linearZ = projectionMatrixZ.w / ( ndcZ + projectionMatrixZ.z );
	if ( bFirstPersonArmsRescale ) {
		linearZ *= linearZ < 1.0 ? 10.0 : 1.0;
	}
	return linearZ * rcpFarZ;
}
vec3 computeVelocity ( vec2 winPos ) {
	const ivec2 offsets = ivec2( 1, -1 );
	const vec4 depths = tex2DGatherOffsetsRed( samp_tex4, winPos.xy, offsets.yy, offsets.xy, offsets.yx, offsets.xx );
	vec3 offsetMinZ = vec3( offsets.yy, depths.x );
	offsetMinZ = depths.y < offsetMinZ.z ? vec3( offsets.xy, depths.y ) : offsetMinZ;
	offsetMinZ = depths.z < offsetMinZ.z ? vec3( offsets.yx, depths.z ) : offsetMinZ;
	offsetMinZ = depths.w < offsetMinZ.z ? vec3( offsets.xx, depths.w ) : offsetMinZ;
	winPos += offsetMinZ.xy * _fa_freqHigh[0 ].zw;
	const float linearZ = GetLinearDepth( offsetMinZ.z, _fa_freqLow[0 ], 1.0, true );
	const vec3 frustumVecX0 = mix( _fa_freqLow[1 ].xyz, _fa_freqLow[2 ].xyz, winPos.x * _fa_freqLow[3 ].z );
	const vec3 frustumVecX1 = mix( _fa_freqLow[4 ].xyz, _fa_freqLow[5 ].xyz, winPos.x * _fa_freqLow[3 ].z );
	const vec3 frustumVec = mix( frustumVecX1.xyz, frustumVecX0.xyz, winPos.y * _fa_freqLow[3 ].w );
	const vec3 world_pos = _fa_freqLow[6 ].xyz + frustumVec * linearZ;
	const float rcpHW = 1.0 / ( world_pos.x * _fa_freqHigh[1 ].x + ( world_pos.y * _fa_freqHigh[1 ].y + ( world_pos.z * _fa_freqHigh[1 ].z + _fa_freqHigh[1 ].w ) ) );
	const vec2 winPosPrev = vec2( ( world_pos.x * _fa_freqHigh[2 ].x + ( world_pos.y * _fa_freqHigh[2 ].y + ( world_pos.z * _fa_freqHigh[2 ].z + _fa_freqHigh[2 ].w ) ) ),
	( world_pos.x * _fa_freqHigh[3 ].x + ( world_pos.y * _fa_freqHigh[3 ].y + ( world_pos.z * _fa_freqHigh[3 ].z + _fa_freqHigh[3 ].w ) ) ) ) * rcpHW;
	const vec2 objV = tex2Dlod( samp_tex2, vec4( winPos, 0, 0 ) ).xy;
	return vec3( ( objV.x < 1.0 ) ? objV.xy : winPos.xy - winPosPrev.xy * _fa_freqLow[3 ].xy , linearZ );
}
void main() {
	{
		vec2 tc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[4 ] );
		{
			vec3 curr_frame = vec3( 0 );
			vec3 curr_frame_lowpass = vec3( 0 );
			vec3 cMax = vec3( 0 );
			vec3 cMin = vec3( 0 );
			vec3 M = tex2DFetch( samp_tex0, ivec2( gl_FragCoord.xy ), 0 ).xyz;
			vec3 velocity = computeVelocity( tc );
			out_FragColor0.xyz = max( vec3( 0 ), M );
			out_FragColor1.xy = OutputVelocityTarget( _fa_freqHigh[5 ], velocity.xy , velocity.z ).zw;
			out_FragColor1.x = 1.0 / out_FragColor1.x;
		};
	}
}