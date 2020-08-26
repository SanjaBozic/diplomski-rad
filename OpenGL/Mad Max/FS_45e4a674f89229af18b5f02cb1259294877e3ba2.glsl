#version 460 core
// ps_5_0
// Checksum: 9ab8dd44_93f4d3b5_87f434fc_60ac2549
// Name: fastter_lod12

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res10, s10

uniform sampler2D resourceSamplerPair_1_ps; // res5, s5

uniform sampler2D resourceSamplerPair_2_ps; // res1, s1

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3

uniform sampler2D resourceSamplerPair_4_ps; // res4, s4

uniform sampler2D resourceSamplerPair_5_ps; // res6, s6

uniform sampler2D resourceSamplerPair_6_ps; // res2, s2

uniform sampler2DArray resourceSamplerPair_7_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_8_ps; // res9, s9

uniform sampler2D resourceSamplerPair_9_ps; // res12, s12

uniform sampler2D resourceSamplerPair_10_ps; // res11, s11

uniform sampler2D resourceSamplerPair_11_ps; // res13, s13


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v2.v.xz * vec2(0.00390625000f, 0.00390625000f);
	r0.z = saturate(v3.v.y);
	r1 = v2.v.xzxz * vec4(0.00150000001f, 0.00150000001f, 0.00499999989f, 0.00499999989f);
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy)).xywz).xyz;
	r1.xy = fma(r2.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.w = ((texture(resourceSamplerPair_0_ps, r1.zw)).xywz).w;
	r0.w = fma(r0.w, float(2.00000000f), float(-1.00000000f));
	r0.w = r0.w * v3.v.z;
	r1.z = r2.z * float(0.200000003f);
	r2.xy = ((texture(resourceSamplerPair_1_ps, v1.v.xy)).xwyz).xy;
	r2.xy = fma(r2.xy, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r2.zw = r1.xy * v3.v.zz;
	r2.zw = fma(r2.zw, vec2(0.0199999996f, 0.0199999996f), v1.v.xy);
	r3.xyz = ((texture(resourceSamplerPair_2_ps, r2.zw))).xyz;
	r1.w = dot(-r2.xy, -r2.xy);
	r1.w = min(r1.w, float(1.00000000f));
	r1.w = sqrt(r1.w);
	r3.w = fma(r1.w, float(0.600000024f), float(0.400000006f));
	r1.w = r1.w * r3.w;
	r1.xyz = r1.xyw * r1.wwz;
	r1.xy = fma(-r1.xy, v3.v.zz, -r2.xy);
	r0.w = r0.w * r1.w;
	r0.w = fma(r0.w, float(10.0000000f), float(1.00000000f));
	r3.xyz = r0.www * r3.xyz;
	r4.xyz = ((texture(resourceSamplerPair_3_ps, r2.zw))).xyz;
	r2 = (texture(resourceSamplerPair_4_ps, r2.zw));
	r2 = r2 * vec4(15.0000000f, 15.0000000f, 15.0000000f, 15.0000000f);
	r2 = roundEven(r2);
	r0.w = saturate(dot(r4.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r4.w = -r0.w + float(1.00000000f);
	r2 = fma(idx_uniforms1_ps.cb1[1].xxxx, vec4(16.0000000f, 16.0000000f, 16.0000000f, 16.0000000f), r2.xzwy);
	r0.w = dot(r4, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r4 = r4 / r0.wwww;
	r5 = r2.xywz * vec4(0.00784313772f, 0.00784313772f, 0.00784313772f, 0.00784313772f);
	r6.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r6.yw = r5.xz;
	r6.xy = ((texture(resourceSamplerPair_5_ps, r6.xy)).zwxy).xy;
	r6.zw = ((texture(resourceSamplerPair_5_ps, r6.zw))).zw;
	r5.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r5.xy = ((texture(resourceSamplerPair_5_ps, r5.xy)).zwxy).xy;
	r7.zw = ((texture(resourceSamplerPair_5_ps, r5.zw)).xywz).zw;
	r0.w = r4.y * r6.w;
	r0.w = fma(r6.y, r4.x, r0.w);
	r0.w = fma(r5.y, r4.z, r0.w);
	r0.w = fma(r7.z, r4.w, r0.w);
	r0.xy = ((texture(resourceSamplerPair_6_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xyw = r0.xyw * vec3(1.00000000f, -1.00000000f, 1.50000000f);
	r0.xy = fma(r0.ww, r0.xy, r1.xy);
	r8.x = uintBitsToFloat(uint(0x3c800000));
	r8.yz = r2.xw;
	r1.xyw = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r8.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r2.x = uintBitsToFloat(uint(0x3c800000));
	r2.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r2.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r8.x = ((texture(resourceSamplerPair_5_ps, r1.xy)).yxzw).x;
	r8.y = ((texture(resourceSamplerPair_5_ps, r1.xw))).y;
	r8.z = ((texture(resourceSamplerPair_5_ps, r2.xy)).xzyw).z;
	r8.w = ((texture(resourceSamplerPair_5_ps, r2.xz)).xzwy).w;
	r2 = r8 * vec4(255.000000f, 255.000000f, 255.000000f, 255.000000f);
	r2 = roundEven(r2);
	r7.xy = r6.xz;
	r7.z = r5.x;
	r5 = r4 * r7;
	r5 = r5 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r6.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r6.z = r2.x;
	r1.xy = ((texture(resourceSamplerPair_7_ps, r6.xyz)).ywxz).xy;
	r1.xy = fma(r1.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r6 = (texture(resourceSamplerPair_8_ps, r6.xyz));
	r7.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r7.z = r2.y;
	r8.xy = ((texture(resourceSamplerPair_7_ps, r7.xyz)).ywxz).xy;
	r8.xy = fma(r8.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r8.xy = r5.yy * r8.xy;
	r1.xy = fma(r5.xx, r1.xy, r8.xy);
	r7 = (texture(resourceSamplerPair_8_ps, r7.xyz));
	r7 = r4.yyyy * r7;
	r6 = fma(r4.xxxx, r6, r7);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r4.xy = ((texture(resourceSamplerPair_7_ps, r2.xyz)).ywxz).xy;
	r4.xy = fma(r4.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xy = fma(r5.zz, r4.xy, r1.xy);
	r7 = (texture(resourceSamplerPair_8_ps, r2.xyz));
	r6 = fma(r4.zzzz, r7, r6);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r4.xy = ((texture(resourceSamplerPair_7_ps, r2.xyw)).ywxz).xy;
	r4.xy = fma(r4.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xy = fma(r5.ww, r4.xy, r1.xy);
	r2 = (texture(resourceSamplerPair_8_ps, r2.xyw));
	r2 = fma(r4.wwww, r2, r6);
	r1.xy = r0.zz * r1.xy;
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r0.w = dot(r0.xy, r0.xy);
	r0.w = r0.w + float(1.00000000f);
	r4.x = inversesqrt(r0.w);
	r5.xz = r0.xy * r4.xx;
	r0.x = dot(r1.xy, r1.xy);
	r0.x = -r0.x + float(1.00000000f);
	r0.x = sqrt(abs(r0.x));
	r4.y = -1.f * r5.x;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r5.y = r4.x;
	r6.xyz = fma(r1.xxx, r4.xyz, r5.xyz);
	r0.xyw = fma(r0.xxx, r5.xyz, r6.xyz);
	r6.xz = r4.zx * vec2(1.00000000f, -1.00000000f);
	r6.y = r5.z;
	r0.xyw = fma(r1.yyy, r6.xyz, r0.xyw);
	r1.x = dot(r0.xyw, r0.xyw);
	r1.x = inversesqrt(r1.x);
	r7.xyz = r0.xyw * r1.xxx;
	r2 = fma(r2, vec4(4.69999981f, 4.69999981f, 4.69999981f, 1.00000000f), vec4(-1.00000000f, -1.00000000f, -1.00000000f, -0.00000000f));
	r2 = fma(r0.zzzz, r2, vec4(1.00000000f, 1.00000000f, 1.00000000f, 0.00000000f));
	r0.xzw = saturate(r3.xyz * r2.xyz);
	r2.w = saturate(r2.w);
	r2.y = fma(r1.z, v3.v.z, r2.w);
	r3.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r3.x = v2.v.x;
	r8 = r3.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r1.yzw = ((texture(resourceSamplerPair_9_ps, r8.xy)).wxyz).yzw;
	r2.w = saturate(r7.z * idx_uniforms1_ps.cb1[14].z);
	r0.y = fma(r0.y, r1.x, r2.w);
	r1.x = intBitsToFloat(r0.y >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r9 = (texture(resourceSamplerPair_10_ps, r8.xy));
	r2.w = ((texture(resourceSamplerPair_10_ps, r8.zw))).w;
	r3.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r3.xy = fma(r3.xy, vec2(0.0206250008f, 0.00562500022f), r3.zw);
	r3.x = ((texture(resourceSamplerPair_10_ps, r3.xy)).wxyz).x;
	if (floatBitsToUint(r1.x) != uint(0))
	{
		r1.xyz = fma(r1.wyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r1.w = r1.y * float(2.00000000f);
		r3.yzw = fma(r1.wwy, r4.xyz, r5.xyz);
		r1.xyw = fma(r1.xxx, r5.xyz, r3.yzw);
		r3.yzw = r1.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r1.xyz = fma(r3.yzw, r6.xyz, r1.xyw);
		r1.w = dot(r1.xyz, r1.xyz);
		r1.w = inversesqrt(r1.w);
		r4 = (texture(resourceSamplerPair_11_ps, v1.v.zw));
		r3.y = min(r4.w, idx_uniforms1_ps.cb1[14].x);
		r3.y = saturate(r3.y * idx_uniforms1_ps.cb1[14].y);
		r3.z = uintBitsToFloat(uint(0x3f800000));
		r4.xyz = r4.xyz * r9.xyz;
		r3.z = fma(r9.w, r3.z, float(0.750000000f));
		r3.w = r2.w * r3.z;
		r4.w = r3.y * float(0.699999988f);
		r2.w = fma(-r2.w, r3.z, float(0.100000001f));
		r2.w = fma(r4.w, r2.w, r3.w);
		r3.x = -r3.x + float(1.00000000f);
		r2.w = saturate(fma(-r3.x, idx_uniforms1_ps.cb1[15].x, r2.w));
		r2.w = r2.w * r3.y;
		r3.x = r2.w * float(3.00000000f);
		r2.w = fma(r2.w, float(-0.300000012f), float(0.800000012f));
		r3.x = min(r3.x, float(1.00000000f));
		r3.y = -r2.w + float(1.00000000f);
		r3.x = r3.x / r3.y;
		r0.y = r0.y + -r2.w;
		r0.y = saturate(r3.x * r0.y);
		r3.xyz = fma(r4.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r0.xzw);
		r0.xzw = fma(r0.yyy, r3.xyz, r0.xzw);
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r3.xyz = -r2.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r2.xyz = fma(r0.yyy, r3.xyz, r2.xyz);
		r1.xyz = fma(r1.xyz, r1.www, -r7.xyz);
		r1.xyz = fma(r0.yyy, r1.xyz, r7.xyz);
		r0.y = dot(r1.xyz, r1.xyz);
		r0.y = inversesqrt(r0.y);
		r7.xyz = r0.yyy * r1.xyz;
	}
	else
	{
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r7.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r0.xzw;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r2.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

