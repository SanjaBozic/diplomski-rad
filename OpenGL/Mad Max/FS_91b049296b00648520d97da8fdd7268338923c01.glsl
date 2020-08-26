#version 460 core
// ps_5_0
// Checksum: 51c791f2_19c5d8c6_4f0d96b6_170aa1c1
// Name: cloudshadow

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[6]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0 = v1.v.yyyy * idx_uniforms1_ps.cb1[2];
	r0 = fma(v1.v.xxxx, idx_uniforms1_ps.cb1[1], r0);
	r1.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).x;
	r0 = fma(r1.xxxx, idx_uniforms1_ps.cb1[3], r0);
	r0 = r0 + idx_uniforms1_ps.cb1[4];
	r0.xyz = r0.xyz / r0.www;
	r1.xy = r0.xz + idx_uniforms1_ps.cb1[0].yz;
	r1.xy = -r0.yy + r1.xy;
	r0.xyz = -r0.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = sqrt(r0.x);
	r0.x = -r0.x + idx_uniforms1_ps.cb1[5].x;
	r0.x = saturate(r0.x * idx_uniforms1_ps.cb1[5].y);
	r0.x = r0.x * idx_uniforms1_ps.cb1[0].x;
	r0.yz = r1.xy * idx_uniforms1_ps.cb1[0].ww;
	r0.y = ((texture(resourceSamplerPair_1_ps, r0.yz))).y;
	r0.x = fma(-r0.x, r0.y, float(1.00000000f));
	o0.xyz = saturate(r0.xxx);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

