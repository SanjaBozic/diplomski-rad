#version 460 core
// ps_5_0
// Checksum: 3e8bddba_9778a0bc_2bc0f2cc_f9edb377
// Name: fastter_lod0cidx4

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

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3

uniform sampler2DArray resourceSamplerPair_2_ps; // res7, s7

uniform sampler2DArray resourceSamplerPair_3_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_4_ps; // res9, s9

uniform sampler2D resourceSamplerPair_5_ps; // res12, s12

uniform sampler2D resourceSamplerPair_6_ps; // res11, s11

uniform sampler2D resourceSamplerPair_7_ps; // res13, s13


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
	r2.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r3.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r1.y = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r1.y + float(1.00000000f);
	r1.y = dot(r3, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r3 = r3 / r1.yyyy;
	r4.x = r3.x * idx_uniforms1_ps.cb1[6].z;
	r4.y = r3.y * idx_uniforms1_ps.cb1[7].z;
	r4.z = r3.z * idx_uniforms1_ps.cb1[8].z;
	r4.w = r3.w * idx_uniforms1_ps.cb1[9].z;
	r4 = r4 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r1.y = dot(v4.v.xyz, v4.v.xyz);
	r1.y = inversesqrt(r1.y);
	r5.xyz = r1.yyy * v4.v.xyz;
	r6.xyz = r5.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r6.xyz = fma(r5.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r6.xyz);
	r1.z = dot(r6.xy, r6.xy);
	r1.z = inversesqrt(r1.z);
	r6.xyz = r1.zzz * r6.xyz;
	r1.z = dot(r6.xy, r5.xy);
	r6.xyz = fma(-r5.xyz, r1.zzz, r6.xyz);
	r1.z = dot(r6.xyz, r6.xyz);
	r1.z = inversesqrt(r1.z);
	r6.xyz = r1.zzz * r6.xyz;
	r7.xyz = r5.zxy * r6.yzx;
	r7.xyz = fma(r5.yzx, r6.zxy, -r7.xyz);
	r8.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r1.z = dot(r8.xyz, r8.xyz);
	r1.z = inversesqrt(r1.z);
	r8.xyz = r1.zzz * r8.xyz;
	r6.x = dot(-r6.xyz, r8.xyz);
	r6.y = dot(r7.xyz, r8.xyz);
	r1.z = dot(-r5.xyz, r8.xyz);
	r1.w = max(-r1.z, float(0.500000000f));
	r1.w = float(8.00000000f) / r1.w;
	r1.w = max(r1.w, float(1.00000000f));
	r5.w = float(1.00000000f) / r1.w;
	r1.xz = min(r1.xz, vec2(6.00000000f, -0.200000003f));
	r1.z = r1.z * r1.w;
	r6.xy = r6.xy / r1.zz;
	r7 = r3 + vec4(-0.400000006f, -0.400000006f, -0.400000006f, -0.400000006f);
	r7 = saturate(r7 * vec4(6.00000000f, 6.00000000f, 6.00000000f, 6.00000000f));
	r8 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(lessThan(vec4(0.400000006f, 0.400000006f, 0.400000006f, 0.400000006f), r3))));
	if (floatBitsToUint(r8.x) != uint(0))
	{
		r1.z = r7.x * idx_uniforms1_ps.cb1[6].x;
		r1.z = r1.z * float(0.0799999982f);
		r6.zw = r1.zz * r6.xy;
		r6.zw = r1.ww * r6.zw;
		r9.xy = fma(-r6.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r10.z = idx_uniforms1_ps.cb1[6].y;
		r10.xy = r9.xy;
		r7.x = uintBitsToFloat(uint(0x3f800000));
		r8.x = uintBitsToFloat(uint(0x00000000));
		r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r10.w = intBitsToFloat(r9.w < r1.w ? int(0xffffffff) : int(0x00000000));
			r11.x = intBitsToFloat(r8.x < r7.x ? int(0xffffffff) : int(0x00000000));
			r10.w = uintBitsToFloat(floatBitsToUint(r10.w) & floatBitsToUint(r11.x));
			if (floatBitsToUint(r10.w) == uint(0))
				break;
			r7.x = -r5.w + r7.x;
			r10.xy = fma(r6.xy, r1.zz, r10.xy);
			r10.w = ((textureLod(resourceSamplerPair_2_ps, r10.xyz, r1.x))).w;
			r9.w = r9.w + float(1.00000000f);
			r9.z = r8.x;
			r8.x = r10.w;
		}
		r1.z = r5.w + r7.x;
		r8.x = r7.x + -r8.x;
		r9.z = -r9.z + r1.z;
		r1.z = r1.z * r8.x;
		r1.z = fma(r7.x, r9.z, -r1.z);
		r7.x = -r8.x + r9.z;
		r1.z = r1.z / r7.x;
		r1.z = -r1.z + float(1.00000000f);
		r0.xy = fma(r1.zz, r6.zw, r9.xy);
	}
	if (floatBitsToUint(r8.y) != uint(0))
	{
		r1.z = r7.y * idx_uniforms1_ps.cb1[7].x;
		r1.z = r1.z * float(0.0799999982f);
		r6.zw = r1.zz * r6.xy;
		r6.zw = r1.ww * r6.zw;
		r7.xy = fma(-r6.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r9.z = idx_uniforms1_ps.cb1[7].y;
		r9.xy = r7.xy;
		r8.xy = uintBitsToFloat(uvec2(0x3f800000, 0x00000000));
		r9.w = uintBitsToFloat(uint(0x00000000));
		r10.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r10.y = intBitsToFloat(r10.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r10.z = intBitsToFloat(r8.y < r8.x ? int(0xffffffff) : int(0x00000000));
			r10.y = uintBitsToFloat(floatBitsToUint(r10.z) & floatBitsToUint(r10.y));
			if (floatBitsToUint(r10.y) == uint(0))
				break;
			r8.x = -r5.w + r8.x;
			r9.xy = fma(r6.xy, r1.zz, r9.xy);
			r10.y = ((textureLod(resourceSamplerPair_2_ps, r9.xyz, r1.x)).xwyz).y;
			r10.x = r10.x + float(1.00000000f);
			r9.w = r8.y;
			r8.y = r10.y;
		}
		r1.z = r5.w + r8.x;
		r8.y = -r8.y + r8.x;
		r9.x = -r9.w + r1.z;
		r1.z = r1.z * r8.y;
		r1.z = fma(r8.x, r9.x, -r1.z);
		r8.x = -r8.y + r9.x;
		r1.z = r1.z / r8.x;
		r1.z = -r1.z + float(1.00000000f);
		r0.xy = fma(r1.zz, r6.zw, r7.xy);
	}
	if (floatBitsToUint(r8.z) != uint(0))
	{
		r1.z = r7.z * idx_uniforms1_ps.cb1[8].x;
		r1.z = r1.z * float(0.0799999982f);
		r6.zw = r1.zz * r6.xy;
		r6.zw = r1.ww * r6.zw;
		r7.xy = fma(-r6.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r8.z = idx_uniforms1_ps.cb1[8].y;
		r8.xy = r7.xy;
		r7.z = uintBitsToFloat(uint(0x3f800000));
		r9.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
		while (true)
		{
			r9.w = intBitsToFloat(r9.z < r1.w ? int(0xffffffff) : int(0x00000000));
			r10.x = intBitsToFloat(r9.x < r7.z ? int(0xffffffff) : int(0x00000000));
			r9.w = uintBitsToFloat(floatBitsToUint(r9.w) & floatBitsToUint(r10.x));
			if (floatBitsToUint(r9.w) == uint(0))
				break;
			r7.z = -r5.w + r7.z;
			r8.xy = fma(r6.xy, r1.zz, r8.xy);
			r9.w = ((textureLod(resourceSamplerPair_2_ps, r8.xyz, r1.x))).w;
			r9.z = r9.z + float(1.00000000f);
			r9.y = r9.x;
			r9.xyz = r9.wyz;
		}
		r1.z = r5.w + r7.z;
		r8.x = r7.z + -r9.x;
		r8.y = -r9.y + r1.z;
		r1.z = r1.z * r8.x;
		r1.z = fma(r7.z, r8.y, -r1.z);
		r7.z = -r8.x + r8.y;
		r1.z = r1.z / r7.z;
		r1.z = -r1.z + float(1.00000000f);
		r0.xy = fma(r1.zz, r6.zw, r7.xy);
	}
	if (floatBitsToUint(r8.w) != uint(0))
	{
		r1.z = r7.w * idx_uniforms1_ps.cb1[9].x;
		r1.z = r1.z * float(0.0799999982f);
		r6.zw = r1.zz * r6.xy;
		r6.zw = r1.ww * r6.zw;
		r7.xy = fma(-r6.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r8.z = idx_uniforms1_ps.cb1[9].y;
		r8.xy = r7.xy;
		r7.zw = uintBitsToFloat(uvec2(0x3f800000, 0x00000000));
		r8.w = uintBitsToFloat(uint(0x00000000));
		r9.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r9.y = intBitsToFloat(r9.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r9.z = intBitsToFloat(r7.w < r7.z ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r9.z) & floatBitsToUint(r9.y));
			if (floatBitsToUint(r9.y) == uint(0))
				break;
			r7.z = -r5.w + r7.z;
			r8.xy = fma(r6.xy, r1.zz, r8.xy);
			r9.y = ((textureLod(resourceSamplerPair_2_ps, r8.xyz, r1.x)).xwyz).y;
			r9.x = r9.x + float(1.00000000f);
			r8.w = r7.w;
			r7.w = r9.y;
		}
		r1.x = r5.w + r7.z;
		r1.z = -r7.w + r7.z;
		r1.w = -r8.w + r1.x;
		r1.x = r1.z * r1.x;
		r1.x = fma(r7.z, r1.w, -r1.x);
		r1.z = -r1.z + r1.w;
		r1.x = r1.x / r1.z;
		r1.x = -r1.x + float(1.00000000f);
		r0.xy = fma(r1.xx, r6.zw, r7.xy);
	}
	r0.z = idx_uniforms1_ps.cb1[6].y;
	r1.xz = ((texture(resourceSamplerPair_3_ps, r0.xyz)).yxwz).xz;
	r1.xz = fma(r1.zx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r6 = (texture(resourceSamplerPair_4_ps, r0.xyz));
	r0.w = idx_uniforms1_ps.cb1[7].y;
	r7.xy = ((texture(resourceSamplerPair_3_ps, r0.xyw)).ywxz).xy;
	r7.xy = fma(r7.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r7.xy = r4.yy * r7.xy;
	r1.xz = fma(r4.xx, r1.xz, r7.xy);
	r7 = (texture(resourceSamplerPair_4_ps, r0.xyw));
	r7 = r3.yyyy * r7;
	r6 = fma(r3.xxxx, r6, r7);
	r7.xy = r0.xy;
	r7.z = idx_uniforms1_ps.cb1[8].y;
	r0.zw = ((texture(resourceSamplerPair_3_ps, r7.xyz)).xzyw).zw;
	r0.zw = fma(r0.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.zw = fma(r4.zz, r0.zw, r1.xz);
	r8 = (texture(resourceSamplerPair_4_ps, r7.xyz));
	r6 = fma(r3.zzzz, r8, r6);
	r7.w = idx_uniforms1_ps.cb1[9].y;
	r1.xz = ((texture(resourceSamplerPair_3_ps, r7.xyw)).yxwz).xz;
	r1.xz = fma(r1.zx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.zw = fma(r4.ww, r1.xz, r0.zw);
	r4 = (texture(resourceSamplerPair_4_ps, r7.xyw));
	r3 = fma(r3.wwww, r4, r6);
	r1.x = dot(r0.zw, r0.zw);
	r1.x = -r1.x + float(1.00000000f);
	r1.x = sqrt(abs(r1.x));
	r4.x = r5.y * r0.z;
	r4.y = -r5.x * r0.z;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r4.xyz = fma(v4.v.xyz, r1.yyy, r4.xyz);
	r1.xzw = fma(r1.xxx, r5.xyz, r4.xyz);
	r4.x = uintBitsToFloat(uint(0x00000000));
	r4.yz = r5.zy * vec2(1.00000000f, -1.00000000f);
	r1.xzw = fma(r0.www, r4.xyz, r1.xzw);
	r0.z = dot(r1.xzw, r1.xzw);
	r0.z = inversesqrt(r0.z);
	r6.xyz = r0.zzz * r1.xzw;
	r2.w = uintBitsToFloat(uint(0x3f800000));
	r2 = r2 * r3;
	r2 = saturate(r2.xwyz * vec4(4.69999981f, 1.00000000f, 4.69999981f, 4.69999981f));
	r0.xy = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r0.xy);
	r3.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r3.x = v2.v.x;
	r0.xy = fma(-r0.xy, vec2(9.00000000f, 9.00000000f), r3.xy);
	r3 = r0.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_5_ps, r3.xy))).xyz;
	r0.w = saturate(r6.z * idx_uniforms1_ps.cb1[14].z);
	r0.z = fma(r1.z, r0.z, r0.w);
	r0.w = intBitsToFloat(r0.z >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_6_ps, r3.xy));
	r1.x = ((texture(resourceSamplerPair_6_ps, r3.zw)).wxyz).x;
	r1.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.xy = fma(r0.xy, vec2(0.0206250008f, 0.00562500022f), r1.zw);
	r0.x = ((texture(resourceSamplerPair_6_ps, r0.xy)).wxyz).x;
	if (floatBitsToUint(r0.w) != uint(0))
	{
		r3.xyz = fma(r7.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7 = r3.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r5.y * r7.x;
		r9.y = -r5.x * r7.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r1.yzw = fma(v4.v.xyz, r1.yyy, r9.xyz);
		r1.yzw = fma(r3.xxx, r5.xyz, r1.yzw);
		r1.yzw = fma(r7.yzw, r4.xyz, r1.yzw);
		r0.y = dot(r1.yzw, r1.yzw);
		r0.y = inversesqrt(r0.y);
		r3 = (texture(resourceSamplerPair_7_ps, v1.v.zw));
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
		r0.yzw = fma(r1.yzw, r0.yyy, -r6.xyz);
		r0.xyz = fma(r0.xxx, r0.yzw, r6.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r6.xyz = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = r2.xzw;
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r6.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r3.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r2.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

