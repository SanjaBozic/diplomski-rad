#version 460 core
// ps_5_0
// Checksum: 10282866_51bb8aa8_e81dceb5_355c3399
// Name: fogvolumeapplycloudshadowsindoor

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[21]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v1.v.zw * v1.v.xy;
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy))).x;
	r1 = v1.v.yyyy * idx_uniforms1_ps.cb1[13];
	r1 = fma(v1.v.xxxx, idx_uniforms1_ps.cb1[12], r1);
	r0 = fma(r0.xxxx, idx_uniforms1_ps.cb1[14], r1);
	r0 = r0 + idx_uniforms1_ps.cb1[15];
	r0.xyz = r0.xyz / r0.www;
	r0.xyz = r0.xyz + -idx_uniforms0_ps.cb0[4].xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r0.x = dot(r0.xyz, -idx_uniforms0_ps.cb0[3].xyz);
	r0.x = r0.x + float(1.00000000f);
	r0.x = r0.x * float(0.500000000f);
	r0.x = log2(r0.x);
	r0.y = idx_uniforms1_ps.cb1[16].y * idx_uniforms1_ps.cb1[16].y;
	r0.y = fma(r0.y, float(25.0000000f), float(0.00100000005f));
	r0.x = r0.x * r0.y;
	r0.x = exp2(r0.x);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(idx_uniforms1_ps.cb1[16].y, r0.x, float(1.00000000f));
	r1.x = uintBitsToFloat(uint(0x00000000));
	r0.y = idx_uniforms1_ps.cb1[20].w * float((-1.f / 0.f));
	r1.z = exp2(r0.y);
	r0.yz = r0.xx * r1.xz;
	r0.x = fma(r1.z, r0.x, float(-1.00000000f));
	o0.w = saturate(r0.x * float(0.125000000f));
	o0.xz = r0.yz;
	o0.y = uintBitsToFloat(uint(0x00000000));
	return;
}

