#version 460 core
// ps_5_0
// Checksum: bb1d1b10_c8444719_4222c9e3_f1a679d6
// Name: skidmarks_normal

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res2, s2

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy))).x;
	r0.x = fma(r0.x, idx_uniforms1_ps.cb1[0].x, idx_uniforms1_ps.cb1[0].y);
	r0.x = float(1.00000000f) / r0.x;
	r0.y = v1.v.w + float(0.150000006f);
	r0.x = -r0.y + r0.x;
	r0.x = saturate(r0.x * float(4.00000000f));
	r0.x = -r0.x + float(1.00000000f);
	r0.y = v2.v.w * float(16.0000000f);
	r0.y = saturate(r0.y);
	r1 = (texture(resourceSamplerPair_1_ps, v1.v.xy));
	r0.y = r0.y * r1.w;
	r0.x = r0.x * r0.y;
	o0.w = r0.x;
	o0.xyz = r1.xyz;
	r0.yzw = r1.xyz + vec3(-0.500000000f, -0.500000000f, -0.500000000f);
	r1.x = fma(v2.v.w, float(24.0000000f), float(1.00000000f));
	r1.z = uintBitsToFloat(uint(0x42200000));
	r0.yzw = r0.yzw * r1.xxz;
	r1.xyz = r0.zzz * v4.v.xyz;
	r1.xyz = fma(v3.v.xyz, r0.yyy, r1.xyz);
	r0.yzw = fma(v5.v.xyz, r0.www, r1.xyz);
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = inversesqrt(r1.x);
	r0.yzw = r0.yzw * r1.xxx;
	o1.xyz = fma(r0.yzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = r0.x;
	o2.w = r0.x;
	o2.xyz = uintBitsToFloat(uvec3(0x00000000, 0x3ba3d70a, 0x3d8f5c29));
	return;
}

