#version 460 core
// ps_5_0
// Checksum: f7e54398_eb62f132_5ac4e99b_dec2ee1e
// Name: constantcolor

layout(location = 0) out vec4 o0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


void Initialise()
{
}


void main()
{
	Initialise();
	o0 = idx_uniforms1_ps.cb1[0];
	return;
}

