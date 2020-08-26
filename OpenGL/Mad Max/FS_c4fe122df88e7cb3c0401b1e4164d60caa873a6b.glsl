#version 460 core
// ps_5_0
// Checksum: b91dd363_4525f785_48782ad9_a0d49240
// Name: fastter_lod01cidx2

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

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2

uniform sampler2DArray resourceSamplerPair_4_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_5_ps; // res9, s9

uniform sampler2DArray resourceSamplerPair_6_ps; // res7, s7

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
	r4.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
	r2.z = saturate(dot(r4.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r4.w = -r2.z + float(1.00000000f);
	r5.x = dot(r4, idx_uniforms1_ps.cb1[10]);
	r5.y = dot(r4, idx_uniforms1_ps.cb1[11]);
	r5.z = dot(r4, idx_uniforms1_ps.cb1[12]);
	r5.w = dot(r4, idx_uniforms1_ps.cb1[13]);
	r2.z = dot(r5, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r2.zw = r5.xy / r2.zz;
	r4.z = r2.z * idx_uniforms1_ps.cb1[6].z;
	r4.xw = r2.ww * idx_uniforms1_ps.cb1[7].wz;
	r4.x = fma(idx_uniforms1_ps.cb1[6].w, r2.z, r4.x);
	r0.xy = ((texture(resourceSamplerPair_3_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r4.x = r4.x * float(1.50000000f);
	r0.xy = fma(r4.xx, r0.xy, -r2.xy);
	r2.xy = r4.zw * vec2(8.00000000f, 8.00000000f);
	r4.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r4.z = idx_uniforms1_ps.cb1[6].y;
	r5.xy = ((texture(resourceSamplerPair_4_ps, r4.xyz)).ywxz).xy;
	r5.xy = fma(r5.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4 = (texture(resourceSamplerPair_5_ps, r4.xyz));
	r6.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r6.z = idx_uniforms1_ps.cb1[7].y;
	r5.zw = ((texture(resourceSamplerPair_4_ps, r6.xyz)).xzyw).zw;
	r5.zw = fma(r5.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r5.zw = r2.yy * r5.zw;
	r5.xy = fma(r2.xx, r5.xy, r5.zw);
	r6 = (texture(resourceSamplerPair_5_ps, r6.xyz));
	r6 = r2.wwww * r6;
	r4 = fma(r2.zzzz, r4, r6);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r5.z = dot(r0.xy, r0.xy);
	r5.z = r5.z + float(1.00000000f);
	r6.y = inversesqrt(r5.z);
	r6.xz = r0.xy * r6.yy;
	r7.xyz = -r6.xyz + v4.v.xyz;
	r6.xyz = fma(r0.www, r7.xyz, r6.xyz);
	r0.x = dot(r6.xyz, r6.xyz);
	r0.x = inversesqrt(r0.x);
	r7.xyz = r0.xxx * r6.xyz;
	r0.y = dot(v4.v.xyz, v4.v.xyz);
	r0.y = inversesqrt(r0.y);
	r8.xyz = r0.yyy * v4.v.xyz;
	r9.xyz = r8.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r9.xyz = fma(r8.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r9.xyz);
	r0.y = dot(r9.xy, r9.xy);
	r0.y = inversesqrt(r0.y);
	r9.xyz = r0.yyy * r9.xyz;
	r0.y = dot(r9.xy, r8.xy);
	r9.xyz = fma(-r8.xyz, r0.yyy, r9.xyz);
	r0.y = dot(r9.xyz, r9.xyz);
	r0.y = inversesqrt(r0.y);
	r9.xyz = r0.yyy * r9.xyz;
	r10.xyz = r8.zxy * r9.yzx;
	r10.xyz = fma(r8.yzx, r9.zxy, -r10.xyz);
	r11.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r0.y = dot(r11.xyz, r11.xyz);
	r0.y = inversesqrt(r0.y);
	r11.xyz = r0.yyy * r11.xyz;
	r9.x = dot(-r9.xyz, r11.xyz);
	r9.y = dot(r10.xyz, r11.xyz);
	r0.y = dot(-r8.xyz, r11.xyz);
	r5.z = max(-r0.y, float(0.500000000f));
	r5.w = -r0.w + float(1.00000000f);
	r5.w = fma(r5.w, float(3.00000000f), float(1.00000000f));
	r5.z = r5.w * r5.z;
	r5.z = float(8.00000000f) / r5.z;
	r5.z = max(r5.z, float(1.00000000f));
	r5.w = float(1.00000000f) / r5.z;
	r0.y = min(r0.y, float(-0.200000003f));
	r0.y = r0.y * r5.z;
	r8.xy = r9.xy / r0.yy;
	r8.zw = r2.zw + vec2(-0.400000006f, -0.400000006f);
	r8.zw = saturate(r8.zw * vec2(6.00000000f, 6.00000000f));
	r9.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(vec2(0.400000006f, 0.400000006f), r2.zw))));
	if (floatBitsToUint(r9.x) != uint(0))
	{
		r0.y = r8.z * idx_uniforms1_ps.cb1[6].x;
		r0.y = r0.y * float(0.0799999982f);
		r9.xz = r0.yy * r8.xy;
		r9.xz = r5.zz * r9.xz;
		r10.xy = fma(-r9.xz, vec2(0.500000000f, 0.500000000f), r1.xy);
		r11.z = idx_uniforms1_ps.cb1[6].y;
		r11.xy = r10.xy;
		r6.w = uintBitsToFloat(uint(0x3f800000));
		r7.w = uintBitsToFloat(uint(0x00000000));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r9.w = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r10.z = intBitsToFloat(r9.w < r5.z ? int(0xffffffff) : int(0x00000000));
			r10.w = intBitsToFloat(r7.w < r6.w ? int(0xffffffff) : int(0x00000000));
			r10.z = uintBitsToFloat(floatBitsToUint(r10.w) & floatBitsToUint(r10.z));
			if (floatBitsToUint(r10.z) == uint(0))
				break;
			r6.w = -r5.w + r6.w;
			r11.xy = fma(r8.xy, r0.yy, r11.xy);
			r10.z = ((textureLod(resourceSamplerPair_6_ps, r11.xyz, r0.z)).xywz).z;
			r9.w = r9.w + float(1.00000000f);
			r8.z = r7.w;
			r7.w = r10.z;
		}
		r0.y = r5.w + r6.w;
		r7.w = r6.w + -r7.w;
		r8.z = -r8.z + r0.y;
		r0.y = r0.y * r7.w;
		r0.y = fma(r6.w, r8.z, -r0.y);
		r6.w = -r7.w + r8.z;
		r0.y = r0.y / r6.w;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r9.xz, r10.xy);
	}
	if (floatBitsToUint(r9.y) != uint(0))
	{
		r0.y = r8.w * idx_uniforms1_ps.cb1[7].x;
		r0.y = r0.y * float(0.0799999982f);
		r8.zw = r0.yy * r8.xy;
		r8.zw = r5.zz * r8.zw;
		r9.xy = fma(-r8.zw, vec2(0.500000000f, 0.500000000f), r1.xy);
		r10.z = idx_uniforms1_ps.cb1[7].y;
		r10.xy = r9.xy;
		r6.w = uintBitsToFloat(uint(0x3f800000));
		r7.w = uintBitsToFloat(uint(0x00000000));
		r9.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r10.w = intBitsToFloat(r9.w < r5.z ? int(0xffffffff) : int(0x00000000));
			r11.x = intBitsToFloat(r7.w < r6.w ? int(0xffffffff) : int(0x00000000));
			r10.w = uintBitsToFloat(floatBitsToUint(r10.w) & floatBitsToUint(r11.x));
			if (floatBitsToUint(r10.w) == uint(0))
				break;
			r6.w = -r5.w + r6.w;
			r10.xy = fma(r8.xy, r0.yy, r10.xy);
			r10.w = ((textureLod(resourceSamplerPair_6_ps, r10.xyz, r0.z))).w;
			r9.w = r9.w + float(1.00000000f);
			r9.z = r7.w;
			r7.w = r10.w;
		}
		r0.y = r5.w + r6.w;
		r0.z = r6.w + -r7.w;
		r5.z = -r9.z + r0.y;
		r0.y = r0.z * r0.y;
		r0.y = fma(r6.w, r5.z, -r0.y);
		r0.z = -r0.z + r5.z;
		r0.y = r0.y / r0.z;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r8.zw, r9.xy);
	}
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r0.yz = ((texture(resourceSamplerPair_4_ps, r1.xyz)).xywz).yz;
	r0.yz = fma(r0.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r8 = (texture(resourceSamplerPair_5_ps, r1.xyz));
	r1.w = idx_uniforms1_ps.cb1[7].y;
	r5.zw = ((texture(resourceSamplerPair_4_ps, r1.xyw)).xzyw).zw;
	r5.zw = fma(r5.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r5.zw = r2.yy * r5.zw;
	r0.yz = fma(r2.xx, r0.yz, r5.zw);
	r9 = (texture(resourceSamplerPair_5_ps, r1.xyw));
	r9 = r2.wwww * r9;
	r2 = fma(r2.zzzz, r8, r9);
	r0.yz = fma(r0.yz, r0.ww, -r5.xy);
	r0.yz = fma(r0.ww, r0.yz, r5.xy);
	r1.z = dot(r0.yz, r0.yz);
	r1.z = -r1.z + float(1.00000000f);
	r1.z = sqrt(abs(r1.z));
	r5.x = r7.y * r0.y;
	r5.y = -r7.x * r0.y;
	r5.z = uintBitsToFloat(uint(0x00000000));
	r5.xyz = fma(r6.xyz, r0.xxx, r5.xyz);
	r5.xyz = fma(r1.zzz, r7.xyz, r5.xyz);
	r8.x = uintBitsToFloat(uint(0x00000000));
	r8.yz = r7.zy * vec2(1.00000000f, -1.00000000f);
	r5.xyz = fma(r0.zzz, r8.xyz, r5.xyz);
	r0.y = dot(r5.xyz, r5.xyz);
	r0.y = inversesqrt(r0.y);
	r5.xzw = r0.yyy * r5.xyz;
	r2 = -r4 + r2;
	r2 = fma(r0.wwww, r2, r4);
	r3.w = uintBitsToFloat(uint(0x3f800000));
	r2 = r2 * r3;
	r2 = saturate(r2.xwyz * vec4(4.69999981f, 1.00000000f, 4.69999981f, 4.69999981f));
	r0.zw = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r1.xy);
	r1.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r1.x = v2.v.x;
	r0.zw = fma(-r0.zw, vec2(9.00000000f, 9.00000000f), r1.xy);
	r1 = r0.zwzw * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r3.xyz = ((texture(resourceSamplerPair_7_ps, r1.xy))).xyz;
	r3.w = saturate(r5.w * idx_uniforms1_ps.cb1[14].z);
	r0.y = fma(r5.y, r0.y, r3.w);
	r3.w = intBitsToFloat(r0.y >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r4 = (texture(resourceSamplerPair_8_ps, r1.xy));
	r1.x = ((texture(resourceSamplerPair_8_ps, r1.zw)).wxyz).x;
	r1.yz = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.zw = fma(r0.zw, vec2(0.0206250008f, 0.00562500022f), r1.yz);
	r0.z = ((texture(resourceSamplerPair_8_ps, r0.zw)).xywz).z;
	if (floatBitsToUint(r3.w) != uint(0))
	{
		r1.yzw = fma(r3.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r3 = r1.zwww * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r7.y * r3.x;
		r9.y = -r7.x * r3.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r6.xyz = fma(r6.xyz, r0.xxx, r9.xyz);
		r1.yzw = fma(r1.yyy, r7.xyz, r6.xyz);
		r1.yzw = fma(r3.yzw, r8.xyz, r1.yzw);
		r0.x = dot(r1.yzw, r1.yzw);
		r0.x = inversesqrt(r0.x);
		r3 = (texture(resourceSamplerPair_9_ps, v1.v.zw));
		r0.w = min(r3.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r3.w = uintBitsToFloat(uint(0x3f800000));
		r3.xyz = r3.xyz * r4.xyz;
		r3.w = fma(r4.w, r3.w, float(0.750000000f));
		r4.x = r1.x * r3.w;
		r4.y = r0.w * float(0.699999988f);
		r1.x = fma(-r1.x, r3.w, float(0.100000001f));
		r1.x = fma(r4.y, r1.x, r4.x);
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
		r3.xyz = fma(r3.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r2.xzw);
		r3.xyz = fma(r0.yyy, r3.xyz, r2.xzw);
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r2.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r2.xyz = fma(r0.yyy, r4.xyz, r2.xyz);
		r0.xzw = fma(r1.yzw, r0.xxx, -r5.xzw);
		r0.xyz = fma(r0.yyy, r0.xzw, r5.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r5.xzw = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = r2.xzw;
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r5.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r3.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r2.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

