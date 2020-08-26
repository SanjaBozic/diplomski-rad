#version 460 core
// ps_5_0
// Checksum: 8d0c9ab9_1e19733f_ca9c48af_5efd17c9
// Name: fastter_lod01cidx1cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

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
	r0.z = saturate(v3.v.x);
	r2.xy = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).xwyz).xy;
	r2.xy = fma(r2.xy, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r3.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r0.w = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r0.w + float(1.00000000f);
	r4.x = dot(r3, idx_uniforms1_ps.cb1[10]);
	r4.y = dot(r3, idx_uniforms1_ps.cb1[11]);
	r4.z = dot(r3, idx_uniforms1_ps.cb1[12]);
	r4.w = dot(r3, idx_uniforms1_ps.cb1[13]);
	r0.w = dot(r4, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = r4.x / r0.w;
	r2.zw = r0.ww * idx_uniforms1_ps.cb1[6].wz;
	r0.xy = ((texture(resourceSamplerPair_2_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r2.zw = r2.zw * vec2(1.50000000f, 8.00000000f);
	r0.xy = fma(r2.zz, r0.xy, -r2.xy);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r2.z = idx_uniforms1_ps.cb1[6].y;
	r3.xy = ((texture(resourceSamplerPair_3_ps, r2.xyz)).ywxz).xy;
	r3.xy = fma(r3.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r3.xy = r2.ww * r3.xy;
	r1.w = ((texture(resourceSamplerPair_4_ps, r2.xyz))).w;
	r1.w = r0.w * r1.w;
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r2.x = dot(r0.xy, r0.xy);
	r2.x = r2.x + float(1.00000000f);
	r2.y = inversesqrt(r2.x);
	r2.xz = r0.xy * r2.yy;
	r4.xyz = -r2.xyz + v4.v.xyz;
	r2.xyz = fma(r0.zzz, r4.xyz, r2.xyz);
	r0.x = dot(r2.xyz, r2.xyz);
	r0.x = inversesqrt(r0.x);
	r4.xyz = r0.xxx * r2.xyz;
	r0.y = intBitsToFloat(float(0.400000006f) < r0.w ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r5.xy = dFdxCoarse(v2.v.xz);
		r5.zw = dFdyCoarse(v2.v.xz);
		r0.y = dot(r5, r5);
		r0.y = log2(r0.y);
		r0.y = fma(r0.y, float(0.500000000f), float(6.50000000f));
		r0.y = min(r0.y, float(6.00000000f));
		r3.z = dot(v4.v.xyz, v4.v.xyz);
		r3.z = inversesqrt(r3.z);
		r5.xyz = r3.zzz * v4.v.xyz;
		r6.xyz = r5.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
		r6.xyz = fma(r5.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r6.xyz);
		r3.z = dot(r6.xy, r6.xy);
		r3.z = inversesqrt(r3.z);
		r6.xyz = r3.zzz * r6.xyz;
		r3.z = dot(r6.xy, r5.xy);
		r6.xyz = fma(-r5.xyz, r3.zzz, r6.xyz);
		r3.z = dot(r6.xyz, r6.xyz);
		r3.z = inversesqrt(r3.z);
		r6.xyz = r3.zzz * r6.xyz;
		r7.xyz = r5.zxy * r6.yzx;
		r7.xyz = fma(r5.yzx, r6.zxy, -r7.xyz);
		r8.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
		r3.z = dot(r8.xyz, r8.xyz);
		r3.z = inversesqrt(r3.z);
		r8.xyz = r3.zzz * r8.xyz;
		r6.x = dot(-r6.xyz, r8.xyz);
		r6.y = dot(r7.xyz, r8.xyz);
		r3.z = dot(-r5.xyz, r8.xyz);
		r3.w = max(-r3.z, float(0.500000000f));
		r4.w = -r0.z + float(1.00000000f);
		r4.w = fma(r4.w, float(3.00000000f), float(1.00000000f));
		r3.w = r3.w * r4.w;
		r3.w = float(8.00000000f) / r3.w;
		r3.w = max(r3.w, float(1.00000000f));
		r4.w = float(1.00000000f) / r3.w;
		r3.z = min(r3.z, float(-0.200000003f));
		r3.z = r3.z * r3.w;
		r5.xy = r6.xy / r3.zz;
		r3.z = r0.w + float(-0.400000006f);
		r3.z = saturate(r3.z * float(6.00000000f));
		r3.z = r3.z * idx_uniforms1_ps.cb1[6].x;
		r3.z = r3.z * float(0.0799999982f);
		r5.zw = r3.zz * r5.xy;
		r5.zw = r3.ww * r5.zw;
		r6.xy = fma(-r5.zw, vec2(0.500000000f, 0.500000000f), r1.xy);
		r7.z = idx_uniforms1_ps.cb1[6].y;
		r7.xy = r6.xy;
		r6.zw = uintBitsToFloat(uvec2(0x3f800000, 0x00000000));
		r7.w = uintBitsToFloat(uint(0x00000000));
		r8.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r8.y = intBitsToFloat(r8.x < r3.w ? int(0xffffffff) : int(0x00000000));
			r8.z = intBitsToFloat(r6.w < r6.z ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r8.z) & floatBitsToUint(r8.y));
			if (floatBitsToUint(r8.y) == uint(0))
				break;
			r6.z = -r4.w + r6.z;
			r7.xy = fma(r5.xy, r3.zz, r7.xy);
			r8.y = ((textureLod(resourceSamplerPair_5_ps, r7.xyz, r0.y)).xwyz).y;
			r8.x = r8.x + float(1.00000000f);
			r7.w = r6.w;
			r6.w = r8.y;
		}
		r0.y = r4.w + r6.z;
		r3.z = -r6.w + r6.z;
		r3.w = -r7.w + r0.y;
		r0.y = r0.y * r3.z;
		r0.y = fma(r6.z, r3.w, -r0.y);
		r3.z = -r3.z + r3.w;
		r0.y = r0.y / r3.z;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r5.zw, r6.xy);
	}
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r3.zw = ((texture(resourceSamplerPair_3_ps, r1.xyz)).xzyw).zw;
	r3.zw = fma(r3.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r3.zw = r2.ww * r3.zw;
	r0.y = ((texture(resourceSamplerPair_4_ps, r1.xyz)).xwyz).y;
	r3.zw = fma(r3.zw, r0.zz, -r3.xy);
	r3.xy = fma(r0.zz, r3.zw, r3.xy);
	r1.z = dot(r3.xy, r3.xy);
	r1.z = -r1.z + float(1.00000000f);
	r1.z = sqrt(abs(r1.z));
	r5.x = r4.y * r3.x;
	r5.y = -r4.x * r3.x;
	r5.z = uintBitsToFloat(uint(0x00000000));
	r3.xzw = fma(r2.xyz, r0.xxx, r5.xyz);
	r3.xzw = fma(r1.zzz, r4.xyz, r3.xzw);
	r5.x = uintBitsToFloat(uint(0x00000000));
	r5.yz = r4.zy * vec2(1.00000000f, -1.00000000f);
	r3.xyz = fma(r3.yyy, r5.xyz, r3.xzw);
	r1.z = dot(r3.xyz, r3.xyz);
	r1.z = inversesqrt(r1.z);
	r3.xzw = r1.zzz * r3.xyz;
	r0.y = fma(r0.w, r0.y, -r1.w);
	r6.y = saturate(fma(r0.z, r0.y, r1.w));
	r0.yz = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r1.xy);
	r1.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r1.x = v2.v.x;
	r0.yz = fma(-r0.yz, vec2(9.00000000f, 9.00000000f), r1.xy);
	r7 = r0.yzyz * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r1.xyw = ((texture(resourceSamplerPair_6_ps, r7.xy)).xywz).xyw;
	r0.w = saturate(r3.w * idx_uniforms1_ps.cb1[14].z);
	r0.w = fma(r3.y, r1.z, r0.w);
	r1.z = intBitsToFloat(r0.w >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_7_ps, r7.xy));
	r2.w = ((texture(resourceSamplerPair_7_ps, r7.zw))).w;
	r7.xy = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.yz = fma(r0.yz, vec2(0.0206250008f, 0.00562500022f), r7.xy);
	r0.y = ((texture(resourceSamplerPair_7_ps, r0.yz)).xwyz).y;
	if (floatBitsToUint(r1.z) != uint(0))
	{
		r1.xyz = fma(r1.wxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7 = r1.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r4.y * r7.x;
		r9.y = -r4.x * r7.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r1.yzw = fma(r2.xyz, r0.xxx, r9.xyz);
		r1.xyz = fma(r1.xxx, r4.xyz, r1.yzw);
		r1.xyz = fma(r7.yzw, r5.xyz, r1.xyz);
		r0.x = dot(r1.xyz, r1.xyz);
		r0.x = inversesqrt(r0.x);
		r4 = (texture(resourceSamplerPair_8_ps, v1.v.zw));
		r0.z = min(r4.w, idx_uniforms1_ps.cb1[14].x);
		r0.z = saturate(r0.z * idx_uniforms1_ps.cb1[14].y);
		r1.w = uintBitsToFloat(uint(0x3f800000));
		r2.xyz = r4.xyz * r8.xyz;
		r1.w = fma(r8.w, r1.w, float(0.750000000f));
		r3.y = r1.w * r2.w;
		r4.x = r0.z * float(0.699999988f);
		r1.w = fma(-r2.w, r1.w, float(0.100000001f));
		r1.w = fma(r4.x, r1.w, r3.y);
		r0.y = -r0.y + float(1.00000000f);
		r0.y = saturate(fma(-r0.y, idx_uniforms1_ps.cb1[15].x, r1.w));
		r0.y = r0.y * r0.z;
		r0.z = r0.y * float(3.00000000f);
		r0.y = fma(r0.y, float(-0.300000012f), float(0.800000012f));
		r0.z = min(r0.z, float(1.00000000f));
		r1.w = -r0.y + float(1.00000000f);
		r0.z = r0.z / r1.w;
		r0.y = -r0.y + r0.w;
		r0.y = saturate(r0.z * r0.y);
		r2.xyz = fma(r2.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r2.xyz = fma(r0.yyy, r2.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r6.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r6.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r6.xyz = fma(r0.yyy, r4.xyz, r6.xyz);
		r0.xzw = fma(r1.xyz, r0.xxx, -r3.xzw);
		r0.xyz = fma(r0.yyy, r0.xzw, r3.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r3.xzw = r0.www * r0.xyz;
	}
	else
	{
		r2.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r6.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r3.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r2.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r6.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

