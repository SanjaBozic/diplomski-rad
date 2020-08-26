#version 460 core
// ps_5_0
// Checksum: 45e169ab_24042485_9c78f501_8802ea2c
// Name: wheel

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res5, s5

uniform sampler2D resourceSamplerPair_1_ps; // res2, s2

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res0, s0

uniform sampler2D resourceSamplerPair_4_ps; // res4, s4

uniform sampler2D resourceSamplerPair_5_ps; // res1, s1


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
	r2 = (texture(resourceSamplerPair_1_ps, v1.v.xy));
	r1 = r1 + -r2;
	r1 = fma(idx_uniforms1_ps.cb1[0].wwww, r1, r2);
	r0.y = fma(-idx_uniforms1_ps.cb1[1].w, r1.w, float(1.00000000f));
	r0.x = -r0.y + r0.x;
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0 = (texture(resourceSamplerPair_2_ps, v1.v.xy));
	r2.xyz = ((texture(resourceSamplerPair_3_ps, v1.v.xy))).xyz;
	r0.xyz = r0.xyz + -r2.xyz;
	r0.w = r0.w + -idx_uniforms1_ps.cb1[1].x;
	r0.w = saturate(r0.w + r0.w);
	r0.xyz = fma(idx_uniforms1_ps.cb1[0].www, r0.xyz, r2.xyz);
	r2.xyz = -r0.xyz + idx_uniforms1_ps.cb1[0].xyz;
	o0.xyz = fma(r0.www, r2.xyz, r0.xyz);
	r0.x = -r0.w + float(1.00000000f);
	o2.y = r0.x * r1.y;
	o2.zw = r1.zx;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	r0.xyz = ((texture(resourceSamplerPair_4_ps, v1.v.xy)).xywz).xyz;
	r0.yzw = fma(r0.yxz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.x = r0.w * r0.z;
	r0.w = dot(r0.xy, r0.xy);
	r0.w = -r0.w + float(1.00000000f);
	r0.w = max(r0.w, float(0.00000000f));
	r0.z = sqrt(r0.w);
	r1.xyz = ((texture(resourceSamplerPair_5_ps, v1.v.xy)).xywz).xyz;
	r1.yzw = fma(r1.yxz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.x = r1.w * r1.z;
	r0.w = dot(r1.xy, r1.xy);
	r0.w = -r0.w + float(1.00000000f);
	r0.w = max(r0.w, float(0.00000000f));
	r1.z = sqrt(r0.w);
	r0.xyz = r0.xyz + -r1.xyz;
	r0.xyz = fma(idx_uniforms1_ps.cb1[0].www, r0.xyz, r1.xyz);
	r0.w = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r1.xyz = r0.www * v2.v.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xyz = r0.www * r1.xyz;
	r0.w = dot(v3.v.xyz, v3.v.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xyz = r0.www * v3.v.xyz;
	r3.xyz = r1.zxy * r2.yzx;
	r3.xyz = fma(r1.yzx, r2.zxy, -r3.xyz);
	r3.xyz = r3.xyz * v3.v.www;
	r3.xyz = r0.yyy * r3.xyz;
	r0.xyw = fma(r2.xyz, r0.xxx, r3.xyz);
	r0.xyz = fma(r1.xyz, r0.zzz, r0.xyw);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.x = uintBitsToFloat(uint(0x00000000));
	PixelEpilog();
	return;
}

