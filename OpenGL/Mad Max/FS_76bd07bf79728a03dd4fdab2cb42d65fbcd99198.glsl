#version 460 core
// ps_5_0
// Checksum: 57cfa43e_feab3875_9407fc32_d371f489
// Name: guiterrain

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[8]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res5, s5


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r0.xyz = r0.xyz * r0.xyz;
	r0.w = saturate(idx_uniforms1_ps.cb1[7].y);
	r0.w = fma(r0.w, float(0.500000000f), float(1.00000000f));
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = min(r0.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.xyz = sqrt(r0.xyz);
	r1.xy = fma(v2.v.xy, idx_uniforms1_ps.cb1[6].zw, -idx_uniforms1_ps.cb1[6].xy);
	r1.z = -r1.y + float(1.00000000f);
	r1.xyz = ((texture(resourceSamplerPair_1_ps, r1.xz))).xyz;
	r0.w = saturate(dot(r1.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r0.w = -r0.w + float(1.00000000f);
	r0.xyz = fma(r0.www, r0.xyz, r1.xyz);
	r0.xyz = log2(r0.xyz);
	r0.xyz = r0.xyz * idx_uniforms2_ps.cb2[1].xxx;
	o0.xyz = exp2(r0.xyz);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

