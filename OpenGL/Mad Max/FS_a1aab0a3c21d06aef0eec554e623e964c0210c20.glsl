#version 460 core
// ps_5_0
// Checksum: 5c4d0899_c9660e12_36c13684_bdeeec1b
// Name: fastterrainshader_blend

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res11, s11

uniform sampler2D resourceSamplerPair_1_ps; // res12, s12

uniform sampler2D resourceSamplerPair_2_ps; // res13, s13

uniform sampler2D resourceSamplerPair_3_ps; // res10, s10

uniform sampler2D resourceSamplerPair_4_ps; // res2, s2

uniform sampler2D resourceSamplerPair_5_ps; // res4, s4

uniform sampler2D resourceSamplerPair_6_ps; // res6, s6

uniform sampler2D resourceSamplerPair_7_ps; // res3, s3

uniform sampler2D resourceSamplerPair_8_ps; // res1, s1

uniform sampler2D resourceSamplerPair_9_ps; // res0, s0

uniform sampler2D resourceSamplerPair_10_ps; // res5, s5

uniform sampler2D resourceSamplerPair_11_ps; // res7, s7


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r1.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r1.x = v2.v.x;
	r0.xy = fma(r1.xy, vec2(0.0206250008f, 0.00562500022f), r0.xy);
	r1 = r1.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy)).wxyz).x;
	r0.x = -r0.x + float(1.00000000f);
	r0.y = uintBitsToFloat(uint(0x3f800000));
	r2 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0.y = fma(r2.w, r0.y, float(0.750000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r1.zw)).xywz).z;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, r1.xy))).xyz;
	r1.xyz = fma(r1.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = r0.y * r0.z;
	r0.y = fma(-r0.z, r0.y, float(0.100000001f));
	r3 = (texture(resourceSamplerPair_2_ps, v1.v.zw));
	r0.z = min(r3.w, idx_uniforms1_ps.cb1[14].x);
	r2.xyz = r2.xyz * r3.xyz;
	r0.z = saturate(r0.z * idx_uniforms1_ps.cb1[14].y);
	r1.w = r0.z * float(0.699999988f);
	r0.y = fma(r1.w, r0.y, r0.w);
	r0.x = saturate(fma(-r0.x, idx_uniforms1_ps.cb1[15].x, r0.y));
	r0.x = r0.x * r0.z;
	r0.y = r0.x * float(3.00000000f);
	r0.x = fma(r0.x, float(-0.300000012f), float(0.800000012f));
	r0.y = min(r0.y, float(1.00000000f));
	r0.z = -r0.x + float(1.00000000f);
	r0.y = r0.y / r0.z;
	r3 = v2.v.xzxz * vec4(0.00390625000f, 0.00390625000f, 0.00150000001f, 0.00150000001f);
	r4.xyz = ((texture(resourceSamplerPair_3_ps, r3.zw)).xywz).xyz;
	r0.zw = ((texture(resourceSamplerPair_4_ps, r3.xy)).zwxy).zw;
	r0.zw = fma(r0.zw, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.zw = r0.zw * vec2(1.00000000f, -1.00000000f);
	r3.xy = fma(r4.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.w = r4.z * float(0.200000003f);
	r3.zw = r3.xy * v3.v.zz;
	r3.zw = fma(r3.zw, vec2(0.0199999996f, 0.0199999996f), v1.v.xy);
	r4 = (texture(resourceSamplerPair_5_ps, r3.zw));
	r4 = r4 * vec4(15.0000000f, 15.0000000f, 15.0000000f, 15.0000000f);
	r4 = roundEven(r4);
	r4 = fma(idx_uniforms1_ps.cb1[1].xxxx, vec4(16.0000000f, 16.0000000f, 16.0000000f, 16.0000000f), r4);
	r4 = r4.xzyw * vec4(0.00784313772f, 0.00784313772f, 0.00784313772f, 0.00784313772f);
	r5.yw = r4.xz;
	r5.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r2.w = ((texture(resourceSamplerPair_6_ps, r5.zw))).w;
	r5.x = ((texture(resourceSamplerPair_6_ps, r5.xy)).wxyz).x;
	r6.xyz = ((texture(resourceSamplerPair_7_ps, r3.zw))).xyz;
	r5.yzw = ((texture(resourceSamplerPair_8_ps, r3.zw)).wxyz).yzw;
	r3.z = saturate(dot(r6.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r6.w = -r3.z + float(1.00000000f);
	r3.z = dot(r6, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r6 = r6 / r3.zzzz;
	r2.w = r2.w * r6.y;
	r2.w = fma(r5.x, r6.x, r2.w);
	r4.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r3.z = ((texture(resourceSamplerPair_6_ps, r4.xy)).xywz).z;
	r3.w = ((texture(resourceSamplerPair_6_ps, r4.zw))).w;
	r2.w = fma(r3.z, r6.z, r2.w);
	r2.w = fma(r3.w, r6.w, r2.w);
	r3.z = -v3.v.y + float(1.00000000f);
	r2.w = r2.w * r3.z;
	r2.w = r2.w * float(1.50000000f);
	r3.zw = ((texture(resourceSamplerPair_9_ps, v1.v.zw)).xzyw).zw;
	r3.zw = fma(r3.zw, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r3.zw = -r3.zw + vec2(0.00787399989f, 0.00000000f);
	r4.x = dot(r3.zw, r3.zw);
	r4.x = min(r4.x, float(1.00000000f));
	r4.x = sqrt(r4.x);
	r4.y = fma(r4.x, float(0.600000024f), float(0.400000006f));
	r4.x = r4.y * r4.x;
	r3.zw = fma(-r4.xx, r3.xy, r3.zw);
	r4.yz = ((texture(resourceSamplerPair_10_ps, v1.v.xy)).yxwz).yz;
	r4.yz = fma(r4.yz, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r4.w = dot(-r4.yz, -r4.yz);
	r4.w = min(r4.w, float(1.00000000f));
	r4.w = sqrt(r4.w);
	r5.x = fma(r4.w, float(0.600000024f), float(0.400000006f));
	r4.w = r4.w * r5.x;
	r6.xy = r3.xy * r4.ww;
	r3.xy = fma(r3.xy, vec2(0.000399999990f, 0.000399999990f), v1.v.zw);
	r7.xyz = ((texture(resourceSamplerPair_11_ps, r3.xy))).xyz;
	r3.xy = fma(-r6.xy, v3.v.zz, -r4.yz);
	r3.zw = -r3.xy + r3.zw;
	r3.xy = fma(v3.v.xx, r3.zw, r3.xy);
	r0.zw = fma(r2.ww, r0.zw, r3.xy);
	r0.zw = r0.zw * vec2(4.26337051f, 4.26337051f);
	r2.w = dot(r0.zw, r0.zw);
	r2.w = r2.w + float(1.00000000f);
	r3.y = inversesqrt(r2.w);
	r3.xz = r0.zw * r3.yy;
	r0.z = saturate(r3.z * idx_uniforms1_ps.cb1[14].z);
	r0.z = r0.z + r3.y;
	r0.x = -r0.x + r0.z;
	r0.x = saturate(r0.y * r0.x);
	r0.yz = v2.v.xz * vec2(0.00499999989f, 0.00499999989f);
	r0.y = ((texture(resourceSamplerPair_3_ps, r0.yz)).xzyw).y;
	r0.y = fma(r0.y, float(2.00000000f), float(-1.00000000f));
	r0.y = r0.y * float(10.0000000f);
	r0.z = r0.y * v3.v.z;
	r0.y = fma(r0.y, r4.x, float(1.00000000f));
	r0.z = fma(r0.z, r4.w, float(1.00000000f));
	r0.w = r1.w * r4.w;
	r0.w = r0.w * v3.v.z;
	r4.yzw = r0.zzz * r5.yzw;
	r5.xyz = fma(r7.xyz, r0.yyy, -r4.yzw);
	r4.yzw = saturate(fma(v3.v.xxx, r5.xyz, r4.yzw));
	r2.xyz = fma(r2.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r4.yzw);
	o0.xyz = fma(r0.xxx, r2.xyz, r4.yzw);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	r2 = r1.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
	r5.x = r3.y * r2.x;
	r5.y = -r3.x * r2.x;
	r5.z = uintBitsToFloat(uint(0x00000000));
	r4.yzw = r3.xyz + r5.xyz;
	r1.xyz = fma(r1.xxx, r3.xyz, r4.yzw);
	r5.yz = r3.zy * vec2(1.00000000f, -1.00000000f);
	r5.x = uintBitsToFloat(uint(0x00000000));
	r1.xyz = fma(r2.yzw, r5.xyz, r1.xyz);
	r0.y = dot(r1.xyz, r1.xyz);
	r0.y = inversesqrt(r0.y);
	r1.xyz = fma(r1.xyz, r0.yyy, -r3.xyz);
	r1.xyz = fma(r0.xxx, r1.xyz, r3.xyz);
	r0.y = dot(r1.xyz, r1.xyz);
	r0.y = inversesqrt(r0.y);
	r1.xyz = r0.yyy * r1.xyz;
	o1.xyz = fma(r1.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r0.y = fma(r1.w, r4.x, -r0.w);
	r1.y = fma(v3.v.x, r0.y, r0.w);
	r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	r0.yzw = -r1.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
	o2.xyz = fma(r0.xxx, r0.yzw, r1.xyz);
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

