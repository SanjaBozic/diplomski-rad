#version 460 core
// ps_5_0
// Checksum: d219a1fa_40d54068_140eda06_5772ee34
// Name: renderfadingprez

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


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
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r0 = r0 * idx_uniforms1_ps.cb1[0];
	r1.x = fma(idx_uniforms4_ps.cb4[4].x, r0.w, idx_uniforms4_ps.cb4[4].y);
	o0 = r0;
	r0.x = intBitsToFloat(r1.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	PixelEpilog();
	return;
}

