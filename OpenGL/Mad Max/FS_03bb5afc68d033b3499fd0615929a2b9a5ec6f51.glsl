#version 460 core
// ps_5_0
// Checksum: 27a166d3_d495f4f5_3d4b683d_eb763273
// Name: fastter_lod0cidx1

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
	r1.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r2.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r0.w = saturate(dot(r2.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r2.w = -r0.w + float(1.00000000f);
	r3.x = dot(r2, idx_uniforms1_ps.cb1[10]);
	r3.y = dot(r2, idx_uniforms1_ps.cb1[11]);
	r3.z = dot(r2, idx_uniforms1_ps.cb1[12]);
	r3.w = dot(r2, idx_uniforms1_ps.cb1[13]);
	r0.w = dot(r3, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = r3.x / r0.w;
	r2.x = r0.w * idx_uniforms1_ps.cb1[6].z;
	r2.x = r2.x * float(8.00000000f);
	r2.y = dot(v4.v.xyz, v4.v.xyz);
	r2.y = inversesqrt(r2.y);
	r3.xyz = r2.yyy * v4.v.xyz;
	r2.z = intBitsToFloat(float(0.400000006f) < r0.w ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r2.z) != uint(0))
	{
		r4.xy = dFdxCoarse(v2.v.xz);
		r4.zw = dFdyCoarse(v2.v.xz);
		r2.z = dot(r4, r4);
		r2.z = log2(r2.z);
		r2.z = fma(r2.z, float(0.500000000f), float(6.50000000f));
		r4.xyz = r3.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
		r4.xyz = fma(r3.yzx, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r4.xyz);
		r2.w = dot(r4.xy, r4.xy);
		r2.w = inversesqrt(r2.w);
		r4.xyz = r2.www * r4.xyz;
		r2.w = dot(r4.xy, r3.xy);
		r4.xyz = fma(-r3.xyz, r2.www, r4.xyz);
		r2.w = dot(r4.xyz, r4.xyz);
		r2.w = inversesqrt(r2.w);
		r4.xyz = r2.www * r4.xyz;
		r5.xyz = r3.zxy * r4.yzx;
		r5.xyz = fma(r3.yzx, r4.zxy, -r5.xyz);
		r6.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
		r2.w = dot(r6.xyz, r6.xyz);
		r2.w = inversesqrt(r2.w);
		r6.xyz = r2.www * r6.xyz;
		r4.x = dot(-r4.xyz, r6.xyz);
		r4.y = dot(r5.xyz, r6.xyz);
		r2.w = dot(-r3.xyz, r6.xyz);
		r3.w = max(-r2.w, float(0.500000000f));
		r3.w = float(8.00000000f) / r3.w;
		r3.w = max(r3.w, float(1.00000000f));
		r4.z = float(1.00000000f) / r3.w;
		r2.zw = min(r2.zw, vec2(6.00000000f, -0.200000003f));
		r2.w = r2.w * r3.w;
		r4.xy = r4.xy / r2.ww;
		r2.w = r0.w + float(-0.400000006f);
		r2.w = saturate(r2.w * float(6.00000000f));
		r2.w = r2.w * idx_uniforms1_ps.cb1[6].x;
		r2.w = r2.w * float(0.0799999982f);
		r5.xy = r2.ww * r4.xy;
		r5.xy = r3.ww * r5.xy;
		r5.zw = fma(-r5.xy, vec2(0.500000000f, 0.500000000f), r0.xy);
		r6.z = idx_uniforms1_ps.cb1[6].y;
		r6.xy = r5.zw;
		r4.w = uintBitsToFloat(uint(0x3f800000));
		r6.w = uintBitsToFloat(uint(0x00000000));
		r7.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r7.z = intBitsToFloat(r7.y < r3.w ? int(0xffffffff) : int(0x00000000));
			r7.w = intBitsToFloat(r6.w < r4.w ? int(0xffffffff) : int(0x00000000));
			r7.z = uintBitsToFloat(floatBitsToUint(r7.w) & floatBitsToUint(r7.z));
			if (floatBitsToUint(r7.z) == uint(0))
				break;
			r4.w = -r4.z + r4.w;
			r6.xy = fma(r4.xy, r2.ww, r6.xy);
			r7.z = ((textureLod(resourceSamplerPair_2_ps, r6.xyz, r2.z)).xywz).z;
			r7.y = r7.y + float(1.00000000f);
			r7.x = r6.w;
			r6.w = r7.z;
		}
		r2.z = r4.z + r4.w;
		r2.w = r4.w + -r6.w;
		r3.w = -r7.x + r2.z;
		r2.z = r2.w * r2.z;
		r2.z = fma(r4.w, r3.w, -r2.z);
		r2.w = -r2.w + r3.w;
		r2.z = r2.z / r2.w;
		r2.z = -r2.z + float(1.00000000f);
		r0.xy = fma(r2.zz, r5.xy, r5.zw);
	}
	r0.z = idx_uniforms1_ps.cb1[6].y;
	r2.zw = ((texture(resourceSamplerPair_3_ps, r0.xyz)).xzyw).zw;
	r2.zw = fma(r2.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r2.xz = r2.zw * r2.xx;
	r4 = (texture(resourceSamplerPair_4_ps, r0.xyz));
	r4 = r0.wwww * r4;
	r0.z = dot(r2.xz, r2.xz);
	r0.z = -r0.z + float(1.00000000f);
	r0.z = sqrt(abs(r0.z));
	r5.x = r3.y * r2.x;
	r5.y = -r3.x * r2.x;
	r5.z = uintBitsToFloat(uint(0x00000000));
	r5.xyz = fma(v4.v.xyz, r2.yyy, r5.xyz);
	r5.xyz = fma(r0.zzz, r3.xyz, r5.xyz);
	r6.x = uintBitsToFloat(uint(0x00000000));
	r6.yz = r3.zy * vec2(1.00000000f, -1.00000000f);
	r2.xzw = fma(r2.zzz, r6.xyz, r5.xyz);
	r0.z = dot(r2.xzw, r2.xzw);
	r0.z = inversesqrt(r0.z);
	r5.xyz = r0.zzz * r2.xzw;
	r1.w = uintBitsToFloat(uint(0x3f800000));
	r1 = r1 * r4;
	r1 = saturate(r1.xwyz * vec4(4.69999981f, 1.00000000f, 4.69999981f, 4.69999981f));
	r0.xy = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r0.xy);
	r4.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r4.x = v2.v.x;
	r0.xy = fma(-r0.xy, vec2(9.00000000f, 9.00000000f), r4.xy);
	r4 = r0.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_5_ps, r4.xy))).xyz;
	r0.w = saturate(r5.z * idx_uniforms1_ps.cb1[14].z);
	r0.z = fma(r2.z, r0.z, r0.w);
	r0.w = intBitsToFloat(r0.z >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_6_ps, r4.xy));
	r2.x = ((texture(resourceSamplerPair_6_ps, r4.zw)).wxyz).x;
	r2.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.xy = fma(r0.xy, vec2(0.0206250008f, 0.00562500022f), r2.zw);
	r0.x = ((texture(resourceSamplerPair_6_ps, r0.xy)).wxyz).x;
	if (floatBitsToUint(r0.w) != uint(0))
	{
		r4.xyz = fma(r7.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7 = r4.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r3.y * r7.x;
		r9.y = -r3.x * r7.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r2.yzw = fma(v4.v.xyz, r2.yyy, r9.xyz);
		r2.yzw = fma(r4.xxx, r3.xyz, r2.yzw);
		r2.yzw = fma(r7.yzw, r6.xyz, r2.yzw);
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
		r0.yzw = fma(r2.yzw, r0.yyy, -r5.xyz);
		r0.xyz = fma(r0.xxx, r0.yzw, r5.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r5.xyz = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = r1.xzw;
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r5.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r3.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r1.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

