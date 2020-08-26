#version 460 core
// ps_5_0
// Checksum: 54f85194_e4e17b69_978412e2_e22cf8e5
// Name: bullet

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	o0.xyz = r0.xyz * vec3(10.0000000f, 10.0000000f, 10.0000000f);
	o0.w = r0.w * r0.w;
	return;
}

