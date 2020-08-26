#version 460 core
// ps_5_0
// Checksum: b221d27c_acec1c60_af5a674d_666ad134
// Name: fastter_noplxlod0cidx2

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

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2

uniform sampler2DArray resourceSamplerPair_4_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_5_ps; // res9, s9

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
	r0.zw = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).yzxw).zw;
	r0.zw = fma(r0.zw, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r2.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r3.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
	r4.x = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r4.x + float(1.00000000f);
	r4.x = dot(r3, idx_uniforms1_ps.cb1[10]);
	r4.y = dot(r3, idx_uniforms1_ps.cb1[11]);
	r4.z = dot(r3, idx_uniforms1_ps.cb1[12]);
	r4.w = dot(r3, idx_uniforms1_ps.cb1[13]);
	r3.x = dot(r4, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r3.xy = r4.xy / r3.xx;
	r4.z = r3.x * idx_uniforms1_ps.cb1[6].z;
	r4.xw = r3.yy * idx_uniforms1_ps.cb1[7].wz;
	r3.z = fma(idx_uniforms1_ps.cb1[6].w, r3.x, r4.x);
	r0.xy = ((texture(resourceSamplerPair_3_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r3.z = r3.z * float(1.50000000f);
	r0.xy = fma(r3.zz, r0.xy, -r0.zw);
	r0.zw = r4.zw * vec2(8.00000000f, 8.00000000f);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r3.z = dot(r0.xy, r0.xy);
	r3.z = r3.z + float(1.00000000f);
	r4.x = inversesqrt(r3.z);
	r5.xz = r0.xy * r4.xx;
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r0.xy = ((texture(resourceSamplerPair_4_ps, r1.xyz)).ywxz).xy;
	r0.xy = fma(r0.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r6 = (texture(resourceSamplerPair_5_ps, r1.xyz));
	r1.w = idx_uniforms1_ps.cb1[7].y;
	r3.zw = ((texture(resourceSamplerPair_4_ps, r1.xyw)).xzyw).zw;
	r3.zw = fma(r3.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r3.zw = r0.ww * r3.zw;
	r0.xy = fma(r0.zz, r0.xy, r3.zw);
	r1 = (texture(resourceSamplerPair_5_ps, r1.xyw));
	r1 = r1 * r3.yyyy;
	r1 = fma(r3.xxxx, r6, r1);
	r0.z = dot(r0.xy, r0.xy);
	r0.z = -r0.z + float(1.00000000f);
	r0.z = sqrt(abs(r0.z));
	r4.y = -1.f * r5.x;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r5.y = r4.x;
	r3.xyz = fma(r0.xxx, r4.xyz, r5.xyz);
	r0.xzw = fma(r0.zzz, r5.xyz, r3.xyz);
	r3.xz = r4.zx * vec2(1.00000000f, -1.00000000f);
	r3.y = r5.z;
	r0.xyz = fma(r0.yyy, r3.xyz, r0.xzw);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r6.xyz = r0.www * r0.xyz;
	r2.w = uintBitsToFloat(uint(0x3f800000));
	r1 = r1 * r2;
	r1 = saturate(r1.xwyz * vec4(4.69999981f, 1.00000000f, 4.69999981f, 4.69999981f));
	r2.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r2.x = v2.v.x;
	r7 = r2.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r8.xyz = ((texture(resourceSamplerPair_6_ps, r7.xy))).xyz;
	r0.x = saturate(r6.z * idx_uniforms1_ps.cb1[14].z);
	r0.x = fma(r0.y, r0.w, r0.x);
	r0.y = intBitsToFloat(r0.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r9 = (texture(resourceSamplerPair_7_ps, r7.xy));
	r0.z = ((texture(resourceSamplerPair_7_ps, r7.zw)).xywz).z;
	r2.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r2.xy = fma(r2.xy, vec2(0.0206250008f, 0.00562500022f), r2.zw);
	r0.w = ((texture(resourceSamplerPair_7_ps, r2.xy))).w;
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r2.xyz = fma(r8.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r2.w = r2.y * float(2.00000000f);
		r4.xyz = fma(r2.wwy, r4.xyz, r5.xyz);
		r2.xyw = fma(r2.xxx, r5.xyz, r4.xyz);
		r4.xyz = r2.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r2.xyz = fma(r4.xyz, r3.xyz, r2.xyw);
		r0.y = dot(r2.xyz, r2.xyz);
		r0.y = inversesqrt(r0.y);
		r3 = (texture(resourceSamplerPair_8_ps, v1.v.zw));
		r2.w = min(r3.w, idx_uniforms1_ps.cb1[14].x);
		r2.w = saturate(r2.w * idx_uniforms1_ps.cb1[14].y);
		r3.w = uintBitsToFloat(uint(0x3f800000));
		r3.xyz = r3.xyz * r9.xyz;
		r3.w = fma(r9.w, r3.w, float(0.750000000f));
		r4.x = r0.z * r3.w;
		r4.y = r2.w * float(0.699999988f);
		r0.z = fma(-r0.z, r3.w, float(0.100000001f));
		r0.z = fma(r4.y, r0.z, r4.x);
		r0.w = -r0.w + float(1.00000000f);
		r0.z = saturate(fma(-r0.w, idx_uniforms1_ps.cb1[15].x, r0.z));
		r0.z = r0.z * r2.w;
		r0.w = r0.z * float(3.00000000f);
		r0.z = fma(r0.z, float(-0.300000012f), float(0.800000012f));
		r0.w = min(r0.w, float(1.00000000f));
		r2.w = -r0.z + float(1.00000000f);
		r0.w = r0.w / r2.w;
		r0.x = -r0.z + r0.x;
		r0.x = saturate(r0.w * r0.x);
		r3.xyz = fma(r3.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r1.xzw);
		r3.xyz = fma(r0.xxx, r3.xyz, r1.xzw);
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r1.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r1.xyz = fma(r0.xxx, r4.xyz, r1.xyz);
		r0.yzw = fma(r2.xyz, r0.yyy, -r6.xyz);
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

