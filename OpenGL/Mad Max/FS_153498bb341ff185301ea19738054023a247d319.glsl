#version 460 core
// ps_5_0
// Checksum: 0c033a03_50b790e7_4a33b7bc_3ae29ead
// Name: character

layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;

// Uniform buffer declarations (dcl_constant_buffer)


void Initialise()
{
}


void main()
{
	Initialise();
	o0 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	o1 = uintBitsToFloat(uvec4(0x3f000000, 0x3f000000, 0x3f000000, 0x00000000));
	o2 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	return;
}

