#version 460 core
// ps_5_0
// Checksum: b0cf9ea3_0026eccc_82737da3_d4fd7212
// Name: motionvectoroutput

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[5]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res2, s2


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
	r0 = v1.v.yyyy * idx_uniforms1_ps.cb1[2];
	r0 = fma(v1.v.xxxx, idx_uniforms1_ps.cb1[1], r0);
	r1.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).x;
	r0 = fma(r1.xxxx, idx_uniforms1_ps.cb1[3], r0);
	r0 = r0 + idx_uniforms1_ps.cb1[4];
	r0.xyz = r0.xyz / r0.www;
	r2.xy = v1.v.xy;
	r2.z = r1.x;
	r0.w = fma(r1.x, idx_uniforms1_ps.cb1[0].z, idx_uniforms1_ps.cb1[0].w);
	r0.w = float(1.00000000f) / r0.w;
	r0.xyz = r0.xyz + -r2.xyz;
	r0.z = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r0.z);
	r0.z = sqrt(r0.z);
	r0.z = r0.z * float(20.0000000f);
	r0.z = min(r0.z, float(1.00000000f));
	r0.xy = r0.xy * r1.xx;
	r0.xy = r0.zz * r0.xy;
	r0.z = intBitsToFloat(float(0.00000000f) < r0.z ? int(0xffffffff) : int(0x00000000));
	r0.xy = uintBitsToFloat(floatBitsToUint(r0.xy) & floatBitsToUint(r0.zz));
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r1.xy = r1.xy + vec2(-0.500000000f, -0.500000000f);
	r1.xy = r1.xy * vec2(1.70000005f, -1.70000005f);
	r0.z = saturate(fma(r0.w, float(0.00999999978f), float(0.00588235306f)));
	r0.w = r0.w * float(0.0312500000f);
	o0.z = r0.w;
	r0.z = intBitsToFloat(r1.z < r0.z ? int(0xffffffff) : int(0x00000000));
	r0.xy = uintBitsToFloat(movc(floatBitsToUint(r0.zz), floatBitsToUint(r1.xy), floatBitsToUint(r0.xy)));
	r0.z = dot(r0.xy, r0.xy);
	r0.z = inversesqrt(r0.z);
	r0.z = saturate(r0.z * idx_uniforms1_ps.cb1[0].y);
	r0.xy = fma(r0.xy, r0.zz, vec2(1.00000000f, 1.00000000f));
	o0.xy = r0.xy * vec2(0.500000000f, 0.500000000f);
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

