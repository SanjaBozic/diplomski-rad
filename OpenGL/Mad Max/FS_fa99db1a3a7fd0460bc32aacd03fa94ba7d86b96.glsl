#version 460 core
// ps_5_0
// Checksum: 0736f505_99c6b96c_3dd65dd9_b17cbdca
// Name: deferred_arealight_nospec

layout(location = 1) in idx_Varying1 { noperspective vec4 v; } v1;
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[9]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[4]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res2, s1

uniform sampler2D resourceSamplerPair_2_ps; // res3, s0

uniform sampler2D resourceSamplerPair_3_ps; // res1, s0


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).x;
	r0.x = fma(r0.x, idx_uniforms2_ps.cb2[0].x, idx_uniforms2_ps.cb2[0].y);
	r0.x = float(1.00000000f) / r0.x;
	r0.yzw = fma(r0.xxx, v2.v.xyz, -idx_uniforms1_ps.cb1[0].xyz);
	r0.y = dot(idx_uniforms1_ps.cb1[3].xyz, r0.yzw);
	r1.xyz = r0.xxx * v2.v.xyz;
	r0.yzw = fma(-r0.yyy, idx_uniforms1_ps.cb1[3].xyz, r1.xyz);
	r0.yzw = r0.yzw + -idx_uniforms1_ps.cb1[0].xyz;
	r1.x = dot(r0.yzw, idx_uniforms1_ps.cb1[4].xyz);
	r1.y = dot(r0.yzw, idx_uniforms1_ps.cb1[5].xyz);
	r0.yz = max(r1.xy, -idx_uniforms1_ps.cb1[6].yz);
	r0.yz = min(r0.yz, idx_uniforms1_ps.cb1[6].yz);
	r1.xyz = r0.zzz * idx_uniforms1_ps.cb1[5].xyz;
	r0.yzw = fma(idx_uniforms1_ps.cb1[4].xyz, r0.yyy, r1.xyz);
	r0.yzw = r0.yzw + idx_uniforms1_ps.cb1[0].xyz;
	r1.xyz = fma(-r0.xxx, v2.v.xyz, r0.yzw);
	r0.yzw = fma(r0.xxx, v2.v.xyz, -r0.yzw);
	r2.xyz = fma(-r0.xxx, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
	r0.x = dot(r0.yzw, r0.yzw);
	r0.x = sqrt(r0.x);
	r0.x = saturate(r0.x * idx_uniforms1_ps.cb1[6].x);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(-r0.x, r0.x, float(1.00000000f));
	r0.x = sqrt(r0.x);
	r0.x = -r0.x + float(1.00000000f);
	r0.y = dot(r1.xyz, r1.xyz);
	r0.y = inversesqrt(r0.y);
	r1.xyz = r0.yyy * r1.xyz;
	r1.w = uintBitsToFloat(uint(0x3f800000));
	r0.y = saturate(dot(idx_uniforms1_ps.cb1[8], r1));
	r0.z = dot(r2.xyz, r2.xyz);
	r0.z = inversesqrt(r0.z);
	r1.xyz = r0.zzz * r2.xyz;
	r2.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r2.xyz = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.z = dot(r2.xyz, r1.xyz);
	r0.w = saturate(r0.z);
	r1.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy)).xzwy).xyz;
	r1.w = intBitsToFloat(r1.x < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
	r1.x = r1.x + r1.x;
	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.w));
	r1.x = saturate(r1.x);
	r0.z = saturate(fma(r1.x, float(0.500000000f), -r0.z));
	r0.z = fma(r0.z, r1.x, r0.w);
	r0.z = min(r0.z, float(1.00000000f));
	r0.w = r0.z * idx_uniforms1_ps.cb1[7].z;
	r0.z = fma(r0.z, float(0.500000000f), r0.w);
	r0.z = saturate(r0.z + idx_uniforms1_ps.cb1[7].y);
	r0.y = r0.z * r0.y;
	r0.x = r0.y * r0.x;
	r0.y = saturate(r1.z + idx_uniforms2_ps.cb2[2].z);
	r0.z = r1.y + float(-0.500000000f);
	r0.z = saturate(r0.z + r0.z);
	r0.z = -r0.z + float(1.00000000f);
	r0.y = r0.y + -idx_uniforms2_ps.cb2[2].z;
	r0.w = -idx_uniforms2_ps.cb2[2].z + float(1.00000000f);
	r0.y = r0.y / r0.w;
	r0.y = fma(r0.y, idx_uniforms2_ps.cb2[2].w, idx_uniforms2_ps.cb2[3].w);
	r0.x = r0.y * r0.x;
	r0.xyw = r0.xxx * idx_uniforms1_ps.cb1[1].xyz;
	r1.xyz = ((texture(resourceSamplerPair_3_ps, v1.v.xy))).xyz;
	r1.xyz = r0.zzz * r1.xyz;
	o0.xyz = r0.xyw * r1.xyz;
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

