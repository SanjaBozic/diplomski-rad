#version 460 core
// ps_5_0
// Checksum: 0850c3f9_e0f7d13e_a8ed1fd2_99e7e62d
// Name: particleeffectblendpixelshadowsoft

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
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[3]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2DArrayShadow resourceSamplerPair_1_ps; // res14, s13

uniform sampler2D resourceSamplerPair_2_ps; // res7, s7

uniform sampler2D resourceSamplerPair_3_ps; // res1, s1


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
	r1.xy = fma(v7.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r1.x = max(abs(r1.y), abs(r1.x));
	r1.y = intBitsToFloat(float(4.94999981f) >= r1.x ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r1.y) != uint(0))
	{
		r1.yz = fma(r0.xy, vec2(100.000000f, 100.000000f), v0.xy);
		r1.x = intBitsToFloat(r1.x < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
		r2.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), floatBitsToUint(v7.v.zxy), floatBitsToUint(v8.v.zxy)));
		r3.z = uintBitsToFloat(movc(floatBitsToUint(r1.x), uint(0x3f800000), uint(0x40000000)));
		r2.x = saturate(r2.x);
		r1.x = dot(r1.yz, vec2(0.467943996f, -0.703647971f));
		r1.y = dot(r1.yz, vec2(0.834930003f, -0.629559994f));
		r4 = fract(r1.xyyx);
		r1 = r4 + vec4(-0.500000000f, -0.500000000f, -0.500000000f, -0.500000000f);
		r4 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r2.yzyz);
		r3.xy = fma(r1.xz, vec2(0.00195312500f, 0.00195312500f), r4.xy);
		r5.x = texture(resourceSamplerPair_1_ps, vec4(r3.xyz, r2.x));
		r3.xy = fma(-r1.xy, vec2(0.00195312500f, 0.00195312500f), r4.zw);
		r5.y = texture(resourceSamplerPair_1_ps, vec4(r3.xyz, r2.x));
		r4 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r2.yzyz);
		r3.xy = fma(r1.zw, vec2(0.00195312500f, -0.00195312500f), r4.xy);
		r5.z = texture(resourceSamplerPair_1_ps, vec4(r3.xyz, r2.x));
		r3.xy = fma(-r1.zw, vec2(0.00195312500f, -0.00195312500f), r4.zw);
		r5.w = texture(resourceSamplerPair_1_ps, vec4(r3.xyz, r2.x));
		r1.x = dot(r5, vec4(0.250000000f, 0.250000000f, 0.250000000f, 0.250000000f));
	}
	else
	{
		r1.x = uintBitsToFloat(uint(0x3f800000));
	}
	r1.yzw = v4.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
	r2.x = fma(r0.w, float(-0.200000003f), float(1.00000000f));
	r2.yzw = r1.yzw * r2.xxx;
	r1.yzw = fma(r1.yzw, r2.xxx, idx_uniforms0_ps.cb0[5].xyz);
	r2.x = dot(r2.yzw, r2.yzw);
	r2.x = sqrt(r2.x);
	r2.x = r2.x * idx_uniforms1_ps.cb1[1].w;
	r2.x = r2.x * float(8.00000000f);
	r2.x = max(r2.x, float(1.00000000f));
	r2.x = min(r2.x, float(6.00000000f));
	r1.yw = r1.yw + idx_uniforms1_ps.cb1[1].yz;
	r3.x = r1.z * idx_uniforms0_ps.cb0[1].w;
	r3.y = r1.z * idx_uniforms0_ps.cb0[3].w;
	r1.yz = r1.yw + -r3.xy;
	r1.yz = r1.yz * idx_uniforms1_ps.cb1[1].ww;
	r1.y = ((textureLod(resourceSamplerPair_2_ps, r1.yz, r2.x)).xwyz).y;
	r1.y = saturate(r1.y + idx_uniforms1_ps.cb1[1].x);
	r1.xzw = r1.xxx * v5.v.xyz;
	r1.xyz = fma(r1.xzw, r1.yyy, v6.v.xyz);
	r1.xyz = r1.xyz * v3.v.xyz;
	r1.w = v3.v.w;
	r2 = r0 * r1;
	r0.w = v1.v.z * idx_uniforms1_ps.cb1[0].y;
	r0.xyz = fma(-r0.xyz, r1.xyz, idx_uniforms0_ps.cb0[13].xyz);
	o0.xyz = fma(r0.xyz, r0.www, r2.xyz);
	r0.xy = v0.xy * idx_uniforms1_ps.cb1[2].zw;
	r0.x = ((texture(resourceSamplerPair_3_ps, r0.xy))).x;
	r0.x = v0.z / r0.x;
	r0.x = saturate(fma(r0.x, idx_uniforms1_ps.cb1[0].z, -idx_uniforms1_ps.cb1[0].z));
	r0.x = r0.x * r2.w;
	r0.y = fma(idx_uniforms4_ps.cb4[4].x, r0.x, idx_uniforms4_ps.cb4[4].y);
	r0.y = intBitsToFloat(r0.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.y) != uint(0);
	o0.w = r0.x;
	PixelEpilog();
	return;
}

