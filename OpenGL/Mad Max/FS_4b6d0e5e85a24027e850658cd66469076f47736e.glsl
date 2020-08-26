#version 460 core
// ps_5_0
// Checksum: 063df87c_e51980ff_3d01d743_d3047b8a
// Name: fastter_lod0cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res3, s3

uniform sampler2D resourceSamplerPair_1_ps; // res4, s4

uniform sampler2D resourceSamplerPair_2_ps; // res6, s6

uniform sampler2DArray resourceSamplerPair_3_ps; // res7, s7

uniform sampler2DArray resourceSamplerPair_4_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_5_ps; // res9, s9

uniform sampler2D resourceSamplerPair_6_ps; // res12, s12

uniform sampler2D resourceSamplerPair_7_ps; // res11, s11

uniform sampler2D resourceSamplerPair_8_ps; // res13, s13


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v2.v.xz * idx_uniforms1_ps.cb1[4].zz;
	r1.xy = dFdxCoarse(v2.v.xz);
	r1.zw = dFdyCoarse(v2.v.xz);
	r1.x = dot(r1, r1);
	r1.x = log2(r1.x);
	r1.x = fma(r1.x, float(0.500000000f), float(6.50000000f));
	r1.x = min(r1.x, float(6.00000000f));
	r2.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r3 = (texture(resourceSamplerPair_1_ps, v1.v.xy));
	r3 = r3 * vec4(15.0000000f, 15.0000000f, 15.0000000f, 15.0000000f);
	r3 = roundEven(r3);
	r1.y = saturate(dot(r2.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r2.w = -r1.y + float(1.00000000f);
	r3 = fma(idx_uniforms1_ps.cb1[1].xxxx, vec4(16.0000000f, 16.0000000f, 16.0000000f, 16.0000000f), r3.xzwy);
	r1.y = dot(r2, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r2 = r2 / r1.yyyy;
	r4 = r3.xywz * vec4(0.00784313772f, 0.00784313772f, 0.00784313772f, 0.00784313772f);
	r5.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r5.yw = r4.xz;
	r1.yz = ((texture(resourceSamplerPair_2_ps, r5.xy)).yxzw).yz;
	r5.xy = ((texture(resourceSamplerPair_2_ps, r5.zw)).xzyw).xy;
	r4.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r4.xy = ((texture(resourceSamplerPair_2_ps, r4.xy)).xzyw).xy;
	r4.zw = ((texture(resourceSamplerPair_2_ps, r4.zw)).ywxz).zw;
	r6.x = uintBitsToFloat(uint(0x3c800000));
	r6.yz = r3.xw;
	r6.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r6.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r3.x = uintBitsToFloat(uint(0x3c800000));
	r3.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r3.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r7.x = ((texture(resourceSamplerPair_2_ps, r6.xy)).yxzw).x;
	r7.y = ((texture(resourceSamplerPair_2_ps, r6.xz))).y;
	r7.z = ((texture(resourceSamplerPair_2_ps, r3.xy)).xzyw).z;
	r7.w = ((texture(resourceSamplerPair_2_ps, r3.xz)).xzwy).w;
	r3 = r7 * vec4(255.000000f, 255.000000f, 255.000000f, 255.000000f);
	r3 = roundEven(r3);
	r6.x = r1.z;
	r6.y = r5.y;
	r6.zw = r4.yw;
	r6 = r2 * r6;
	r6 = r6 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r1.z = dot(v4.v.xyz, v4.v.xyz);
	r1.z = inversesqrt(r1.z);
	r5.yzw = r1.zzz * v4.v.xyz;
	r7.xyz = r5.wyz * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r7.xyz = fma(r5.zwy, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r7.xyz);
	r1.w = dot(r7.xy, r7.xy);
	r1.w = inversesqrt(r1.w);
	r7.xyz = r1.www * r7.xyz;
	r1.w = dot(r7.xy, r5.yz);
	r7.xyz = fma(-r5.yzw, r1.www, r7.xyz);
	r1.w = dot(r7.xyz, r7.xyz);
	r1.w = inversesqrt(r1.w);
	r7.xyz = r1.www * r7.xyz;
	r8.xyz = r5.wyz * r7.yzx;
	r8.xyz = fma(r5.zwy, r7.zxy, -r8.xyz);
	r9.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r1.w = dot(r9.xyz, r9.xyz);
	r1.w = inversesqrt(r1.w);
	r9.xyz = r1.www * r9.xyz;
	r7.x = dot(-r7.xyz, r9.xyz);
	r7.y = dot(r8.xyz, r9.xyz);
	r1.w = dot(-r5.yzw, r9.xyz);
	r4.y = max(-r1.w, float(0.500000000f));
	r4.y = float(8.00000000f) / r4.y;
	r4.y = max(r4.y, float(1.00000000f));
	r4.w = float(1.00000000f) / r4.y;
	r1.w = min(r1.w, float(-0.200000003f));
	r1.w = r1.w * r4.y;
	r7.xy = r7.xy / r1.ww;
	r8 = r2 + vec4(-0.400000006f, -0.400000006f, -0.400000006f, -0.400000006f);
	r8 = saturate(r8 * vec4(6.00000000f, 6.00000000f, 6.00000000f, 6.00000000f));
	r9 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(lessThan(vec4(0.400000006f, 0.400000006f, 0.400000006f, 0.400000006f), r2))));
	if (floatBitsToUint(r9.x) != uint(0))
	{
		r1.y = r1.y * r8.x;
		r1.y = r1.y * float(0.0799999982f);
		r7.zw = r1.yy * r7.xy;
		r7.zw = r4.yy * r7.zw;
		r10.xy = fma(-r7.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r11.z = r3.x;
		r11.xy = r10.xy;
		r1.w = uintBitsToFloat(uint(0x3f800000));
		r8.x = uintBitsToFloat(uint(0x00000000));
		r9.x = uintBitsToFloat(uint(0x00000000));
		r10.z = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r10.w = intBitsToFloat(r10.z < r4.y ? int(0xffffffff) : int(0x00000000));
			r11.w = intBitsToFloat(r8.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r10.w = uintBitsToFloat(floatBitsToUint(r10.w) & floatBitsToUint(r11.w));
			if (floatBitsToUint(r10.w) == uint(0))
				break;
			r1.w = -r4.w + r1.w;
			r11.xy = fma(r7.xy, r1.yy, r11.xy);
			r10.w = ((textureLod(resourceSamplerPair_3_ps, r11.xyz, r1.x))).w;
			r10.z = r10.z + float(1.00000000f);
			r9.x = r8.x;
			r8.x = r10.w;
		}
		r1.y = r4.w + r1.w;
		r8.x = r1.w + -r8.x;
		r9.x = -r9.x + r1.y;
		r1.y = r1.y * r8.x;
		r1.y = fma(r1.w, r9.x, -r1.y);
		r1.w = -r8.x + r9.x;
		r1.y = r1.y / r1.w;
		r1.y = -r1.y + float(1.00000000f);
		r0.xy = fma(r1.yy, r7.zw, r10.xy);
	}
	if (floatBitsToUint(r9.y) != uint(0))
	{
		r1.y = r5.x * r8.y;
		r1.y = r1.y * float(0.0799999982f);
		r7.zw = r1.yy * r7.xy;
		r7.zw = r4.yy * r7.zw;
		r8.xy = fma(-r7.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r10.z = r3.y;
		r10.xy = r8.xy;
		r1.w = uintBitsToFloat(uint(0x3f800000));
		r5.x = uintBitsToFloat(uint(0x00000000));
		r9.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r10.w = intBitsToFloat(r9.y < r4.y ? int(0xffffffff) : int(0x00000000));
			r11.x = intBitsToFloat(r5.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r10.w = uintBitsToFloat(floatBitsToUint(r10.w) & floatBitsToUint(r11.x));
			if (floatBitsToUint(r10.w) == uint(0))
				break;
			r1.w = -r4.w + r1.w;
			r10.xy = fma(r7.xy, r1.yy, r10.xy);
			r10.w = ((textureLod(resourceSamplerPair_3_ps, r10.xyz, r1.x))).w;
			r9.y = r9.y + float(1.00000000f);
			r9.x = r5.x;
			r5.x = r10.w;
		}
		r1.y = r4.w + r1.w;
		r5.x = r1.w + -r5.x;
		r9.x = -r9.x + r1.y;
		r1.y = r1.y * r5.x;
		r1.y = fma(r1.w, r9.x, -r1.y);
		r1.w = -r5.x + r9.x;
		r1.y = r1.y / r1.w;
		r1.y = -r1.y + float(1.00000000f);
		r0.xy = fma(r1.yy, r7.zw, r8.xy);
	}
	if (floatBitsToUint(r9.z) != uint(0))
	{
		r1.y = r4.x * r8.z;
		r1.y = r1.y * float(0.0799999982f);
		r7.zw = r1.yy * r7.xy;
		r7.zw = r4.yy * r7.zw;
		r8.xy = fma(-r7.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r9.z = r3.z;
		r9.xy = r8.xy;
		r1.w = uintBitsToFloat(uint(0x3f800000));
		r4.x = uintBitsToFloat(uint(0x00000000));
		r5.x = uintBitsToFloat(uint(0x00000000));
		r8.z = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r10.x = intBitsToFloat(r8.z < r4.y ? int(0xffffffff) : int(0x00000000));
			r10.y = intBitsToFloat(r4.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r10.x = uintBitsToFloat(floatBitsToUint(r10.y) & floatBitsToUint(r10.x));
			if (floatBitsToUint(r10.x) == uint(0))
				break;
			r1.w = -r4.w + r1.w;
			r9.xy = fma(r7.xy, r1.yy, r9.xy);
			r10.x = ((textureLod(resourceSamplerPair_3_ps, r9.xyz, r1.x)).wxyz).x;
			r8.z = r8.z + float(1.00000000f);
			r5.x = r4.x;
			r4.x = r10.x;
		}
		r1.y = r4.w + r1.w;
		r4.x = r1.w + -r4.x;
		r5.x = -r5.x + r1.y;
		r1.y = r1.y * r4.x;
		r1.y = fma(r1.w, r5.x, -r1.y);
		r1.w = -r4.x + r5.x;
		r1.y = r1.y / r1.w;
		r1.y = -r1.y + float(1.00000000f);
		r0.xy = fma(r1.yy, r7.zw, r8.xy);
	}
	if (floatBitsToUint(r9.w) != uint(0))
	{
		r1.y = r4.z * r8.w;
		r1.y = r1.y * float(0.0799999982f);
		r4.xz = r1.yy * r7.xy;
		r4.xz = r4.yy * r4.xz;
		r7.zw = fma(-r4.xz, vec2(0.500000000f, 0.500000000f), r0.xy);
		r8.z = r3.w;
		r8.xy = r7.zw;
		r1.w = uintBitsToFloat(uint(0x3f800000));
		r5.x = uintBitsToFloat(uint(0x00000000));
		r8.w = uintBitsToFloat(uint(0x00000000));
		r9.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r9.y = intBitsToFloat(r9.x < r4.y ? int(0xffffffff) : int(0x00000000));
			r9.z = intBitsToFloat(r5.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r9.z) & floatBitsToUint(r9.y));
			if (floatBitsToUint(r9.y) == uint(0))
				break;
			r1.w = -r4.w + r1.w;
			r8.xy = fma(r7.xy, r1.yy, r8.xy);
			r9.y = ((textureLod(resourceSamplerPair_3_ps, r8.xyz, r1.x)).xwyz).y;
			r9.x = r9.x + float(1.00000000f);
			r8.w = r5.x;
			r5.x = r9.y;
		}
		r1.x = r4.w + r1.w;
		r1.y = r1.w + -r5.x;
		r4.y = -r8.w + r1.x;
		r1.x = r1.y * r1.x;
		r1.x = fma(r1.w, r4.y, -r1.x);
		r1.y = -r1.y + r4.y;
		r1.x = r1.x / r1.y;
		r1.x = -r1.x + float(1.00000000f);
		r0.xy = fma(r1.xx, r4.xz, r7.zw);
	}
	r0.zw = r3.xy;
	r1.xy = ((texture(resourceSamplerPair_4_ps, r0.xyz)).ywxz).xy;
	r1.xy = fma(r1.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.z = ((texture(resourceSamplerPair_5_ps, r0.xyz)).xywz).z;
	r4.xy = ((texture(resourceSamplerPair_4_ps, r0.xyw)).ywxz).xy;
	r4.xy = fma(r4.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.xy = r4.xy * r6.yy;
	r1.xy = fma(r6.xx, r1.xy, r4.xy);
	r0.w = ((texture(resourceSamplerPair_5_ps, r0.xyw))).w;
	r0.w = r0.w * r2.y;
	r0.z = fma(r2.x, r0.z, r0.w);
	r3.xy = r0.xy;
	r2.xy = ((texture(resourceSamplerPair_4_ps, r3.xyz)).ywxz).xy;
	r2.xy = fma(r2.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xy = fma(r6.zz, r2.xy, r1.xy);
	r0.w = ((texture(resourceSamplerPair_5_ps, r3.xyz))).w;
	r0.z = fma(r2.z, r0.w, r0.z);
	r2.xy = ((texture(resourceSamplerPair_4_ps, r3.xyw)).ywxz).xy;
	r2.xy = fma(r2.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xy = fma(r6.ww, r2.xy, r1.xy);
	r0.w = ((texture(resourceSamplerPair_5_ps, r3.xyw))).w;
	r2.y = saturate(fma(r2.w, r0.w, r0.z));
	r0.z = dot(r1.xy, r1.xy);
	r0.z = -r0.z + float(1.00000000f);
	r0.z = sqrt(abs(r0.z));
	r3.x = r5.z * r1.x;
	r3.y = -r5.y * r1.x;
	r3.z = uintBitsToFloat(uint(0x00000000));
	r3.xyz = fma(v4.v.xyz, r1.zzz, r3.xyz);
	r3.xyz = fma(r0.zzz, r5.yzw, r3.xyz);
	r4.x = uintBitsToFloat(uint(0x00000000));
	r4.yz = r5.wz * vec2(1.00000000f, -1.00000000f);
	r1.xyw = fma(r1.yyy, r4.xyz, r3.xyz);
	r0.z = dot(r1.xyw, r1.xyw);
	r0.z = inversesqrt(r0.z);
	r3.xyz = r0.zzz * r1.xyw;
	r0.xy = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r0.xy);
	r6.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r6.x = v2.v.x;
	r0.xy = fma(-r0.xy, vec2(9.00000000f, 9.00000000f), r6.xy);
	r6 = r0.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_6_ps, r6.xy))).xyz;
	r0.w = saturate(r3.z * idx_uniforms1_ps.cb1[14].z);
	r0.z = fma(r1.y, r0.z, r0.w);
	r0.w = intBitsToFloat(r0.z >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_7_ps, r6.xy));
	r1.x = ((texture(resourceSamplerPair_7_ps, r6.zw)).wxyz).x;
	r1.yw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.xy = fma(r0.xy, vec2(0.0206250008f, 0.00562500022f), r1.yw);
	r0.x = ((texture(resourceSamplerPair_7_ps, r0.xy)).wxyz).x;
	if (floatBitsToUint(r0.w) != uint(0))
	{
		r6.xyz = fma(r7.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7 = r6.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r5.z * r7.x;
		r9.y = -r5.y * r7.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r1.yzw = fma(v4.v.xyz, r1.zzz, r9.xyz);
		r1.yzw = fma(r6.xxx, r5.yzw, r1.yzw);
		r1.yzw = fma(r7.yzw, r4.xyz, r1.yzw);
		r0.y = dot(r1.yzw, r1.yzw);
		r0.y = inversesqrt(r0.y);
		r4 = (texture(resourceSamplerPair_8_ps, v1.v.zw));
		r0.w = min(r4.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r2.xzw = uintBitsToFloat(uvec3(0x00000000, 0x3f000000, 0x3f800000));
		r4.xyz = r4.xyz * r8.xyz;
		r2.w = fma(r8.w, r2.w, float(0.750000000f));
		r3.w = r1.x * r2.w;
		r4.w = r0.w * float(0.699999988f);
		r1.x = fma(-r1.x, r2.w, float(0.100000001f));
		r1.x = fma(r4.w, r1.x, r3.w);
		r0.x = -r0.x + float(1.00000000f);
		r0.x = saturate(fma(-r0.x, idx_uniforms1_ps.cb1[15].x, r1.x));
		r0.x = r0.x * r0.w;
		r0.w = r0.x * float(3.00000000f);
		r0.x = fma(r0.x, float(-0.300000012f), float(0.800000012f));
		r0.w = min(r0.w, float(1.00000000f));
		r1.x = -r0.x + float(1.00000000f);
		r0.w = r0.w / r1.x;
		r0.x = -r0.x + r0.z;
		r0.x = saturate(r0.w * r0.x);
		r4.xyz = fma(r4.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r4.xyz = fma(r0.xxx, r4.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r5.xyz = -r2.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r2.xyz = fma(r0.xxx, r5.xyz, r2.xyz);
		r0.yzw = fma(r1.yzw, r0.yyy, -r3.xyz);
		r0.xyz = fma(r0.xxx, r0.yzw, r3.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r3.xyz = r0.www * r0.xyz;
	}
	else
	{
		r4.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r3.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r4.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r2.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

