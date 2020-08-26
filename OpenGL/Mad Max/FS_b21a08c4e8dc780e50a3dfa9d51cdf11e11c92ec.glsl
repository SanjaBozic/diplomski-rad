#version 460 core
// ps_5_0
// Checksum: 5b8ded24_770fd4ee_7d15bd34_9314d477
// Name: aobox

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[5]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1


void Initialise()
{
}


void main()
{
	Initialise();
	o0 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	o1 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	r0.xy = v1.v.xy / v1.v.zz;
	r1 = r0.yyyy * idx_uniforms1_ps.cb1[2];
	r1 = fma(r0.xxxx, idx_uniforms1_ps.cb1[1], r1);
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy))).x;
	r0 = fma(r0.xxxx, idx_uniforms1_ps.cb1[3], r1);
	r0 = r0 + idx_uniforms1_ps.cb1[4];
	r0.xyz = r0.xyz / r0.www;
	r0.xyz = log2(abs(r0.xyz));
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[0].xxx;
	r0.xyz = exp2(r0.xyz);
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = min(r0.x, float(1.00000000f));
	o2 = fma(idx_uniforms1_ps.cb1[0].yyyy, r0.xxxx, idx_uniforms1_ps.cb1[0].zzzz);
	return;
}

