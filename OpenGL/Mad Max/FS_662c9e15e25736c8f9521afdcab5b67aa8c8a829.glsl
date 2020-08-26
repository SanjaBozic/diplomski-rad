#version 460 core
// ps_5_0
// Checksum: c2c818d1_cecaf2f3_e95573a4_2eff5f0e
// Name: terrainscroller

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[11]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xyz = idx_uniforms0_ps.cb0[10].xyz + idx_uniforms1_ps.cb1[0].xyz;
	r0.xyz = r0.xyz * -idx_uniforms0_ps.cb0[3].yyy;
	r1 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r0.xyz = r0.xyz * r1.xyz;
	o0.w = r1.w;
	o0.xyz = r0.xyz * vec3(0.250000000f, 0.250000000f, 0.250000000f);
	return;
}

