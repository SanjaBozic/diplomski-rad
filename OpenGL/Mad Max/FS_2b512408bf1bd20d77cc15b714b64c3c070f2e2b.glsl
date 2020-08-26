#version 460 core
// ps_5_0
// Checksum: fc844f84_58dbcda2_e6b268f0_08785bca
// Name: ghostproject_indoor

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xyz = v4.v.zxy * v5.v.yzx;
	r0.xyz = fma(v4.v.yzx, v5.v.zxy, -r0.xyz);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r0.w = dot(v5.v.xyz, v5.v.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xyz = r0.www * v5.v.xyz;
	r2.xyz = r0.yzx * r1.zxy;
	r2.xyz = fma(r1.yzx, r0.zxy, -r2.xyz);
	r0.xyz = r0.xyz * v4.v.www;
	r0.xyz = r0.xyz * v2.v.yyy;
	r0.xyz = fma(r2.xyz, v2.v.xxx, -r0.xyz);
	r0.xyz = fma(r1.xyz, v2.v.zzz, r0.xyz);
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = inversesqrt(r0.x);
	r0.x = r0.x * r0.y;
	r0.x = log2(abs(r0.x));
	r0.x = r0.x * idx_uniforms1_ps.cb1[0].y;
	r0.x = exp2(r0.x);
	r0.yzw = -v3.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r1.w = dot(r0.yzw, r0.yzw);
	r1.w = inversesqrt(r1.w);
	r0.yzw = r0.yzw * r1.www;
	r0.y = dot(r0.yzw, r1.xyz);
	r0.y = min(abs(r0.y), float(1.00000000f));
	r0.y = -r0.y + float(1.00000000f);
	r0.y = log2(r0.y);
	r0.y = r0.y * idx_uniforms1_ps.cb1[0].x;
	r0.y = exp2(r0.y);
	r0.y = r0.y * idx_uniforms1_ps.cb1[0].z;
	o0.w = saturate(fma(r0.x, idx_uniforms1_ps.cb1[0].w, r0.y));
	r0.x = idx_uniforms1_ps.cb1[1].z + idx_uniforms1_ps.cb1[1].y;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r0.xzw = r0.xxx * r1.xyz;
	r0.xyz = fma(r0.xzw, r0.yyy, r0.xzw);
	r1.x = uintBitsToFloat(uint(0x3f800000));
	r1.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r1 = r1 * -v3.v.wwww;
	r1 = exp2(r1);
	r1 = min(r1, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = -r1.x + float(1.00000000f);
	r2.xyz = r0.www * idx_uniforms0_ps.cb0[13].xyz;
	o0.xyz = fma(r0.xyz, r1.yzw, r2.xyz);
	return;
}

