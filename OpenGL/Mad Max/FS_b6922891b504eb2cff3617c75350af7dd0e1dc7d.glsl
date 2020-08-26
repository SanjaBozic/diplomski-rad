#version 460 core
// ps_5_0
// Checksum: 56644864_262fab9a_8a906c76_3f2243d8
// Name: characterhair_indoor

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 8) in idx_Varying8 { vec4 v; } v8;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13;
vec4 x0[3];

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[40]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[6]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res2, s2

uniform sampler2D resourceSamplerPair_2_ps; // res1, s1

uniform sampler2D resourceSamplerPair_3_ps; // res5, s5

uniform sampler2D resourceSamplerPair_4_ps; // res3, s3

uniform sampler2D resourceSamplerPair_5_ps; // res4, s4

uniform sampler2D resourceSamplerPair_6_ps; // res8, s8

uniform sampler2D resourceSamplerPair_7_ps; // res13, s-1

uniform samplerCube resourceSamplerPair_8_ps; // res7, s7


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
	r3.xyz = -v5.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r1.w = dot(r3.xyz, r3.xyz);
	r1.w = inversesqrt(r1.w);
	r2.w = saturate(fma(r2.y, float(0.500000000f), float(0.500000000f)));
	r5.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
	r5.xyz = fma(r2.www, r5.xyz, idx_uniforms0_ps.cb0[11].xyz);
	r6.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r2.w = ((texture(resourceSamplerPair_3_ps, r6.xy))).w;
	r3.w = v8.v.w + float(-1.00000000f);
	r6.xyz = fma(idx_uniforms2_ps.cb2[4].xzw, r3.www, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r1.y = r1.y + idx_uniforms2_ps.cb2[5].z;
	r5.xyz = r5.xyz * r6.xxx;
	r3.w = r1.y + idx_uniforms2_ps.cb2[5].y;
	r7.xyz = fma(r3.www, r2.xyz, r4.xyz);
	r3.w = dot(r7.xyz, r7.xyz);
	r3.w = inversesqrt(r3.w);
	r7.xyz = r3.www * r7.xyz;
	r1.y = -r1.y + idx_uniforms2_ps.cb2[5].y;
	r4.xyz = fma(r1.yyy, r2.xyz, r4.xyz);
	r1.y = dot(r4.xyz, r4.xyz);
	r1.y = inversesqrt(r1.y);
	r4.xyz = r1.yyy * r4.xyz;
	r8.xyz = v5.v.xyz + -idx_uniforms0_ps.cb0[4].xyz;
	r9.xyz = fma(idx_uniforms1_ps.cb1[20].xyw, r8.xxx, idx_uniforms1_ps.cb1[23].xyw);
	r9.xyz = fma(idx_uniforms1_ps.cb1[21].xyw, r8.yyy, r9.xyz);
	r9.xyz = fma(idx_uniforms1_ps.cb1[22].xyw, r8.zzz, r9.xyz);
	r9.xy = r9.xy / r9.zz;
	r10.xyz = fma(idx_uniforms1_ps.cb1[24].xyw, r8.xxx, idx_uniforms1_ps.cb1[27].xyw);
	r10.xyz = fma(idx_uniforms1_ps.cb1[25].xyw, r8.yyy, r10.xyz);
	r10.xyz = fma(idx_uniforms1_ps.cb1[26].xyw, r8.zzz, r10.xyz);
	r9.zw = r10.xy / r10.zz;
	r10.xyz = fma(idx_uniforms1_ps.cb1[28].xyw, r8.xxx, idx_uniforms1_ps.cb1[31].xyw);
	r10.xyz = fma(idx_uniforms1_ps.cb1[29].xyw, r8.yyy, r10.xyz);
	r10.xyz = fma(idx_uniforms1_ps.cb1[30].xyw, r8.zzz, r10.xyz);
	r10.xy = r10.xy / r10.zz;
	r11.xyz = ((textureLod(resourceSamplerPair_4_ps, r9.xy, float(0.00000000f)))).xyz;
	x0[0].xyz = r11.xyz;
	r9.xyz = ((textureLod(resourceSamplerPair_5_ps, r9.zw, float(0.00000000f)))).xyz;
	r10.xyz = ((textureLod(resourceSamplerPair_6_ps, r10.xy, float(0.00000000f)))).xyz;
	r12 = fma(idx_uniforms1_ps.cb1[32], r8.xxxx, idx_uniforms1_ps.cb1[35]);
	r12 = fma(idx_uniforms1_ps.cb1[33], r8.yyyy, r12);
	r8 = fma(idx_uniforms1_ps.cb1[34], r8.zzzz, r12);
	r1.y = intBitsToFloat(float(0.00000000f) < idx_uniforms1_ps.cb1[36].x ? int(0xffffffff) : int(0x00000000));
	r3.w = intBitsToFloat(float(0.00000000f) < r8.w ? int(0xffffffff) : int(0x00000000));
	r1.y = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r3.w));
	if (floatBitsToUint(r1.y) != uint(0))
	{
		r8.xyz = r8.xyz / r8.www;
		r8.xy = r8.xy / idx_uniforms0_ps.cb0[4].ww;
		r8.xy = r8.xy + vec2(-0.500000000f, -0.500000000f);
		r12.xy = intBitsToFloat(ivec2(r8.xy));
		r12.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r13.x = ((texelFetchOffset(resourceSamplerPair_7_ps, floatBitsToInt(r12.xy), int(floatBitsToInt(r12.w)), ivec2(0, 0)))).x;
		r13.y = ((texelFetchOffset(resourceSamplerPair_7_ps, floatBitsToInt(r12.xy), int(floatBitsToInt(r12.w)), ivec2(1, 0))).yxzw).y;
		r13.z = ((texelFetchOffset(resourceSamplerPair_7_ps, floatBitsToInt(r12.xy), int(floatBitsToInt(r12.w)), ivec2(0, 1))).yzxw).z;
		r13.w = ((texelFetchOffset(resourceSamplerPair_7_ps, floatBitsToInt(r12.xy), int(floatBitsToInt(r12.w)), ivec2(1, 1))).yzwx).w;
		r12.xy = fract(r8.xy);
		r12.zw = -r12.xy + vec2(1.00000000f, 1.00000000f);
		r12 = r12.wwyy * r12.zxzx;
		r8 = -r8.zzzz + r13;
		r8 = saturate(fma(r8, vec4(500.000000f, 500.000000f, 500.000000f, 500.000000f), vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f)));
		r1.y = dot(r12, r8);
		r8.xyz = r1.yyy * r11.xyz;
		x0[0].xyz = r8.xyz;
	}
	r8.xyz = -v5.v.xyz + idx_uniforms1_ps.cb1[8].xyz;
	r1.y = dot(r8.xyz, r8.xyz);
	r3.w = sqrt(r1.y);
	r1.y = inversesqrt(r1.y);
	r8.xyz = r1.yyy * r8.xyz;
	r1.y = r3.w + -idx_uniforms1_ps.cb1[11].w;
	r4.w = idx_uniforms1_ps.cb1[8].w + -idx_uniforms1_ps.cb1[11].w;
	r4.w = max(r4.w, float(9.99999975e-06f));
	r1.y = saturate(r1.y / r4.w);
	r1.y = r1.y + float(-1.00000000f);
	r1.y = fma(-r1.y, r1.y, float(1.00000000f));
	r1.y = sqrt(r1.y);
	r1.y = -r1.y + float(1.00000000f);
	r4.w = dot(-r8.xyz, idx_uniforms1_ps.cb1[10].xyz);
	r4.w = saturate(fma(r4.w, idx_uniforms1_ps.cb1[9].w, idx_uniforms1_ps.cb1[10].w));
	r3.w = saturate(fma(r3.w, float(4.00000000f), float(-1.60000002f)));
	r3.w = r3.w * r4.w;
	r3.w = r3.w * r3.w;
	r1.y = r1.y * r3.w;
	r11.xyz = x0[0].xyz;
	r11.xyz = r1.yyy * r11.xyz;
	r1.y = dot(r8.xyz, r2.xyz);
	r1.y = r1.y + float(0.500000000f);
	r1.y = saturate(r1.y * float(0.666666687f));
	r8.xyz = fma(r3.xyz, r1.www, r8.xyz);
	r3.w = dot(r8.xyz, r8.xyz);
	r3.w = inversesqrt(r3.w);
	r8.xyz = r3.www * r8.xyz;
	r3.w = dot(r7.xyz, r8.xyz);
	r3.w = fma(-r3.w, r3.w, float(1.00000000f));
	r3.w = max(r3.w, float(0.00000000f));
	r4.w = idx_uniforms2_ps.cb2[1].w * float(0.500000000f);
	r5.w = fma(idx_uniforms2_ps.cb2[1].w, float(0.500000000f), float(8.00000000f));
	r5.w = r5.w * float(0.0398089178f);
	r3.w = log2(r3.w);
	r3.w = r3.w * r4.w;
	r3.w = exp2(r3.w);
	r3.w = min(r3.w, float(1.00000000f));
	r3.w = r5.w * r3.w;
	r6.w = dot(r4.xyz, r8.xyz);
	r6.w = fma(-r6.w, r6.w, float(1.00000000f));
	r6.w = max(r6.w, float(0.00000000f));
	r7.w = idx_uniforms2_ps.cb2[1].w + float(8.00000000f);
	r7.w = r7.w * float(0.0398089178f);
	r6.w = log2(r6.w);
	r6.w = r6.w * idx_uniforms2_ps.cb2[1].w;
	r6.w = exp2(r6.w);
	r6.w = min(r6.w, float(1.00000000f));
	r6.w = r7.w * r6.w;
	r6.w = r1.z * r6.w;
	r8.xyz = r6.www * idx_uniforms2_ps.cb2[2].xyz;
	r8.xyz = fma(r3.www, idx_uniforms2_ps.cb2[1].xyz, r8.xyz);
	r8.xyz = r1.yyy * r8.xyz;
	r8.xyz = r8.xyz * idx_uniforms1_ps.cb1[9].xyz;
	r8.xyz = r11.xyz * r8.xyz;
	r11.xyz = r11.xyz * idx_uniforms1_ps.cb1[9].xyz;
	r12.xyz = r1.yyy * r11.xyz;
	r13.xyz = -v5.v.xyz + idx_uniforms1_ps.cb1[12].xyz;
	r1.y = dot(r13.xyz, r13.xyz);
	r3.w = sqrt(r1.y);
	r1.y = inversesqrt(r1.y);
	r13.xyz = r1.yyy * r13.xyz;
	r1.y = r3.w + -idx_uniforms1_ps.cb1[15].w;
	r6.w = idx_uniforms1_ps.cb1[12].w + -idx_uniforms1_ps.cb1[15].w;
	r6.w = max(r6.w, float(9.99999975e-06f));
	r1.y = saturate(r1.y / r6.w);
	r1.y = r1.y + float(-1.00000000f);
	r1.y = fma(-r1.y, r1.y, float(1.00000000f));
	r1.y = sqrt(r1.y);
	r1.y = -r1.y + float(1.00000000f);
	r6.w = dot(-r13.xyz, idx_uniforms1_ps.cb1[14].xyz);
	r6.w = saturate(fma(r6.w, idx_uniforms1_ps.cb1[13].w, idx_uniforms1_ps.cb1[14].w));
	r3.w = saturate(fma(r3.w, float(4.00000000f), float(-1.60000002f)));
	r3.w = r3.w * r6.w;
	r3.w = r3.w * r3.w;
	r1.y = r1.y * r3.w;
	r9.xyz = r9.xyz * r1.yyy;
	r1.y = dot(r13.xyz, r2.xyz);
	r1.y = r1.y + float(0.500000000f);
	r1.y = saturate(r1.y * float(0.666666687f));
	r13.xyz = fma(r3.xyz, r1.www, r13.xyz);
	r3.w = dot(r13.xyz, r13.xyz);
	r3.w = inversesqrt(r3.w);
	r13.xyz = r3.www * r13.xyz;
	r3.w = dot(r7.xyz, r13.xyz);
	r3.w = fma(-r3.w, r3.w, float(1.00000000f));
	r3.w = max(r3.w, float(0.00000000f));
	r3.w = log2(r3.w);
	r3.w = r3.w * r4.w;
	r3.w = exp2(r3.w);
	r3.w = min(r3.w, float(1.00000000f));
	r3.w = r5.w * r3.w;
	r6.w = dot(r4.xyz, r13.xyz);
	r6.w = fma(-r6.w, r6.w, float(1.00000000f));
	r6.w = max(r6.w, float(0.00000000f));
	r6.w = log2(r6.w);
	r6.w = r6.w * idx_uniforms2_ps.cb2[1].w;
	r6.w = exp2(r6.w);
	r6.w = min(r6.w, float(1.00000000f));
	r6.w = r7.w * r6.w;
	r6.w = r1.z * r6.w;
	r13.xyz = r6.www * idx_uniforms2_ps.cb2[2].xyz;
	r13.xyz = fma(r3.www, idx_uniforms2_ps.cb2[1].xyz, r13.xyz);
	r13.xyz = r1.yyy * r13.xyz;
	r13.xyz = r13.xyz * idx_uniforms1_ps.cb1[13].xyz;
	r13.xyz = r9.xyz * r13.xyz;
	r13.xyz = r13.xyz * idx_uniforms1_ps.cb1[15].zzz;
	r8.xyz = fma(r8.xyz, idx_uniforms1_ps.cb1[11].zzz, r13.xyz);
	r9.xyz = r9.xyz * idx_uniforms1_ps.cb1[13].xyz;
	r13.xyz = r1.yyy * r9.xyz;
	r13.xyz = r13.xyz * idx_uniforms1_ps.cb1[15].xxx;
	r12.xyz = fma(r12.xyz, idx_uniforms1_ps.cb1[11].xxx, r13.xyz);
	r9.xyz = r9.xyz * idx_uniforms1_ps.cb1[15].yyy;
	r9.xyz = fma(r11.xyz, idx_uniforms1_ps.cb1[11].yyy, r9.xyz);
	r11.xyz = -v5.v.xyz + idx_uniforms1_ps.cb1[16].xyz;
	r1.y = dot(r11.xyz, r11.xyz);
	r3.w = sqrt(r1.y);
	r1.y = inversesqrt(r1.y);
	r11.xyz = r1.yyy * r11.xyz;
	r1.y = r3.w + -idx_uniforms1_ps.cb1[19].w;
	r6.w = idx_uniforms1_ps.cb1[16].w + -idx_uniforms1_ps.cb1[19].w;
	r6.w = max(r6.w, float(9.99999975e-06f));
	r1.y = saturate(r1.y / r6.w);
	r1.y = r1.y + float(-1.00000000f);
	r1.y = fma(-r1.y, r1.y, float(1.00000000f));
	r1.y = sqrt(r1.y);
	r1.y = -r1.y + float(1.00000000f);
	r6.w = dot(-r11.xyz, idx_uniforms1_ps.cb1[18].xyz);
	r6.w = saturate(fma(r6.w, idx_uniforms1_ps.cb1[17].w, idx_uniforms1_ps.cb1[18].w));
	r3.w = saturate(fma(r3.w, float(4.00000000f), float(-1.60000002f)));
	r3.w = r3.w * r6.w;
	r3.w = r3.w * r3.w;
	r1.y = r1.y * r3.w;
	r10.xyz = r10.xyz * r1.yyy;
	r1.y = dot(r11.xyz, r2.xyz);
	r1.y = r1.y + float(0.500000000f);
	r1.y = saturate(r1.y * float(0.666666687f));
	r11.xyz = fma(r3.xyz, r1.www, r11.xyz);
	r3.w = dot(r11.xyz, r11.xyz);
	r3.w = inversesqrt(r3.w);
	r11.xyz = r3.www * r11.xyz;
	r3.w = dot(r7.xyz, r11.xyz);
	r3.w = fma(-r3.w, r3.w, float(1.00000000f));
	r3.w = max(r3.w, float(0.00000000f));
	r3.w = log2(r3.w);
	r3.w = r3.w * r4.w;
	r3.w = exp2(r3.w);
	r3.w = min(r3.w, float(1.00000000f));
	r3.w = r5.w * r3.w;
	r5.w = dot(r4.xyz, r11.xyz);
	r5.w = fma(-r5.w, r5.w, float(1.00000000f));
	r5.w = max(r5.w, float(0.00000000f));
	r5.w = log2(r5.w);
	r5.w = r5.w * idx_uniforms2_ps.cb2[1].w;
	r5.w = exp2(r5.w);
	r5.w = min(r5.w, float(1.00000000f));
	r5.w = r7.w * r5.w;
	r5.w = r1.z * r5.w;
	r11.xyz = r5.www * idx_uniforms2_ps.cb2[2].xyz;
	r11.xyz = fma(r3.www, idx_uniforms2_ps.cb2[1].xyz, r11.xyz);
	r11.xyz = r1.yyy * r11.xyz;
	r11.xyz = r11.xyz * idx_uniforms1_ps.cb1[17].xyz;
	r11.xyz = r10.xyz * r11.xyz;
	r8.xyz = fma(r11.xyz, idx_uniforms1_ps.cb1[19].zzz, r8.xyz);
	r10.xyz = r10.xyz * idx_uniforms1_ps.cb1[17].xyz;
	r11.xyz = r1.yyy * r10.xyz;
	r11.xyz = fma(r11.xyz, idx_uniforms1_ps.cb1[19].xxx, r12.xyz);
	r9.xyz = fma(r10.xyz, idx_uniforms1_ps.cb1[19].yyy, r9.xyz);
	r10.xyz = -v5.v.xyz + idx_uniforms1_ps.cb1[2].xyz;
	r1.y = dot(r10.xyz, r10.xyz);
	r3.w = inversesqrt(r1.y);
	r10.xyz = r3.www * r10.xyz;
	r12.xyz = r10.yyy * idx_uniforms1_ps.cb1[38].xyz;
	r12.xyz = fma(idx_uniforms1_ps.cb1[37].xyz, r10.xxx, r12.xyz);
	r12.xyz = fma(idx_uniforms1_ps.cb1[39].xyz, r10.zzz, r12.xyz);
	r12.xyz = ((textureLod(resourceSamplerPair_8_ps, r12.xyz, float(0.00000000f)))).xyz;
	r1.y = sqrt(r1.y);
	r1.y = r1.y + -idx_uniforms1_ps.cb1[3].w;
	r3.w = idx_uniforms1_ps.cb1[2].w + -idx_uniforms1_ps.cb1[3].w;
	r3.w = max(r3.w, float(9.99999994e-09f));
	r1.y = saturate(r1.y / r3.w);
	r1.y = r1.y + float(-1.00000000f);
	r1.y = fma(-r1.y, r1.y, float(1.00000000f));
	r1.y = sqrt(r1.y);
	r1.y = -r1.y + float(1.00000000f);
	r12.xyz = r12.xyz * r1.yyy;
	r1.y = dot(r10.xyz, r2.xyz);
	r1.y = r1.y + float(0.500000000f);
	r1.y = saturate(r1.y * float(0.666666687f));
	r10.xyz = fma(r3.xyz, r1.www, r10.xyz);
	r3.w = dot(r10.xyz, r10.xyz);
	r3.w = inversesqrt(r3.w);
	r10.xyz = r3.www * r10.xyz;
	r3.w = dot(r7.xyz, r10.xyz);
	r3.w = fma(-r3.w, r3.w, float(1.00000000f));
	r3.w = max(r3.w, float(0.00000000f));
	r3.w = log2(r3.w);
	r3.w = r3.w * r4.w;
	r3.w = exp2(r3.w);
	r3.w = min(r3.w, float(1.00000000f));
	r5.w = dot(r4.xyz, r10.xyz);
	r5.w = fma(-r5.w, r5.w, float(1.00000000f));
	r5.w = max(r5.w, float(0.00000000f));
	r5.w = log2(r5.w);
	r5.w = r5.w * idx_uniforms2_ps.cb2[1].w;
	r5.w = exp2(r5.w);
	r5.w = min(r5.w, float(1.00000000f));
	r5.w = r1.z * r5.w;
	r10.xyz = r5.www * idx_uniforms2_ps.cb2[2].xyz;
	r10.xyz = fma(r3.www, idx_uniforms2_ps.cb2[1].xyz, r10.xyz);
	r10.xyz = r1.yyy * r10.xyz;
	r10.xyz = r10.xyz * idx_uniforms1_ps.cb1[3].xyz;
	r10.xyz = r12.xyz * r10.xyz;
	r8.xyz = fma(r10.xyz, idx_uniforms1_ps.cb1[4].zzz, r8.xyz);
	r10.xyz = r12.xyz * idx_uniforms1_ps.cb1[3].xyz;
	r12.xyz = r1.yyy * r10.xyz;
	r11.xyz = fma(r12.xyz, idx_uniforms1_ps.cb1[4].xxx, r11.xyz);
	r9.xyz = fma(r10.xyz, idx_uniforms1_ps.cb1[4].yyy, r9.xyz);
	r10.xyz = -v5.v.xyz + idx_uniforms1_ps.cb1[5].xyz;
	r1.y = dot(r10.xyz, r10.xyz);
	r3.w = sqrt(r1.y);
	r1.y = inversesqrt(r1.y);
	r10.xyz = r1.yyy * r10.xyz;
	r1.y = r3.w + -idx_uniforms1_ps.cb1[6].w;
	r3.w = idx_uniforms1_ps.cb1[5].w + -idx_uniforms1_ps.cb1[6].w;
	r3.w = max(r3.w, float(9.99999994e-09f));
	r1.y = saturate(r1.y / r3.w);
	r1.y = r1.y + float(-1.00000000f);
	r1.y = fma(-r1.y, r1.y, float(1.00000000f));
	r1.y = sqrt(r1.y);
	r1.y = -r1.y + float(1.00000000f);
	r2.x = dot(r10.xyz, r2.xyz);
	r2.x = r2.x + float(0.500000000f);
	r2.x = saturate(r2.x * float(0.666666687f));
	r3.xyz = fma(r3.xyz, r1.www, r10.xyz);
	r1.w = dot(r3.xyz, r3.xyz);
	r1.w = inversesqrt(r1.w);
	r3.xyz = r1.www * r3.xyz;
	r1.w = dot(r7.xyz, r3.xyz);
	r1.w = fma(-r1.w, r1.w, float(1.00000000f));
	r1.w = max(r1.w, float(0.00000000f));
	r1.w = log2(r1.w);
	r1.w = r1.w * r4.w;
	r1.w = exp2(r1.w);
	r1.w = min(r1.w, float(1.00000000f));
	r2.y = dot(r4.xyz, r3.xyz);
	r2.y = fma(-r2.y, r2.y, float(1.00000000f));
	r2.y = max(r2.y, float(0.00000000f));
	r2.y = log2(r2.y);
	r2.y = r2.y * idx_uniforms2_ps.cb2[1].w;
	r2.y = exp2(r2.y);
	r2.y = min(r2.y, float(1.00000000f));
	r1.z = r1.z * r2.y;
	r3.xyz = r1.zzz * idx_uniforms2_ps.cb2[2].xyz;
	r3.xyz = fma(r1.www, idx_uniforms2_ps.cb2[1].xyz, r3.xyz);
	r3.xyz = r2.xxx * r3.xyz;
	r3.xyz = r3.xyz * idx_uniforms1_ps.cb1[6].xyz;
	r3.xyz = r1.yyy * r3.xyz;
	r3.xyz = fma(r3.xyz, idx_uniforms1_ps.cb1[7].zzz, r8.xyz);
	r1.yzw = r1.yyy * idx_uniforms1_ps.cb1[6].xyz;
	r2.xyz = r2.xxx * r1.yzw;
	r2.xyz = fma(r2.xyz, idx_uniforms1_ps.cb1[7].xxx, r11.xyz);
	r1.yzw = fma(r1.yzw, idx_uniforms1_ps.cb1[7].yyy, r9.xyz);
	r1.x = r1.x * r6.z;
	r3.xyz = r1.xxx * r3.xyz;
	r2.xyz = r6.zzz * r2.xyz;
	r2.xyz = fma(v8.v.xyz, r6.yyy, r2.xyz);
	r1.xyz = r6.xxx * r1.yzw;
	r1.xyz = fma(r5.xyz, r2.www, r1.xyz);
	r0.xyz = r0.xyz * idx_uniforms2_ps.cb2[3].xyz;
	r1.xyz = fma(r2.xyz, idx_uniforms2_ps.cb2[3].www, r1.xyz);
	r0.xyz = fma(r0.xyz, r1.xyz, r3.xyz);
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

