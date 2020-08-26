#version 460 core
// ps_5_0
// Checksum: 8673697a_bbb24667_5e39b144_751f6b14
// Name: fastter_lod0cidx1cgc

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
	r1.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r0.w = saturate(dot(r1.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r1.w = -r0.w + float(1.00000000f);
	r2.x = dot(r1, idx_uniforms1_ps.cb1[10]);
	r2.y = dot(r1, idx_uniforms1_ps.cb1[11]);
	r2.z = dot(r1, idx_uniforms1_ps.cb1[12]);
	r2.w = dot(r1, idx_uniforms1_ps.cb1[13]);
	r0.w = dot(r2, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = r2.x / r0.w;
	r1.x = r0.w * idx_uniforms1_ps.cb1[6].z;
	r1.x = r1.x * float(8.00000000f);
	r1.y = dot(v4.v.xyz, v4.v.xyz);
	r1.y = inversesqrt(r1.y);
	r2.xyz = r1.yyy * v4.v.xyz;
	r1.z = intBitsToFloat(float(0.400000006f) < r0.w ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r1.z) != uint(0))
	{
		r3.xy = dFdxCoarse(v2.v.xz);
		r3.zw = dFdyCoarse(v2.v.xz);
		r1.z = dot(r3, r3);
		r1.z = log2(r1.z);
		r1.z = fma(r1.z, float(0.500000000f), float(6.50000000f));
		r3.xyz = r2.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
		r3.xyz = fma(r2.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r3.xyz);
		r1.w = dot(r3.xy, r3.xy);
		r1.w = inversesqrt(r1.w);
		r3.xyz = r1.www * r3.xyz;
		r1.w = dot(r3.xy, r2.xy);
		r3.xyz = fma(-r2.xyz, r1.www, r3.xyz);
		r1.w = dot(r3.xyz, r3.xyz);
		r1.w = inversesqrt(r1.w);
		r3.xyz = r1.www * r3.xyz;
		r4.xyz = r2.zxy * r3.yzx;
		r4.xyz = fma(r2.yzx, r3.zxy, -r4.xyz);
		r5.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
		r1.w = dot(r5.xyz, r5.xyz);
		r1.w = inversesqrt(r1.w);
		r5.xyz = r1.www * r5.xyz;
		r3.x = dot(-r3.xyz, r5.xyz);
		r3.y = dot(r4.xyz, r5.xyz);
		r1.w = dot(-r2.xyz, r5.xyz);
		r2.w = max(-r1.w, float(0.500000000f));
		r2.w = float(8.00000000f) / r2.w;
		r2.w = max(r2.w, float(1.00000000f));
		r3.z = float(1.00000000f) / r2.w;
		r1.zw = min(r1.zw, vec2(6.00000000f, -0.200000003f));
		r1.w = r1.w * r2.w;
		r3.xy = r3.xy / r1.ww;
		r1.w = r0.w + float(-0.400000006f);
		r1.w = saturate(r1.w * float(6.00000000f));
		r1.w = r1.w * idx_uniforms1_ps.cb1[6].x;
		r1.w = r1.w * float(0.0799999982f);
		r4.xy = r1.ww * r3.xy;
		r4.xy = r2.ww * r4.xy;
		r4.zw = fma(-r4.xy, vec2(0.500000000f, 0.500000000f), r0.xy);
		r5.z = idx_uniforms1_ps.cb1[6].y;
		r5.xy = r4.zw;
		r3.w = uintBitsToFloat(uint(0x3f800000));
		r5.w = uintBitsToFloat(uint(0x00000000));
		r6.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r6.z = intBitsToFloat(r6.y < r2.w ? int(0xffffffff) : int(0x00000000));
			r6.w = intBitsToFloat(r5.w < r3.w ? int(0xffffffff) : int(0x00000000));
			r6.z = uintBitsToFloat(floatBitsToUint(r6.w) & floatBitsToUint(r6.z));
			if (floatBitsToUint(r6.z) == uint(0))
				break;
			r3.w = -r3.z + r3.w;
			r5.xy = fma(r3.xy, r1.ww, r5.xy);
			r6.z = ((textureLod(resourceSamplerPair_1_ps, r5.xyz, r1.z)).xywz).z;
			r6.y = r6.y + float(1.00000000f);
			r6.x = r5.w;
			r5.w = r6.z;
		}
		r1.z = r3.z + r3.w;
		r1.w = r3.w + -r5.w;
		r2.w = -r6.x + r1.z;
		r1.z = r1.w * r1.z;
		r1.z = fma(r3.w, r2.w, -r1.z);
		r1.w = -r1.w + r2.w;
		r1.z = r1.z / r1.w;
		r1.z = -r1.z + float(1.00000000f);
		r0.xy = fma(r1.zz, r4.xy, r4.zw);
	}
	r0.z = idx_uniforms1_ps.cb1[6].y;
	r1.zw = ((texture(resourceSamplerPair_2_ps, r0.xyz)).xzyw).zw;
	r1.zw = fma(r1.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xz = r1.zw * r1.xx;
	r0.z = ((texture(resourceSamplerPair_3_ps, r0.xyz)).xywz).z;
	r3.y = saturate(r0.z * r0.w);
	r0.z = dot(r1.xz, r1.xz);
	r0.z = -r0.z + float(1.00000000f);
	r0.z = sqrt(abs(r0.z));
	r4.x = r2.y * r1.x;
	r4.y = -r2.x * r1.x;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r4.xyz = fma(v4.v.xyz, r1.yyy, r4.xyz);
	r4.xyz = fma(r0.zzz, r2.xyz, r4.xyz);
	r5.x = uintBitsToFloat(uint(0x00000000));
	r5.yz = r2.zy * vec2(1.00000000f, -1.00000000f);
	r1.xzw = fma(r1.zzz, r5.xyz, r4.xyz);
	r0.z = dot(r1.xzw, r1.xzw);
	r0.z = inversesqrt(r0.z);
	r4.xyz = r0.zzz * r1.xzw;
	r0.xy = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r0.xy);
	r6.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r6.x = v2.v.x;
	r0.xy = fma(-r0.xy, vec2(9.00000000f, 9.00000000f), r6.xy);
	r6 = r0.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_4_ps, r6.xy))).xyz;
	r0.w = saturate(r4.z * idx_uniforms1_ps.cb1[14].z);
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
		r9.x = r2.y * r7.x;
		r9.y = -r2.x * r7.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r1.yzw = fma(v4.v.xyz, r1.yyy, r9.xyz);
		r1.yzw = fma(r6.xxx, r2.xyz, r1.yzw);
		r1.yzw = fma(r7.yzw, r5.xyz, r1.yzw);
		r0.y = dot(r1.yzw, r1.yzw);
		r0.y = inversesqrt(r0.y);
		r2 = (texture(resourceSamplerPair_6_ps, v1.v.zw));
		r0.w = min(r2.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r2.w = uintBitsToFloat(uint(0x3f800000));
		r2.xyz = r2.xyz * r8.xyz;
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
		r2.xyz = fma(r2.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r2.xyz = fma(r0.xxx, r2.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r3.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r5.xyz = -r3.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r3.xyz = fma(r0.xxx, r5.xyz, r3.xyz);
		r0.yzw = fma(r1.yzw, r0.yyy, -r4.xyz);
		r0.xyz = fma(r0.xxx, r0.yzw, r4.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r4.xyz = r0.www * r0.xyz;
	}
	else
	{
		r2.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r3.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r4.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r2.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r3.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

