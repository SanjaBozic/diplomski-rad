#version 460 core
// ps_5_0
// Checksum: 0b1f7f86_53a6b43f_235084b7_afca51b4
// Name: generalmmlod0_sdndetail_osn

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[5]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[4]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res6, s6

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2

uniform sampler2D resourceSamplerPair_4_ps; // res7, s7

uniform sampler2D resourceSamplerPair_5_ps; // res4, s4

uniform sampler2D resourceSamplerPair_6_ps; // res1, s1


void Initialise()
{
}


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
	r2.w = fma(idx_uniforms2_ps.cb2[3].z, r2.w, idx_uniforms2_ps.cb2[3].w);
	r3 = (texture(resourceSamplerPair_2_ps, r1.xy));
	r3.w = fma(idx_uniforms2_ps.cb2[3].x, r3.w, idx_uniforms2_ps.cb2[3].y);
	r2 = r2 + -r3;
	r4.xyz = ((texture(resourceSamplerPair_3_ps, v1.v.xy))).xyz;
	r2 = fma(r4.xxxx, r2, r3);
	r0.xyz = r0.xyz * r2.xyz;
	o2.y = r2.w * r4.y;
	o0.xyz = r0.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	r0.xyz = ((texture(resourceSamplerPair_4_ps, r1.xy)).xywz).xyz;
	r1.xyz = ((texture(resourceSamplerPair_5_ps, r1.xy)).xywz).xyz;
	r0.xyz = r0.xyz + -r1.xyz;
	r0.xyz = fma(r4.xxx, r0.xyz, r1.xyz);
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.x = r0.z * r0.x;
	r0.z = dot(v4.v.xyz, v4.v.xyz);
	r0.z = inversesqrt(r0.z);
	r1.xyz = r0.zzz * v4.v.xyz;
	r2.xyz = ((texture(resourceSamplerPair_6_ps, v2.v.xy))).xyz;
	r2.xyz = fma(r2.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r3.xyz = r1.yzx * r2.xyz;
	r3.xyz = fma(r2.zxy, r1.zxy, -r3.xyz);
	r3.xyz = r3.xyz * v4.v.www;
	r0.yzw = r0.yyy * r3.xyz;
	r0.xyz = fma(r1.xyz, r0.xxx, r0.yzw);
	r1.xyz = r2.zzz * idx_uniforms1_ps.cb1[3].xyz;
	r1.xyz = fma(idx_uniforms1_ps.cb1[2].xyz, r2.yyy, r1.xyz);
	r1.xyz = fma(idx_uniforms1_ps.cb1[4].xyz, r2.xxx, r1.xyz);
	r0.xyz = r0.xyz + r1.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.x = r4.x * idx_uniforms2_ps.cb2[1].y;
	o2.z = r4.z;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

