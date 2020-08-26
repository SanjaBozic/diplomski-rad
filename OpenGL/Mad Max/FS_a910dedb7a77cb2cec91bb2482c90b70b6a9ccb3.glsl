#version 460 core
// ps_5_0
// Checksum: 18913a9d_cdf9b69b_c613da10_5a9ee24c
// Name: fastter_lod01cidx1

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10;

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
	r0.z = saturate(v3.v.x);
	r2.xy = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).xwyz).xy;
	r2.xy = fma(r2.xy, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r3.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r4.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
	r0.w = saturate(dot(r4.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r4.w = -r0.w + float(1.00000000f);
	r5.x = dot(r4, idx_uniforms1_ps.cb1[10]);
	r5.y = dot(r4, idx_uniforms1_ps.cb1[11]);
	r5.z = dot(r4, idx_uniforms1_ps.cb1[12]);
	r5.w = dot(r4, idx_uniforms1_ps.cb1[13]);
	r0.w = dot(r5, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = r5.x / r0.w;
	r2.zw = r0.ww * idx_uniforms1_ps.cb1[6].wz;
	r0.xy = ((texture(resourceSamplerPair_3_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r2.zw = r2.zw * vec2(1.50000000f, 8.00000000f);
	r0.xy = fma(r2.zz, r0.xy, -r2.xy);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r2.z = idx_uniforms1_ps.cb1[6].y;
	r4.xy = ((texture(resourceSamplerPair_4_ps, r2.xyz)).ywxz).xy;
	r4.xy = fma(r4.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.xy = r2.ww * r4.xy;
	r5 = (texture(resourceSamplerPair_5_ps, r2.xyz));
	r5 = r0.wwww * r5;
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r1.w = dot(r0.xy, r0.xy);
	r1.w = r1.w + float(1.00000000f);
	r2.y = inversesqrt(r1.w);
	r2.xz = r0.xy * r2.yy;
	r6.xyz = -r2.xyz + v4.v.xyz;
	r2.xyz = fma(r0.zzz, r6.xyz, r2.xyz);
	r0.x = dot(r2.xyz, r2.xyz);
	r0.x = inversesqrt(r0.x);
	r6.xyz = r0.xxx * r2.xyz;
	r0.y = intBitsToFloat(float(0.400000006f) < r0.w ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r7.xy = dFdxCoarse(v2.v.xz);
		r7.zw = dFdyCoarse(v2.v.xz);
		r0.y = dot(r7, r7);
		r0.y = log2(r0.y);
		r0.y = fma(r0.y, float(0.500000000f), float(6.50000000f));
		r0.y = min(r0.y, float(6.00000000f));
		r1.w = dot(v4.v.xyz, v4.v.xyz);
		r1.w = inversesqrt(r1.w);
		r7.xyz = r1.www * v4.v.xyz;
		r8.xyz = r7.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
		r8.xyz = fma(r7.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r8.xyz);
		r1.w = dot(r8.xy, r8.xy);
		r1.w = inversesqrt(r1.w);
		r8.xyz = r1.www * r8.xyz;
		r1.w = dot(r8.xy, r7.xy);
		r8.xyz = fma(-r7.xyz, r1.www, r8.xyz);
		r1.w = dot(r8.xyz, r8.xyz);
		r1.w = inversesqrt(r1.w);
		r8.xyz = r1.www * r8.xyz;
		r9.xyz = r7.zxy * r8.yzx;
		r9.xyz = fma(r7.yzx, r8.zxy, -r9.xyz);
		r10.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
		r1.w = dot(r10.xyz, r10.xyz);
		r1.w = inversesqrt(r1.w);
		r10.xyz = r1.www * r10.xyz;
		r8.x = dot(-r8.xyz, r10.xyz);
		r8.y = dot(r9.xyz, r10.xyz);
		r1.w = dot(-r7.xyz, r10.xyz);
		r4.z = max(-r1.w, float(0.500000000f));
		r4.w = -r0.z + float(1.00000000f);
		r4.w = fma(r4.w, float(3.00000000f), float(1.00000000f));
		r4.z = r4.w * r4.z;
		r4.z = float(8.00000000f) / r4.z;
		r4.z = max(r4.z, float(1.00000000f));
		r4.w = float(1.00000000f) / r4.z;
		r1.w = min(r1.w, float(-0.200000003f));
		r1.w = r1.w * r4.z;
		r7.xy = r8.xy / r1.ww;
		r1.w = r0.w + float(-0.400000006f);
		r1.w = saturate(r1.w * float(6.00000000f));
		r1.w = r1.w * idx_uniforms1_ps.cb1[6].x;
		r1.w = r1.w * float(0.0799999982f);
		r7.zw = r1.ww * r7.xy;
		r7.zw = r4.zz * r7.zw;
		r8.xy = fma(-r7.zw, vec2(0.500000000f, 0.500000000f), r1.xy);
		r9.z = idx_uniforms1_ps.cb1[6].y;
		r9.xy = r8.xy;
		r6.w = uintBitsToFloat(uint(0x3f800000));
		r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r9.w = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r10.x = intBitsToFloat(r9.w < r4.z ? int(0xffffffff) : int(0x00000000));
			r10.y = intBitsToFloat(r8.z < r6.w ? int(0xffffffff) : int(0x00000000));
			r10.x = uintBitsToFloat(floatBitsToUint(r10.y) & floatBitsToUint(r10.x));
			if (floatBitsToUint(r10.x) == uint(0))
				break;
			r6.w = -r4.w + r6.w;
			r9.xy = fma(r7.xy, r1.ww, r9.xy);
			r10.x = ((textureLod(resourceSamplerPair_6_ps, r9.xyz, r0.y)).wxyz).x;
			r9.w = r9.w + float(1.00000000f);
			r8.w = r8.z;
			r8.z = r10.x;
		}
		r0.y = r4.w + r6.w;
		r1.w = r6.w + -r8.z;
		r4.z = -r8.w + r0.y;
		r0.y = r0.y * r1.w;
		r0.y = fma(r6.w, r4.z, -r0.y);
		r1.w = -r1.w + r4.z;
		r0.y = r0.y / r1.w;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r7.zw, r8.xy);
	}
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r4.zw = ((texture(resourceSamplerPair_4_ps, r1.xyz)).xzyw).zw;
	r4.zw = fma(r4.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.zw = r2.ww * r4.zw;
	r7 = (texture(resourceSamplerPair_5_ps, r1.xyz));
	r1.zw = fma(r4.zw, r0.zz, -r4.xy);
	r1.zw = fma(r0.zz, r1.zw, r4.xy);
	r0.y = dot(r1.zw, r1.zw);
	r0.y = -r0.y + float(1.00000000f);
	r0.y = sqrt(abs(r0.y));
	r4.x = r6.y * r1.z;
	r4.y = -r6.x * r1.z;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r4.xyz = fma(r2.xyz, r0.xxx, r4.xyz);
	r4.xyz = fma(r0.yyy, r6.xyz, r4.xyz);
	r8.x = uintBitsToFloat(uint(0x00000000));
	r8.yz = r6.zy * vec2(1.00000000f, -1.00000000f);
	r4.xyz = fma(r1.www, r8.xyz, r4.xyz);
	r0.y = dot(r4.xyz, r4.xyz);
	r0.y = inversesqrt(r0.y);
	r4.xzw = r0.yyy * r4.xyz;
	r7 = fma(r0.wwww, r7, -r5);
	r5 = fma(r0.zzzz, r7, r5);
	r3.w = uintBitsToFloat(uint(0x3f800000));
	r3 = r3 * r5;
	r3 = saturate(r3.xwyz * vec4(4.69999981f, 1.00000000f, 4.69999981f, 4.69999981f));
	r0.zw = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r1.xy);
	r1.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r1.x = v2.v.x;
	r0.zw = fma(-r0.zw, vec2(9.00000000f, 9.00000000f), r1.xy);
	r1 = r0.zwzw * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r5.xyz = ((texture(resourceSamplerPair_7_ps, r1.xy))).xyz;
	r2.w = saturate(r4.w * idx_uniforms1_ps.cb1[14].z);
	r0.y = fma(r4.y, r0.y, r2.w);
	r2.w = intBitsToFloat(r0.y >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r7 = (texture(resourceSamplerPair_8_ps, r1.xy));
	r1.x = ((texture(resourceSamplerPair_8_ps, r1.zw)).wxyz).x;
	r1.yz = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.zw = fma(r0.zw, vec2(0.0206250008f, 0.00562500022f), r1.yz);
	r0.z = ((texture(resourceSamplerPair_8_ps, r0.zw)).xywz).z;
	if (floatBitsToUint(r2.w) != uint(0))
	{
		r1.yzw = fma(r5.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r5 = r1.zwww * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r6.y * r5.x;
		r9.y = -r6.x * r5.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r2.xyz = fma(r2.xyz, r0.xxx, r9.xyz);
		r1.yzw = fma(r1.yyy, r6.xyz, r2.xyz);
		r1.yzw = fma(r5.yzw, r8.xyz, r1.yzw);
		r0.x = dot(r1.yzw, r1.yzw);
		r0.x = inversesqrt(r0.x);
		r2 = (texture(resourceSamplerPair_9_ps, v1.v.zw));
		r0.w = min(r2.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r2.w = uintBitsToFloat(uint(0x3f800000));
		r2.xyz = r2.xyz * r7.xyz;
		r2.w = fma(r7.w, r2.w, float(0.750000000f));
		r4.y = r1.x * r2.w;
		r5.x = r0.w * float(0.699999988f);
		r1.x = fma(-r1.x, r2.w, float(0.100000001f));
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
		r2.xyz = fma(r2.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r3.xzw);
		r2.xyz = fma(r0.yyy, r2.xyz, r3.xzw);
		r3.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r5.xyz = -r3.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r3.xyz = fma(r0.yyy, r5.xyz, r3.xyz);
		r0.xzw = fma(r1.yzw, r0.xxx, -r4.xzw);
		r0.xyz = fma(r0.yyy, r0.xzw, r4.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r4.xzw = r0.www * r0.xyz;
	}
	else
	{
		r2.xyz = r3.xzw;
		r3.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r4.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r2.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r3.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

