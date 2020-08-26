#version 460 core
// ps_5_0
// Checksum: dad229f4_100eeccb_9e12038c_f1f5e32e
// Name: particleeffectblendsofterosioncullingvolume

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
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

layout (std140) uniform cb_ps1 { vec4 cb1[10]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res7, s7

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2

uniform sampler2D resourceSamplerPair_3_ps; // res1, s1


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
	r0 = v4.v.yyyy * idx_uniforms1_ps.cb1[6];
	r0 = fma(v4.v.xxxx, idx_uniforms1_ps.cb1[5], r0);
	r0 = fma(v4.v.zzzz, idx_uniforms1_ps.cb1[7], r0);
	r0 = r0 + idx_uniforms1_ps.cb1[8];
	r0.xyz = r0.xyz / r0.www;
	r0.xyz = abs(r0.xyz) + -idx_uniforms1_ps.cb1[9].xxx;
	r0.x = max(r0.y, r0.x);
	r0.x = max(r0.z, r0.x);
	r0.x = saturate(r0.x * idx_uniforms1_ps.cb1[9].y);
	r1 = (texture(resourceSamplerPair_0_ps, v2.v.xy));
	r2 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r1 = r1 + -r2;
	r1 = fma(v2.v.zzzz, r1, r2);
	r0.x = r0.x * r1.w;
	r0.z = fma(r0.x, float(-0.200000003f), float(1.00000000f));
	r2.xyz = v4.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
	r3.xyz = r0.zzz * r2.xyz;
	r2.xyz = fma(r2.xyz, r0.zzz, idx_uniforms0_ps.cb0[5].xyz);
	r0.z = dot(r3.xyz, r3.xyz);
	r0.z = sqrt(r0.z);
	r0.z = r0.z * idx_uniforms1_ps.cb1[1].w;
	r0.z = r0.z * float(8.00000000f);
	r0.z = max(r0.z, float(1.00000000f));
	r0.z = min(r0.z, float(6.00000000f));
	r2.xz = r2.xz + idx_uniforms1_ps.cb1[1].yz;
	r3.x = r2.y * idx_uniforms0_ps.cb0[1].w;
	r3.y = r2.y * idx_uniforms0_ps.cb0[3].w;
	r2.xy = r2.xz + -r3.xy;
	r2.xy = r2.xy * idx_uniforms1_ps.cb1[1].ww;
	r0.z = ((textureLod(resourceSamplerPair_1_ps, r2.xy, r0.z)).xywz).z;
	r0.z = saturate(r0.z + idx_uniforms1_ps.cb1[1].x);
	r2.xyz = fma(v5.v.xyz, r0.zzz, v6.v.xyz);
	r2.xyz = r2.xyz * v3.v.xyz;
	r0.y = v1.v.w;
	r1.w = ((texture(resourceSamplerPair_2_ps, r0.xy)).xzwy).w;
	r2.w = v3.v.w;
	r0 = r1 * r2;
	r1.xyz = fma(-r1.xyz, r2.xyz, idx_uniforms0_ps.cb0[13].xyz);
	r2.xy = v0.xy * idx_uniforms1_ps.cb1[2].zw;
	r1.w = ((texture(resourceSamplerPair_3_ps, r2.xy)).yzwx).w;
	r1.w = v0.z / r1.w;
	r1.w = saturate(fma(r1.w, idx_uniforms1_ps.cb1[0].z, -idx_uniforms1_ps.cb1[0].z));
	r0.w = r0.w * r1.w;
	r1.w = fma(idx_uniforms4_ps.cb4[4].x, r0.w, idx_uniforms4_ps.cb4[4].y);
	o0.w = r0.w;
	r0.w = intBitsToFloat(r1.w < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.w) != uint(0);
	r0.w = v1.v.z * idx_uniforms1_ps.cb1[0].y;
	o0.xyz = fma(r1.xyz, r0.www, r0.xyz);
	PixelEpilog();
	return;
}

