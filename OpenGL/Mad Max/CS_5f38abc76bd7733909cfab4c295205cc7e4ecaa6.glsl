#version 460 core
// cs_5_0
// Checksum: a34018a5_53ad470b_70007b20_bde083d1
// Name: fxaaresolveworkqueuecs

vec4 r0, r1;
shared uint g0[1];
shared uint g1[1];
layout(local_size_x = 64, local_size_y = 1, local_size_z = 1) in;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std430) restrict writeonly buffer u0_cs { uint u0[]; };
layout (std430) restrict writeonly buffer u1_cs { uint u1[]; };
layout (std430) restrict writeonly buffer u2_cs { uint u2[]; };
layout (binding = 0) uniform atomic_uint atomic_counter_u0;
layout (binding = 1) uniform atomic_uint atomic_counter_u1;

void Initialise()
{
}


void main()
{
	Initialise();
	if (gl_LocalInvocationIndex == uint(0))
	{
		r0.x = uintBitsToFloat(atomicCounterIncrement(atomic_counter_u0));
		g0[uint(0x00000000) / 4u + 0u] = floatBitsToUint(r0.x);
		r0.x = uintBitsToFloat(atomicCounterIncrement(atomic_counter_u1));
		g1[uint(0x00000000) / 4u + 0u] = floatBitsToUint(r0.x);
	}
	barrier();
	r0.x = uintBitsToFloat(g0[uint(0x00000000) / 4u + 0u]);
	r0.y = intBitsToFloat(floatBitsToInt(r0.x) + int(63));
	r0.z = uintBitsToFloat(floatBitsToUint(r0.y) & uint(0xffffffc0));
	r0.w = uintBitsToFloat(g1[uint(0x00000000) / 4u + 0u]);
	r1.x = intBitsToFloat(floatBitsToInt(r0.w) + int(63));
	r1.y = uintBitsToFloat(floatBitsToUint(r1.x) & uint(0xffffffc0));
	r1.z = intBitsToFloat(int(gl_LocalInvocationIndex) + floatBitsToInt(r0.x));
	r0.z = intBitsToFloat(floatBitsToUint(r1.z) < floatBitsToUint(r0.z) ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r0.z) != uint(0))
	{
		r0.x = intBitsToFloat(floatBitsToInt(r0.x) + int(gl_LocalInvocationIndex));
		u0[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 0u] = int(uint(0xffffffff));
		u0[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 1u] = int(uint(0xffffffff));
		u0[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 2u] = int(uint(0xffffffff));
		u0[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 3u] = int(uint(0xffffffff));
	}
	r0.x = intBitsToFloat(int(gl_LocalInvocationIndex) + floatBitsToInt(r0.w));
	r0.x = intBitsToFloat(floatBitsToUint(r0.x) < floatBitsToUint(r1.y) ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r0.x) != uint(0))
	{
		r0.x = intBitsToFloat(floatBitsToInt(r0.w) + int(gl_LocalInvocationIndex));
		u1[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 0u] = int(uint(0xffffffff));
		u1[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 1u] = int(uint(0xffffffff));
		u1[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 2u] = int(uint(0xffffffff));
		u1[floatBitsToUint(r0.x) * 4u + uint(0x00000000) / 4u + 3u] = int(uint(0xffffffff));
	}
	if (gl_LocalInvocationIndex == uint(0))
	{
		r0.x = uintBitsToFloat(floatBitsToUint(r0.y) >> uint(0x00000006));
		r0.yz = uintBitsToFloat(uvec2(0x00000001, 0x00000001));
		u2[uint(0x00000000) / 4u + 0u] = floatBitsToInt(r0.x);
		u2[uint(0x00000000) / 4u + 1u] = floatBitsToInt(r0.y);
		u2[uint(0x00000000) / 4u + 2u] = floatBitsToInt(r0.z);
		r0.x = uintBitsToFloat(floatBitsToUint(r1.x) >> uint(0x00000006));
		r0.yz = uintBitsToFloat(uvec2(0x00000001, 0x00000001));
		u2[uint(0x0000000c) / 4u + 0u] = floatBitsToInt(r0.x);
		u2[uint(0x0000000c) / 4u + 1u] = floatBitsToInt(r0.y);
		u2[uint(0x0000000c) / 4u + 2u] = floatBitsToInt(r0.z);
	}
	return;
}

