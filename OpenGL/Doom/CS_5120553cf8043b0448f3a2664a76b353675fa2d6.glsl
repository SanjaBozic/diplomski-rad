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

uniform vec4 _ca_freqHigh [3];
layout( local_size_x = 8, local_size_y = 8, local_size_z = 1 ) in ;
uniform sampler2D samp_tex2;
uniform sampler2D samp_tex0;
uniform sampler2D samp_tex1;
layout( binding = 0, r11f_g11f_b10f ) uniform image2D ib_computepostprocesstarget ;
vec2 SoftDepthCmp ( vec2 z0, vec2 z1, const vec2 softZ ) {
	return saturate( ( vec2( 1.0 ) + z0 * softZ) - z1* softZ );
}
vec4 BatchCmpRcp ( float lensq_xy, vec2 rcp_vxy ) {
	return saturate( vec4( ( vec4( 1.0 ) - lensq_xy.xxxx * (rcp_vxy.xyxy)) + vec4(0.0, 0.0, 0.95, 0.95) ));
}
void main() {
	{
		{
			vec2 tc = ( ivec2(gl_GlobalInvocationID.xy ).xy + 0.5 ) * _ca_freqHigh[0 ].zw;
			vec3 outputColor;
			{
				int num_samples = 8;
				float num_samplesf = float( num_samples );
				float step = 1.0 / ( num_samplesf - 1.0 );
				vec2 max_v = tex2Dlod( samp_tex2, vec4( tc.xy, 0, 0 ) ).xy;
				vec3 acc = tex2Dlod( samp_tex0, vec4( tc, 0, 0 ) ).xyz;
				outputColor.xyz = acc.xyz;
				float vlen_threshold = dot( _ca_freqHigh[0 ].zw, _ca_freqHigh[0 ].zw ); if ( dot( max_v.xy, max_v.xy ) - vlen_threshold > 0.0 && _ca_freqHigh[1 ].z == 1.0 ) {
					float v_scale = _ca_freqHigh[1 ].y;
					max_v.xy *= v_scale;
					vec2 vx = tex2Dlod( samp_tex1, vec4( tc.xy, 0, 0 ) ).xy;
					float len_vx = vx.x;
					vec2 blur_step = max_v.xy * step * 2.0 ;
					vec2 tc_start = tc.xy - max_v.xy;
					float min_len_xy = - length( max_v.xy );
					float len_xy_step = abs( min_len_xy ) * step * 2.0;
					float cw = 1;
					float wacc = cw;
					{
						{
							vec4 tap_scales = vec4( 0 ) + vec4( 0.0, 1.0, 2.0, 3.0 );
							vec4 tc_curr0 = tc_start.xyxy + blur_step.xyxy * tap_scales.xxyy;
							tc_curr0 = clamp( tc_curr0, vec4( 0.0 ), _ca_freqHigh[2 ].xyxy );
							vec4 tc_curr1 = tc_start.xyxy + blur_step.xyxy * tap_scales.zzww;
							tc_curr1 = clamp( tc_curr1, vec4( 0.0 ), _ca_freqHigh[2 ].xyxy );
							vec3 tap0 = tex2Dlod( samp_tex0, vec4( tc_curr0.xy, 0, 0 ) ).xyz;
							vec3 tap1 = tex2Dlod( samp_tex0, vec4( tc_curr0.zw, 0, 0 ) ).xyz;
							vec3 tap2 = tex2Dlod( samp_tex0, vec4( tc_curr1.xy, 0, 0 ) ).xyz;
							vec3 tap3 = tex2Dlod( samp_tex0, vec4( tc_curr1.zw, 0, 0 ) ).xyz;
							vec2 vy0 = tex2Dlod( samp_tex1, vec4( tc_curr0.xy, 0, 0 ) ).xy;
							vec2 vy1 = tex2Dlod( samp_tex1, vec4( tc_curr0.zw, 0, 0 ) ).xy;
							vec2 vy2 = tex2Dlod( samp_tex1, vec4( tc_curr1.xy, 0, 0 ) ).xy;
							vec2 vy3 = tex2Dlod( samp_tex1, vec4( tc_curr1.zw, 0, 0 ) ).xy;
							vec4 len_vy = vec4( vy0.x, vy1.x, vy2.x, vy3.x );
							vec4 len_xy = abs( min_len_xy + len_xy_step * tap_scales );
							vec2 cmp_softz0 = SoftDepthCmp( vec2( vx.y, vy0.y ), vec2( vy0.y, vx.y ), vec2( 1 ) );
							vec4 cmp_batch0 = BatchCmpRcp( len_xy.x, vec2( len_vy.x, len_vx ) );
							vec2 cmp_softz1 = SoftDepthCmp( vec2( vx.y, vy1.y ), vec2( vy1.y, vx.y ), vec2( 1 ) );
							vec4 cmp_batch1 = BatchCmpRcp( len_xy.y, vec2( len_vy.y, len_vx ) );
							vec2 cmp_softz2 = SoftDepthCmp( vec2( vx.y, vy2.y ), vec2( vy2.y, vx.y ), vec2( 1 ) );
							vec4 cmp_batch2 = BatchCmpRcp( len_xy.z, vec2( len_vy.z, len_vx ) );
							vec2 cmp_softz3 = SoftDepthCmp( vec2( vx.y, vy3.y ), vec2( vy3.y, vx.y ), vec2( 1 ) );
							vec4 cmp_batch3 = BatchCmpRcp( len_xy.w, vec2( len_vy.w, len_vx ) );
							vec4 weights = vec4( dot( cmp_softz0.xy, cmp_batch0.xy ) + ( cmp_batch0.z * cmp_batch0.w ) * 2.0,
							dot( cmp_softz1.xy, cmp_batch1.xy ) + ( cmp_batch1.z * cmp_batch1.w ) * 2.0,
							dot( cmp_softz2.xy, cmp_batch2.xy ) + ( cmp_batch2.z * cmp_batch2.w ) * 2.0,
							dot( cmp_softz3.xy, cmp_batch3.xy ) + ( cmp_batch3.z * cmp_batch3.w ) * 2.0 );
							acc = ( ( ( acc + tap0 * weights.x ) + tap1 * weights.y ) + tap2 * weights.z ) + tap3 * weights.w;
							wacc += dot( weights, vec4( 1 ) );
						}
					};
					{
						{
							vec4 tap_scales = vec4( 4 ) + vec4( 0.0, 1.0, 2.0, 3.0 );
							vec4 tc_curr0 = tc_start.xyxy + blur_step.xyxy * tap_scales.xxyy;
							tc_curr0 = clamp( tc_curr0, vec4( 0.0 ), _ca_freqHigh[2 ].xyxy );
							vec4 tc_curr1 = tc_start.xyxy + blur_step.xyxy * tap_scales.zzww;
							tc_curr1 = clamp( tc_curr1, vec4( 0.0 ), _ca_freqHigh[2 ].xyxy );
							vec3 tap0 = tex2Dlod( samp_tex0, vec4( tc_curr0.xy, 0, 0 ) ).xyz;
							vec3 tap1 = tex2Dlod( samp_tex0, vec4( tc_curr0.zw, 0, 0 ) ).xyz;
							vec3 tap2 = tex2Dlod( samp_tex0, vec4( tc_curr1.xy, 0, 0 ) ).xyz;
							vec3 tap3 = tex2Dlod( samp_tex0, vec4( tc_curr1.zw, 0, 0 ) ).xyz;
							vec2 vy0 = tex2Dlod( samp_tex1, vec4( tc_curr0.xy, 0, 0 ) ).xy;
							vec2 vy1 = tex2Dlod( samp_tex1, vec4( tc_curr0.zw, 0, 0 ) ).xy;
							vec2 vy2 = tex2Dlod( samp_tex1, vec4( tc_curr1.xy, 0, 0 ) ).xy;
							vec2 vy3 = tex2Dlod( samp_tex1, vec4( tc_curr1.zw, 0, 0 ) ).xy;
							vec4 len_vy = vec4( vy0.x, vy1.x, vy2.x, vy3.x );
							vec4 len_xy = abs( min_len_xy + len_xy_step * tap_scales );
							vec2 cmp_softz0 = SoftDepthCmp( vec2( vx.y, vy0.y ), vec2( vy0.y, vx.y ), vec2( 1 ) );
							vec4 cmp_batch0 = BatchCmpRcp( len_xy.x, vec2( len_vy.x, len_vx ) );
							vec2 cmp_softz1 = SoftDepthCmp( vec2( vx.y, vy1.y ), vec2( vy1.y, vx.y ), vec2( 1 ) );
							vec4 cmp_batch1 = BatchCmpRcp( len_xy.y, vec2( len_vy.y, len_vx ) );
							vec2 cmp_softz2 = SoftDepthCmp( vec2( vx.y, vy2.y ), vec2( vy2.y, vx.y ), vec2( 1 ) );
							vec4 cmp_batch2 = BatchCmpRcp( len_xy.z, vec2( len_vy.z, len_vx ) );
							vec2 cmp_softz3 = SoftDepthCmp( vec2( vx.y, vy3.y ), vec2( vy3.y, vx.y ), vec2( 1 ) );
							vec4 cmp_batch3 = BatchCmpRcp( len_xy.w, vec2( len_vy.w, len_vx ) );
							vec4 weights = vec4( dot( cmp_softz0.xy, cmp_batch0.xy ) + ( cmp_batch0.z * cmp_batch0.w ) * 2.0,
							dot( cmp_softz1.xy, cmp_batch1.xy ) + ( cmp_batch1.z * cmp_batch1.w ) * 2.0,
							dot( cmp_softz2.xy, cmp_batch2.xy ) + ( cmp_batch2.z * cmp_batch2.w ) * 2.0,
							dot( cmp_softz3.xy, cmp_batch3.xy ) + ( cmp_batch3.z * cmp_batch3.w ) * 2.0 );
							acc = ( ( ( acc + tap0 * weights.x ) + tap1 * weights.y ) + tap2 * weights.z ) + tap3 * weights.w;
							wacc += dot( weights, vec4( 1 ) );
						}
					};
					outputColor.xyz = acc.xyz * ( ( wacc > 0.0 ) ? ( 1.0 / wacc ) : 1.0 );
				}
			};
			imageStore( ib_computepostprocesstarget, ivec2(gl_GlobalInvocationID.xy ).xy, vec4( outputColor.xyz, 1.0 ) );
		};
	}
}