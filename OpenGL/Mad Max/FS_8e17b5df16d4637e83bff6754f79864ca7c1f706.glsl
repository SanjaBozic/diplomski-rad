#version 460 core
// ps_5_0
// Checksum: a51aeacf_0f4bebf4_d280207f_bf178d72
// Name: particleeffectpixelshadowerosionns

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
layout(location = 9) in idx_Varying9 { vec4 v; } v9;
layout(location = 10) in idx_Varying10 { vec4 v; } v10;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[11]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2DArrayShadow resourceSamplerPair_1_ps; // res14, s13

uniform sampler2D resourceSamplerPair_2_ps; // res7, s7

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2

uniform sampler2D resourceSamplerPair_4_ps; // res3, s3

uniform samplerCube resourceSamplerPair_5_ps; // res4, s4

uniform samplerCube resourceSamplerPair_6_ps; // res8, s8


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
	r1.xy = fma(v3.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r1.x = max(abs(r1.y), abs(r1.x));
	r1.y = intBitsToFloat(float(4.94999981f) >= r1.x ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r1.y) != uint(0))
	{
		r1.yz = fma(r0.xy, vec2(100.000000f, 100.000000f), v0.xy);
		r1.x = intBitsToFloat(r1.x < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
		r2.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), floatBitsToUint(v3.v.zxy), floatBitsToUint(v4.v.zxy)));
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
	r1.yzw = v5.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
	r2.x = fma(r0.w, float(-0.200000003f), float(1.00000000f));
	r2.yzw = r1.yzw * r2.xxx;
	r3.xyz = fma(r1.yzw, r2.xxx, idx_uniforms0_ps.cb0[5].xyz);
	r2.x = dot(r2.yzw, r2.yzw);
	r2.x = sqrt(r2.x);
	r2.x = r2.x * idx_uniforms1_ps.cb1[1].w;
	r2.x = r2.x * float(8.00000000f);
	r2.x = max(r2.x, float(1.00000000f));
	r2.x = min(r2.x, float(6.00000000f));
	r2.yz = r3.xz + idx_uniforms1_ps.cb1[1].yz;
	r4.x = r3.y * idx_uniforms0_ps.cb0[1].w;
	r4.y = r3.y * idx_uniforms0_ps.cb0[3].w;
	r2.yz = r2.yz + -r4.xy;
	r2.yz = r2.yz * idx_uniforms1_ps.cb1[1].ww;
	r2.x = ((textureLod(resourceSamplerPair_2_ps, r2.yz, r2.x)).wxyz).x;
	r2.x = saturate(r2.x + idx_uniforms1_ps.cb1[1].x);
	r1.x = r1.x * r2.x;
	r2.x = r0.w;
	r2.y = v1.v.w;
	r0.w = ((texture(resourceSamplerPair_3_ps, r2.xy)).xzwy).w;
	r2 = r0 * v2.v;
	r0.w = v1.v.z * idx_uniforms1_ps.cb1[0].y;
	r0.xyz = fma(-r0.xyz, v2.v.xyz, idx_uniforms0_ps.cb0[13].xyz);
	r0.xyz = fma(r0.xyz, r0.www, r2.xyz);
	r0.w = fma(r1.x, float(0.949999988f), float(0.0500000007f));
	r3 = (texture(resourceSamplerPair_4_ps, v1.v.xy));
	r2.xyz = fma(r3.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.x = dot(r1.yzw, r1.yzw);
	r1.x = inversesqrt(r1.x);
	r1.xyz = r1.xxx * r1.yzw;
	r4 = v8.v.zxyx * v10.v.yzxz;
	r4 = fma(v8.v.yzxz, v10.v.zxyx, -r4);
	r4 = r4 * v10.v.wwww;
	r5 = r4.zxwx * v8.v.yzxz;
	r5 = fma(r4.wzxz, v8.v.zxyx, -r5);
	r5 = r5 * v10.v.wwww;
	r4 = r2.yyyy * r4;
	r4 = fma(r2.xxxx, r5, r4);
	r4 = fma(r2.zzzz, v8.v.xyzy, r4);
	r1.w = dot(r4.xzw, r4.xzw);
	r1.w = inversesqrt(r1.w);
	r4 = r1.wwww * r4;
	r1.w = dot(r1.xzy, r4.xzw);
	r1.w = r1.w + r1.w;
	r2.xyz = fma(r4.xwz, -r1.www, r1.xyz);
	r1.w = dot(r4.xwz, v9.v.xyz);
	r3.x = saturate(r1.w + v9.v.w);
	r3.y = saturate(dot(r2.xyz, v9.v.xyz));
	r5.xy = r3.ww * idx_uniforms1_ps.cb1[2].yx;
	r3.z = r2.w * r5.x;
	r3.y = log2(r3.y);
	r3.y = r3.y * r5.y;
	r3.y = exp2(r3.y);
	r3.y = r3.z * r3.y;
	r1.w = saturate(r1.w);
	r1.w = r1.w * r3.y;
	r1.xyz = fma(r4.xyz, vec3(-0.400000006f, -0.400000006f, -0.400000006f), r1.xyz);
	r3.y = dot(r1.xyz, r1.xyz);
	r3.y = inversesqrt(r3.y);
	r1.xyz = r1.xyz * r3.yyy;
	r1.x = saturate(dot(r1.xyz, v9.v.xyz));
	r1.x = log2(r1.x);
	r1.x = r1.x * float(16.0000000f);
	r1.x = exp2(r1.x);
	r3.xyz = r3.xxx * v6.v.xyz;
	r1.xy = r0.ww * r1.xw;
	r4.xyz = r0.xyz + vec3(0.00999999978f, 0.00999999978f, 0.00999999978f);
	r1.z = fma(r4.w, float(0.500000000f), float(0.500000000f));
	r5.xyz = -idx_uniforms1_ps.cb1[3].xyz + idx_uniforms1_ps.cb1[4].xyz;
	r5.xyz = fma(r1.zzz, r5.xyz, idx_uniforms1_ps.cb1[3].xyz);
	r5.xyz = fma(r5.xyz, idx_uniforms1_ps.cb1[4].www, v7.v.xyz);
	r3.xyz = fma(r3.xyz, r0.www, r5.xyz);
	r5.xyz = ((textureLod(resourceSamplerPair_5_ps, r2.xyz, idx_uniforms1_ps.cb1[10].x))).xyz;
	r2.xyz = ((textureLod(resourceSamplerPair_6_ps, r2.xyz, idx_uniforms1_ps.cb1[10].x))).xyz;
	r2.xyz = -r5.xyz + r2.xyz;
	r2.xyz = fma(idx_uniforms1_ps.cb1[10].yyy, r2.xyz, r5.xyz);
	r2.xyz = r2.xyz * idx_uniforms1_ps.cb1[2].yyy;
	r2.xyz = r3.www * r2.xyz;
	r2.xyz = r2.xyz * idx_uniforms1_ps.cb1[3].www;
	r1.yzw = fma(r1.yyy, v6.v.xyz, r2.xyz);
	r0.xyz = fma(r0.xyz, r3.xyz, r1.yzw);
	r1.xyz = r1.xxx * r4.xyz;
	o0.xyz = fma(r1.xyz, v6.v.xyz, r0.xyz);
	r0.x = fma(idx_uniforms4_ps.cb4[4].x, r2.w, idx_uniforms4_ps.cb4[4].y);
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	o0.w = r2.w;
	PixelEpilog();
	return;
}

