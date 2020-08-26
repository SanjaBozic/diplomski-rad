#version 460 core
// ps_5_0
// Checksum: ce8f7e6f_acbc0e80_1434552d_d0b5a155
// Name: comp_u2_ca

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[13]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res4, s4

uniform sampler2D resourceSamplerPair_1_ps; // res6, s6

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res0, s0

uniform sampler3D resourceSamplerPair_4_ps; // res10, s10


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = idx_uniforms1_ps.cb1[0].xxxx * vec4(2.00000000f, -2.00000000f, 6.00000000f, -6.00000000f);
	r1 = fma(v1.v.xyxy, idx_uniforms1_ps.cb1[9].xyxy, r0.zwwz);
	r0 = fma(v1.v.xyxy, idx_uniforms1_ps.cb1[9].xyxy, r0.xyyx);
	r2.x = ((texture(resourceSamplerPair_0_ps, r1.xy))).x;
	r2.z = ((texture(resourceSamplerPair_0_ps, r1.zw))).z;
	r1 = v1.v.xyxy * idx_uniforms1_ps.cb1[9];
	r2.y = ((texture(resourceSamplerPair_0_ps, r1.xy))).y;
	r2.xyz = r2.xyz * idx_uniforms1_ps.cb1[3].yyy;
	r3.xyz = ((texture(resourceSamplerPair_1_ps, r1.zw))).xyz;
	r3.xyz = fma(r3.xyz, idx_uniforms1_ps.cb1[12].www, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r2.xyz = r2.xyz * r3.xyz;
	r3.x = ((texture(resourceSamplerPair_2_ps, r0.xy))).x;
	r3.z = ((texture(resourceSamplerPair_2_ps, r0.zw))).z;
	r3.y = ((texture(resourceSamplerPair_2_ps, r1.xy))).y;
	r0.xyz = ((texture(resourceSamplerPair_3_ps, r1.xy))).xyz;
	r1.xyz = fma(r3.xyz, idx_uniforms1_ps.cb1[3].xxx, r2.xyz);
	r0.xyz = fma(r0.xyz, idx_uniforms1_ps.cb1[2].xxx, r1.xyz);
	r0.xyz = max(r0.xyz, vec3(1.00000001e-07f, 1.00000001e-07f, 1.00000001e-07f));
	r1.xyz = fma(r0.xyz, vec3(0.150000006f, 0.150000006f, 0.150000006f), vec3(0.0500000007f, 0.0500000007f, 0.0500000007f));
	r1.xyz = fma(r0.xyz, r1.xyz, vec3(0.00400000019f, 0.00400000019f, 0.00400000019f));
	r2.xyz = fma(r0.xyz, vec3(0.150000006f, 0.150000006f, 0.150000006f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	r0.xyz = fma(r0.xyz, r2.xyz, vec3(0.0599999987f, 0.0599999987f, 0.0599999987f));
	r0.xyz = r1.xyz / r0.xyz;
	r0.xyz = r0.xyz + vec3(-0.0666666701f, -0.0666666701f, -0.0666666701f);
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[1].xyz;
	r0.xyz = sqrt(r0.xyz);
	r0.xyz = min(r0.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.xyz = fma(r0.xyz, vec3(0.968750000f, 0.968750000f, 0.968750000f), vec3(0.0156250000f, 0.0156250000f, 0.0156250000f));
	r0.xyz = ((texture(resourceSamplerPair_4_ps, r0.xyz))).xyz;
	r0.xyz = r0.xyz * r0.xyz;
	r0.w = dot(r0.xyz, vec3(0.298999995f, 0.587000012f, 0.114000000f));
	o0.xyz = r0.xyz;
	o0.w = sqrt(r0.w);
	return;
}
