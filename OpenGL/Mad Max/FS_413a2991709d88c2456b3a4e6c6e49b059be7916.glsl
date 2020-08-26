#version 460 core
// ps_5_0
// Checksum: 868c3067_ca715219_69a019d8_c878e482
// Name: fogvolumeapplynoisecloudshadowsnearindoor

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[21]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler3D resourceSamplerPair_1_ps; // res1, s1


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
	r0.w = sqrt(r0.w);
	r0.w = max(r0.w, float(9.99999975e-05f));
	r0.xyz = r0.xyz / r0.www;
	r1.x = saturate(r0.y);
	r1.x = r1.x * r1.x;
	r1.x = fma(r1.x, idx_uniforms1_ps.cb1[16].w, float(1.00000000f));
	r0.w = r0.w * float(0.0250000004f);
	r0.w = min(r0.w, idx_uniforms1_ps.cb1[16].z);
	r0.xyz = r0.www * r0.xyz;
	r1.y = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r1.y = fract(r1.y);
	r1.yzw = fma(r1.yyy, r0.xyz, idx_uniforms0_ps.cb0[4].xyz);
	r1.yzw = r1.yzw + idx_uniforms1_ps.cb1[20].xyz;
	r1.yzw = r1.yzw * idx_uniforms1_ps.cb1[17].xyz;
	r2.xyz = r1.yzw;
	r3.x = uintBitsToFloat(uint(0x00000000));
	r2.w = uintBitsToFloat(uint(0x00000000));
	while (true)
	{
		r3.y = intBitsToFloat(floatBitsToInt(r2.w) >= int(40) ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r3.y) != uint(0))
			break;
		r3.y = ((texture(resourceSamplerPair_1_ps, r2.xyz)).yxzw).y;
		r3.y = fma(-r3.y, idx_uniforms1_ps.cb1[17].w, r3.x);
		r2.xyz = fma(r0.xyz, idx_uniforms1_ps.cb1[17].xyz, r2.xyz);
		r3.x = r3.y + float(1.00000000f);
		r2.w = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
	}
	r0.x = fma(idx_uniforms1_ps.cb1[17].w, idx_uniforms1_ps.cb1[17].w, float(1.00000000f));
	r0.x = r0.x * r3.x;
	r0.x = r0.x * float(0.0250000004f);
	r0.y = r0.w / idx_uniforms1_ps.cb1[16].z;
	r0.x = r0.y * r0.x;
	o0.y = r0.x / r1.x;
	o0.xzw = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
	return;
}

