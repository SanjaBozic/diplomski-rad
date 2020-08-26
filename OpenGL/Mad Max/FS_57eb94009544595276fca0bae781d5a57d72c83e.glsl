#version 460 core
// ps_5_0
// Checksum: eb15ba4a_e7e11cf1_f1dde5db_40606f56
// Name: generalmmlod0_dndetail_terraincolor_sand

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
vec4 r0, r1, r2, r3, r4, r5, r6, r7;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[7]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[4]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res5, s5

uniform sampler2D resourceSamplerPair_2_ps; // res1, s1

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2

uniform sampler2D resourceSamplerPair_4_ps; // res3, s3

uniform sampler2D resourceSamplerPair_5_ps; // res4, s4

uniform sampler2D resourceSamplerPair_6_ps; // res8, s8

uniform sampler2D resourceSamplerPair_7_ps; // res9, s9

uniform sampler2D resourceSamplerPair_8_ps; // res10, s10


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
	r0.w = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r1.xyz = r0.www * v3.v.xyz;
	r2.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.zw))).xyz;
	r2.xyz = fma(idx_uniforms2_ps.cb2[0].xxx, r2.xyz, idx_uniforms2_ps.cb2[0].www);
	r0.xyz = r0.xyz * r2.xyz;
	r2.xyz = ((texture(resourceSamplerPair_2_ps, v2.v.xy)).xywz).xyz;
	r2.yzw = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.x = r2.w * r2.y;
	r0.w = dot(r2.xz, r2.xz);
	r0.w = -r0.w + float(1.00000000f);
	r0.w = max(r0.w, float(0.00000000f));
	r0.w = sqrt(r0.w);
	r3.xyz = ((texture(resourceSamplerPair_3_ps, v1.v.xy))).xyz;
	r4.xy = v2.v.zw * idx_uniforms2_ps.cb2[0].yz;
	r5 = (texture(resourceSamplerPair_4_ps, r4.xy));
	r1.w = fma(idx_uniforms2_ps.cb2[3].x, r5.w, idx_uniforms2_ps.cb2[3].y);
	r0.xyz = r0.xyz * r5.xyz;
	r0.xyz = r0.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	r5.y = r1.w * r3.y;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r4.xyz = ((texture(resourceSamplerPair_5_ps, r4.xy)).xywz).xyz;
	r2.yw = uintBitsToFloat(uvec2(0xbf800000, 0xbf800000));
	r4.yzw = fma(r4.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), r2.yzw);
	r4.x = r4.w * r4.y;
	r2.y = uintBitsToFloat(uint(0xbf800000));
	r2.xy = r2.xy + r4.xz;
	r1.w = dot(v4.v.xyz, v4.v.xyz);
	r1.w = inversesqrt(r1.w);
	r4.xyz = r1.www * v4.v.xyz;
	r6.xyz = r1.zxy * r4.yzx;
	r6.xyz = fma(r1.yzx, r4.zxy, -r6.xyz);
	r6.xyz = r6.xyz * v4.v.www;
	r2.yzw = r2.yyy * r6.xyz;
	r2.xyz = fma(r4.xyz, r2.xxx, r2.yzw);
	r2.xyz = fma(r1.xyz, r0.www, r2.xyz);
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xzw = r0.www * r2.xyz;
	r1.w = saturate(r2.w * idx_uniforms1_ps.cb1[5].z);
	r0.w = fma(r2.y, r0.w, r1.w);
	r1.w = intBitsToFloat(r0.w >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r7.xy = idx_uniforms1_ps.cb1[5].ww * vec2(0.00200000009f, 0.0399999991f);
	r7.xy = fma(v7.v.zw, vec2(1.10000002f, 0.300000012f), r7.xy);
	r2.y = ((texture(resourceSamplerPair_6_ps, r7.xy)).xwyz).y;
	if (floatBitsToUint(r1.w) != uint(0))
	{
		r7.xyz = ((texture(resourceSamplerPair_7_ps, v7.v.xy))).xyz;
		r7.xyz = fma(r7.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r6.xyz = r6.xyz * r7.yyy;
		r4.xyz = fma(r4.xyz, r7.xxx, r6.xyz);
		r1.xyz = fma(r1.xyz, r7.zzz, r4.xyz);
		r1.w = dot(r1.xyz, r1.xyz);
		r1.w = inversesqrt(r1.w);
		r4 = (texture(resourceSamplerPair_8_ps, v1.v.zw));
		r3.w = min(r4.w, idx_uniforms1_ps.cb1[5].x);
		r3.w = saturate(r3.w * idx_uniforms1_ps.cb1[5].y);
		r6 = (texture(resourceSamplerPair_6_ps, v7.v.xy));
		r4.w = uintBitsToFloat(uint(0x3f800000));
		r4.xyz = r4.xyz * r6.xyz;
		r6.x = ((texture(resourceSamplerPair_6_ps, v7.v.zw)).wxyz).x;
		r4.w = fma(r6.w, r4.w, float(0.750000000f));
		r6.y = r4.w * r6.x;
		r6.z = r3.w * float(0.699999988f);
		r4.w = fma(-r6.x, r4.w, float(0.100000001f));
		r4.w = fma(r6.z, r4.w, r6.y);
		r2.y = -r2.y + float(1.00000000f);
		r2.y = saturate(fma(-r2.y, idx_uniforms1_ps.cb1[6].x, r4.w));
		r2.y = r2.y * r3.w;
		r3.w = intBitsToFloat(float(0.00000000f) < idx_uniforms2_ps.cb2[1].w ? int(0xffffffff) : int(0x00000000));
		r4.w = r2.y * float(5.00000000f);
		r5.xw = r3.xz;
		r6.x = -r5.x + float(1.00000000f);
		r4.w = saturate(fma(r4.w, r6.x, r2.y));
		r2.y = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r2.y), floatBitsToUint(r4.w)));
		r4.w = r2.y * float(3.00000000f);
		r2.y = fma(r2.y, float(-0.300000012f), float(0.800000012f));
		r3.w = uintBitsToFloat(movc(floatBitsToUint(r3.w), uint(0x3f800000), floatBitsToUint(r3.x)));
		r4.w = min(r4.w, float(1.00000000f));
		r6.x = fma(-r2.y, r3.w, float(1.00000000f));
		r4.w = r4.w / r6.x;
		r0.w = fma(-r2.y, r3.w, r0.w);
		r0.w = saturate(r4.w * r0.w);
		r4.xyz = fma(r4.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r0.xyz);
		r0.xyz = fma(r0.www, r4.xyz, r0.xyz);
		r4.x = r5.x;
		r4.yz = uintBitsToFloat(uvec2(0x3c23d70a, 0x3f000000));
		r4.xyz = -r5.xyw + r4.xyz;
		r3.xyz = fma(r0.www, r4.xyz, r5.xyw);
		r1.xyz = fma(r1.xyz, r1.www, -r2.xzw);
		r1.xyz = fma(r0.www, r1.xyz, r2.xzw);
		r0.w = dot(r1.xyz, r1.xyz);
		r0.w = inversesqrt(r0.w);
		r2.xzw = r0.www * r1.xyz;
		r5.yz = r3.yz;
	}
	else
	{
		r5.z = r3.z;
	}
	r5.x = r3.x * idx_uniforms2_ps.cb2[1].y;
	r5.w = saturate(r3.x + idx_uniforms2_ps.cb2[1].w);
	o1.xyz = fma(r2.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r0.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2 = r5;
	return;
}

