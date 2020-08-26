#version 460 core
// ps_5_0
// Checksum: 902d5cab_8fce71d3_e563a2d3_1c962a76
// Name: deferred_stencilmask

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res2, s2


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.zy));
	r1 = (texture(resourceSamplerPair_0_ps, v1.v.wy));
	r0 = r0 + -r1;
	r0.x = dot(r0, r0);
	r0.yzw = ((texture(resourceSamplerPair_1_ps, v1.v.zy)).wxyz).yzw;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.wy))).xyz;
	r0.yzw = r0.yzw + -r1.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.x = r0.y + r0.x;
	r0.x = intBitsToFloat(float(0.00980392192f) < r0.x ? int(0xffffffff) : int(0x00000000));
	o0 = uintBitsToFloat(floatBitsToUint(r0.xxxx) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
	return;
}

