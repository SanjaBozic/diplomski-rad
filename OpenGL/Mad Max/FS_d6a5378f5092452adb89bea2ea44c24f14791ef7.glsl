#version 460 core
// ps_5_0
// Checksum: e87d9501_209791da_b83b1ad3_01cc221b
// Name: distortionparticleadditive

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res2, s2


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

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xyw = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyw;
	r1.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(vec2(0.500000000f, 0.500000000f), r0.xy))));
	r1.zw = saturate(r0.xy + vec2(-0.531372547f, -0.531372547f));
	r2.xy = saturate(-r0.xy + vec2(-0.531372547f, -0.531372547f));
	r1.xy = uintBitsToFloat(movc(floatBitsToUint(r1.xy), floatBitsToUint(r1.zw), floatBitsToUint(-1.f * r2.xy)));
	r1.z = v1.v.z / v2.v.w;
	r1.z = min(r1.z, float(0.0199999996f));
	r2.xy = v2.v.xy / v2.v.ww;
	r1.xy = fma(r1.xy, r1.zz, r2.xy);
	r1.xyz = ((texture(resourceSamplerPair_1_ps, r1.xy))).xyz;
	r0.xyz = r1.xyz * v3.v.xyz;
	r1.x = uintBitsToFloat(uint(0x40800000));
	r1.w = v3.v.w;
	r0 = r0 * r1.xxxw;
	o0.xyz = r0.www * r0.xyz;
	o0.w = r0.w;
	return;
}

