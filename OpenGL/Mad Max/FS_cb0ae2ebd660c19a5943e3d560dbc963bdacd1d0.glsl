#version 460 core
// ps_5_0
// Checksum: 690e30f4_3cce3650_d79250e2_e6e06daf
// Name: deferred_pointlight_debug

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[15]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[5]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res2, s1

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0

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
	r0.yzw = r0.xxx * -v2.v.xyz;
	r1.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r1.xy = r1.xy * idx_uniforms1_ps.cb1[13].zw;
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy))).xyz;
	r2.xyz = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.z = dot(r2.xyz, r2.xyz);
	r1.z = inversesqrt(r1.z);
	r2.xyz = r1.zzz * r2.xyz;
	r0.y = saturate(dot(r0.yzw, r2.xyz));
	r0.z = ((texture(resourceSamplerPair_1_ps, r1.xy)).yzxw).z;
	r0.z = fma(r0.z, idx_uniforms2_ps.cb2[0].x, idx_uniforms2_ps.cb2[0].y);
	r0.z = float(1.00000000f) / r0.z;
	r3.xyz = fma(-r0.zzz, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
	r0.z = dot(r3.xyz, r3.xyz);
	r0.w = inversesqrt(r0.z);
	r0.z = sqrt(r0.z);
	r0.z = saturate(fma(r0.z, idx_uniforms1_ps.cb1[1].w, idx_uniforms1_ps.cb1[0].w));
	r0.z = r0.z + float(-1.00000000f);
	r0.z = fma(-r0.z, r0.z, float(1.00000000f));
	r0.z = sqrt(r0.z);
	r0.z = -r0.z + float(1.00000000f);
	r3.xyz = r0.www * r3.xyz;
	r0.w = dot(r2.xyz, r3.xyz);
	r3.xyz = fma(-v2.v.xyz, r0.xxx, r3.xyz);
	r4 = (texture(resourceSamplerPair_2_ps, r1.xy));
	r1.xyz = ((texture(resourceSamplerPair_3_ps, r1.xy))).xyz;
	r0.x = -r4.z + float(0.500000000f);
	r0.x = saturate(r0.x + r0.x);
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.x;
	r1.w = fma(r0.x, idx_uniforms2_ps.cb2[2].x, r0.w);
	r2.w = fma(r0.x, idx_uniforms2_ps.cb2[2].x, float(1.00000000f));
	r0.x = r0.x * idx_uniforms2_ps.cb2[2].x;
	r0.x = saturate(r0.x);
	r1.w = saturate(r1.w / r2.w);
	r2.w = r1.w + float(-1.00000000f);
	r0.x = fma(r0.x, r2.w, float(1.00000000f));
	r0.x = r0.x * r1.w;
	r1.w = fma(r0.x, r0.y, float(9.99999975e-05f));
	r0.y = -r0.y + float(1.00100005f);
	r1.w = log2(r1.w);
	r5.xy = r4.xz + vec2(-0.501960814f, -0.500000000f);
	r5.xy = saturate(r5.xy + r5.xy);
	r2.w = fma(r5.y, idx_uniforms2_ps.cb2[2].y, float(9.99999975e-05f));
	r1.w = r1.w * r2.w;
	r1.w = exp2(r1.w);
	r1.w = r0.x * r1.w;
	r1.w = min(r1.w, float(1.00000000f));
	r6.z = uintBitsToFloat(uint(0x00000000));
	r5.z = uintBitsToFloat(uint(0x00000000));
	r2.w = intBitsToFloat(r4.x < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
	r6.x = r4.x + r4.x;
	r5.xz = saturate(uintBitsToFloat(movc(floatBitsToUint(r2.ww), floatBitsToUint(r6.zx), floatBitsToUint(r5.xz))));
	r2.w = saturate(fma(r5.z, float(0.500000000f), -r0.w));
	r0.w = r0.w + float(1.00000000f);
	r0.w = saturate(r0.w * float(0.500000000f));
	r0.w = r0.w * r0.w;
	r1.w = fma(r2.w, r5.z, r1.w);
	r2.w = intBitsToFloat(float(0.00000000f) < r5.x ? int(0xffffffff) : int(0x00000000));
	r1.w = min(r1.w, float(1.00000000f));
	r3.w = -idx_uniforms2_ps.cb2[3].z + float(1.00000000f);
	r4.x = saturate(r4.w + idx_uniforms2_ps.cb2[3].z);
	r4.x = r4.x + -idx_uniforms2_ps.cb2[3].z;
	r6.y = r4.x / r3.w;
	r6.x = r4.w;
	r5.xz = fma(r6.xy, idx_uniforms2_ps.cb2[3].xw, idx_uniforms2_ps.cb2[4].xw);
	r3.w = r1.w * r5.z;
	r3.w = r0.z * r3.w;
	r4.x = r0.w * float(5.00000000f);
	r4.x = min(r4.x, float(1.00000000f));
	r6.xyz = fma(r4.xxx, vec3(0.100000001f, 0.790000021f, 0.939999998f), vec3(0.899999976f, 0.209999993f, 0.0599999987f));
	r6.xyz = r5.zzz * r6.xyz;
	r4.x = r0.z * r5.x;
	r5.xzw = r4.xxx * idx_uniforms1_ps.cb1[14].xyz;
	r5.xzw = r1.xyz * r5.xzw;
	r6.xyz = r0.www * r6.xyz;
	r6.xyz = r0.zzz * r6.xyz;
	r0.z = r0.z * idx_uniforms1_ps.cb1[4].x;
	r0.z = r0.x * r0.z;
	r0.x = r4.w * r0.x;
	r6.xyz = uintBitsToFloat(movc(floatBitsToUint(r2.www), floatBitsToUint(r6.xyz), floatBitsToUint(r3.www)));
	r6.xyz = r6.xyz * idx_uniforms1_ps.cb1[4].zzz;
	r6.xyz = r1.xyz * r6.xyz;
	r0.w = dot(r3.xyz, r3.xyz);
	r0.w = inversesqrt(r0.w);
	r3.xyz = r0.www * r3.xyz;
	r0.w = dot(r3.xyz, r2.xyz);
	r2.x = fma(r4.y, float(8.00000000f), float(1.00000000f));
	r2.x = exp2(r2.x);
	r2.x = fma(r2.x, float(1.44269502f), float(1.44269502f));
	r0.w = fma(r2.x, r0.w, -r2.x);
	r0.w = exp2(r0.w);
	r0.yw = min(r0.yw, vec2(1.00000000f, 1.00000000f));
	r2.x = r4.y + idx_uniforms2_ps.cb2[0].z;
	r2.y = idx_uniforms2_ps.cb2[0].z * float(3.14000010f);
	r2.x = r2.x / r2.y;
	r0.w = r0.w * r2.x;
	r2.x = dot(r1.xyz, vec3(0.300000012f, 0.589999974f, 0.109999999f));
	r2.x = r2.x + float(0.00100000005f);
	r2.xyz = r1.xyz / r2.xxx;
	r2.xyz = r2.xyz + vec3(-1.00000000f, -1.00000000f, -1.00000000f);
	r2.xyz = fma(r5.yyy, r2.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r2.w = -r5.y + float(1.00000000f);
	r3.xyz = r0.zzz * r2.xyz;
	r2.xyz = saturate(r2.xyz);
	r3.xyz = r4.www * r3.xyz;
	r0.z = saturate(fma(r4.z, float(2.00000000f), float(-1.00000000f)));
	r0.z = fma(r0.z, float(0.649999976f), float(0.0500000007f));
	r3.xyz = r0.www * r3.xyz;
	r0.x = r0.w * r0.x;
	r0.w = r0.y * r0.y;
	r0.w = r0.w * r0.w;
	r0.y = r0.w * r0.y;
	r0.w = -r0.z + float(1.00000000f);
	r0.y = fma(r0.w, r0.y, r0.z);
	r0.y = min(r0.y, float(1.00000000f));
	r0.yzw = r0.yyy * r3.xyz;
	r3.xyz = fma(r6.xyz, r2.www, r0.yzw);
	r0.yzw = r0.yzw * idx_uniforms1_ps.cb1[1].xyz;
	r4.xyz = r2.www * r5.xzw;
	r3.xyz = fma(idx_uniforms1_ps.cb1[1].xyz, r3.xyz, r4.xyz);
	r4.xy = vec2(0.500000000f, 0.500000000f) / idx_uniforms0_ps.cb0[8].zw;
	r4.xy = -r4.xy + v0.xy;
	{ float src = idx_uniforms2_ps.cb2[1].x; r5.x = sin(src); r6.x = cos(src); }
	r6.y = r5.x;
	r2.w = dot(r4.xy, r6.xy);
	r2.w = r2.w + idx_uniforms2_ps.cb2[1].y;
	r2.w = intBitsToFloat(r2.w >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r4.xyz = r1.www * idx_uniforms1_ps.cb1[1].xyz;
	r5.xyz = r4.xyz * idx_uniforms1_ps.cb1[4].zzz;
	r1.xyz = r1.xyz * r5.xyz;
	r5 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms2_ps.cb2[1].zzzz, vec4(7.00000000f, 8.00000000f, 9.00000000f, 10.0000000f)))));
	r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r5.x));
	r4.xyz = uintBitsToFloat(movc(floatBitsToUint(r5.yyy), floatBitsToUint(r4.xyz), floatBitsToUint(r1.www)));
	r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r5.zzz), floatBitsToUint(r1.xyz), floatBitsToUint(r4.xyz)));
	r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r5.www), floatBitsToUint(r0.xxx), floatBitsToUint(r1.xyz)));
	r4.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(equal(idx_uniforms2_ps.cb2[1].zz, vec2(11.0000000f, 12.0000000f)))));
	r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.xxx), floatBitsToUint(r2.xyz), floatBitsToUint(r1.xyz)));
	r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.yyy), floatBitsToUint(r0.yzw), floatBitsToUint(r1.xyz)));
	o0.xyz = uintBitsToFloat(movc(floatBitsToUint(r2.www), floatBitsToUint(r0.xyz), floatBitsToUint(r3.xyz)));
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

