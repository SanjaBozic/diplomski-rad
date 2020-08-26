#version 460 core
// ps_5_0
// Checksum: 6fbb2fb7_04a31fff_8387bf21_b38e91f8
// Name: calculateadaptedlum

layout(location = 0) out vec4 o0;
vec4 r0;

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
	r0.x = float(-1.74878073f) * idx_uniforms1_ps.cb1[0].x;
	r0.x = exp2(r0.x);
	r0.x = -r0.x + float(1.00000000f);
	r0.y = ((texture(resourceSamplerPair_0_ps, vec2(0.500000000f, 0.500000000f))).yxzw).y;
	r0.z = ((texture(resourceSamplerPair_1_ps, vec2(0.500000000f, 0.500000000f))).yzxw).z;
	r0.w = -r0.y + r0.z;
	r0.x = fma(r0.w, r0.x, r0.y);
	r0.y = uintBitsToFloat(floatBitsToUint(r0.x) & uint(0x7f800000));
	r0.y = intBitsToFloat(int(2139095040) != floatBitsToInt(r0.y) ? int(0xffffffff) : int(0x00000000));
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r0.y), floatBitsToUint(r0.x), floatBitsToUint(r0.z)));
	r0.y = uintBitsToFloat(floatBitsToUint(r0.x) & uint(0x7f800000));
	r0.y = intBitsToFloat(int(2139095040) != floatBitsToInt(r0.y) ? int(0xffffffff) : int(0x00000000));
	o0.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.yyy), floatBitsToUint(r0.xxx), uvec3(0x3f000000, 0x3f000000, 0x3f000000)));
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

