#version 460 core
// ps_5_0
// Checksum: 60a7a182_90dc2b0a_260a16b1_054caebd
// Name: downscalenxnpackfocus

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[4096]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2


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
	r0.x = intBitsToFloat(int(idx_uniforms1_ps.cb1[5].z));
	r0.yzw = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
	r1.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	while (true)
	{
		r1.z = intBitsToFloat(floatBitsToInt(r1.y) >= floatBitsToInt(r0.x) ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r1.z) != uint(0))
			break;
		r1.z = intBitsToFloat(int(5) + floatBitsToInt(r1.y));
		r1.zw = v1.v.xy + idx_uniforms1_ps.cb1[floatBitsToInt(r1.z)].xy;
		r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.zw))).xyz;
		r0.yzw = fma(idx_uniforms1_ps.cb1[5].www, r2.xyz, r0.yzw);
		r1.z = ((texture(resourceSamplerPair_1_ps, r1.zw)).yzxw).z;
		r1.z = fma(r1.z, idx_uniforms1_ps.cb1[0].x, idx_uniforms1_ps.cb1[0].y);
		r1.z = float(1.00000000f) / r1.z;
		r1.x = fma(idx_uniforms1_ps.cb1[5].w, r1.z, r1.x);
		r1.y = intBitsToFloat(floatBitsToInt(r1.y) + int(1));
	}
	o0.xyz = r0.yzw;
	r0.x = dot(v2.v.xyz, v2.v.xyz);
	r0.x = inversesqrt(r0.x);
	r0.xyz = r0.xxx * v2.v.xzy;
	r0.w = saturate(r0.z);
	r0.w = r0.w * r0.w;
	r0.w = fma(r0.w, idx_uniforms1_ps.cb1[2].w, float(1.00000000f));
	r1.y = intBitsToFloat(float(0.00000000f) < idx_uniforms1_ps.cb1[4].w ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r1.y) != uint(0))
	{
		r1.y = min(abs(r0.y), abs(r0.x));
		r1.z = max(abs(r0.y), abs(r0.x));
		r1.z = float(1.00000000f) / r1.z;
		r1.y = r1.z * r1.y;
		r1.z = r1.y * r1.y;
		r1.w = fma(r1.z, float(0.0208350997f), float(-0.0851330012f));
		r1.w = fma(r1.z, r1.w, float(0.180141002f));
		r1.w = fma(r1.z, r1.w, float(-0.330299497f));
		r1.z = fma(r1.z, r1.w, float(0.999866009f));
		r1.w = r1.z * r1.y;
		r2.x = intBitsToFloat(abs(r0.y) < abs(r0.x) ? int(0xffffffff) : int(0x00000000));
		r1.w = fma(r1.w, float(-2.00000000f), float(1.57079637f));
		r1.w = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r1.w));
		r1.y = fma(r1.y, r1.z, r1.w);
		r1.z = intBitsToFloat(r0.y < -r0.y ? int(0xffffffff) : int(0x00000000));
		r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0xc0490fdb));
		r1.y = r1.z + r1.y;
		r1.z = min(r0.y, r0.x);
		r0.x = max(r0.y, r0.x);
		r0.y = intBitsToFloat(r1.z < -r1.z ? int(0xffffffff) : int(0x00000000));
		r0.x = intBitsToFloat(r0.x >= -r0.x ? int(0xffffffff) : int(0x00000000));
		r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.y));
		r0.x = uintBitsToFloat(movc(floatBitsToUint(r0.x), floatBitsToUint(-1.f * r1.y), floatBitsToUint(r1.y)));
		r0.x = r0.x + float(3.14159274f);
		r0.x = r0.x * float(0.159154937f);
		r1.y = fma(abs(r0.z), float(0.500000000f), float(0.500000000f));
		r0.y = r0.z * r1.y;
		r1.y = saturate(r1.x * idx_uniforms1_ps.cb1[4].z);
		r0.z = saturate(r0.z * idx_uniforms1_ps.cb1[4].y);
		r0.z = -r0.z + float(1.00000000f);
		r2 = r0.xyxy + -idx_uniforms1_ps.cb1[3];
		r2 = r2 * vec4(8.00000000f, 3.00000000f, 25.0000000f, 8.00000000f);
		r3.xyz = ((texture(resourceSamplerPair_2_ps, r2.xy)).xywz).xyz;
		r3.xyz = r3.xyz + vec3(-0.00000000f, -0.500000000f, -0.500000000f);
		r2.xyz = ((texture(resourceSamplerPair_2_ps, r2.zw)).xywz).xyz;
		r2.xyz = r2.xyz + vec3(-0.500000000f, -0.500000000f, -0.500000000f);
		r2.xyz = fma(r2.xyz, vec3(0.00000000f, 0.750000000f, 0.750000000f), r3.xyz);
		r0.x = dot(r2.yz, r2.yz);
		r0.x = sqrt(r0.x);
		r0.x = fma(r0.z, float(0.300000012f), r0.x);
		r0.x = r1.y * r0.x;
		r0.x = r0.z * r0.x;
		r0.x = r0.x * idx_uniforms1_ps.cb1[4].w;
		r0.x = saturate(r2.x * r0.x);
	}
	else
	{
		r0.x = uintBitsToFloat(uint(0x00000000));
	}
	r0.y = ((textureLod(resourceSamplerPair_3_ps, v1.v.xy, float(0.00000000f))).yxzw).y;
	r0.y = r0.y * float(1.50000000f);
	r0.y = inversesqrt(r0.y);
	r0.y = float(1.00000000f) / r0.y;
	r0.x = saturate(r0.x + idx_uniforms1_ps.cb1[2].z);
	r0.z = saturate(fma(r1.x, idx_uniforms1_ps.cb1[1].x, -idx_uniforms1_ps.cb1[1].y));
	r0.z = r0.z / r0.w;
	r0.x = saturate(fma(r0.z, idx_uniforms1_ps.cb1[2].y, r0.x));
	r0.x = r0.x + r0.y;
	o0.w = min(r0.x, float(1.00000000f));
	return;
}

