#version 460 core
// ps_5_0
// Checksum: 4d514767_687138ad_9f2600a8_0c117b49
// Name: fastter_lod01cidx2cgc

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
	r4.x = dot(r3, idx_uniforms1_ps.cb1[10]);
	r4.y = dot(r3, idx_uniforms1_ps.cb1[11]);
	r4.z = dot(r3, idx_uniforms1_ps.cb1[12]);
	r4.w = dot(r3, idx_uniforms1_ps.cb1[13]);
	r2.z = dot(r4, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r2.zw = r4.xy / r2.zz;
	r3.z = r2.z * idx_uniforms1_ps.cb1[6].z;
	r3.xw = r2.ww * idx_uniforms1_ps.cb1[7].wz;
	r3.x = fma(idx_uniforms1_ps.cb1[6].w, r2.z, r3.x);
	r0.xy = ((texture(resourceSamplerPair_2_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r3.x = r3.x * float(1.50000000f);
	r0.xy = fma(r3.xx, r0.xy, -r2.xy);
	r2.xy = r3.zw * vec2(8.00000000f, 8.00000000f);
	r3.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r3.z = idx_uniforms1_ps.cb1[6].y;
	r4.xy = ((texture(resourceSamplerPair_3_ps, r3.xyz)).ywxz).xy;
	r4.xy = fma(r4.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r3.x = ((texture(resourceSamplerPair_4_ps, r3.xyz)).wxyz).x;
	r5.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r5.z = idx_uniforms1_ps.cb1[7].y;
	r3.yz = ((texture(resourceSamplerPair_3_ps, r5.xyz)).xywz).yz;
	r3.yz = fma(r3.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r3.yz = r2.yy * r3.yz;
	r3.yz = fma(r2.xx, r4.xy, r3.yz);
	r3.w = ((texture(resourceSamplerPair_4_ps, r5.xyz))).w;
	r3.w = r2.w * r3.w;
	r3.x = fma(r2.z, r3.x, r3.w);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r3.w = dot(r0.xy, r0.xy);
	r3.w = r3.w + float(1.00000000f);
	r4.y = inversesqrt(r3.w);
	r4.xz = r0.xy * r4.yy;
	r5.xyz = -r4.xyz + v4.v.xyz;
	r4.xyz = fma(r0.www, r5.xyz, r4.xyz);
	r0.x = dot(r4.xyz, r4.xyz);
	r0.x = inversesqrt(r0.x);
	r5.xyz = r0.xxx * r4.xyz;
	r0.y = dot(v4.v.xyz, v4.v.xyz);
	r0.y = inversesqrt(r0.y);
	r6.xyz = r0.yyy * v4.v.xyz;
	r7.xyz = r6.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r7.xyz = fma(r6.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r7.xyz);
	r0.y = dot(r7.xy, r7.xy);
	r0.y = inversesqrt(r0.y);
	r7.xyz = r0.yyy * r7.xyz;
	r0.y = dot(r7.xy, r6.xy);
	r7.xyz = fma(-r6.xyz, r0.yyy, r7.xyz);
	r0.y = dot(r7.xyz, r7.xyz);
	r0.y = inversesqrt(r0.y);
	r7.xyz = r0.yyy * r7.xyz;
	r8.xyz = r6.zxy * r7.yzx;
	r8.xyz = fma(r6.yzx, r7.zxy, -r8.xyz);
	r9.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r0.y = dot(r9.xyz, r9.xyz);
	r0.y = inversesqrt(r0.y);
	r9.xyz = r0.yyy * r9.xyz;
	r7.x = dot(-r7.xyz, r9.xyz);
	r7.y = dot(r8.xyz, r9.xyz);
	r0.y = dot(-r6.xyz, r9.xyz);
	r3.w = max(-r0.y, float(0.500000000f));
	r4.w = -r0.w + float(1.00000000f);
	r4.w = fma(r4.w, float(3.00000000f), float(1.00000000f));
	r3.w = r3.w * r4.w;
	r3.w = float(8.00000000f) / r3.w;
	r3.w = max(r3.w, float(1.00000000f));
	r4.w = float(1.00000000f) / r3.w;
	r0.y = min(r0.y, float(-0.200000003f));
	r0.y = r0.y * r3.w;
	r6.xy = r7.xy / r0.yy;
	r6.zw = r2.zw + vec2(-0.400000006f, -0.400000006f);
	r6.zw = saturate(r6.zw * vec2(6.00000000f, 6.00000000f));
	r7.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(vec2(0.400000006f, 0.400000006f), r2.zw))));
	if (floatBitsToUint(r7.x) != uint(0))
	{
		r0.y = r6.z * idx_uniforms1_ps.cb1[6].x;
		r0.y = r0.y * float(0.0799999982f);
		r7.xz = r0.yy * r6.xy;
		r7.xz = r3.ww * r7.xz;
		r8.xy = fma(-r7.xz, vec2(0.500000000f, 0.500000000f), r1.xy);
		r9.z = idx_uniforms1_ps.cb1[6].y;
		r9.xy = r8.xy;
		r5.w = uintBitsToFloat(uint(0x3f800000));
		r6.z = uintBitsToFloat(uint(0x00000000));
		r7.w = uintBitsToFloat(uint(0x00000000));
		r8.z = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r8.w = intBitsToFloat(r8.z < r3.w ? int(0xffffffff) : int(0x00000000));
			r9.w = intBitsToFloat(r6.z < r5.w ? int(0xffffffff) : int(0x00000000));
			r8.w = uintBitsToFloat(floatBitsToUint(r8.w) & floatBitsToUint(r9.w));
			if (floatBitsToUint(r8.w) == uint(0))
				break;
			r5.w = -r4.w + r5.w;
			r9.xy = fma(r6.xy, r0.yy, r9.xy);
			r8.w = ((textureLod(resourceSamplerPair_5_ps, r9.xyz, r0.z))).w;
			r8.z = r8.z + float(1.00000000f);
			r7.w = r6.z;
			r6.z = r8.w;
		}
		r0.y = r4.w + r5.w;
		r6.z = r5.w + -r6.z;
		r7.w = -r7.w + r0.y;
		r0.y = r0.y * r6.z;
		r0.y = fma(r5.w, r7.w, -r0.y);
		r5.w = -r6.z + r7.w;
		r0.y = r0.y / r5.w;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r7.xz, r8.xy);
	}
	if (floatBitsToUint(r7.y) != uint(0))
	{
		r0.y = r6.w * idx_uniforms1_ps.cb1[7].x;
		r0.y = r0.y * float(0.0799999982f);
		r6.zw = r0.yy * r6.xy;
		r6.zw = r3.ww * r6.zw;
		r7.xy = fma(-r6.zw, vec2(0.500000000f, 0.500000000f), r1.xy);
		r8.z = idx_uniforms1_ps.cb1[7].y;
		r8.xy = r7.xy;
		r5.w = uintBitsToFloat(uint(0x3f800000));
		r7.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r8.w = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r9.x = intBitsToFloat(r8.w < r3.w ? int(0xffffffff) : int(0x00000000));
			r9.y = intBitsToFloat(r7.z < r5.w ? int(0xffffffff) : int(0x00000000));
			r9.x = uintBitsToFloat(floatBitsToUint(r9.y) & floatBitsToUint(r9.x));
			if (floatBitsToUint(r9.x) == uint(0))
				break;
			r5.w = -r4.w + r5.w;
			r8.xy = fma(r6.xy, r0.yy, r8.xy);
			r9.x = ((textureLod(resourceSamplerPair_5_ps, r8.xyz, r0.z)).wxyz).x;
			r8.w = r8.w + float(1.00000000f);
			r7.w = r7.z;
			r7.z = r9.x;
		}
		r0.y = r4.w + r5.w;
		r0.z = r5.w + -r7.z;
		r3.w = -r7.w + r0.y;
		r0.y = r0.z * r0.y;
		r0.y = fma(r5.w, r3.w, -r0.y);
		r0.z = -r0.z + r3.w;
		r0.y = r0.y / r0.z;
		r0.y = -r0.y + float(1.00000000f);
		r1.xy = fma(r0.yy, r6.zw, r7.xy);
	}
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r0.yz = ((texture(resourceSamplerPair_3_ps, r1.xyz)).xywz).yz;
	r0.yz = fma(r0.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.z = ((texture(resourceSamplerPair_4_ps, r1.xyz)).xywz).z;
	r1.w = idx_uniforms1_ps.cb1[7].y;
	r6.xy = ((texture(resourceSamplerPair_3_ps, r1.xyw)).ywxz).xy;
	r6.xy = fma(r6.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r6.xy = r2.yy * r6.xy;
	r0.yz = fma(r2.xx, r0.yz, r6.xy);
	r1.w = ((texture(resourceSamplerPair_4_ps, r1.xyw))).w;
	r1.w = r1.w * r2.w;
	r1.z = fma(r2.z, r1.z, r1.w);
	r0.yz = fma(r0.yz, r0.ww, -r3.yz);
	r0.yz = fma(r0.ww, r0.yz, r3.yz);
	r1.w = dot(r0.yz, r0.yz);
	r1.w = -r1.w + float(1.00000000f);
	r1.w = sqrt(abs(r1.w));
	r2.x = r5.y * r0.y;
	r2.y = -r5.x * r0.y;
	r2.z = uintBitsToFloat(uint(0x00000000));
	r2.xyz = fma(r4.xyz, r0.xxx, r2.xyz);
	r2.xyz = fma(r1.www, r5.xyz, r2.xyz);
	r6.x = uintBitsToFloat(uint(0x00000000));
	r6.yz = r5.zy * vec2(1.00000000f, -1.00000000f);
	r2.xyz = fma(r0.zzz, r6.xyz, r2.xyz);
	r0.y = dot(r2.xyz, r2.xyz);
	r0.y = inversesqrt(r0.y);
	r2.xzw = r0.yyy * r2.xyz;
	r0.z = -r3.x + r1.z;
	r3.y = saturate(fma(r0.w, r0.z, r3.x));
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
		r9.x = r5.y * r7.x;
		r9.y = -r5.x * r7.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r4.xyz = fma(r4.xyz, r0.xxx, r9.xyz);
		r1.yzw = fma(r1.yyy, r5.xyz, r4.xyz);
		r1.yzw = fma(r7.yzw, r6.xyz, r1.yzw);
		r0.x = dot(r1.yzw, r1.yzw);
		r0.x = inversesqrt(r0.x);
		r4 = (texture(resourceSamplerPair_8_ps, v1.v.zw));
		r0.w = min(r4.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r2.y = uintBitsToFloat(uint(0x3f800000));
		r4.xyz = r4.xyz * r8.xyz;
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
		r4.xyz = fma(r4.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r4.xyz = fma(r0.yyy, r4.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r3.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r5.xyz = -r3.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r3.xyz = fma(r0.yyy, r5.xyz, r3.xyz);
		r0.xzw = fma(r1.yzw, r0.xxx, -r2.xzw);
		r0.xyz = fma(r0.yyy, r0.xzw, r2.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r2.xzw = r0.www * r0.xyz;
	}
	else
	{
		r4.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r3.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r2.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r4.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r3.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

