#version 460 core
// cs_5_0
// Checksum: a35554c1_027fa222_d7deace1_11d1b7f6
// Name: bokehfilter

vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11;
layout(local_size_x = 32, local_size_y = 8, local_size_z = 1) in;

// Uniform buffer declarations (dcl_constant_buffer)

writeonly uniform restrict image2D u0;

// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_cs; // res0, s-1

uniform sampler2D resourceSamplerPair_1_cs; // res1, s-1


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = uintBitsToFloat(gl_GlobalInvocationID.xy);
	r0.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r0 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w))));
	r1.x = intBitsToFloat(r0.w < float(9.99999975e-05f) ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r1.x) != uint(0))
	{
		r1.xyz = r0.xyz;
		r1.w = uintBitsToFloat(uint(0x00000000));
	}
	else
	{
		r2.xy = intBitsToFloat(ivec2(gl_GlobalInvocationID.xy) >> ivec2(1, 1));
		r2.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r0.x = ((texelFetch(resourceSamplerPair_1_cs, floatBitsToInt(r2.xy), int(floatBitsToInt(r2.w))))).x;
		r0.x = inversesqrt(r0.x);
		r0.x = float(1.00000000f) / r0.x;
		r0.x = r0.x * float(4.00000000f);
		r1.w = min(r0.x, float(1.00000000f));
		r0.x = r0.w * float(8.00000000f);
		r0.x = max(r0.x, float(1.00000000f));
		r0.x = r0.x * r0.x;
		r0.yz = vec2(ivec2(gl_GlobalInvocationID.xy));
		r2 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r0.xxxx, vec4(49.0000000f, 37.0000000f, 36.0000000f, 40.0000000f)))));
		if (floatBitsToUint(r2.x) != uint(0))
		{
			r3.x = r0.z + float(7.00000000f);
			r4.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r4.y = intBitsToFloat(int(r3.x));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r3 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r3.w = -r0.w + r3.w;
			r3.w = r3.w * r3.w;
			r3.w = r3.w * float(-4.32808495f);
			r3.w = exp2(r3.w);
			r3.w = max(r1.w, r3.w);
			r3.xyz = r3.xyz * r3.www;
		}
		else
		{
			r3 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
		}
		if (floatBitsToUint(r2.y) != uint(0))
		{
			r4.xy = r0.yz + vec2(1.00000000f, 6.00000000f);
			r4.xy = intBitsToFloat(ivec2(r4.xy));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r4.w = -r0.w + r4.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r3.xyz = fma(r4.www, r4.xyz, r3.xyz);
			r3.w = r3.w + r4.w;
		}
		if (floatBitsToUint(r2.z) != uint(0))
		{
			r4.x = r0.z + float(6.00000000f);
			r5.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r5.y = intBitsToFloat(int(r4.x));
			r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w))));
			r4.w = -r0.w + r4.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r3.xyz = fma(r4.www, r4.xyz, r3.xyz);
			r3.w = r3.w + r4.w;
		}
		if (floatBitsToUint(r2.w) != uint(0))
		{
			r4.xy = r0.yz + vec2(2.00000000f, 6.00000000f);
			r4.xy = intBitsToFloat(ivec2(r4.xy));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r4.w = -r0.w + r4.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r5.x = r4.w * float(0.0352942012f);
			r3.xyz = fma(r5.xxx, r4.xyz, r3.xyz);
			r3.w = fma(r4.w, float(0.0352942012f), r3.w);
		}
		if (floatBitsToUint(r2.y) != uint(0))
		{
			r4.xy = r0.yz + vec2(-1.00000000f, 6.00000000f);
			r4.xy = intBitsToFloat(ivec2(r4.xy));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r4.w = -r0.w + r4.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r3.xyz = fma(r4.www, r4.xyz, r3.xyz);
			r3.w = r3.w + r4.w;
		}
		if (floatBitsToUint(r2.w) != uint(0))
		{
			r4.xy = r0.yz + vec2(-2.00000000f, 6.00000000f);
			r4.xy = intBitsToFloat(ivec2(r4.xy));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r4.w = -r0.w + r4.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r5.x = r4.w * float(0.803921998f);
			r3.xyz = fma(r5.xxx, r4.xyz, r3.xyz);
			r3.w = fma(r4.w, float(0.803921998f), r3.w);
		}
		r4 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r0.xxxx, vec4(34.0000000f, 29.0000000f, 25.0000000f, 20.0000000f)))));
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r5.xy = r0.yz + vec2(3.00000000f, 5.00000000f);
			r5.xy = intBitsToFloat(ivec2(r5.xy));
			r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r5 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w))));
			r5.w = -r0.w + r5.w;
			r5.w = r5.w * r5.w;
			r5.w = r5.w * float(-4.32808495f);
			r5.w = exp2(r5.w);
			r5.w = max(r1.w, r5.w);
			r3.xyz = fma(r5.www, r5.xyz, r3.xyz);
			r3.w = r3.w + r5.w;
		}
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r5.xy = r0.yz + vec2(2.00000000f, 5.00000000f);
			r5.xy = intBitsToFloat(ivec2(r5.xy));
			r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r5 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w))));
			r5.w = -r0.w + r5.w;
			r5.w = r5.w * r5.w;
			r5.w = r5.w * float(-4.32808495f);
			r5.w = exp2(r5.w);
			r5.w = max(r1.w, r5.w);
			r3.xyz = fma(r5.www, r5.xyz, r3.xyz);
			r3.w = r3.w + r5.w;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r5.xy = r0.yz + vec2(3.00000000f, 4.00000000f);
			r5.xy = intBitsToFloat(ivec2(r5.xy));
			r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r5 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w))));
			r5.w = -r0.w + r5.w;
			r5.w = r5.w * r5.w;
			r5.w = r5.w * float(-4.32808495f);
			r5.w = exp2(r5.w);
			r5.w = max(r1.w, r5.w);
			r3.xyz = fma(r5.www, r5.xyz, r3.xyz);
			r3.w = r3.w + r5.w;
		}
		if (floatBitsToUint(r4.w) != uint(0))
		{
			r5.xy = r0.yz + vec2(2.00000000f, 4.00000000f);
			r5.xy = intBitsToFloat(ivec2(r5.xy));
			r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r5 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w))));
			r5.w = -r0.w + r5.w;
			r5.w = r5.w * r5.w;
			r5.w = r5.w * float(-4.32808495f);
			r5.w = exp2(r5.w);
			r5.w = max(r1.w, r5.w);
			r3.xyz = fma(r5.www, r5.xyz, r3.xyz);
			r3.w = r3.w + r5.w;
		}
		r5 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r0.xxxx, vec4(26.0000000f, 17.0000000f, 16.0000000f, 32.0000000f)))));
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r6.xy = r0.yz + vec2(1.00000000f, 5.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r6.x = r0.z + float(5.00000000f);
			r7.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r7.y = intBitsToFloat(int(r6.x));
			r7.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r7.xy), int(floatBitsToInt(r7.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r5.y) != uint(0))
		{
			r6.xy = r0.yz + vec2(1.00000000f, 4.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r5.z) != uint(0))
		{
			r6.x = r0.z + float(4.00000000f);
			r7.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r7.y = intBitsToFloat(int(r6.x));
			r7.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r7.xy), int(floatBitsToInt(r7.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r6.xy = r0.yz + vec2(-1.00000000f, 5.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r6.xy = r0.yz + vec2(-2.00000000f, 5.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r5.y) != uint(0))
		{
			r6.xy = r0.yz + vec2(-1.00000000f, 4.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r4.w) != uint(0))
		{
			r6.xy = r0.yz + vec2(-2.00000000f, 4.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r6.xy = r0.yz + vec2(-3.00000000f, 5.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r5.w) != uint(0))
		{
			r6.xy = r0.yz + vec2(4.00000000f, 4.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r6.xy = r0.yz + vec2(-3.00000000f, 4.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r5.w) != uint(0))
		{
			r6.xy = r0.yz + vec2(-4.00000000f, 4.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r6.xy = r0.yz + vec2(5.00000000f, 3.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r6.xy = r0.yz + vec2(4.00000000f, 3.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r6.xy = r0.yz + vec2(5.00000000f, 2.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		if (floatBitsToUint(r4.w) != uint(0))
		{
			r6.xy = r0.yz + vec2(4.00000000f, 2.00000000f);
			r6.xy = intBitsToFloat(ivec2(r6.xy));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r6.w = -r0.w + r6.w;
			r6.w = r6.w * r6.w;
			r6.w = r6.w * float(-4.32808495f);
			r6.w = exp2(r6.w);
			r6.w = max(r1.w, r6.w);
			r3.xyz = fma(r6.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r6.w;
		}
		r6 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r0.xxxx, vec4(18.0000000f, 13.0000000f, 8.00000000f, 10.0000000f)))));
		if (floatBitsToUint(r6.x) != uint(0))
		{
			r7.xy = r0.yz + vec2(3.00000000f, 3.00000000f);
			r7.xy = intBitsToFloat(ivec2(r7.xy));
			r7.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r7 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r7.xy), int(floatBitsToInt(r7.w))));
			r7.w = -r0.w + r7.w;
			r7.w = r7.w * r7.w;
			r7.w = r7.w * float(-4.32808495f);
			r7.w = exp2(r7.w);
			r7.w = max(r1.w, r7.w);
			r3.xyz = fma(r7.www, r7.xyz, r3.xyz);
			r3.w = r3.w + r7.w;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r7 = r0.yzyz + vec4(2.00000000f, 3.00000000f, 3.00000000f, 2.00000000f);
			r7 = intBitsToFloat(ivec4(r7.zwxy));
			r8.xy = r7.zw;
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r8.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r8.w = r3.w + r8.w;
			r7.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r7 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r7.xy), int(floatBitsToInt(r7.w))));
			r7.w = -r0.w + r7.w;
			r7.w = r7.w * r7.w;
			r7.w = r7.w * float(-4.32808495f);
			r7.w = exp2(r7.w);
			r7.w = max(r1.w, r7.w);
			r3.xyz = fma(r7.www, r7.xyz, r8.xyz);
			r3.w = r7.w + r8.w;
		}
		if (floatBitsToUint(r6.z) != uint(0))
		{
			r7.xy = r0.yz + vec2(2.00000000f, 2.00000000f);
			r7.xy = intBitsToFloat(ivec2(r7.xy));
			r7.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r7 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r7.xy), int(floatBitsToInt(r7.w))));
			r7.w = -r0.w + r7.w;
			r7.w = r7.w * r7.w;
			r7.w = r7.w * float(-4.32808495f);
			r7.w = exp2(r7.w);
			r7.w = max(r1.w, r7.w);
			r3.xyz = fma(r7.www, r7.xyz, r3.xyz);
			r3.w = r3.w + r7.w;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r7.xy = r0.yz + vec2(1.00000000f, 3.00000000f);
			r7.xy = intBitsToFloat(ivec2(r7.xy));
			r7.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r7 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r7.xy), int(floatBitsToInt(r7.w))));
			r7.w = -r0.w + r7.w;
			r7.w = r7.w * r7.w;
			r7.w = r7.w * float(-4.32808495f);
			r7.w = exp2(r7.w);
			r7.w = max(r1.w, r7.w);
			r3.xyz = fma(r7.www, r7.xyz, r3.xyz);
			r3.w = r3.w + r7.w;
		}
		r7 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r0.xxxx, vec4(9.00000000f, 5.00000000f, 4.00000000f, 53.0000000f)))));
		if (floatBitsToUint(r7.x) != uint(0))
		{
			r8.x = r0.z + float(3.00000000f);
			r9.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r9.y = intBitsToFloat(int(r8.x));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r7.y) != uint(0))
		{
			r8.xy = r0.yz + vec2(1.00000000f, 2.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r7.z) != uint(0))
		{
			r8.x = r0.z + float(2.00000000f);
			r9.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r9.y = intBitsToFloat(int(r8.x));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r8.xy = r0.yz + vec2(-1.00000000f, 3.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r8.xy = r0.yz + vec2(-2.00000000f, 3.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r7.y) != uint(0))
		{
			r8.xy = r0.yz + vec2(-1.00000000f, 2.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r6.z) != uint(0))
		{
			r8.xy = r0.yz + vec2(-2.00000000f, 2.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r6.x) != uint(0))
		{
			r8.xy = r0.yz + vec2(-3.00000000f, 3.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r8.xy = r0.yz + vec2(-4.00000000f, 3.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r8.xy = r0.yz + vec2(-3.00000000f, 2.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r4.w) != uint(0))
		{
			r8.xy = r0.yz + vec2(-4.00000000f, 2.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r8.xy = r0.yz + vec2(-5.00000000f, 3.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r7.w) != uint(0))
		{
			r8.xy = r0.yz + vec2(7.00000000f, 2.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		if (floatBitsToUint(r2.w) != uint(0))
		{
			r8.xy = r0.yz + vec2(6.00000000f, 2.00000000f);
			r8.xy = intBitsToFloat(ivec2(r8.xy));
			r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r8 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
			r8.w = -r0.w + r8.w;
			r8.w = r8.w * r8.w;
			r8.w = r8.w * float(-4.32808495f);
			r8.w = exp2(r8.w);
			r8.w = max(r1.w, r8.w);
			r3.xyz = fma(r8.www, r8.xyz, r3.xyz);
			r3.w = r3.w + r8.w;
		}
		r8 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r0.xxxx, vec4(50.0000000f, 2.00000000f, 45.0000000f, 41.0000000f)))));
		if (floatBitsToUint(r8.x) != uint(0))
		{
			r9.xy = r0.yz + vec2(7.00000000f, 1.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r2.y) != uint(0))
		{
			r9.xy = r0.yz + vec2(6.00000000f, 1.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r9.xy = r0.yz + vec2(-5.00000000f, 2.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r2.w) != uint(0))
		{
			r9.xy = r0.yz + vec2(-6.00000000f, 2.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r7.w) != uint(0))
		{
			r9.xy = r0.yz + vec2(-7.00000000f, 2.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r2.y) != uint(0))
		{
			r9.xy = r0.yz + vec2(-6.00000000f, 1.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r8.x) != uint(0))
		{
			r9.xy = r0.yz + vec2(-7.00000000f, 1.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r9.xy = r0.yz + vec2(5.00000000f, 1.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r5.y) != uint(0))
		{
			r9.xy = r0.yz + vec2(4.00000000f, 1.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r9.x = r0.y + float(5.00000000f);
			r9.x = intBitsToFloat(int(r9.x));
			r9.y = uintBitsToFloat(gl_GlobalInvocationID.y);
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r5.z) != uint(0))
		{
			r9.x = r0.y + float(4.00000000f);
			r9.x = intBitsToFloat(int(r9.x));
			r9.y = uintBitsToFloat(gl_GlobalInvocationID.y);
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r9.xy = r0.yz + vec2(3.00000000f, 1.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r7.y) != uint(0))
		{
			r9.xy = r0.yz + vec2(2.00000000f, 1.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r7.x) != uint(0))
		{
			r9.x = r0.y + float(3.00000000f);
			r9.x = intBitsToFloat(int(r9.x));
			r9.y = uintBitsToFloat(gl_GlobalInvocationID.y);
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r7.z) != uint(0))
		{
			r9.x = r0.y + float(2.00000000f);
			r9.x = intBitsToFloat(int(r9.x));
			r9.y = uintBitsToFloat(gl_GlobalInvocationID.y);
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		if (floatBitsToUint(r8.y) != uint(0))
		{
			r9.xy = r0.yz + vec2(1.00000000f, 1.00000000f);
			r9.xy = intBitsToFloat(ivec2(r9.xy));
			r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r9 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r9.xy), int(floatBitsToInt(r9.w))));
			r9.w = -r0.w + r9.w;
			r9.w = r9.w * r9.w;
			r9.w = r9.w * float(-4.32808495f);
			r9.w = exp2(r9.w);
			r9.w = max(r1.w, r9.w);
			r3.xyz = fma(r9.www, r9.xyz, r3.xyz);
			r3.w = r3.w + r9.w;
		}
		r9 = r0.zyyz + vec4(1.00000000f, 1.00000000f, -1.00000000f, -1.00000000f);
		r10.x = uintBitsToFloat(gl_GlobalInvocationID.x);
		r10.y = intBitsToFloat(int(r9.x));
		r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
		r10.w = -r0.w + r10.w;
		r10.w = r10.w * r10.w;
		r10.w = r10.w * float(-4.32808495f);
		r10.w = exp2(r10.w);
		r10.w = max(r1.w, r10.w);
		r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
		r3.w = r3.w + r10.w;
		r10.x = intBitsToFloat(int(r9.y));
		r10.y = uintBitsToFloat(gl_GlobalInvocationID.y);
		r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
		r10.w = -r0.w + r10.w;
		r10.w = r10.w * r10.w;
		r10.w = r10.w * float(-4.32808495f);
		r10.w = exp2(r10.w);
		r10.w = max(r1.w, r10.w);
		r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
		r3.w = r3.w + r10.w;
		r10.xy = uintBitsToFloat(gl_GlobalInvocationID.xy);
		r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
		r10.w = -r0.w + r10.w;
		r10.w = r10.w * r10.w;
		r10.w = r10.w * float(-4.32808495f);
		r10.w = exp2(r10.w);
		r10.w = max(r1.w, r10.w);
		r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
		r3.w = r3.w + r10.w;
		if (floatBitsToUint(r8.y) != uint(0))
		{
			r10.x = r0.y + float(-1.00000000f);
			r10.x = intBitsToFloat(int(r10.x));
			r10.y = intBitsToFloat(int(r9.x));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r10.w = -r0.w + r10.w;
			r10.w = r10.w * r10.w;
			r10.w = r10.w * float(-4.32808495f);
			r10.w = exp2(r10.w);
			r10.w = max(r1.w, r10.w);
			r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
			r3.w = r3.w + r10.w;
		}
		if (floatBitsToUint(r7.y) != uint(0))
		{
			r10.x = r0.y + float(-2.00000000f);
			r10.x = intBitsToFloat(int(r10.x));
			r10.y = intBitsToFloat(int(r9.x));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r10.w = -r0.w + r10.w;
			r10.w = r10.w * r10.w;
			r10.w = r10.w * float(-4.32808495f);
			r10.w = exp2(r10.w);
			r10.w = max(r1.w, r10.w);
			r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
			r3.w = r3.w + r10.w;
		}
		r10.x = intBitsToFloat(int(r9.z));
		r10.y = uintBitsToFloat(gl_GlobalInvocationID.y);
		r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
		r10.w = -r0.w + r10.w;
		r10.w = r10.w * r10.w;
		r10.w = r10.w * float(-4.32808495f);
		r10.w = exp2(r10.w);
		r10.w = max(r1.w, r10.w);
		r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
		r3.w = r3.w + r10.w;
		if (floatBitsToUint(r7.z) != uint(0))
		{
			r10.x = r0.y + float(-2.00000000f);
			r10.x = intBitsToFloat(int(r10.x));
			r10.y = uintBitsToFloat(gl_GlobalInvocationID.y);
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r10.w = -r0.w + r10.w;
			r10.w = r10.w * r10.w;
			r10.w = r10.w * float(-4.32808495f);
			r10.w = exp2(r10.w);
			r10.w = max(r1.w, r10.w);
			r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
			r3.w = r3.w + r10.w;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r10.x = r0.y + float(-3.00000000f);
			r10.x = intBitsToFloat(int(r10.x));
			r10.y = intBitsToFloat(int(r9.x));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r10.w = -r0.w + r10.w;
			r10.w = r10.w * r10.w;
			r10.w = r10.w * float(-4.32808495f);
			r10.w = exp2(r10.w);
			r10.w = max(r1.w, r10.w);
			r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
			r3.w = r3.w + r10.w;
		}
		if (floatBitsToUint(r5.y) != uint(0))
		{
			r10.x = r0.y + float(-4.00000000f);
			r10.x = intBitsToFloat(int(r10.x));
			r10.y = intBitsToFloat(int(r9.x));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r10.w = -r0.w + r10.w;
			r10.w = r10.w * r10.w;
			r10.w = r10.w * float(-4.32808495f);
			r10.w = exp2(r10.w);
			r10.w = max(r1.w, r10.w);
			r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
			r3.w = r3.w + r10.w;
		}
		if (floatBitsToUint(r7.x) != uint(0))
		{
			r10.x = r0.y + float(-3.00000000f);
			r10.x = intBitsToFloat(int(r10.x));
			r10.y = uintBitsToFloat(gl_GlobalInvocationID.y);
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r10.w = -r0.w + r10.w;
			r10.w = r10.w * r10.w;
			r10.w = r10.w * float(-4.32808495f);
			r10.w = exp2(r10.w);
			r10.w = max(r1.w, r10.w);
			r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
			r3.w = r3.w + r10.w;
		}
		if (floatBitsToUint(r5.z) != uint(0))
		{
			r10.x = r0.y + float(-4.00000000f);
			r10.x = intBitsToFloat(int(r10.x));
			r10.y = uintBitsToFloat(gl_GlobalInvocationID.y);
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r10.w = -r0.w + r10.w;
			r10.w = r10.w * r10.w;
			r10.w = r10.w * float(-4.32808495f);
			r10.w = exp2(r10.w);
			r10.w = max(r1.w, r10.w);
			r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
			r3.w = r3.w + r10.w;
		}
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r10.x = r0.y + float(-5.00000000f);
			r10.x = intBitsToFloat(int(r10.x));
			r10.y = intBitsToFloat(int(r9.x));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r9.x = r0.y + float(-5.00000000f);
			r10.x = intBitsToFloat(int(r9.x));
			r10.y = uintBitsToFloat(gl_GlobalInvocationID.y);
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r2.z) != uint(0))
		{
			r10.xy = r0.yy + vec2(6.00000000f, -6.00000000f);
			r11.x = intBitsToFloat(int(r10.x));
			r11.y = uintBitsToFloat(gl_GlobalInvocationID.y);
			r11.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r11 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r11.xy), int(floatBitsToInt(r11.w))));
			r9.x = -r0.w + r11.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r10.xzw = fma(r9.xxx, r11.xyz, r3.xyz);
			r9.x = r3.w + r9.x;
			r11.x = intBitsToFloat(int(r10.y));
			r11.y = uintBitsToFloat(gl_GlobalInvocationID.y);
			r11.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r11 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r11.xy), int(floatBitsToInt(r11.w))));
			r10.y = -r0.w + r11.w;
			r10.y = r10.y * r10.y;
			r10.y = r10.y * float(-4.32808495f);
			r10.y = exp2(r10.y);
			r10.y = max(r1.w, r10.y);
			r3.xyz = fma(r10.yyy, r11.xyz, r10.xzw);
			r3.w = r9.x + r10.y;
		}
		if (floatBitsToUint(r2.x) != uint(0))
		{
			r9.x = r0.y + float(-7.00000000f);
			r10.x = intBitsToFloat(int(r9.x));
			r10.y = uintBitsToFloat(gl_GlobalInvocationID.y);
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r10.w = r9.x * float(0.419607997f);
			r3.xyz = fma(r10.www, r10.xyz, r3.xyz);
			r3.w = fma(r9.x, float(0.419607997f), r3.w);
		}
		if (floatBitsToUint(r2.y) != uint(0))
		{
			r10.xy = r0.yz + vec2(6.00000000f, -1.00000000f);
			r10.xy = intBitsToFloat(ivec2(r10.xy));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r10.xy = r0.yz + vec2(5.00000000f, -1.00000000f);
			r10.xy = intBitsToFloat(ivec2(r10.xy));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r2.w) != uint(0))
		{
			r10.xy = r0.yz + vec2(6.00000000f, -2.00000000f);
			r10.xy = intBitsToFloat(ivec2(r10.xy));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r10.xy = r0.yz + vec2(5.00000000f, -2.00000000f);
			r10.xy = intBitsToFloat(ivec2(r10.xy));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r5.y) != uint(0))
		{
			r10.xy = r0.yz + vec2(4.00000000f, -1.00000000f);
			r10.xy = intBitsToFloat(ivec2(r10.xy));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r10.xy = r0.yz + vec2(3.00000000f, -1.00000000f);
			r10.xy = intBitsToFloat(ivec2(r10.xy));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r4.w) != uint(0))
		{
			r10.xy = r0.yz + vec2(4.00000000f, -2.00000000f);
			r10.xy = intBitsToFloat(ivec2(r10.xy));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r10.xy = r0.yz + vec2(3.00000000f, -2.00000000f);
			r10.xy = intBitsToFloat(ivec2(r10.xy));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r7.y) != uint(0))
		{
			r10.xy = r0.yz + vec2(2.00000000f, -1.00000000f);
			r10.xy = intBitsToFloat(ivec2(r10.xy));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r8.y) != uint(0))
		{
			r9.x = r0.z + float(-1.00000000f);
			r10.x = intBitsToFloat(int(r9.y));
			r10.y = intBitsToFloat(int(r9.x));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r6.z) != uint(0))
		{
			r10.xy = r0.yz + vec2(2.00000000f, -2.00000000f);
			r10.xy = intBitsToFloat(ivec2(r10.xy));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		if (floatBitsToUint(r7.y) != uint(0))
		{
			r9.x = r0.z + float(-2.00000000f);
			r10.x = intBitsToFloat(int(r9.y));
			r10.y = intBitsToFloat(int(r9.x));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r9.x = -r0.w + r10.w;
			r9.x = r9.x * r9.x;
			r9.x = r9.x * float(-4.32808495f);
			r9.x = exp2(r9.x);
			r9.x = max(r1.w, r9.x);
			r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
			r3.w = r3.w + r9.x;
		}
		r10.x = uintBitsToFloat(gl_GlobalInvocationID.x);
		r10.y = intBitsToFloat(int(r9.w));
		r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
		r9.x = -r0.w + r10.w;
		r9.x = r9.x * r9.x;
		r9.x = r9.x * float(-4.32808495f);
		r9.x = exp2(r9.x);
		r9.x = max(r1.w, r9.x);
		r3.xyz = fma(r9.xxx, r10.xyz, r3.xyz);
		r3.w = r3.w + r9.x;
		if (floatBitsToUint(r8.y) != uint(0))
		{
			r10.xy = intBitsToFloat(ivec2(r9.zw));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r8.y = -r0.w + r10.w;
			r8.y = r8.y * r8.y;
			r8.y = r8.y * float(-4.32808495f);
			r8.y = exp2(r8.y);
			r8.y = max(r1.w, r8.y);
			r3.xyz = fma(r8.yyy, r10.xyz, r3.xyz);
			r3.w = r3.w + r8.y;
		}
		if (floatBitsToUint(r7.z) != uint(0))
		{
			r7.z = r0.z + float(-2.00000000f);
			r10.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r10.y = intBitsToFloat(int(r7.z));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r7.z = -r0.w + r10.w;
			r7.z = r7.z * r7.z;
			r7.z = r7.z * float(-4.32808495f);
			r7.z = exp2(r7.z);
			r7.z = max(r1.w, r7.z);
			r3.xyz = fma(r7.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r7.z;
		}
		if (floatBitsToUint(r7.y) != uint(0))
		{
			r7.yz = r0.zy + vec2(-2.00000000f, -2.00000000f);
			r10.x = intBitsToFloat(int(r9.z));
			r10.y = intBitsToFloat(int(r7.y));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r7.y = -r0.w + r10.w;
			r7.y = r7.y * r7.y;
			r7.y = r7.y * float(-4.32808495f);
			r7.y = exp2(r7.y);
			r7.y = max(r1.w, r7.y);
			r10.xyz = fma(r7.yyy, r10.xyz, r3.xyz);
			r7.y = r3.w + r7.y;
			r11.x = intBitsToFloat(int(r7.z));
			r11.y = intBitsToFloat(int(r9.w));
			r11.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r11 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r11.xy), int(floatBitsToInt(r11.w))));
			r7.z = -r0.w + r11.w;
			r7.z = r7.z * r7.z;
			r7.z = r7.z * float(-4.32808495f);
			r7.z = exp2(r7.z);
			r7.z = max(r1.w, r7.z);
			r3.xyz = fma(r7.zzz, r11.xyz, r10.xyz);
			r3.w = r7.z + r7.y;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r7.y = r0.y + float(-3.00000000f);
			r10.x = intBitsToFloat(int(r7.y));
			r10.y = intBitsToFloat(int(r9.w));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r7.y = -r0.w + r10.w;
			r7.y = r7.y * r7.y;
			r7.y = r7.y * float(-4.32808495f);
			r7.y = exp2(r7.y);
			r7.y = max(r1.w, r7.y);
			r3.xyz = fma(r7.yyy, r10.xyz, r3.xyz);
			r3.w = r3.w + r7.y;
		}
		if (floatBitsToUint(r6.z) != uint(0))
		{
			r7.yz = r0.yz + vec2(-2.00000000f, -2.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r7.yz = r0.yz + vec2(-3.00000000f, -2.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r5.y) != uint(0))
		{
			r6.z = r0.y + float(-4.00000000f);
			r10.x = intBitsToFloat(int(r6.z));
			r10.y = intBitsToFloat(int(r9.w));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r6.z = r0.y + float(-5.00000000f);
			r10.x = intBitsToFloat(int(r6.z));
			r10.y = intBitsToFloat(int(r9.w));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r4.w) != uint(0))
		{
			r7.yz = r0.yz + vec2(-4.00000000f, -2.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r7.yz = r0.yz + vec2(-5.00000000f, -2.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r2.y) != uint(0))
		{
			r6.z = r0.y + float(-6.00000000f);
			r10.x = intBitsToFloat(int(r6.z));
			r10.y = intBitsToFloat(int(r9.w));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r2.w) != uint(0))
		{
			r7.yz = r0.yz + vec2(-6.00000000f, -2.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r8.z) != uint(0))
		{
			r7.yz = r0.yz + vec2(6.00000000f, -3.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r7.y = r6.z * float(0.411765009f);
			r3.xyz = fma(r7.yyy, r10.xyz, r3.xyz);
			r3.w = fma(r6.z, float(0.411765009f), r3.w);
		}
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r7.yz = r0.yz + vec2(5.00000000f, -3.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r7.yz = r0.yz + vec2(4.00000000f, -3.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r8.w) != uint(0))
		{
			r7.yz = r0.yz + vec2(5.00000000f, -4.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r5.w) != uint(0))
		{
			r7.yz = r0.yz + vec2(4.00000000f, -4.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r6.x) != uint(0))
		{
			r7.yz = r0.yz + vec2(3.00000000f, -3.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r7.yz = r0.yz + vec2(2.00000000f, -3.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r7.yz = r0.yz + vec2(3.00000000f, -4.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r4.w) != uint(0))
		{
			r7.yz = r0.yz + vec2(2.00000000f, -4.00000000f);
			r10.xy = intBitsToFloat(ivec2(r7.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r6.z = r0.z + float(-3.00000000f);
			r10.x = intBitsToFloat(int(r9.y));
			r10.y = intBitsToFloat(int(r6.z));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r7.x) != uint(0))
		{
			r6.z = r0.z + float(-3.00000000f);
			r10.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r10.y = intBitsToFloat(int(r6.z));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r5.y) != uint(0))
		{
			r6.z = r0.z + float(-4.00000000f);
			r10.x = intBitsToFloat(int(r9.y));
			r10.y = intBitsToFloat(int(r6.z));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r6.z = -r0.w + r10.w;
			r6.z = r6.z * r6.z;
			r6.z = r6.z * float(-4.32808495f);
			r6.z = exp2(r6.z);
			r6.z = max(r1.w, r6.z);
			r3.xyz = fma(r6.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r6.z;
		}
		if (floatBitsToUint(r5.z) != uint(0))
		{
			r5.z = r0.z + float(-4.00000000f);
			r10.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r10.y = intBitsToFloat(int(r5.z));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r5.z = -r0.w + r10.w;
			r5.z = r5.z * r5.z;
			r5.z = r5.z * float(-4.32808495f);
			r5.z = exp2(r5.z);
			r5.z = max(r1.w, r5.z);
			r3.xyz = fma(r5.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r5.z;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r5.z = r0.z + float(-3.00000000f);
			r10.x = intBitsToFloat(int(r9.z));
			r10.y = intBitsToFloat(int(r5.z));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r5.z = -r0.w + r10.w;
			r5.z = r5.z * r5.z;
			r5.z = r5.z * float(-4.32808495f);
			r5.z = exp2(r5.z);
			r5.z = max(r1.w, r5.z);
			r3.xyz = fma(r5.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r5.z;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r6.yz = r0.yz + vec2(-2.00000000f, -3.00000000f);
			r10.xy = intBitsToFloat(ivec2(r6.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r5.z = -r0.w + r10.w;
			r5.z = r5.z * r5.z;
			r5.z = r5.z * float(-4.32808495f);
			r5.z = exp2(r5.z);
			r5.z = max(r1.w, r5.z);
			r3.xyz = fma(r5.zzz, r10.xyz, r3.xyz);
			r3.w = r3.w + r5.z;
		}
		if (floatBitsToUint(r5.y) != uint(0))
		{
			r5.y = r0.z + float(-4.00000000f);
			r10.x = intBitsToFloat(int(r9.z));
			r10.y = intBitsToFloat(int(r5.y));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r5.y = -r0.w + r10.w;
			r5.y = r5.y * r5.y;
			r5.y = r5.y * float(-4.32808495f);
			r5.y = exp2(r5.y);
			r5.y = max(r1.w, r5.y);
			r3.xyz = fma(r5.yyy, r10.xyz, r3.xyz);
			r3.w = r3.w + r5.y;
		}
		if (floatBitsToUint(r4.w) != uint(0))
		{
			r5.yz = r0.yz + vec2(-2.00000000f, -4.00000000f);
			r10.xy = intBitsToFloat(ivec2(r5.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r4.w = -r0.w + r10.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r3.xyz = fma(r4.www, r10.xyz, r3.xyz);
			r3.w = r3.w + r4.w;
		}
		if (floatBitsToUint(r6.x) != uint(0))
		{
			r5.yz = r0.yz + vec2(-3.00000000f, -3.00000000f);
			r6.xy = intBitsToFloat(ivec2(r5.yz));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r4.w = -r0.w + r6.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r3.xyz = fma(r4.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r4.w;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r6 = r0.yzyz + vec4(-4.00000000f, -3.00000000f, -3.00000000f, -4.00000000f);
			r6 = intBitsToFloat(ivec4(r6.zwxy));
			r10.xy = r6.zw;
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r4.w = -r0.w + r10.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r7.xyz = fma(r4.www, r10.xyz, r3.xyz);
			r4.w = r3.w + r4.w;
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r5.y = -r0.w + r6.w;
			r5.y = r5.y * r5.y;
			r5.y = r5.y * float(-4.32808495f);
			r5.y = exp2(r5.y);
			r5.y = max(r1.w, r5.y);
			r3.xyz = fma(r5.yyy, r6.xyz, r7.xyz);
			r3.w = r4.w + r5.y;
		}
		if (floatBitsToUint(r5.w) != uint(0))
		{
			r5.yz = r0.yz + vec2(-4.00000000f, -4.00000000f);
			r6.xy = intBitsToFloat(ivec2(r5.yz));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r4.w = -r0.w + r6.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r3.xyz = fma(r4.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r4.w;
		}
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r5.yz = r0.yz + vec2(-5.00000000f, -3.00000000f);
			r6.xy = intBitsToFloat(ivec2(r5.yz));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r4.w = -r0.w + r6.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r3.xyz = fma(r4.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r4.w;
		}
		if (floatBitsToUint(r8.z) != uint(0))
		{
			r5.yz = r0.yz + vec2(-6.00000000f, -3.00000000f);
			r6.xy = intBitsToFloat(ivec2(r5.yz));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r4.w = -r0.w + r6.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r3.xyz = fma(r4.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r4.w;
		}
		if (floatBitsToUint(r8.w) != uint(0))
		{
			r5.yz = r0.yz + vec2(-5.00000000f, -4.00000000f);
			r6.xy = intBitsToFloat(ivec2(r5.yz));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r4.w = -r0.w + r6.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r3.xyz = fma(r4.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r4.w;
		}
		if (floatBitsToUint(r8.x) != uint(0))
		{
			r5.yz = r0.yz + vec2(5.00000000f, -5.00000000f);
			r6.xy = intBitsToFloat(ivec2(r5.yz));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r4.w = -r0.w + r6.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r3.xyz = fma(r4.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r4.w;
		}
		if (floatBitsToUint(r8.w) != uint(0))
		{
			r5.yz = r0.yz + vec2(4.00000000f, -5.00000000f);
			r6.xy = intBitsToFloat(ivec2(r5.yz));
			r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r6 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w))));
			r4.w = -r0.w + r6.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r1.w, r4.w);
			r3.xyz = fma(r4.www, r6.xyz, r3.xyz);
			r3.w = r3.w + r4.w;
		}
		r6 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r0.xxxx, vec4(61.0000000f, 52.0000000f, 65.0000000f, 58.0000000f)))));
		if (floatBitsToUint(r6.x) != uint(0))
		{
			r5.yz = r0.yz + vec2(5.00000000f, -6.00000000f);
			r10.xy = intBitsToFloat(ivec2(r5.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r0.x = -r0.w + r10.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r10.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r5.yz = r0.yz + vec2(4.00000000f, -6.00000000f);
			r10.xy = intBitsToFloat(ivec2(r5.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r0.x = -r0.w + r10.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r10.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r5.yz = r0.yz + vec2(3.00000000f, -5.00000000f);
			r10.xy = intBitsToFloat(ivec2(r5.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r0.x = -r0.w + r10.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r10.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r5.yz = r0.yz + vec2(2.00000000f, -5.00000000f);
			r10.xy = intBitsToFloat(ivec2(r5.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r0.x = -r0.w + r10.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r10.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r8.z) != uint(0))
		{
			r5.yz = r0.yz + vec2(3.00000000f, -6.00000000f);
			r10.xy = intBitsToFloat(ivec2(r5.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r0.x = -r0.w + r10.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r10.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r2.w) != uint(0))
		{
			r5.yz = r0.yz + vec2(2.00000000f, -6.00000000f);
			r10.xy = intBitsToFloat(ivec2(r5.yz));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r0.x = -r0.w + r10.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r10.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r0.x = r0.z + float(-5.00000000f);
			r10.x = intBitsToFloat(int(r9.y));
			r10.y = intBitsToFloat(int(r0.x));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r0.x = -r0.w + r10.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r10.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r0.x = r0.z + float(-5.00000000f);
			r10.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r10.y = intBitsToFloat(int(r0.x));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r0.x = -r0.w + r10.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r10.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r2.y) != uint(0))
		{
			r0.x = r0.z + float(-6.00000000f);
			r10.x = intBitsToFloat(int(r9.y));
			r10.y = intBitsToFloat(int(r0.x));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r0.x = -r0.w + r10.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r10.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r2.z) != uint(0))
		{
			r0.x = r0.z + float(-6.00000000f);
			r10.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r10.y = intBitsToFloat(int(r0.x));
			r10.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r10 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r10.xy), int(floatBitsToInt(r10.w))));
			r0.x = -r0.w + r10.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r10.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r0.x = r0.z + float(-5.00000000f);
			r5.x = intBitsToFloat(int(r9.z));
			r5.y = intBitsToFloat(int(r0.x));
			r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r5 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w))));
			r0.x = -r0.w + r5.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r5.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r4.yz = r0.yz + vec2(-2.00000000f, -5.00000000f);
			r5.xy = intBitsToFloat(ivec2(r4.yz));
			r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r5 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w))));
			r0.x = -r0.w + r5.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r5.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r2.y) != uint(0))
		{
			r0.x = r0.z + float(-6.00000000f);
			r5.x = intBitsToFloat(int(r9.z));
			r5.y = intBitsToFloat(int(r0.x));
			r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r5 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w))));
			r0.x = -r0.w + r5.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r5.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r2.w) != uint(0))
		{
			r2.yz = r0.yz + vec2(-2.00000000f, -6.00000000f);
			r5.xy = intBitsToFloat(ivec2(r2.yz));
			r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r5 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w))));
			r0.x = -r0.w + r5.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r5.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r2.yz = r0.yz + vec2(-3.00000000f, -5.00000000f);
			r4.xy = intBitsToFloat(ivec2(r2.yz));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r0.x = -r0.w + r4.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r4.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r8.w) != uint(0))
		{
			r2.yz = r0.yz + vec2(-4.00000000f, -5.00000000f);
			r4.xy = intBitsToFloat(ivec2(r2.yz));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r0.x = -r0.w + r4.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r4.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r8.z) != uint(0))
		{
			r2.yz = r0.yz + vec2(-3.00000000f, -6.00000000f);
			r4.xy = intBitsToFloat(ivec2(r2.yz));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r0.x = -r0.w + r4.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r4.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r2.yz = r0.yz + vec2(-4.00000000f, -6.00000000f);
			r4.xy = intBitsToFloat(ivec2(r2.yz));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r0.x = -r0.w + r4.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r4.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r8.x) != uint(0))
		{
			r2.yz = r0.yz + vec2(-5.00000000f, -5.00000000f);
			r4.xy = intBitsToFloat(ivec2(r2.yz));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r0.x = -r0.w + r4.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r4.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r6.x) != uint(0))
		{
			r2.yz = r0.yz + vec2(-5.00000000f, -6.00000000f);
			r4.xy = intBitsToFloat(ivec2(r2.yz));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r0.x = -r0.w + r4.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r4.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r6.z) != uint(0))
		{
			r2.yz = r0.yz + vec2(4.00000000f, -7.00000000f);
			r4.xy = intBitsToFloat(ivec2(r2.yz));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r0.x = -r0.w + r4.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r4.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r2.yz = r0.yz + vec2(3.00000000f, -7.00000000f);
			r4.xy = intBitsToFloat(ivec2(r2.yz));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r0.x = -r0.w + r4.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r4.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r7.w) != uint(0))
		{
			r2.yz = r0.yz + vec2(2.00000000f, -7.00000000f);
			r4.xy = intBitsToFloat(ivec2(r2.yz));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r0.x = -r0.w + r4.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r4.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r8.x) != uint(0))
		{
			r0.x = r0.z + float(-7.00000000f);
			r4.x = intBitsToFloat(int(r9.y));
			r4.y = intBitsToFloat(int(r0.x));
			r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r4 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))));
			r0.x = -r0.w + r4.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r4.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r2.x) != uint(0))
		{
			r0.x = r0.z + float(-7.00000000f);
			r2.x = uintBitsToFloat(gl_GlobalInvocationID.x);
			r2.y = intBitsToFloat(int(r0.x));
			r2.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r2 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r2.xy), int(floatBitsToInt(r2.w))));
			r0.x = -r0.w + r2.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r2.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r8.x) != uint(0))
		{
			r0.x = r0.z + float(-7.00000000f);
			r2.x = intBitsToFloat(int(r9.z));
			r2.y = intBitsToFloat(int(r0.x));
			r2.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r2 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r2.xy), int(floatBitsToInt(r2.w))));
			r0.x = -r0.w + r2.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r2.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r7.w) != uint(0))
		{
			r2.xy = r0.yz + vec2(-2.00000000f, -7.00000000f);
			r2.xy = intBitsToFloat(ivec2(r2.xy));
			r2.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r2 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r2.xy), int(floatBitsToInt(r2.w))));
			r0.x = -r0.w + r2.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r2.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r2.xy = r0.yz + vec2(-3.00000000f, -7.00000000f);
			r2.xy = intBitsToFloat(ivec2(r2.xy));
			r2.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r2 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r2.xy), int(floatBitsToInt(r2.w))));
			r0.x = -r0.w + r2.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r2.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		if (floatBitsToUint(r6.z) != uint(0))
		{
			r0.xy = r0.yz + vec2(-4.00000000f, -7.00000000f);
			r2.xy = intBitsToFloat(ivec2(r0.xy));
			r2.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
			r2 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r2.xy), int(floatBitsToInt(r2.w))));
			r0.x = -r0.w + r2.w;
			r0.x = r0.x * r0.x;
			r0.x = r0.x * float(-4.32808495f);
			r0.x = exp2(r0.x);
			r0.x = max(r1.w, r0.x);
			r3.xyz = fma(r0.xxx, r2.xyz, r3.xyz);
			r3.w = r0.x + r3.w;
		}
		r0.x = float(1.00000000f) / r3.w;
		r1.xyz = r0.xxx * r3.xyz;
	}
	imageStore(u0, ivec2(gl_GlobalInvocationID.xy), r1);
	return;
}

