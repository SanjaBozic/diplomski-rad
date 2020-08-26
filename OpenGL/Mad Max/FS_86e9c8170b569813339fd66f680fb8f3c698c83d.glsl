#version 460 core
// ps_5_0
// Checksum: 49534031_8faf5dcc_2e504851_3a53f2ed
// Name: lrparticleblur

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res2, s2


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
	r0.xy = -1.f * idx_uniforms1_ps.cb1[0].yx;
	r0.z = uintBitsToFloat(uint(0x00000000));
	r1.xy = v1.v.xy / v1.v.ww;
	r0 = r0.yzxx + r1.xyxy;
	r2 = (texture(resourceSamplerPair_0_ps, r0.xy));
	r0 = (texture(resourceSamplerPair_0_ps, r0.zw));
	r1.z = dot(r2.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r3 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r1.w = dot(r3.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r1.z = intBitsToFloat(r1.z >= r1.w ? int(0xffffffff) : int(0x00000000));
	r2 = r2 + r3;
	r2 = r2 * vec4(0.500000000f, 0.500000000f, 0.500000000f, 0.500000000f);
	r2 = uintBitsToFloat(movc(floatBitsToUint(r1.zzzz), floatBitsToUint(r2), floatBitsToUint(r3)));
	r1.z = dot(r2.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r3.x = idx_uniforms1_ps.cb1[0].x;
	r3.yz = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r3.xy = r1.xy + r3.xy;
	r4 = (texture(resourceSamplerPair_0_ps, r3.xy));
	r1.w = dot(r4.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r4 = r2 + r4;
	r4 = r4 * vec4(0.500000000f, 0.500000000f, 0.500000000f, 0.500000000f);
	r1.z = intBitsToFloat(r1.w >= r1.z ? int(0xffffffff) : int(0x00000000));
	r2 = uintBitsToFloat(movc(floatBitsToUint(r1.zzzz), floatBitsToUint(r4), floatBitsToUint(r2)));
	r1.z = dot(r2.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r3.w = -1.f * idx_uniforms1_ps.cb1[0].y;
	r3.xy = r1.xy + r3.zw;
	r3 = (texture(resourceSamplerPair_0_ps, r3.xy));
	r1.w = dot(r3.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r3 = r2 + r3;
	r3 = r3 * vec4(0.500000000f, 0.500000000f, 0.500000000f, 0.500000000f);
	r1.z = intBitsToFloat(r1.w >= r1.z ? int(0xffffffff) : int(0x00000000));
	r2 = uintBitsToFloat(movc(floatBitsToUint(r1.zzzz), floatBitsToUint(r3), floatBitsToUint(r2)));
	r1.z = dot(r2.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r3.x = uintBitsToFloat(uint(0x00000000));
	r3.y = idx_uniforms1_ps.cb1[0].y;
	r3.xy = r1.xy + r3.xy;
	r3 = (texture(resourceSamplerPair_0_ps, r3.xy));
	r1.w = dot(r3.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r3 = r2 + r3;
	r3 = r3 * vec4(0.500000000f, 0.500000000f, 0.500000000f, 0.500000000f);
	r1.z = intBitsToFloat(r1.w >= r1.z ? int(0xffffffff) : int(0x00000000));
	r2 = uintBitsToFloat(movc(floatBitsToUint(r1.zzzz), floatBitsToUint(r3), floatBitsToUint(r2)));
	r1.z = dot(r2.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r3.xy = r1.xy + idx_uniforms1_ps.cb1[0].xy;
	r4 = fma(idx_uniforms1_ps.cb1[0].xyxy, vec4(-1.00000000f, 1.00000000f, 1.00000000f, -1.00000000f), r1.xyxy);
	r3 = (texture(resourceSamplerPair_0_ps, r3.xy));
	r1.x = dot(r3.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r3 = r2 + r3;
	r3 = r3 * vec4(0.500000000f, 0.500000000f, 0.500000000f, 0.500000000f);
	r1.x = intBitsToFloat(r1.x >= r1.z ? int(0xffffffff) : int(0x00000000));
	r1 = uintBitsToFloat(movc(floatBitsToUint(r1.xxxx), floatBitsToUint(r3), floatBitsToUint(r2)));
	r2.x = dot(r1.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r3 = (texture(resourceSamplerPair_0_ps, r4.xy));
	r4 = (texture(resourceSamplerPair_0_ps, r4.zw));
	r2.y = dot(r3.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r3 = r1 + r3;
	r3 = r3 * vec4(0.500000000f, 0.500000000f, 0.500000000f, 0.500000000f);
	r2.x = intBitsToFloat(r2.y >= r2.x ? int(0xffffffff) : int(0x00000000));
	r1 = uintBitsToFloat(movc(floatBitsToUint(r2.xxxx), floatBitsToUint(r3), floatBitsToUint(r1)));
	r2.x = dot(r1.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r2.y = dot(r0.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0 = r0 + r1;
	r0 = r0 * vec4(0.500000000f, 0.500000000f, 0.500000000f, 0.500000000f);
	r2.x = intBitsToFloat(r2.y >= r2.x ? int(0xffffffff) : int(0x00000000));
	r0 = uintBitsToFloat(movc(floatBitsToUint(r2.xxxx), floatBitsToUint(r0), floatBitsToUint(r1)));
	r1.x = dot(r0.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r1.y = dot(r4.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r2 = r4 + r0;
	r2 = r2 * vec4(0.500000000f, 0.500000000f, 0.500000000f, 0.500000000f);
	r1.x = intBitsToFloat(r1.y >= r1.x ? int(0xffffffff) : int(0x00000000));
	o0 = uintBitsToFloat(movc(floatBitsToUint(r1.xxxx), floatBitsToUint(r2), floatBitsToUint(r0)));
	return;
}

