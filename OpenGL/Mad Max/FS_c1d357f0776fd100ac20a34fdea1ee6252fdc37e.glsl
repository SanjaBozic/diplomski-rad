#version 460 core
// ps_5_0
// Checksum: 7dfdf981_06708296_e64813e8_04207032
// Name: dofbokeh_rh_ca

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[15]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res2, s2

uniform sampler2D resourceSamplerPair_1_ps; // res5, s5

uniform sampler2D resourceSamplerPair_2_ps; // res0, s0

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3

uniform sampler2D resourceSamplerPair_4_ps; // res4, s4

uniform sampler2D resourceSamplerPair_5_ps; // res1, s1

uniform sampler2D resourceSamplerPair_6_ps; // res6, s6

uniform sampler3D resourceSamplerPair_7_ps; // res10, s10


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
	r0 = v1.v.xyxy * idx_uniforms1_ps.cb1[9];
	r1.x = dot(v2.v.xyz, v2.v.xyz);
	r1.x = inversesqrt(r1.x);
	r1.xyz = r1.xxx * v2.v.yxz;
	r1.w = ((texture(resourceSamplerPair_0_ps, r0.xy)).yzwx).w;
	r1.w = fma(r1.w, idx_uniforms1_ps.cb1[2].z, idx_uniforms1_ps.cb1[2].w);
	r1.w = float(1.00000000f) / r1.w;
	r2.x = intBitsToFloat(float(0.00000000f) < idx_uniforms1_ps.cb1[14].w ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r2.x) != uint(0))
	{
		r2.x = min(abs(r1.z), abs(r1.y));
		r2.y = max(abs(r1.z), abs(r1.y));
		r2.y = float(1.00000000f) / r2.y;
		r2.x = r2.y * r2.x;
		r2.y = r2.x * r2.x;
		r2.z = fma(r2.y, float(0.0208350997f), float(-0.0851330012f));
		r2.z = fma(r2.y, r2.z, float(0.180141002f));
		r2.z = fma(r2.y, r2.z, float(-0.330299497f));
		r2.y = fma(r2.y, r2.z, float(0.999866009f));
		r2.z = r2.y * r2.x;
		r2.w = intBitsToFloat(abs(r1.z) < abs(r1.y) ? int(0xffffffff) : int(0x00000000));
		r2.z = fma(r2.z, float(-2.00000000f), float(1.57079637f));
		r2.z = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r2.z));
		r2.x = fma(r2.x, r2.y, r2.z);
		r2.y = intBitsToFloat(r1.z < -r1.z ? int(0xffffffff) : int(0x00000000));
		r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & uint(0xc0490fdb));
		r2.x = r2.y + r2.x;
		r2.y = min(r1.z, r1.y);
		r1.y = max(r1.z, r1.y);
		r1.z = intBitsToFloat(r2.y < -r2.y ? int(0xffffffff) : int(0x00000000));
		r1.y = intBitsToFloat(r1.y >= -r1.y ? int(0xffffffff) : int(0x00000000));
		r1.y = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r1.z));
		r1.y = uintBitsToFloat(movc(floatBitsToUint(r1.y), floatBitsToUint(-1.f * r2.x), floatBitsToUint(r2.x)));
		r1.y = r1.y + float(3.14159274f);
		r2.x = r1.y * float(0.159154937f);
		r1.y = fma(abs(r1.x), float(0.500000000f), float(0.500000000f));
		r2.y = r1.y * r1.x;
		r1.y = saturate(r1.w * idx_uniforms1_ps.cb1[14].z);
		r1.z = r1.y * idx_uniforms1_ps.cb1[14].x;
		r2.z = saturate(r1.x * idx_uniforms1_ps.cb1[14].y);
		r2.z = -r2.z + float(1.00000000f);
		r1.z = r1.z * r2.z;
		r3 = r2.xyxy + -idx_uniforms1_ps.cb1[13];
		r3 = r3 * vec4(8.00000000f, 3.00000000f, 25.0000000f, 8.00000000f);
		r2.xyw = ((texture(resourceSamplerPair_1_ps, r3.xy))).xyw;
		r2.xyw = r2.xyw + vec3(-0.00000000f, -0.500000000f, -0.500000000f);
		r3.xyz = ((texture(resourceSamplerPair_1_ps, r3.zw)).xywz).xyz;
		r3.xyz = r3.xyz + vec3(-0.500000000f, -0.500000000f, -0.500000000f);
		r2.xyw = fma(r3.xyz, vec3(0.00000000f, 0.750000000f, 0.750000000f), r2.xyw);
		r3.xy = r1.zz * r2.wy;
		r3.xy = fma(r3.xy, r2.xx, v1.v.xy);
		r1.z = dot(r2.yw, r2.yw);
		r1.z = sqrt(r1.z);
		r1.z = fma(r2.z, float(0.300000012f), r1.z);
		r1.y = r1.y * r1.z;
		r1.y = r2.z * r1.y;
		r1.y = r1.y * idx_uniforms1_ps.cb1[14].w;
		r1.y = saturate(r2.x * r1.y);
		r0.xy = r3.xy * idx_uniforms1_ps.cb1[9].xy;
		r1.z = ((texture(resourceSamplerPair_0_ps, r0.xy)).yzxw).z;
		r1.z = fma(r1.z, idx_uniforms1_ps.cb1[2].z, idx_uniforms1_ps.cb1[2].w);
		r1.w = float(1.00000000f) / r1.z;
	}
	else
	{
		r1.y = uintBitsToFloat(uint(0x00000000));
	}
	r2.xyz = ((texture(resourceSamplerPair_2_ps, r0.xy))).xyz;
	r3.y = ((texture(resourceSamplerPair_3_ps, r0.xy))).y;
	r4.y = ((texture(resourceSamplerPair_4_ps, r0.xy))).y;
	r5 = fma(idx_uniforms1_ps.cb1[0].xxxx, vec4(2.00000000f, -2.00000000f, -2.00000000f, 2.00000000f), r0.xyxy);
	r3.x = ((texture(resourceSamplerPair_3_ps, r5.xy))).x;
	r3.z = ((texture(resourceSamplerPair_3_ps, r5.zw))).z;
	r5 = fma(idx_uniforms1_ps.cb1[0].xxxx, vec4(6.00000000f, -6.00000000f, -6.00000000f, 6.00000000f), r0.xyxy);
	r4.x = ((texture(resourceSamplerPair_4_ps, r5.xy))).x;
	r4.z = ((texture(resourceSamplerPair_4_ps, r5.zw))).z;
	r1.x = saturate(r1.x);
	r1.x = r1.x * r1.x;
	r1.x = fma(r1.x, idx_uniforms1_ps.cb1[12].z, float(1.00000000f));
	r1.z = saturate(fma(r1.w, idx_uniforms1_ps.cb1[4].x, -idx_uniforms1_ps.cb1[4].y));
	r1.x = r1.z / r1.x;
	r1.x = saturate(fma(r1.x, idx_uniforms1_ps.cb1[0].w, idx_uniforms1_ps.cb1[0].z));
	r5.yw = ((texture(resourceSamplerPair_5_ps, r0.xy))).yw;
	r1.z = max(r1.x, r5.w);
	r1.z = fma(r1.z, float(0.500000000f), float(0.500000000f));
	r1.z = r1.z * idx_uniforms1_ps.cb1[0].x;
	r6 = fma(r1.zzzz, vec4(1.00000000f, -1.00000000f, -1.00000000f, 1.00000000f), r0.xyxy);
	r5.x = ((texture(resourceSamplerPair_5_ps, r6.xy))).x;
	r5.z = ((texture(resourceSamplerPair_5_ps, r6.zw))).z;
	r0.x = r1.x + float(-0.100000001f);
	r0.x = saturate(r0.x * float(16.0000000f));
	r0.x = r5.w + r0.x;
	r0.y = r1.y * float(4.00000000f);
	r0.y = min(r0.y, float(1.00000000f));
	r0.x = saturate(r0.y + r0.x);
	r1.xyz = -r2.xyz + r5.xyz;
	r1.xyz = fma(r0.xxx, r1.xyz, r2.xyz);
	r0.xyz = ((texture(resourceSamplerPair_6_ps, r0.zw))).xyz;
	r0.xyz = fma(r0.xyz, idx_uniforms1_ps.cb1[12].www, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r2.xyz = r4.xyz * idx_uniforms1_ps.cb1[3].yyy;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = fma(r3.xyz, idx_uniforms1_ps.cb1[3].xxx, r0.xyz);
	r0.xyz = fma(r1.xyz, idx_uniforms1_ps.cb1[2].xxx, r0.xyz);
	r0.xyz = max(r0.xyz, vec3(1.00000001e-07f, 1.00000001e-07f, 1.00000001e-07f));
	r0.w = dot(r0.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.w = max(r0.w, float(9.99999975e-05f));
	r1.x = idx_uniforms1_ps.cb1[10].x * idx_uniforms1_ps.cb1[10].x;
	r1.x = r0.w / r1.x;
	r1.x = r1.x + float(1.00000000f);
	r0.w = r0.w + float(1.00000000f);
	r0.w = r1.x / r0.w;
	r0.xyz = r0.xyz * r0.www;
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[1].xyz;
	r0.xyz = sqrt(r0.xyz);
	r0.xyz = min(r0.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.xyz = fma(r0.xyz, vec3(0.968750000f, 0.968750000f, 0.968750000f), vec3(0.0156250000f, 0.0156250000f, 0.0156250000f));
	r0.xyz = ((texture(resourceSamplerPair_7_ps, r0.xyz))).xyz;
	r0.xyz = r0.xyz * r0.xyz;
	r0.w = dot(r0.xyz, vec3(0.298999995f, 0.587000012f, 0.114000000f));
	o0.w = sqrt(r0.w);
	o0.xyz = r0.xyz;
	return;
}

