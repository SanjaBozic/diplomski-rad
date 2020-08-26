#version 460 core
// ps_5_0
// Checksum: 1f2d213b_b280f0f6_e73aed00_daaf4230
// Name: deferred_pointlightsimple

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[14]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[5]; } idx_uniforms2_ps;


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
	r0.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.xy = r0.xy * idx_uniforms1_ps.cb1[13].zw;
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.xy)).yzxw).z;
	r0.z = fma(r0.z, idx_uniforms2_ps.cb2[0].x, idx_uniforms2_ps.cb2[0].y);
	r0.z = float(1.00000000f) / r0.z;
	r1.xyz = fma(-r0.zzz, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
	r0.z = dot(r1.xyz, r1.xyz);
	r0.w = inversesqrt(r0.z);
	r0.z = sqrt(r0.z);
	r0.z = saturate(fma(r0.z, idx_uniforms1_ps.cb1[1].w, idx_uniforms1_ps.cb1[0].w));
	r0.z = r0.z + float(-1.00000000f);
	r0.z = fma(-r0.z, r0.z, float(1.00000000f));
	r0.z = sqrt(r0.z);
	r0.z = -r0.z + float(1.00000000f);
	r1.xyz = r0.www * r1.xyz;
	r2.xyz = ((texture(resourceSamplerPair_1_ps, r0.xy))).xyz;
	r2.xyz = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xyz = r0.www * r2.xyz;
	r0.w = saturate(dot(r2.xyz, r1.xyz));
	r1.x = dot(-v2.v.xyz, -v2.v.xyz);
	r1.x = inversesqrt(r1.x);
	r1.xyz = r1.xxx * -v2.v.xyz;
	r1.x = saturate(dot(r1.xyz, r2.xyz));
	r1.x = fma(r0.w, r1.x, float(9.99999975e-05f));
	r1.x = log2(r1.x);
	r1.yz = ((texture(resourceSamplerPair_2_ps, r0.xy)).xzwy).yz;
	r2.xyz = ((texture(resourceSamplerPair_3_ps, r0.xy))).xyz;
	r0.x = r1.y + float(-0.500000000f);
	r0.y = saturate(r1.z + idx_uniforms2_ps.cb2[3].z);
	r0.y = r0.y + -idx_uniforms2_ps.cb2[3].z;
	r0.x = saturate(r0.x + r0.x);
	r1.y = fma(r0.x, idx_uniforms2_ps.cb2[2].y, float(9.99999975e-05f));
	r0.x = -r0.x + float(1.00000000f);
	r1.x = r1.x * r1.y;
	r1.x = exp2(r1.x);
	r0.w = r0.w * r1.x;
	r0.w = min(r0.w, float(1.00000000f));
	r1.x = -idx_uniforms2_ps.cb2[3].z + float(1.00000000f);
	r0.y = r0.y / r1.x;
	r0.y = fma(r0.y, idx_uniforms2_ps.cb2[3].w, idx_uniforms2_ps.cb2[4].w);
	r0.y = r0.y * r0.w;
	r0.y = r0.y * r0.z;
	r0.y = r0.y * idx_uniforms1_ps.cb1[4].z;
	r0.yzw = r2.xyz * r0.yyy;
	r0.xyz = r0.xxx * r0.yzw;
	o0.xyz = r0.xyz * idx_uniforms1_ps.cb1[1].xyz;
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

