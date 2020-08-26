#version 460 core
// ps_5_0
// Checksum: 666da31a_9b7c544b_48d8b019_ad90f084
// Name: fastter_noplxlod12cidx2cgc

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
	r0.z = saturate(v3.v.y);
	r1.xy = v2.v.xz * vec2(0.00150000001f, 0.00150000001f);
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy)).xywz).xyz;
	r1.xy = fma(r1.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.w = r1.z * float(0.200000003f);
	r1.zw = ((texture(resourceSamplerPair_1_ps, v1.v.xy)).yzxw).zw;
	r1.zw = fma(r1.zw, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r2.xy = r1.xy * v3.v.zz;
	r2.xy = fma(r2.xy, vec2(0.0199999996f, 0.0199999996f), v1.v.xy);
	r2.z = dot(-r1.zw, -r1.zw);
	r2.z = min(r2.z, float(1.00000000f));
	r2.z = sqrt(r2.z);
	r2.w = fma(r2.z, float(0.600000024f), float(0.400000006f));
	r2.z = r2.w * r2.z;
	r0.w = r0.w * r2.z;
	r1.xy = r1.xy * r2.zz;
	r1.xy = fma(-r1.xy, v3.v.zz, -r1.zw);
	r2.xyz = ((texture(resourceSamplerPair_2_ps, r2.xy))).xyz;
	r1.z = saturate(dot(r2.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r2.w = -r1.z + float(1.00000000f);
	r3.x = dot(r2, idx_uniforms1_ps.cb1[10]);
	r3.y = dot(r2, idx_uniforms1_ps.cb1[11]);
	r3.z = dot(r2, idx_uniforms1_ps.cb1[12]);
	r3.w = dot(r2, idx_uniforms1_ps.cb1[13]);
	r1.z = dot(r3, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r1.zw = r3.xy / r1.zz;
	r2.z = r1.z * idx_uniforms1_ps.cb1[6].z;
	r2.xw = r1.ww * idx_uniforms1_ps.cb1[7].wz;
	r2.x = fma(idx_uniforms1_ps.cb1[6].w, r1.z, r2.x);
	r0.xy = ((texture(resourceSamplerPair_3_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r2.x = r2.x * float(1.50000000f);
	r0.xy = fma(r2.xx, r0.xy, r1.xy);
	r1.xy = r2.zw * vec2(8.00000000f, 8.00000000f);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r2.z = idx_uniforms1_ps.cb1[6].y;
	r3.xy = ((texture(resourceSamplerPair_4_ps, r2.xyz)).ywxz).xy;
	r3.xy = fma(r3.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r2.x = ((texture(resourceSamplerPair_5_ps, r2.xyz)).wxyz).x;
	r4.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r4.z = idx_uniforms1_ps.cb1[7].y;
	r2.yz = ((texture(resourceSamplerPair_4_ps, r4.xyz)).xywz).yz;
	r2.yz = fma(r2.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r2.yz = r1.yy * r2.yz;
	r1.xy = fma(r1.xx, r3.xy, r2.yz);
	r2.y = ((texture(resourceSamplerPair_5_ps, r4.xyz)).xwyz).y;
	r1.w = r1.w * r2.y;
	r1.z = fma(r1.z, r2.x, r1.w);
	r1.xy = r0.zz * r1.xy;
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r1.w = dot(r0.xy, r0.xy);
	r1.w = r1.w + float(1.00000000f);
	r2.x = inversesqrt(r1.w);
	r3.xz = r0.xy * r2.xx;
	r0.x = dot(r1.xy, r1.xy);
	r0.x = -r0.x + float(1.00000000f);
	r0.x = sqrt(abs(r0.x));
	r2.y = -1.f * r3.x;
	r2.z = uintBitsToFloat(uint(0x00000000));
	r3.y = r2.x;
	r4.xyz = fma(r1.xxx, r2.xyz, r3.xyz);
	r4.xyz = fma(r0.xxx, r3.xyz, r4.xyz);
	r5.xz = r2.zx * vec2(1.00000000f, -1.00000000f);
	r5.y = r3.z;
	r1.xyw = fma(r1.yyy, r5.xyz, r4.xyz);
	r0.x = dot(r1.xyw, r1.xyw);
	r0.x = inversesqrt(r0.x);
	r4.xyz = r0.xxx * r1.xyw;
	r0.y = saturate(r0.z * r1.z);
	r6.y = fma(r0.w, v3.v.z, r0.y);
	r7.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r7.x = v2.v.x;
	r8 = r7.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r0.yzw = ((texture(resourceSamplerPair_6_ps, r8.xy)).wxyz).yzw;
	r1.x = saturate(r4.z * idx_uniforms1_ps.cb1[14].z);
	r0.x = fma(r1.y, r0.x, r1.x);
	r1.x = intBitsToFloat(r0.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r9 = (texture(resourceSamplerPair_7_ps, r8.xy));
	r1.y = ((texture(resourceSamplerPair_7_ps, r8.zw)).xwyz).y;
	r1.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r1.zw = fma(r7.xy, vec2(0.0206250008f, 0.00562500022f), r1.zw);
	r1.z = ((texture(resourceSamplerPair_7_ps, r1.zw)).xywz).z;
	if (floatBitsToUint(r1.x) != uint(0))
	{
		r7.xyz = fma(r0.wyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7.w = r7.y * float(2.00000000f);
		r0.yzw = fma(r7.wwy, r2.xyz, r3.xyz);
		r0.yzw = fma(r7.xxx, r3.xyz, r0.yzw);
		r2.xyz = r7.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r0.yzw = fma(r2.xyz, r5.xyz, r0.yzw);
		r1.x = dot(r0.yzw, r0.yzw);
		r1.x = inversesqrt(r1.x);
		r2 = (texture(resourceSamplerPair_8_ps, v1.v.zw));
		r1.w = min(r2.w, idx_uniforms1_ps.cb1[14].x);
		r1.w = saturate(r1.w * idx_uniforms1_ps.cb1[14].y);
		r2.w = uintBitsToFloat(uint(0x3f800000));
		r2.xyz = r2.xyz * r9.xyz;
		r2.w = fma(r9.w, r2.w, float(0.750000000f));
		r3.x = r1.y * r2.w;
		r3.y = r1.w * float(0.699999988f);
		r1.y = fma(-r1.y, r2.w, float(0.100000001f));
		r1.y = fma(r3.y, r1.y, r3.x);
		r1.z = -r1.z + float(1.00000000f);
		r1.y = saturate(fma(-r1.z, idx_uniforms1_ps.cb1[15].x, r1.y));
		r1.y = r1.y * r1.w;
		r1.z = r1.y * float(3.00000000f);
		r1.y = fma(r1.y, float(-0.300000012f), float(0.800000012f));
		r1.z = min(r1.z, float(1.00000000f));
		r1.w = -r1.y + float(1.00000000f);
		r1.z = r1.z / r1.w;
		r0.x = r0.x + -r1.y;
		r0.x = saturate(r1.z * r0.x);
		r1.yzw = fma(r2.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r1.yzw = fma(r0.xxx, r1.yzw, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r6.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r2.xyz = -r6.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r6.xyz = fma(r0.xxx, r2.xyz, r6.xyz);
		r0.yzw = fma(r0.yzw, r1.xxx, -r4.xyz);
		r0.xyz = fma(r0.xxx, r0.yzw, r4.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r4.xyz = r0.www * r0.xyz;
	}
	else
	{
		r1.yzw = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r6.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r4.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r1.yzw;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r6.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

