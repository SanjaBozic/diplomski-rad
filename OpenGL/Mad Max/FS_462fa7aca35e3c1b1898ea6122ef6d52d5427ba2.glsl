#version 460 core
// ps_5_0
// Checksum: e9e2af02_74f74120_08c60579_40d66d67
// Name: 3dtextsdfoutline_alphamask

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[8]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[1]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res6, s6


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
	r0.x = idx_uniforms1_ps.cb1[1].x + float(0.500000000f);
	r0.yz = -idx_uniforms1_ps.cb1[1].xy + vec2(0.500000000f, 0.500000000f);
	r0.x = -r0.y + r0.x;
	r0.x = float(1.00000000f) / r0.x;
	r0.w = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).yzwx).w;
	r0.y = -r0.y + r0.w;
	r0.w = r0.w + -idx_uniforms1_ps.cb1[1].y;
	r0.z = float(1.00000000f) / r0.z;
	r0.xz = saturate(r0.xz * r0.yw);
	r0.y = fma(r0.x, float(-2.00000000f), float(3.00000000f));
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r0.y = r0.x * idx_uniforms1_ps.cb1[0].w;
	r0.w = fma(r0.z, float(-2.00000000f), float(3.00000000f));
	r0.z = r0.z * r0.z;
	r0.z = dot(r0.ww, r0.zz);
	r0.z = min(r0.z, float(1.00000000f));
	r1.w = r0.z * idx_uniforms1_ps.cb1[7].w;
	r0.z = ((texture(resourceSamplerPair_1_ps, v1.v.zw)).xzyw).z;
	r2.w = fma(r0.y, r0.z, -r1.w);
	r1.xyz = idx_uniforms1_ps.cb1[7].xyz;
	r2.xyz = -r1.xyz + idx_uniforms1_ps.cb1[0].xyz;
	r0 = fma(r0.xxxx, r2, r1);
	r1.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r1.xy = fma(r1.xy, idx_uniforms2_ps.cb2[0].xy, -idx_uniforms2_ps.cb2[0].zw);
	r1.x = ((texture(resourceSamplerPair_2_ps, r1.xy)).wxyz).x;
	r0.w = r0.w * r1.x;
	o0 = r0;
	r0.x = fma(idx_uniforms4_ps.cb4[4].x, r0.w, idx_uniforms4_ps.cb4[4].y);
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	PixelEpilog();
	return;
}

