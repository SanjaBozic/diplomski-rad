#version 460 core
// ps_5_0
// Checksum: 3bb030ac_99a6ec4d_0ab0f57c_ff32eb2c
// Name: fastter_noplxlod0cidx1

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8;

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
	r1.w = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r1.w + float(1.00000000f);
	r4.x = dot(r3, idx_uniforms1_ps.cb1[10]);
	r4.y = dot(r3, idx_uniforms1_ps.cb1[11]);
	r4.z = dot(r3, idx_uniforms1_ps.cb1[12]);
	r4.w = dot(r3, idx_uniforms1_ps.cb1[13]);
	r1.w = dot(r4, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r1.w = r4.x / r1.w;
	r3.xy = r1.ww * idx_uniforms1_ps.cb1[6].wz;
	r0.xy = ((texture(resourceSamplerPair_3_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r3.xy = r3.xy * vec2(1.50000000f, 8.00000000f);
	r0.xy = fma(r3.xx, r0.xy, -r0.zw);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r0.z = dot(r0.xy, r0.xy);
	r0.z = r0.z + float(1.00000000f);
	r4.x = inversesqrt(r0.z);
	r0.xz = r0.xy * r4.xx;
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r3.xz = ((texture(resourceSamplerPair_4_ps, r1.xyz)).yxwz).xz;
	r3.xz = fma(r3.zx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r3.xy = r3.xz * r3.yy;
	r5 = (texture(resourceSamplerPair_5_ps, r1.xyz));
	r1 = r1.wwww * r5;
	r0.w = dot(r3.xy, r3.xy);
	r0.w = -r0.w + float(1.00000000f);
	r0.w = sqrt(abs(r0.w));
	r4.y = -1.f * r0.x;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r0.y = r4.x;
	r3.xzw = fma(r3.xxx, r4.xyz, r0.xyz);
	r3.xzw = fma(r0.www, r0.xyz, r3.xzw);
	r5.xz = r4.zx * vec2(1.00000000f, -1.00000000f);
	r5.y = r0.z;
	r3.xyz = fma(r3.yyy, r5.xyz, r3.xzw);
	r0.w = dot(r3.xyz, r3.xyz);
	r0.w = inversesqrt(r0.w);
	r3.xzw = r0.www * r3.xyz;
	r2.w = uintBitsToFloat(uint(0x3f800000));
	r1 = r1 * r2;
	r1 = saturate(r1.xwyz * vec4(4.69999981f, 1.00000000f, 4.69999981f, 4.69999981f));
	r2.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r2.x = v2.v.x;
	r6 = r2.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_6_ps, r6.xy))).xyz;
	r2.z = saturate(r3.w * idx_uniforms1_ps.cb1[14].z);
	r0.w = fma(r3.y, r0.w, r2.z);
	r2.z = intBitsToFloat(r0.w >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_7_ps, r6.xy));
	r2.w = ((texture(resourceSamplerPair_7_ps, r6.zw))).w;
	r6.xy = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r2.xy = fma(r2.xy, vec2(0.0206250008f, 0.00562500022f), r6.xy);
	r2.x = ((texture(resourceSamplerPair_7_ps, r2.xy)).wxyz).x;
	if (floatBitsToUint(r2.z) != uint(0))
	{
		r6.xyz = fma(r7.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r6.w = r6.y * float(2.00000000f);
		r4.xyz = fma(r6.wwy, r4.xyz, r0.xyz);
		r0.xyz = fma(r6.xxx, r0.xyz, r4.xyz);
		r4.xyz = r6.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r0.xyz = fma(r4.xyz, r5.xyz, r0.xyz);
		r2.y = dot(r0.xyz, r0.xyz);
		r2.y = inversesqrt(r2.y);
		r4 = (texture(resourceSamplerPair_8_ps, v1.v.zw));
		r2.z = min(r4.w, idx_uniforms1_ps.cb1[14].x);
		r2.z = saturate(r2.z * idx_uniforms1_ps.cb1[14].y);
		r3.y = uintBitsToFloat(uint(0x3f800000));
		r4.xyz = r4.xyz * r8.xyz;
		r3.y = fma(r8.w, r3.y, float(0.750000000f));
		r4.w = r2.w * r3.y;
		r5.x = r2.z * float(0.699999988f);
		r2.w = fma(-r2.w, r3.y, float(0.100000001f));
		r2.w = fma(r5.x, r2.w, r4.w);
		r2.x = -r2.x + float(1.00000000f);
		r2.x = saturate(fma(-r2.x, idx_uniforms1_ps.cb1[15].x, r2.w));
		r2.x = r2.x * r2.z;
		r2.z = r2.x * float(3.00000000f);
		r2.x = fma(r2.x, float(-0.300000012f), float(0.800000012f));
		r2.z = min(r2.z, float(1.00000000f));
		r2.w = -r2.x + float(1.00000000f);
		r2.z = r2.z / r2.w;
		r0.w = r0.w + -r2.x;
		r0.w = saturate(r2.z * r0.w);
		r2.xzw = fma(r4.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r1.xzw);
		r2.xzw = fma(r0.www, r2.xzw, r1.xzw);
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r1.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r1.xyz = fma(r0.www, r4.xyz, r1.xyz);
		r0.xyz = fma(r0.xyz, r2.yyy, -r3.xzw);
		r0.xyz = fma(r0.www, r0.xyz, r3.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r3.xzw = r0.www * r0.xyz;
	}
	else
	{
		r2.xzw = r1.xzw;
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r3.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r2.xzw;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r1.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

