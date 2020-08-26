#version 460 core
// ps_5_0
// Checksum: 25402bbd_797f9954_fe09d3c4_2a46bf9b
// Name: tmonly_u2

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[10]; } idx_uniforms1_ps;


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
	r1.xyz = fma(r0.xyz, vec3(0.150000006f, 0.150000006f, 0.150000006f), vec3(0.0500000007f, 0.0500000007f, 0.0500000007f));
	r1.xyz = fma(r0.xyz, r1.xyz, vec3(0.00400000019f, 0.00400000019f, 0.00400000019f));
	r2.xyz = fma(r0.xyz, vec3(0.150000006f, 0.150000006f, 0.150000006f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	r0.xyz = fma(r0.xyz, r2.xyz, vec3(0.0599999987f, 0.0599999987f, 0.0599999987f));
	r0.xyz = r1.xyz / r0.xyz;
	r0.xyz = r0.xyz + vec3(-0.0666666701f, -0.0666666701f, -0.0666666701f);
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[1].xyz;
	r0.w = dot(r0.xyz, vec3(0.298999995f, 0.587000012f, 0.114000000f));
	o0.xyz = r0.xyz;
	o0.w = sqrt(r0.w);
	return;
}

