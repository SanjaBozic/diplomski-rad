#version 460 core
// ps_5_0
// Checksum: 2406affd_00cbd5d1_6f36d095_b84b3fb5
// Name: gui_alphamask

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res6, s6

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res0, s0


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
	r0.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.xy = fma(r0.xy, idx_uniforms2_ps.cb2[0].xy, -idx_uniforms2_ps.cb2[0].zw);
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy)).wxyz).x;
	r0.y = ((texture(resourceSamplerPair_1_ps, v1.v.zw)).xwyz).y;
	r0.w = r0.x * r0.y;
	r1.x = intBitsToFloat(r0.w < float(0.0156862754f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r1.x) != uint(0);
	r0.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
	r0 = r0 * idx_uniforms1_ps.cb1[0];
	r0.xyz = log2(r0.xyz);
	o0.w = r0.w;
	r0.xyz = r0.xyz * idx_uniforms2_ps.cb2[1].xxx;
	o0.xyz = exp2(r0.xyz);
	PixelEpilog();
	return;
}

