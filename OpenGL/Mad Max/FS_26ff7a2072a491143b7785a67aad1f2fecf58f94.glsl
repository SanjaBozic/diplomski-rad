#version 460 core
// ps_5_0
// Checksum: 53355237_73987e03_6af90e69_4af10d36
// Name: terrainshaderforestfin

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2


void Initialise()
{
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
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).x;
	r1 = (texture(resourceSamplerPair_1_ps, v1.v.zw));
	r0.x = r0.x * r1.w;
	r1.w = r0.x * v2.v.w;
	r0.x = fma(idx_uniforms4_ps.cb4[4].x, r1.w, idx_uniforms4_ps.cb4[4].y);
	o0 = saturate(r1);
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.xy = ((texture(resourceSamplerPair_2_ps, v2.v.xy))).xy;
	r0.xy = -r0.xy + vec2(0.500000000f, 0.500000000f);
	r0.xz = r0.xy * vec2(8.56031132f, 8.56031132f);
	r0.y = uintBitsToFloat(uint(0x3f000000));
	r0.y = dot(r0.xyz, r0.xyz);
	r1.y = inversesqrt(r0.y);
	r1.xz = r0.xz * r1.yy;
	o1.xyz = fma(r1.xyz, vec3(0.500000000f, 0.250000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	PixelEpilog();
	return;
}

