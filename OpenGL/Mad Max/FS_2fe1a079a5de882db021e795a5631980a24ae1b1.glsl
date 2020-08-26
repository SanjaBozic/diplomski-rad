#version 460 core
// ps_5_0
// Checksum: 2997f21e_77f7591c_be1edc28_75f051ec
// Name: window_indoor

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 8) in idx_Varying8 { vec4 v; } v8;
layout(location = 9) in idx_Varying9 { vec4 v; } v9;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[3]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res9, s9

uniform sampler2D resourceSamplerPair_3_ps; // res4, s4

uniform sampler2D resourceSamplerPair_4_ps; // res3, s3

uniform sampler2D resourceSamplerPair_5_ps; // res2, s2

uniform samplerCube resourceSamplerPair_6_ps; // res6, s6

uniform samplerCube resourceSamplerPair_7_ps; // res5, s5


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
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r1.x = fma(r0.w, idx_uniforms1_ps.cb1[0].y, float(-0.00999999978f));
	r1.x = intBitsToFloat(r1.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r1.x) != uint(0);
	r1.x = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r1.xyz = r1.xxx * v7.v.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r1.w = dot(v5.v.xyz, v5.v.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = r1.www * v5.v.xyz;
	r1.w = dot(v6.v.xyz, v6.v.xyz);
	r1.w = inversesqrt(r1.w);
	r3.xyz = r1.www * v6.v.xyz;
	r4.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy)).xywz).xyz;
	r4.yzw = fma(r4.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r3.xyz = r3.xyz * r4.zzz;
	r4.x = r4.w * r4.y;
	r2.xyz = fma(r2.xyz, r4.xxx, r3.xyz);
	r1.w = dot(r4.xz, r4.xz);
	r1.w = -r1.w + float(1.00000000f);
	r1.w = max(r1.w, float(0.00000000f));
	r1.w = sqrt(r1.w);
	r1.xyz = fma(r1.xyz, r1.www, r2.xyz);
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = -v4.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = r1.www * r2.xyz;
	r1.w = saturate(dot(r1.xyz, r2.xyz));
	r1.w = -r1.w + float(1.00000000f);
	r2.w = r1.w * r1.w;
	r1.w = fma(r1.w, r1.w, float(0.200000003f));
	r1.w = min(r1.w, float(1.00000000f));
	r3.x = fma(r2.w, float(8.00000000f), float(1.00000000f));
	r2.w = fma(-r2.w, float(0.300000012f), float(1.00000000f));
	r5.x = v5.v.w;
	r5.y = v6.v.w;
	r3.yz = r5.xy / v7.v.ww;
	r4.yw = v8.v.xy * idx_uniforms1_ps.cb1[2].xx;
	r4.yw = r4.yw / v7.v.ww;
	r4.xy = r4.xz + -r4.yw;
	r4.xy = r4.xy * idx_uniforms1_ps.cb1[0].ww;
	r3.xw = saturate(fma(r4.xy, r3.xx, r3.yz));
	r3.yz = r3.yz * idx_uniforms1_ps.cb1[1].xy;
	r3.xw = r3.xw * idx_uniforms1_ps.cb1[1].xy;
	r4 = (textureGather(resourceSamplerPair_2_ps, r3.xw, 0));
	r4 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(lessThan(v0.zzzz, r4))));
	r4.xy = uintBitsToFloat(floatBitsToUint(r4.zw) | floatBitsToUint(r4.xy));
	r4.x = uintBitsToFloat(floatBitsToUint(r4.y) | floatBitsToUint(r4.x));
	r3.xy = uintBitsToFloat(movc(floatBitsToUint(r4.xx), floatBitsToUint(r3.yz), floatBitsToUint(r3.xw)));
	r3.xyz = ((texture(resourceSamplerPair_3_ps, r3.xy))).xyz;
	r4.xyz = ((texture(resourceSamplerPair_4_ps, v1.v.zw))).xyz;
	r3.xyz = r3.xyz * r4.xyz;
	r3.w = saturate(fma(r1.y, float(0.500000000f), float(0.500000000f)));
	r4.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
	r4.xyz = fma(r3.www, r4.xyz, idx_uniforms0_ps.cb0[11].xyz);
	r3.w = saturate(dot(r1.xyz, -idx_uniforms0_ps.cb0[3].xyz));
	r4.xyz = fma(r3.www, idx_uniforms0_ps.cb0[2].xyz, r4.xyz);
	r4.xyz = r4.xyz + idx_uniforms1_ps.cb1[0].zzz;
	r0.xyz = r0.xyz * v9.v.xyz;
	r0.w = r0.w * idx_uniforms1_ps.cb1[0].y;
	o0.w = r0.w;
	r0.xyz = r4.xyz * r0.xyz;
	r0.w = idx_uniforms1_ps.cb1[0].z + float(1.00000000f);
	r3.xyz = fma(r3.xyz, r0.www, -r0.xyz);
	r4.xy = ((texture(resourceSamplerPair_5_ps, v1.v.xy)).xzyw).xy;
	r0.w = r2.w * r4.y;
	r1.w = r1.w * r4.x;
	r0.xyz = fma(r0.www, r3.xyz, r0.xyz);
	r0.w = dot(r0.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r2.w = dot(-r2.xyz, r1.xyz);
	r2.w = r2.w + r2.w;
	r1.xyz = fma(r1.xyz, -r2.www, -r2.xyz);
	r2.xyz = ((textureLod(resourceSamplerPair_6_ps, r1.xyz, idx_uniforms1_ps.cb1[2].y))).xyz;
	r1.xyz = ((textureLod(resourceSamplerPair_7_ps, r1.xyz, idx_uniforms1_ps.cb1[2].y))).xyz;
	r2.xyz = -r1.xyz + r2.xyz;
	r1.xyz = fma(idx_uniforms1_ps.cb1[1].www, r2.xyz, r1.xyz);
	r1.xyz = r1.xyz * idx_uniforms1_ps.cb1[1].zzz;
	r2.x = dot(r1.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r1.xyz = r1.xyz * r2.xxx;
	r2.x = r0.w + r2.x;
	r1.xyz = fma(r0.www, r0.xyz, r1.xyz);
	r1.xyz = r1.xyz / r2.xxx;
	r1.xyz = -r0.xyz + r1.xyz;
	r0.xyz = fma(r1.www, r1.xyz, r0.xyz);
	r1.x = uintBitsToFloat(uint(0x3f800000));
	r1.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r1 = r1 * -v4.v.wwww;
	r1 = exp2(r1);
	r1 = min(r1, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = -r1.x + float(1.00000000f);
	r2.xyz = r0.www * idx_uniforms0_ps.cb0[13].xyz;
	o0.xyz = fma(r0.xyz, r1.yzw, r2.xyz);
	PixelEpilog();
	return;
}

