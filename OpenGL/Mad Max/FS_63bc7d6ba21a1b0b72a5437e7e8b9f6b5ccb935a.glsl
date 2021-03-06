#version 460 core
// ps_5_0
// Checksum: d1b2ca79_1599d3ef_5c67ee13_3bf204e5
// Name: ssdecalcutoffangle

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[14]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res5, s5

uniform sampler2D resourceSamplerPair_2_ps; // res1, s1

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2

uniform sampler2D resourceSamplerPair_4_ps; // res3, s3


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


void PixelEpilog()
{
	if (discarded)
		discard;
}

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v1.v.xy / v1.v.ww;
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.xy)).yzxw).z;
	r0.xyw = ((texture(resourceSamplerPair_1_ps, r0.xy)).xywz).xyw;
	r0.xyw = fma(r0.xyw, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.x = saturate(dot(r0.xyw, idx_uniforms1_ps.cb1[12].xyz));
	r0.x = -r0.x + float(1.00000000f);
	r0.x = r0.x + -idx_uniforms1_ps.cb1[8].x;
	r0.x = saturate(fma(-r0.x, idx_uniforms1_ps.cb1[8].y, float(1.00000000f)));
	r0.y = fma(r0.z, idx_uniforms1_ps.cb1[8].z, idx_uniforms1_ps.cb1[8].w);
	r0.y = float(1.00000000f) / r0.y;
	r0.yzw = fma(v2.v.xyz, r0.yyy, -idx_uniforms1_ps.cb1[4].xyz);
	r1.x = dot(idx_uniforms1_ps.cb1[13].xyz, r0.yzw);
	r1.y = dot(-idx_uniforms1_ps.cb1[11].xyz, r0.yzw);
	r1.z = dot(idx_uniforms1_ps.cb1[12].xyz, r0.yzw);
	r0.yzw = fma(r1.xyz, idx_uniforms1_ps.cb1[5].yxz, vec3(0.500000000f, 0.500000000f, 0.500000000f));
	r1.xyz = intBitsToFloat(mix ( ivec3(0x00000000),ivec3(0xffffffff),bvec3(lessThan(r0.yzw, vec3(0.00000000f, 0.00000000f, 0.00000000f)))));
	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) | floatBitsToUint(r1.x));
	r1.x = uintBitsToFloat(floatBitsToUint(r1.z) | floatBitsToUint(r1.x));
	discarded = discarded || floatBitsToUint(r1.x) != uint(0);
	r1.xyz = -r0.yzw + vec3(1.00000000f, 1.00000000f, 1.00000000f);
	r1.xyz = intBitsToFloat(mix ( ivec3(0x00000000),ivec3(0xffffffff),bvec3(lessThan(r1.xyz, vec3(0.00000000f, 0.00000000f, 0.00000000f)))));
	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) | floatBitsToUint(r1.x));
	r1.x = uintBitsToFloat(floatBitsToUint(r1.z) | floatBitsToUint(r1.x));
	discarded = discarded || floatBitsToUint(r1.x) != uint(0);
	r1.x = r0.w * idx_uniforms1_ps.cb1[6].y;
	r0.w = r0.w + -idx_uniforms1_ps.cb1[6].x;
	r0.yz = fma(r0.yz, idx_uniforms1_ps.cb1[7].xy, idx_uniforms1_ps.cb1[7].zw);
	r1.y = intBitsToFloat(float(0.00000000f) < r0.w ? int(0xffffffff) : int(0x00000000));
	r0.w = fma(-r0.w, idx_uniforms1_ps.cb1[6].z, float(1.00000000f));
	r0.w = saturate(uintBitsToFloat(movc(floatBitsToUint(r1.y), floatBitsToUint(r0.w), floatBitsToUint(r1.x))));
	r1 = (texture(resourceSamplerPair_2_ps, r0.yz)).wxyz;
	o0.xyz = r1.yzw * idx_uniforms1_ps.cb1[9].xyz;
	r1.y = saturate(idx_uniforms1_ps.cb1[4].w);
	r1.x = r1.y * r1.x;
	r0.w = r0.w * r1.x;
	r0.w = r0.w * idx_uniforms1_ps.cb1[9].w;
	r0.x = r0.x * r0.w;
	r1.xyz = saturate(r0.xxx * idx_uniforms1_ps.cb1[10].xyz);
	o0.w = r1.x;
	r2.xyz = ((texture(resourceSamplerPair_3_ps, r0.yz))).xyz;
	r0.xy = ((texture(resourceSamplerPair_4_ps, r0.yz)).yzxw).xy;
	o2.yz = r0.xy;
	r0.xyz = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.xyz = r0.yyy * idx_uniforms1_ps.cb1[11].xyz;
	r0.xyw = fma(r0.xxx, idx_uniforms1_ps.cb1[13].xyz, r2.xyz);
	r0.xyz = fma(r0.zzz, idx_uniforms1_ps.cb1[12].xyz, r0.xyw);
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = r1.y;
	o2.w = r1.z;
	o2.x = uintBitsToFloat(uint(0x00000000));
	PixelEpilog();
	return;
}

