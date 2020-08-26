#version 460 core
// ps_5_0
// Checksum: 6badebb0_1460b584_e6e21a92_0e208735
// Name: dirtroadmaskblendcf

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[4]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0

uniform sampler2D resourceSamplerPair_2_ps; // res4, s4

uniform sampler2D resourceSamplerPair_3_ps; // res5, s5

uniform sampler2D resourceSamplerPair_4_ps; // res3, s3

uniform sampler2D resourceSamplerPair_5_ps; // res2, s2


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0 = v2.v.xyxy * idx_uniforms1_ps.cb1[0].xzyw;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r0.zw))).xyz;
	r0.xyz = ((texture(resourceSamplerPair_1_ps, r0.xy))).xyz;
	r1.xyz = -r0.xyz + r1.xyz;
	r0.xyz = fma(v3.v.www, r1.xyz, r0.xyz);
	r1 = v2.v.xzxz * idx_uniforms1_ps.cb1[0].xzyw;
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.zw))).xyz;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, r1.xy))).xyz;
	r2.xyz = -r1.xyz + r2.xyz;
	r1.xyz = fma(v3.v.www, r2.xyz, r1.xyz);
	r0.xyz = r0.xyz + -r1.xyz;
	r0.xyz = fma(v3.v.www, r0.xyz, r1.xyz);
	r1.x = uintBitsToFloat(uint(0x3f800000));
	r1.y = idx_uniforms1_ps.cb1[2].x;
	r1 = r1.xyxy * v2.v.xyxz;
	r2 = (texture(resourceSamplerPair_2_ps, r1.xy));
	r1 = (texture(resourceSamplerPair_2_ps, r1.zw));
	r2 = -r1 + r2;
	r1 = fma(v3.v.wwww, r2, r1);
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = r0.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	r1.xyz = ((texture(resourceSamplerPair_3_ps, v5.v.xy))).xyz;
	r1.xyz = fma(r1.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = saturate(idx_uniforms1_ps.cb1[3].w);
	r1.xyz = fma(r0.www, r1.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	o0.xyz = r0.xyz * r1.xyz;
	r0.x = dot(r0.xzy, vec3(0.300000012f, 0.300000012f, 0.400000006f));
	o2.y = saturate(fma(r0.x, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].x));
	r0 = v2.v.xyxy * idx_uniforms1_ps.cb1[1].xzyw;
	r2 = (texture(resourceSamplerPair_4_ps, r0.zw));
	r0 = (texture(resourceSamplerPair_5_ps, r0.xy));
	r2 = -r0 + r2;
	r0 = fma(v3.v.wwww, r2, r0);
	r2 = v2.v.xzxz * idx_uniforms1_ps.cb1[1].xzyw;
	r3 = (texture(resourceSamplerPair_4_ps, r2.zw));
	r2 = (texture(resourceSamplerPair_5_ps, r2.xy));
	r3 = -r2 + r3;
	r2 = fma(v3.v.wwww, r3, r2);
	r0 = r0 + -r2;
	r0 = fma(v3.v.wwww, r0, r2);
	r0.w = r1.w * r0.w;
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

