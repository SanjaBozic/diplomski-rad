#version 460 core
// ps_5_0
// Checksum: 8854f0e8_e0cf7d7f_54bc0434_7a3cbe26
// Name: carpaintmm_fade

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

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3

uniform sampler2D resourceSamplerPair_2_ps; // res4, s4

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2

uniform sampler2D resourceSamplerPair_4_ps; // res1, s1


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
	r0.xy = v1.v.zw * idx_uniforms3_ps.cb3[0].xy;
	r2 = (texture(resourceSamplerPair_1_ps, r0.xy));
	r0.xy = ((texture(resourceSamplerPair_2_ps, r0.xy))).xy;
	r3.xyz = ((texture(resourceSamplerPair_3_ps, v1.v.xy))).xyz;
	r1.w = r3.y;
	o2.zw = r3.zx;
	r1 = r1 * r2;
	r1.xyz = r1.xyz * idx_uniforms1_ps.cb1[0].xyz;
	o2.y = r1.w + r1.w;
	o0.xyz = r1.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	r1.xyz = ((texture(resourceSamplerPair_4_ps, v1.v.zw))).xyz;
	r0.zw = fma(r1.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.z = r1.z + r1.z;
	r1.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), r0.zw);
	r0.xyz = r1.xyz + vec3(-1.00000000f, -1.00000000f, -1.00000000f);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r0.w = dot(v4.v.xyz, v4.v.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xyz = r0.www * v4.v.xyz;
	r1.xyz = r0.yyy * r1.xyz;
	r0.y = dot(v3.v.xyz, v3.v.xyz);
	r0.y = inversesqrt(r0.y);
	r2.xyz = r0.yyy * v3.v.xyz;
	r0.xyw = fma(r2.xyz, r0.xxx, r1.xyz);
	r1.x = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r1.xyz = r1.xxx * v2.v.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r0.xyz = fma(r1.xyz, r0.zzz, r0.xyw);
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.x = uintBitsToFloat(uint(0x00000000));
	PixelEpilog();
	return;
}

