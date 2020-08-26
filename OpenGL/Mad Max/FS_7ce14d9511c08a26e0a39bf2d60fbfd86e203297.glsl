#version 460 core
// ps_5_0
// Checksum: f1781a1e_002cad27_1b62e18c_5b55bde7
// Name: fastter_lod0cidx4cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10;

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
	r2.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r1.y = saturate(dot(r2.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r2.w = -r1.y + float(1.00000000f);
	r1.y = dot(r2, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r2 = r2 / r1.yyyy;
	r3.x = r2.x * idx_uniforms1_ps.cb1[6].z;
	r3.y = r2.y * idx_uniforms1_ps.cb1[7].z;
	r3.z = r2.z * idx_uniforms1_ps.cb1[8].z;
	r3.w = r2.w * idx_uniforms1_ps.cb1[9].z;
	r3 = r3 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r1.y = dot(v4.v.xyz, v4.v.xyz);
	r1.y = inversesqrt(r1.y);
	r4.xyz = r1.yyy * v4.v.xyz;
	r5.xyz = r4.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r5.xyz = fma(r4.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r5.xyz);
	r1.z = dot(r5.xy, r5.xy);
	r1.z = inversesqrt(r1.z);
	r5.xyz = r1.zzz * r5.xyz;
	r1.z = dot(r5.xy, r4.xy);
	r5.xyz = fma(-r4.xyz, r1.zzz, r5.xyz);
	r1.z = dot(r5.xyz, r5.xyz);
	r1.z = inversesqrt(r1.z);
	r5.xyz = r1.zzz * r5.xyz;
	r6.xyz = r4.zxy * r5.yzx;
	r6.xyz = fma(r4.yzx, r5.zxy, -r6.xyz);
	r7.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r1.z = dot(r7.xyz, r7.xyz);
	r1.z = inversesqrt(r1.z);
	r7.xyz = r1.zzz * r7.xyz;
	r5.x = dot(-r5.xyz, r7.xyz);
	r5.y = dot(r6.xyz, r7.xyz);
	r1.z = dot(-r4.xyz, r7.xyz);
	r1.w = max(-r1.z, float(0.500000000f));
	r1.w = float(8.00000000f) / r1.w;
	r1.w = max(r1.w, float(1.00000000f));
	r4.w = float(1.00000000f) / r1.w;
	r1.xz = min(r1.xz, vec2(6.00000000f, -0.200000003f));
	r1.z = r1.z * r1.w;
	r5.xy = r5.xy / r1.zz;
	r6 = r2 + vec4(-0.400000006f, -0.400000006f, -0.400000006f, -0.400000006f);
	r6 = saturate(r6 * vec4(6.00000000f, 6.00000000f, 6.00000000f, 6.00000000f));
	r7 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(lessThan(vec4(0.400000006f, 0.400000006f, 0.400000006f, 0.400000006f), r2))));
	if (floatBitsToUint(r7.x) != uint(0))
	{
		r1.z = r6.x * idx_uniforms1_ps.cb1[6].x;
		r1.z = r1.z * float(0.0799999982f);
		r5.zw = r1.zz * r5.xy;
		r5.zw = r1.ww * r5.zw;
		r8.xy = fma(-r5.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r9.z = idx_uniforms1_ps.cb1[6].y;
		r9.xy = r8.xy;
		r6.x = uintBitsToFloat(uint(0x3f800000));
		r7.x = uintBitsToFloat(uint(0x00000000));
		r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r9.w = intBitsToFloat(r8.w < r1.w ? int(0xffffffff) : int(0x00000000));
			r10.x = intBitsToFloat(r7.x < r6.x ? int(0xffffffff) : int(0x00000000));
			r9.w = uintBitsToFloat(floatBitsToUint(r9.w) & floatBitsToUint(r10.x));
			if (floatBitsToUint(r9.w) == uint(0))
				break;
			r6.x = -r4.w + r6.x;
			r9.xy = fma(r5.xy, r1.zz, r9.xy);
			r9.w = ((textureLod(resourceSamplerPair_1_ps, r9.xyz, r1.x))).w;
			r8.w = r8.w + float(1.00000000f);
			r8.z = r7.x;
			r7.x = r9.w;
		}
		r1.z = r4.w + r6.x;
		r7.x = r6.x + -r7.x;
		r8.z = -r8.z + r1.z;
		r1.z = r1.z * r7.x;
		r1.z = fma(r6.x, r8.z, -r1.z);
		r6.x = -r7.x + r8.z;
		r1.z = r1.z / r6.x;
		r1.z = -r1.z + float(1.00000000f);
		r0.xy = fma(r1.zz, r5.zw, r8.xy);
	}
	if (floatBitsToUint(r7.y) != uint(0))
	{
		r1.z = r6.y * idx_uniforms1_ps.cb1[7].x;
		r1.z = r1.z * float(0.0799999982f);
		r5.zw = r1.zz * r5.xy;
		r5.zw = r1.ww * r5.zw;
		r6.xy = fma(-r5.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r8.z = idx_uniforms1_ps.cb1[7].y;
		r8.xy = r6.xy;
		r7.xy = uintBitsToFloat(uvec2(0x3f800000, 0x00000000));
		r8.w = uintBitsToFloat(uint(0x00000000));
		r9.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r9.y = intBitsToFloat(r9.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r9.z = intBitsToFloat(r7.y < r7.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r9.z) & floatBitsToUint(r9.y));
			if (floatBitsToUint(r9.y) == uint(0))
				break;
			r7.x = -r4.w + r7.x;
			r8.xy = fma(r5.xy, r1.zz, r8.xy);
			r9.y = ((textureLod(resourceSamplerPair_1_ps, r8.xyz, r1.x)).xwyz).y;
			r9.x = r9.x + float(1.00000000f);
			r8.w = r7.y;
			r7.y = r9.y;
		}
		r1.z = r4.w + r7.x;
		r7.y = -r7.y + r7.x;
		r8.x = -r8.w + r1.z;
		r1.z = r1.z * r7.y;
		r1.z = fma(r7.x, r8.x, -r1.z);
		r7.x = -r7.y + r8.x;
		r1.z = r1.z / r7.x;
		r1.z = -r1.z + float(1.00000000f);
		r0.xy = fma(r1.zz, r5.zw, r6.xy);
	}
	if (floatBitsToUint(r7.z) != uint(0))
	{
		r1.z = r6.z * idx_uniforms1_ps.cb1[8].x;
		r1.z = r1.z * float(0.0799999982f);
		r5.zw = r1.zz * r5.xy;
		r5.zw = r1.ww * r5.zw;
		r6.xy = fma(-r5.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r7.z = idx_uniforms1_ps.cb1[8].y;
		r7.xy = r6.xy;
		r6.z = uintBitsToFloat(uint(0x3f800000));
		r8.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
		while (true)
		{
			r8.w = intBitsToFloat(r8.z < r1.w ? int(0xffffffff) : int(0x00000000));
			r9.x = intBitsToFloat(r8.x < r6.z ? int(0xffffffff) : int(0x00000000));
			r8.w = uintBitsToFloat(floatBitsToUint(r8.w) & floatBitsToUint(r9.x));
			if (floatBitsToUint(r8.w) == uint(0))
				break;
			r6.z = -r4.w + r6.z;
			r7.xy = fma(r5.xy, r1.zz, r7.xy);
			r8.w = ((textureLod(resourceSamplerPair_1_ps, r7.xyz, r1.x))).w;
			r8.z = r8.z + float(1.00000000f);
			r8.y = r8.x;
			r8.xyz = r8.wyz;
		}
		r1.z = r4.w + r6.z;
		r7.x = r6.z + -r8.x;
		r7.y = -r8.y + r1.z;
		r1.z = r1.z * r7.x;
		r1.z = fma(r6.z, r7.y, -r1.z);
		r6.z = -r7.x + r7.y;
		r1.z = r1.z / r6.z;
		r1.z = -r1.z + float(1.00000000f);
		r0.xy = fma(r1.zz, r5.zw, r6.xy);
	}
	if (floatBitsToUint(r7.w) != uint(0))
	{
		r1.z = r6.w * idx_uniforms1_ps.cb1[9].x;
		r1.z = r1.z * float(0.0799999982f);
		r5.zw = r1.zz * r5.xy;
		r5.zw = r1.ww * r5.zw;
		r6.xy = fma(-r5.zw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r7.z = idx_uniforms1_ps.cb1[9].y;
		r7.xy = r6.xy;
		r6.zw = uintBitsToFloat(uvec2(0x3f800000, 0x00000000));
		r7.w = uintBitsToFloat(uint(0x00000000));
		r8.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r8.y = intBitsToFloat(r8.x < r1.w ? int(0xffffffff) : int(0x00000000));
			r8.z = intBitsToFloat(r6.w < r6.z ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r8.z) & floatBitsToUint(r8.y));
			if (floatBitsToUint(r8.y) == uint(0))
				break;
			r6.z = -r4.w + r6.z;
			r7.xy = fma(r5.xy, r1.zz, r7.xy);
			r8.y = ((textureLod(resourceSamplerPair_1_ps, r7.xyz, r1.x)).xwyz).y;
			r8.x = r8.x + float(1.00000000f);
			r7.w = r6.w;
			r6.w = r8.y;
		}
		r1.x = r4.w + r6.z;
		r1.z = -r6.w + r6.z;
		r1.w = -r7.w + r1.x;
		r1.x = r1.z * r1.x;
		r1.x = fma(r6.z, r1.w, -r1.x);
		r1.z = -r1.z + r1.w;
		r1.x = r1.x / r1.z;
		r1.x = -r1.x + float(1.00000000f);
		r0.xy = fma(r1.xx, r5.zw, r6.xy);
	}
	r0.z = idx_uniforms1_ps.cb1[6].y;
	r1.xz = ((texture(resourceSamplerPair_2_ps, r0.xyz)).yxwz).xz;
	r1.xz = fma(r1.zx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.z = ((texture(resourceSamplerPair_3_ps, r0.xyz)).xywz).z;
	r0.w = idx_uniforms1_ps.cb1[7].y;
	r5.xy = ((texture(resourceSamplerPair_2_ps, r0.xyw)).ywxz).xy;
	r5.xy = fma(r5.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r5.xy = r3.yy * r5.xy;
	r1.xz = fma(r3.xx, r1.xz, r5.xy);
	r0.w = ((texture(resourceSamplerPair_3_ps, r0.xyw))).w;
	r0.w = r0.w * r2.y;
	r0.z = fma(r2.x, r0.z, r0.w);
	r5.xy = r0.xy;
	r5.z = idx_uniforms1_ps.cb1[8].y;
	r2.xy = ((texture(resourceSamplerPair_2_ps, r5.xyz)).ywxz).xy;
	r2.xy = fma(r2.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xz = fma(r3.zz, r2.xy, r1.xz);
	r0.w = ((texture(resourceSamplerPair_3_ps, r5.xyz))).w;
	r0.z = fma(r2.z, r0.w, r0.z);
	r5.w = idx_uniforms1_ps.cb1[9].y;
	r2.xy = ((texture(resourceSamplerPair_2_ps, r5.xyw)).ywxz).xy;
	r2.xy = fma(r2.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xz = fma(r3.ww, r2.xy, r1.xz);
	r0.w = ((texture(resourceSamplerPair_3_ps, r5.xyw))).w;
	r2.y = saturate(fma(r2.w, r0.w, r0.z));
	r0.z = dot(r1.xz, r1.xz);
	r0.z = -r0.z + float(1.00000000f);
	r0.z = sqrt(abs(r0.z));
	r3.x = r4.y * r1.x;
	r3.y = -r4.x * r1.x;
	r3.z = uintBitsToFloat(uint(0x00000000));
	r3.xyz = fma(v4.v.xyz, r1.yyy, r3.xyz);
	r3.xyz = fma(r0.zzz, r4.xyz, r3.xyz);
	r5.x = uintBitsToFloat(uint(0x00000000));
	r5.yz = r4.zy * vec2(1.00000000f, -1.00000000f);
	r1.xzw = fma(r1.zzz, r5.xyz, r3.xyz);
	r0.z = dot(r1.xzw, r1.xzw);
	r0.z = inversesqrt(r0.z);
	r3.xyz = r0.zzz * r1.xzw;
	r0.xy = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r0.xy);
	r6.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r6.x = v2.v.x;
	r0.xy = fma(-r0.xy, vec2(9.00000000f, 9.00000000f), r6.xy);
	r6 = r0.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_4_ps, r6.xy))).xyz;
	r0.w = saturate(r3.z * idx_uniforms1_ps.cb1[14].z);
	r0.z = fma(r1.z, r0.z, r0.w);
	r0.w = intBitsToFloat(r0.z >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_5_ps, r6.xy));
	r1.x = ((texture(resourceSamplerPair_5_ps, r6.zw)).wxyz).x;
	r1.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.xy = fma(r0.xy, vec2(0.0206250008f, 0.00562500022f), r1.zw);
	r0.x = ((texture(resourceSamplerPair_5_ps, r0.xy)).wxyz).x;
	if (floatBitsToUint(r0.w) != uint(0))
	{
		r6.xyz = fma(r7.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7 = r6.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r4.y * r7.x;
		r9.y = -r4.x * r7.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r1.yzw = fma(v4.v.xyz, r1.yyy, r9.xyz);
		r1.yzw = fma(r6.xxx, r4.xyz, r1.yzw);
		r1.yzw = fma(r7.yzw, r5.xyz, r1.yzw);
		r0.y = dot(r1.yzw, r1.yzw);
		r0.y = inversesqrt(r0.y);
		r4 = (texture(resourceSamplerPair_6_ps, v1.v.zw));
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

