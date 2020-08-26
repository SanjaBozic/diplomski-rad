#version 460 core
// ps_5_0
// Checksum: bc5edc12_3f3518a7_1a6450c8_be572a5b
// Name: skygradientshader

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = max(v1.v.yw, vec2(0.00999999978f, 0.00999999978f));
	r0.xy = min(r0.xy, vec2(0.990000010f, 0.990000010f));
	r0.zw = v1.v.xz;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r0.wy))).xyz;
	r0.xyz = ((texture(resourceSamplerPair_0_ps, r0.zx))).xyz;
	r1.xyz = -r0.xyz + r1.xyz;
	o0.xyz = fma(idx_uniforms1_ps.cb1[0].xxx, r1.xyz, r0.xyz);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

