#version 460 core
// ps_5_0
// Checksum: 82c7ec1d_f08d7b5b_1ccf6d80_0f8527c6
// Name: line

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;

// Uniform buffer declarations (dcl_constant_buffer)


void Initialise()
{
}


void main()
{
	Initialise();
	o0 = v1.v;
	return;
}

