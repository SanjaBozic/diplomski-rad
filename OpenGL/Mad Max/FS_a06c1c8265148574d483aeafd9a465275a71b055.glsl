#version 460 core
// ps_5_0
// Checksum: a04757c2_646b0915_11b8c591_7316f7ec
// Name: tmonly_pg

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

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
	r0.xyz = r0.xyz * -idx_uniforms1_ps.cb1[10].xxx;
	r0.xyz = exp2(r0.xyz);
	r0.xyz = -r0.xyz + vec3(1.00000000f, 1.00000000f, 1.00000000f);
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[1].xyz;
	r0.w = dot(r0.xyz, vec3(0.298999995f, 0.587000012f, 0.114000000f));
	o0.xyz = r0.xyz;
	o0.w = sqrt(r0.w);
	return;
}

