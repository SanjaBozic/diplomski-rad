#version 460 core
// ps_5_0
// Checksum: 56591b49_004e4c8f_b5337211_e13bf9b8
// Name: carpaintmm_dcl_damaget_fade

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps3 { vec4 cb3[1]; } idx_uniforms3_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res8, s8

uniform sampler2D resourceSamplerPair_2_ps; // res9, s9

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3

uniform sampler2D resourceSamplerPair_4_ps; // res4, s4

uniform sampler2D resourceSamplerPair_5_ps; // res1, s1

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

void main()
{
	Initialise();
	r0.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r0.x = fract(r0.x);
	r1 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r0.y = fma(-r1.w, idx_uniforms1_ps.cb1[0].w, float(1.00000000f));
	r0.x = -r0.y + r0.x;
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.xy = v1.v.zw * vec2(4.00000000f, 6.00000000f);
	r2 = (texture(resourceSamplerPair_1_ps, r0.xy));
	r0.xyz = ((texture(resourceSamplerPair_2_ps, r0.xy)).zxyw).xyz;
	r2.xyz = -r1.xyz + r2.xyz;
	r2.xyz = fma(r2.www, r2.xyz, r1.xyz);
	r1.xyz = r1.xyz + -r2.xyz;
	r1.xyz = fma(v2.v.www, r1.xyz, r2.xyz);
	r2.xy = v1.v.zw * idx_uniforms3_ps.cb3[0].xy;
	r3 = (texture(resourceSamplerPair_3_ps, r2.xy));
	r2.xy = ((texture(resourceSamplerPair_4_ps, r2.xy))).xy;
	r2.xy = fma(r2.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r3 = r3 * vec4(4.69999981f, 4.69999981f, 4.69999981f, 2.00000000f);
	r1.xyz = r1.xyz * r3.xyz;
	o0.xyz = r1.xyz * idx_uniforms1_ps.cb1[0].xyz;
	o0.w = r1.w;
	r1.xyz = ((texture(resourceSamplerPair_5_ps, v1.v.zw))).xyz;
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r3.xy = fma(r0.yz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.z = dot(r3.xy, r3.xy);
	r3.z = -r0.z + float(1.00000000f);
	r0.z = -v2.v.w + float(1.00000000f);
	r1.xyz = fma(r3.xyz, r0.zzz, r1.xyz);
	r2.z = uintBitsToFloat(uint(0x00000000));
	r1.xyz = r1.xyz + r2.xyz;
	r0.z = dot(r1.xyz, r1.xyz);
	r0.z = inversesqrt(r0.z);
	r1.xyz = r0.zzz * r1.xyz;
	r0.z = dot(v4.v.xyz, v4.v.xyz);
	r0.z = inversesqrt(r0.z);
	r2.xyz = r0.zzz * v4.v.xyz;
	r2.xyz = r1.yyy * r2.xyz;
	r0.z = dot(v3.v.xyz, v3.v.xyz);
	r0.z = inversesqrt(r0.z);
	r3.xyz = r0.zzz * v3.v.xyz;
	r2.xyz = fma(r3.xyz, r1.xxx, r2.xyz);
	r0.z = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r3.xyz = r0.zzz * v2.v.xyz;
	r0.z = dot(r3.xyz, r3.xyz);
	r0.z = inversesqrt(r0.z);
	r3.xyz = r0.zzz * r3.xyz;
	r1.xyz = fma(r3.xyz, r1.zzz, r2.xyz);
	o1.xyz = fma(r1.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = r1.w;
	o2.w = r1.w;
	r0.y = uintBitsToFloat(uint(0x3f4ccccd));
	r0.zw = ((texture(resourceSamplerPair_6_ps, v1.v.xy)).xwyz).zw;
	r0.xy = -r0.zw + r0.xy;
	r0.xy = fma(r2.ww, r0.xy, r0.zw);
	r0.zw = -r0.xy + r0.zw;
	r0.xy = fma(v2.v.ww, r0.zw, r0.xy);
	o2.y = r3.w * r0.x;
	o2.z = r0.y;
	o2.x = uintBitsToFloat(uint(0x00000000));
	PixelEpilog();
	return;
}

