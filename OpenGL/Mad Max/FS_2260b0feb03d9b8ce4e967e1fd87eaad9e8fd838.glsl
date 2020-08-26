#version 460 core
// ps_5_0
// Checksum: 57e31e84_538ad81e_0bc31271_a8736a81
// Name: comp_pg_ef_fg

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

uniform sampler2D resourceSamplerPair_6_ps; // res8, s8


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
	r0.xyz = r0.xyz * -idx_uniforms1_ps.cb1[10].xxx;
	r0.xyz = exp2(r0.xyz);
	r0.xyz = -r0.xyz + vec3(1.00000000f, 1.00000000f, 1.00000000f);
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[1].xyz;
	r0.xyz = sqrt(r0.xyz);
	r0.xyz = min(r0.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.xyz = fma(r0.xyz, vec3(0.968750000f, 0.968750000f, 0.968750000f), vec3(0.0156250000f, 0.0156250000f, 0.0156250000f));
	r0.xyz = ((texture(resourceSamplerPair_5_ps, r0.xyz))).xyz;
	r1.xy = fma(v1.v.xy, vec2(16.0000000f, 8.00000000f), idx_uniforms1_ps.cb1[3].zw);
	r0.w = ((texture(resourceSamplerPair_6_ps, r1.xy)).yzwx).w;
	r0.w = r0.w + float(-0.500000000f);
	r0.xyz = fma(r0.www, vec3(0.0179999992f, 0.0179999992f, 0.0179999992f), r0.xyz);
	r0.xyz = r0.xyz * r0.xyz;
	r0.w = dot(r0.xyz, vec3(0.298999995f, 0.587000012f, 0.114000000f));
	o0.xyz = r0.xyz;
	o0.w = sqrt(r0.w);
	return;
}

