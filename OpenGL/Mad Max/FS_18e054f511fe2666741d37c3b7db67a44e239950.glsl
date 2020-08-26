#version 460 core
// ps_5_0
// Checksum: 943e90c4_f6c862d2_ea85e658_c1084928
// Name: spotlightconeinside

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[9]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy))).x;
	r0.x = fma(r0.x, idx_uniforms1_ps.cb1[2].x, idx_uniforms1_ps.cb1[2].y);
	r0.x = float(1.00000000f) / r0.x;
	r1.w = uintBitsToFloat(uint(0x3f800000));
	r0.yzw = v1.v.yzw + -idx_uniforms1_ps.cb1[4].xyz;
	r2.x = dot(r0.yzw, r0.yzw);
	r2.x = inversesqrt(r2.x);
	r2.yzw = r0.yzw * r2.xxx;
	r0.y = fma(r0.w, r2.x, float(2.00000000f));
	r0.z = r0.w / r2.w;
	r1.xyz = fma(r0.zzz, r2.yzw, idx_uniforms1_ps.cb1[4].xyz);
	r0.w = dot(idx_uniforms1_ps.cb1[8], r1);
	r1.x = min(-r0.w, r0.x);
	r0.x = saturate(r0.x * float(0.500000000f));
	r3.w = uintBitsToFloat(uint(0x3f800000));
	r1.y = intBitsToFloat(idx_uniforms1_ps.cb1[4].z < float(-1.00000000f) ? int(0xffffffff) : int(0x00000000));
	r1.z = -idx_uniforms1_ps.cb1[4].z + float(-1.00000000f);
	r1.z = r1.z / r2.w;
	r1.y = uintBitsToFloat(floatBitsToUint(r1.z) & floatBitsToUint(r1.y));
	r3.xyz = fma(r1.yyy, r2.yzw, idx_uniforms1_ps.cb1[4].xyz);
	r1.z = dot(idx_uniforms1_ps.cb1[8], r3);
	r1.w = max(-r1.z, float(0.00000000f));
	r0.w = -r0.w + r1.z;
	r1.x = -r1.w + r1.x;
	r1.z = r0.z + -r1.y;
	r0.w = r1.z / r0.w;
	r0.w = fma(r0.w, r1.x, r1.y);
	r0.z = min(r0.z, r0.w);
	r0.w = dot(r2.yz, r2.yz);
	r0.w = r0.w * idx_uniforms1_ps.cb1[4].z;
	r1.x = dot(idx_uniforms1_ps.cb1[4].xy, r2.yz);
	r0.w = fma(r1.x, r2.w, -r0.w);
	r1.x = dot(idx_uniforms1_ps.cb1[5].xyz, r2.yzw);
	r0.w = -r1.x / r0.w;
	r0.w = max(r1.y, r0.w);
	r0.w = min(r0.z, r0.w);
	r1.xzw = fma(r0.www, r2.yzw, idx_uniforms1_ps.cb1[4].xyz);
	r0.w = dot(r1.xzw, r1.xzw);
	r0.w = inversesqrt(r0.w);
	r0.w = r0.w * r1.w;
	r1.xzw = fma(r0.zzz, r2.yzw, idx_uniforms1_ps.cb1[4].xyz);
	r1.x = dot(r1.xzw, r1.xzw);
	r1.x = inversesqrt(r1.x);
	r1.x = r1.x * r1.w;
	r1.z = max(r1.w, r3.z);
	r1.z = r1.z + float(1.00000000f);
	r0.y = r0.y * r1.z;
	r0.w = min(r0.w, r1.x);
	r1.x = -idx_uniforms1_ps.cb1[4].z / r2.w;
	r1.x = max(r1.y, r1.x);
	r0.z = min(r0.z, r1.x);
	r1.xyz = fma(r0.zzz, r2.yzw, idx_uniforms1_ps.cb1[4].xyz);
	r0.z = dot(r1.xyz, r1.xyz);
	r0.z = inversesqrt(r0.z);
	r0.z = r0.z * r1.z;
	r1.x = dot(r3.xyz, r3.xyz);
	r1.x = inversesqrt(r1.x);
	r1.x = r1.x * r3.z;
	r0.z = min(r0.z, r1.x);
	r0.z = min(r0.z, r0.w);
	r0.z = saturate(fma(r0.z, float(-3.41421366f), float(-2.41421366f)));
	r0.y = r0.z * r0.y;
	r0.y = r0.y * r0.y;
	r0.z = max(v1.v.x, -idx_uniforms1_ps.cb1[4].z);
	r0.z = saturate(r0.z * idx_uniforms1_ps.cb1[3].x);
	r0.y = r0.z * r0.y;
	r0.x = r0.x * r0.y;
	r0.y = uintBitsToFloat(floatBitsToUint(r0.x) & uint(0x7f800000));
	r0.xzw = r0.xxx * idx_uniforms1_ps.cb1[0].xyz;
	r0.y = intBitsToFloat(int(2139095040) != floatBitsToInt(r0.y) ? int(0xffffffff) : int(0x00000000));
	o0.xyz = uintBitsToFloat(floatBitsToUint(r0.xzw) & floatBitsToUint(r0.yyy));
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}
