#version 460 core
// ps_5_0
// Checksum: 6b5b4148_95024272_3aa7a70f_b13d84b5
// Name: constantalphadepth

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 0) out vec4 o0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


void Initialise()
{
}


void main()
{
	Initialise();
	o0.xyz = v0.zzz;
	o0.w = idx_uniforms1_ps.cb1[0].w;
	return;
}

