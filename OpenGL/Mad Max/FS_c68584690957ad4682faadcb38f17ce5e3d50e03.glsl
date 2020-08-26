#version 460 core
// ps_5_0
// Checksum: 9fb49ad9_f7830e7b_1896f06a_bd9e1853
// Name: 3dtextsdf_alphamask

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[1]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res6, s6


void Initialise()
{
}



void PixelEpilog()
{
	if (discarded)
		discard;
}

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.x = idx_uniforms1_ps.cb1[1].x + float(0.500000000f);
	r0.y = -idx_uniforms1_ps.cb1[1].x + float(0.500000000f);
	r0.x = -r0.y + r0.x;
	r0.x = float(1.00000000f) / r0.x;
	r0.z = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).yzxw).z;
	r0.y = -r0.y + r0.z;
	r0.x = saturate(r0.x * r0.y);
	r0.y = fma(r0.x, float(-2.00000000f), float(3.00000000f));
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r0.x = r0.x * idx_uniforms1_ps.cb1[0].w;
	r0.y = ((texture(resourceSamplerPair_1_ps, v1.v.zw))).y;
	r0.x = r0.y * r0.x;
	r0.yz = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.yz = fma(r0.yz, idx_uniforms2_ps.cb2[0].xy, -idx_uniforms2_ps.cb2[0].zw);
	r0.y = ((texture(resourceSamplerPair_2_ps, r0.yz)).xwyz).y;
	r0.x = r0.y * r0.x;
	r0.y = fma(idx_uniforms4_ps.cb4[4].x, r0.x, idx_uniforms4_ps.cb4[4].y);
	o0.w = r0.x;
	r0.x = intBitsToFloat(r0.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	o0.xyz = idx_uniforms1_ps.cb1[0].xyz;
	PixelEpilog();
	return;
}

