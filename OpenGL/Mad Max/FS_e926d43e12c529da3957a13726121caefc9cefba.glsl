#version 460 core
// ps_5_0
// Checksum: da03ae46_6b956da4_5920affa_38f5dba3
// Name: particleeffectnsprjfar

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 8) in idx_Varying8 { vec4 v; } v8;
layout(location = 9) in idx_Varying9 { vec4 v; } v9;
layout(location = 10) in idx_Varying10 { vec4 v; } v10;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[11]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform samplerCube resourceSamplerPair_0_ps; // res6, s6

uniform samplerCube resourceSamplerPair_1_ps; // res5, s5

uniform sampler2D resourceSamplerPair_2_ps; // res0, s0

uniform sampler2D resourceSamplerPair_3_ps; // res7, s7

uniform sampler2D resourceSamplerPair_4_ps; // res3, s3

uniform samplerCube resourceSamplerPair_5_ps; // res8, s8

uniform samplerCube resourceSamplerPair_6_ps; // res4, s4


void Initialise()
{
}



void PixelEpilog()
{
	if (discarded)
		discard;
}

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.x = dot(v3.v.xyz, v3.v.xyz);
	r0.x = inversesqrt(r0.x);
	r0.y = fma(v3.v.y, r0.x, idx_uniforms1_ps.cb1[0].w);
	r0.xzw = r0.xxx * v3.v.xyz;
	r0.y = r0.y + float(-0.500000000f);
	r0.y = saturate(-r0.y + float(0.500000000f));
	r1.x = ((texture(resourceSamplerPair_0_ps, r0.xzw)).yxzw).x;
	r0.x = ((texture(resourceSamplerPair_1_ps, r0.xzw)).yxzw).x;
	r0.z = -r0.x + r1.x;
	r0.x = fma(r0.y, r0.z, r0.x);
	r1 = (texture(resourceSamplerPair_2_ps, v1.v.xy));
	r2 = r1 * v2.v;
	r0.x = r0.x * r2.w;
	r0.y = fma(idx_uniforms4_ps.cb4[4].x, r0.x, idx_uniforms4_ps.cb4[4].y);
	o0.w = r0.x;
	r0.x = intBitsToFloat(r0.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.x = fma(r1.w, float(-0.200000003f), float(1.00000000f));
	r0.yzw = fma(-r1.xyz, v2.v.xyz, idx_uniforms0_ps.cb0[13].xyz);
	r1.xyz = v4.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
	r3.xyz = r0.xxx * r1.xyz;
	r4.xyz = fma(r1.xyz, r0.xxx, idx_uniforms0_ps.cb0[5].xyz);
	r0.x = dot(r3.xyz, r3.xyz);
	r0.x = sqrt(r0.x);
	r0.x = r0.x * idx_uniforms1_ps.cb1[1].w;
	r0.x = r0.x * float(8.00000000f);
	r0.x = max(r0.x, float(1.00000000f));
	r0.x = min(r0.x, float(6.00000000f));
	r3.xy = r4.xz + idx_uniforms1_ps.cb1[1].yz;
	r5.x = r4.y * idx_uniforms0_ps.cb0[1].w;
	r5.y = r4.y * idx_uniforms0_ps.cb0[3].w;
	r3.xy = r3.xy + -r5.xy;
	r3.xy = r3.xy * idx_uniforms1_ps.cb1[1].ww;
	r0.x = ((textureLod(resourceSamplerPair_3_ps, r3.xy, r0.x)).wxyz).x;
	r0.x = saturate(r0.x + idx_uniforms1_ps.cb1[1].x);
	r1.w = saturate(v10.v.x);
	r0.x = r0.x * r1.w;
	r0.x = fma(r0.x, float(0.949999988f), float(0.0500000007f));
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r3 = v7.v.zxyx * v9.v.yzxz;
	r3 = fma(v7.v.yzxz, v9.v.zxyx, -r3);
	r3 = r3 * v9.v.wwww;
	r4 = r3.zxwx * v7.v.yzxz;
	r4 = fma(r3.wzxz, v7.v.zxyx, -r4);
	r4 = r4 * v9.v.wwww;
	r5 = (texture(resourceSamplerPair_4_ps, v1.v.xy));
	r5.xyz = fma(r5.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r3 = r3 * r5.yyyy;
	r3 = fma(r5.xxxx, r4, r3);
	r3 = fma(r5.zzzz, v7.v.xyzy, r3);
	r1.w = dot(r3.xzw, r3.xzw);
	r1.w = inversesqrt(r1.w);
	r3 = r1.wwww * r3;
	r1.w = dot(r1.xzy, r3.xzw);
	r1.w = r1.w + r1.w;
	r4.xyz = fma(r3.xwz, -r1.www, r1.xyz);
	r1.xyz = fma(r3.xyz, vec3(-0.400000006f, -0.400000006f, -0.400000006f), r1.xyz);
	r1.w = saturate(dot(r4.xyz, v8.v.xyz));
	r1.w = log2(r1.w);
	r5.xy = r5.ww * idx_uniforms1_ps.cb1[2].yx;
	r1.w = r1.w * r5.y;
	r2.w = r2.w * r5.x;
	r1.w = exp2(r1.w);
	r1.w = r2.w * r1.w;
	r2.w = dot(r3.xwz, v8.v.xyz);
	r3.x = fma(r3.w, float(0.500000000f), float(0.500000000f));
	r3.y = saturate(r2.w);
	r2.w = saturate(r2.w + v8.v.w);
	r5.xyz = r2.www * v5.v.xyz;
	r1.w = r1.w * r3.y;
	r1.w = r0.x * r1.w;
	r3.yzw = ((textureLod(resourceSamplerPair_5_ps, r4.xyz, idx_uniforms1_ps.cb1[10].x)).wxyz).yzw;
	r4.xyz = ((textureLod(resourceSamplerPair_6_ps, r4.xyz, idx_uniforms1_ps.cb1[10].x))).xyz;
	r3.yzw = r3.yzw + -r4.xyz;
	r3.yzw = fma(idx_uniforms1_ps.cb1[10].yyy, r3.yzw, r4.xyz);
	r3.yzw = r3.yzw * idx_uniforms1_ps.cb1[2].yyy;
	r3.yzw = r5.www * r3.yzw;
	r3.yzw = r3.yzw * idx_uniforms1_ps.cb1[3].www;
	r3.yzw = fma(r1.www, v5.v.xyz, r3.yzw);
	r4.xyz = -idx_uniforms1_ps.cb1[3].xyz + idx_uniforms1_ps.cb1[4].xyz;
	r4.xyz = fma(r3.xxx, r4.xyz, idx_uniforms1_ps.cb1[3].xyz);
	r4.xyz = fma(r4.xyz, idx_uniforms1_ps.cb1[4].www, v6.v.xyz);
	r4.xyz = fma(r5.xyz, r0.xxx, r4.xyz);
	r1.w = v1.v.z * idx_uniforms1_ps.cb1[0].y;
	r0.yzw = fma(r0.yzw, r1.www, r2.xyz);
	r2.xyz = fma(r0.yzw, r4.xyz, r3.yzw);
	r0.yzw = r0.yzw + vec3(0.00999999978f, 0.00999999978f, 0.00999999978f);
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r1.x = saturate(dot(r1.xyz, v8.v.xyz));
	r1.x = log2(r1.x);
	r1.x = r1.x * float(16.0000000f);
	r1.x = exp2(r1.x);
	r0.x = r0.x * r1.x;
	r0.xyz = r0.yzw * r0.xxx;
	o0.xyz = fma(r0.xyz, v5.v.xyz, r2.xyz);
	PixelEpilog();
	return;
}

