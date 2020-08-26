#version 460 core
// ps_5_0
// Checksum: 36f73c0d_d3cccd90_71daefa4_2fe7738d
// Name: tmonly_rh

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[11]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = v1.v.xy * idx_uniforms1_ps.cb1[9].xy;
	r0.xyz = ((texture(resourceSamplerPair_0_ps, r0.xy))).xyz;
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[2].xxx;
	r0.w = dot(r0.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.w = max(r0.w, float(9.99999975e-05f));
	r1.x = idx_uniforms1_ps.cb1[10].x * idx_uniforms1_ps.cb1[10].x;
	r1.x = r0.w / r1.x;
	r0.w = r0.w + float(1.00000000f);
	r1.x = r1.x + float(1.00000000f);
	r0.w = r1.x / r0.w;
	r0.xyz = r0.xyz * r0.www;
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[1].xyz;
	r0.w = dot(r0.xyz, vec3(0.298999995f, 0.587000012f, 0.114000000f));
	o0.xyz = r0.xyz;
	o0.w = sqrt(r0.w);
	return;
}

