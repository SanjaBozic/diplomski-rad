#version 460 core
// ps_5_0
// Checksum: 65aca4d3_2e519a47_084deb5f_1d69e45a
// Name: comp_rh_ef

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[13]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res6, s6

uniform sampler2D resourceSamplerPair_1_ps; // res4, s4

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res0, s0

uniform sampler2D resourceSamplerPair_4_ps; // res9, s9

uniform sampler3D resourceSamplerPair_5_ps; // res10, s10


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = v1.v.xyxy * idx_uniforms1_ps.cb1[9];
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r0.zw))).xyz;
	r1.xyz = fma(r1.xyz, idx_uniforms1_ps.cb1[12].www, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r2.xyz = ((texture(resourceSamplerPair_1_ps, r0.xy))).xyz;
	r2.xyz = r2.xyz * idx_uniforms1_ps.cb1[3].yyy;
	r1.xyz = r1.xyz * r2.xyz;
	r2.xyz = ((texture(resourceSamplerPair_2_ps, r0.xy))).xyz;
	r0.xyz = ((texture(resourceSamplerPair_3_ps, r0.xy))).xyz;
	r1.xyz = fma(r2.xyz, idx_uniforms1_ps.cb1[3].xxx, r1.xyz);
	r2.xyz = ((texture(resourceSamplerPair_4_ps, v1.v.xy))).xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = fma(r0.xyz, idx_uniforms1_ps.cb1[2].xxx, r1.xyz);
	r0.xyz = max(r0.xyz, vec3(1.00000001e-07f, 1.00000001e-07f, 1.00000001e-07f));
	r0.w = dot(r0.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.w = max(r0.w, float(9.99999975e-05f));
	r1.x = idx_uniforms1_ps.cb1[10].x * idx_uniforms1_ps.cb1[10].x;
	r1.x = r0.w / r1.x;
	r0.w = r0.w + float(1.00000000f);
	r1.x = r1.x + float(1.00000000f);
	r0.w = r1.x / r0.w;
	r0.xyz = r0.xyz * r0.www;
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[1].xyz;
	r0.xyz = sqrt(r0.xyz);
	r0.xyz = min(r0.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.xyz = fma(r0.xyz, vec3(0.968750000f, 0.968750000f, 0.968750000f), vec3(0.0156250000f, 0.0156250000f, 0.0156250000f));
	r0.xyz = ((texture(resourceSamplerPair_5_ps, r0.xyz))).xyz;
	r0.xyz = r0.xyz * r0.xyz;
	r0.w = dot(r0.xyz, vec3(0.298999995f, 0.587000012f, 0.114000000f));
	o0.xyz = r0.xyz;
	o0.w = sqrt(r0.w);
	return;
}

