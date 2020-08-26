#version 460 core
// ps_5_0
// Checksum: bf367424_ed92d547_7a58e7b0_862460d7
// Name: depthshader

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 0) out vec4 o0;

// Uniform buffer declarations (dcl_constant_buffer)


void Initialise()
{
}


void main()
{
	Initialise();
	o0.x = v0.z;
	return;
}

