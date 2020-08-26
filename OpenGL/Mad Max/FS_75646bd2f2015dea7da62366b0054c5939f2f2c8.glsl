#version 460 core
// ps_5_0
// Checksum: 74ec3d45_0b18dc41_6ae68306_27b1185d
// Name: terrainshaderforest

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)


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

void main()
{
	Initialise();
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).x;
	r1 = (texture(resourceSamplerPair_1_ps, v1.v.zw));
	r0.x = r0.x * r1.w;
	o0.xyz = r1.xyz;
	r0.x = fma(r0.x, v2.v.y, float(-0.500000000f));
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	r0.xy = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xy;
	r0.xy = r0.xy * vec2(-4.26337051f, -4.26337051f);
	r0.z = dot(r0.xy, r0.xy);
	r0.z = r0.z + float(1.00000000f);
	r1.y = inversesqrt(r0.z);
	r1.xz = r0.xy * r1.yy;
	o1.xyz = fma(r1.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	PixelEpilog();
	return;
}

