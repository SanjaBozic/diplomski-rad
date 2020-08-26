#version 460 core
// vs_5_0
// Checksum: e095c759_2c1a8e7c_41b5e300_55623fe5
// Name: character82uvs_fw

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in uvec4 v2;
layout(location = 3) in vec4 v3;
layout(location = 4) in uvec4 v4;
layout(location = 5) in vec4 v5;
layout(location = 6) in vec4 v6;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
layout(location = 4) out idx_Varying4 { vec4 v; } o4;
layout(location = 5) out idx_Varying5 { vec4 v; } o5;
layout(location = 6) out idx_Varying6 { vec4 v; } o6;
layout(location = 7) out idx_Varying7 { vec4 v; } o7;
layout(location = 8) out idx_Varying8 { vec4 v; } o8;
layout(location = 9) out idx_Varying9 { vec4 v; } o9;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[32]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[3]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[5]; } idx_uniforms2_vs;

layout (std140) uniform cb_vs3 { vec4 cb3[8]; } idx_uniforms3_vs;

layout (std140) uniform cb_vs4 { vec4 cb4[4096]; } idx_uniforms4_vs;


out gl_PerVertex {
	vec4 gl_Position;
};
uniform vec4 idx_Viewport_vs;
vec4 D3DtoGL(in vec4 pos)
{
	pos.xy += idx_Viewport_vs.xy * vec2(pos.w, -pos.w);
	return pos;
}
vec4 GLtoD3D(in vec4 pos)
{
	pos.xy -= idx_Viewport_vs.xy * vec2(pos.w, -pos.w);
	return pos;
}


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

void VertexEpilog()
{
	gl_Position = D3DtoGL(gl_Position);
}

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xyz = v0.xyz * idx_uniforms1_vs.cb1[0].xxx;
	r0.w = uintBitsToFloat(uint(0x3f800000));
	r1 = v1 + v3;
	r1.x = dot(vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f), r1);
	r1.x = float(1.00000000f) / r1.x;
	r2 = r1.xxxx * v3;
	r1 = r1.xxxx * v1;
	r3 = intBitsToFloat(ivec4(v2) * ivec4(3, 3, 3, 3));
	r4 = r1.yyyy * idx_uniforms4_vs.cb4[1 + floatBitsToInt(r3.y)];
	r4 = fma(r1.xxxx, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r3.x)], r4);
	r4 = fma(r1.zzzz, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r3.z)], r4);
	r4 = fma(r1.wwww, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r3.w)], r4);
	r5 = intBitsToFloat(ivec4(v4) * ivec4(3, 3, 3, 3));
	r4 = fma(r2.xxxx, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r5.x)], r4);
	r4 = fma(r2.yyyy, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r5.y)], r4);
	r4 = fma(r2.zzzz, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r5.z)], r4);
	r4 = fma(r2.wwww, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r5.w)], r4);
	r4.w = dot(r4, r0);
	r6 = r4.wwww * idx_uniforms3_vs.cb3[1];
	r7.xyz = r4.www * idx_uniforms3_vs.cb3[5].xyz;
	r8 = r1.yyyy * idx_uniforms4_vs.cb4[floatBitsToInt(r3.y)];
	r8 = fma(r1.xxxx, idx_uniforms4_vs.cb4[floatBitsToInt(r3.x)], r8);
	r8 = fma(r1.zzzz, idx_uniforms4_vs.cb4[floatBitsToInt(r3.z)], r8);
	r8 = fma(r1.wwww, idx_uniforms4_vs.cb4[floatBitsToInt(r3.w)], r8);
	r8 = fma(r2.xxxx, idx_uniforms4_vs.cb4[floatBitsToInt(r5.x)], r8);
	r8 = fma(r2.yyyy, idx_uniforms4_vs.cb4[floatBitsToInt(r5.y)], r8);
	r8 = fma(r2.zzzz, idx_uniforms4_vs.cb4[floatBitsToInt(r5.z)], r8);
	r8 = fma(r2.wwww, idx_uniforms4_vs.cb4[floatBitsToInt(r5.w)], r8);
	r4.w = dot(r8, r0);
	r6 = fma(r4.wwww, idx_uniforms3_vs.cb3[0], r6);
	r7.xyz = fma(r4.www, idx_uniforms3_vs.cb3[4].xyz, r7.xyz);
	r9 = r1.yyyy * idx_uniforms4_vs.cb4[2 + floatBitsToInt(r3.y)];
	r9 = fma(r1.xxxx, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r3.x)], r9);
	r9 = fma(r1.zzzz, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r3.z)], r9);
	r1 = fma(r1.wwww, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r3.w)], r9);
	r1 = fma(r2.xxxx, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.x)], r1);
	r1 = fma(r2.yyyy, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.y)], r1);
	r1 = fma(r2.zzzz, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.z)], r1);
	r1 = fma(r2.wwww, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.w)], r1);
	r0.x = dot(r1, r0);
	r2 = fma(r0.xxxx, idx_uniforms3_vs.cb3[2], r6);
	r0.xyz = fma(r0.xxx, idx_uniforms3_vs.cb3[6].xyz, r7.xyz);
	r0.xyz = r0.xyz + idx_uniforms3_vs.cb3[7].xyz;
	r2 = r2 + idx_uniforms3_vs.cb3[3];
	gl_Position = r2;
	r0.w = -r2.z + r2.w;
	r2.xy = v5.xy * idx_uniforms1_vs.cb1[0].yz;
	r2.zw = v5.zw * idx_uniforms1_vs.cb1[1].xy;
	o1.v = r2;
	r3 = fma(v6, vec4(6.28318548f, 6.28318548f, 6.28318548f, 6.28318548f), vec4(-3.14159274f, -3.14159274f, -3.14159274f, -3.14159274f));
	{ vec4 src = r3; r5 = sin(src); r6 = cos(src); }
	r1.w = intBitsToFloat(float(0.00000000f) < r3.w ? int(0xffffffff) : int(0x00000000));
	r1.w = uintBitsToFloat(movc(floatBitsToUint(r1.w), uint(0x3f800000), uint(0xbf800000)));
	r3.w = r6.y;
	r3.xy = abs(r5.yw) * r6.xz;
	r6.xy = abs(r5.yw) * r5.xz;
	r3.z = r6.x;
	r5.z = dot(r4.xyz, r3.xzw);
	r7.xyz = r5.zzz * idx_uniforms3_vs.cb3[5].xyz;
	r5.y = dot(r8.xyz, r3.xzw);
	r5.x = dot(r1.xyz, r3.xzw);
	r6.z = r3.y;
	r3.xyz = fma(r5.yyy, idx_uniforms3_vs.cb3[4].xyz, r7.xyz);
	o2.v.xyz = fma(r5.xxx, idx_uniforms3_vs.cb3[6].xyz, r3.xyz);
	o2.v.w = uintBitsToFloat(uint(0x00000000));
	r3.x = dot(r4.yxz, r6.yzw);
	r4.xyz = r3.xxx * idx_uniforms3_vs.cb3[5].xyz;
	r3.z = dot(r8.yxz, r6.yzw);
	r3.y = dot(r1.yxz, r6.yzw);
	r1.xyz = fma(r3.zzz, idx_uniforms3_vs.cb3[4].xyz, r4.xyz);
	o3.v.xyz = fma(r3.yyy, idx_uniforms3_vs.cb3[6].xyz, r1.xyz);
	o3.v.w = uintBitsToFloat(uint(0x00000000));
	r1.xyz = r3.xyz * r5.xyz;
	r1.xyz = fma(r5.zxy, r3.yzx, -r1.xyz);
	r1.xyz = r1.xyz * r1.www;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r3.xyz = r1.www * r1.xyz;
	r1.xyz = intBitsToFloat(mix ( ivec3(0x00000000),ivec3(0xffffffff),bvec3(equal(r1.xyz, vec3(0.00000000f, 0.00000000f, 0.00000000f)))));
	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r1.x));
	r1.x = uintBitsToFloat(floatBitsToUint(r1.z) & floatBitsToUint(r1.x));
	r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), uvec3(0x00000000, 0x3f800000, 0x00000000), floatBitsToUint(r3.xyz)));
	r3.xyz = r1.yyy * idx_uniforms3_vs.cb3[5].xyz;
	r1.xyw = fma(r1.xxx, idx_uniforms3_vs.cb3[4].xyz, r3.xyz);
	r1.xyz = fma(r1.zzz, idx_uniforms3_vs.cb3[6].xyz, r1.xyw);
	o4.v.xyz = r1.xyz;
	o4.v.w = uintBitsToFloat(uint(0x00000000));
	r1.w = saturate(r0.w * idx_uniforms0_vs.cb0[13].w);
	r3.x = fma(r0.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r3.x = min(r3.x, idx_uniforms0_vs.cb0[13].y);
	r3.x = -r3.x + float(1.00000000f);
	r1.w = fma(r1.w, r3.x, -idx_uniforms0_vs.cb0[12].x);
	o5.v.w = fma(r0.w, idx_uniforms0_vs.cb0[12].z, r1.w);
	o5.v.xyz = r0.xyz;
	r0.xyz = r0.xyz + -idx_uniforms0_vs.cb0[9].xyz;
	r3 = fma(idx_uniforms0_vs.cb0[24], r0.xxxx, idx_uniforms0_vs.cb0[27]);
	r3 = fma(idx_uniforms0_vs.cb0[25], r0.yyyy, r3);
	o6.v = fma(idx_uniforms0_vs.cb0[26], r0.zzzz, r3);
	r3 = fma(idx_uniforms0_vs.cb0[28], r0.xxxx, idx_uniforms0_vs.cb0[31]);
	r3 = fma(idx_uniforms0_vs.cb0[29], r0.yyyy, r3);
	o7.v = fma(idx_uniforms0_vs.cb0[30], r0.zzzz, r3);
	r0.x = saturate(dot(r1.xyz, idx_uniforms2_vs.cb2[3].xyz));
	r0.y = saturate(dot(r1.xyz, idx_uniforms2_vs.cb2[1].xyz));
	r0.xzw = r0.xxx * idx_uniforms2_vs.cb2[4].xyz;
	o8.v.xyz = fma(r0.yyy, idx_uniforms2_vs.cb2[2].xyz, r0.xzw);
	o8.v.w = idx_uniforms2_vs.cb2[0].w;
	r0.x = intBitsToFloat(idx_uniforms1_vs.cb1[2].z == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.xy = uintBitsToFloat(movc(floatBitsToUint(r0.xx), floatBitsToUint(r2.xy), floatBitsToUint(r2.zw)));
	o9.v.xy = r0.xy + idx_uniforms1_vs.cb1[2].xy;
	VertexEpilog();
	return;
}

