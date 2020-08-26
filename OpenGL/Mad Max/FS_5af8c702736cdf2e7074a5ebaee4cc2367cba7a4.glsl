#version 460 core
// ps_5_0
// Checksum: d21fe1f0_bc6df4d0_bd2db19e_0a952fa5
// Name: characterskingenerallod1_1bita_fade

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
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
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[42]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res4, s4

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3

uniform sampler2D resourceSamplerPair_4_ps; // res7, s7

uniform sampler2D resourceSamplerPair_5_ps; // res6, s6

uniform sampler2D resourceSamplerPair_6_ps; // res2, s2


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


void PixelEpilog()
{
	if (discarded)
		discard;
}

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r0.x = fract(r0.x);
	r1 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r0.y = fma(-r1.w, idx_uniforms1_ps.cb1[1].w, float(1.00000000f));
	r0.x = -r0.y + r0.x;
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.x = intBitsToFloat(idx_uniforms1_ps.cb1[1].z == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.xy = uintBitsToFloat(movc(floatBitsToUint(r0.xx), floatBitsToUint(v1.v.xy), floatBitsToUint(v1.v.zw)));
	r0.xyz = ((texture(resourceSamplerPair_1_ps, r0.xy)).xywz).xyz;
	r0.xzw = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.y = r0.w * r0.x;
	r1.w = dot(r0.yz, r0.yz);
	r2.y = r0.z;
	r1.w = -r1.w + float(1.00000000f);
	r1.w = max(r1.w, float(0.00000000f));
	r0.x = sqrt(r1.w);
	r0.z = uintBitsToFloat(uint(0xbf800000));
	r3.z = uintBitsToFloat(uint(0x00000000));
	r2.xz = uintBitsToFloat(uvec2(0xbf800000, 0xbf800000));
	r4.xy = v6.v.xy * idx_uniforms2_ps.cb2[1].xy;
	r5.xyz = ((texture(resourceSamplerPair_2_ps, r4.xy)).xywz).xyz;
	r4 = (texture(resourceSamplerPair_3_ps, r4.xy));
	r2.xzw = fma(r5.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), r2.xyz);
	r0.w = r2.y;
	r3.x = r2.w * r2.x;
	r3.y = r2.z;
	r2.xyz = r0.yzx + r3.xyz;
	r0.xyz = r0.ywx + -r2.xyz;
	r0.xyz = fma(idx_uniforms1_ps.cb1[1].xxx, r0.xyz, r2.xyz);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r0.w = dot(v3.v.xyz, v3.v.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xyz = r0.www * v3.v.xyz;
	r2.xyz = r0.yyy * r2.xyz;
	r0.y = dot(v2.v.xyz, v2.v.xyz);
	r0.y = inversesqrt(r0.y);
	r3.xyz = r0.yyy * v2.v.xyz;
	r0.xyw = fma(r3.xyz, r0.xxx, r2.xyz);
	r1.w = dot(v4.v.xyz, v4.v.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = r1.www * v4.v.xyz;
	r0.xyz = fma(r2.xyz, r0.zzz, r0.xyw);
	r0.w = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r0.xyz = r0.www * r0.xyz;
	r2.xyz = -v5.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xyz = r0.www * r2.xyz;
	r0.w = saturate(dot(r0.xyz, r2.xyz));
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	r0.x = -r0.w + float(1.00000000f);
	r0.x = log2(r0.x);
	r0.x = r0.x * idx_uniforms1_ps.cb1[41].y;
	r0.x = exp2(r0.x);
	r0.x = min(r0.x, float(1.00000000f));
	r0.x = r0.x * idx_uniforms1_ps.cb1[41].x;
	r0.yzw = r1.xyz * r4.xyz;
	r1.x = r4.w + r4.w;
	r1.yzw = r0.yzw * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	r2.x = v2.v.w + v2.v.w;
	r2.y = max(r2.x, float(0.500000000f));
	r2.x = saturate(r2.x);
	r2.y = float(1.00000000f) / r2.y;
	r2.z = r2.y + float(-1.00000000f);
	r3.x = v3.v.w;
	r3.y = v4.v.w;
	r3.xy = r3.xy * idx_uniforms2_ps.cb2[1].zw;
	r3 = (texture(resourceSamplerPair_4_ps, r3.xy));
	r2.y = saturate(fma(r2.y, r3.w, -r2.z));
	r2.x = r2.y * r2.x;
	r2.x = min(r2.x, r3.w);
	r2.x = max(r2.x, float(0.00000000f));
	r0.yzw = fma(-r0.yzw, vec3(4.69999981f, 4.69999981f, 4.69999981f), r3.xyz);
	r0.yzw = fma(r2.xxx, r0.yzw, r1.yzw);
	r1.y = saturate(float(1.00000000f) + -idx_uniforms1_ps.cb1[0].w);
	r0.yzw = fma(r0.yzw, r1.yyy, idx_uniforms1_ps.cb1[0].xyz);
	r1.yzw = -r0.yzw + vec3(0.800000012f, 0.800000012f, 0.800000012f);
	r1.yzw = fma(r0.xxx, r1.yzw, r0.yzw);
	r0.x = ((texture(resourceSamplerPair_5_ps, v1.v.xy))).x;
	r2.y = intBitsToFloat(r0.x == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r2.z = intBitsToFloat(float(0.500000000f) < r0.x ? int(0xffffffff) : int(0x00000000));
	o2.x = r0.x;
	r0.x = uintBitsToFloat(floatBitsToUint(r2.z) | floatBitsToUint(r2.y));
	o0.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.xxx), floatBitsToUint(r1.yzw), floatBitsToUint(r0.yzw)));
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r0.xyz = ((texture(resourceSamplerPair_6_ps, v1.v.xy))).xyz;
	r0.w = fma(-r0.y, r1.x, r3.w);
	r0.y = r1.x * r0.y;
	o2.zw = r0.zx;
	o2.y = fma(r2.x, r0.w, r0.y);
	PixelEpilog();
	return;
}

