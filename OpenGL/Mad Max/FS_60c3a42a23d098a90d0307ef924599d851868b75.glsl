#version 460 core
// ps_5_0
// Checksum: 656c7ce5_c2545a68_491dfda3_82e47be4
// Name: guimultiply

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

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
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.zw)).wxyz).x;
	r0.y = intBitsToFloat(r0.x < float(0.0156862754f) ? int(0xffffffff) : int(0x00000000));
	r0.x = r0.x * idx_uniforms1_ps.cb1[0].w;
	discarded = discarded || floatBitsToUint(r0.y) != uint(0);
	r0.yzw = ((texture(resourceSamplerPair_1_ps, v1.v.xy)).wxyz).yzw;
	r0.yzw = fma(r0.yzw, idx_uniforms1_ps.cb1[0].xyz, vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.xyz = fma(r0.xxx, r0.yzw, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.xyz = log2(r0.xyz);
	r0.xyz = r0.xyz * idx_uniforms2_ps.cb2[1].xxx;
	o0.xyz = exp2(r0.xyz);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	PixelEpilog();
	return;
}

