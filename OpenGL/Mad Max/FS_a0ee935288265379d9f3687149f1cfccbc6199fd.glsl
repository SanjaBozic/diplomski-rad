#version 460 core
// ps_5_0
// Checksum: 0b41b2ee_4ea19673_66e9ddab_065e79dd
// Name: deferred_softomnilight

layout(location = 1) in idx_Varying1 { noperspective vec4 v; } v1;
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[4]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[1]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res9, s9

uniform sampler2D resourceSamplerPair_2_ps; // res1, s1


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).x;
	r0.y = intBitsToFloat(idx_uniforms1_ps.cb1[3].x < r0.x ? int(0xffffffff) : int(0x00000000));
	r0.z = intBitsToFloat(r0.x < idx_uniforms1_ps.cb1[3].y ? int(0xffffffff) : int(0x00000000));
	r0.y = uintBitsToFloat(floatBitsToUint(r0.z) & floatBitsToUint(r0.y));
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r0.x = fma(r0.x, idx_uniforms2_ps.cb2[0].x, idx_uniforms2_ps.cb2[0].y);
		r0.x = float(1.00000000f) / r0.x;
		r0.xyz = fma(-r0.xxx, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
		r0.x = dot(r0.xyz, r0.xyz);
		r0.x = saturate(r0.x * idx_uniforms1_ps.cb1[0].w);
		r0.y = uintBitsToFloat(uint(0x3f000000));
		r0.x = ((textureLod(resourceSamplerPair_1_ps, r0.xy, float(0.00000000f))).wxyz).x;
		r0.xyz = r0.xxx * idx_uniforms1_ps.cb1[1].xyz;
		r1.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
		r0.xyz = r0.xyz * r1.xyz;
	}
	else
	{
		r0.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
	}
	o0.xyz = r0.xyz;
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

