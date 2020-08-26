#version 460 core
// ps_5_0
// Checksum: 31701bbe_0a4587fc_e1ded39b_4ac72fb1
// Name: carpaintmm_damaget

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps3 { vec4 cb3[1]; } idx_uniforms3_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res8, s8

uniform sampler2D resourceSamplerPair_1_ps; // res9, s9

uniform sampler2D resourceSamplerPair_2_ps; // res0, s0

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3

uniform sampler2D resourceSamplerPair_4_ps; // res4, s4

uniform sampler2D resourceSamplerPair_5_ps; // res1, s1

uniform sampler2D resourceSamplerPair_6_ps; // res2, s2


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
	r0.xy = v1.v.zw * vec2(4.00000000f, 6.00000000f);
	r1 = (texture(resourceSamplerPair_0_ps, r0.xy));
	r0.xyz = ((texture(resourceSamplerPair_1_ps, r0.xy)).xzyw).xyz;
	r2.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
	r1.xyz = r1.xyz + -r2.xyz;
	r1.xyz = fma(r1.www, r1.xyz, r2.xyz);
	r2.xyz = -r1.xyz + r2.xyz;
	r1.xyz = fma(v2.v.www, r2.xyz, r1.xyz);
	r2.xy = v1.v.zw * idx_uniforms3_ps.cb3[0].xy;
	r3 = (texture(resourceSamplerPair_3_ps, r2.xy));
	r2.xy = ((texture(resourceSamplerPair_4_ps, r2.xy))).xy;
	r2.xy = fma(r2.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r3 = r3 * vec4(4.69999981f, 4.69999981f, 4.69999981f, 2.00000000f);
	r1.xyz = r1.xyz * r3.xyz;
	o0.xyz = r1.xyz * idx_uniforms1_ps.cb1[0].xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	r1.xyz = ((texture(resourceSamplerPair_5_ps, v1.v.zw))).xyz;
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r3.xy = fma(r0.xz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.w = dot(r3.xy, r3.xy);
	r3.z = -r0.w + float(1.00000000f);
	r0.w = -v2.v.w + float(1.00000000f);
	r1.xyz = fma(r3.xyz, r0.www, r1.xyz);
	r2.z = uintBitsToFloat(uint(0x00000000));
	r1.xyz = r1.xyz + r2.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xyz = r0.www * r1.xyz;
	r0.w = dot(v4.v.xyz, v4.v.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xyz = r0.www * v4.v.xyz;
	r2.xyz = r1.yyy * r2.xyz;
	r0.w = dot(v3.v.xyz, v3.v.xyz);
	r0.w = inversesqrt(r0.w);
	r3.xyz = r0.www * v3.v.xyz;
	r2.xyz = fma(r3.xyz, r1.xxx, r2.xyz);
	r0.w = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r3.xyz = r0.www * v2.v.xyz;
	r0.w = dot(r3.xyz, r3.xyz);
	r0.w = inversesqrt(r0.w);
	r3.xyz = r0.www * r3.xyz;
	r1.xyz = fma(r3.xyz, r1.zzz, r2.xyz);
	o1.xyz = fma(r1.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r0.z = uintBitsToFloat(uint(0x3f4ccccd));
	r1.xyz = ((texture(resourceSamplerPair_6_ps, v1.v.xy))).xyz;
	r0.x = r1.x;
	r0.xyz = r0.xyz + -r1.xyz;
	r0.xyz = fma(r1.www, r0.xyz, r1.xyz);
	r1.xyz = -r0.xyz + r1.xyz;
	r0.xyz = fma(v2.v.www, r1.xyz, r0.xyz);
	o2.y = r3.w * r0.y;
	o2.zw = r0.zx;
	o2.x = uintBitsToFloat(uint(0x00000000));
	return;
}
