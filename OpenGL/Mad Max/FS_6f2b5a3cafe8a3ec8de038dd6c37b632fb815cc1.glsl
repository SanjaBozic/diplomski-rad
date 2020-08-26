#version 460 core
// ps_5_0
// Checksum: 470d08ad_824c11c3_1300c3a3_f15a9d07
// Name: particleeffectns

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
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[11]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res7, s7

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform samplerCube resourceSamplerPair_3_ps; // res8, s8

uniform samplerCube resourceSamplerPair_4_ps; // res4, s4


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
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r1 = r0 * v2.v;
	r2.x = fma(idx_uniforms4_ps.cb4[4].x, r1.w, idx_uniforms4_ps.cb4[4].y);
	r2.x = intBitsToFloat(r2.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r2.x) != uint(0);
	r0.w = fma(r0.w, float(-0.200000003f), float(1.00000000f));
	r0.xyz = fma(-r0.xyz, v2.v.xyz, idx_uniforms0_ps.cb0[13].xyz);
	r2.xyz = v3.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
	r3.xyz = r0.www * r2.xyz;
	r4.xyz = fma(r2.xyz, r0.www, idx_uniforms0_ps.cb0[5].xyz);
	r0.w = dot(r3.xyz, r3.xyz);
	r0.w = sqrt(r0.w);
	r0.w = r0.w * idx_uniforms1_ps.cb1[1].w;
	r0.w = r0.w * float(8.00000000f);
	r0.w = max(r0.w, float(1.00000000f));
	r0.w = min(r0.w, float(6.00000000f));
	r3.xy = r4.xz + idx_uniforms1_ps.cb1[1].yz;
	r5.x = r4.y * idx_uniforms0_ps.cb0[1].w;
	r5.y = r4.y * idx_uniforms0_ps.cb0[3].w;
	r3.xy = r3.xy + -r5.xy;
	r3.xy = r3.xy * idx_uniforms1_ps.cb1[1].ww;
	r0.w = ((textureLod(resourceSamplerPair_1_ps, r3.xy, r0.w))).w;
	r0.w = saturate(r0.w + idx_uniforms1_ps.cb1[1].x);
	r2.w = saturate(v9.v.x);
	r0.w = r0.w * r2.w;
	r0.w = fma(r0.w, float(0.949999988f), float(0.0500000007f));
	r2.w = dot(r2.xyz, r2.xyz);
	r2.w = inversesqrt(r2.w);
	r2.xyz = r2.www * r2.xyz;
	r3 = v6.v.zxyx * v8.v.yzxz;
	r3 = fma(v6.v.yzxz, v8.v.zxyx, -r3);
	r3 = r3 * v8.v.wwww;
	r4 = r3.zxwx * v6.v.yzxz;
	r4 = fma(r3.wzxz, v6.v.zxyx, -r4);
	r4 = r4 * v8.v.wwww;
	r5 = (texture(resourceSamplerPair_2_ps, v1.v.xy));
	r5.xyz = fma(r5.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r3 = r3 * r5.yyyy;
	r3 = fma(r5.xxxx, r4, r3);
	r3 = fma(r5.zzzz, v6.v.xyzy, r3);
	r2.w = dot(r3.xzw, r3.xzw);
	r2.w = inversesqrt(r2.w);
	r3 = r2.wwww * r3;
	r2.w = dot(r2.xzy, r3.xzw);
	r2.w = r2.w + r2.w;
	r4.xyz = fma(r3.xwz, -r2.www, r2.xyz);
	r2.xyz = fma(r3.xyz, vec3(-0.400000006f, -0.400000006f, -0.400000006f), r2.xyz);
	r2.w = saturate(dot(r4.xyz, v7.v.xyz));
	r2.w = log2(r2.w);
	r5.xy = r5.ww * idx_uniforms1_ps.cb1[2].yx;
	r2.w = r2.w * r5.y;
	r3.y = r1.w * r5.x;
	r2.w = exp2(r2.w);
	r2.w = r3.y * r2.w;
	r3.x = dot(r3.xwz, v7.v.xyz);
	r3.y = fma(r3.w, float(0.500000000f), float(0.500000000f));
	r3.z = saturate(r3.x);
	r3.x = saturate(r3.x + v7.v.w);
	r5.xyz = r3.xxx * v4.v.xyz;
	r2.w = r2.w * r3.z;
	r2.w = r0.w * r2.w;
	r3.xzw = ((textureLod(resourceSamplerPair_3_ps, r4.xyz, idx_uniforms1_ps.cb1[10].x)).xwyz).xzw;
	r4.xyz = ((textureLod(resourceSamplerPair_4_ps, r4.xyz, idx_uniforms1_ps.cb1[10].x))).xyz;
	r3.xzw = r3.xzw + -r4.xyz;
	r3.xzw = fma(idx_uniforms1_ps.cb1[10].yyy, r3.xzw, r4.xyz);
	r3.xzw = r3.xzw * idx_uniforms1_ps.cb1[2].yyy;
	r3.xzw = r5.www * r3.xzw;
	r3.xzw = r3.xzw * idx_uniforms1_ps.cb1[3].www;
	r3.xzw = fma(r2.www, v4.v.xyz, r3.xzw);
	r4.xyz = -idx_uniforms1_ps.cb1[3].xyz + idx_uniforms1_ps.cb1[4].xyz;
	r4.xyz = fma(r3.yyy, r4.xyz, idx_uniforms1_ps.cb1[3].xyz);
	r4.xyz = fma(r4.xyz, idx_uniforms1_ps.cb1[4].www, v5.v.xyz);
	r4.xyz = fma(r5.xyz, r0.www, r4.xyz);
	r2.w = v1.v.z * idx_uniforms1_ps.cb1[0].y;
	r0.xyz = fma(r0.xyz, r2.www, r1.xyz);
	o0.w = r1.w;
	r1.xyz = fma(r0.xyz, r4.xyz, r3.xzw);
	r0.xyz = r0.xyz + vec3(0.00999999978f, 0.00999999978f, 0.00999999978f);
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = r1.www * r2.xyz;
	r1.w = saturate(dot(r2.xyz, v7.v.xyz));
	r1.w = log2(r1.w);
	r1.w = r1.w * float(16.0000000f);
	r1.w = exp2(r1.w);
	r0.w = r0.w * r1.w;
	r0.xyz = r0.xyz * r0.www;
	o0.xyz = fma(r0.xyz, v4.v.xyz, r1.xyz);
	PixelEpilog();
	return;
}

