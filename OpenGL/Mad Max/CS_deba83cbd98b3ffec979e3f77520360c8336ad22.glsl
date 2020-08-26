#version 460 core
// cs_5_0
// Checksum: 671f8bb2_a8977039_402f8c8c_97b67fee
// Name: fxaapass1rgbcs_highresx

vec4 r0, r1, r2, r3;
shared uint g0[100][1];
layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_cs0 { vec4 cb0[1]; } idx_uniforms0_cs;

layout (std430) restrict writeonly buffer u0_cs { uint u0[]; };
layout (std430) restrict writeonly buffer u1_cs { uint u1[]; };
writeonly uniform restrict image2D u2;
layout (binding = 0) uniform atomic_uint atomic_counter_u0;
layout (binding = 1) uniform atomic_uint atomic_counter_u1;

// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_cs; // res0, s-1


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

ivec4 bfi(in ivec4 src0, in ivec4 src1, in ivec4 src2, in ivec4 src3)
{
	ivec4 result;
	result.x = bitfieldInsert(src0.x,src1.x,src2.x,src3.x);
	result.y = bitfieldInsert(src0.y,src1.y,src2.y,src3.y);
	result.z = bitfieldInsert(src0.z,src1.z,src2.z,src3.z);
	result.w = bitfieldInsert(src0.w,src1.w,src2.w,src3.w);
	return result;
}

ivec3 bfi(in ivec3 src0, in ivec3 src1, in ivec3 src2, in ivec3 src3)
{
	ivec3 result;
	result.x = bitfieldInsert(src0.x,src1.x,src2.x,src3.x);
	result.y = bitfieldInsert(src0.y,src1.y,src2.y,src3.y);
	result.z = bitfieldInsert(src0.z,src1.z,src2.z,src3.z);
	return result;
}

ivec2 bfi(in ivec2 src0, in ivec2 src1, in ivec2 src2, in ivec2 src3)
{
	ivec2 result;
	result.x = bitfieldInsert(src0.x,src1.x,src2.x,src3.x);
	result.y = bitfieldInsert(src0.y,src1.y,src2.y,src3.y);
	return result;
}

int bfi(in int src0, in int src1, in int src2, in int src3)
{
	int result;
	result = bitfieldInsert(src0,src1,src2,src3);
	return result;
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.x = intBitsToFloat(gl_LocalInvocationIndex < uint(0x00000032) ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r0.x) != uint(0))
	{
		{ float destQUOT = uintBitsToFloat( gl_LocalInvocationIndex / uint(0x0000000a) );
		r1.x = uintBitsToFloat( uint(mod( gl_LocalInvocationIndex, uint(0x0000000a) )) );
		r0.x = destQUOT; }
		r2 = intBitsToFloat(ivec4(gl_WorkGroupID.xyxy) << ivec4(3, 3, 3, 3));
		r1.xz = r1.xx;
		r1.yw = r0.xx;
		r0 = intBitsToFloat(floatBitsToInt(r1) + floatBitsToInt(r2));
		r0 = intBitsToFloat(floatBitsToInt(r0) + ivec4(-1, -1, -1, 4));
		r1.xy = r0.xy;
		r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r2.xyz = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w))))).xyz;
		r3.xyz = fma(r2.xyz, vec3(0.305306017f, 0.305306017f, 0.305306017f), vec3(0.682171106f, 0.682171106f, 0.682171106f));
		r3.xyz = fma(r2.xyz, r3.xyz, vec3(0.0125228781f, 0.0125228781f, 0.0125228781f));
		r2.xyz = r2.xyz * r3.xyz;
		r0.x = dot(r2.xyz, vec3(0.212670997f, 0.715160012f, 0.0721689984f));
		r0.x = fma(r0.x, float(15.0000000f), float(1.00000000f));
		r0.x = log2(r0.x);
		r0.x = r0.x * float(0.250000000f);
		imageStore(u2, floatBitsToInt(r1.xy), r0.xxxx);
		g0[gl_LocalInvocationIndex][uint(0x00000000) / 4u + 0u] = floatBitsToUint(r0.x);
		r0.x = intBitsToFloat(int(gl_LocalInvocationIndex) + int(50));
		r1.xy = r0.zw;
		r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r1.xyz = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w))))).xyz;
		r2.xyz = fma(r1.xyz, vec3(0.305306017f, 0.305306017f, 0.305306017f), vec3(0.682171106f, 0.682171106f, 0.682171106f));
		r2.xyz = fma(r1.xyz, r2.xyz, vec3(0.0125228781f, 0.0125228781f, 0.0125228781f));
		r1.xyz = r1.xyz * r2.xyz;
		r0.y = dot(r1.xyz, vec3(0.212670997f, 0.715160012f, 0.0721689984f));
		r0.y = fma(r0.y, float(15.0000000f), float(1.00000000f));
		r0.y = log2(r0.y);
		r0.y = r0.y * float(0.250000000f);
		imageStore(u2, floatBitsToInt(r0.zw), r0.yyyy);
		g0[floatBitsToUint(r0.x)][uint(0x00000000) / 4u + 0u] = floatBitsToUint(r0.y);
	}
	barrier();
	r0.xy = intBitsToFloat(ivec2(gl_LocalInvocationID.xy) + ivec2(1, 1));
	r0.x = intBitsToFloat(floatBitsToInt(r0.y) * int(10) + floatBitsToInt(r0.x));
	r1 = intBitsToFloat(floatBitsToInt(r0.xxxx) + ivec4(-10, -1, 1, 10));
	r0.y = uintBitsToFloat(g0[floatBitsToUint(r1.x)][(uint(0x00000000)) / 4u + 0u]);
	r0.z = uintBitsToFloat(g0[floatBitsToUint(r1.y)][(uint(0x00000000)) / 4u + 0u]);
	r0.w = uintBitsToFloat(g0[floatBitsToUint(r0.x)][(uint(0x00000000)) / 4u + 0u]);
	r1.x = uintBitsToFloat(g0[floatBitsToUint(r1.z)][(uint(0x00000000)) / 4u + 0u]);
	r1.y = uintBitsToFloat(g0[floatBitsToUint(r1.w)][(uint(0x00000000)) / 4u + 0u]);
	r1.z = max(r0.z, r0.y);
	r1.w = max(r0.w, r1.y);
	r1.w = max(r1.w, r1.x);
	r1.z = max(r1.w, r1.z);
	r1.w = min(r0.z, r0.y);
	r2.x = min(r0.w, r1.y);
	r2.x = min(r1.x, r2.x);
	r1.w = min(r1.w, r2.x);
	r1.z = -r1.w + r1.z;
	r2.xy = uintBitsToFloat(uvec4(textureSize(resourceSamplerPair_0_cs, int(uint(0x00000000))), 0, textureQueryLevels(resourceSamplerPair_0_cs)).xy);
	r1.w = intBitsToFloat(r1.z < idx_uniforms0_cs.cb0[0].z ? int(0xffffffff) : int(0x00000000));
	r2.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(floatBitsToUint(r2.xy), gl_GlobalInvocationID.xy))));
	r2.xy = uintBitsToFloat(floatBitsToUint(r2.xy) & uvec2(0x00000001, 0x00000001));
	r2.zw = uintBitsToFloat(movc(gl_GlobalInvocationID.xy, uvec2(0x00000000, 0x00000000), uvec2(0x00000001, 0x00000001)));
	r2.xy = intBitsToFloat(floatBitsToInt(r2.xy) + floatBitsToInt(r2.zw));
	r2.x = uintBitsToFloat(floatBitsToUint(r2.y) | floatBitsToUint(r2.x));
	r2.x = intBitsToFloat(floatBitsToInt(r2.x) != int(0) ? int(0xffffffff) : int(0x00000000));
	r1.w = uintBitsToFloat(floatBitsToUint(r1.w) | floatBitsToUint(r2.x));
	if (floatBitsToUint(r1.w) != uint(0))
	{
		return;
	}
	r2 = intBitsToFloat(floatBitsToInt(r0.xxxx) + ivec4(-11, -9, 9, 11));
	r0.x = uintBitsToFloat(g0[floatBitsToUint(r2.x)][(uint(0x00000000)) / 4u + 0u]);
	r1.w = uintBitsToFloat(g0[floatBitsToUint(r2.y)][(uint(0x00000000)) / 4u + 0u]);
	r2.x = uintBitsToFloat(g0[floatBitsToUint(r2.z)][(uint(0x00000000)) / 4u + 0u]);
	r2.y = uintBitsToFloat(g0[floatBitsToUint(r2.w)][(uint(0x00000000)) / 4u + 0u]);
	r2.zw = r0.yz + r1.yx;
	r3.x = r0.x + r2.x;
	r3.y = r1.w + r2.y;
	r2.x = r2.y + r2.x;
	r0.x = r0.x + r1.w;
	r1.w = fma(-r0.z, float(2.00000000f), r3.x);
	r2.y = fma(-r0.w, float(2.00000000f), r2.z);
	r1.w = fma(abs(r2.y), float(2.00000000f), abs(r1.w));
	r2.y = fma(-r1.x, float(2.00000000f), r3.y);
	r1.w = r1.w + abs(r2.y);
	r2.x = fma(-r1.y, float(2.00000000f), r2.x);
	r2.y = fma(-r0.w, float(2.00000000f), r2.w);
	r2.x = fma(abs(r2.y), float(2.00000000f), abs(r2.x));
	r0.x = fma(-r0.y, float(2.00000000f), r0.x);
	r0.x = abs(r0.x) + r2.x;
	r2.x = r2.w + r2.z;
	r2.x = fma(r2.x, float(2.00000000f), r3.x);
	r2.x = r3.y + r2.x;
	r2.x = fma(r2.x, float(0.0833333358f), -r0.w);
	r1.z = saturate(abs(r2.x) / r1.z);
	r2.x = fma(r1.z, float(-2.00000000f), float(3.00000000f));
	r1.z = r1.z * r1.z;
	r1.z = r1.z * r2.x;
	r1.z = r1.z * r1.z;
	r1.z = saturate(dot(r1.zz, idx_uniforms0_cs.cb0[0].ww));
	r0.x = intBitsToFloat(r1.w >= r0.x ? int(0xffffffff) : int(0x00000000));
	r0.y = uintBitsToFloat(movc(floatBitsToUint(r0.x), floatBitsToUint(r0.y), floatBitsToUint(r0.z)));
	r0.z = uintBitsToFloat(movc(floatBitsToUint(r0.x), floatBitsToUint(r1.y), floatBitsToUint(r1.x)));
	r0.yz = -r0.ww + r0.yz;
	r0.y = intBitsToFloat(abs(r0.z) >= abs(r0.y) ? int(0xffffffff) : int(0x00000000));
	r0.z = r1.z * float(254.000000f);
	r0.z = uintBitsToFloat(uint(r0.z));
	r0.z = uintBitsToFloat(floatBitsToUint(r0.z) & uint(0x000000fe));
	r1.xy = intBitsToFloat(ivec2(gl_GlobalInvocationID.yx) << ivec2(21, 8));
	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) | floatBitsToUint(r1.x));
	r0.z = intBitsToFloat(floatBitsToInt(r0.z) + floatBitsToInt(r0.w));
	r1.x = intBitsToFloat(bfi(floatBitsToInt(r0.z), floatBitsToInt(r0.y), int(0), int(1)));
	r2.xy = uintBitsToFloat(gl_GlobalInvocationID.xy);
	r2.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r2.xyz = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r2.xy), int(floatBitsToInt(r2.w))))).xyz;
	r2.xyz = uintBitsToFloat(uvec4(packHalf2x16(vec2(r2.x, 0.0)), packHalf2x16(vec2(r2.y, 0.0)), packHalf2x16(vec2(r2.z, 0.0)), packHalf2x16(vec2(r2.x, 0.0))).xyz);
	if (floatBitsToUint(r0.x) != uint(0))
	{
		r0.x = intBitsToFloat(bfi(int(0), floatBitsToInt(r0.y), int(1), int(1)));
		r3.w = intBitsToFloat(floatBitsToInt(r0.x) + int(gl_GlobalInvocationID.y));
		r3.x = uintBitsToFloat(gl_GlobalInvocationID.x);
		r3.yz = uintBitsToFloat(uvec2(0xffffffff, 0x00000000));
		r3.xy = intBitsToFloat(floatBitsToInt(r3.xy) + floatBitsToInt(r3.zw));
		r3.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r0.xzw = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r3.xy), int(floatBitsToInt(r3.w)))).xwyz).xzw;
		r0.xzw = uintBitsToFloat(uvec4(packHalf2x16(vec2(r0.x, 0.0)), packHalf2x16(vec2(r0.x, 0.0)), packHalf2x16(vec2(r0.z, 0.0)), packHalf2x16(vec2(r0.w, 0.0))).xzw);
		r1.yzw = intBitsToFloat(floatBitsToInt(r0.xzw) * ivec3(65536, 65536, 65536) + floatBitsToInt(r2.xyz));
		r3.x = uintBitsToFloat(atomicCounterIncrement(atomic_counter_u0));
		u0[floatBitsToUint(r3.x) * 4u + uint(0x00000000) / 4u + 0u] = floatBitsToInt(r1.x);
		u0[floatBitsToUint(r3.x) * 4u + uint(0x00000000) / 4u + 1u] = floatBitsToInt(r1.y);
		u0[floatBitsToUint(r3.x) * 4u + uint(0x00000000) / 4u + 2u] = floatBitsToInt(r1.z);
		u0[floatBitsToUint(r3.x) * 4u + uint(0x00000000) / 4u + 3u] = floatBitsToInt(r1.w);
	}
	else
	{
		r0.x = intBitsToFloat(bfi(int(0), floatBitsToInt(r0.y), int(1), int(1)));
		r0.z = intBitsToFloat(floatBitsToInt(r0.x) + int(gl_GlobalInvocationID.x));
		r0.y = uintBitsToFloat(gl_GlobalInvocationID.y);
		r0.xw = uintBitsToFloat(uvec2(0xffffffff, 0x00000000));
		r0.xy = intBitsToFloat(floatBitsToInt(r0.xy) + floatBitsToInt(r0.zw));
		r0.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r0.xyz = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w))))).xyz;
		r0.xyz = uintBitsToFloat(uvec4(packHalf2x16(vec2(r0.x, 0.0)), packHalf2x16(vec2(r0.y, 0.0)), packHalf2x16(vec2(r0.z, 0.0)), packHalf2x16(vec2(r0.x, 0.0))).xyz);
		r1.yzw = intBitsToFloat(floatBitsToInt(r0.xyz) * ivec3(65536, 65536, 65536) + floatBitsToInt(r2.xyz));
		r0.x = uintBitsToFloat(atomicCounterIncrement(atomic_counter_u1));
		u1[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 0u] = floatBitsToInt(r1.x);
		u1[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 1u] = floatBitsToInt(r1.y);
		u1[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 2u] = floatBitsToInt(r1.z);
		u1[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 3u] = floatBitsToInt(r1.w);
	}
	return;
}

