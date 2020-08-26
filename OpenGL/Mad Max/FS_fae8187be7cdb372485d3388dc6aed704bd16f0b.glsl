#version 460 core
// ps_5_0
// Checksum: 2aca94ad_83dda20e_13f0a4fd_edf74a92
// Name: cull

layout(location = 0) out vec4 o0;

// Uniform buffer declarations (dcl_constant_buffer)


void Initialise()
{
}


void main()
{
	Initialise();
	o0 = uintBitsToFloat(uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
	return;
}

