#version 460 core
// ps_5_0
// Checksum: db8e1f90_ff43a3ba_5158fe6a_243cc969
// Name: guiroad_alphamask

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res6, s6

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0


void Initialise()
{
}



void PixelEpilog()
{
	if (discarded)
		discard;
}

void main()
{
	Initialise();
	r0.x = intBitsToFloat(v1.v.y < idx_uniforms1_ps.cb1[1].x ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.x = intBitsToFloat(idx_uniforms1_ps.cb1[1].y < v1.v.y ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.xy = fma(r0.xy, idx_uniforms2_ps.cb2[0].xy, -idx_uniforms2_ps.cb2[0].zw);
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy)).wxyz).x;
	r1 = (texture(resourceSamplerPair_1_ps, v1.v.xy));
	r1 = r1 * idx_uniforms1_ps.cb1[0];
	o0.w = r0.x * r1.w;
	r0.xyz = log2(r1.xyz);
	r0.xyz = r0.xyz * idx_uniforms2_ps.cb2[1].xxx;
	o0.xyz = exp2(r0.xyz);
	PixelEpilog();
	return;
}

