#version 460 core
// ps_5_0
// Checksum: cffb4d36_5f90df09_d33fe858_a5037eeb
// Name: bouncelight

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[4]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[3]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2DArrayShadow resourceSamplerPair_0_ps; // res14, s13

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0

uniform sampler2D resourceSamplerPair_2_ps; // res1, s1


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
	r0.xy = fma(v4.v.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.x = max(abs(r0.y), abs(r0.x));
	r0.x = intBitsToFloat(float(1.00000000f) >= r0.x ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r0.x) != uint(0))
	{
		r0.xy = fma(v2.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r0.zw = fma(v3.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r0.x = max(abs(r0.y), abs(r0.x));
		r0.y = max(abs(r0.w), abs(r0.z));
		r0.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(r0.xy, vec2(4.94999981f, 4.94999981f)))));
		r0.z = uintBitsToFloat(movc(floatBitsToUint(r0.y), floatBitsToUint(idx_uniforms1_ps.cb1[2].y), floatBitsToUint(idx_uniforms1_ps.cb1[2].z)));
		r0.z = uintBitsToFloat(movc(floatBitsToUint(r0.x), floatBitsToUint(idx_uniforms1_ps.cb1[2].x), floatBitsToUint(r0.z)));
		r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.yyy), floatBitsToUint(v3.v.xyz), floatBitsToUint(v4.v.xyz)));
		r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.xxx), floatBitsToUint(v2.v.xyz), floatBitsToUint(r1.xyz)));
		r0.y = uintBitsToFloat(movc(floatBitsToUint(r0.y), uint(0x3f800000), uint(0x40000000)));
		r2.w = uintBitsToFloat(movc(floatBitsToUint(r0.x), uint(0x00000000), floatBitsToUint(r0.y)));
		r1.w = saturate(r1.z);
		r0.x = float(1.39999998f) / r0.z;
		r3 = r0.xxxx * vec4(-0.149460003f, -0.0737529993f, 0.0301959999f, 0.0776700005f);
		r4.xy = r3.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r4.xyz;
		r0.y = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r3.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r3.xyz;
		r0.z = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r0.y = r0.z + r0.y;
		r3 = r0.xxxx * vec4(-0.173096001f, 0.284866005f, 0.240042999f, -0.0698539987f);
		r4.xy = r3.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r4.xyz;
		r0.z = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r0.y = r0.z + r0.y;
		r3.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r3.xyz;
		r0.z = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r0.y = r0.z + r0.y;
		r3 = r0.xxxx * vec4(0.402942002f, 0.296036988f, -0.0809710026f, -0.408722997f);
		r4.xy = r3.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r4.xyz;
		r0.z = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r0.y = r0.z + r0.y;
		r3.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r3.xyz;
		r0.z = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r0.y = r0.z + r0.y;
		r3 = r0.xxxx * vec4(0.440210998f, -0.500657976f, -0.579936981f, 0.0628560036f);
		r4.xy = r3.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r4.xyz;
		r0.z = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r0.y = r0.z + r0.y;
		r3.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r3.xyz;
		r0.z = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r0.y = r0.z + r0.y;
		r3 = r0.xxxx * vec4(-0.575273991f, -0.602913022f, 0.0152620003f, 0.749845028f);
		r4.xy = r3.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r4.xyz;
		r0.z = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r0.y = r0.z + r0.y;
		r3.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r3.xyz;
		r0.z = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r0.y = r0.z + r0.y;
		r3 = r0.xxxx * vec4(-0.781122983f, 0.624377012f, 0.914593995f, 0.0616080016f);
		r4.xy = r3.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r4.xyz;
		r0.x = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r0.x = r0.x + r0.y;
		r3.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = r1.xyw + r3.xyz;
		r0.y = texture(resourceSamplerPair_0_ps, vec4(r2.xyw, r2.z));
		r0.x = r0.y + r0.x;
		r0.x = r0.x * float(0.0833333358f);
	}
	else
	{
		r0.x = uintBitsToFloat(uint(0x3f800000));
	}
	r0.yz = v1.v.xz + idx_uniforms1_ps.cb1[1].yz;
	r1.x = v1.v.y * idx_uniforms0_ps.cb0[1].w;
	r1.y = v1.v.y * idx_uniforms0_ps.cb0[3].w;
	r0.yz = r0.yz + -r1.xy;
	r0.yz = r0.yz * idx_uniforms1_ps.cb1[1].ww;
	r0.y = ((texture(resourceSamplerPair_1_ps, r0.yz)).xwyz).y;
	r0.y = saturate(r0.y + idx_uniforms1_ps.cb1[1].x);
	r0.y = r0.y * float(4.00000000f);
	r0.y = min(r0.y, float(1.00000000f));
	r0.z = dot(v5.v.xyz, -idx_uniforms0_ps.cb0[3].xyz);
	r0.z = saturate(r0.z * float(2.50000000f));
	r0.y = r0.y * r0.z;
	r0.x = r0.y * r0.x;
	r0.yz = fma(v1.v.xz, vec2(3.05175781e-05f, 3.05175781e-05f), vec2(0.500000000f, 0.500000000f));
	r0.yzw = ((texture(resourceSamplerPair_2_ps, r0.yz)).wxyz).yzw;
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = inversesqrt(r1.x);
	r1.xyz = fma(r0.yzw, r1.xxx, -r0.yzw);
	r0.yzw = fma(r1.xyz, vec3(0.850000024f, 0.850000024f, 0.850000024f), r0.yzw);
	r1.x = dot(r0.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.yzw = r0.yzw + -r1.xxx;
	r0.yzw = fma(r0.yzw, vec3(0.750000000f, 0.750000000f, 0.750000000f), r1.xxx);
	r0.x = saturate(r0.x * v1.v.w);
	o0.xyz = r0.xxx * r0.yzw;
	o0.w = v5.v.w;
	return;
}

