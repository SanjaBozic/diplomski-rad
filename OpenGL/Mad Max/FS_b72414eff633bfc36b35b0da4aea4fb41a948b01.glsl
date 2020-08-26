#version 460 core
// ps_5_0
// Checksum: 695ce98b_34126c72_170e610b_fc62bce3
// Name: debugdepthvelocity

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1


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
	r0.x = fma(r0.x, idx_uniforms1_ps.cb1[0].z, idx_uniforms1_ps.cb1[0].w);
	r0.yzw = ((texture(resourceSamplerPair_1_ps, v1.v.xy)).wxyz).yzw;
	r1.x = intBitsToFloat(r0.w >= float(1.00000000f) ? int(0xffffffff) : int(0x00000000));
	r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), floatBitsToUint(r0.yzw), floatBitsToUint(r0.xxx)));
	r2.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(vec2(0.500000000f, 0.500000000f), idx_uniforms1_ps.cb1[0].yx))));
	r0.yzw = uintBitsToFloat(movc(floatBitsToUint(r2.yyy), floatBitsToUint(r1.xyz), floatBitsToUint(r0.yzw)));
	o0.xyz = uintBitsToFloat(movc(floatBitsToUint(r2.xxx), floatBitsToUint(r0.yzw), floatBitsToUint(r0.xxx)));
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

