#version 460 core
// ps_5_0
// Checksum: 6fd37b0c_544505f7_2736c2f7_83be1d69
// Name: fastter_noplxlod0cidx2cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res5, s5

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2

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
	r0.xy = v2.v.xz * vec2(0.00390625000f, 0.00390625000f);
	r1.xy = v2.v.xz * idx_uniforms1_ps.cb1[4].zz;
	r0.zw = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).yzxw).zw;
	r0.zw = fma(r0.zw, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r2.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r3.x = saturate(dot(r2.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r2.w = -r3.x + float(1.00000000f);
	r3.x = dot(r2, idx_uniforms1_ps.cb1[10]);
	r3.y = dot(r2, idx_uniforms1_ps.cb1[11]);
	r3.z = dot(r2, idx_uniforms1_ps.cb1[12]);
	r3.w = dot(r2, idx_uniforms1_ps.cb1[13]);
	r2.x = dot(r3, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r2.xy = r3.xy / r2.xx;
	r3.z = r2.x * idx_uniforms1_ps.cb1[6].z;
	r3.xw = r2.yy * idx_uniforms1_ps.cb1[7].wz;
	r2.z = fma(idx_uniforms1_ps.cb1[6].w, r2.x, r3.x);
	r0.xy = ((texture(resourceSamplerPair_2_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r2.z = r2.z * float(1.50000000f);
	r0.xy = fma(r2.zz, r0.xy, -r0.zw);
	r0.zw = r3.zw * vec2(8.00000000f, 8.00000000f);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r2.z = dot(r0.xy, r0.xy);
	r2.z = r2.z + float(1.00000000f);
	r3.x = inversesqrt(r2.z);
	r4.xz = r0.xy * r3.xx;
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r0.xy = ((texture(resourceSamplerPair_3_ps, r1.xyz)).ywxz).xy;
	r0.xy = fma(r0.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.z = ((texture(resourceSamplerPair_4_ps, r1.xyz)).xywz).z;
	r1.w = idx_uniforms1_ps.cb1[7].y;
	r2.zw = ((texture(resourceSamplerPair_3_ps, r1.xyw)).xzyw).zw;
	r2.zw = fma(r2.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r2.zw = r0.ww * r2.zw;
	r0.xy = fma(r0.zz, r0.xy, r2.zw);
	r0.z = ((texture(resourceSamplerPair_4_ps, r1.xyw)).xywz).z;
	r0.z = r0.z * r2.y;
	r1.y = saturate(fma(r2.x, r1.z, r0.z));
	r0.z = dot(r0.xy, r0.xy);
	r0.z = -r0.z + float(1.00000000f);
	r0.z = sqrt(abs(r0.z));
	r3.y = -1.f * r4.x;
	r3.z = uintBitsToFloat(uint(0x00000000));
	r4.y = r3.x;
	r2.xyz = fma(r0.xxx, r3.xyz, r4.xyz);
	r0.xzw = fma(r0.zzz, r4.xyz, r2.xyz);
	r2.xz = r3.zx * vec2(1.00000000f, -1.00000000f);
	r2.y = r4.z;
	r0.xyz = fma(r0.yyy, r2.xyz, r0.xzw);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r5.xyz = r0.www * r0.xyz;
	r6.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r6.x = v2.v.x;
	r7 = r6.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r8.xyz = ((texture(resourceSamplerPair_5_ps, r7.xy))).xyz;
	r0.x = saturate(r5.z * idx_uniforms1_ps.cb1[14].z);
	r0.x = fma(r0.y, r0.w, r0.x);
	r0.y = intBitsToFloat(r0.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r9 = (texture(resourceSamplerPair_6_ps, r7.xy));
	r0.z = ((texture(resourceSamplerPair_6_ps, r7.zw)).xywz).z;
	r6.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r6.xy = fma(r6.xy, vec2(0.0206250008f, 0.00562500022f), r6.zw);
	r0.w = ((texture(resourceSamplerPair_6_ps, r6.xy))).w;
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r6.xyz = fma(r8.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r6.w = r6.y * float(2.00000000f);
		r3.xyz = fma(r6.wwy, r3.xyz, r4.xyz);
		r3.xyz = fma(r6.xxx, r4.xyz, r3.xyz);
		r4.xyz = r6.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r2.xyz = fma(r4.xyz, r2.xyz, r3.xyz);
		r0.y = dot(r2.xyz, r2.xyz);
		r0.y = inversesqrt(r0.y);
		r3 = (texture(resourceSamplerPair_7_ps, v1.v.zw));
		r1.w = min(r3.w, idx_uniforms1_ps.cb1[14].x);
		r1.w = saturate(r1.w * idx_uniforms1_ps.cb1[14].y);
		r2.w = uintBitsToFloat(uint(0x3f800000));
		r3.xyz = r3.xyz * r9.xyz;
		r2.w = fma(r9.w, r2.w, float(0.750000000f));
		r3.w = r0.z * r2.w;
		r4.x = r1.w * float(0.699999988f);
		r0.z = fma(-r0.z, r2.w, float(0.100000001f));
		r0.z = fma(r4.x, r0.z, r3.w);
		r0.w = -r0.w + float(1.00000000f);
		r0.z = saturate(fma(-r0.w, idx_uniforms1_ps.cb1[15].x, r0.z));
		r0.z = r0.z * r1.w;
		r0.w = r0.z * float(3.00000000f);
		r0.z = fma(r0.z, float(-0.300000012f), float(0.800000012f));
		r0.w = min(r0.w, float(1.00000000f));
		r1.w = -r0.z + float(1.00000000f);
		r0.w = r0.w / r1.w;
		r0.x = -r0.z + r0.x;
		r0.x = saturate(r0.w * r0.x);
		r3.xyz = fma(r3.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r3.xyz = fma(r0.xxx, r3.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r1.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r1.xyz = fma(r0.xxx, r4.xyz, r1.xyz);
		r0.yzw = fma(r2.xyz, r0.yyy, -r5.xyz);
		r0.xyz = fma(r0.xxx, r0.yzw, r5.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r5.xyz = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
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

