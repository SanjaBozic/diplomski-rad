#version 460 core
// ps_5_0
// Checksum: 81effb35_737dd4fc_e25aa5c4_984e1d6d
// Name: lightglow

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.x = ((texture(resourceSamplerPair_0_ps, idx_uniforms1_ps.cb1[1].xy))).x;
	r0.x = intBitsToFloat(r0.x < idx_uniforms1_ps.cb1[1].z ? int(0xffffffff) : int(0x00000000));
	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & uint(0x3f000000));
	r1 = idx_uniforms1_ps.cb1[1].xyxy + vec4(-0.00234375009f, 0.00486111129f, 0.00273437495f, 0.00833333377f);
	r0.y = ((texture(resourceSamplerPair_0_ps, r1.xy)).yxzw).y;
	r0.z = ((texture(resourceSamplerPair_0_ps, r1.zw)).yzxw).z;
	r0.yz = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(r0.yz, idx_uniforms1_ps.cb1[1].zz))));
	r0.yz = uintBitsToFloat(floatBitsToUint(r0.yz) & uvec2(0x3e000000, 0x3e000000));
	r0.x = r0.y + r0.x;
	r0.x = r0.z + r0.x;
	r1 = idx_uniforms1_ps.cb1[1].xyxy + vec4(-0.00390625000f, -0.00486111129f, 0.00234375009f, -0.00416666688f);
	r0.y = ((texture(resourceSamplerPair_0_ps, r1.xy)).yxzw).y;
	r0.z = ((texture(resourceSamplerPair_0_ps, r1.zw)).yzxw).z;
	r0.yz = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(r0.yz, idx_uniforms1_ps.cb1[1].zz))));
	r0.yz = uintBitsToFloat(floatBitsToUint(r0.yz) & uvec2(0x3e000000, 0x3e000000));
	r0.x = r0.y + r0.x;
	r0.x = r0.z + r0.x;
	r0.x = r0.x * v2.v.x;
	r0.yzw = ((texture(resourceSamplerPair_1_ps, v1.v.xy)).wxyz).yzw;
	r0.yzw = r0.yzw * idx_uniforms1_ps.cb1[0].www;
	o0.xyz = saturate(r0.xxx * r0.yzw);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

