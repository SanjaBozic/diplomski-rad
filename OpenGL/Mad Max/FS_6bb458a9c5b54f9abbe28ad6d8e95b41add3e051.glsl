#version 460 core
// ps_5_0
// Checksum: 9231bc7f_be66bbc7_040a06bf_29791999
// Name: particleeffectdebug

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

