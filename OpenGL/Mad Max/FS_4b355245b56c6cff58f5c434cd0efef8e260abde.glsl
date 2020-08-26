#version 460 core
// ps_5_0
// Checksum: 9dd34c29_72c6a1f2_41a2b091_d7a2d099
// Name: characterhair

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
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15;
vec4 x0[3];

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[4]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[40]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[6]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res2, s2

uniform sampler2D resourceSamplerPair_2_ps; // res1, s1

uniform sampler2DArrayShadow resourceSamplerPair_3_ps; // res14, s13

uniform sampler2D resourceSamplerPair_4_ps; // res6, s6

uniform sampler2D resourceSamplerPair_5_ps; // res5, s5

uniform sampler2D resourceSamplerPair_6_ps; // res3, s3

uniform sampler2D resourceSamplerPair_7_ps; // res4, s4

uniform sampler2D resourceSamplerPair_8_ps; // res8, s8

uniform sampler2D resourceSamplerPair_9_ps; // res13, s-1

uniform samplerCube resourceSamplerPair_10_ps; // res7, s7


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

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r0.w = saturate(r0.w * idx_uniforms2_ps.cb2[5].x);
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r1.w = intBitsToFloat(idx_uniforms1_ps.cb1[1].z == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r2.xy = uintBitsToFloat(movc(floatBitsToUint(r1.ww), floatBitsToUint(v1.v.xy), floatBitsToUint(v1.v.zw)));
	r2.xyz = ((texture(resourceSamplerPair_2_ps, r2.xy)).xywz).xyz;
	r2.yzw = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.x = r2.w * r2.y;
	r1.w = dot(r2.xz, r2.xz);
	r1.w = -r1.w + float(1.00000000f);
	r1.w = max(r1.w, float(0.00000000f));
	r1.w = sqrt(r1.w);
	r2.y = dot(v2.v.xyz, v2.v.xyz);
	r2.y = inversesqrt(r2.y);
	r3.xyz = r2.yyy * v2.v.xyz;
	r2.y = dot(v3.v.xyz, v3.v.xyz);
	r2.y = inversesqrt(r2.y);
	r4.xyz = r2.yyy * v3.v.xyz;
	r2.yzw = r2.zzz * r4.xyz;
	r2.xyz = fma(r3.xyz, r2.xxx, r2.yzw);
	r2.w = dot(v4.v.xyz, v4.v.xyz);
	r2.w = inversesqrt(r2.w);
	r3.xyz = r2.www * v4.v.xyz;
	r2.xyz = fma(r3.xyz, r1.www, r2.xyz);
	if (floatBitsToUint(idx_uniforms4_ps.cb4[3].x) != uint(0))
	{
		r3.xy = fma(v6.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r1.w = max(abs(r3.y), abs(r3.x));
		r2.w = intBitsToFloat(float(4.94999981f) >= r1.w ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r2.w) != uint(0))
		{
			r1.w = intBitsToFloat(r1.w < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
			r3.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.www), floatBitsToUint(v6.v.zxy), floatBitsToUint(v7.v.zxy)));
			r5.z = uintBitsToFloat(movc(floatBitsToUint(r1.w), uint(0x3f800000), uint(0x40000000)));
			r3.x = saturate(r3.x);
			r1.w = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
			r2.w = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
			r6.xw = fract(r1.ww);
			r6.yz = fract(r2.ww);
			r6 = r6 + vec4(-0.500000000f, -0.500000000f, -0.500000000f, -0.500000000f);
			r7 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r3.yzyz);
			r5.xy = fma(r6.xz, vec2(0.00195312500f, 0.00195312500f), r7.xy);
			r8.x = texture(resourceSamplerPair_3_ps, vec4(r5.xyz, r3.x));
			r5.xy = fma(-r6.xy, vec2(0.00195312500f, 0.00195312500f), r7.zw);
			r8.y = texture(resourceSamplerPair_3_ps, vec4(r5.xyz, r3.x));
			r7 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r3.yzyz);
			r5.xy = fma(r6.zw, vec2(0.00195312500f, -0.00195312500f), r7.xy);
			r8.z = texture(resourceSamplerPair_3_ps, vec4(r5.xyz, r3.x));
			r5.xy = fma(-r6.zw, vec2(0.00195312500f, -0.00195312500f), r7.zw);
			r8.w = texture(resourceSamplerPair_3_ps, vec4(r5.xyz, r3.x));
			r1.w = dot(r8, vec4(0.250000000f, 0.250000000f, 0.250000000f, 0.250000000f));
		}
		else
		{
			r1.w = uintBitsToFloat(uint(0x3f800000));
		}
	}
	else
	{
		r1.w = uintBitsToFloat(uint(0x3f800000));
	}
	r3.xy = v5.v.xz + idx_uniforms2_ps.cb2[0].xy;
	r5.x = v5.v.y * idx_uniforms0_ps.cb0[1].w;
	r5.y = v5.v.y * idx_uniforms0_ps.cb0[3].w;
	r3.xy = r3.xy + -r5.xy;
	r3.xy = r3.xy * idx_uniforms2_ps.cb2[0].zz;
	r2.w = ((texture(resourceSamplerPair_4_ps, r3.xy))).w;
	r2.w = saturate(r2.w + idx_uniforms2_ps.cb2[0].w);
	r1.w = r1.w * r2.w;
	r3.xyz = -v5.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r2.w = dot(r3.xyz, r3.xyz);
	r2.w = inversesqrt(r2.w);
	r3.w = saturate(fma(r2.y, float(0.500000000f), float(0.500000000f)));
	r5.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
	r5.xyz = fma(r3.www, r5.xyz, idx_uniforms0_ps.cb0[11].xyz);
	r6.xyz = fma(r3.xyz, r2.www, -idx_uniforms0_ps.cb0[3].xyz);
	r3.w = dot(r6.xyz, r6.xyz);
	r3.w = inversesqrt(r3.w);
	r6.xyz = r3.www * r6.xyz;
	r3.w = dot(-idx_uniforms0_ps.cb0[3].xyz, r2.xyz);
	r3.w = r3.w + float(0.500000000f);
	r3.w = saturate(r3.w * float(0.666666687f));
	r4.w = r1.w * r3.w;
	r7.xyz = r4.www * idx_uniforms0_ps.cb0[2].xyz;
	r8.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r4.w = ((texture(resourceSamplerPair_5_ps, r8.xy))).w;
	r5.w = v8.v.w + float(-1.00000000f);
	r8 = fma(idx_uniforms2_ps.cb2[4], r5.wwww, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r5.w = r1.x * float(4.00000000f);
	r1.y = r1.y + idx_uniforms2_ps.cb2[5].z;
	r9.xyz = r8.zzz * v8.v.xyz;
	r7.xyz = fma(r7.xyz, r8.yyy, r9.xyz);
	r5.xyz = r5.xyz * r8.xxx;
	r6.w = r1.y + idx_uniforms2_ps.cb2[5].y;
	r9.xyz = fma(r6.www, r2.xyz, r4.xyz);
	r6.w = dot(r9.xyz, r9.xyz);
	r6.w = inversesqrt(r6.w);
	r9.xyz = r6.www * r9.xyz;
	r1.y = -r1.y + idx_uniforms2_ps.cb2[5].y;
	r4.xyz = fma(r1.yyy, r2.xyz, r4.xyz);
	r1.y = dot(r4.xyz, r4.xyz);
	r1.y = inversesqrt(r1.y);
	r4.xyz = r1.yyy * r4.xyz;
	r10.xyz = v5.v.xyz + -idx_uniforms0_ps.cb0[4].xyz;
	r11.xyz = fma(idx_uniforms1_ps.cb1[20].xyw, r10.xxx, idx_uniforms1_ps.cb1[23].xyw);
	r11.xyz = fma(idx_uniforms1_ps.cb1[21].xyw, r10.yyy, r11.xyz);
	r11.xyz = fma(idx_uniforms1_ps.cb1[22].xyw, r10.zzz, r11.xyz);
	r11.xy = r11.xy / r11.zz;
	r12.xyz = fma(idx_uniforms1_ps.cb1[24].xyw, r10.xxx, idx_uniforms1_ps.cb1[27].xyw);
	r12.xyz = fma(idx_uniforms1_ps.cb1[25].xyw, r10.yyy, r12.xyz);
	r12.xyz = fma(idx_uniforms1_ps.cb1[26].xyw, r10.zzz, r12.xyz);
	r11.zw = r12.xy / r12.zz;
	r12.xyz = fma(idx_uniforms1_ps.cb1[28].xyw, r10.xxx, idx_uniforms1_ps.cb1[31].xyw);
	r12.xyz = fma(idx_uniforms1_ps.cb1[29].xyw, r10.yyy, r12.xyz);
	r12.xyz = fma(idx_uniforms1_ps.cb1[30].xyw, r10.zzz, r12.xyz);
	r12.xy = r12.xy / r12.zz;
	r13.xyz = ((textureLod(resourceSamplerPair_6_ps, r11.xy, float(0.00000000f)))).xyz;
	x0[0].xyz = r13.xyz;
	r11.xyz = ((textureLod(resourceSamplerPair_7_ps, r11.zw, float(0.00000000f)))).xyz;
	r12.xyz = ((textureLod(resourceSamplerPair_8_ps, r12.xy, float(0.00000000f)))).xyz;
	r14 = fma(idx_uniforms1_ps.cb1[32], r10.xxxx, idx_uniforms1_ps.cb1[35]);
	r14 = fma(idx_uniforms1_ps.cb1[33], r10.yyyy, r14);
	r10 = fma(idx_uniforms1_ps.cb1[34], r10.zzzz, r14);
	r1.y = intBitsToFloat(float(0.00000000f) < idx_uniforms1_ps.cb1[36].x ? int(0xffffffff) : int(0x00000000));
	r6.w = intBitsToFloat(float(0.00000000f) < r10.w ? int(0xffffffff) : int(0x00000000));
	r1.y = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r6.w));
	if (floatBitsToUint(r1.y) != uint(0))
	{
		r10.xyz = r10.xyz / r10.www;
		r10.xy = r10.xy / idx_uniforms0_ps.cb0[4].ww;
		r10.xy = r10.xy + vec2(-0.500000000f, -0.500000000f);
		r14.xy = intBitsToFloat(ivec2(r10.xy));
		r14.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r15.x = ((texelFetchOffset(resourceSamplerPair_9_ps, floatBitsToInt(r14.xy), int(floatBitsToInt(r14.w)), ivec2(0, 0)))).x;
		r15.y = ((texelFetchOffset(resourceSamplerPair_9_ps, floatBitsToInt(r14.xy), int(floatBitsToInt(r14.w)), ivec2(1, 0))).yxzw).y;
		r15.z = ((texelFetchOffset(resourceSamplerPair_9_ps, floatBitsToInt(r14.xy), int(floatBitsToInt(r14.w)), ivec2(0, 1))).yzxw).z;
		r15.w = ((texelFetchOffset(resourceSamplerPair_9_ps, floatBitsToInt(r14.xy), int(floatBitsToInt(r14.w)), ivec2(1, 1))).yzwx).w;
		r14.xy = fract(r10.xy);
		r14.zw = -r14.xy + vec2(1.00000000f, 1.00000000f);
		r14 = r14.wwyy * r14.zxzx;
		r10 = -r10.zzzz + r15;
		r10 = saturate(fma(r10, vec4(500.000000f, 500.000000f, 500.000000f, 500.000000f), vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f)));
		r1.y = dot(r14, r10);
		r10.xyz = r1.yyy * r13.xyz;
		x0[0].xyz = r10.xyz;
	}
	r10.xyz = -v5.v.xyz + idx_uniforms1_ps.cb1[8].xyz;
	r1.y = dot(r10.xyz, r10.xyz);
	r6.w = sqrt(r1.y);
	r1.y = inversesqrt(r1.y);
	r10.xyz = r1.yyy * r10.xyz;
	r1.y = r6.w + -idx_uniforms1_ps.cb1[11].w;
	r7.w = idx_uniforms1_ps.cb1[8].w + -idx_uniforms1_ps.cb1[11].w;
	r7.w = max(r7.w, float(9.99999975e-06f));
	r1.y = saturate(r1.y / r7.w);
	r1.y = r1.y + float(-1.00000000f);
	r1.y = fma(-r1.y, r1.y, float(1.00000000f));
	r1.y = sqrt(r1.y);
	r1.y = -r1.y + float(1.00000000f);
	r7.w = dot(-r10.xyz, idx_uniforms1_ps.cb1[10].xyz);
	r7.w = saturate(fma(r7.w, idx_uniforms1_ps.cb1[9].w, idx_uniforms1_ps.cb1[10].w));
	r6.w = saturate(fma(r6.w, float(4.00000000f), float(-1.60000002f)));
	r6.w = r6.w * r7.w;
	r6.w = r6.w * r6.w;
	r1.y = r1.y * r6.w;
	r13.xyz = x0[0].xyz;
	r13.xyz = r1.yyy * r13.xyz;
	r1.y = dot(r10.xyz, r2.xyz);
	r1.y = r1.y + float(0.500000000f);
	r1.y = saturate(r1.y * float(0.666666687f));
	r10.xyz = fma(r3.xyz, r2.www, r10.xyz);
	r6.w = dot(r10.xyz, r10.xyz);
	r6.w = inversesqrt(r6.w);
	r10.xyz = r6.www * r10.xyz;
	r6.w = dot(r9.xyz, r10.xyz);
	r6.w = fma(-r6.w, r6.w, float(1.00000000f));
	r6.w = max(r6.w, float(0.00000000f));
	r7.w = idx_uniforms2_ps.cb2[1].w * float(0.500000000f);
	r8.z = fma(idx_uniforms2_ps.cb2[1].w, float(0.500000000f), float(8.00000000f));
	r8.z = r8.z * float(0.0398089178f);
	r6.w = log2(r6.w);
	r6.w = r6.w * r7.w;
	r6.w = exp2(r6.w);
	r6.w = min(r6.w, float(1.00000000f));
	r6.w = r8.z * r6.w;
	r9.w = dot(r4.xyz, r10.xyz);
	r9.w = fma(-r9.w, r9.w, float(1.00000000f));
	r9.w = max(r9.w, float(0.00000000f));
	r10.x = idx_uniforms2_ps.cb2[1].w + float(8.00000000f);
	r10.x = r10.x * float(0.0398089178f);
	r9.w = log2(r9.w);
	r9.w = r9.w * idx_uniforms2_ps.cb2[1].w;
	r9.w = exp2(r9.w);
	r9.w = min(r9.w, float(1.00000000f));
	r9.w = r10.x * r9.w;
	r9.w = r1.z * r9.w;
	r10.yzw = r9.www * idx_uniforms2_ps.cb2[2].xyz;
	r10.yzw = fma(r6.www, idx_uniforms2_ps.cb2[1].xyz, r10.yzw);
	r10.yzw = r1.yyy * r10.yzw;
	r10.yzw = r10.yzw * idx_uniforms1_ps.cb1[9].xyz;
	r10.yzw = r13.xyz * r10.yzw;
	r13.xyz = r13.xyz * idx_uniforms1_ps.cb1[9].xyz;
	r14.xyz = r1.yyy * r13.xyz;
	r15.xyz = -v5.v.xyz + idx_uniforms1_ps.cb1[12].xyz;
	r1.y = dot(r15.xyz, r15.xyz);
	r6.w = sqrt(r1.y);
	r1.y = inversesqrt(r1.y);
	r15.xyz = r1.yyy * r15.xyz;
	r1.y = r6.w + -idx_uniforms1_ps.cb1[15].w;
	r9.w = idx_uniforms1_ps.cb1[12].w + -idx_uniforms1_ps.cb1[15].w;
	r9.w = max(r9.w, float(9.99999975e-06f));
	r1.y = saturate(r1.y / r9.w);
	r1.y = r1.y + float(-1.00000000f);
	r1.y = fma(-r1.y, r1.y, float(1.00000000f));
	r1.y = sqrt(r1.y);
	r1.y = -r1.y + float(1.00000000f);
	r9.w = dot(-r15.xyz, idx_uniforms1_ps.cb1[14].xyz);
	r9.w = saturate(fma(r9.w, idx_uniforms1_ps.cb1[13].w, idx_uniforms1_ps.cb1[14].w));
	r6.w = saturate(fma(r6.w, float(4.00000000f), float(-1.60000002f)));
	r6.w = r6.w * r9.w;
	r6.w = r6.w * r6.w;
	r1.y = r1.y * r6.w;
	r11.xyz = r11.xyz * r1.yyy;
	r1.y = dot(r15.xyz, r2.xyz);
	r1.y = r1.y + float(0.500000000f);
	r1.y = saturate(r1.y * float(0.666666687f));
	r15.xyz = fma(r3.xyz, r2.www, r15.xyz);
	r6.w = dot(r15.xyz, r15.xyz);
	r6.w = inversesqrt(r6.w);
	r15.xyz = r6.www * r15.xyz;
	r6.w = dot(r9.xyz, r15.xyz);
	r6.w = fma(-r6.w, r6.w, float(1.00000000f));
	r6.w = max(r6.w, float(0.00000000f));
	r6.w = log2(r6.w);
	r6.w = r6.w * r7.w;
	r6.w = exp2(r6.w);
	r6.w = min(r6.w, float(1.00000000f));
	r6.w = r8.z * r6.w;
	r9.w = dot(r4.xyz, r15.xyz);
	r9.w = fma(-r9.w, r9.w, float(1.00000000f));
	r9.w = max(r9.w, float(0.00000000f));
	r9.w = log2(r9.w);
	r9.w = r9.w * idx_uniforms2_ps.cb2[1].w;
	r9.w = exp2(r9.w);
	r9.w = min(r9.w, float(1.00000000f));
	r9.w = r10.x * r9.w;
	r9.w = r1.z * r9.w;
	r15.xyz = r9.www * idx_uniforms2_ps.cb2[2].xyz;
	r15.xyz = fma(r6.www, idx_uniforms2_ps.cb2[1].xyz, r15.xyz);
	r15.xyz = r1.yyy * r15.xyz;
	r15.xyz = r15.xyz * idx_uniforms1_ps.cb1[13].xyz;
	r15.xyz = r11.xyz * r15.xyz;
	r15.xyz = r15.xyz * idx_uniforms1_ps.cb1[15].zzz;
	r10.yzw = fma(r10.yzw, idx_uniforms1_ps.cb1[11].zzz, r15.xyz);
	r11.xyz = r11.xyz * idx_uniforms1_ps.cb1[13].xyz;
	r15.xyz = r1.yyy * r11.xyz;
	r15.xyz = r15.xyz * idx_uniforms1_ps.cb1[15].xxx;
	r14.xyz = fma(r14.xyz, idx_uniforms1_ps.cb1[11].xxx, r15.xyz);
	r11.xyz = r11.xyz * idx_uniforms1_ps.cb1[15].yyy;
	r11.xyz = fma(r13.xyz, idx_uniforms1_ps.cb1[11].yyy, r11.xyz);
	r13.xyz = -v5.v.xyz + idx_uniforms1_ps.cb1[16].xyz;
	r1.y = dot(r13.xyz, r13.xyz);
	r6.w = sqrt(r1.y);
	r1.y = inversesqrt(r1.y);
	r13.xyz = r1.yyy * r13.xyz;
	r1.y = r6.w + -idx_uniforms1_ps.cb1[19].w;
	r9.w = idx_uniforms1_ps.cb1[16].w + -idx_uniforms1_ps.cb1[19].w;
	r9.w = max(r9.w, float(9.99999975e-06f));
	r1.y = saturate(r1.y / r9.w);
	r1.y = r1.y + float(-1.00000000f);
	r1.y = fma(-r1.y, r1.y, float(1.00000000f));
	r1.y = sqrt(r1.y);
	r1.y = -r1.y + float(1.00000000f);
	r9.w = dot(-r13.xyz, idx_uniforms1_ps.cb1[18].xyz);
	r9.w = saturate(fma(r9.w, idx_uniforms1_ps.cb1[17].w, idx_uniforms1_ps.cb1[18].w));
	r6.w = saturate(fma(r6.w, float(4.00000000f), float(-1.60000002f)));
	r6.w = r6.w * r9.w;
	r6.w = r6.w * r6.w;
	r1.y = r1.y * r6.w;
	r12.xyz = r12.xyz * r1.yyy;
	r1.y = dot(r13.xyz, r2.xyz);
	r1.y = r1.y + float(0.500000000f);
	r1.y = saturate(r1.y * float(0.666666687f));
	r13.xyz = fma(r3.xyz, r2.www, r13.xyz);
	r6.w = dot(r13.xyz, r13.xyz);
	r6.w = inversesqrt(r6.w);
	r13.xyz = r6.www * r13.xyz;
	r6.w = dot(r9.xyz, r13.xyz);
	r6.w = fma(-r6.w, r6.w, float(1.00000000f));
	r6.w = max(r6.w, float(0.00000000f));
	r6.w = log2(r6.w);
	r6.w = r6.w * r7.w;
	r6.w = exp2(r6.w);
	r6.w = min(r6.w, float(1.00000000f));
	r6.w = r8.z * r6.w;
	r8.z = dot(r4.xyz, r13.xyz);
	r8.z = fma(-r8.z, r8.z, float(1.00000000f));
	r8.z = max(r8.z, float(0.00000000f));
	r8.z = log2(r8.z);
	r8.z = r8.z * idx_uniforms2_ps.cb2[1].w;
	r8.z = exp2(r8.z);
	r8.z = min(r8.z, float(1.00000000f));
	r8.z = r10.x * r8.z;
	r8.z = r1.z * r8.z;
	r13.xyz = r8.zzz * idx_uniforms2_ps.cb2[2].xyz;
	r13.xyz = fma(r6.www, idx_uniforms2_ps.cb2[1].xyz, r13.xyz);
	r13.xyz = r1.yyy * r13.xyz;
	r13.xyz = r13.xyz * idx_uniforms1_ps.cb1[17].xyz;
	r13.xyz = r12.xyz * r13.xyz;
	r10.xyz = fma(r13.xyz, idx_uniforms1_ps.cb1[19].zzz, r10.yzw);
	r12.xyz = r12.xyz * idx_uniforms1_ps.cb1[17].xyz;
	r13.xyz = r1.yyy * r12.xyz;
	r13.xyz = fma(r13.xyz, idx_uniforms1_ps.cb1[19].xxx, r14.xyz);
	r11.xyz = fma(r12.xyz, idx_uniforms1_ps.cb1[19].yyy, r11.xyz);
	r12.xyz = -v5.v.xyz + idx_uniforms1_ps.cb1[2].xyz;
	r1.y = dot(r12.xyz, r12.xyz);
	r6.w = inversesqrt(r1.y);
	r12.xyz = r6.www * r12.xyz;
	r14.xyz = r12.yyy * idx_uniforms1_ps.cb1[38].xyz;
	r14.xyz = fma(idx_uniforms1_ps.cb1[37].xyz, r12.xxx, r14.xyz);
	r14.xyz = fma(idx_uniforms1_ps.cb1[39].xyz, r12.zzz, r14.xyz);
	r14.xyz = ((textureLod(resourceSamplerPair_10_ps, r14.xyz, float(0.00000000f)))).xyz;
	r1.y = sqrt(r1.y);
	r1.y = r1.y + -idx_uniforms1_ps.cb1[3].w;
	r6.w = idx_uniforms1_ps.cb1[2].w + -idx_uniforms1_ps.cb1[3].w;
	r6.w = max(r6.w, float(9.99999994e-09f));
	r1.y = saturate(r1.y / r6.w);
	r1.y = r1.y + float(-1.00000000f);
	r1.y = fma(-r1.y, r1.y, float(1.00000000f));
	r1.y = sqrt(r1.y);
	r1.y = -r1.y + float(1.00000000f);
	r14.xyz = r14.xyz * r1.yyy;
	r1.y = dot(r12.xyz, r2.xyz);
	r1.y = r1.y + float(0.500000000f);
	r1.y = saturate(r1.y * float(0.666666687f));
	r12.xyz = fma(r3.xyz, r2.www, r12.xyz);
	r6.w = dot(r12.xyz, r12.xyz);
	r6.w = inversesqrt(r6.w);
	r12.xyz = r6.www * r12.xyz;
	r6.w = dot(r9.xyz, r12.xyz);
	r6.w = fma(-r6.w, r6.w, float(1.00000000f));
	r6.w = max(r6.w, float(0.00000000f));
	r6.w = log2(r6.w);
	r6.w = r6.w * r7.w;
	r6.w = exp2(r6.w);
	r6.w = min(r6.w, float(1.00000000f));
	r8.z = dot(r4.xyz, r12.xyz);
	r8.z = fma(-r8.z, r8.z, float(1.00000000f));
	r8.z = max(r8.z, float(0.00000000f));
	r8.z = log2(r8.z);
	r8.z = r8.z * idx_uniforms2_ps.cb2[1].w;
	r8.z = exp2(r8.z);
	r8.z = min(r8.z, float(1.00000000f));
	r8.z = r1.z * r8.z;
	r12.xyz = r8.zzz * idx_uniforms2_ps.cb2[2].xyz;
	r12.xyz = fma(r6.www, idx_uniforms2_ps.cb2[1].xyz, r12.xyz);
	r12.xyz = r1.yyy * r12.xyz;
	r12.xyz = r12.xyz * idx_uniforms1_ps.cb1[3].xyz;
	r12.xyz = r14.xyz * r12.xyz;
	r10.xyz = fma(r12.xyz, idx_uniforms1_ps.cb1[4].zzz, r10.xyz);
	r12.xyz = r14.xyz * idx_uniforms1_ps.cb1[3].xyz;
	r14.xyz = r1.yyy * r12.xyz;
	r13.xyz = fma(r14.xyz, idx_uniforms1_ps.cb1[4].xxx, r13.xyz);
	r11.xyz = fma(r12.xyz, idx_uniforms1_ps.cb1[4].yyy, r11.xyz);
	r12.xyz = -v5.v.xyz + idx_uniforms1_ps.cb1[5].xyz;
	r1.y = dot(r12.xyz, r12.xyz);
	r6.w = sqrt(r1.y);
	r1.y = inversesqrt(r1.y);
	r12.xyz = r1.yyy * r12.xyz;
	r1.y = r6.w + -idx_uniforms1_ps.cb1[6].w;
	r6.w = idx_uniforms1_ps.cb1[5].w + -idx_uniforms1_ps.cb1[6].w;
	r6.w = max(r6.w, float(9.99999994e-09f));
	r1.y = saturate(r1.y / r6.w);
	r1.y = r1.y + float(-1.00000000f);
	r1.y = fma(-r1.y, r1.y, float(1.00000000f));
	r1.y = sqrt(r1.y);
	r1.y = -r1.y + float(1.00000000f);
	r2.x = dot(r12.xyz, r2.xyz);
	r2.x = r2.x + float(0.500000000f);
	r2.x = saturate(r2.x * float(0.666666687f));
	r2.yzw = fma(r3.xyz, r2.www, r12.xyz);
	r3.x = dot(r2.yzw, r2.yzw);
	r3.x = inversesqrt(r3.x);
	r2.yzw = r2.yzw * r3.xxx;
	r3.x = dot(r9.xyz, r2.yzw);
	r3.x = fma(-r3.x, r3.x, float(1.00000000f));
	r3.x = max(r3.x, float(0.00000000f));
	r3.x = log2(r3.x);
	r3.x = r3.x * r7.w;
	r3.x = exp2(r3.x);
	r3.x = min(r3.x, float(1.00000000f));
	r2.y = dot(r4.xyz, r2.yzw);
	r2.y = fma(-r2.y, r2.y, float(1.00000000f));
	r2.y = max(r2.y, float(0.00000000f));
	r2.y = log2(r2.y);
	r2.y = r2.y * idx_uniforms2_ps.cb2[1].w;
	r2.y = exp2(r2.y);
	r2.y = min(r2.y, float(1.00000000f));
	r2.y = r1.z * r2.y;
	r2.yzw = r2.yyy * idx_uniforms2_ps.cb2[2].xyz;
	r2.yzw = fma(r3.xxx, idx_uniforms2_ps.cb2[1].xyz, r2.yzw);
	r2.yzw = r2.xxx * r2.yzw;
	r2.yzw = r2.yzw * idx_uniforms1_ps.cb1[6].xyz;
	r2.yzw = r1.yyy * r2.yzw;
	r2.yzw = fma(r2.yzw, idx_uniforms1_ps.cb1[7].zzz, r10.xyz);
	r3.xyz = r1.yyy * idx_uniforms1_ps.cb1[6].xyz;
	r10.xyz = r2.xxx * r3.xyz;
	r10.xyz = fma(r10.xyz, idx_uniforms1_ps.cb1[7].xxx, r13.xyz);
	r3.xyz = fma(r3.xyz, idx_uniforms1_ps.cb1[7].yyy, r11.xyz);
	r1.x = r1.x * r8.w;
	r2.xyz = r1.xxx * r2.yzw;
	r7.xyz = fma(r10.xyz, r8.www, r7.xyz);
	r3.xyz = r8.xxx * r3.xyz;
	r3.xyz = fma(r5.xyz, r4.www, r3.xyz);
	r1.x = dot(r9.xyz, r6.xyz);
	r1.x = fma(-r1.x, r1.x, float(1.00000000f));
	r1.x = max(r1.x, float(0.00000000f));
	r1.x = log2(r1.x);
	r1.x = r1.x * r7.w;
	r1.x = exp2(r1.x);
	r1.y = dot(r4.xyz, r6.xyz);
	r1.y = fma(-r1.y, r1.y, float(1.00000000f));
	r1.y = max(r1.y, float(0.00000000f));
	r1.y = log2(r1.y);
	r1.y = r1.y * idx_uniforms2_ps.cb2[1].w;
	r1.y = exp2(r1.y);
	r1.xy = min(r1.xy, vec2(1.00000000f, 1.00000000f));
	r1.y = r1.y * r1.z;
	r4.xyz = r1.yyy * idx_uniforms2_ps.cb2[2].xyz;
	r1.xyz = fma(r1.xxx, idx_uniforms2_ps.cb2[1].xyz, r4.xyz);
	r1.xyz = r5.www * r1.xyz;
	r1.xyz = r3.www * r1.xyz;
	r1.xyz = r1.xyz * idx_uniforms0_ps.cb0[1].xyz;
	r1.w = saturate(r1.w * r8.y);
	r0.xyz = r0.xyz * idx_uniforms2_ps.cb2[3].xyz;
	r3.xyz = fma(r7.xyz, idx_uniforms2_ps.cb2[3].www, r3.xyz);
	r1.xyz = fma(r1.xyz, r1.www, r2.xyz);
	r0.xyz = fma(r0.xyz, r3.xyz, r1.xyz);
	r1.x = uintBitsToFloat(uint(0x3f800000));
	r1.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r1 = r1 * -v5.v.wwww;
	r1 = exp2(r1);
	r1 = min(r1, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r1.x = -r1.x + float(1.00000000f);
	r2.xyz = r1.xxx * idx_uniforms0_ps.cb0[13].xyz;
	r0.xyz = fma(r0.xyz, r1.yzw, r2.xyz);
	r0.w = r0.w * float(1.30102038f);
	o0.w = min(r0.w, float(1.00000000f));
	r0.w = saturate(float(1.00000000f) + -idx_uniforms1_ps.cb1[0].w);
	o0.xyz = fma(r0.xyz, r0.www, idx_uniforms1_ps.cb1[0].xyz);
	return;
}

