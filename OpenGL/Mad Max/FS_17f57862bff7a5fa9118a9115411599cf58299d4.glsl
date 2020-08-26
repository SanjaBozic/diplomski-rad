#version 460 core
// ps_5_0
// Checksum: 8bcd628a_585cb8d2_8c448171_26bc5a6a
// Name: generalmmlod0fade_osn_sand_inst

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 8) in idx_Varying8 { vec4 v; } v8;
layout(location = 9) in idx_Varying9 { vec4 v; } v9;
layout(location = 10) in idx_Varying10 { vec4 v; } v10;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[7]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2

uniform sampler2D resourceSamplerPair_3_ps; // res8, s8

uniform sampler2D resourceSamplerPair_4_ps; // res9, s9

uniform sampler2D resourceSamplerPair_5_ps; // res10, s10


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
	r1.xyz = fma(v6.v.xyz, vec3(0.305306017f, 0.305306017f, 0.305306017f), vec3(0.682171106f, 0.682171106f, 0.682171106f));
	r1.xyz = fma(v6.v.xyz, r1.xyz, vec3(0.0125228781f, 0.0125228781f, 0.0125228781f));
	r1.xyz = r1.xyz * v6.v.xyz;
	r1.w = v6.v.w;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[0].xyz;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v2.v.xy))).xyz;
	r1.xyz = fma(r1.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
	r3.xyz = r1.zzz * v8.v.xyz;
	r3.xyz = fma(v7.v.xyz, r1.yyy, r3.xyz);
	r3.xyz = fma(v9.v.xyz, r1.xxx, r3.xyz);
	r2.w = dot(r3.xyz, r3.xyz);
	r2.w = inversesqrt(r2.w);
	r3.xzw = r2.www * r3.xyz;
	r4.x = saturate(r3.w * idx_uniforms1_ps.cb1[5].z);
	r2.w = fma(r3.y, r2.w, r4.x);
	r3.y = intBitsToFloat(r2.w >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r4.xy = idx_uniforms1_ps.cb1[5].ww * vec2(0.00200000009f, 0.0399999991f);
	r4.xy = fma(v10.v.zw, vec2(1.10000002f, 0.300000012f), r4.xy);
	r4.x = ((texture(resourceSamplerPair_3_ps, r4.xy)).wxyz).x;
	if (floatBitsToUint(r3.y) != uint(0))
	{
		r3.y = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
		r4.yzw = r3.yyy * v3.v.xyz;
		r3.y = dot(r4.yzw, r4.yzw);
		r3.y = inversesqrt(r3.y);
		r4.yzw = r3.yyy * r4.yzw;
		r5.xyz = ((texture(resourceSamplerPair_4_ps, v10.v.xy))).xyz;
		r5.xyz = fma(r5.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r3.y = dot(v4.v.xyz, v4.v.xyz);
		r3.y = inversesqrt(r3.y);
		r6.xyz = r3.yyy * v4.v.xyz;
		r7.xyz = r1.xyz * r6.yzx;
		r1.xyz = fma(r1.zxy, r6.zxy, -r7.xyz);
		r1.xyz = r1.xyz * v4.v.www;
		r1.xyz = r5.yyy * r1.xyz;
		r1.xyz = fma(r6.xyz, r5.xxx, r1.xyz);
		r1.xyz = fma(r4.yzw, r5.zzz, r1.xyz);
		r3.y = dot(r1.xyz, r1.xyz);
		r3.y = inversesqrt(r3.y);
		r5 = (texture(resourceSamplerPair_5_ps, v1.v.zw));
		r4.y = min(r5.w, idx_uniforms1_ps.cb1[5].x);
		r4.y = saturate(r4.y * idx_uniforms1_ps.cb1[5].y);
		r6 = (texture(resourceSamplerPair_3_ps, v10.v.xy));
		r4.z = uintBitsToFloat(uint(0x3f800000));
		r5.xyz = r5.xyz * r6.xyz;
		r4.w = ((texture(resourceSamplerPair_3_ps, v10.v.zw))).w;
		r4.z = fma(r6.w, r4.z, float(0.750000000f));
		r5.w = r4.z * r4.w;
		r6.x = r4.y * float(0.699999988f);
		r4.z = fma(-r4.w, r4.z, float(0.100000001f));
		r4.z = fma(r6.x, r4.z, r5.w);
		r4.x = -r4.x + float(1.00000000f);
		r4.x = saturate(fma(-r4.x, idx_uniforms1_ps.cb1[6].x, r4.z));
		r4.x = r4.x * r4.y;
		r4.y = intBitsToFloat(float(0.00000000f) < idx_uniforms2_ps.cb2[1].w ? int(0xffffffff) : int(0x00000000));
		r4.z = r4.x * float(5.00000000f);
		r4.w = -r2.x + float(1.00000000f);
		r4.z = saturate(fma(r4.z, r4.w, r4.x));
		r4.x = uintBitsToFloat(movc(floatBitsToUint(r4.y), floatBitsToUint(r4.x), floatBitsToUint(r4.z)));
		r4.z = r4.x * float(3.00000000f);
		r4.x = fma(r4.x, float(-0.300000012f), float(0.800000012f));
		r4.y = uintBitsToFloat(movc(floatBitsToUint(r4.y), uint(0x3f800000), floatBitsToUint(r2.x)));
		r4.z = min(r4.z, float(1.00000000f));
		r4.w = fma(-r4.x, r4.y, float(1.00000000f));
		r4.z = r4.z / r4.w;
		r2.w = fma(-r4.x, r4.y, r2.w);
		r2.w = saturate(r4.z * r2.w);
		r4.xyz = fma(r5.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r0.xyz);
		r0.xyz = fma(r2.www, r4.xyz, r0.xyz);
		r4.x = r2.x;
		r4.yz = uintBitsToFloat(uvec2(0x3c23d70a, 0x3f000000));
		r4.xyz = -r2.xyz + r4.xyz;
		r2.xyz = fma(r2.www, r4.xyz, r2.xyz);
		r1.xyz = fma(r1.xyz, r3.yyy, -r3.xzw);
		r1.xyz = fma(r2.www, r1.xyz, r3.xzw);
		r2.w = dot(r1.xyz, r1.xyz);
		r2.w = inversesqrt(r2.w);
		r3.xzw = r1.xyz * r2.www;
		r4.yz = r2.yz;
	}
	else
	{
		r4.yz = r2.yz;
	}
	r1.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r1.x = fract(r1.x);
	r0.w = fma(r0.w, r1.w, -idx_uniforms2_ps.cb2[1].x);
	r1.y = fma(-idx_uniforms1_ps.cb1[0].w, v7.v.w, float(1.00000000f));
	r1.x = -r1.y + r1.x;
	r0.w = min(r0.w, r1.x);
	r0.w = intBitsToFloat(r0.w < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.w) != uint(0);
	r4.x = r2.x * idx_uniforms2_ps.cb2[1].y;
	r4.w = saturate(r2.x + idx_uniforms2_ps.cb2[1].w);
	o1.xyz = fma(r3.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r0.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2 = r4;
	PixelEpilog();
	return;
}

