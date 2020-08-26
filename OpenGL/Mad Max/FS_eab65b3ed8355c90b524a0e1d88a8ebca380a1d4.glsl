#version 460 core
// ps_5_0
// Checksum: 5ba1d145_839f733f_2dc991f0_6ccbf873
// Name: deferred_spotlightndpt

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[15]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[5]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res2, s1

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0

uniform sampler2D resourceSamplerPair_2_ps; // res3, s0

uniform sampler2D resourceSamplerPair_3_ps; // res1, s0

uniform sampler2D resourceSamplerPair_4_ps; // res6, s2


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
	r0.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.xy = r0.xy * idx_uniforms1_ps.cb1[13].zw;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r0.xy))).xyz;
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.z = dot(r1.xyz, r1.xyz);
	r0.z = inversesqrt(r0.z);
	r1.xyz = r0.zzz * r1.xyz;
	r0.z = ((texture(resourceSamplerPair_1_ps, r0.xy)).yzxw).z;
	r0.z = fma(r0.z, idx_uniforms2_ps.cb2[0].x, idx_uniforms2_ps.cb2[0].y);
	r0.z = float(1.00000000f) / r0.z;
	r2.xyz = fma(-r0.zzz, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
	r3.xyz = r0.zzz * v2.v.xyz;
	r0.z = dot(r2.xyz, r2.xyz);
	r0.w = inversesqrt(r0.z);
	r0.z = sqrt(r0.z);
	r2.xyz = r0.www * r2.xyz;
	r0.w = dot(r1.xyz, r2.xyz);
	r1.x = dot(-r2.xyz, idx_uniforms1_ps.cb1[2].xyz);
	r1.x = saturate(fma(r1.x, idx_uniforms1_ps.cb1[1].w, idx_uniforms1_ps.cb1[2].w));
	r0.w = r0.w + float(1.00000000f);
	r0.w = saturate(r0.w * float(0.500000000f));
	r0.w = r0.w * r0.w;
	r1.y = r0.w * float(5.00000000f);
	r1.y = min(r1.y, float(1.00000000f));
	r1.yzw = fma(r1.yyy, vec3(0.100000001f, 0.790000021f, 0.939999998f), vec3(0.899999976f, 0.209999993f, 0.0599999987f));
	r2.x = -idx_uniforms2_ps.cb2[3].z + float(1.00000000f);
	r2.yzw = ((texture(resourceSamplerPair_2_ps, r0.xy)).yxzw).yzw;
	r4.xyz = ((texture(resourceSamplerPair_3_ps, r0.xy))).xyz;
	r0.x = saturate(r2.w + idx_uniforms2_ps.cb2[3].z);
	r0.x = r0.x + -idx_uniforms2_ps.cb2[3].z;
	r0.y = r0.x / r2.x;
	r0.x = r2.w;
	r0.xy = fma(r0.xy, idx_uniforms2_ps.cb2[3].xw, idx_uniforms2_ps.cb2[4].xw);
	r1.yzw = r0.yyy * r1.yzw;
	r1.yzw = r0.www * r1.yzw;
	r0.y = saturate(fma(r0.z, idx_uniforms1_ps.cb1[3].x, idx_uniforms1_ps.cb1[0].w));
	r0.z = saturate(fma(r0.z, idx_uniforms1_ps.cb1[13].y, -idx_uniforms1_ps.cb1[13].x));
	r0.z = r0.z * r1.x;
	r0.z = r0.z * r0.z;
	r0.y = r0.y + float(-1.00000000f);
	r0.y = fma(-r0.y, r0.y, float(1.00000000f));
	r0.y = sqrt(r0.y);
	r0.y = -r0.y + float(1.00000000f);
	r1.xyz = r1.yzw * r0.yyy;
	r0.y = r0.z * r0.y;
	r0.x = r0.x * r0.y;
	r0.xyw = r0.xxx * idx_uniforms1_ps.cb1[14].xyz;
	r0.xyw = r4.xyz * r0.xyw;
	r1.w = intBitsToFloat(r2.y < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
	r2.xy = r2.yz + vec2(-0.501960814f, -0.500000000f);
	r2.xy = saturate(r2.xy + r2.xy);
	r2.x = intBitsToFloat(float(0.00000000f) < r2.x ? int(0xffffffff) : int(0x00000000));
	r2.y = -r2.y + float(1.00000000f);
	r1.w = uintBitsToFloat(movc(floatBitsToUint(r1.w), uint(0x00000000), floatBitsToUint(r2.x)));
	r1.xyz = uintBitsToFloat(floatBitsToUint(r1.xyz) & floatBitsToUint(r1.www));
	r1.xyz = r1.xyz * idx_uniforms1_ps.cb1[4].zzz;
	r1.xyz = r4.xyz * r1.xyz;
	r1.xyz = r2.yyy * r1.xyz;
	r0.xyw = r0.xyw * r2.yyy;
	r2.xyz = fma(idx_uniforms1_ps.cb1[5].xyw, r3.xxx, idx_uniforms1_ps.cb1[8].xyw);
	r2.xyz = fma(idx_uniforms1_ps.cb1[6].xyw, r3.yyy, r2.xyz);
	r2.xyz = fma(idx_uniforms1_ps.cb1[7].xyw, r3.zzz, r2.xyz);
	r2.xy = r2.xy / r2.zz;
	r2.xyz = ((textureLod(resourceSamplerPair_4_ps, r2.xy, float(0.00000000f)))).xyz;
	r2.xyz = r2.xyz * idx_uniforms1_ps.cb1[1].xyz;
	r2.xyz = r0.zzz * r2.xyz;
	o0.xyz = fma(r2.xyz, r1.xyz, r0.xyw);
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

