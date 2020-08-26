#version 460 core
// ps_5_0
// Checksum: ca522183_d0d14a09_0f546f6c_c961842c
// Name: splineroad

bool discarded = false;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 8) in idx_Varying8 { vec4 v; } v8;
layout(location = 9) in idx_Varying9 { vec4 v; } v9;
layout(location = 10) in idx_Varying10 { vec4 v; } v10;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res4, s4

uniform sampler2D resourceSamplerPair_2_ps; // res5, s5

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3


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
	r0 = (texture(resourceSamplerPair_0_ps, v6.v.zw));
	r1 = (texture(resourceSamplerPair_0_ps, v6.v.xy));
	r0 = r0 + -r1;
	r0 = fma(v5.v.wwww, r0, r1);
	r1.x = r0.w * v4.v.w;
	r1.y = fma(idx_uniforms4_ps.cb4[4].x, r1.x, idx_uniforms4_ps.cb4[4].y);
	r1.y = intBitsToFloat(r1.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r1.y) != uint(0);
	r2 = (texture(resourceSamplerPair_1_ps, v7.v.xy));
	r1.y = r0.w * r2.w;
	r1.zw = fma(r2.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r2.xyz = r2.xyz + vec3(-1.00000000f, -1.00000000f, -1.00000000f);
	r2.xyz = fma(r0.www, r2.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r1.zw = fma(r1.zw, vec2(0.00300000003f, 0.00300000003f), v5.v.xy);
	r3 = (texture(resourceSamplerPair_2_ps, r1.zw));
	r0.w = r1.y * r3.w;
	r1.yzw = r3.xyz + vec3(1.00000000f, 1.00000000f, 1.00000000f);
	r1.yzw = -r2.xyz + r1.yzw;
	r1.yzw = fma(r0.www, r1.yzw, r2.xyz);
	o0.xyz = r0.xyz * r1.yzw;
	o0.w = r1.x;
	r0.x = dot(v9.v.xyz, v9.v.xyz);
	r0.x = inversesqrt(r0.x);
	r0.xyz = r0.xxx * v9.v.xyz;
	r0.w = dot(v10.v.xyz, v10.v.xyz);
	r0.w = inversesqrt(r0.w);
	r1.yzw = r0.www * v10.v.xyz;
	r2.xyz = ((texture(resourceSamplerPair_3_ps, v7.v.xy))).xyz;
	r2.xyz = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.yzw = r1.yzw * r2.xxx;
	r0.xyz = fma(r0.xyz, r2.yyy, -r1.yzw);
	r0.w = dot(v8.v.xyz, v8.v.xyz);
	r0.w = inversesqrt(r0.w);
	r1.yzw = r0.www * v8.v.xyz;
	r0.xyz = fma(r1.yzw, r2.zzz, r0.xyz);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = r1.x;
	o2.w = r1.x;
	o2.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x3e5b22d1));
	PixelEpilog();
	return;
}

