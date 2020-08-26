#version 460 core
// ps_5_0
// Checksum: 346c1697_ce3514c7_6bce673c_8a40eeb7
// Name: fastter_lod01cidx4cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res5, s5

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2

uniform sampler2DArray resourceSamplerPair_3_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_4_ps; // res9, s9

uniform sampler2DArray resourceSamplerPair_5_ps; // res7, s7

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
	r0.xy = v2.v.xz * vec2(0.00390625000f, 0.00390625000f);
	r1.xy = v2.v.xz * idx_uniforms1_ps.cb1[4].zz;
	r2.xy = dFdxCoarse(v2.v.xz);
	r2.zw = dFdyCoarse(v2.v.xz);
	r0.z = dot(r2, r2);
	r0.z = log2(r0.z);
	r0.z = fma(r0.z, float(0.500000000f), float(6.50000000f));
	r0.z = min(r0.z, float(6.00000000f));
	r0.w = saturate(v3.v.x);
	r2.xy = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).xwyz).xy;
	r2.xy = fma(r2.xy, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r3.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r2.z = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r2.z + float(1.00000000f);
	r2.z = dot(r3, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r3 = r3 / r2.zzzz;
	r2.z = r3.y * idx_uniforms1_ps.cb1[7].w;
	r2.z = fma(idx_uniforms1_ps.cb1[6].w, r3.x, r2.z);
	r2.z = fma(idx_uniforms1_ps.cb1[8].w, r3.z, r2.z);
	r2.z = fma(idx_uniforms1_ps.cb1[9].w, r3.w, r2.z);
	r0.xy = ((texture(resourceSamplerPair_2_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r2.z = r2.z * float(1.50000000f);
	r0.xy = fma(r2.zz, r0.xy, -r2.xy);
	r2.x = r3.x * idx_uniforms1_ps.cb1[6].z;
	r2.y = r3.y * idx_uniforms1_ps.cb1[7].z;
	r2.z = r3.z * idx_uniforms1_ps.cb1[8].z;
	r2.w = r3.w * idx_uniforms1_ps.cb1[9].z;
	r2 = r2 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r4.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r4.z = idx_uniforms1_ps.cb1[6].y;
	r5.xy = ((texture(resourceSamplerPair_3_ps, r4.xyz)).ywxz).xy;
	r5.xy = fma(r5.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.x = ((texture(resourceSamplerPair_4_ps, r4.xyz)).wxyz).x;
	r6.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r6.z = idx_uniforms1_ps.cb1[7].y;
	r4.yz = ((texture(resourceSamplerPair_3_ps, r6.xyz)).xywz).yz;
	r4.yz = fma(r4.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.yz = r2.yy * r4.yz;
	r4.yz = fma(r2.xx, r5.xy, r4.yz);
	r4.w = ((texture(resourceSamplerPair_4_ps, r6.xyz))).w;
	r4.w = r3.y * r4.w;
	r4.x = fma(r3.x, r4.x, r4.w);
	r5.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r5.z = idx_uniforms1_ps.cb1[8].y;
	r6.xy = ((texture(resourceSamplerPair_3_ps, r5.xyz)).ywxz).xy;
	r6.xy = fma(r6.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.yz = fma(r2.zz, r6.xy, r4.yz);
	r4.w = ((texture(resourceSamplerPair_4_ps, r5.xyz))).w;
	r4.x = fma(r3.z, r4.w, r4.x);
	r5.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r5.z = idx_uniforms1_ps.cb1[9].y;
	r6.xy = ((texture(resourceSamplerPair_3_ps, r5.xyz)).ywxz).xy;
	r6.xy = fma(r6.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.yz = fma(r2.ww, r6.xy, r4.yz);
	r4.w = ((texture(resourceSamplerPair_4_ps, r5.xyz))).w;
	r4.x = fma(r3.w, r4.w, r4.x);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r4.w = dot(r0.xy, r0.xy);
	r4.w = r4.w + float(1.00000000f);
	r5.y = inversesqrt(r4.w);
	r5.xz = r0.xy * r5.yy;
	r6.xyz = -r5.xyz + v4.v.xyz;
	r5.xyz = fma(r0.www, r6.xyz, r5.xyz);
	r0.x = dot(r5.xyz, r5.xyz);
	r0.x = inversesqrt(r0.x);
	r6.xyz = r0.xxx * r5.xyz;
	r0.y = dot(v4.v.xyz, v4.v.xyz);
	r0.y = inversesqrt(r0.y);
	r7.xyz = r0.yyy * v4.v.xyz;
	r8.xyz = r7.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r8.xyz = fma(r7.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r8.xyz);
	r0.y = dot(r8.xy, r8.xy);
	r0.y = inversesqrt(r0.y);
	r8.xyz = r0.yyy * r8.xyz;
	r0.y = dot(r8.xy, r7.xy);
	r8.xyz = fma(-r7.xyz, r0.yyy, r8.xyz);
	r0.y = dot(r8.xyz, r8.xyz);
	r0.y = inversesqrt(r0.y);
	r8.xyz = r0.yyy * r8.xyz;
	r9.xyz = r7.zxy * r8.yzx;
	r9.xyz = fma(r7.yzx, r8.zxy, -r9.xyz);
	r10.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r0.y = dot(r10.xyz, r10.xyz);
	r0.y = inversesqrt(r0.y);
	r10.xyz = r0.yyy * r10.xyz;
	r8.x = dot(-r8.xyz, r10.xyz);
	r8.y = dot(r9.xyz, r10.xyz);
	r0.y = dot(-r7.xyz, r10.xyz);
	r4.w = max(-r0.y, float(0.500000000f));
	r5.w = -r0.w + float(1.00000000f);
	r5.w = fma(r5.w, float(3.00000000f), float(1.00000000f));
	r4.w = r4.w * r5.w;
	r4.w = float(8.00000000f) / r4.w;
	r4.w = max(r4.w, float(1.00000000f));
	r5.w = float(1.00000000f) / r4.w;
	r0.y = min(r0.y, float(-0.200000003f));
	r0.y = r0.y * r4.w;
	r7.xy = r8.xy / r0.yy;
	r8 = r3 + vec4(-0.400000006f, -0.400000006f, -0.400000006f, -0.400000006f);
	r8 = saturate(r8 * vec4(6.00000000f, 6.00000000f, 6.00000000f, 6.00000000f));
	r9 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(lessThan(vec4(0.400000006f, 0.400000006f, 0.400000006f, 0.400000006f), r3))));
	if (floatBitsToUint(r9.x) != uint(0))
	{
		r0.y = r8.x * idx_uniforms1_ps.cb1[6].x;
		r0.y = r0.y * float(0.0799999982f);
		r7.zw = r0.yy * r7.xy;
		r7.zw = r4.ww * r7.zw;
		r10.xy = fma(-r7.zw, vec2(0.500000000f, 0.500000000f), r1.xy);
		r11.z = idx_uniforms1_ps.cb1[6].y;
		r11.xy = r10.xy;
		r6.w = uintBitsToFloat(uint(0x3f800000));
		r8.x = uintBitsToFloat(uint(0x00000000));
		r9.x = uintBitsToFloat(uint(0x00000000));
		r10.z = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r10.w = intBitsToFloat(r10.z < r4.w ? int(0xffffffff) : int(0x00000000));
			r11.w = intBitsToFloat(r8.x < r6.w ? int(0xffffffff) : int(0x00000000));
			r10.w = uintBitsToFloat(floatBitsToUint(r10.w) & floatBitsToUint(r11.w));
			if (floatBitsToUint(r10.w) == uint(0))
				break;
			r6.w = -r5.w + r6.w;
			r11.xy = fma(r7.xy, r0.yy, r11.xy);
			r10.w = ((textureLod(resourceSamplerPair_5_ps, r11.xyz, r0.z))).w;
			r10.z = r10.z + float(1.00000000f);
			r9.x = r8.x;
			r8.x = r10.w;
		}
		r0.y = r5.w + r6.w;
		r8.x = r6.w + -r8.x;
		r9.x = -r9.x + r0.y;
		r0.y = r0.y * r8.x;
		r0.y = fma(r6.w, r9.x, -r0.y);
		r6.w = -r8.x + r9.x;
		r0.y = r0.y / r6.w;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r7.zw, r10.xy);
	}
	if (floatBitsToUint(r9.y) != uint(0))
	{
		r0.y = r8.y * idx_uniforms1_ps.cb1[7].x;
		r0.y = r0.y * float(0.0799999982f);
		r7.zw = r0.yy * r7.xy;
		r7.zw = r4.ww * r7.zw;
		r8.xy = fma(-r7.zw, vec2(0.500000000f, 0.500000000f), r1.xy);
		r10.z = idx_uniforms1_ps.cb1[7].y;
		r10.xy = r8.xy;
		r6.w = uintBitsToFloat(uint(0x3f800000));
		r9.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r10.w = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r11.x = intBitsToFloat(r10.w < r4.w ? int(0xffffffff) : int(0x00000000));
			r11.y = intBitsToFloat(r9.x < r6.w ? int(0xffffffff) : int(0x00000000));
			r11.x = uintBitsToFloat(floatBitsToUint(r11.y) & floatBitsToUint(r11.x));
			if (floatBitsToUint(r11.x) == uint(0))
				break;
			r6.w = -r5.w + r6.w;
			r10.xy = fma(r7.xy, r0.yy, r10.xy);
			r11.x = ((textureLod(resourceSamplerPair_5_ps, r10.xyz, r0.z)).wxyz).x;
			r10.w = r10.w + float(1.00000000f);
			r9.y = r9.x;
			r9.x = r11.x;
		}
		r0.y = r5.w + r6.w;
		r9.x = r6.w + -r9.x;
		r9.y = -r9.y + r0.y;
		r0.y = r0.y * r9.x;
		r0.y = fma(r6.w, r9.y, -r0.y);
		r6.w = -r9.x + r9.y;
		r0.y = r0.y / r6.w;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r7.zw, r8.xy);
	}
	if (floatBitsToUint(r9.z) != uint(0))
	{
		r0.y = r8.z * idx_uniforms1_ps.cb1[8].x;
		r0.y = r0.y * float(0.0799999982f);
		r7.zw = r0.yy * r7.xy;
		r7.zw = r4.ww * r7.zw;
		r8.xy = fma(-r7.zw, vec2(0.500000000f, 0.500000000f), r1.xy);
		r9.z = idx_uniforms1_ps.cb1[8].y;
		r9.xy = r8.xy;
		r6.w = uintBitsToFloat(uint(0x3f800000));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r10.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r10.z = intBitsToFloat(r10.y < r4.w ? int(0xffffffff) : int(0x00000000));
			r10.w = intBitsToFloat(r8.z < r6.w ? int(0xffffffff) : int(0x00000000));
			r10.z = uintBitsToFloat(floatBitsToUint(r10.w) & floatBitsToUint(r10.z));
			if (floatBitsToUint(r10.z) == uint(0))
				break;
			r6.w = -r5.w + r6.w;
			r9.xy = fma(r7.xy, r0.yy, r9.xy);
			r10.z = ((textureLod(resourceSamplerPair_5_ps, r9.xyz, r0.z)).xywz).z;
			r10.y = r10.y + float(1.00000000f);
			r10.x = r8.z;
			r8.z = r10.z;
		}
		r0.y = r5.w + r6.w;
		r8.z = r6.w + -r8.z;
		r9.x = -r10.x + r0.y;
		r0.y = r0.y * r8.z;
		r0.y = fma(r6.w, r9.x, -r0.y);
		r6.w = -r8.z + r9.x;
		r0.y = r0.y / r6.w;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r7.zw, r8.xy);
	}
	if (floatBitsToUint(r9.w) != uint(0))
	{
		r0.y = r8.w * idx_uniforms1_ps.cb1[9].x;
		r0.y = r0.y * float(0.0799999982f);
		r7.zw = r0.yy * r7.xy;
		r7.zw = r4.ww * r7.zw;
		r8.xy = fma(-r7.zw, vec2(0.500000000f, 0.500000000f), r1.xy);
		r9.z = idx_uniforms1_ps.cb1[9].y;
		r9.xy = r8.xy;
		r6.w = uintBitsToFloat(uint(0x3f800000));
		r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r9.w = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r10.x = intBitsToFloat(r9.w < r4.w ? int(0xffffffff) : int(0x00000000));
			r10.y = intBitsToFloat(r8.z < r6.w ? int(0xffffffff) : int(0x00000000));
			r10.x = uintBitsToFloat(floatBitsToUint(r10.y) & floatBitsToUint(r10.x));
			if (floatBitsToUint(r10.x) == uint(0))
				break;
			r6.w = -r5.w + r6.w;
			r9.xy = fma(r7.xy, r0.yy, r9.xy);
			r10.x = ((textureLod(resourceSamplerPair_5_ps, r9.xyz, r0.z)).wxyz).x;
			r9.w = r9.w + float(1.00000000f);
			r8.w = r8.z;
			r8.z = r10.x;
		}
		r0.y = r5.w + r6.w;
		r0.z = r6.w + -r8.z;
		r4.w = -r8.w + r0.y;
		r0.y = r0.z * r0.y;
		r0.y = fma(r6.w, r4.w, -r0.y);
		r0.z = -r0.z + r4.w;
		r0.y = r0.y / r0.z;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r7.zw, r8.xy);
	}
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r0.yz = ((texture(resourceSamplerPair_3_ps, r1.xyz)).xywz).yz;
	r0.yz = fma(r0.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.z = ((texture(resourceSamplerPair_4_ps, r1.xyz)).xywz).z;
	r1.w = idx_uniforms1_ps.cb1[7].y;
	r7.xy = ((texture(resourceSamplerPair_3_ps, r1.xyw)).ywxz).xy;
	r7.xy = fma(r7.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r7.xy = r2.yy * r7.xy;
	r0.yz = fma(r2.xx, r0.yz, r7.xy);
	r1.w = ((texture(resourceSamplerPair_4_ps, r1.xyw))).w;
	r1.w = r1.w * r3.y;
	r1.z = fma(r3.x, r1.z, r1.w);
	r7.xy = r1.xy;
	r7.z = idx_uniforms1_ps.cb1[8].y;
	r2.xy = ((texture(resourceSamplerPair_3_ps, r7.xyz)).ywxz).xy;
	r2.xy = fma(r2.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.yz = fma(r2.zz, r2.xy, r0.yz);
	r1.w = ((texture(resourceSamplerPair_4_ps, r7.xyz))).w;
	r1.z = fma(r3.z, r1.w, r1.z);
	r7.w = idx_uniforms1_ps.cb1[9].y;
	r2.xy = ((texture(resourceSamplerPair_3_ps, r7.xyw)).ywxz).xy;
	r2.xy = fma(r2.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.yz = fma(r2.ww, r2.xy, r0.yz);
	r1.w = ((texture(resourceSamplerPair_4_ps, r7.xyw))).w;
	r1.z = fma(r3.w, r1.w, r1.z);
	r0.yz = fma(r0.yz, r0.ww, -r4.yz);
	r0.yz = fma(r0.ww, r0.yz, r4.yz);
	r1.w = dot(r0.yz, r0.yz);
	r1.w = -r1.w + float(1.00000000f);
	r1.w = sqrt(abs(r1.w));
	r2.x = r6.y * r0.y;
	r2.y = -r6.x * r0.y;
	r2.z = uintBitsToFloat(uint(0x00000000));
	r2.xyz = fma(r5.xyz, r0.xxx, r2.xyz);
	r2.xyz = fma(r1.www, r6.xyz, r2.xyz);
	r3.x = uintBitsToFloat(uint(0x00000000));
	r3.yz = r6.zy * vec2(1.00000000f, -1.00000000f);
	r2.xyz = fma(r0.zzz, r3.xyz, r2.xyz);
	r0.y = dot(r2.xyz, r2.xyz);
	r0.y = inversesqrt(r0.y);
	r2.xzw = r0.yyy * r2.xyz;
	r0.z = -r4.x + r1.z;
	r4.y = saturate(fma(r0.w, r0.z, r4.x));
	r0.zw = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r1.xy);
	r1.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r1.x = v2.v.x;
	r0.zw = fma(-r0.zw, vec2(9.00000000f, 9.00000000f), r1.xy);
	r1 = r0.zwzw * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_6_ps, r1.xy))).xyz;
	r3.w = saturate(r2.w * idx_uniforms1_ps.cb1[14].z);
	r0.y = fma(r2.y, r0.y, r3.w);
	r2.y = intBitsToFloat(r0.y >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_7_ps, r1.xy));
	r1.x = ((texture(resourceSamplerPair_7_ps, r1.zw)).wxyz).x;
	r1.yz = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.zw = fma(r0.zw, vec2(0.0206250008f, 0.00562500022f), r1.yz);
	r0.z = ((texture(resourceSamplerPair_7_ps, r0.zw)).xywz).z;
	if (floatBitsToUint(r2.y) != uint(0))
	{
		r1.yzw = fma(r7.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7 = r1.zwww * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r6.y * r7.x;
		r9.y = -r6.x * r7.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r5.xyz = fma(r5.xyz, r0.xxx, r9.xyz);
		r1.yzw = fma(r1.yyy, r6.xyz, r5.xyz);
		r1.yzw = fma(r7.yzw, r3.xyz, r1.yzw);
		r0.x = dot(r1.yzw, r1.yzw);
		r0.x = inversesqrt(r0.x);
		r3 = (texture(resourceSamplerPair_8_ps, v1.v.zw));
		r0.w = min(r3.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r2.y = uintBitsToFloat(uint(0x3f800000));
		r3.xyz = r3.xyz * r8.xyz;
		r2.y = fma(r8.w, r2.y, float(0.750000000f));
		r3.w = r1.x * r2.y;
		r4.w = r0.w * float(0.699999988f);
		r1.x = fma(-r1.x, r2.y, float(0.100000001f));
		r1.x = fma(r4.w, r1.x, r3.w);
		r0.z = -r0.z + float(1.00000000f);
		r0.z = saturate(fma(-r0.z, idx_uniforms1_ps.cb1[15].x, r1.x));
		r0.z = r0.z * r0.w;
		r0.w = r0.z * float(3.00000000f);
		r0.z = fma(r0.z, float(-0.300000012f), float(0.800000012f));
		r0.w = min(r0.w, float(1.00000000f));
		r1.x = -r0.z + float(1.00000000f);
		r0.w = r0.w / r1.x;
		r0.y = -r0.z + r0.y;
		r0.y = saturate(r0.w * r0.y);
		r3.xyz = fma(r3.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r3.xyz = fma(r0.yyy, r3.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r4.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r5.xyz = -r4.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r4.xyz = fma(r0.yyy, r5.xyz, r4.xyz);
		r0.xzw = fma(r1.yzw, r0.xxx, -r2.xzw);
		r0.xyz = fma(r0.yyy, r0.xzw, r2.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r2.xzw = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r4.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r2.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r3.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r4.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

