#version 460 core
// ps_5_0
// Checksum: 79ef49d7_d8c263b7_dcc78c67_97484b6e
// Name: particleeffecterosionprjfar

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform samplerCube resourceSamplerPair_0_ps; // res6, s6

uniform samplerCube resourceSamplerPair_1_ps; // res5, s5

uniform sampler2D resourceSamplerPair_2_ps; // res0, s0

uniform sampler2D resourceSamplerPair_3_ps; // res7, s7

uniform sampler2D resourceSamplerPair_4_ps; // res2, s2


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
	r0.yzw = v4.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
	r1 = (texture(resourceSamplerPair_2_ps, v1.v.xy));
	r2.x = fma(r1.w, float(-0.200000003f), float(1.00000000f));
	r2.yzw = r0.yzw * r2.xxx;
	r0.yzw = fma(r0.yzw, r2.xxx, idx_uniforms0_ps.cb0[5].xyz);
	r2.x = dot(r2.yzw, r2.yzw);
	r2.x = sqrt(r2.x);
	r2.x = r2.x * idx_uniforms1_ps.cb1[1].w;
	r2.x = r2.x * float(8.00000000f);
	r2.x = max(r2.x, float(1.00000000f));
	r2.x = min(r2.x, float(6.00000000f));
	r0.yw = r0.yw + idx_uniforms1_ps.cb1[1].yz;
	r3.x = r0.z * idx_uniforms0_ps.cb0[1].w;
	r3.y = r0.z * idx_uniforms0_ps.cb0[3].w;
	r0.yz = r0.yw + -r3.xy;
	r0.yz = r0.yz * idx_uniforms1_ps.cb1[1].ww;
	r0.y = ((textureLod(resourceSamplerPair_3_ps, r0.yz, r2.x)).xwyz).y;
	r0.y = saturate(r0.y + idx_uniforms1_ps.cb1[1].x);
	r0.yzw = fma(v5.v.xyz, r0.yyy, v6.v.xyz);
	r2.xyz = r0.yzw * v2.v.xyz;
	r3.x = r1.w;
	r3.y = v1.v.w;
	r1.w = ((texture(resourceSamplerPair_4_ps, r3.xy)).xzwy).w;
	r2.w = v2.v.w;
	r3 = r1 * r2;
	r0.yzw = fma(-r1.xyz, r2.xyz, idx_uniforms0_ps.cb0[13].xyz);
	r0.x = r0.x * r3.w;
	r1.x = fma(idx_uniforms4_ps.cb4[4].x, r0.x, idx_uniforms4_ps.cb4[4].y);
	o0.w = r0.x;
	r0.x = intBitsToFloat(r1.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.x = v1.v.z * idx_uniforms1_ps.cb1[0].y;
	o0.xyz = fma(r0.yzw, r0.xxx, r3.xyz);
	PixelEpilog();
	return;
}

