#version 460 core
// ps_5_0
// Checksum: c98bcbbf_5924568e_66b53ce7_ef693866
// Name: particleeffectblend

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res7, s7


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
	r0 = (texture(resourceSamplerPair_0_ps, v2.v.xy));
	r1 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r0 = r0 + -r1;
	r0 = fma(v2.v.zzzz, r0, r1);
	r1.x = fma(r0.w, float(-0.200000003f), float(1.00000000f));
	r1.yzw = v4.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
	r2.xyz = r1.xxx * r1.yzw;
	r1.xyz = fma(r1.yzw, r1.xxx, idx_uniforms0_ps.cb0[5].xyz);
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = sqrt(r1.w);
	r1.w = r1.w * idx_uniforms1_ps.cb1[1].w;
	r1.w = r1.w * float(8.00000000f);
	r1.w = max(r1.w, float(1.00000000f));
	r1.w = min(r1.w, float(6.00000000f));
	r1.xz = r1.xz + idx_uniforms1_ps.cb1[1].yz;
	r2.x = r1.y * idx_uniforms0_ps.cb0[1].w;
	r2.y = r1.y * idx_uniforms0_ps.cb0[3].w;
	r1.xy = r1.xz + -r2.xy;
	r1.xy = r1.xy * idx_uniforms1_ps.cb1[1].ww;
	r1.x = ((textureLod(resourceSamplerPair_1_ps, r1.xy, r1.w)).wxyz).x;
	r1.x = saturate(r1.x + idx_uniforms1_ps.cb1[1].x);
	r1.xyz = fma(v5.v.xyz, r1.xxx, v6.v.xyz);
	r1.xyz = r1.xyz * v3.v.xyz;
	r1.w = v3.v.w;
	r2 = r0 * r1;
	r0.xyz = fma(-r0.xyz, r1.xyz, idx_uniforms0_ps.cb0[13].xyz);
	r0.w = fma(idx_uniforms4_ps.cb4[4].x, r2.w, idx_uniforms4_ps.cb4[4].y);
	r0.w = intBitsToFloat(r0.w < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.w) != uint(0);
	r0.w = v1.v.z * idx_uniforms1_ps.cb1[0].y;
	o0.xyz = fma(r0.xyz, r0.www, r2.xyz);
	o0.w = r2.w;
	PixelEpilog();
	return;
}

