#version 460 core
// ps_5_0
// Checksum: 82c84e63_7c28db6c_ef3a2fa2_8f765bb0
// Name: fastter_lod0cidx2cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res3, s3

uniform sampler2DArray resourceSamplerPair_1_ps; // res7, s7

uniform sampler2DArray resourceSamplerPair_2_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_3_ps; // res9, s9

uniform sampler2D resourceSamplerPair_4_ps; // res12, s12

uniform sampler2D resourceSamplerPair_5_ps; // res11, s11

uniform sampler2D resourceSamplerPair_6_ps; // res13, s13


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
	r1.y = saturate(dot(r2.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r2.w = -r1.y + float(1.00000000f);
	r3.x = dot(r2, idx_uniforms1_ps.cb1[10]);
	r3.y = dot(r2, idx_uniforms1_ps.cb1[11]);
	r3.z = dot(r2, idx_uniforms1_ps.cb1[12]);
	r3.w = dot(r2, idx_uniforms1_ps.cb1[13]);
	r1.y = dot(r3, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r1.yz = r3.xy / r1.yy;
	r2.x = r1.y * idx_uniforms1_ps.cb1[6].z;
	r2.y = r1.z * idx_uniforms1_ps.cb1[7].z;
	r2.xy = r2.xy * vec2(8.00000000f, 8.00000000f);
	r1.w = dot(v4.v.xyz, v4.v.xyz);
	r1.w = inversesqrt(r1.w);
	r3.xyz = r1.www * v4.v.xyz;
	r4.xyz = r3.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r4.xyz = fma(r3.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r4.xyz);
	r2.z = dot(r4.xy, r4.xy);
	r2.z = inversesqrt(r2.z);
	r4.xyz = r2.zzz * r4.xyz;
	r2.z = dot(r4.xy, r3.xy);
	r4.xyz = fma(-r3.xyz, r2.zzz, r4.xyz);
	r2.z = dot(r4.xyz, r4.xyz);
	r2.z = inversesqrt(r2.z);
	r4.xyz = r2.zzz * r4.xyz;
	r5.xyz = r3.zxy * r4.yzx;
	r5.xyz = fma(r3.yzx, r4.zxy, -r5.xyz);
	r6.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r2.z = dot(r6.xyz, r6.xyz);
	r2.z = inversesqrt(r2.z);
	r6.xyz = r2.zzz * r6.xyz;
	r4.x = dot(-r4.xyz, r6.xyz);
	r4.y = dot(r5.xyz, r6.xyz);
	r2.z = dot(-r3.xyz, r6.xyz);
	r2.w = max(-r2.z, float(0.500000000f));
	r2.w = float(8.00000000f) / r2.w;
	r2.w = max(r2.w, float(1.00000000f));
	r3.w = float(1.00000000f) / r2.w;
	r2.z = min(r2.z, float(-0.200000003f));
	r2.z = r2.z * r2.w;
	r4.xy = r4.xy / r2.zz;
	r4.zw = r1.yz + vec2(-0.400000006f, -0.400000006f);
	r4.zw = saturate(r4.zw * vec2(6.00000000f, 6.00000000f));
	r5.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(vec2(0.400000006f, 0.400000006f), r1.yz))));
	if (floatBitsToUint(r5.x) != uint(0))
	{
		r2.z = r4.z * idx_uniforms1_ps.cb1[6].x;
		r2.z = r2.z * float(0.0799999982f);
		r5.xz = r2.zz * r4.xy;
		r5.xz = r2.ww * r5.xz;
		r6.xy = fma(-r5.xz, vec2(0.500000000f, 0.500000000f), r0.xy);
		r7.z = idx_uniforms1_ps.cb1[6].y;
		r7.xy = r6.xy;
		r4.z = uintBitsToFloat(uint(0x3f800000));
		r5.w = uintBitsToFloat(uint(0x00000000));
		r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r7.w = intBitsToFloat(r6.w < r2.w ? int(0xffffffff) : int(0x00000000));
			r8.x = intBitsToFloat(r5.w < r4.z ? int(0xffffffff) : int(0x00000000));
			r7.w = uintBitsToFloat(floatBitsToUint(r7.w) & floatBitsToUint(r8.x));
			if (floatBitsToUint(r7.w) == uint(0))
				break;
			r4.z = -r3.w + r4.z;
			r7.xy = fma(r4.xy, r2.zz, r7.xy);
			r7.w = ((textureLod(resourceSamplerPair_1_ps, r7.xyz, r1.x))).w;
			r6.w = r6.w + float(1.00000000f);
			r6.z = r5.w;
			r5.w = r7.w;
		}
		r2.z = r3.w + r4.z;
		r5.w = r4.z + -r5.w;
		r6.z = -r6.z + r2.z;
		r2.z = r2.z * r5.w;
		r2.z = fma(r4.z, r6.z, -r2.z);
		r4.z = -r5.w + r6.z;
		r2.z = r2.z / r4.z;
		r2.z = -r2.z + float(1.00000000f);
		r0.xy = fma(r2.zz, r5.xz, r6.xy);
	}
	if (floatBitsToUint(r5.y) != uint(0))
	{
		r2.z = r4.w * idx_uniforms1_ps.cb1[7].x;
		r2.z = r2.z * float(0.0799999982f);
		r4.zw = r2.zz * r4.xy;
		r4.zw = r2.ww * r4.zw;
		r5.xy = fma(-r4.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r6.z = idx_uniforms1_ps.cb1[7].y;
		r6.xy = r5.xy;
		r5.zw = uintBitsToFloat(uvec2(0x3f800000, 0x00000000));
		r6.w = uintBitsToFloat(uint(0x00000000));
		r7.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r7.y = intBitsToFloat(r7.x < r2.w ? int(0xffffffff) : int(0x00000000));
			r7.z = intBitsToFloat(r5.w < r5.z ? int(0xffffffff) : int(0x00000000));
			r7.y = uintBitsToFloat(floatBitsToUint(r7.z) & floatBitsToUint(r7.y));
			if (floatBitsToUint(r7.y) == uint(0))
				break;
			r5.z = -r3.w + r5.z;
			r6.xy = fma(r4.xy, r2.zz, r6.xy);
			r7.y = ((textureLod(resourceSamplerPair_1_ps, r6.xyz, r1.x)).xwyz).y;
			r7.x = r7.x + float(1.00000000f);
			r6.w = r5.w;
			r5.w = r7.y;
		}
		r1.x = r3.w + r5.z;
		r2.z = -r5.w + r5.z;
		r2.w = -r6.w + r1.x;
		r1.x = r1.x * r2.z;
		r1.x = fma(r5.z, r2.w, -r1.x);
		r2.z = -r2.z + r2.w;
		r1.x = r1.x / r2.z;
		r1.x = -r1.x + float(1.00000000f);
		r0.xy = fma(r1.xx, r4.zw, r5.xy);
	}
	r0.z = idx_uniforms1_ps.cb1[6].y;
	r2.zw = ((texture(resourceSamplerPair_2_ps, r0.xyz)).xzyw).zw;
	r2.zw = fma(r2.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.z = ((texture(resourceSamplerPair_3_ps, r0.xyz)).xywz).z;
	r0.w = idx_uniforms1_ps.cb1[7].y;
	r4.xy = ((texture(resourceSamplerPair_2_ps, r0.xyw)).ywxz).xy;
	r4.xy = fma(r4.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.xy = r2.yy * r4.xy;
	r2.xy = fma(r2.xx, r2.zw, r4.xy);
	r0.w = ((texture(resourceSamplerPair_3_ps, r0.xyw))).w;
	r0.w = r0.w * r1.z;
	r1.y = saturate(fma(r1.y, r0.z, r0.w));
	r0.z = dot(r2.xy, r2.xy);
	r0.z = -r0.z + float(1.00000000f);
	r0.z = sqrt(abs(r0.z));
	r4.x = r3.y * r2.x;
	r4.y = -r3.x * r2.x;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r2.xzw = fma(v4.v.xyz, r1.www, r4.xyz);
	r2.xzw = fma(r0.zzz, r3.xyz, r2.xzw);
	r4.x = uintBitsToFloat(uint(0x00000000));
	r4.yz = r3.zy * vec2(1.00000000f, -1.00000000f);
	r2.xyz = fma(r2.yyy, r4.xyz, r2.xzw);
	r0.z = dot(r2.xyz, r2.xyz);
	r0.z = inversesqrt(r0.z);
	r2.xzw = r0.zzz * r2.xyz;
	r0.xy = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r0.xy);
	r5.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r5.x = v2.v.x;
	r0.xy = fma(-r0.xy, vec2(9.00000000f, 9.00000000f), r5.xy);
	r5 = r0.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r6.xyz = ((texture(resourceSamplerPair_4_ps, r5.xy))).xyz;
	r0.w = saturate(r2.w * idx_uniforms1_ps.cb1[14].z);
	r0.z = fma(r2.y, r0.z, r0.w);
	r0.w = intBitsToFloat(r0.z >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r7 = (texture(resourceSamplerPair_5_ps, r5.xy));
	r2.y = ((texture(resourceSamplerPair_5_ps, r5.zw)).xwyz).y;
	r5.xy = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.xy = fma(r0.xy, vec2(0.0206250008f, 0.00562500022f), r5.xy);
	r0.x = ((texture(resourceSamplerPair_5_ps, r0.xy)).wxyz).x;
	if (floatBitsToUint(r0.w) != uint(0))
	{
		r5.xyz = fma(r6.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r6 = r5.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r8.x = r3.y * r6.x;
		r8.y = -r3.x * r6.x;
		r8.z = uintBitsToFloat(uint(0x00000000));
		r5.yzw = fma(v4.v.xyz, r1.www, r8.xyz);
		r3.xyz = fma(r5.xxx, r3.xyz, r5.yzw);
		r3.xyz = fma(r6.yzw, r4.xyz, r3.xyz);
		r0.y = dot(r3.xyz, r3.xyz);
		r0.y = inversesqrt(r0.y);
		r4 = (texture(resourceSamplerPair_6_ps, v1.v.zw));
		r0.w = min(r4.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r1.xzw = uintBitsToFloat(uvec3(0x00000000, 0x3f000000, 0x3f800000));
		r4.xyz = r4.xyz * r7.xyz;
		r1.w = fma(r7.w, r1.w, float(0.750000000f));
		r3.w = r1.w * r2.y;
		r4.w = r0.w * float(0.699999988f);
		r1.w = fma(-r2.y, r1.w, float(0.100000001f));
		r1.w = fma(r4.w, r1.w, r3.w);
		r0.x = -r0.x + float(1.00000000f);
		r0.x = saturate(fma(-r0.x, idx_uniforms1_ps.cb1[15].x, r1.w));
		r0.x = r0.x * r0.w;
		r0.w = r0.x * float(3.00000000f);
		r0.x = fma(r0.x, float(-0.300000012f), float(0.800000012f));
		r0.w = min(r0.w, float(1.00000000f));
		r1.w = -r0.x + float(1.00000000f);
		r0.w = r0.w / r1.w;
		r0.x = -r0.x + r0.z;
		r0.x = saturate(r0.w * r0.x);
		r4.xyz = fma(r4.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r4.xyz = fma(r0.xxx, r4.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r5.xyz = -r1.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r1.xyz = fma(r0.xxx, r5.xyz, r1.xyz);
		r0.yzw = fma(r3.xyz, r0.yyy, -r2.xzw);
		r0.xyz = fma(r0.xxx, r0.yzw, r2.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r2.xzw = r0.www * r0.xyz;
	}
	else
	{
		r4.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r2.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r4.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r1.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

