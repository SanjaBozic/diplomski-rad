#version 460 core
// ps_5_0
// Checksum: f6443c9d_300e3a1f_065345c2_3abe4459
// Name: spotlightcone

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[9]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1


void Initialise()
{
}


uvec4 movc(in uvec4 src0, in uvec4 src1, in uvec4 src2)
{
	return mix(src2, src1, bvec4(src0));
}

uvec3 movc(in uvec3 src0, in uvec3 src1, in uvec3 src2)
{
	return mix(src2, src1, bvec3(src0));
}

uvec2 movc(in uvec2 src0, in uvec2 src1, in uvec2 src2)
{
	return mix(src2, src1, bvec2(src0));
}

uint movc(in uint src0, in uint src1, in uint src2)
{
	return mix(src2, src1, bool(src0));
}

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.w = uintBitsToFloat(uint(0x3f800000));
	r1.xyz = v1.v.yzw + -idx_uniforms1_ps.cb1[4].xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = r1.www * r1.xyz;
	r1.x = fma(r1.z, r1.w, float(2.00000000f));
	r1.y = r1.z / r2.z;
	r2.w = -1.f * r2.z;
	r1.z = dot(-r2.xyz, -r2.xyw);
	r1.w = dot(idx_uniforms1_ps.cb1[4].xyz, -r2.xyw);
	r2.w = r1.z * idx_uniforms1_ps.cb1[4].w;
	r2.w = fma(r1.w, r1.w, -r2.w);
	r2.w = sqrt(r2.w);
	r1.w = r1.w + r2.w;
	r1.z = r1.w / r1.z;
	r1.w = intBitsToFloat(idx_uniforms1_ps.cb1[4].z < float(-1.00000000f) ? int(0xffffffff) : int(0x00000000));
	r2.w = -idx_uniforms1_ps.cb1[4].z + float(-1.00000000f);
	r2.w = r2.w / r2.z;
	r3.x = r2.w + r2.w;
	r1.w = uintBitsToFloat(movc(floatBitsToUint(r1.w), floatBitsToUint(r2.w), floatBitsToUint(r3.x)));
	r1.z = max(r1.z, r1.w);
	r0.xyz = fma(r1.zzz, r2.xyz, idx_uniforms1_ps.cb1[4].xyz);
	r0.x = dot(idx_uniforms1_ps.cb1[8], r0);
	r3.w = uintBitsToFloat(uint(0x3f800000));
	r3.xyz = fma(r1.yyy, r2.xyz, idx_uniforms1_ps.cb1[4].xyz);
	r0.y = dot(idx_uniforms1_ps.cb1[8], r3);
	r0.z = -r0.x + r0.y;
	r0.y = max(-r0.y, float(0.00000000f));
	r0.w = -r1.y + r1.z;
	r0.z = r0.w / r0.z;
	r4.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.w = ((texture(resourceSamplerPair_0_ps, r4.xy)).yzwx).w;
	r0.w = fma(r0.w, idx_uniforms1_ps.cb1[2].x, idx_uniforms1_ps.cb1[2].y);
	r0.w = float(1.00000000f) / r0.w;
	r0.x = min(-r0.x, r0.w);
	r0.w = saturate(r0.w * float(0.500000000f));
	r0.x = -r0.y + r0.x;
	r0.x = fma(r0.z, r0.x, r1.y);
	r0.x = min(r1.z, r0.x);
	r0.y = dot(r2.xy, r2.xy);
	r0.y = r0.y * idx_uniforms1_ps.cb1[4].z;
	r0.z = dot(idx_uniforms1_ps.cb1[4].xy, r2.xy);
	r0.y = fma(r0.z, r2.z, -r0.y);
	r0.z = dot(idx_uniforms1_ps.cb1[5].xyz, r2.xyz);
	r0.y = -r0.z / r0.y;
	r0.y = max(r1.y, r0.y);
	r0.y = min(r0.x, r0.y);
	r4.xyz = fma(r0.yyy, r2.xyz, idx_uniforms1_ps.cb1[4].xyz);
	r0.y = dot(r4.xyz, r4.xyz);
	r0.y = inversesqrt(r0.y);
	r0.y = r0.y * r4.z;
	r4.xyz = fma(r0.xxx, r2.xyz, idx_uniforms1_ps.cb1[4].xyz);
	r0.z = dot(r4.xyz, r4.xyz);
	r0.z = inversesqrt(r0.z);
	r0.z = r0.z * r4.z;
	r1.z = max(r3.z, r4.z);
	r1.z = r1.z + float(1.00000000f);
	r1.x = r1.x * r1.z;
	r0.y = min(r0.y, r0.z);
	r0.z = -idx_uniforms1_ps.cb1[4].z / r2.z;
	r0.z = max(r1.y, r0.z);
	r0.x = min(r0.x, r0.z);
	r1.yzw = fma(r0.xxx, r2.xyz, idx_uniforms1_ps.cb1[4].xyz);
	r0.x = dot(r1.yzw, r1.yzw);
	r0.x = inversesqrt(r0.x);
	r0.x = r0.x * r1.w;
	r0.z = dot(r3.xyz, r3.xyz);
	r0.z = inversesqrt(r0.z);
	r0.z = r0.z * r3.z;
	r0.x = min(r0.z, r0.x);
	r0.x = min(r0.x, r0.y);
	r0.x = saturate(fma(r0.x, float(-3.41421366f), float(-2.41421366f)));
	r0.x = r0.x * r1.x;
	r0.x = r0.x * r0.x;
	r0.y = saturate(v1.v.x * idx_uniforms1_ps.cb1[3].x);
	r0.x = r0.y * r0.x;
	r0.x = r0.w * r0.x;
	r0.y = uintBitsToFloat(floatBitsToUint(r0.x) & uint(0x7f800000));
	r0.xzw = r0.xxx * idx_uniforms1_ps.cb1[0].xyz;
	r0.y = intBitsToFloat(int(2139095040) != floatBitsToInt(r0.y) ? int(0xffffffff) : int(0x00000000));
	o0.xyz = uintBitsToFloat(floatBitsToUint(r0.xzw) & floatBitsToUint(r0.yyy));
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

