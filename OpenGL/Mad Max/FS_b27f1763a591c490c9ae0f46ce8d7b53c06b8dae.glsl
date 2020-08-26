#version 460 core
// ps_5_0
// Checksum: db3f16d6_25fba729_fddebacd_256c9d7b
// Name: particleeffectadditiveprjfar

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

layout (std140) uniform cb_ps0 { vec4 cb0[6]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res7, s7

uniform samplerCube resourceSamplerPair_2_ps; // res6, s6

uniform samplerCube resourceSamplerPair_3_ps; // res5, s5


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
	r0.xyz = v4.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
	r1 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r0.w = fma(r1.w, float(-0.200000003f), float(1.00000000f));
	r2.xyz = r0.www * r0.xyz;
	r0.xyz = fma(r0.xyz, r0.www, idx_uniforms0_ps.cb0[5].xyz);
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = sqrt(r0.w);
	r0.w = r0.w * idx_uniforms1_ps.cb1[1].w;
	r0.w = r0.w * float(8.00000000f);
	r0.w = max(r0.w, float(1.00000000f));
	r0.w = min(r0.w, float(6.00000000f));
	r0.xz = r0.xz + idx_uniforms1_ps.cb1[1].yz;
	r2.x = r0.y * idx_uniforms0_ps.cb0[1].w;
	r2.y = r0.y * idx_uniforms0_ps.cb0[3].w;
	r0.xy = r0.xz + -r2.xy;
	r0.xy = r0.xy * idx_uniforms1_ps.cb1[1].ww;
	r0.x = ((textureLod(resourceSamplerPair_1_ps, r0.xy, r0.w)).wxyz).x;
	r0.x = saturate(r0.x + idx_uniforms1_ps.cb1[1].x);
	r0.xyz = fma(v5.v.xyz, r0.xxx, v6.v.xyz);
	r0.xyz = r0.xyz * v2.v.xyz;
	r0.w = v2.v.w;
	r0 = r0 * r1;
	r1.x = dot(v3.v.xyz, v3.v.xyz);
	r1.x = inversesqrt(r1.x);
	r1.y = fma(v3.v.y, r1.x, idx_uniforms1_ps.cb1[0].w);
	r1.xzw = r1.xxx * v3.v.xyz;
	r1.y = r1.y + float(-0.500000000f);
	r1.y = saturate(-r1.y + float(0.500000000f));
	r2.x = ((texture(resourceSamplerPair_2_ps, r1.xzw)).yxzw).x;
	r1.x = ((texture(resourceSamplerPair_3_ps, r1.xzw)).yxzw).x;
	r1.z = -r1.x + r2.x;
	r1.x = fma(r1.y, r1.z, r1.x);
	r0.w = r0.w * r1.x;
	o0 = r0;
	r0.x = fma(idx_uniforms4_ps.cb4[4].x, r0.w, idx_uniforms4_ps.cb4[4].y);
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	PixelEpilog();
	return;
}

