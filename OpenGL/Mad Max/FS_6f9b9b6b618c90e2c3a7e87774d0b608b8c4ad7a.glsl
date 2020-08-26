#version 460 core
// ps_5_0
// Checksum: b915788d_c436d85b_b56a5d17_d7829eb2
// Name: deferred_spotlightspnd

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[15]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[5]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res2, s1

uniform sampler2D resourceSamplerPair_2_ps; // res3, s0

uniform sampler2D resourceSamplerPair_3_ps; // res1, s0


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
	r0.x = dot(-v2.v.xyz, -v2.v.xyz);
	r0.x = inversesqrt(r0.x);
	r0.yz = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.yz = r0.yz * idx_uniforms1_ps.cb1[13].zw;
	r0.w = ((texture(resourceSamplerPair_0_ps, r0.yz)).yzwx).w;
	r0.w = fma(r0.w, idx_uniforms2_ps.cb2[0].x, idx_uniforms2_ps.cb2[0].y);
	r0.w = float(1.00000000f) / r0.w;
	r1.xyz = fma(-r0.www, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
	r0.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r0.w);
	r0.w = sqrt(r0.w);
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = fma(-v2.v.xyz, r0.xxx, r1.xyz);
	r3.xyz = r0.xxx * -v2.v.xyz;
	r0.x = dot(r2.xyz, r2.xyz);
	r0.x = inversesqrt(r0.x);
	r2.xyz = r0.xxx * r2.xyz;
	r4.xyz = ((texture(resourceSamplerPair_1_ps, r0.yz))).xyz;
	r4.xyz = fma(r4.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.x = dot(r4.xyz, r4.xyz);
	r0.x = inversesqrt(r0.x);
	r4.xyz = r0.xxx * r4.xyz;
	r0.x = dot(r2.xyz, r4.xyz);
	r2 = (texture(resourceSamplerPair_2_ps, r0.yz));
	r5.xyz = ((texture(resourceSamplerPair_3_ps, r0.yz))).xyz;
	r0.y = fma(r2.y, float(8.00000000f), float(1.00000000f));
	r0.y = exp2(r0.y);
	r0.y = fma(r0.y, float(1.44269502f), float(1.44269502f));
	r0.x = fma(r0.y, r0.x, -r0.y);
	r0.x = exp2(r0.x);
	r0.x = min(r0.x, float(1.00000000f));
	r0.y = idx_uniforms2_ps.cb2[0].z * float(3.14000010f);
	r0.z = r2.y + idx_uniforms2_ps.cb2[0].z;
	r0.y = r0.z / r0.y;
	r0.x = r0.x * r0.y;
	r0.y = saturate(fma(r0.w, idx_uniforms1_ps.cb1[3].x, idx_uniforms1_ps.cb1[0].w));
	r0.z = saturate(fma(r0.w, idx_uniforms1_ps.cb1[13].y, -idx_uniforms1_ps.cb1[13].x));
	r0.y = r0.y + float(-1.00000000f);
	r0.y = fma(-r0.y, r0.y, float(1.00000000f));
	r0.y = sqrt(r0.y);
	r0.y = -r0.y + float(1.00000000f);
	r0.w = r0.y * idx_uniforms1_ps.cb1[4].x;
	r1.w = dot(r5.xyz, vec3(0.300000012f, 0.589999974f, 0.109999999f));
	r1.w = r1.w + float(0.00100000005f);
	r6.xyz = r5.xyz / r1.www;
	r6.xyz = r6.xyz + vec3(-1.00000000f, -1.00000000f, -1.00000000f);
	r7.xy = r2.xz + vec2(-0.501960814f, -0.500000000f);
	r7.xy = saturate(r7.xy + r7.xy);
	r6.xyz = fma(r7.yyy, r6.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r6.xyz = r0.www * r6.xyz;
	r6.xyz = r2.www * r6.xyz;
	r6.xyz = r0.xxx * r6.xyz;
	r0.x = saturate(dot(r3.xyz, r4.xyz));
	r0.w = dot(r4.xyz, r1.xyz);
	r1.x = dot(-r1.xyz, idx_uniforms1_ps.cb1[2].xyz);
	r1.x = saturate(fma(r1.x, idx_uniforms1_ps.cb1[1].w, idx_uniforms1_ps.cb1[2].w));
	r0.z = r0.z * r1.x;
	r0.z = r0.z * r0.z;
	r0.w = r0.w + float(1.00000000f);
	r0.w = saturate(r0.w * float(0.500000000f));
	r0.w = r0.w * r0.w;
	r0.x = -r0.x + float(1.00100005f);
	r0.x = min(r0.x, float(1.00000000f));
	r1.x = r0.x * r0.x;
	r1.x = r1.x * r1.x;
	r0.x = r0.x * r1.x;
	r1.x = saturate(fma(r2.z, float(2.00000000f), float(-1.00000000f)));
	r1.x = fma(r1.x, float(0.649999976f), float(0.0500000007f));
	r1.y = -r1.x + float(1.00000000f);
	r0.x = fma(r1.y, r0.x, r1.x);
	r0.x = min(r0.x, float(1.00000000f));
	r1.xyz = r0.xxx * r6.xyz;
	r0.x = r0.w * float(5.00000000f);
	r0.x = min(r0.x, float(1.00000000f));
	r3.xyz = fma(r0.xxx, vec3(0.100000001f, 0.790000021f, 0.939999998f), vec3(0.899999976f, 0.209999993f, 0.0599999987f));
	r0.x = saturate(r2.w + idx_uniforms2_ps.cb2[3].z);
	r0.x = r0.x + -idx_uniforms2_ps.cb2[3].z;
	r1.w = -idx_uniforms2_ps.cb2[3].z + float(1.00000000f);
	r4.y = r0.x / r1.w;
	r4.x = r2.w;
	r0.x = intBitsToFloat(r2.x < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
	r2.xy = fma(r4.xy, idx_uniforms2_ps.cb2[3].xw, idx_uniforms2_ps.cb2[4].xw);
	r2.yzw = r2.yyy * r3.xyz;
	r2.yzw = r0.www * r2.yzw;
	r2.yzw = r0.yyy * r2.yzw;
	r0.y = r0.z * r0.y;
	r3.xyz = r0.zzz * idx_uniforms1_ps.cb1[1].xyz;
	r0.y = r2.x * r0.y;
	r0.yzw = r0.yyy * idx_uniforms1_ps.cb1[14].xyz;
	r0.yzw = r5.xyz * r0.yzw;
	r1.w = intBitsToFloat(float(0.00000000f) < r7.x ? int(0xffffffff) : int(0x00000000));
	r2.x = -r7.y + float(1.00000000f);
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r0.x), uint(0x00000000), floatBitsToUint(r1.w)));
	r2.yzw = uintBitsToFloat(floatBitsToUint(r2.yzw) & floatBitsToUint(r0.xxx));
	r2.yzw = r2.yzw * idx_uniforms1_ps.cb1[4].zzz;
	r2.yzw = r5.xyz * r2.yzw;
	r1.xyz = fma(r2.yzw, r2.xxx, r1.xyz);
	r0.xyz = r0.yzw * r2.xxx;
	o0.xyz = fma(r3.xyz, r1.xyz, r0.xyz);
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

