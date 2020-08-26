#version 460 core
// ps_5_0
// Checksum: b8697d7f_8fa04ba1_25fa74c9_656f5580
// Name: fastter_lod0cidx3

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
	r1.yzw = r4.xyz / r1.yyy;
	r3.x = r1.y * idx_uniforms1_ps.cb1[6].z;
	r3.y = r1.z * idx_uniforms1_ps.cb1[7].z;
	r3.z = r1.w * idx_uniforms1_ps.cb1[8].z;
	r3.xyz = r3.xyz * vec3(8.00000000f, 8.00000000f, 8.00000000f);
	r3.w = dot(v4.v.xyz, v4.v.xyz);
	r3.w = inversesqrt(r3.w);
	r4.xyz = r3.www * v4.v.xyz;
	r5.xyz = r4.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r5.xyz = fma(r4.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r5.xyz);
	r4.w = dot(r5.xy, r5.xy);
	r4.w = inversesqrt(r4.w);
	r5.xyz = r4.www * r5.xyz;
	r4.w = dot(r5.xy, r4.xy);
	r5.xyz = fma(-r4.xyz, r4.www, r5.xyz);
	r4.w = dot(r5.xyz, r5.xyz);
	r4.w = inversesqrt(r4.w);
	r5.xyz = r4.www * r5.xyz;
	r6.xyz = r4.zxy * r5.yzx;
	r6.xyz = fma(r4.yzx, r5.zxy, -r6.xyz);
	r7.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r4.w = dot(r7.xyz, r7.xyz);
	r4.w = inversesqrt(r4.w);
	r7.xyz = r4.www * r7.xyz;
	r5.x = dot(-r5.xyz, r7.xyz);
	r5.y = dot(r6.xyz, r7.xyz);
	r4.w = dot(-r4.xyz, r7.xyz);
	r5.z = max(-r4.w, float(0.500000000f));
	r5.z = float(8.00000000f) / r5.z;
	r5.z = max(r5.z, float(1.00000000f));
	r5.w = float(1.00000000f) / r5.z;
	r4.w = min(r4.w, float(-0.200000003f));
	r4.w = r4.w * r5.z;
	r5.xy = r5.xy / r4.ww;
	r6.xyz = r1.yzw + vec3(-0.400000006f, -0.400000006f, -0.400000006f);
	r6.xyz = saturate(r6.xyz * vec3(6.00000000f, 6.00000000f, 6.00000000f));
	r7.xyz = intBitsToFloat(mix ( ivec3(0x00000000),ivec3(0xffffffff),bvec3(lessThan(vec3(0.400000006f, 0.400000006f, 0.400000006f), r1.yzw))));
	if (floatBitsToUint(r7.x) != uint(0))
	{
		r4.w = r6.x * idx_uniforms1_ps.cb1[6].x;
		r4.w = r4.w * float(0.0799999982f);
		r6.xw = r4.ww * r5.xy;
		r6.xw = r5.zz * r6.xw;
		r7.xw = fma(-r6.xw, vec2(0.500000000f, 0.500000000f), r0.xy);
		r8.z = idx_uniforms1_ps.cb1[6].y;
		r8.xy = r7.xw;
		r8.w = uintBitsToFloat(uint(0x3f800000));
		r9.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
		while (true)
		{
			r9.w = intBitsToFloat(r9.z < r5.z ? int(0xffffffff) : int(0x00000000));
			r10.x = intBitsToFloat(r9.x < r8.w ? int(0xffffffff) : int(0x00000000));
			r9.w = uintBitsToFloat(floatBitsToUint(r9.w) & floatBitsToUint(r10.x));
			if (floatBitsToUint(r9.w) == uint(0))
				break;
			r8.w = -r5.w + r8.w;
			r8.xy = fma(r5.xy, r4.ww, r8.xy);
			r9.w = ((textureLod(resourceSamplerPair_2_ps, r8.xyz, r1.x))).w;
			r9.z = r9.z + float(1.00000000f);
			r9.y = r9.x;
			r9.xyz = r9.wyz;
		}
		r4.w = r5.w + r8.w;
		r8.x = r8.w + -r9.x;
		r8.y = -r9.y + r4.w;
		r4.w = r4.w * r8.x;
		r4.w = fma(r8.w, r8.y, -r4.w);
		r8.x = -r8.x + r8.y;
		r4.w = r4.w / r8.x;
		r4.w = -r4.w + float(1.00000000f);
		r0.xy = fma(r4.ww, r6.xw, r7.xw);
	}
	if (floatBitsToUint(r7.y) != uint(0))
	{
		r4.w = r6.y * idx_uniforms1_ps.cb1[7].x;
		r4.w = r4.w * float(0.0799999982f);
		r6.xy = r4.ww * r5.xy;
		r6.xy = r5.zz * r6.xy;
		r7.xy = fma(-r6.xy, vec2(0.500000000f, 0.500000000f), r0.xy);
		r8.z = idx_uniforms1_ps.cb1[7].y;
		r8.xy = r7.xy;
		r6.w = uintBitsToFloat(uint(0x3f800000));
		r7.w = uintBitsToFloat(uint(0x00000000));
		r8.w = uintBitsToFloat(uint(0x00000000));
		r9.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r9.y = intBitsToFloat(r9.x < r5.z ? int(0xffffffff) : int(0x00000000));
			r9.z = intBitsToFloat(r7.w < r6.w ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r9.z) & floatBitsToUint(r9.y));
			if (floatBitsToUint(r9.y) == uint(0))
				break;
			r6.w = -r5.w + r6.w;
			r8.xy = fma(r5.xy, r4.ww, r8.xy);
			r9.y = ((textureLod(resourceSamplerPair_2_ps, r8.xyz, r1.x)).xwyz).y;
			r9.x = r9.x + float(1.00000000f);
			r8.w = r7.w;
			r7.w = r9.y;
		}
		r4.w = r5.w + r6.w;
		r7.w = r6.w + -r7.w;
		r8.x = -r8.w + r4.w;
		r4.w = r4.w * r7.w;
		r4.w = fma(r6.w, r8.x, -r4.w);
		r6.w = -r7.w + r8.x;
		r4.w = r4.w / r6.w;
		r4.w = -r4.w + float(1.00000000f);
		r0.xy = fma(r4.ww, r6.xy, r7.xy);
	}
	if (floatBitsToUint(r7.z) != uint(0))
	{
		r4.w = r6.z * idx_uniforms1_ps.cb1[8].x;
		r4.w = r4.w * float(0.0799999982f);
		r6.xy = r4.ww * r5.xy;
		r6.xy = r5.zz * r6.xy;
		r6.zw = fma(-r6.xy, vec2(0.500000000f, 0.500000000f), r0.xy);
		r7.z = idx_uniforms1_ps.cb1[8].y;
		r7.xy = r6.zw;
		r7.w = uintBitsToFloat(uint(0x3f800000));
		r8.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
		while (true)
		{
			r8.w = intBitsToFloat(r8.z < r5.z ? int(0xffffffff) : int(0x00000000));
			r9.x = intBitsToFloat(r8.x < r7.w ? int(0xffffffff) : int(0x00000000));
			r8.w = uintBitsToFloat(floatBitsToUint(r8.w) & floatBitsToUint(r9.x));
			if (floatBitsToUint(r8.w) == uint(0))
				break;
			r7.w = -r5.w + r7.w;
			r7.xy = fma(r5.xy, r4.ww, r7.xy);
			r8.w = ((textureLod(resourceSamplerPair_2_ps, r7.xyz, r1.x))).w;
			r8.z = r8.z + float(1.00000000f);
			r8.y = r8.x;
			r8.xyz = r8.wyz;
		}
		r1.x = r5.w + r7.w;
		r4.w = r7.w + -r8.x;
		r5.x = -r8.y + r1.x;
		r1.x = r1.x * r4.w;
		r1.x = fma(r7.w, r5.x, -r1.x);
		r4.w = -r4.w + r5.x;
		r1.x = r1.x / r4.w;
		r1.x = -r1.x + float(1.00000000f);
		r0.xy = fma(r1.xx, r6.xy, r6.zw);
	}
	r0.z = idx_uniforms1_ps.cb1[6].y;
	r5.xy = ((texture(resourceSamplerPair_3_ps, r0.xyz)).ywxz).xy;
	r5.xy = fma(r5.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r6 = (texture(resourceSamplerPair_4_ps, r0.xyz));
	r0.w = idx_uniforms1_ps.cb1[7].y;
	r5.zw = ((texture(resourceSamplerPair_3_ps, r0.xyw)).xzyw).zw;
	r5.zw = fma(r5.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r5.zw = r3.yy * r5.zw;
	r3.xy = fma(r3.xx, r5.xy, r5.zw);
	r5 = (texture(resourceSamplerPair_4_ps, r0.xyw));
	r5 = r1.zzzz * r5;
	r5 = fma(r1.yyyy, r6, r5);
	r1.xy = r0.xy;
	r1.z = idx_uniforms1_ps.cb1[8].y;
	r0.zw = ((texture(resourceSamplerPair_3_ps, r1.xyz)).xzyw).zw;
	r0.zw = fma(r0.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.zw = fma(r3.zz, r0.zw, r3.xy);
	r6 = (texture(resourceSamplerPair_4_ps, r1.xyz));
	r1 = fma(r1.wwww, r6, r5);
	r3.x = dot(r0.zw, r0.zw);
	r3.x = -r3.x + float(1.00000000f);
	r3.x = sqrt(abs(r3.x));
	r5.x = r4.y * r0.z;
	r5.y = -r4.x * r0.z;
	r5.z = uintBitsToFloat(uint(0x00000000));
	r5.xyz = fma(v4.v.xyz, r3.www, r5.xyz);
	r3.xyz = fma(r3.xxx, r4.xyz, r5.xyz);
	r5.x = uintBitsToFloat(uint(0x00000000));
	r5.yz = r4.zy * vec2(1.00000000f, -1.00000000f);
	r3.xyz = fma(r0.www, r5.xyz, r3.xyz);
	r0.z = dot(r3.xyz, r3.xyz);
	r0.z = inversesqrt(r0.z);
	r6.xyz = r0.zzz * r3.xyz;
	r2.w = uintBitsToFloat(uint(0x3f800000));
	r1 = r1 * r2;
	r1 = saturate(r1.xwyz * vec4(4.69999981f, 1.00000000f, 4.69999981f, 4.69999981f));
	r0.xy = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r0.xy);
	r2.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r2.x = v2.v.x;
	r0.xy = fma(-r0.xy, vec2(9.00000000f, 9.00000000f), r2.xy);
	r2 = r0.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_5_ps, r2.xy))).xyz;
	r0.w = saturate(r6.z * idx_uniforms1_ps.cb1[14].z);
	r0.z = fma(r3.y, r0.z, r0.w);
	r0.w = intBitsToFloat(r0.z >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_6_ps, r2.xy));
	r2.x = ((texture(resourceSamplerPair_6_ps, r2.zw)).wxyz).x;
	r2.yz = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.xy = fma(r0.xy, vec2(0.0206250008f, 0.00562500022f), r2.yz);
	r0.x = ((texture(resourceSamplerPair_6_ps, r0.xy)).wxyz).x;
	if (floatBitsToUint(r0.w) != uint(0))
	{
		r2.yzw = fma(r7.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7 = r2.zwww * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r3.x = r4.y * r7.x;
		r3.y = -r4.x * r7.x;
		r3.z = uintBitsToFloat(uint(0x00000000));
		r3.xyz = fma(v4.v.xyz, r3.www, r3.xyz);
		r2.yzw = fma(r2.yyy, r4.xyz, r3.xyz);
		r2.yzw = fma(r7.yzw, r5.xyz, r2.yzw);
		r0.y = dot(r2.yzw, r2.yzw);
		r0.y = inversesqrt(r0.y);
		r3 = (texture(resourceSamplerPair_7_ps, v1.v.zw));
		r0.w = min(r3.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r3.w = uintBitsToFloat(uint(0x3f800000));
		r3.xyz = r3.xyz * r8.xyz;
		r3.w = fma(r8.w, r3.w, float(0.750000000f));
		r4.x = r2.x * r3.w;
		r4.y = r0.w * float(0.699999988f);
		r2.x = fma(-r2.x, r3.w, float(0.100000001f));
		r2.x = fma(r4.y, r2.x, r4.x);
		r0.x = -r0.x + float(1.00000000f);
		r0.x = saturate(fma(-r0.x, idx_uniforms1_ps.cb1[15].x, r2.x));
		r0.x = r0.x * r0.w;
		r0.w = r0.x * float(3.00000000f);
		r0.x = fma(r0.x, float(-0.300000012f), float(0.800000012f));
		r0.w = min(r0.w, float(1.00000000f));
		r2.x = -r0.x + float(1.00000000f);
		r0.w = r0.w / r2.x;
		r0.x = -r0.x + r0.z;
		r0.x = saturate(r0.w * r0.x);
		r3.xyz = fma(r3.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r1.xzw);
		r3.xyz = fma(r0.xxx, r3.xyz, r1.xzw);
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r1.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r1.xyz = fma(r0.xxx, r4.xyz, r1.xyz);
		r0.yzw = fma(r2.yzw, r0.yyy, -r6.xyz);
		r0.xyz = fma(r0.xxx, r0.yzw, r6.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r6.xyz = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = r1.xzw;
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r6.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r3.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r1.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

