#version 460 core
// ps_5_0
// Checksum: 26ab03b1_135785e6_5b471e09_9dc4e0d0
// Name: deferred_arealight_debug

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { noperspective vec4 v; } v1;
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

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
	r1.xyz = fma(r0.xxx, v2.v.xyz, -r0.yzw);
	r0.yzw = fma(-r0.xxx, v2.v.xyz, r0.yzw);
	r2.xyz = fma(-r0.xxx, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
	r0.x = dot(r1.xyz, r1.xyz);
	r0.x = sqrt(r0.x);
	r0.x = saturate(r0.x * idx_uniforms1_ps.cb1[6].x);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(-r0.x, r0.x, float(1.00000000f));
	r0.x = sqrt(r0.x);
	r0.x = -r0.x + float(1.00000000f);
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = inversesqrt(r1.x);
	r1.xyz = r0.yzw * r1.xxx;
	r1.w = uintBitsToFloat(uint(0x3f800000));
	r0.y = saturate(dot(idx_uniforms1_ps.cb1[8], r1));
	r0.z = dot(r2.xyz, r2.xyz);
	r0.z = inversesqrt(r0.z);
	r2.xyz = r0.zzz * r2.xyz;
	r3.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r3.xyz = fma(r3.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.z = dot(r3.xyz, r2.xyz);
	r0.w = saturate(r0.z);
	r2 = (texture(resourceSamplerPair_2_ps, v1.v.xy));
	r1.w = intBitsToFloat(r2.x < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
	r2.x = r2.x + r2.x;
	r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r2.x));
	r1.w = saturate(r1.w);
	r0.z = saturate(fma(r1.w, float(0.500000000f), -r0.z));
	r0.z = fma(r0.z, r1.w, r0.w);
	r0.z = min(r0.z, float(1.00000000f));
	r0.w = r0.z * idx_uniforms1_ps.cb1[7].z;
	r0.z = fma(r0.z, float(0.500000000f), r0.w);
	r0.z = saturate(r0.z + idx_uniforms1_ps.cb1[7].y);
	r0.y = r0.z * r0.y;
	r0.x = r0.y * r0.x;
	r0.y = -idx_uniforms2_ps.cb2[2].z + float(1.00000000f);
	r0.z = saturate(r2.w + idx_uniforms2_ps.cb2[2].z);
	r0.z = r0.z + -idx_uniforms2_ps.cb2[2].z;
	r0.y = r0.z / r0.y;
	r0.y = fma(r0.y, idx_uniforms2_ps.cb2[2].w, idx_uniforms2_ps.cb2[3].w);
	r0.x = r0.y * r0.x;
	r0.y = dot(-v2.v.xyz, -v2.v.xyz);
	r0.y = inversesqrt(r0.y);
	r1.xyz = fma(-v2.v.xyz, r0.yyy, r1.xyz);
	r0.yzw = r0.yyy * -v2.v.xyz;
	r0.y = saturate(dot(r0.yzw, r3.xyz));
	r0.y = -r0.y + float(1.00100005f);
	r0.y = min(r0.y, float(1.00000000f));
	r0.z = dot(r1.xyz, r1.xyz);
	r0.z = inversesqrt(r0.z);
	r1.xyz = r0.zzz * r1.xyz;
	r0.z = saturate(dot(r1.xyz, r3.xyz));
	r0.w = fma(r2.y, float(8.00000000f), float(1.00000000f));
	r0.w = exp2(r0.w);
	r0.w = fma(r0.w, float(1.44269502f), float(1.44269502f));
	r0.z = fma(r0.w, r0.z, -r0.w);
	r0.z = exp2(r0.z);
	r0.w = idx_uniforms2_ps.cb2[0].z * float(3.14000010f);
	r1.x = r2.y + idx_uniforms2_ps.cb2[0].z;
	r0.w = r1.x / r0.w;
	r0.z = r0.z * r0.w;
	r0.w = r2.z + float(-0.500000000f);
	r1.x = saturate(fma(r2.z, float(2.00000000f), float(-1.00000000f)));
	r1.x = fma(r1.x, float(0.649999976f), float(0.0500000007f));
	r0.w = saturate(r0.w + r0.w);
	r1.yzw = ((texture(resourceSamplerPair_3_ps, v1.v.xy)).wxyz).yzw;
	r2.x = dot(r1.yzw, vec3(0.300000012f, 0.589999974f, 0.109999999f));
	r2.x = r2.x + float(0.00100000005f);
	r2.xyz = r1.yzw / r2.xxx;
	r2.xyz = r2.xyz + vec3(-1.00000000f, -1.00000000f, -1.00000000f);
	r2.xyz = fma(r0.www, r2.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = -r0.w + float(1.00000000f);
	r2.xyz = r0.zzz * r2.xyz;
	r0.z = r0.z * r0.x;
	r2.xyz = r2.xyz * idx_uniforms1_ps.cb1[2].www;
	r2.w = r0.y * r0.y;
	r2.w = r2.w * r2.w;
	r0.y = r0.y * r2.w;
	r2.w = -r1.x + float(1.00000000f);
	r0.y = fma(r2.w, r0.y, r1.x);
	r0.y = min(r0.y, float(1.00000000f));
	r2.xyz = r0.yyy * r2.xyz;
	r3.xyz = r0.xxx * r2.xyz;
	r2.xyz = fma(r1.yzw, r0.www, r2.xyz);
	r3.xyz = r3.xyz * idx_uniforms1_ps.cb1[1].xyz;
	r4.xyz = r0.xxx * idx_uniforms1_ps.cb1[1].xyz;
	r1.xyz = r1.yzw * r4.xyz;
	r5 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms2_ps.cb2[1].zzzz, vec4(10.0000000f, 11.0000000f, 12.0000000f, 13.0000000f)))));
	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.x));
	r0.xyw = uintBitsToFloat(movc(floatBitsToUint(r5.yyy), floatBitsToUint(r4.xyz), floatBitsToUint(r0.xxx)));
	r2.xyz = r2.xyz * r4.xyz;
	r0.xyw = uintBitsToFloat(movc(floatBitsToUint(r5.zzz), floatBitsToUint(r1.xyz), floatBitsToUint(r0.xyw)));
	r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r5.www), floatBitsToUint(r0.zzz), floatBitsToUint(r0.xyw)));
	r1.xyz = intBitsToFloat(mix ( ivec3(0x00000000),ivec3(0xffffffff),bvec3(equal(idx_uniforms2_ps.cb2[1].zzz, vec3(15.0000000f, 27.0000000f, 32.0000000f)))));
	r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), floatBitsToUint(r3.xyz), floatBitsToUint(r0.xyz)));
	r0.w = dot(r2.xyz, vec3(0.300000012f, 0.589999974f, 0.109999999f));
	r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.yyy), floatBitsToUint(r0.www), floatBitsToUint(r0.xyz)));
	r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.zzz), floatBitsToUint(r2.xyz), floatBitsToUint(r0.xyz)));
	r1.xy = vec2(0.500000000f, 0.500000000f) / idx_uniforms0_ps.cb0[8].zw;
	r1.xy = -r1.xy + v0.xy;
	{ float src = idx_uniforms2_ps.cb2[1].x; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r0.w = dot(r1.xy, r4.xy);
	r0.w = r0.w + idx_uniforms2_ps.cb2[1].y;
	r0.w = intBitsToFloat(r0.w >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	o0.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.www), floatBitsToUint(r0.xyz), floatBitsToUint(r2.xyz)));
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

