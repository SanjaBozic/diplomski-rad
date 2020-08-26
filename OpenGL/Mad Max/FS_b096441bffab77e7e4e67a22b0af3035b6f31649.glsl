#version 460 core
// ps_5_0
// Checksum: 0dfd45b0_9fae76f2_0a724ffd_40d200ab
// Name: fastter_lod0

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3

uniform sampler2D resourceSamplerPair_2_ps; // res4, s4

uniform sampler2D resourceSamplerPair_3_ps; // res6, s6

uniform sampler2DArray resourceSamplerPair_4_ps; // res7, s7

uniform sampler2DArray resourceSamplerPair_5_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_6_ps; // res9, s9

uniform sampler2D resourceSamplerPair_7_ps; // res12, s12

uniform sampler2D resourceSamplerPair_8_ps; // res11, s11

uniform sampler2D resourceSamplerPair_9_ps; // res13, s13


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
	r3.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r4 = (texture(resourceSamplerPair_2_ps, v1.v.xy));
	r4 = r4 * vec4(15.0000000f, 15.0000000f, 15.0000000f, 15.0000000f);
	r4 = roundEven(r4);
	r1.y = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r1.y + float(1.00000000f);
	r4 = fma(idx_uniforms1_ps.cb1[1].xxxx, vec4(16.0000000f, 16.0000000f, 16.0000000f, 16.0000000f), r4.xzwy);
	r1.y = dot(r3, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r3 = r3 / r1.yyyy;
	r5 = r4.xywz * vec4(0.00784313772f, 0.00784313772f, 0.00784313772f, 0.00784313772f);
	r6.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r6.yw = r5.xz;
	r1.yz = ((texture(resourceSamplerPair_3_ps, r6.xy)).yxzw).yz;
	r6.xy = ((texture(resourceSamplerPair_3_ps, r6.zw)).xzyw).xy;
	r5.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r5.xy = ((texture(resourceSamplerPair_3_ps, r5.xy)).xzyw).xy;
	r5.zw = ((texture(resourceSamplerPair_3_ps, r5.zw)).ywxz).zw;
	r7.x = uintBitsToFloat(uint(0x3c800000));
	r7.yz = r4.xw;
	r7.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r7.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r4.x = uintBitsToFloat(uint(0x3c800000));
	r4.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r4.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r8.x = ((texture(resourceSamplerPair_3_ps, r7.xy)).yxzw).x;
	r8.y = ((texture(resourceSamplerPair_3_ps, r7.xz))).y;
	r8.z = ((texture(resourceSamplerPair_3_ps, r4.xy)).xzyw).z;
	r8.w = ((texture(resourceSamplerPair_3_ps, r4.xz)).xzwy).w;
	r4 = r8 * vec4(255.000000f, 255.000000f, 255.000000f, 255.000000f);
	r4 = roundEven(r4);
	r7.x = r1.z;
	r7.y = r6.y;
	r7.zw = r5.yw;
	r7 = r3 * r7;
	r7 = r7 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r1.z = dot(v4.v.xyz, v4.v.xyz);
	r1.z = inversesqrt(r1.z);
	r6.yzw = r1.zzz * v4.v.xyz;
	r8.xyz = r6.wyz * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r8.xyz = fma(r6.zwy, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r8.xyz);
	r1.w = dot(r8.xy, r8.xy);
	r1.w = inversesqrt(r1.w);
	r8.xyz = r1.www * r8.xyz;
	r1.w = dot(r8.xy, r6.yz);
	r8.xyz = fma(-r6.yzw, r1.www, r8.xyz);
	r1.w = dot(r8.xyz, r8.xyz);
	r1.w = inversesqrt(r1.w);
	r8.xyz = r1.www * r8.xyz;
	r9.xyz = r6.wyz * r8.yzx;
	r9.xyz = fma(r6.zwy, r8.zxy, -r9.xyz);
	r10.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r1.w = dot(r10.xyz, r10.xyz);
	r1.w = inversesqrt(r1.w);
	r10.xyz = r1.www * r10.xyz;
	r8.x = dot(-r8.xyz, r10.xyz);
	r8.y = dot(r9.xyz, r10.xyz);
	r1.w = dot(-r6.yzw, r10.xyz);
	r5.y = max(-r1.w, float(0.500000000f));
	r5.y = float(8.00000000f) / r5.y;
	r5.y = max(r5.y, float(1.00000000f));
	r5.w = float(1.00000000f) / r5.y;
	r1.w = min(r1.w, float(-0.200000003f));
	r1.w = r1.w * r5.y;
	r8.xy = r8.xy / r1.ww;
	r9 = r3 + vec4(-0.400000006f, -0.400000006f, -0.400000006f, -0.400000006f);
	r9 = saturate(r9 * vec4(6.00000000f, 6.00000000f, 6.00000000f, 6.00000000f));
	r10 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(lessThan(vec4(0.400000006f, 0.400000006f, 0.400000006f, 0.400000006f), r3))));
	if (floatBitsToUint(r10.x) != uint(0))
	{
		r1.y = r1.y * r9.x;
		r1.y = r1.y * float(0.0799999982f);
		r8.zw = r1.yy * r8.xy;
		r8.zw = r5.yy * r8.zw;
		r11.xy = fma(-r8.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r12.z = r4.x;
		r12.xy = r11.xy;
		r1.w = uintBitsToFloat(uint(0x3f800000));
		r9.x = uintBitsToFloat(uint(0x00000000));
		r10.x = uintBitsToFloat(uint(0x00000000));
		r11.z = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r11.w = intBitsToFloat(r11.z < r5.y ? int(0xffffffff) : int(0x00000000));
			r12.w = intBitsToFloat(r9.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r11.w = uintBitsToFloat(floatBitsToUint(r11.w) & floatBitsToUint(r12.w));
			if (floatBitsToUint(r11.w) == uint(0))
				break;
			r1.w = -r5.w + r1.w;
			r12.xy = fma(r8.xy, r1.yy, r12.xy);
			r11.w = ((textureLod(resourceSamplerPair_4_ps, r12.xyz, r1.x))).w;
			r11.z = r11.z + float(1.00000000f);
			r10.x = r9.x;
			r9.x = r11.w;
		}
		r1.y = r5.w + r1.w;
		r9.x = r1.w + -r9.x;
		r10.x = -r10.x + r1.y;
		r1.y = r1.y * r9.x;
		r1.y = fma(r1.w, r10.x, -r1.y);
		r1.w = -r9.x + r10.x;
		r1.y = r1.y / r1.w;
		r1.y = -r1.y + float(1.00000000f);
		r0.xy = fma(r1.yy, r8.zw, r11.xy);
	}
	if (floatBitsToUint(r10.y) != uint(0))
	{
		r1.y = r6.x * r9.y;
		r1.y = r1.y * float(0.0799999982f);
		r8.zw = r1.yy * r8.xy;
		r8.zw = r5.yy * r8.zw;
		r9.xy = fma(-r8.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r11.z = r4.y;
		r11.xy = r9.xy;
		r1.w = uintBitsToFloat(uint(0x3f800000));
		r6.x = uintBitsToFloat(uint(0x00000000));
		r10.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r11.w = intBitsToFloat(r10.y < r5.y ? int(0xffffffff) : int(0x00000000));
			r12.x = intBitsToFloat(r6.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r11.w = uintBitsToFloat(floatBitsToUint(r11.w) & floatBitsToUint(r12.x));
			if (floatBitsToUint(r11.w) == uint(0))
				break;
			r1.w = -r5.w + r1.w;
			r11.xy = fma(r8.xy, r1.yy, r11.xy);
			r11.w = ((textureLod(resourceSamplerPair_4_ps, r11.xyz, r1.x))).w;
			r10.y = r10.y + float(1.00000000f);
			r10.x = r6.x;
			r6.x = r11.w;
		}
		r1.y = r5.w + r1.w;
		r6.x = r1.w + -r6.x;
		r10.x = -r10.x + r1.y;
		r1.y = r1.y * r6.x;
		r1.y = fma(r1.w, r10.x, -r1.y);
		r1.w = -r6.x + r10.x;
		r1.y = r1.y / r1.w;
		r1.y = -r1.y + float(1.00000000f);
		r0.xy = fma(r1.yy, r8.zw, r9.xy);
	}
	if (floatBitsToUint(r10.z) != uint(0))
	{
		r1.y = r5.x * r9.z;
		r1.y = r1.y * float(0.0799999982f);
		r8.zw = r1.yy * r8.xy;
		r8.zw = r5.yy * r8.zw;
		r9.xy = fma(-r8.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r10.z = r4.z;
		r10.xy = r9.xy;
		r1.w = uintBitsToFloat(uint(0x3f800000));
		r5.x = uintBitsToFloat(uint(0x00000000));
		r6.x = uintBitsToFloat(uint(0x00000000));
		r9.z = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r11.x = intBitsToFloat(r9.z < r5.y ? int(0xffffffff) : int(0x00000000));
			r11.y = intBitsToFloat(r5.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r11.x = uintBitsToFloat(floatBitsToUint(r11.y) & floatBitsToUint(r11.x));
			if (floatBitsToUint(r11.x) == uint(0))
				break;
			r1.w = -r5.w + r1.w;
			r10.xy = fma(r8.xy, r1.yy, r10.xy);
			r11.x = ((textureLod(resourceSamplerPair_4_ps, r10.xyz, r1.x)).wxyz).x;
			r9.z = r9.z + float(1.00000000f);
			r6.x = r5.x;
			r5.x = r11.x;
		}
		r1.y = r5.w + r1.w;
		r5.x = r1.w + -r5.x;
		r6.x = -r6.x + r1.y;
		r1.y = r1.y * r5.x;
		r1.y = fma(r1.w, r6.x, -r1.y);
		r1.w = -r5.x + r6.x;
		r1.y = r1.y / r1.w;
		r1.y = -r1.y + float(1.00000000f);
		r0.xy = fma(r1.yy, r8.zw, r9.xy);
	}
	if (floatBitsToUint(r10.w) != uint(0))
	{
		r1.y = r5.z * r9.w;
		r1.y = r1.y * float(0.0799999982f);
		r5.xz = r1.yy * r8.xy;
		r5.xz = r5.yy * r5.xz;
		r8.zw = fma(-r5.xz, vec2(0.500000000f, 0.500000000f), r0.xy);
		r9.z = r4.w;
		r9.xy = r8.zw;
		r1.w = uintBitsToFloat(uint(0x3f800000));
		r6.x = uintBitsToFloat(uint(0x00000000));
		r9.w = uintBitsToFloat(uint(0x00000000));
		r10.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r10.y = intBitsToFloat(r10.x < r5.y ? int(0xffffffff) : int(0x00000000));
			r10.z = intBitsToFloat(r6.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r10.y = uintBitsToFloat(floatBitsToUint(r10.z) & floatBitsToUint(r10.y));
			if (floatBitsToUint(r10.y) == uint(0))
				break;
			r1.w = -r5.w + r1.w;
			r9.xy = fma(r8.xy, r1.yy, r9.xy);
			r10.y = ((textureLod(resourceSamplerPair_4_ps, r9.xyz, r1.x)).xwyz).y;
			r10.x = r10.x + float(1.00000000f);
			r9.w = r6.x;
			r6.x = r10.y;
		}
		r1.x = r5.w + r1.w;
		r1.y = r1.w + -r6.x;
		r5.y = -r9.w + r1.x;
		r1.x = r1.y * r1.x;
		r1.x = fma(r1.w, r5.y, -r1.x);
		r1.y = -r1.y + r5.y;
		r1.x = r1.x / r1.y;
		r1.x = -r1.x + float(1.00000000f);
		r0.xy = fma(r1.xx, r5.xz, r8.zw);
	}
	r0.zw = r4.xy;
	r1.xy = ((texture(resourceSamplerPair_5_ps, r0.xyz)).ywxz).xy;
	r1.xy = fma(r1.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r5 = (texture(resourceSamplerPair_6_ps, r0.xyz));
	r8.xy = ((texture(resourceSamplerPair_5_ps, r0.xyw)).ywxz).xy;
	r8.xy = fma(r8.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r8.xy = r7.yy * r8.xy;
	r1.xy = fma(r7.xx, r1.xy, r8.xy);
	r8 = (texture(resourceSamplerPair_6_ps, r0.xyw));
	r8 = r3.yyyy * r8;
	r5 = fma(r3.xxxx, r5, r8);
	r4.xy = r0.xy;
	r0.zw = ((texture(resourceSamplerPair_5_ps, r4.xyz)).xzyw).zw;
	r0.zw = fma(r0.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.zw = fma(r7.zz, r0.zw, r1.xy);
	r8 = (texture(resourceSamplerPair_6_ps, r4.xyz));
	r5 = fma(r3.zzzz, r8, r5);
	r1.xy = ((texture(resourceSamplerPair_5_ps, r4.xyw)).ywxz).xy;
	r1.xy = fma(r1.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.zw = fma(r7.ww, r1.xy, r0.zw);
	r4 = (texture(resourceSamplerPair_6_ps, r4.xyw));
	r3 = fma(r3.wwww, r4, r5);
	r1.x = dot(r0.zw, r0.zw);
	r1.x = -r1.x + float(1.00000000f);
	r1.x = sqrt(abs(r1.x));
	r4.x = r6.z * r0.z;
	r4.y = -r6.y * r0.z;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r4.xyz = fma(v4.v.xyz, r1.zzz, r4.xyz);
	r1.xyw = fma(r1.xxx, r6.yzw, r4.xyz);
	r4.x = uintBitsToFloat(uint(0x00000000));
	r4.yz = r6.wz * vec2(1.00000000f, -1.00000000f);
	r1.xyw = fma(r0.www, r4.xyz, r1.xyw);
	r0.z = dot(r1.xyw, r1.xyw);
	r0.z = inversesqrt(r0.z);
	r5.xyz = r0.zzz * r1.xyw;
	r2.w = uintBitsToFloat(uint(0x3f800000));
	r2 = r2 * r3;
	r2 = saturate(r2.xwyz * vec4(4.69999981f, 1.00000000f, 4.69999981f, 4.69999981f));
	r0.xy = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r0.xy);
	r3.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r3.x = v2.v.x;
	r0.xy = fma(-r0.xy, vec2(9.00000000f, 9.00000000f), r3.xy);
	r3 = r0.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_7_ps, r3.xy))).xyz;
	r0.w = saturate(r5.z * idx_uniforms1_ps.cb1[14].z);
	r0.z = fma(r1.y, r0.z, r0.w);
	r0.w = intBitsToFloat(r0.z >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_8_ps, r3.xy));
	r1.x = ((texture(resourceSamplerPair_8_ps, r3.zw)).wxyz).x;
	r1.yw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.xy = fma(r0.xy, vec2(0.0206250008f, 0.00562500022f), r1.yw);
	r0.x = ((texture(resourceSamplerPair_8_ps, r0.xy)).wxyz).x;
	if (floatBitsToUint(r0.w) != uint(0))
	{
		r3.xyz = fma(r7.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7 = r3.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r6.z * r7.x;
		r9.y = -r6.y * r7.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r1.yzw = fma(v4.v.xyz, r1.zzz, r9.xyz);
		r1.yzw = fma(r3.xxx, r6.yzw, r1.yzw);
		r1.yzw = fma(r7.yzw, r4.xyz, r1.yzw);
		r0.y = dot(r1.yzw, r1.yzw);
		r0.y = inversesqrt(r0.y);
		r3 = (texture(resourceSamplerPair_9_ps, v1.v.zw));
		r0.w = min(r3.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r3.w = uintBitsToFloat(uint(0x3f800000));
		r3.xyz = r3.xyz * r8.xyz;
		r3.w = fma(r8.w, r3.w, float(0.750000000f));
		r4.x = r1.x * r3.w;
		r4.y = r0.w * float(0.699999988f);
		r1.x = fma(-r1.x, r3.w, float(0.100000001f));
		r1.x = fma(r4.y, r1.x, r4.x);
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
		r3.xyz = fma(r3.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r2.xzw);
		r3.xyz = fma(r0.xxx, r3.xyz, r2.xzw);
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r2.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r2.xyz = fma(r0.xxx, r4.xyz, r2.xyz);
		r0.yzw = fma(r1.yzw, r0.yyy, -r5.xyz);
		r0.xyz = fma(r0.xxx, r0.yzw, r5.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r5.xyz = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = r2.xzw;
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r5.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r3.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r2.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

