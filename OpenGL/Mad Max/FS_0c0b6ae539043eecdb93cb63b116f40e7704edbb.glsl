#version 460 core
// ps_5_0
// Checksum: 1a977ed5_3b126307_190a56f7_6ea2c4f9
// Name: ssao_minify

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


ivec4 bfi(in ivec4 src0, in ivec4 src1, in ivec4 src2, in ivec4 src3)
{
	ivec4 result;
	result.x = bitfieldInsert(src0.x,src1.x,src2.x,src3.x);
	result.y = bitfieldInsert(src0.y,src1.y,src2.y,src3.y);
	result.z = bitfieldInsert(src0.z,src1.z,src2.z,src3.z);
	result.w = bitfieldInsert(src0.w,src1.w,src2.w,src3.w);
	return result;
}

ivec3 bfi(in ivec3 src0, in ivec3 src1, in ivec3 src2, in ivec3 src3)
{
	ivec3 result;
	result.x = bitfieldInsert(src0.x,src1.x,src2.x,src3.x);
	result.y = bitfieldInsert(src0.y,src1.y,src2.y,src3.y);
	result.z = bitfieldInsert(src0.z,src1.z,src2.z,src3.z);
	return result;
}

ivec2 bfi(in ivec2 src0, in ivec2 src1, in ivec2 src2, in ivec2 src3)
{
	ivec2 result;
	result.x = bitfieldInsert(src0.x,src1.x,src2.x,src3.x);
	result.y = bitfieldInsert(src0.y,src1.y,src2.y,src3.y);
	return result;
}

int bfi(in int src0, in int src1, in int src2, in int src3)
{
	int result;
	result = bitfieldInsert(src0,src1,src2,src3);
	return result;
}


void main()
{
	Initialise();
	r0.xy = intBitsToFloat(ivec2(v0.xy));
	r0.xy = intBitsToFloat(bfi(floatBitsToInt(r0.yx), floatBitsToInt(r0.xy), ivec2(1, 1), ivec2(31, 31)));
	r0.xy = vec2(floatBitsToInt(r0.xy));
	r0.xy = r0.xy * idx_uniforms1_ps.cb1[0].yz;
	r0.x = ((textureLod(resourceSamplerPair_0_ps, r0.xy, idx_uniforms1_ps.cb1[0].x))).x;
	o0 = r0.xxxx;
	return;
}

