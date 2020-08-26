#version 460 core
// ps_5_0
// Checksum: 1260506f_8b61ba06_7343586a_2a972493
// Name: fogvolumeapplyindoor

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[17]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v1.v.zw * v1.v.xy;
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy))).x;
	r1 = v1.v.yyyy * idx_uniforms1_ps.cb1[13];
	r1 = fma(v1.v.xxxx, idx_uniforms1_ps.cb1[12], r1);
	r0 = fma(r0.xxxx, idx_uniforms1_ps.cb1[14], r1);
	r0 = r0 + idx_uniforms1_ps.cb1[15];
	r0.xyz = r0.xyz / r0.www;
	r0.xyz = r0.xyz + -idx_uniforms0_ps.cb0[4].xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = sqrt(r0.x);
	r0.x = max(r0.x, float(9.99999975e-05f));
	r0.y = -r0.y / r0.x;
	r0.x = r0.x * float(0.0250000004f);
	r0.x = min(r0.x, idx_uniforms1_ps.cb1[16].z);
	r0.x = r0.x / idx_uniforms1_ps.cb1[16].z;
	r0.y = saturate(-1.f * r0.y);
	r0.y = r0.y * r0.y;
	r0.y = fma(r0.y, idx_uniforms1_ps.cb1[16].w, float(1.00000000f));
	o0.y = r0.x / r0.y;
	o0.xzw = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
	return;
}

