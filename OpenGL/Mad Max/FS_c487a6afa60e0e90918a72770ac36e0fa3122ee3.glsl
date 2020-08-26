#version 460 core
// ps_5_0
// Checksum: ecfffa28_309e06c3_89e36909_532fc7e9
// Name: fastter_noplxlod01cidx1cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8;

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
	r0.z = saturate(v3.v.x);
	r2.xy = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).xwyz).xy;
	r2.xy = fma(r2.xy, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r3.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r0.w = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r0.w + float(1.00000000f);
	r4.x = dot(r3, idx_uniforms1_ps.cb1[10]);
	r4.y = dot(r3, idx_uniforms1_ps.cb1[11]);
	r4.z = dot(r3, idx_uniforms1_ps.cb1[12]);
	r4.w = dot(r3, idx_uniforms1_ps.cb1[13]);
	r0.w = dot(r4, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = r4.x / r0.w;
	r2.zw = r0.ww * idx_uniforms1_ps.cb1[6].wz;
	r0.xy = ((texture(resourceSamplerPair_2_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r2.zw = r2.zw * vec2(1.50000000f, 8.00000000f);
	r0.xy = fma(r2.zz, r0.xy, -r2.xy);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r2.z = idx_uniforms1_ps.cb1[6].y;
	r3.xy = ((texture(resourceSamplerPair_3_ps, r2.xyz)).ywxz).xy;
	r3.xy = fma(r3.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r3.xy = r2.ww * r3.xy;
	r1.w = ((texture(resourceSamplerPair_4_ps, r2.xyz))).w;
	r1.w = r0.w * r1.w;
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r2.x = dot(r0.xy, r0.xy);
	r2.x = r2.x + float(1.00000000f);
	r2.x = inversesqrt(r2.x);
	r4.xz = r0.xy * r2.xx;
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r0.xy = ((texture(resourceSamplerPair_3_ps, r1.xyz)).ywxz).xy;
	r0.xy = fma(r0.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * r2.ww;
	r1.x = ((texture(resourceSamplerPair_4_ps, r1.xyz)).wxyz).x;
	r0.xy = fma(r0.xy, r0.zz, -r3.xy);
	r0.xy = fma(r0.zz, r0.xy, r3.xy);
	r1.y = dot(r0.xy, r0.xy);
	r1.y = -r1.y + float(1.00000000f);
	r1.y = sqrt(abs(r1.y));
	r2.y = -1.f * r4.x;
	r2.z = uintBitsToFloat(uint(0x00000000));
	r4.y = r2.x;
	r3.xyz = fma(r0.xxx, r2.xyz, r4.xyz);
	r3.xyz = fma(r1.yyy, r4.xyz, r3.xyz);
	r5.xz = r2.zx * vec2(1.00000000f, -1.00000000f);
	r5.y = r4.z;
	r3.xyz = fma(r0.yyy, r5.xyz, r3.xyz);
	r0.x = dot(r3.xyz, r3.xyz);
	r0.x = inversesqrt(r0.x);
	r3.xzw = r0.xxx * r3.xyz;
	r0.y = fma(r0.w, r1.x, -r1.w);
	r1.y = saturate(fma(r0.z, r0.y, r1.w));
	r6.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r6.x = v2.v.x;
	r7 = r6.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r0.yzw = ((texture(resourceSamplerPair_5_ps, r7.xy)).wxyz).yzw;
	r1.w = saturate(r3.w * idx_uniforms1_ps.cb1[14].z);
	r0.x = fma(r3.y, r0.x, r1.w);
	r1.w = intBitsToFloat(r0.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_6_ps, r7.xy));
	r2.w = ((texture(resourceSamplerPair_6_ps, r7.zw))).w;
	r6.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r6.xy = fma(r6.xy, vec2(0.0206250008f, 0.00562500022f), r6.zw);
	r3.y = ((texture(resourceSamplerPair_6_ps, r6.xy)).xwyz).y;
	if (floatBitsToUint(r1.w) != uint(0))
	{
		r6.xyz = fma(r0.wyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r6.w = r6.y * float(2.00000000f);
		r0.yzw = fma(r6.wwy, r2.xyz, r4.xyz);
		r0.yzw = fma(r6.xxx, r4.xyz, r0.yzw);
		r2.xyz = r6.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r0.yzw = fma(r2.xyz, r5.xyz, r0.yzw);
		r1.w = dot(r0.yzw, r0.yzw);
		r1.w = inversesqrt(r1.w);
		r4 = (texture(resourceSamplerPair_7_ps, v1.v.zw));
		r2.x = min(r4.w, idx_uniforms1_ps.cb1[14].x);
		r2.x = saturate(r2.x * idx_uniforms1_ps.cb1[14].y);
		r2.y = uintBitsToFloat(uint(0x3f800000));
		r4.xyz = r4.xyz * r8.xyz;
		r2.y = fma(r8.w, r2.y, float(0.750000000f));
		r2.z = r2.y * r2.w;
		r4.w = r2.x * float(0.699999988f);
		r2.y = fma(-r2.w, r2.y, float(0.100000001f));
		r2.y = fma(r4.w, r2.y, r2.z);
		r2.z = -r3.y + float(1.00000000f);
		r2.y = saturate(fma(-r2.z, idx_uniforms1_ps.cb1[15].x, r2.y));
		r2.x = r2.y * r2.x;
		r2.y = r2.x * float(3.00000000f);
		r2.x = fma(r2.x, float(-0.300000012f), float(0.800000012f));
		r2.y = min(r2.y, float(1.00000000f));
		r2.z = -r2.x + float(1.00000000f);
		r2.y = r2.y / r2.z;
		r0.x = r0.x + -r2.x;
		r0.x = saturate(r2.y * r0.x);
		r2.xyz = fma(r4.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r2.xyz = fma(r0.xxx, r2.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r1.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r1.xyz = fma(r0.xxx, r4.xyz, r1.xyz);
		r0.yzw = fma(r0.yzw, r1.www, -r3.xzw);
		r0.xyz = fma(r0.xxx, r0.yzw, r3.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r3.xzw = r0.www * r0.xyz;
	}
	else
	{
		r2.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r3.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r2.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r1.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

