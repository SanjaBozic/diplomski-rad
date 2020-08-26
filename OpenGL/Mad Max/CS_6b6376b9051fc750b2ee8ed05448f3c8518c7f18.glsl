#version 460 core
// cs_5_0
// Checksum: 48dbeda0_c156586a_7b3ba211_2c1e0ff6
// Name: bokehfilteropt

vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14;
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
	r1 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w))));
	r2.x = intBitsToFloat(float(9.99999975e-05f) < r1.w ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r2.x) != uint(0))
	{
		r2.xy = uintBitsToFloat(gl_GlobalInvocationID.xy >> uvec2(0x00000001, 0x00000001));
		r2.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r2.x = ((texelFetch(resourceSamplerPair_1_cs, floatBitsToInt(r2.xy), int(floatBitsToInt(r2.w))))).x;
		r2.x = sqrt(r2.x);
		r2.x = r2.x * float(4.00000000f);
		r2.w = min(r2.x, float(1.00000000f));
		r3.x = r1.w * float(8.00000000f);
		r3.x = max(r3.x, float(1.00000000f));
		r3.x = r3.x * r3.x;
		r4 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(37.0000000f, 34.0000000f, 18.0000000f, 9.00000000f)))));
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-6, 2)));
			r6 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-7, 2)));
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-6, 1)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-7, 1)));
			r9.x = r5.w;
			r9.y = r6.w;
			r9.z = r7.w;
			r9.w = r8.w;
			r9 = -r1.wwww + r9;
			r9 = r9 * r9;
			r9 = r9 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r9 = exp2(r9);
			r9 = max(r2.wwww, r9);
			r10 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(40.0000000f, 53.0000000f, 37.0000000f, 50.0000000f)))));
			r10 = uintBitsToFloat(floatBitsToUint(r10) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r9 = r9 * r10;
			r3.yzw = r6.xyz * r9.yyy;
			r3.yzw = fma(r5.xyz, r9.xxx, r3.yzw);
			r3.yzw = fma(r7.xyz, r9.zzz, r3.yzw);
			r3.yzw = fma(r8.xyz, r9.www, r3.yzw);
			r5.x = dot(r9, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
		}
		else
		{
			r3.yzw = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
			r5.x = uintBitsToFloat(uint(0x00000000));
		}
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r6 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, -5)));
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, -5)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, -6)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, -6)));
			r10.x = r6.w;
			r10.y = r7.w;
			r10.z = r8.w;
			r10.w = r9.w;
			r10 = -r1.wwww + r10;
			r10 = r10 * r10;
			r10 = r10 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r10 = exp2(r10);
			r10 = max(r2.wwww, r10);
			r11 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(34.0000000f, 41.0000000f, 45.0000000f, 52.0000000f)))));
			r11 = uintBitsToFloat(floatBitsToUint(r11) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r10 = r10 * r11;
			r5.yzw = fma(r6.xyz, r10.xxx, r3.yzw);
			r5.yzw = fma(r7.xyz, r10.yyy, r5.yzw);
			r5.yzw = fma(r8.xyz, r10.zzz, r5.yzw);
			r3.yzw = fma(r9.xyz, r10.www, r5.yzw);
			r5.y = dot(r10, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r5.x = r5.y + r5.x;
		}
		if (floatBitsToUint(r4.z) != uint(0))
		{
			r6 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, -3)));
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, -3)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, -4)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, -4)));
			r10.x = r6.w;
			r10.y = r7.w;
			r10.z = r8.w;
			r10.w = r9.w;
			r10 = -r1.wwww + r10;
			r10 = r10 * r10;
			r10 = r10 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r10 = exp2(r10);
			r10 = max(r2.wwww, r10);
			r11 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(18.0000000f, 25.0000000f, 25.0000000f, 32.0000000f)))));
			r11 = uintBitsToFloat(floatBitsToUint(r11) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r10 = r10 * r11;
			r5.yzw = fma(r6.xyz, r10.xxx, r3.yzw);
			r5.yzw = fma(r7.xyz, r10.yyy, r5.yzw);
			r5.yzw = fma(r8.xyz, r10.zzz, r5.yzw);
			r3.yzw = fma(r9.xyz, r10.www, r5.yzw);
			r4.z = dot(r10, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r5.x = r4.z + r5.x;
		}
		if (floatBitsToUint(r4.w) != uint(0))
		{
			r6 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, 1)));
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, 1)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, 0)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, 0)));
			r10.x = r6.w;
			r10.y = r7.w;
			r10.z = r8.w;
			r10.w = r9.w;
			r10 = -r1.wwww + r10;
			r10 = r10 * r10;
			r10 = r10 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r10 = exp2(r10);
			r10 = max(r2.wwww, r10);
			r11 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(10.0000000f, 17.0000000f, 9.00000000f, 16.0000000f)))));
			r11 = uintBitsToFloat(floatBitsToUint(r11) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r10 = r10 * r11;
			r5.yzw = fma(r6.xyz, r10.xxx, r3.yzw);
			r5.yzw = fma(r7.xyz, r10.yyy, r5.yzw);
			r5.yzw = fma(r8.xyz, r10.zzz, r5.yzw);
			r3.yzw = fma(r9.xyz, r10.www, r5.yzw);
			r4.z = dot(r10, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r5.x = r4.z + r5.x;
		}
		r6 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(13.0000000f, 17.0000000f, 5.00000000f, 26.0000000f)))));
		if (floatBitsToUint(r6.x) != uint(0))
		{
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, 3)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, 3)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, 2)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, 2)));
			r11.x = r7.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(18.0000000f, 25.0000000f, 13.0000000f, 20.0000000f)))));
			r12 = uintBitsToFloat(floatBitsToUint(r12) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r12;
			r5.yzw = fma(r7.xyz, r11.xxx, r3.yzw);
			r5.yzw = fma(r8.xyz, r11.yyy, r5.yzw);
			r5.yzw = fma(r9.xyz, r11.zzz, r5.yzw);
			r3.yzw = fma(r10.xyz, r11.www, r5.yzw);
			r4.z = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r5.x = r4.z + r5.x;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, -1)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-5, -1)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, -2)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-5, -2)));
			r11.x = r7.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(17.0000000f, 26.0000000f, 20.0000000f, 29.0000000f)))));
			r12 = uintBitsToFloat(floatBitsToUint(r12) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r12;
			r5.yzw = fma(r7.xyz, r11.xxx, r3.yzw);
			r5.yzw = fma(r8.xyz, r11.yyy, r5.yzw);
			r5.yzw = fma(r9.xyz, r11.zzz, r5.yzw);
			r3.yzw = fma(r10.xyz, r11.www, r5.yzw);
			r4.z = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r5.x = r4.z + r5.x;
		}
		if (floatBitsToUint(r6.z) != uint(0))
		{
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, -1)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, -1)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, -2)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, -2)));
			r11.x = r7.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(5.00000000f, 10.0000000f, 8.00000000f, 13.0000000f)))));
			r12 = uintBitsToFloat(floatBitsToUint(r12) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r12;
			r5.yzw = fma(r7.xyz, r11.xxx, r3.yzw);
			r5.yzw = fma(r8.xyz, r11.yyy, r5.yzw);
			r5.yzw = fma(r9.xyz, r11.zzz, r5.yzw);
			r3.yzw = fma(r10.xyz, r11.www, r5.yzw);
			r4.z = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r5.x = r4.z + r5.x;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, -5)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, -5)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, -6)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, -6)));
			r11.x = r7.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(26.0000000f, 29.0000000f, 37.0000000f, 40.0000000f)))));
			r12 = uintBitsToFloat(floatBitsToUint(r12) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r12;
			r5.yzw = fma(r7.xyz, r11.xxx, r3.yzw);
			r5.yzw = fma(r8.xyz, r11.yyy, r5.yzw);
			r5.yzw = fma(r9.xyz, r11.zzz, r5.yzw);
			r3.yzw = fma(r10.xyz, r11.www, r5.yzw);
			r4.z = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r5.x = r4.z + r5.x;
		}
		r7 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(10.0000000f, 25.0000000f, 16.0000000f, 29.0000000f)))));
		if (floatBitsToUint(r7.x) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, -3)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, -3)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, -4)));
			r11 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, -4)));
			r12.x = r8.w;
			r12.y = r9.w;
			r12.z = r10.w;
			r12.w = r11.w;
			r12 = -r1.wwww + r12;
			r12 = r12 * r12;
			r12 = r12 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r12 = exp2(r12);
			r12 = max(r2.wwww, r12);
			r13 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(10.0000000f, 13.0000000f, 17.0000000f, 20.0000000f)))));
			r13 = uintBitsToFloat(floatBitsToUint(r13) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r12 = r12 * r13;
			r5.yzw = fma(r8.xyz, r12.xxx, r3.yzw);
			r5.yzw = fma(r9.xyz, r12.yyy, r5.yzw);
			r5.yzw = fma(r10.xyz, r12.zzz, r5.yzw);
			r3.yzw = fma(r11.xyz, r12.www, r5.yzw);
			r4.z = dot(r12, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r5.x = r4.z + r5.x;
		}
		r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, 1)));
		r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, 1)));
		r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, 0)));
		r11 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, 0)));
		r12.x = r8.w;
		r12.y = r9.w;
		r12.z = r10.w;
		r12.w = r11.w;
		r12 = -r1.wwww + r12;
		r12 = r12 * r12;
		r12 = r12 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
		r12 = exp2(r12);
		r12 = max(r2.wwww, r12);
		r13 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(1.00000000f, 2.00000000f, 4.00000000f, 5.00000000f)))));
		r14 = uintBitsToFloat(floatBitsToUint(r13) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
		r12 = r12 * r14.ywxz;
		r3.yzw = fma(r8.xyz, r12.xxx, r3.yzw);
		r3.yzw = fma(r9.xyz, r12.yyy, r3.yzw);
		r3.yzw = fma(r10.xyz, r12.zzz, r3.yzw);
		r3.yzw = fma(r11.xyz, r12.www, r3.yzw);
		r4.z = dot(r12, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
		r4.z = r4.z + r5.x;
		if (floatBitsToUint(r6.z) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, 3)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, 3)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, 2)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, 2)));
			r11.x = r5.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(10.0000000f, 13.0000000f, 5.00000000f, 8.00000000f)))));
			r12 = uintBitsToFloat(floatBitsToUint(r12) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r12;
			r5.xyz = fma(r5.xyz, r11.xxx, r3.yzw);
			r5.xyz = fma(r8.xyz, r11.yyy, r5.xyz);
			r5.xyz = fma(r9.xyz, r11.zzz, r5.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r5.xyz);
			r5.x = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.z + r5.x;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, 5)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, 5)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, 4)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, 4)));
			r11.x = r5.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(26.0000000f, 29.0000000f, 17.0000000f, 20.0000000f)))));
			r12 = uintBitsToFloat(floatBitsToUint(r12) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r12;
			r5.xyz = fma(r5.xyz, r11.xxx, r3.yzw);
			r5.xyz = fma(r8.xyz, r11.yyy, r5.xyz);
			r5.xyz = fma(r9.xyz, r11.zzz, r5.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r5.xyz);
			r5.x = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.z + r5.x;
		}
		r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, -1)));
		r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, -1)));
		r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, -2)));
		r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, -2)));
		r11.x = r5.w;
		r11.y = r8.w;
		r11.z = r9.w;
		r11.w = r10.w;
		r11 = -r1.wwww + r11;
		r11 = r11 * r11;
		r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
		r11 = exp2(r11);
		r11 = max(r2.wwww, r11);
		r11 = r14 * r11;
		r3.yzw = fma(r5.xyz, r11.xxx, r3.yzw);
		r3.yzw = fma(r8.xyz, r11.yyy, r3.yzw);
		r3.yzw = fma(r9.xyz, r11.zzz, r3.yzw);
		r3.yzw = fma(r10.xyz, r11.www, r3.yzw);
		r5.x = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
		r4.z = r4.z + r5.x;
		if (floatBitsToUint(r7.y) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, -5)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, -5)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, -6)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, -6)));
			r11.x = r5.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(26.0000000f, 25.0000000f, 37.0000000f, 36.0000000f)))));
			r12 = uintBitsToFloat(floatBitsToUint(r12) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r12;
			r5.xyz = fma(r5.xyz, r11.xxx, r3.yzw);
			r5.xyz = fma(r8.xyz, r11.yyy, r5.xyz);
			r5.xyz = fma(r9.xyz, r11.zzz, r5.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r5.xyz);
			r5.x = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.z + r5.x;
		}
		if (floatBitsToUint(r4.w) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, -3)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, -3)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, -4)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, -4)));
			r11.x = r5.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(10.0000000f, 9.00000000f, 17.0000000f, 16.0000000f)))));
			r12 = uintBitsToFloat(floatBitsToUint(r12) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r12;
			r5.xyz = fma(r5.xyz, r11.xxx, r3.yzw);
			r5.xyz = fma(r8.xyz, r11.yyy, r5.xyz);
			r5.xyz = fma(r9.xyz, r11.zzz, r5.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r5.xyz);
			r4.w = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, 1)));
		r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, 1)));
		r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, 0)));
		r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, 0)));
		r11.x = r5.w;
		r11.y = r8.w;
		r11.z = r9.w;
		r11.w = r10.w;
		r11 = -r1.wwww + r11;
		r11 = r11 * r11;
		r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
		r11 = exp2(r11);
		r11 = max(r2.wwww, r11);
		r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(2.00000000f, 1.00000000f, 0.00000000f, 8.00000000f)))));
		r14 = uintBitsToFloat(floatBitsToUint(r12.xyyz) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
		r11 = r11 * r14;
		r3.yzw = fma(r5.xyz, r11.xxx, r3.yzw);
		r3.yzw = fma(r8.xyz, r11.yyy, r3.yzw);
		r3.yzw = fma(r9.xyz, r11.zzz, r3.yzw);
		r3.yzw = fma(r10.xyz, r11.www, r3.yzw);
		r4.w = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
		r4.z = r4.w + r4.z;
		if (floatBitsToUint(r13.z) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, 3)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, 3)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, 2)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, 2)));
			r11.x = r5.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r14 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(10.0000000f, 9.00000000f, 5.00000000f, 4.00000000f)))));
			r14 = uintBitsToFloat(floatBitsToUint(r14) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r14;
			r5.xyz = fma(r5.xyz, r11.xxx, r3.yzw);
			r5.xyz = fma(r8.xyz, r11.yyy, r5.xyz);
			r5.xyz = fma(r9.xyz, r11.zzz, r5.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r5.xyz);
			r4.w = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r7.z) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, 5)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, 5)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, 4)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, 4)));
			r11.x = r5.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r14 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(26.0000000f, 25.0000000f, 17.0000000f, 16.0000000f)))));
			r14 = uintBitsToFloat(floatBitsToUint(r14) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r14;
			r5.xyz = fma(r5.xyz, r11.xxx, r3.yzw);
			r5.xyz = fma(r8.xyz, r11.yyy, r5.xyz);
			r5.xyz = fma(r9.xyz, r11.zzz, r5.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r5.xyz);
			r4.w = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r13.y) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, -1)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, -1)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, -2)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, -2)));
			r11.x = r5.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r14 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(5.00000000f, 2.00000000f, 8.00000000f, 5.00000000f)))));
			r14 = uintBitsToFloat(floatBitsToUint(r14) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r14;
			r5.xyz = fma(r5.xyz, r11.xxx, r3.yzw);
			r5.xyz = fma(r8.xyz, r11.yyy, r5.xyz);
			r5.xyz = fma(r9.xyz, r11.zzz, r5.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r5.xyz);
			r4.w = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r6.x) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, -3)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, -3)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, -4)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, -4)));
			r11.x = r5.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r14 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(18.0000000f, 13.0000000f, 25.0000000f, 20.0000000f)))));
			r14 = uintBitsToFloat(floatBitsToUint(r14) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r14;
			r5.xyz = fma(r5.xyz, r11.xxx, r3.yzw);
			r5.xyz = fma(r8.xyz, r11.yyy, r5.xyz);
			r5.xyz = fma(r9.xyz, r11.zzz, r5.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r5.xyz);
			r4.w = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r7.w) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, -5)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, -5)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, -6)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, -6)));
			r11.x = r5.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r14 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(34.0000000f, 29.0000000f, 45.0000000f, 40.0000000f)))));
			r14 = uintBitsToFloat(floatBitsToUint(r14) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r14;
			r5.xyz = fma(r5.xyz, r11.xxx, r3.yzw);
			r5.xyz = fma(r8.xyz, r11.yyy, r5.xyz);
			r5.xyz = fma(r9.xyz, r11.zzz, r5.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r5.xyz);
			r4.w = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r13.z) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, 1)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, 1)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, 0)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, 0)));
			r11.x = r5.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r13 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(10.0000000f, 5.00000000f, 9.00000000f, 4.00000000f)))));
			r13 = uintBitsToFloat(floatBitsToUint(r13) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r13;
			r5.xyz = fma(r5.xyz, r11.xxx, r3.yzw);
			r5.xyz = fma(r8.xyz, r11.yyy, r5.xyz);
			r5.xyz = fma(r9.xyz, r11.zzz, r5.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r5.xyz);
			r4.w = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r12.w) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, 3)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, 3)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, 2)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, 2)));
			r11.x = r5.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(18.0000000f, 13.0000000f, 13.0000000f, 8.00000000f)))));
			r12 = uintBitsToFloat(floatBitsToUint(r12) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r12;
			r5.xyz = fma(r5.xyz, r11.xxx, r3.yzw);
			r5.xyz = fma(r8.xyz, r11.yyy, r5.xyz);
			r5.xyz = fma(r9.xyz, r11.zzz, r5.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r5.xyz);
			r4.w = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		r5 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(20.0000000f, 41.0000000f, 50.0000000f, 53.0000000f)))));
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, 5)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, 5)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, 4)));
			r11 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, 4)));
			r12.x = r8.w;
			r12.y = r9.w;
			r12.z = r10.w;
			r12.w = r11.w;
			r12 = -r1.wwww + r12;
			r12 = r12 * r12;
			r12 = r12 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r12 = exp2(r12);
			r12 = max(r2.wwww, r12);
			r13 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(34.0000000f, 29.0000000f, 25.0000000f, 20.0000000f)))));
			r13 = uintBitsToFloat(floatBitsToUint(r13) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r12 = r12 * r13;
			r6.xyz = fma(r8.xyz, r12.xxx, r3.yzw);
			r6.xyz = fma(r9.xyz, r12.yyy, r6.xyz);
			r6.xyz = fma(r10.xyz, r12.zzz, r6.xyz);
			r3.yzw = fma(r11.xyz, r12.www, r6.xyz);
			r4.w = dot(r12, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r7.x) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, -1)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, -1)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, -2)));
			r11 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, -2)));
			r12.x = r8.w;
			r12.y = r9.w;
			r12.z = r10.w;
			r12.w = r11.w;
			r12 = -r1.wwww + r12;
			r12 = r12 * r12;
			r12 = r12 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r12 = exp2(r12);
			r12 = max(r2.wwww, r12);
			r13 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(17.0000000f, 10.0000000f, 20.0000000f, 13.0000000f)))));
			r13 = uintBitsToFloat(floatBitsToUint(r13) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r12 = r12 * r13;
			r6.xyz = fma(r8.xyz, r12.xxx, r3.yzw);
			r6.xyz = fma(r9.xyz, r12.yyy, r6.xyz);
			r6.xyz = fma(r10.xyz, r12.zzz, r6.xyz);
			r3.yzw = fma(r11.xyz, r12.www, r6.xyz);
			r4.w = dot(r12, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r5.y) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(5, -5)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, -5)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(5, -6)));
			r11 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, -6)));
			r12.x = r8.w;
			r12.y = r9.w;
			r12.z = r10.w;
			r12.w = r11.w;
			r12 = -r1.wwww + r12;
			r12 = r12 * r12;
			r12 = r12 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r12 = exp2(r12);
			r12 = max(r2.wwww, r12);
			r13 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(50.0000000f, 41.0000000f, 61.0000000f, 52.0000000f)))));
			r13 = uintBitsToFloat(floatBitsToUint(r13) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r12 = r12 * r13;
			r6.xyz = fma(r8.xyz, r12.xxx, r3.yzw);
			r6.xyz = fma(r9.xyz, r12.yyy, r6.xyz);
			r6.xyz = fma(r10.xyz, r12.zzz, r6.xyz);
			r3.yzw = fma(r11.xyz, r12.www, r6.xyz);
			r4.w = dot(r12, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r7.y) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(5, -3)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, -3)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(5, -4)));
			r11 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, -4)));
			r12.x = r8.w;
			r12.y = r9.w;
			r12.z = r10.w;
			r12.w = r11.w;
			r12 = -r1.wwww + r12;
			r12 = r12 * r12;
			r12 = r12 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r12 = exp2(r12);
			r12 = max(r2.wwww, r12);
			r13 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(34.0000000f, 25.0000000f, 41.0000000f, 32.0000000f)))));
			r13 = uintBitsToFloat(floatBitsToUint(r13) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r12 = r12 * r13;
			r6.xyz = fma(r8.xyz, r12.xxx, r3.yzw);
			r6.xyz = fma(r9.xyz, r12.yyy, r6.xyz);
			r6.xyz = fma(r10.xyz, r12.zzz, r6.xyz);
			r3.yzw = fma(r11.xyz, r12.www, r6.xyz);
			r4.w = dot(r12, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r7.z) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(5, 1)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, 1)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(5, 0)));
			r11 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, 0)));
			r12.x = r8.w;
			r12.y = r9.w;
			r12.z = r10.w;
			r12.w = r11.w;
			r12 = -r1.wwww + r12;
			r12 = r12 * r12;
			r12 = r12 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r12 = exp2(r12);
			r12 = max(r2.wwww, r12);
			r13 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(26.0000000f, 17.0000000f, 25.0000000f, 16.0000000f)))));
			r13 = uintBitsToFloat(floatBitsToUint(r13) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r12 = r12 * r13;
			r6.xyz = fma(r8.xyz, r12.xxx, r3.yzw);
			r6.xyz = fma(r9.xyz, r12.yyy, r6.xyz);
			r6.xyz = fma(r10.xyz, r12.zzz, r6.xyz);
			r3.yzw = fma(r11.xyz, r12.www, r6.xyz);
			r4.w = dot(r12, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(5, 3)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, 3)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(5, 2)));
			r11 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, 2)));
			r12.x = r8.w;
			r12.y = r9.w;
			r12.z = r10.w;
			r12.w = r11.w;
			r12 = -r1.wwww + r12;
			r12 = r12 * r12;
			r12 = r12 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r12 = exp2(r12);
			r12 = max(r2.wwww, r12);
			r13 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(34.0000000f, 25.0000000f, 29.0000000f, 20.0000000f)))));
			r13 = uintBitsToFloat(floatBitsToUint(r13) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r12 = r12 * r13;
			r6.xyz = fma(r8.xyz, r12.xxx, r3.yzw);
			r6.xyz = fma(r9.xyz, r12.yyy, r6.xyz);
			r6.xyz = fma(r10.xyz, r12.zzz, r6.xyz);
			r3.yzw = fma(r11.xyz, r12.www, r6.xyz);
			r4.w = dot(r12, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r6 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(6, -1)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(5, -1)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(6, -2)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(5, -2)));
			r11.x = r6.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(37.0000000f, 26.0000000f, 40.0000000f, 29.0000000f)))));
			r12 = uintBitsToFloat(floatBitsToUint(r12) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r12;
			r6.xyz = fma(r6.xyz, r11.xxx, r3.yzw);
			r6.xyz = fma(r8.xyz, r11.yyy, r6.xyz);
			r6.xyz = fma(r9.xyz, r11.zzz, r6.xyz);
			r3.yzw = fma(r10.xyz, r11.www, r6.xyz);
			r4.w = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r6 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(7, 2)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(6, 2)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(7, 1)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(6, 1)));
			r11.x = r6.w;
			r11.y = r8.w;
			r11.z = r9.w;
			r11.w = r10.w;
			r11 = -r1.wwww + r11;
			r11 = r11 * r11;
			r11 = r11 * vec4(-4.32808495f, -4.32808495f, -4.32808495f, -4.32808495f);
			r11 = exp2(r11);
			r11 = max(r2.wwww, r11);
			r12 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(53.0000000f, 40.0000000f, 50.0000000f, 37.0000000f)))));
			r12 = uintBitsToFloat(floatBitsToUint(r12) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r11 = r11 * r12;
			r6.xyz = fma(r6.xyz, r11.xxx, r3.yzw);
			r6.xyz = fma(r8.xyz, r11.yyy, r6.xyz);
			r6.xyz = fma(r9.xyz, r11.zzz, r6.xyz);
			r6.xyz = fma(r10.xyz, r11.www, r6.xyz);
			r4.w = dot(r11, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
			r4.w = r4.w + r4.z;
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-6, -1)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-6, -2)));
			r10.x = r8.w;
			r10.y = r9.w;
			r7.xz = -r1.ww + r10.xy;
			r7.xz = r7.xz * r7.xz;
			r7.xz = r7.xz * vec2(-4.32808495f, -4.32808495f);
			r7.xz = exp2(r7.xz);
			r7.xz = max(r2.ww, r7.xz);
			r7.xz = r12.wy * r7.xz;
			r6.xyz = fma(r8.xyz, r7.xxx, r6.xyz);
			r3.yzw = fma(r9.xyz, r7.zzz, r6.xyz);
			r5.x = dot(r7.xz, vec2(1.00000000f, 1.00000000f));
			r4.z = r4.w + r5.x;
		}
		if (floatBitsToUint(r5.z) != uint(0))
		{
			r6 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-5, -5)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-5, -6)));
			r9.x = r6.w;
			r9.y = r8.w;
			r7.xz = -r1.ww + r9.xy;
			r7.xz = r7.xz * r7.xz;
			r7.xz = r7.xz * vec2(-4.32808495f, -4.32808495f);
			r7.xz = exp2(r7.xz);
			r7.xz = max(r2.ww, r7.xz);
			r9.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(r3.xx, vec2(50.0000000f, 61.0000000f)))));
			r9.xy = uintBitsToFloat(floatBitsToUint(r9.xy) & uvec2(0x3f800000, 0x3f800000));
			r7.xz = r7.xz * r9.xy;
			r6.xyz = fma(r6.xyz, r7.xxx, r3.yzw);
			r3.yzw = fma(r8.xyz, r7.zzz, r6.xyz);
			r4.w = dot(r7.xz, vec2(1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r6 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-5, -3)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-6, -3)));
			r9.x = r6.w;
			r9.y = r8.w;
			r7.xz = -r1.ww + r9.xy;
			r7.xz = r7.xz * r7.xz;
			r7.xz = r7.xz * vec2(-4.32808495f, -4.32808495f);
			r7.xz = exp2(r7.xz);
			r7.xz = max(r2.ww, r7.xz);
			r9.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(r3.xx, vec2(34.0000000f, 45.0000000f)))));
			r9.xy = uintBitsToFloat(floatBitsToUint(r9.xy) & uvec2(0x3f800000, 0x3f800000));
			r7.xz = r7.xz * r9.xy;
			r6.xyz = fma(r6.xyz, r7.xxx, r3.yzw);
			r3.yzw = fma(r8.xyz, r7.zzz, r6.xyz);
			r4.w = dot(r7.xz, vec2(1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r7.y) != uint(0))
		{
			r6 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-5, 1)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-5, 0)));
			r7.x = r6.w;
			r7.y = r8.w;
			r7.xy = -r1.ww + r7.xy;
			r7.xy = r7.xy * r7.xy;
			r7.xy = r7.xy * vec2(-4.32808495f, -4.32808495f);
			r7.xy = exp2(r7.xy);
			r7.xy = max(r2.ww, r7.xy);
			r9 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(26.0000000f, 25.0000000f, 25.0000000f, 32.0000000f)))));
			r9 = uintBitsToFloat(floatBitsToUint(r9) & uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
			r7.xy = r7.xy * r9.xy;
			r6.xyz = fma(r6.xyz, r7.xxx, r3.yzw);
			r6.xyz = fma(r8.xyz, r7.yyy, r6.xyz);
			r4.w = dot(r7.xy, vec2(1.00000000f, 1.00000000f));
			r4.w = r4.w + r4.z;
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, 4)));
			r10 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, 4)));
			r7.x = r8.w;
			r7.y = r10.w;
			r7.xy = -r1.ww + r7.xy;
			r7.xy = r7.xy * r7.xy;
			r7.xy = r7.xy * vec2(-4.32808495f, -4.32808495f);
			r7.xy = exp2(r7.xy);
			r7.xy = max(r2.ww, r7.xy);
			r7.xy = r9.zw * r7.xy;
			r6.xyz = fma(r8.xyz, r7.xxx, r6.xyz);
			r3.yzw = fma(r10.xyz, r7.yyy, r6.xyz);
			r5.x = dot(r7.xy, vec2(1.00000000f, 1.00000000f));
			r4.z = r4.w + r5.x;
		}
		if (floatBitsToUint(r5.w) != uint(0))
		{
			r6 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, -7)));
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, -7)));
			r7.x = r6.w;
			r7.y = r8.w;
			r5.xw = -r1.ww + r7.xy;
			r5.xw = r5.xw * r5.xw;
			r5.xw = r5.xw * vec2(-4.32808495f, -4.32808495f);
			r5.xw = exp2(r5.xw);
			r5.xw = max(r2.ww, r5.xw);
			r7.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(r3.xx, vec2(53.0000000f, 58.0000000f)))));
			r7.xy = uintBitsToFloat(floatBitsToUint(r7.xy) & uvec2(0x3f800000, 0x3f800000));
			r5.xw = r5.xw * r7.xy;
			r6.xyz = fma(r6.xyz, r5.xxx, r3.yzw);
			r3.yzw = fma(r8.xyz, r5.www, r6.xyz);
			r4.w = dot(r5.xw, vec2(1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		r6 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(greaterThanEqual(r3.xxxx, vec4(49.0000000f, 36.0000000f, 58.0000000f, 65.0000000f)))));
		if (floatBitsToUint(r6.x) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, -7)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, -7)));
			r7.x = r8.w;
			r7.y = r9.w;
			r5.xw = -r1.ww + r7.xy;
			r5.xw = r5.xw * r5.xw;
			r5.xw = r5.xw * vec2(-4.32808495f, -4.32808495f);
			r5.xw = exp2(r5.xw);
			r5.xw = max(r2.ww, r5.xw);
			r7.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(r3.xx, vec2(49.0000000f, 50.0000000f)))));
			r7.xy = uintBitsToFloat(floatBitsToUint(r7.xy) & uvec2(0x3f800000, 0x3f800000));
			r5.xw = r5.xw * r7.xy;
			r7.xyz = fma(r8.xyz, r5.xxx, r3.yzw);
			r3.yzw = fma(r9.xyz, r5.www, r7.xyz);
			r4.w = dot(r5.xw, vec2(1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, 6)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, 6)));
			r7.x = r8.w;
			r7.y = r9.w;
			r5.xw = -r1.ww + r7.xy;
			r5.xw = r5.xw * r5.xw;
			r5.xw = r5.xw * vec2(-4.32808495f, -4.32808495f);
			r5.xw = exp2(r5.xw);
			r5.xw = max(r2.ww, r5.xw);
			r7.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(r3.xx, vec2(37.0000000f, 36.0000000f)))));
			r7.xy = uintBitsToFloat(floatBitsToUint(r7.xy) & uvec2(0x3f800000, 0x3f800000));
			r5.xw = r5.xw * r7.xy;
			r7.xyz = fma(r8.xyz, r5.xxx, r3.yzw);
			r3.yzw = fma(r9.xyz, r5.www, r7.xyz);
			r4.w = dot(r5.xw, vec2(1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r5.z) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, -7)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(1, -7)));
			r7.x = r8.w;
			r7.y = r9.w;
			r5.xz = -r1.ww + r7.xy;
			r5.xz = r5.xz * r5.xz;
			r5.xz = r5.xz * vec2(-4.32808495f, -4.32808495f);
			r5.xz = exp2(r5.xz);
			r5.xz = max(r2.ww, r5.xz);
			r7.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(r3.xx, vec2(53.0000000f, 50.0000000f)))));
			r7.xy = uintBitsToFloat(floatBitsToUint(r7.xy) & uvec2(0x3f800000, 0x3f800000));
			r5.xz = r5.xz * r7.xy;
			r7.xyz = fma(r8.xyz, r5.xxx, r3.yzw);
			r3.yzw = fma(r9.xyz, r5.zzz, r7.xyz);
			r4.w = dot(r5.xz, vec2(1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r6.z) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, -7)));
			r9 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(3, -7)));
			r7.x = r8.w;
			r7.y = r9.w;
			r5.xz = -r1.ww + r7.xy;
			r5.xz = r5.xz * r5.xz;
			r5.xz = r5.xz * vec2(-4.32808495f, -4.32808495f);
			r5.xz = exp2(r5.xz);
			r5.xz = max(r2.ww, r5.xz);
			r7.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(r3.xx, vec2(65.0000000f, 58.0000000f)))));
			r7.xy = uintBitsToFloat(floatBitsToUint(r7.xy) & uvec2(0x3f800000, 0x3f800000));
			r5.xz = r5.xz * r7.xy;
			r7.xyz = fma(r8.xyz, r5.xxx, r3.yzw);
			r3.yzw = fma(r9.xyz, r5.zzz, r7.xyz);
			r4.w = dot(r5.xz, vec2(1.00000000f, 1.00000000f));
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r6.x) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-7, 0)));
			r4.w = -r1.w + r8.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r2.w, r4.w);
			r5.x = r4.w * float(0.419607997f);
			r3.yzw = fma(r8.xyz, r5.xxx, r3.yzw);
			r4.z = fma(r4.w, float(0.419607997f), r4.z);
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r8 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-6, 0)));
			r4.w = -r1.w + r8.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r2.w, r4.w);
			r3.yzw = fma(r8.xyz, r4.www, r3.yzw);
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r5.y) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-5, -4)));
			r4.w = -r1.w + r5.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r2.w, r4.w);
			r3.yzw = fma(r5.xyz, r4.www, r3.yzw);
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r7.w) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-5, 2)));
			r4.w = -r1.w + r5.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r2.w, r4.w);
			r3.yzw = fma(r5.xyz, r4.www, r3.yzw);
			r4.z = r4.w + r4.z;
		}
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-5, 3)));
			r4.y = -r1.w + r5.w;
			r4.y = r4.y * r4.y;
			r4.y = r4.y * float(-4.32808495f);
			r4.y = exp2(r4.y);
			r4.y = max(r2.w, r4.y);
			r5.xyz = fma(r5.xyz, r4.yyy, r3.yzw);
			r4.y = r4.y + r4.z;
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-3, 5)));
			r4.w = -r1.w + r7.w;
			r4.w = r4.w * r4.w;
			r4.w = r4.w * float(-4.32808495f);
			r4.w = exp2(r4.w);
			r4.w = max(r2.w, r4.w);
			r3.yzw = fma(r7.xyz, r4.www, r5.xyz);
			r4.z = r4.w + r4.y;
		}
		if (floatBitsToUint(r6.w) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-4, -7)));
			r4.y = -r1.w + r5.w;
			r4.y = r4.y * r4.y;
			r4.y = r4.y * float(-4.32808495f);
			r4.y = exp2(r4.y);
			r4.y = max(r2.w, r4.y);
			r3.yzw = fma(r5.xyz, r4.yyy, r3.yzw);
			r4.z = r4.y + r4.z;
		}
		r5.xyz = intBitsToFloat(mix ( ivec3(0x00000000),ivec3(0xffffffff),bvec3(greaterThanEqual(r3.xxx, vec3(40.0000000f, 32.0000000f, 45.0000000f)))));
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-2, 6)));
			r3.x = -r1.w + r7.w;
			r3.x = r3.x * r3.x;
			r3.x = r3.x * float(-4.32808495f);
			r3.x = exp2(r3.x);
			r3.x = max(r2.w, r3.x);
			r4.y = r3.x * float(0.803921998f);
			r3.yzw = fma(r7.xyz, r4.yyy, r3.yzw);
			r4.z = fma(r3.x, float(0.803921998f), r4.z);
		}
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(-1, 6)));
			r3.x = -r1.w + r7.w;
			r3.x = r3.x * r3.x;
			r3.x = r3.x * float(-4.32808495f);
			r3.x = exp2(r3.x);
			r3.x = max(r2.w, r3.x);
			r3.yzw = fma(r7.xyz, r3.xxx, r3.yzw);
			r4.z = r3.x + r4.z;
		}
		if (floatBitsToUint(r6.x) != uint(0))
		{
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(0, 7)));
			r3.x = -r1.w + r7.w;
			r3.x = r3.x * r3.x;
			r3.x = r3.x * float(-4.32808495f);
			r3.x = exp2(r3.x);
			r3.x = max(r2.w, r3.x);
			r3.yzw = fma(r7.xyz, r3.xxx, r3.yzw);
			r4.z = r3.x + r4.z;
		}
		if (floatBitsToUint(r5.x) != uint(0))
		{
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(2, 6)));
			r3.x = -r1.w + r7.w;
			r3.x = r3.x * r3.x;
			r3.x = r3.x * float(-4.32808495f);
			r3.x = exp2(r3.x);
			r3.x = max(r2.w, r3.x);
			r4.x = r3.x * float(0.0352942012f);
			r3.yzw = fma(r7.xyz, r4.xxx, r3.yzw);
			r4.z = fma(r3.x, float(0.0352942012f), r4.z);
		}
		if (floatBitsToUint(r5.y) != uint(0))
		{
			r7 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(4, 4)));
			r3.x = -r1.w + r7.w;
			r3.x = r3.x * r3.x;
			r3.x = r3.x * float(-4.32808495f);
			r3.x = exp2(r3.x);
			r3.x = max(r2.w, r3.x);
			r3.yzw = fma(r7.xyz, r3.xxx, r3.yzw);
			r4.z = r3.x + r4.z;
		}
		if (floatBitsToUint(r5.z) != uint(0))
		{
			r5 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(6, -3)));
			r3.x = -r1.w + r5.w;
			r3.x = r3.x * r3.x;
			r3.x = r3.x * float(-4.32808495f);
			r3.x = exp2(r3.x);
			r3.x = max(r2.w, r3.x);
			r4.x = r3.x * float(0.411765009f);
			r3.yzw = fma(r5.xyz, r4.xxx, r3.yzw);
			r4.z = fma(r3.x, float(0.411765009f), r4.z);
		}
		if (floatBitsToUint(r6.y) != uint(0))
		{
			r0 = (texelFetchOffset(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w)), ivec2(6, 0)));
			r0.w = -r1.w + r0.w;
			r0.w = r0.w * r0.w;
			r0.w = r0.w * float(-4.32808495f);
			r0.w = exp2(r0.w);
			r0.w = max(r2.w, r0.w);
			r3.yzw = fma(r0.xyz, r0.www, r3.yzw);
			r4.z = r0.w + r4.z;
		}
		r2.xyz = r3.yzw / r4.zzz;
		r1 = r2;
	}
	else
	{
		r1.w = uintBitsToFloat(uint(0x00000000));
	}
	imageStore(u0, ivec2(gl_GlobalInvocationID.xy), r1);
	return;
}

