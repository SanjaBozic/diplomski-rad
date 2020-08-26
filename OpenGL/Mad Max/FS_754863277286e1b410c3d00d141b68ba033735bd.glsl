#version 460 core
// ps_5_0
// Checksum: dbb3e9b7_6114b966_5e538643_9325abb5
// Name: window

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
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[3]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res2, s2

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res1, s1

uniform sampler2DArrayShadow resourceSamplerPair_4_ps; // res14, s13

uniform samplerCube resourceSamplerPair_5_ps; // res5, s5

uniform samplerCube resourceSamplerPair_6_ps; // res6, s6

uniform sampler2D resourceSamplerPair_7_ps; // res9, s9

uniform sampler2D resourceSamplerPair_8_ps; // res4, s4


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
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r2.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.zw))).xyz;
	r3.xyz = ((texture(resourceSamplerPair_3_ps, v1.v.xy)).xywz).xyz;
	r3.yzw = fma(r3.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r3.x = r3.w * r3.y;
	r1.w = dot(r3.xz, r3.xz);
	r1.w = -r1.w + float(1.00000000f);
	r1.w = max(r1.w, float(0.00000000f));
	r1.w = sqrt(r1.w);
	r0.xyz = r0.xyz * v9.v.xyz;
	r3.yw = fma(v2.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r2.w = max(abs(r3.w), abs(r3.y));
	r3.y = intBitsToFloat(float(4.94999981f) >= r2.w ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r3.y) != uint(0))
	{
		r2.w = intBitsToFloat(r2.w < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
		r4.xyz = uintBitsToFloat(movc(floatBitsToUint(r2.www), floatBitsToUint(v2.v.zxy), floatBitsToUint(v3.v.zxy)));
		r5.z = uintBitsToFloat(movc(floatBitsToUint(r2.w), uint(0x3f800000), uint(0x40000000)));
		r4.x = saturate(r4.x);
		r2.w = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
		r3.y = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
		r6.xw = fract(r2.ww);
		r6.yz = fract(r3.yy);
		r6 = r6 + vec4(-0.500000000f, -0.500000000f, -0.500000000f, -0.500000000f);
		r7 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r4.yzyz);
		r5.xy = fma(r6.xz, vec2(0.00195312500f, 0.00195312500f), r7.xy);
		r8.x = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r5.xy = fma(-r6.xy, vec2(0.00195312500f, 0.00195312500f), r7.zw);
		r8.y = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r7 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r4.yzyz);
		r5.xy = fma(r6.zw, vec2(0.00195312500f, -0.00195312500f), r7.xy);
		r8.z = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r5.xy = fma(-r6.zw, vec2(0.00195312500f, -0.00195312500f), r7.zw);
		r8.w = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r2.w = dot(r8, vec4(0.250000000f, 0.250000000f, 0.250000000f, 0.250000000f));
	}
	else
	{
		r2.w = uintBitsToFloat(uint(0x3f800000));
	}
	r3.y = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r4.xyz = r3.yyy * v7.v.xyz;
	r3.y = dot(r4.xyz, r4.xyz);
	r3.y = inversesqrt(r3.y);
	r4.xyz = r3.yyy * r4.xyz;
	r3.y = dot(v5.v.xyz, v5.v.xyz);
	r3.y = inversesqrt(r3.y);
	r5.xyz = r3.yyy * v5.v.xyz;
	r3.y = dot(v6.v.xyz, v6.v.xyz);
	r3.y = inversesqrt(r3.y);
	r6.xyz = r3.yyy * v6.v.xyz;
	r6.xyz = r3.zzz * r6.xyz;
	r5.xyz = fma(r5.xyz, r3.xxx, r6.xyz);
	r4.xyz = fma(r4.xyz, r1.www, r5.xyz);
	r1.w = dot(r4.xyz, r4.xyz);
	r1.w = inversesqrt(r1.w);
	r4.xyz = r1.www * r4.xyz;
	r5.xyz = -v4.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r1.w = dot(r5.xyz, r5.xyz);
	r1.w = inversesqrt(r1.w);
	r6.xyz = r1.www * r5.xyz;
	r3.y = dot(-r6.xyz, r4.xyz);
	r3.y = r3.y + r3.y;
	r7.xyz = fma(r4.xyz, -r3.yyy, -r6.xyz);
	r8.xyz = ((textureLod(resourceSamplerPair_5_ps, r7.xyz, idx_uniforms1_ps.cb1[2].y))).xyz;
	r7.xyz = ((textureLod(resourceSamplerPair_6_ps, r7.xyz, idx_uniforms1_ps.cb1[2].y))).xyz;
	r7.xyz = -r8.xyz + r7.xyz;
	r7.xyz = fma(idx_uniforms1_ps.cb1[1].www, r7.xyz, r8.xyz);
	r7.xyz = r7.xyz * idx_uniforms1_ps.cb1[1].zzz;
	r3.y = saturate(fma(r4.y, float(0.500000000f), float(0.500000000f)));
	r8.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
	r8.xyz = fma(r3.yyy, r8.xyz, idx_uniforms0_ps.cb0[11].xyz);
	r3.y = saturate(dot(r4.xyz, -idx_uniforms0_ps.cb0[3].xyz));
	r2.w = r2.w * r3.y;
	r8.xyz = fma(r2.www, idx_uniforms0_ps.cb0[2].xyz, r8.xyz);
	r8.xyz = r8.xyz + idx_uniforms1_ps.cb1[0].zzz;
	r3.y = saturate(dot(r4.xyz, r6.xyz));
	r3.y = -r3.y + float(1.00000000f);
	r3.w = r3.y * r3.y;
	r6.x = v5.v.w;
	r6.y = v6.v.w;
	r6.zw = v8.v.xy * idx_uniforms1_ps.cb1[2].xx;
	r6 = r6 / v7.v.wwww;
	r3.xz = r3.xz + -r6.zw;
	r3.xz = r3.xz * idx_uniforms1_ps.cb1[0].ww;
	r4.w = fma(r3.w, float(8.00000000f), float(1.00000000f));
	r3.xz = saturate(fma(r3.xz, r4.ww, r6.xy));
	r3.xz = r3.xz * idx_uniforms1_ps.cb1[1].xy;
	r9 = (textureGather(resourceSamplerPair_7_ps, r3.xz, 0));
	r9 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(lessThan(v0.zzzz, r9))));
	r6.zw = uintBitsToFloat(floatBitsToUint(r9.zw) | floatBitsToUint(r9.xy));
	r4.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r6.z));
	r6.xy = r6.xy * idx_uniforms1_ps.cb1[1].xy;
	r3.xz = uintBitsToFloat(movc(floatBitsToUint(r4.ww), floatBitsToUint(r6.xy), floatBitsToUint(r3.xz)));
	r6.xyz = ((texture(resourceSamplerPair_8_ps, r3.xz))).xyz;
	r5.xyz = fma(r5.xyz, r1.www, -idx_uniforms0_ps.cb0[3].xyz);
	r1.w = dot(r5.xyz, r5.xyz);
	r1.w = inversesqrt(r1.w);
	r5.xyz = r1.www * r5.xyz;
	r1.w = dot(r5.xyz, r4.xyz);
	r1.w = max(r1.w, float(0.00100000005f));
	r1.w = log2(r1.w);
	r1.w = r1.w * idx_uniforms1_ps.cb1[0].x;
	r1.w = exp2(r1.w);
	r1.w = r2.w * r1.w;
	r1.y = r1.w * r1.y;
	r0.xyz = r0.xyz * r8.xyz;
	r2.xyz = r2.xyz * r6.xyz;
	r1.w = idx_uniforms1_ps.cb1[0].z + float(1.00000000f);
	r2.w = fma(-r3.w, float(0.300000012f), float(1.00000000f));
	r1.z = r1.z * r2.w;
	r2.xyz = fma(r2.xyz, r1.www, -r0.xyz);
	r0.xyz = fma(r1.zzz, r2.xyz, r0.xyz);
	r1.z = fma(r3.y, r3.y, float(0.200000003f));
	r1.z = min(r1.z, float(1.00000000f));
	r1.x = r1.z * r1.x;
	r1.z = dot(r0.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r1.w = dot(r7.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r2.xyz = r7.xyz * r1.www;
	r2.xyz = fma(r1.zzz, r0.xyz, r2.xyz);
	r1.z = r1.w + r1.z;
	r2.xyz = r2.xyz / r1.zzz;
	r2.xyz = -r0.xyz + r2.xyz;
	r0.xyz = fma(r1.xxx, r2.xyz, r0.xyz);
	r0.xyz = fma(idx_uniforms0_ps.cb0[1].xyz, r1.yyy, r0.xyz);
	r1.x = r0.w * idx_uniforms1_ps.cb1[0].y;
	r0.w = fma(r0.w, idx_uniforms1_ps.cb1[0].y, float(-0.00999999978f));
	r0.w = intBitsToFloat(r0.w < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.w) != uint(0);
	r2.x = uintBitsToFloat(uint(0x3f800000));
	r2.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r2 = r2 * -v4.v.wwww;
	r2 = exp2(r2);
	r2 = min(r2, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = -r2.x + float(1.00000000f);
	r1.yzw = r0.www * idx_uniforms0_ps.cb0[13].xyz;
	o0.xyz = fma(r0.xyz, r2.yzw, r1.yzw);
	o0.w = r1.x;
	PixelEpilog();
	return;
}

