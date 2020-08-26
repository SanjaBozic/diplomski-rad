#version 460 core
// ps_5_0
// Checksum: aa203c5e_9855b399_47427691_b2aaf31d
// Name: 3dtextsdfshadow_alphamask

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[3]; } idx_uniforms1_ps;

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
	r0.x = idx_uniforms1_ps.cb1[2].x + float(0.500000000f);
	r0.y = -idx_uniforms1_ps.cb1[2].x + float(0.500000000f);
	r0.x = -r0.y + r0.x;
	r0.x = float(1.00000000f) / r0.x;
	r1.y = uintBitsToFloat(uint(0x80000000));
	r1.xz = -1.f * idx_uniforms1_ps.cb1[1].xw;
	r0.zw = r1.yz + v1.v.xy;
	r1.x = r1.x + float(0.500000000f);
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.y = -r0.y + r0.z;
	r0.x = saturate(r0.x * r0.y);
	r0.y = fma(r0.x, float(-2.00000000f), float(3.00000000f));
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r0.y = idx_uniforms1_ps.cb1[1].x + float(0.500000000f);
	r0.y = -r1.x + r0.y;
	r0.y = float(1.00000000f) / r0.y;
	r0.z = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).yzxw).z;
	r0.z = -r1.x + r0.z;
	r0.y = saturate(r0.y * r0.z);
	r0.z = fma(r0.y, float(-2.00000000f), float(3.00000000f));
	r0.y = r0.y * r0.y;
	r0.w = r0.y * r0.z;
	r0.y = fma(-r0.z, r0.y, float(1.00000000f));
	r0.z = ((texture(resourceSamplerPair_1_ps, v1.v.zw)).xzyw).z;
	r1.x = fma(r0.z, r0.w, r0.y);
	r0.w = r0.w * idx_uniforms1_ps.cb1[0].w;
	r0.z = r0.z * r0.w;
	r1.yz = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r1.yz = fma(r1.yz, idx_uniforms2_ps.cb2[0].xy, -idx_uniforms2_ps.cb2[0].zw);
	r0.w = ((texture(resourceSamplerPair_2_ps, r1.yz))).w;
	r1.x = r0.w * r1.x;
	r1.x = r1.x * idx_uniforms1_ps.cb1[1].z;
	r0.x = r0.x * r1.x;
	r0.x = fma(-r0.x, r0.y, float(1.00000000f));
	r0.y = fma(-r0.z, r0.w, float(1.00000000f));
	r0.z = r0.w * r0.z;
	r1.xyz = r0.zzz * idx_uniforms1_ps.cb1[0].xyz;
	r0.z = fma(-r0.x, r0.y, float(1.00000000f));
	r1.w = r0.y * r0.x;
	o0 = r1;
	r0.x = dot(r1.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.x = r0.x + r0.z;
	r0.x = fma(idx_uniforms4_ps.cb4[4].x, r0.x, idx_uniforms4_ps.cb4[4].y);
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	PixelEpilog();
	return;
}

