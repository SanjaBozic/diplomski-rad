#version 460 core
// ps_5_0
// Checksum: b5af36a2_52ad0fee_898d3be4_e520807d
// Name: generalmmlod0_sdndetail_osn_sand

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[7]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[4]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3

uniform sampler2D resourceSamplerPair_4_ps; // res6, s6

uniform sampler2D resourceSamplerPair_5_ps; // res4, s4

uniform sampler2D resourceSamplerPair_6_ps; // res7, s7

uniform sampler2D resourceSamplerPair_7_ps; // res8, s8

uniform sampler2D resourceSamplerPair_8_ps; // res9, s9

uniform sampler2D resourceSamplerPair_9_ps; // res10, s10


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
	r0.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r1.xyz = fma(v6.v.xyz, vec3(0.305306017f, 0.305306017f, 0.305306017f), vec3(0.682171106f, 0.682171106f, 0.682171106f));
	r1.xyz = fma(v6.v.xyz, r1.xyz, vec3(0.0125228781f, 0.0125228781f, 0.0125228781f));
	r1.xyz = r1.xyz * v6.v.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[0].xyz;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v2.v.xy))).xyz;
	r1.xyz = fma(r1.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
	r3.xy = v2.v.zw * idx_uniforms2_ps.cb2[0].yz;
	r4 = (texture(resourceSamplerPair_3_ps, r3.xy));
	r4.w = fma(idx_uniforms2_ps.cb2[3].x, r4.w, idx_uniforms2_ps.cb2[3].y);
	r5 = (texture(resourceSamplerPair_4_ps, r3.xy));
	r5.w = fma(idx_uniforms2_ps.cb2[3].z, r5.w, idx_uniforms2_ps.cb2[3].w);
	r5 = -r4 + r5;
	r4 = fma(r2.xxxx, r5, r4);
	r0.xyz = r0.xyz * r4.xyz;
	r0.xyz = r0.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	r2.y = r2.y * r4.w;
	r4.xyz = ((texture(resourceSamplerPair_5_ps, r3.xy)).xywz).xyz;
	r3.xyz = ((texture(resourceSamplerPair_6_ps, r3.xy)).xywz).xyz;
	r3.xyz = -r4.xyz + r3.xyz;
	r3.xyz = fma(r2.xxx, r3.xyz, r4.xyz);
	r3.xyz = fma(r3.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = r3.z * r3.x;
	r1.w = dot(v4.v.xyz, v4.v.xyz);
	r1.w = inversesqrt(r1.w);
	r3.xzw = r1.www * v4.v.xyz;
	r4.xyz = r1.xyz * r3.zwx;
	r4.xyz = fma(r1.zxy, r3.wxz, -r4.xyz);
	r4.xyz = r4.xyz * v4.v.www;
	r5.xyz = r1.zzz * idx_uniforms1_ps.cb1[3].xyz;
	r1.yzw = fma(idx_uniforms1_ps.cb1[2].xyz, r1.yyy, r5.xyz);
	r1.xyz = fma(idx_uniforms1_ps.cb1[4].xyz, r1.xxx, r1.yzw);
	r5.xyz = r3.yyy * r4.xyz;
	r5.xyz = fma(r3.xzw, r0.www, r5.xyz);
	r1.xyz = r1.xyz + r5.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xzw = r0.www * r1.xyz;
	r3.y = saturate(r1.w * idx_uniforms1_ps.cb1[5].z);
	r0.w = fma(r1.y, r0.w, r3.y);
	r1.y = intBitsToFloat(r0.w >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r5.xy = idx_uniforms1_ps.cb1[5].ww * vec2(0.00200000009f, 0.0399999991f);
	r5.xy = fma(v7.v.zw, vec2(1.10000002f, 0.300000012f), r5.xy);
	r3.y = ((texture(resourceSamplerPair_7_ps, r5.xy)).xwyz).y;
	if (floatBitsToUint(r1.y) != uint(0))
	{
		r1.y = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
		r5.xyz = r1.yyy * v3.v.xyz;
		r1.y = dot(r5.xyz, r5.xyz);
		r1.y = inversesqrt(r1.y);
		r5.xyz = r1.yyy * r5.xyz;
		r6.xyz = ((texture(resourceSamplerPair_8_ps, v7.v.xy))).xyz;
		r6.xyz = fma(r6.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r4.xyz = r4.xyz * r6.yyy;
		r3.xzw = fma(r3.xzw, r6.xxx, r4.xyz);
		r3.xzw = fma(r5.xyz, r6.zzz, r3.xzw);
		r1.y = dot(r3.xzw, r3.xzw);
		r1.y = inversesqrt(r1.y);
		r4 = (texture(resourceSamplerPair_9_ps, v1.v.zw));
		r4.w = min(r4.w, idx_uniforms1_ps.cb1[5].x);
		r4.w = saturate(r4.w * idx_uniforms1_ps.cb1[5].y);
		r5 = (texture(resourceSamplerPair_7_ps, v7.v.xy));
		r6.x = uintBitsToFloat(uint(0x3f800000));
		r4.xyz = r4.xyz * r5.xyz;
		r5.x = ((texture(resourceSamplerPair_7_ps, v7.v.zw)).wxyz).x;
		r5.y = fma(r5.w, r6.x, float(0.750000000f));
		r5.z = r5.y * r5.x;
		r5.w = r4.w * float(0.699999988f);
		r5.x = fma(-r5.x, r5.y, float(0.100000001f));
		r5.x = fma(r5.w, r5.x, r5.z);
		r3.y = -r3.y + float(1.00000000f);
		r3.y = saturate(fma(-r3.y, idx_uniforms1_ps.cb1[6].x, r5.x));
		r3.y = r3.y * r4.w;
		r4.w = r3.y * float(3.00000000f);
		r3.y = fma(r3.y, float(-0.300000012f), float(0.800000012f));
		r4.w = min(r4.w, float(1.00000000f));
		r5.x = -r3.y + float(1.00000000f);
		r4.w = r4.w / r5.x;
		r0.w = r0.w + -r3.y;
		r0.w = saturate(r4.w * r0.w);
		r4.xyz = fma(r4.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r0.xyz);
		r0.xyz = fma(r0.www, r4.xyz, r0.xyz);
		r2.xw = r2.xz;
		r4.x = r2.x;
		r4.yz = uintBitsToFloat(uvec2(0x3c23d70a, 0x3f000000));
		r4.xyz = -r2.xyw + r4.xyz;
		r2.xyz = fma(r0.www, r4.xyz, r2.xyw);
		r3.xyz = fma(r3.xzw, r1.yyy, -r1.xzw);
		r3.xyz = fma(r0.www, r3.xyz, r1.xzw);
		r0.w = dot(r3.xyz, r3.xyz);
		r0.w = inversesqrt(r0.w);
		r1.xzw = r0.www * r3.xyz;
	}
	r2.x = r2.x * idx_uniforms2_ps.cb2[1].y;
	o1.xyz = fma(r1.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r0.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r2.w = uintBitsToFloat(uint(0x3f800000));
	o2 = r2;
	return;
}

