#version 460 core
// ps_5_0
// Checksum: 3e77c1c6_2bb379bd_db6884c3_b76bba5e
// Name: luminancetodepth

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
// out float gl_FragDepth
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
	o0 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	r0.xy = fma(v1.v.xy, idx_uniforms1_ps.cb1[1].xy, idx_uniforms1_ps.cb1[1].zw);
	r0.xyz = ((texture(resourceSamplerPair_0_ps, r0.xy))).xyz;
	r0.x = dot(r0.xyz, vec3(0.333333343f, 0.333333343f, 0.333333343f));
	gl_FragDepth = saturate(r0.x * idx_uniforms1_ps.cb1[0].x);
	return;
}

