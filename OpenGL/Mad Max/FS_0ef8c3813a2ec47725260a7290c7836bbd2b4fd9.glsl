#version 460 core
// ps_5_0
// Checksum: 466b3b1a_718f8b76_ea4255ff_c6e0c049
// Name: dirtroadmask

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[4]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res5, s5

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0

uniform sampler2D resourceSamplerPair_2_ps; // res4, s4

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xyz = ((texture(resourceSamplerPair_0_ps, v5.v.xy))).xyz;
	r0.xyz = fma(r0.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = saturate(idx_uniforms1_ps.cb1[3].w);
	r0.xyz = fma(r0.www, r0.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r1.xy = v2.v.xy * idx_uniforms1_ps.cb1[0].xz;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, r1.xy))).xyz;
	r2.x = v2.v.x;
	r2.y = v2.v.y * idx_uniforms1_ps.cb1[2].x;
	r2 = (texture(resourceSamplerPair_2_ps, r2.xy));
	r1.xyz = r1.xyz * r2.xyz;
	r1.xyz = r1.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	o0.xyz = r0.xyz * r1.xyz;
	r0.x = dot(r1.xzy, vec3(0.300000012f, 0.300000012f, 0.400000006f));
	o2.y = saturate(fma(r0.x, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].x));
	r0.xy = v2.v.xy * idx_uniforms1_ps.cb1[1].xz;
	r0 = (texture(resourceSamplerPair_3_ps, r0.xy));
	r0.w = r2.w * r0.w;
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.x = r0.w * v1.v.w;
	o0.w = r1.x;
	r0.xy = r0.xy * v4.v.ww;
	r0.xy = r0.ww * r0.xy;
	r0.w = dot(v4.v.xyz, v4.v.xyz);
	r0.w = inversesqrt(r0.w);
	r1.yzw = r0.www * v4.v.xyz;
	r1.yzw = r0.xxx * r1.yzw;
	r0.x = dot(v3.v.xyz, v3.v.xyz);
	r0.x = inversesqrt(r0.x);
	r2.xyz = r0.xxx * v3.v.xyz;
	r0.xyw = fma(r2.xyz, r0.yyy, -r1.yzw);
	r1.y = dot(v1.v.xyz, v1.v.xyz);
	r1.y = inversesqrt(r1.y);
	r1.yzw = r1.yyy * v1.v.xyz;
	r0.xyz = fma(r1.yzw, r0.zzz, r0.xyw);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = r1.x;
	o2.w = r1.x * idx_uniforms1_ps.cb1[3].z;
	o2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	return;
}

