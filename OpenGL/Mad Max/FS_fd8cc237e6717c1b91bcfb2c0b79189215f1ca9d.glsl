#version 460 core
// ps_5_0
// Checksum: 75c3409c_55899b08_be8e7210_09a765d6
// Name: particleeffectblendpixelshadowerosionnsprjfarcullingvolume

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 8) in idx_Varying8 { vec4 v; } v8;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[10]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2DArrayShadow resourceSamplerPair_1_ps; // res14, s13

uniform sampler2D resourceSamplerPair_2_ps; // res7, s7

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2


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
	r1 = (texture(resourceSamplerPair_0_ps, v2.v.xy));
	r1 = -r0 + r1;
	r0 = fma(v2.v.zzzz, r1, r0);
	r1 = v4.v.yyyy * idx_uniforms1_ps.cb1[6];
	r1 = fma(v4.v.xxxx, idx_uniforms1_ps.cb1[5], r1);
	r1 = fma(v4.v.zzzz, idx_uniforms1_ps.cb1[7], r1);
	r1 = r1 + idx_uniforms1_ps.cb1[8];
	r1.xyz = r1.xyz / r1.www;
	r1.xyz = abs(r1.xyz) + -idx_uniforms1_ps.cb1[9].xxx;
	r1.x = max(r1.y, r1.x);
	r1.x = max(r1.z, r1.x);
	r1.x = saturate(r1.x * idx_uniforms1_ps.cb1[9].y);
	r1.x = r0.w * r1.x;
	r1.zw = fma(v7.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r1.z = max(abs(r1.w), abs(r1.z));
	r1.w = intBitsToFloat(float(4.94999981f) >= r1.z ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r1.w) != uint(0))
	{
		r2.xy = fma(r0.xy, vec2(100.000000f, 100.000000f), v0.xy);
		r1.z = intBitsToFloat(r1.z < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
		r3.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.zzz), floatBitsToUint(v7.v.zxy), floatBitsToUint(v8.v.zxy)));
		r4.z = uintBitsToFloat(movc(floatBitsToUint(r1.z), uint(0x3f800000), uint(0x40000000)));
		r3.x = saturate(r3.x);
		r1.z = dot(r2.xy, vec2(0.467943996f, -0.703647971f));
		r1.w = dot(r2.xy, vec2(0.834930003f, -0.629559994f));
		r2 = fract(r1.zwwz);
		r2 = r2 + vec4(-0.500000000f, -0.500000000f, -0.500000000f, -0.500000000f);
		r5 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r3.yzyz);
		r4.xy = fma(r2.xz, vec2(0.00195312500f, 0.00195312500f), r5.xy);
		r6.x = texture(resourceSamplerPair_1_ps, vec4(r4.xyz, r3.x));
		r4.xy = fma(-r2.xy, vec2(0.00195312500f, 0.00195312500f), r5.zw);
		r6.y = texture(resourceSamplerPair_1_ps, vec4(r4.xyz, r3.x));
		r5 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r3.yzyz);
		r4.xy = fma(r2.zw, vec2(0.00195312500f, -0.00195312500f), r5.xy);
		r6.z = texture(resourceSamplerPair_1_ps, vec4(r4.xyz, r3.x));
		r4.xy = fma(-r2.zw, vec2(0.00195312500f, -0.00195312500f), r5.zw);
		r6.w = texture(resourceSamplerPair_1_ps, vec4(r4.xyz, r3.x));
		r1.z = dot(r6, vec4(0.250000000f, 0.250000000f, 0.250000000f, 0.250000000f));
	}
	else
	{
		r1.z = uintBitsToFloat(uint(0x3f800000));
	}
	r2.xyz = v4.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
	r1.w = fma(r1.x, float(-0.200000003f), float(1.00000000f));
	r3.xyz = r1.www * r2.xyz;
	r2.xyz = fma(r2.xyz, r1.www, idx_uniforms0_ps.cb0[5].xyz);
	r1.w = dot(r3.xyz, r3.xyz);
	r1.w = sqrt(r1.w);
	r1.w = r1.w * idx_uniforms1_ps.cb1[1].w;
	r1.w = r1.w * float(8.00000000f);
	r1.w = max(r1.w, float(1.00000000f));
	r1.w = min(r1.w, float(6.00000000f));
	r2.xz = r2.xz + idx_uniforms1_ps.cb1[1].yz;
	r3.x = r2.y * idx_uniforms0_ps.cb0[1].w;
	r3.y = r2.y * idx_uniforms0_ps.cb0[3].w;
	r2.xy = r2.xz + -r3.xy;
	r2.xy = r2.xy * idx_uniforms1_ps.cb1[1].ww;
	r1.w = ((textureLod(resourceSamplerPair_2_ps, r2.xy, r1.w))).w;
	r1.w = saturate(r1.w + idx_uniforms1_ps.cb1[1].x);
	r2.xyz = r1.zzz * v5.v.xyz;
	r2.xyz = fma(r2.xyz, r1.www, v6.v.xyz);
	r2.xyz = r2.xyz * v3.v.xyz;
	r1.y = v1.v.w;
	r0.w = ((texture(resourceSamplerPair_3_ps, r1.xy)).xzwy).w;
	r2.w = v3.v.w;
	r1 = r0 * r2;
	r0.w = v1.v.z * idx_uniforms1_ps.cb1[0].y;
	r0.xyz = fma(-r0.xyz, r2.xyz, idx_uniforms0_ps.cb0[13].xyz);
	o0.xyz = fma(r0.xyz, r0.www, r1.xyz);
	r0.x = fma(idx_uniforms4_ps.cb4[4].x, r1.w, idx_uniforms4_ps.cb4[4].y);
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	o0.w = r1.w;
	PixelEpilog();
	return;
}

