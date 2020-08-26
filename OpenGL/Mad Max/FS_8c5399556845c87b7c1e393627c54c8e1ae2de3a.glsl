#version 460 core
// ps_5_0
// Checksum: f2b9e2ab_9248fb11_26fdf781_67a94443
// Name: fastter_lod0cidx2

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

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
	r1.x = min(r1.x, float(6.00000000f));
	r2.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r3.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r1.y = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r1.y + float(1.00000000f);
	r4.x = dot(r3, idx_uniforms1_ps.cb1[10]);
	r4.y = dot(r3, idx_uniforms1_ps.cb1[11]);
	r4.z = dot(r3, idx_uniforms1_ps.cb1[12]);
	r4.w = dot(r3, idx_uniforms1_ps.cb1[13]);
	r1.y = dot(r4, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r1.yz = r4.xy / r1.yy;
	r3.x = r1.y * idx_uniforms1_ps.cb1[6].z;
	r3.y = r1.z * idx_uniforms1_ps.cb1[7].z;
	r3.xy = r3.xy * vec2(8.00000000f, 8.00000000f);
	r1.w = dot(v4.v.xyz, v4.v.xyz);
	r1.w = inversesqrt(r1.w);
	r4.xyz = r1.www * v4.v.xyz;
	r5.xyz = r4.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r5.xyz = fma(r4.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r5.xyz);
	r3.z = dot(r5.xy, r5.xy);
	r3.z = inversesqrt(r3.z);
	r5.xyz = r3.zzz * r5.xyz;
	r3.z = dot(r5.xy, r4.xy);
	r5.xyz = fma(-r4.xyz, r3.zzz, r5.xyz);
	r3.z = dot(r5.xyz, r5.xyz);
	r3.z = inversesqrt(r3.z);
	r5.xyz = r3.zzz * r5.xyz;
	r6.xyz = r4.zxy * r5.yzx;
	r6.xyz = fma(r4.yzx, r5.zxy, -r6.xyz);
	r7.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r3.z = dot(r7.xyz, r7.xyz);
	r3.z = inversesqrt(r3.z);
	r7.xyz = r3.zzz * r7.xyz;
	r5.x = dot(-r5.xyz, r7.xyz);
	r5.y = dot(r6.xyz, r7.xyz);
	r3.z = dot(-r4.xyz, r7.xyz);
	r3.w = max(-r3.z, float(0.500000000f));
	r3.w = float(8.00000000f) / r3.w;
	r3.w = max(r3.w, float(1.00000000f));
	r4.w = float(1.00000000f) / r3.w;
	r3.z = min(r3.z, float(-0.200000003f));
	r3.z = r3.z * r3.w;
	r5.xy = r5.xy / r3.zz;
	r5.zw = r1.yz + vec2(-0.400000006f, -0.400000006f);
	r5.zw = saturate(r5.zw * vec2(6.00000000f, 6.00000000f));
	r6.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(vec2(0.400000006f, 0.400000006f), r1.yz))));
	if (floatBitsToUint(r6.x) != uint(0))
	{
		r3.z = r5.z * idx_uniforms1_ps.cb1[6].x;
		r3.z = r3.z * float(0.0799999982f);
		r6.xz = r3.zz * r5.xy;
		r6.xz = r3.ww * r6.xz;
		r7.xy = fma(-r6.xz, vec2(0.500000000f, 0.500000000f), r0.xy);
		r8.z = idx_uniforms1_ps.cb1[6].y;
		r8.xy = r7.xy;
		r5.z = uintBitsToFloat(uint(0x3f800000));
		r6.w = uintBitsToFloat(uint(0x00000000));
		r7.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r8.w = intBitsToFloat(r7.w < r3.w ? int(0xffffffff) : int(0x00000000));
			r9.x = intBitsToFloat(r6.w < r5.z ? int(0xffffffff) : int(0x00000000));
			r8.w = uintBitsToFloat(floatBitsToUint(r8.w) & floatBitsToUint(r9.x));
			if (floatBitsToUint(r8.w) == uint(0))
				break;
			r5.z = -r4.w + r5.z;
			r8.xy = fma(r5.xy, r3.zz, r8.xy);
			r8.w = ((textureLod(resourceSamplerPair_2_ps, r8.xyz, r1.x))).w;
			r7.w = r7.w + float(1.00000000f);
			r7.z = r6.w;
			r6.w = r8.w;
		}
		r3.z = r4.w + r5.z;
		r6.w = r5.z + -r6.w;
		r7.z = -r7.z + r3.z;
		r3.z = r3.z * r6.w;
		r3.z = fma(r5.z, r7.z, -r3.z);
		r5.z = -r6.w + r7.z;
		r3.z = r3.z / r5.z;
		r3.z = -r3.z + float(1.00000000f);
		r0.xy = fma(r3.zz, r6.xz, r7.xy);
	}
	if (floatBitsToUint(r6.y) != uint(0))
	{
		r3.z = r5.w * idx_uniforms1_ps.cb1[7].x;
		r3.z = r3.z * float(0.0799999982f);
		r5.zw = r3.zz * r5.xy;
		r5.zw = r3.ww * r5.zw;
		r6.xy = fma(-r5.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r7.z = idx_uniforms1_ps.cb1[7].y;
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
			r8.y = ((textureLod(resourceSamplerPair_2_ps, r7.xyz, r1.x)).xwyz).y;
			r8.x = r8.x + float(1.00000000f);
			r7.w = r6.w;
			r6.w = r8.y;
		}
		r1.x = r4.w + r6.z;
		r3.z = -r6.w + r6.z;
		r3.w = -r7.w + r1.x;
		r1.x = r1.x * r3.z;
		r1.x = fma(r6.z, r3.w, -r1.x);
		r3.z = -r3.z + r3.w;
		r1.x = r1.x / r3.z;
		r1.x = -r1.x + float(1.00000000f);
		r0.xy = fma(r1.xx, r5.zw, r6.xy);
	}
	r0.z = idx_uniforms1_ps.cb1[6].y;
	r3.zw = ((texture(resourceSamplerPair_3_ps, r0.xyz)).xzyw).zw;
	r3.zw = fma(r3.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r5 = (texture(resourceSamplerPair_4_ps, r0.xyz));
	r0.w = idx_uniforms1_ps.cb1[7].y;
	r6.xy = ((texture(resourceSamplerPair_3_ps, r0.xyw)).ywxz).xy;
	r6.xy = fma(r6.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r6.xy = r3.yy * r6.xy;
	r3.xy = fma(r3.xx, r3.zw, r6.xy);
	r6 = (texture(resourceSamplerPair_4_ps, r0.xyw));
	r6 = r1.zzzz * r6;
	r5 = fma(r1.yyyy, r5, r6);
	r0.z = dot(r3.xy, r3.xy);
	r0.z = -r0.z + float(1.00000000f);
	r0.z = sqrt(abs(r0.z));
	r1.x = r4.y * r3.x;
	r1.y = -r4.x * r3.x;
	r1.z = uintBitsToFloat(uint(0x00000000));
	r1.xyz = fma(v4.v.xyz, r1.www, r1.xyz);
	r1.xyz = fma(r0.zzz, r4.xyz, r1.xyz);
	r6.x = uintBitsToFloat(uint(0x00000000));
	r6.yz = r4.zy * vec2(1.00000000f, -1.00000000f);
	r1.xyz = fma(r3.yyy, r6.xyz, r1.xyz);
	r0.z = dot(r1.xyz, r1.xyz);
	r0.z = inversesqrt(r0.z);
	r3.xyz = r0.zzz * r1.xyz;
	r2.w = uintBitsToFloat(uint(0x3f800000));
	r2 = r2 * r5;
	r2 = saturate(r2.xwyz * vec4(4.69999981f, 1.00000000f, 4.69999981f, 4.69999981f));
	r0.xy = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r0.xy);
	r5.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r5.x = v2.v.x;
	r0.xy = fma(-r0.xy, vec2(9.00000000f, 9.00000000f), r5.xy);
	r5 = r0.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_5_ps, r5.xy))).xyz;
	r0.w = saturate(r3.z * idx_uniforms1_ps.cb1[14].z);
	r0.z = fma(r1.y, r0.z, r0.w);
	r0.w = intBitsToFloat(r0.z >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_6_ps, r5.xy));
	r1.x = ((texture(resourceSamplerPair_6_ps, r5.zw)).wxyz).x;
	r1.yz = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.xy = fma(r0.xy, vec2(0.0206250008f, 0.00562500022f), r1.yz);
	r0.x = ((texture(resourceSamplerPair_6_ps, r0.xy)).wxyz).x;
	if (floatBitsToUint(r0.w) != uint(0))
	{
		r5.xyz = fma(r7.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7 = r5.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r4.y * r7.x;
		r9.y = -r4.x * r7.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r1.yzw = fma(v4.v.xyz, r1.www, r9.xyz);
		r1.yzw = fma(r5.xxx, r4.xyz, r1.yzw);
		r1.yzw = fma(r7.yzw, r6.xyz, r1.yzw);
		r0.y = dot(r1.yzw, r1.yzw);
		r0.y = inversesqrt(r0.y);
		r4 = (texture(resourceSamplerPair_7_ps, v1.v.zw));
		r0.w = min(r4.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r3.w = uintBitsToFloat(uint(0x3f800000));
		r4.xyz = r4.xyz * r8.xyz;
		r3.w = fma(r8.w, r3.w, float(0.750000000f));
		r4.w = r1.x * r3.w;
		r5.x = r0.w * float(0.699999988f);
		r1.x = fma(-r1.x, r3.w, float(0.100000001f));
		r1.x = fma(r5.x, r1.x, r4.w);
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
		r4.xyz = fma(r4.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r2.xzw);
		r4.xyz = fma(r0.xxx, r4.xyz, r2.xzw);
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
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
		r4.xyz = r2.xzw;
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

