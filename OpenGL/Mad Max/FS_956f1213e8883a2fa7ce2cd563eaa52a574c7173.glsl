#version 460 core
// ps_5_0
// Checksum: 1aafa0f7_097604b1_95b3c905_db9e969b
// Name: fastter_lod01cidx3

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12;

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
	r4.xyz = r5.xyz / r2.zzz;
	r5.xy = r4.xx * idx_uniforms1_ps.cb1[6].wz;
	r2.z = fma(idx_uniforms1_ps.cb1[7].w, r4.y, r5.x);
	r2.z = fma(idx_uniforms1_ps.cb1[8].w, r4.z, r2.z);
	r0.xy = ((texture(resourceSamplerPair_3_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r2.z = r2.z * float(1.50000000f);
	r0.xy = fma(r2.zz, r0.xy, -r2.xy);
	r5.z = r4.y * idx_uniforms1_ps.cb1[7].z;
	r5.w = r4.z * idx_uniforms1_ps.cb1[8].z;
	r2.xyz = r5.yzw * vec3(8.00000000f, 8.00000000f, 8.00000000f);
	r5.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r5.z = idx_uniforms1_ps.cb1[6].y;
	r6.xy = ((texture(resourceSamplerPair_4_ps, r5.xyz)).ywxz).xy;
	r6.xy = fma(r6.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r5 = (texture(resourceSamplerPair_5_ps, r5.xyz));
	r7.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r7.z = idx_uniforms1_ps.cb1[7].y;
	r6.zw = ((texture(resourceSamplerPair_4_ps, r7.xyz)).xzyw).zw;
	r6.zw = fma(r6.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r6.zw = r2.yy * r6.zw;
	r6.xy = fma(r2.xx, r6.xy, r6.zw);
	r7 = (texture(resourceSamplerPair_5_ps, r7.xyz));
	r7 = r4.yyyy * r7;
	r5 = fma(r4.xxxx, r5, r7);
	r7.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r7.z = idx_uniforms1_ps.cb1[8].y;
	r6.zw = ((texture(resourceSamplerPair_4_ps, r7.xyz)).xzyw).zw;
	r6.zw = fma(r6.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r6.xy = fma(r2.zz, r6.zw, r6.xy);
	r7 = (texture(resourceSamplerPair_5_ps, r7.xyz));
	r5 = fma(r4.zzzz, r7, r5);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r2.w = dot(r0.xy, r0.xy);
	r2.w = r2.w + float(1.00000000f);
	r7.y = inversesqrt(r2.w);
	r7.xz = r0.xy * r7.yy;
	r8.xyz = -r7.xyz + v4.v.xyz;
	r7.xyz = fma(r0.www, r8.xyz, r7.xyz);
	r0.x = dot(r7.xyz, r7.xyz);
	r0.x = inversesqrt(r0.x);
	r8.xyz = r0.xxx * r7.xyz;
	r0.y = dot(v4.v.xyz, v4.v.xyz);
	r0.y = inversesqrt(r0.y);
	r9.xyz = r0.yyy * v4.v.xyz;
	r10.xyz = r9.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r10.xyz = fma(r9.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r10.xyz);
	r0.y = dot(r10.xy, r10.xy);
	r0.y = inversesqrt(r0.y);
	r10.xyz = r0.yyy * r10.xyz;
	r0.y = dot(r10.xy, r9.xy);
	r10.xyz = fma(-r9.xyz, r0.yyy, r10.xyz);
	r0.y = dot(r10.xyz, r10.xyz);
	r0.y = inversesqrt(r0.y);
	r10.xyz = r0.yyy * r10.xyz;
	r11.xyz = r9.zxy * r10.yzx;
	r11.xyz = fma(r9.yzx, r10.zxy, -r11.xyz);
	r12.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r0.y = dot(r12.xyz, r12.xyz);
	r0.y = inversesqrt(r0.y);
	r12.xyz = r0.yyy * r12.xyz;
	r10.x = dot(-r10.xyz, r12.xyz);
	r10.y = dot(r11.xyz, r12.xyz);
	r0.y = dot(-r9.xyz, r12.xyz);
	r2.w = max(-r0.y, float(0.500000000f));
	r4.w = -r0.w + float(1.00000000f);
	r4.w = fma(r4.w, float(3.00000000f), float(1.00000000f));
	r2.w = r2.w * r4.w;
	r2.w = float(8.00000000f) / r2.w;
	r2.w = max(r2.w, float(1.00000000f));
	r4.w = float(1.00000000f) / r2.w;
	r0.y = min(r0.y, float(-0.200000003f));
	r0.y = r0.y * r2.w;
	r6.zw = r10.xy / r0.yy;
	r9.xyz = r4.xyz + vec3(-0.400000006f, -0.400000006f, -0.400000006f);
	r9.xyz = saturate(r9.xyz * vec3(6.00000000f, 6.00000000f, 6.00000000f));
	r10.xyz = intBitsToFloat(mix ( ivec3(0x00000000),ivec3(0xffffffff),bvec3(lessThan(vec3(0.400000006f, 0.400000006f, 0.400000006f), r4.xyz))));
	if (floatBitsToUint(r10.x) != uint(0))
	{
		r0.y = r9.x * idx_uniforms1_ps.cb1[6].x;
		r0.y = r0.y * float(0.0799999982f);
		r9.xw = r0.yy * r6.zw;
		r9.xw = r2.ww * r9.xw;
		r10.xw = fma(-r9.xw, vec2(0.500000000f, 0.500000000f), r1.xy);
		r11.z = idx_uniforms1_ps.cb1[6].y;
		r11.xy = r10.xw;
		r7.w = uintBitsToFloat(uint(0x3f800000));
		r8.w = uintBitsToFloat(uint(0x00000000));
		r11.w = uintBitsToFloat(uint(0x00000000));
		r12.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r12.y = intBitsToFloat(r12.x < r2.w ? int(0xffffffff) : int(0x00000000));
			r12.z = intBitsToFloat(r8.w < r7.w ? int(0xffffffff) : int(0x00000000));
			r12.y = uintBitsToFloat(floatBitsToUint(r12.z) & floatBitsToUint(r12.y));
			if (floatBitsToUint(r12.y) == uint(0))
				break;
			r7.w = -r4.w + r7.w;
			r11.xy = fma(r6.zw, r0.yy, r11.xy);
			r12.y = ((textureLod(resourceSamplerPair_6_ps, r11.xyz, r0.z)).xwyz).y;
			r12.x = r12.x + float(1.00000000f);
			r11.w = r8.w;
			r8.w = r12.y;
		}
		r0.y = r4.w + r7.w;
		r8.w = r7.w + -r8.w;
		r11.x = -r11.w + r0.y;
		r0.y = r0.y * r8.w;
		r0.y = fma(r7.w, r11.x, -r0.y);
		r7.w = -r8.w + r11.x;
		r0.y = r0.y / r7.w;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r9.xw, r10.xw);
	}
	if (floatBitsToUint(r10.y) != uint(0))
	{
		r0.y = r9.y * idx_uniforms1_ps.cb1[7].x;
		r0.y = r0.y * float(0.0799999982f);
		r9.xy = r0.yy * r6.zw;
		r9.xy = r2.ww * r9.xy;
		r10.xy = fma(-r9.xy, vec2(0.500000000f, 0.500000000f), r1.xy);
		r11.z = idx_uniforms1_ps.cb1[7].y;
		r11.xy = r10.xy;
		r7.w = uintBitsToFloat(uint(0x3f800000));
		r8.w = uintBitsToFloat(uint(0x00000000));
		r9.w = uintBitsToFloat(uint(0x00000000));
		r10.w = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r11.w = intBitsToFloat(r10.w < r2.w ? int(0xffffffff) : int(0x00000000));
			r12.x = intBitsToFloat(r8.w < r7.w ? int(0xffffffff) : int(0x00000000));
			r11.w = uintBitsToFloat(floatBitsToUint(r11.w) & floatBitsToUint(r12.x));
			if (floatBitsToUint(r11.w) == uint(0))
				break;
			r7.w = -r4.w + r7.w;
			r11.xy = fma(r6.zw, r0.yy, r11.xy);
			r11.w = ((textureLod(resourceSamplerPair_6_ps, r11.xyz, r0.z))).w;
			r10.w = r10.w + float(1.00000000f);
			r9.w = r8.w;
			r8.w = r11.w;
		}
		r0.y = r4.w + r7.w;
		r8.w = r7.w + -r8.w;
		r9.w = -r9.w + r0.y;
		r0.y = r0.y * r8.w;
		r0.y = fma(r7.w, r9.w, -r0.y);
		r7.w = -r8.w + r9.w;
		r0.y = r0.y / r7.w;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r9.xy, r10.xy);
	}
	if (floatBitsToUint(r10.z) != uint(0))
	{
		r0.y = r9.z * idx_uniforms1_ps.cb1[8].x;
		r0.y = r0.y * float(0.0799999982f);
		r9.xy = r0.yy * r6.zw;
		r9.xy = r2.ww * r9.xy;
		r9.zw = fma(-r9.xy, vec2(0.500000000f, 0.500000000f), r1.xy);
		r10.z = idx_uniforms1_ps.cb1[8].y;
		r10.xy = r9.zw;
		r7.w = uintBitsToFloat(uint(0x3f800000));
		r8.w = uintBitsToFloat(uint(0x00000000));
		r10.w = uintBitsToFloat(uint(0x00000000));
		r11.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r11.y = intBitsToFloat(r11.x < r2.w ? int(0xffffffff) : int(0x00000000));
			r11.z = intBitsToFloat(r8.w < r7.w ? int(0xffffffff) : int(0x00000000));
			r11.y = uintBitsToFloat(floatBitsToUint(r11.z) & floatBitsToUint(r11.y));
			if (floatBitsToUint(r11.y) == uint(0))
				break;
			r7.w = -r4.w + r7.w;
			r10.xy = fma(r6.zw, r0.yy, r10.xy);
			r11.y = ((textureLod(resourceSamplerPair_6_ps, r10.xyz, r0.z)).xwyz).y;
			r11.x = r11.x + float(1.00000000f);
			r10.w = r8.w;
			r8.w = r11.y;
		}
		r0.y = r4.w + r7.w;
		r0.z = r7.w + -r8.w;
		r2.w = -r10.w + r0.y;
		r0.y = r0.z * r0.y;
		r0.y = fma(r7.w, r2.w, -r0.y);
		r0.z = -r0.z + r2.w;
		r0.y = r0.y / r0.z;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r9.xy, r9.zw);
	}
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r0.yz = ((texture(resourceSamplerPair_4_ps, r1.xyz)).xywz).yz;
	r0.yz = fma(r0.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r9 = (texture(resourceSamplerPair_5_ps, r1.xyz));
	r1.w = idx_uniforms1_ps.cb1[7].y;
	r6.zw = ((texture(resourceSamplerPair_4_ps, r1.xyw)).xzyw).zw;
	r6.zw = fma(r6.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r2.yw = r2.yy * r6.zw;
	r0.yz = fma(r2.xx, r0.yz, r2.yw);
	r10 = (texture(resourceSamplerPair_5_ps, r1.xyw));
	r10 = r4.yyyy * r10;
	r9 = fma(r4.xxxx, r9, r10);
	r10.xy = r1.xy;
	r10.z = idx_uniforms1_ps.cb1[8].y;
	r1.zw = ((texture(resourceSamplerPair_4_ps, r10.xyz)).xzyw).zw;
	r1.zw = fma(r1.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.yz = fma(r2.zz, r1.zw, r0.yz);
	r2 = (texture(resourceSamplerPair_5_ps, r10.xyz));
	r2 = fma(r4.zzzz, r2, r9);
	r0.yz = fma(r0.yz, r0.ww, -r6.xy);
	r0.yz = fma(r0.ww, r0.yz, r6.xy);
	r1.z = dot(r0.yz, r0.yz);
	r1.z = -r1.z + float(1.00000000f);
	r1.z = sqrt(abs(r1.z));
	r4.x = r8.y * r0.y;
	r4.y = -r8.x * r0.y;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r4.xyz = fma(r7.xyz, r0.xxx, r4.xyz);
	r4.xyz = fma(r1.zzz, r8.xyz, r4.xyz);
	r6.x = uintBitsToFloat(uint(0x00000000));
	r6.yz = r8.zy * vec2(1.00000000f, -1.00000000f);
	r4.xyz = fma(r0.zzz, r6.xyz, r4.xyz);
	r0.y = dot(r4.xyz, r4.xyz);
	r0.y = inversesqrt(r0.y);
	r4.xzw = r0.yyy * r4.xyz;
	r2 = -r5 + r2;
	r2 = fma(r0.wwww, r2, r5);
	r3.w = uintBitsToFloat(uint(0x3f800000));
	r2 = r2 * r3;
	r2 = saturate(r2.xwyz * vec4(4.69999981f, 1.00000000f, 4.69999981f, 4.69999981f));
	r0.zw = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r1.xy);
	r1.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r1.x = v2.v.x;
	r0.zw = fma(-r0.zw, vec2(9.00000000f, 9.00000000f), r1.xy);
	r1 = r0.zwzw * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r3.xyz = ((texture(resourceSamplerPair_7_ps, r1.xy))).xyz;
	r3.w = saturate(r4.w * idx_uniforms1_ps.cb1[14].z);
	r0.y = fma(r4.y, r0.y, r3.w);
	r3.w = intBitsToFloat(r0.y >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r5 = (texture(resourceSamplerPair_8_ps, r1.xy));
	r1.x = ((texture(resourceSamplerPair_8_ps, r1.zw)).wxyz).x;
	r1.yz = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.zw = fma(r0.zw, vec2(0.0206250008f, 0.00562500022f), r1.yz);
	r0.z = ((texture(resourceSamplerPair_8_ps, r0.zw)).xywz).z;
	if (floatBitsToUint(r3.w) != uint(0))
	{
		r1.yzw = fma(r3.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r3 = r1.zwww * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r8.y * r3.x;
		r9.y = -r8.x * r3.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.xyz = fma(r7.xyz, r0.xxx, r9.xyz);
		r1.yzw = fma(r1.yyy, r8.xyz, r7.xyz);
		r1.yzw = fma(r3.yzw, r6.xyz, r1.yzw);
		r0.x = dot(r1.yzw, r1.yzw);
		r0.x = inversesqrt(r0.x);
		r3 = (texture(resourceSamplerPair_9_ps, v1.v.zw));
		r0.w = min(r3.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r3.w = uintBitsToFloat(uint(0x3f800000));
		r3.xyz = r3.xyz * r5.xyz;
		r3.w = fma(r5.w, r3.w, float(0.750000000f));
		r4.y = r1.x * r3.w;
		r5.x = r0.w * float(0.699999988f);
		r1.x = fma(-r1.x, r3.w, float(0.100000001f));
		r1.x = fma(r5.x, r1.x, r4.y);
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
		r5.xyz = -r2.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r2.xyz = fma(r0.yyy, r5.xyz, r2.xyz);
		r0.xzw = fma(r1.yzw, r0.xxx, -r4.xzw);
		r0.xyz = fma(r0.yyy, r0.xzw, r4.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r4.xzw = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = r2.xzw;
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r4.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r3.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r2.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

