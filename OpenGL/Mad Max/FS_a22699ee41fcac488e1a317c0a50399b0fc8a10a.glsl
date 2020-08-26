#version 460 core
// ps_5_0
// Checksum: 4c80b7f7_aff9ba38_44842bf7_8063d3b8
// Name: splineroadsimple

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

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
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.zw)).wxyz).x;
	r0.y = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).xwyz).y;
	r0.x = -r0.y + r0.x;
	r0.x = fma(v2.v.y, r0.x, r0.y);
	r0.x = r0.x * v2.v.x;
	r0.y = fma(idx_uniforms4_ps.cb4[4].x, r0.x, idx_uniforms4_ps.cb4[4].y);
	o0.w = r0.x;
	r0.x = intBitsToFloat(r0.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	o0.xyz = uintBitsToFloat(uvec3(0x3f4ccccd, 0x3f4ccccd, 0x3f4ccccd));
	PixelEpilog();
	return;
}

