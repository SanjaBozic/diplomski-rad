#version 460 core
// ps_5_0
// Checksum: 29aadfc2_bc47d354_4500dba6_b7e484e6
// Name: generalmmlod0_matte_sand_inst

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 10) in idx_Varying10 { vec4 v; } v10;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[7]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res8, s8

uniform sampler2D resourceSamplerPair_3_ps; // res9, s9

uniform sampler2D resourceSamplerPair_4_ps; // res10, s10


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
	r2.xyz = ((texture(resourceSamplerPair_1_ps, v2.v.xy)).xywz).xyz;
	r2.yzw = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.x = r2.w * r2.y;
	r0.w = dot(r2.xz, r2.xz);
	r0.w = -r0.w + float(1.00000000f);
	r0.w = max(r0.w, float(0.00000000f));
	r0.w = sqrt(r0.w);
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r1.w = dot(v4.v.xyz, v4.v.xyz);
	r1.w = inversesqrt(r1.w);
	r3.xyz = r1.www * v4.v.xyz;
	r4.xyz = r1.zxy * r3.yzx;
	r4.xyz = fma(r1.yzx, r3.zxy, -r4.xyz);
	r4.xyz = r4.xyz * v4.v.www;
	r2.yzw = r2.zzz * r4.xyz;
	r2.xyz = fma(r3.xyz, r2.xxx, r2.yzw);
	r2.xyz = fma(r1.xyz, r0.www, r2.xyz);
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xzw = r0.www * r2.xyz;
	r1.w = saturate(r2.w * idx_uniforms1_ps.cb1[5].z);
	r0.w = fma(r2.y, r0.w, r1.w);
	r1.w = intBitsToFloat(r0.w >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r5.xy = idx_uniforms1_ps.cb1[5].ww * vec2(0.00200000009f, 0.0399999991f);
	r5.xy = fma(v10.v.zw, vec2(1.10000002f, 0.300000012f), r5.xy);
	r2.y = ((texture(resourceSamplerPair_2_ps, r5.xy)).xwyz).y;
	if (floatBitsToUint(r1.w) != uint(0))
	{
		r5.xyz = ((texture(resourceSamplerPair_3_ps, v10.v.xy))).xyz;
		r5.xyz = fma(r5.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r4.xyz = r4.xyz * r5.yyy;
		r3.xyz = fma(r3.xyz, r5.xxx, r4.xyz);
		r1.xyz = fma(r1.xyz, r5.zzz, r3.xyz);
		r1.w = dot(r1.xyz, r1.xyz);
		r1.w = inversesqrt(r1.w);
		r3 = (texture(resourceSamplerPair_4_ps, v1.v.zw));
		r3.w = min(r3.w, idx_uniforms1_ps.cb1[5].x);
		r3.w = saturate(r3.w * idx_uniforms1_ps.cb1[5].y);
		r4 = (texture(resourceSamplerPair_2_ps, v10.v.xy));
		r5.x = uintBitsToFloat(uint(0x3f800000));
		r3.xyz = r3.xyz * r4.xyz;
		r4.x = ((texture(resourceSamplerPair_2_ps, v10.v.zw)).wxyz).x;
		r4.y = fma(r4.w, r5.x, float(0.750000000f));
		r4.z = r4.y * r4.x;
		r4.w = r3.w * float(0.699999988f);
		r4.x = fma(-r4.x, r4.y, float(0.100000001f));
		r4.x = fma(r4.w, r4.x, r4.z);
		r2.y = -r2.y + float(1.00000000f);
		r2.y = saturate(fma(-r2.y, idx_uniforms1_ps.cb1[6].x, r4.x));
		r2.y = r2.y * r3.w;
		r3.w = r2.y * float(3.00000000f);
		r2.y = fma(r2.y, float(-0.300000012f), float(0.800000012f));
		r3.w = min(r3.w, float(1.00000000f));
		r4.x = -r2.y + float(1.00000000f);
		r3.w = r3.w / r4.x;
		r0.w = r0.w + -r2.y;
		r0.w = saturate(r3.w * r0.w);
		r3.xyz = fma(r3.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r0.xyz);
		r0.xyz = fma(r0.www, r3.xyz, r0.xyz);
		r3.xy = r0.ww * vec2(0.00999999978f, 0.500000000f);
		r1.xyz = fma(r1.xyz, r1.www, -r2.xzw);
		r1.xyz = fma(r0.www, r1.xyz, r2.xzw);
		r0.w = dot(r1.xyz, r1.xyz);
		r0.w = inversesqrt(r0.w);
		r2.xzw = r0.www * r1.xyz;
	}
	else
	{
		r3.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	}
	r3.z = saturate(idx_uniforms2_ps.cb2[1].w + float(1.00000000f));
	o1.xyz = fma(r2.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r0.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r3.w = idx_uniforms2_ps.cb2[1].y;
	o2 = r3.wxyz;
	return;
}

