#version 460 core
// ps_5_0
// Checksum: 42884442_e86aea59_34001b9d_8ffa5778
// Name: characterskinned_wmuv2_1bita

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[42]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;

layout (std140) uniform cb_ps3 { vec4 cb3[2]; } idx_uniforms3_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res4, s4

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res9, s9

uniform sampler2D resourceSamplerPair_4_ps; // res7, s7

uniform sampler2D resourceSamplerPair_5_ps; // res0, s0

uniform sampler2D resourceSamplerPair_6_ps; // res6, s6

uniform sampler2D resourceSamplerPair_7_ps; // res2, s2


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
	r0.x = intBitsToFloat(idx_uniforms1_ps.cb1[1].z == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.xy = uintBitsToFloat(movc(floatBitsToUint(r0.xx), floatBitsToUint(v1.v.xy), floatBitsToUint(v1.v.zw)));
	r0.xyz = ((texture(resourceSamplerPair_0_ps, r0.xy)).xywz).xyz;
	r0.yzw = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.x = r0.w * r0.y;
	r0.w = dot(r0.xz, r0.xz);
	r1.y = r0.z;
	r0.w = -r0.w + float(1.00000000f);
	r0.w = max(r0.w, float(0.00000000f));
	r0.z = sqrt(r0.w);
	r1.xz = uintBitsToFloat(uvec2(0xbf800000, 0xbf800000));
	r2.xy = v6.v.xy * idx_uniforms2_ps.cb2[1].xy;
	r3.xyz = ((texture(resourceSamplerPair_1_ps, r2.xy)).xywz).xyz;
	r2 = (texture(resourceSamplerPair_2_ps, r2.xy));
	r1.xyz = fma(r3.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), r1.xyz);
	r1.x = r1.z * r1.x;
	r0.y = uintBitsToFloat(uint(0xbf800000));
	r1.z = uintBitsToFloat(uint(0x00000000));
	r0.xyz = r0.xyz + r1.xyz;
	r1.xyz = ((texture(resourceSamplerPair_3_ps, v1.v.zw))).xyz;
	r1.xyz = fma(r1.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r3 = r1.yzyz * idx_uniforms3_ps.cb3[0].xxww;
	r0.w = saturate(r1.x);
	r1.x = saturate(-1.f * r1.x);
	r1.yz = fma(r3.xy, r0.ww, r0.xy);
	r4 = v1.v.zwzw + vec4(0.333333343f, 0.00000000f, 0.666666687f, 0.00000000f);
	r3.xy = ((texture(resourceSamplerPair_3_ps, r4.xy))).xy;
	r4.xy = ((texture(resourceSamplerPair_3_ps, r4.zw))).xy;
	r4.xy = fma(r4.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r3.xy = fma(r3.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.zw = r3.xy * idx_uniforms3_ps.cb3[0].yy;
	r3.xy = r3.xy * idx_uniforms3_ps.cb3[1].xx;
	r1.yz = fma(r4.zw, r0.ww, r1.yz);
	r4.zw = r4.xy * idx_uniforms3_ps.cb3[0].zz;
	r4.xy = r4.xy * idx_uniforms3_ps.cb3[1].yy;
	r1.yz = fma(r4.zw, r0.ww, r1.yz);
	r1.yz = fma(r3.zw, r1.xx, r1.yz);
	r1.yz = fma(r3.xy, r1.xx, r1.yz);
	r0.xy = fma(r4.xy, r1.xx, r1.yz);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r0.w = dot(v3.v.xyz, v3.v.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xyz = r0.www * v3.v.xyz;
	r1.xyz = r0.yyy * r1.xyz;
	r0.y = dot(v2.v.xyz, v2.v.xyz);
	r0.y = inversesqrt(r0.y);
	r3.xyz = r0.yyy * v2.v.xyz;
	r0.xyw = fma(r3.xyz, r0.xxx, r1.xyz);
	r1.x = dot(v4.v.xyz, v4.v.xyz);
	r1.x = inversesqrt(r1.x);
	r1.xyz = r1.xxx * v4.v.xyz;
	r0.xyz = fma(r1.xyz, r0.zzz, r0.xyw);
	r0.w = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r0.xyz = r0.www * r0.xyz;
	r1.xyz = -v5.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xyz = r0.www * r1.xyz;
	r0.w = saturate(dot(r0.xyz, r1.xyz));
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	r0.x = -r0.w + float(1.00000000f);
	r0.x = log2(r0.x);
	r0.x = r0.x * idx_uniforms1_ps.cb1[41].y;
	r0.x = exp2(r0.x);
	r0.x = min(r0.x, float(1.00000000f));
	r0.x = r0.x * idx_uniforms1_ps.cb1[41].x;
	r0.y = v2.v.w + v2.v.w;
	r0.z = max(r0.y, float(0.500000000f));
	r0.y = saturate(r0.y);
	r0.z = float(1.00000000f) / r0.z;
	r0.w = r0.z + float(-1.00000000f);
	r1.x = v3.v.w;
	r1.y = v4.v.w;
	r1.xy = r1.xy * idx_uniforms2_ps.cb2[1].zw;
	r1 = (texture(resourceSamplerPair_4_ps, r1.xy));
	r0.z = saturate(fma(r0.z, r1.w, -r0.w));
	r0.y = r0.z * r0.y;
	r0.y = min(r0.y, r1.w);
	r0.y = max(r0.y, float(0.00000000f));
	r3.xyz = ((texture(resourceSamplerPair_5_ps, v1.v.xy))).xyz;
	r2.xyz = r2.xyz * r3.xyz;
	r0.z = r2.w + r2.w;
	r3.xyz = r2.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	r1.xyz = fma(-r2.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), r1.xyz);
	r1.xyz = fma(r0.yyy, r1.xyz, r3.xyz);
	r0.w = saturate(float(1.00000000f) + -idx_uniforms1_ps.cb1[0].w);
	r1.xyz = fma(r1.xyz, r0.www, idx_uniforms1_ps.cb1[0].xyz);
	r2.xyz = -r1.xyz + vec3(0.800000012f, 0.800000012f, 0.800000012f);
	r2.xyz = fma(r0.xxx, r2.xyz, r1.xyz);
	r0.x = ((texture(resourceSamplerPair_6_ps, v1.v.xy))).x;
	r0.w = intBitsToFloat(r0.x == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r2.w = intBitsToFloat(float(0.500000000f) < r0.x ? int(0xffffffff) : int(0x00000000));
	o2.x = r0.x;
	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) | floatBitsToUint(r2.w));
	o0.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.xxx), floatBitsToUint(r2.xyz), floatBitsToUint(r1.xyz)));
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r1.xyz = ((texture(resourceSamplerPair_7_ps, v1.v.xy))).xyz;
	r0.x = fma(-r1.y, r0.z, r1.w);
	r0.z = r0.z * r1.y;
	o2.zw = r1.zx;
	o2.y = fma(r0.y, r0.x, r0.z);
	return;
}

