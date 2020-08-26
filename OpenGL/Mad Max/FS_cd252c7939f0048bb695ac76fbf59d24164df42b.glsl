#version 460 core
// ps_5_0
// Checksum: 8e24146c_d8c0756e_c4e8e7e3_f7a1465b
// Name: particleeffectflareskymask

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform samplerCube resourceSamplerPair_1_ps; // res6, s6

uniform samplerCube resourceSamplerPair_2_ps; // res5, s5

uniform sampler2D resourceSamplerPair_3_ps; // res0, s0


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = saturate(idx_uniforms1_ps.cb1[0].xy);
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy))).x;
	r0.x = intBitsToFloat(r0.x < idx_uniforms1_ps.cb1[0].z ? int(0xffffffff) : int(0x00000000));
	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & uint(0x3f000000));
	r1 = saturate(fma(idx_uniforms0_ps.cb0[8].zwzw, vec4(-3.00000000f, 3.50000000f, 3.50000000f, 6.00000000f), idx_uniforms1_ps.cb1[0].xyxy));
	r0.y = ((texture(resourceSamplerPair_0_ps, r1.xy)).yxzw).y;
	r0.z = ((texture(resourceSamplerPair_0_ps, r1.zw)).yzxw).z;
	r0.yz = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(r0.yz, idx_uniforms1_ps.cb1[0].zz))));
	r0.yz = uintBitsToFloat(floatBitsToUint(r0.yz) & uvec2(0x3e000000, 0x3e000000));
	r0.x = r0.y + r0.x;
	r0.x = r0.z + r0.x;
	r1 = saturate(fma(idx_uniforms0_ps.cb0[8].zwzw, vec4(-5.00000000f, -3.50000000f, 3.00000000f, -3.00000000f), idx_uniforms1_ps.cb1[0].xyxy));
	r0.y = ((texture(resourceSamplerPair_0_ps, r1.xy)).yxzw).y;
	r0.z = ((texture(resourceSamplerPair_0_ps, r1.zw)).yzxw).z;
	r0.yz = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(r0.yz, idx_uniforms1_ps.cb1[0].zz))));
	r0.yz = uintBitsToFloat(floatBitsToUint(r0.yz) & uvec2(0x3e000000, 0x3e000000));
	r0.x = r0.y + r0.x;
	r0.x = r0.z + r0.x;
	r0.y = ((texture(resourceSamplerPair_1_ps, idx_uniforms1_ps.cb1[1].xyz))).y;
	r0.z = ((texture(resourceSamplerPair_2_ps, idx_uniforms1_ps.cb1[1].xyz)).xzyw).z;
	r0.y = -r0.z + r0.y;
	r0.y = fma(idx_uniforms1_ps.cb1[1].w, r0.y, r0.z);
	r1 = (texture(resourceSamplerPair_3_ps, v1.v.xy));
	r1 = r1 * v2.v;
	r0.z = log2(r1.w);
	r1.xyz = r1.xyz * vec3(4.00000000f, 4.00000000f, 4.00000000f);
	r0.z = r0.z * float(1.17999995f);
	r0.z = exp2(r0.z);
	r1.w = r0.y * r0.z;
	o0 = r0.xxxx * r1;
	return;
}

