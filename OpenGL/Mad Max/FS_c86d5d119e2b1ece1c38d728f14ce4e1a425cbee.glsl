#version 460 core
// ps_5_0
// Checksum: 59d231e5_84130259_b9c8d786_d6b9318e
// Name: generalmmlod0_dndetail_inst

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[4]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3

uniform sampler2D resourceSamplerPair_2_ps; // res4, s4

uniform sampler2D resourceSamplerPair_3_ps; // res1, s1

uniform sampler2D resourceSamplerPair_4_ps; // res2, s2


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
	r0.xyz = fma(v6.v.xyz, vec3(0.305306017f, 0.305306017f, 0.305306017f), vec3(0.682171106f, 0.682171106f, 0.682171106f));
	r0.xyz = fma(v6.v.xyz, r0.xyz, vec3(0.0125228781f, 0.0125228781f, 0.0125228781f));
	r0.xyz = r0.xyz * v6.v.xyz;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[0].xyz;
	r1.xy = v2.v.zw * idx_uniforms2_ps.cb2[0].yz;
	r2 = (texture(resourceSamplerPair_1_ps, r1.xy));
	r1.xyz = ((texture(resourceSamplerPair_2_ps, r1.xy)).xywz).xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.w = fma(idx_uniforms2_ps.cb2[3].x, r2.w, idx_uniforms2_ps.cb2[3].y);
	o0.xyz = r0.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	r2.yw = uintBitsToFloat(uvec2(0xbf800000, 0xbf800000));
	r0.xyz = ((texture(resourceSamplerPair_3_ps, v2.v.xy)).xywz).xyz;
	r3.yzw = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.z = r3.z;
	r1.yzw = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), r2.yzw);
	r1.x = r1.w * r1.y;
	r0.y = uintBitsToFloat(uint(0xbf800000));
	r3.x = r3.w * r3.y;
	r0.z = dot(r3.xz, r3.xz);
	r0.x = r3.x;
	r0.xy = r1.xz + r0.xy;
	r0.z = -r0.z + float(1.00000000f);
	r0.z = max(r0.z, float(0.00000000f));
	r0.z = sqrt(r0.z);
	r1.x = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r1.xyz = r1.xxx * v3.v.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r1.w = dot(v4.v.xyz, v4.v.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = r1.www * v4.v.xyz;
	r3.xyz = r1.zxy * r2.yzx;
	r3.xyz = fma(r1.yzx, r2.zxy, -r3.xyz);
	r3.xyz = r3.xyz * v4.v.www;
	r3.xyz = r0.yyy * r3.xyz;
	r2.xyz = fma(r2.xyz, r0.xxx, r3.xyz);
	r0.xyz = fma(r1.xyz, r0.zzz, r2.xyz);
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r1.x);
	r0.xyz = r0.xyz * r1.xxx;
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r0.xyz = ((texture(resourceSamplerPair_4_ps, v1.v.xy))).xyz;
	o2.y = r0.w * r0.y;
	o2.x = r0.x * idx_uniforms2_ps.cb2[1].y;
	o2.w = saturate(r0.x + idx_uniforms2_ps.cb2[1].w);
	o2.z = r0.z;
	return;
}

