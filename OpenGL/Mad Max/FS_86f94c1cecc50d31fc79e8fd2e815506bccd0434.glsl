#version 460 core
// ps_5_0
// Checksum: c815dc6a_78a23b2d_2827c10b_d259683e
// Name: alphamask

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


uvec4 movc(in uvec4 src0, in uvec4 src1, in uvec4 src2)
{
	return mix(src2, src1, bvec4(src0));
}

uvec3 movc(in uvec3 src0, in uvec3 src1, in uvec3 src2)
{
	return mix(src2, src1, bvec3(src0));
}

uvec2 movc(in uvec2 src0, in uvec2 src1, in uvec2 src2)
{
	return mix(src2, src1, bvec2(src0));
}

uint movc(in uint src0, in uint src1, in uint src2)
{
	return mix(src2, src1, bool(src0));
}

void main()
{
	Initialise();
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).x;
	r0.x = intBitsToFloat(float(0.00000000f) < r0.x ? int(0xffffffff) : int(0x00000000));
	o0 = uintBitsToFloat(movc(floatBitsToUint(r0.xxxx), uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000), uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000)));
	return;
}

