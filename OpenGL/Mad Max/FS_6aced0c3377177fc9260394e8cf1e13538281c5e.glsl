#version 460 core
// ps_5_0
// Checksum: 11bc6fd2_d5a57d28_4af4c10c_164c63d8
// Name: grass

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}



void PixelEpilog()
{
	if (discarded)
		discard;
}

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r1.x = fma(r0.w, v2.v.w, -idx_uniforms1_ps.cb1[0].x);
	r1.x = intBitsToFloat(r1.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r1.x) != uint(0);
	o0.xyz = saturate(r0.xyz * v3.v.xyz);
	r0.x = r0.w * v2.v.w;
	o0.w = r0.x;
	o1.w = r0.x;
	o2.w = r0.x;
	o1.xyz = fma(v2.v.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o2.xyz = uintBitsToFloat(uvec3(0x3da3d70a, 0x00000000, 0x00000000));
	PixelEpilog();
	return;
}

