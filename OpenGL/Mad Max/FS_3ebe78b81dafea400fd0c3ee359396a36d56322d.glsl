#version 460 core
// ps_5_0
// Checksum: 8b1ab318_ef5fc20d_86e42069_7c4e6aae
// Name: blackborders

layout(location = 0) out vec4 o0;

// Uniform buffer declarations (dcl_constant_buffer)


void Initialise()
{
}


void main()
{
	Initialise();
	o0 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x3f800000));
	return;
}

