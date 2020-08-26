#version 460 core
// ps_5_0
// Checksum: dede00d2_ac9a5aa6_5c1e7c71_146c8e54
// Name: extractneardof

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).x;
	r0.x = fma(r0.x, idx_uniforms1_ps.cb1[1].z, idx_uniforms1_ps.cb1[1].w);
	r0.x = float(1.00000000f) / r0.x;
	r0.x = saturate(fma(r0.x, idx_uniforms1_ps.cb1[0].z, idx_uniforms1_ps.cb1[0].w));
	r0.x = saturate(r0.x * idx_uniforms1_ps.cb1[0].x);
	r0.x = r0.x * r0.x;
	r0.x = r0.x * float(3.00000000f);
	r0.y = floor(r0.x);
	r0.x = fract(r0.x);
	r0.yzw = r0.yyy + vec3(-0.00000000f, -1.00000000f, -2.00000000f);
	o0.xyz = saturate(r0.xxx + r0.yzw);
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

