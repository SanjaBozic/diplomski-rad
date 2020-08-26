#version 460 core
// vs_5_0
// Checksum: 9a435157_1da33dd2_09907368_79829db3
// Name: characteroutline82uvs

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in uvec4 v2;
layout(location = 3) in vec4 v3;
layout(location = 4) in uvec4 v4;
layout(location = 6) in vec4 v6;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[1]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[2]; } idx_uniforms2_vs;

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

void main()
{
	Initialise();
	r0 = fma(v6, vec4(6.28318548f, 6.28318548f, 6.28318548f, 6.28318548f), vec4(-3.14159274f, -3.14159274f, -3.14159274f, -3.14159274f));
	{ vec4 src = r0; r1 = sin(src); r2 = cos(src); }
	r0.x = intBitsToFloat(float(0.00000000f) < r0.w ? int(0xffffffff) : int(0x00000000));
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r0.x), uint(0x3f800000), uint(0xbf800000)));
	r3.w = r2.y;
	r3.xy = abs(r1.yw) * r2.xz;
	r2.xy = abs(r1.yw) * r1.xz;
	r3.z = r2.x;
	r1 = v1 + v3;
	r0.y = dot(vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f), r1);
	r0.y = float(1.00000000f) / r0.y;
	r1 = r0.yyyy * v3;
	r4 = r0.yyyy * v1;
	r5 = intBitsToFloat(ivec4(v2) * ivec4(3, 3, 3, 3));
	r6 = r4.yyyy * idx_uniforms4_vs.cb4[floatBitsToInt(r5.y)];
	r6 = fma(r4.xxxx, idx_uniforms4_vs.cb4[floatBitsToInt(r5.x)], r6);
	r6 = fma(r4.zzzz, idx_uniforms4_vs.cb4[floatBitsToInt(r5.z)], r6);
	r6 = fma(r4.wwww, idx_uniforms4_vs.cb4[floatBitsToInt(r5.w)], r6);
	r7 = intBitsToFloat(ivec4(v4) * ivec4(3, 3, 3, 3));
	r6 = fma(r1.xxxx, idx_uniforms4_vs.cb4[floatBitsToInt(r7.x)], r6);
	r6 = fma(r1.yyyy, idx_uniforms4_vs.cb4[floatBitsToInt(r7.y)], r6);
	r6 = fma(r1.zzzz, idx_uniforms4_vs.cb4[floatBitsToInt(r7.z)], r6);
	r6 = fma(r1.wwww, idx_uniforms4_vs.cb4[floatBitsToInt(r7.w)], r6);
	r8.y = dot(r6.xyz, r3.xzw);
	r9 = r4.yyyy * idx_uniforms4_vs.cb4[1 + floatBitsToInt(r5.y)];
	r9 = fma(r4.xxxx, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r5.x)], r9);
	r9 = fma(r4.zzzz, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r5.z)], r9);
	r9 = fma(r4.wwww, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r5.w)], r9);
	r9 = fma(r1.xxxx, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r7.x)], r9);
	r9 = fma(r1.yyyy, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r7.y)], r9);
	r9 = fma(r1.zzzz, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r7.z)], r9);
	r9 = fma(r1.wwww, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r7.w)], r9);
	r8.z = dot(r9.xyz, r3.xzw);
	r10 = r4.yyyy * idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.y)];
	r10 = fma(r4.xxxx, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.x)], r10);
	r10 = fma(r4.zzzz, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.z)], r10);
	r4 = fma(r4.wwww, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.w)], r10);
	r4 = fma(r1.xxxx, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r7.x)], r4);
	r4 = fma(r1.yyyy, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r7.y)], r4);
	r4 = fma(r1.zzzz, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r7.z)], r4);
	r1 = fma(r1.wwww, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r7.w)], r4);
	r8.x = dot(r1.xyz, r3.xzw);
	r2.z = r3.y;
	r3.z = dot(r6.yxz, r2.yzw);
	r3.x = dot(r9.yxz, r2.yzw);
	r3.y = dot(r1.yxz, r2.yzw);
	r0.yzw = r3.xyz * r8.xyz;
	r0.yzw = fma(r8.zxy, r3.yzx, -r0.yzw);
	r0.xyz = r0.yzw * r0.xxx;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xyz = r0.www * r0.xyz;
	r0.xyz = intBitsToFloat(mix ( ivec3(0x00000000),ivec3(0xffffffff),bvec3(equal(r0.xyz, vec3(0.00000000f, 0.00000000f, 0.00000000f)))));
	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
	r0.x = uintBitsToFloat(floatBitsToUint(r0.z) & floatBitsToUint(r0.x));
	r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.xxx), uvec3(0x00000000, 0x3f800000, 0x00000000), floatBitsToUint(r2.xyz)));
	r2.xyz = r0.yyy * idx_uniforms3_vs.cb3[1].xyz;
	r2.xyz = fma(r0.xxx, idx_uniforms3_vs.cb3[0].xyz, r2.xyz);
	r2.xyz = fma(r0.zzz, idx_uniforms3_vs.cb3[2].xyz, r2.xyz);
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xyz = r0.www * r2.xyz;
	r3.xyz = v0.xyz * idx_uniforms1_vs.cb1[0].xxx;
	r3.w = uintBitsToFloat(uint(0x3f800000));
	r4.y = dot(r9, r3);
	r5 = r4.yyyy * idx_uniforms3_vs.cb3[1];
	r4.x = dot(r6, r3);
	r4.z = dot(r1, r3);
	r1 = fma(r4.xxxx, idx_uniforms3_vs.cb3[0], r5);
	r1 = fma(r4.zzzz, idx_uniforms3_vs.cb3[2], r1);
	r1 = r1 + idx_uniforms3_vs.cb3[3];
	r0.w = r1.w * idx_uniforms2_vs.cb2[0].x;
	gl_Position.xyz = fma(r2.xyz, r0.www, r1.xyz);
	gl_Position.w = r1.w;
	r1.xyz = r0.yyy * idx_uniforms3_vs.cb3[5].xyz;
	r0.xyw = fma(r0.xxx, idx_uniforms3_vs.cb3[4].xyz, r1.xyz);
	o1.v.yzw = fma(r0.zzz, idx_uniforms3_vs.cb3[6].xyz, r0.xyw);
	r4.w = uintBitsToFloat(uint(0x3f800000));
	o1.v.x = dot(r4, idx_uniforms2_vs.cb2[1]);
	r0.xyz = r4.yyy * idx_uniforms3_vs.cb3[5].xyz;
	r0.xyz = fma(r4.xxx, idx_uniforms3_vs.cb3[4].xyz, r0.xyz);
	r0.xyz = fma(r4.zzz, idx_uniforms3_vs.cb3[6].xyz, r0.xyz);
	o2.v.xyz = r0.xyz + idx_uniforms3_vs.cb3[7].xyz;
	VertexEpilog();
	return;
}

