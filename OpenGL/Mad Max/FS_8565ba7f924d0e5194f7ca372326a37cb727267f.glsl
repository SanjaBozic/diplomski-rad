#version 460 core
// ps_5_0
// Checksum: e89cdfe7_740a0331_4f02e975_040472bc
// Name: particleeffectadditiveerosionnscullingvolume

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
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[6]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[11]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res2, s2

uniform sampler2D resourceSamplerPair_2_ps; // res7, s7

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3

uniform samplerCube resourceSamplerPair_4_ps; // res8, s8

uniform samplerCube resourceSamplerPair_5_ps; // res4, s4


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
	r0 = v3.v.yyyy * idx_uniforms1_ps.cb1[6];
	r0 = fma(v3.v.xxxx, idx_uniforms1_ps.cb1[5], r0);
	r0 = fma(v3.v.zzzz, idx_uniforms1_ps.cb1[7], r0);
	r0 = r0 + idx_uniforms1_ps.cb1[8];
	r0.xyz = r0.xyz / r0.www;
	r0.xyz = abs(r0.xyz) + -idx_uniforms1_ps.cb1[9].xxx;
	r0.x = max(r0.y, r0.x);
	r0.x = max(r0.z, r0.x);
	r0.x = saturate(r0.x * idx_uniforms1_ps.cb1[9].y);
	r1 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r0.x = r0.x * r1.w;
	r0.y = v1.v.w;
	r1.w = ((texture(resourceSamplerPair_1_ps, r0.xy)).xzwy).w;
	r0.x = fma(r0.x, float(-0.200000003f), float(1.00000000f));
	r2 = r1 * v2.v;
	r0.yzw = fma(r1.xyz, v2.v.xyz, vec3(0.00999999978f, 0.00999999978f, 0.00999999978f));
	r1.x = fma(idx_uniforms4_ps.cb4[4].x, r2.w, idx_uniforms4_ps.cb4[4].y);
	r1.x = intBitsToFloat(r1.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r1.x) != uint(0);
	r1.xyz = v3.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
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
	r0.x = ((textureLod(resourceSamplerPair_2_ps, r3.xy, r0.x)).wxyz).x;
	r0.x = saturate(r0.x + idx_uniforms1_ps.cb1[1].x);
	r1.w = saturate(v9.v.x);
	r0.x = r0.x * r1.w;
	r0.x = fma(r0.x, float(0.949999988f), float(0.0500000007f));
	r3 = (texture(resourceSamplerPair_3_ps, v1.v.xy));
	r4.xy = r3.ww * idx_uniforms1_ps.cb1[2].yx;
	r1.w = r2.w * r4.x;
	r4.x = dot(r1.xyz, r1.xyz);
	r4.x = inversesqrt(r4.x);
	r1.xyz = r1.xyz * r4.xxx;
	r5 = v6.v.zxyx * v8.v.yzxz;
	r5 = fma(v6.v.yzxz, v8.v.zxyx, -r5);
	r5 = r5 * v8.v.wwww;
	r6 = r5.zxwx * v6.v.yzxz;
	r6 = fma(r5.wzxz, v6.v.zxyx, -r6);
	r6 = r6 * v8.v.wwww;
	r3.xyz = fma(r3.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r5 = r5 * r3.yyyy;
	r5 = fma(r3.xxxx, r6, r5);
	r5 = fma(r3.zzzz, v6.v.xyzy, r5);
	r3.x = dot(r5.xzw, r5.xzw);
	r3.x = inversesqrt(r3.x);
	r5 = r3.xxxx * r5;
	r3.x = dot(r1.xzy, r5.xzw);
	r3.x = r3.x + r3.x;
	r3.xyz = fma(r5.xwz, -r3.xxx, r1.xyz);
	r1.xyz = fma(r5.xyz, vec3(-0.400000006f, -0.400000006f, -0.400000006f), r1.xyz);
	r4.x = saturate(dot(r3.xyz, v7.v.xyz));
	r4.x = log2(r4.x);
	r4.x = r4.x * r4.y;
	r4.x = exp2(r4.x);
	r1.w = r1.w * r4.x;
	r4.x = dot(r5.xwz, v7.v.xyz);
	r4.y = fma(r5.w, float(0.500000000f), float(0.500000000f));
	r4.z = saturate(r4.x);
	r4.x = saturate(r4.x + v7.v.w);
	r5.xyz = r4.xxx * v4.v.xyz;
	r1.w = r1.w * r4.z;
	r1.w = r0.x * r1.w;
	r4.xzw = ((textureLod(resourceSamplerPair_4_ps, r3.xyz, idx_uniforms1_ps.cb1[10].x)).xwyz).xzw;
	r3.xyz = ((textureLod(resourceSamplerPair_5_ps, r3.xyz, idx_uniforms1_ps.cb1[10].x))).xyz;
	r4.xzw = -r3.xyz + r4.xzw;
	r3.xyz = fma(idx_uniforms1_ps.cb1[10].yyy, r4.xzw, r3.xyz);
	r3.xyz = r3.xyz * idx_uniforms1_ps.cb1[2].yyy;
	r3.xyz = r3.www * r3.xyz;
	r3.xyz = r3.xyz * idx_uniforms1_ps.cb1[3].www;
	r3.xyz = fma(r1.www, v4.v.xyz, r3.xyz);
	r4.xzw = -idx_uniforms1_ps.cb1[3].xyz + idx_uniforms1_ps.cb1[4].xyz;
	r4.xyz = fma(r4.yyy, r4.xzw, idx_uniforms1_ps.cb1[3].xyz);
	r4.xyz = fma(r4.xyz, idx_uniforms1_ps.cb1[4].www, v5.v.xyz);
	r4.xyz = fma(r5.xyz, r0.xxx, r4.xyz);
	r2.xyz = fma(r2.xyz, r4.xyz, r3.xyz);
	o0.w = r2.w;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r1.x = saturate(dot(r1.xyz, v7.v.xyz));
	r1.x = log2(r1.x);
	r1.x = r1.x * float(16.0000000f);
	r1.x = exp2(r1.x);
	r0.x = r0.x * r1.x;
	r0.xyz = r0.yzw * r0.xxx;
	o0.xyz = fma(r0.xyz, v4.v.xyz, r2.xyz);
	PixelEpilog();
	return;
}

