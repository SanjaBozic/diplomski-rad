#version 460 core
// vs_5_0
// Checksum: f0960756_892474aa_1728b081_36c5751a
// Name: charactervelocity8

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in uvec4 v2;
layout(location = 3) in vec4 v3;
layout(location = 4) in uvec4 v4;
layout(location = 5) in vec4 v5;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
layout(location = 4) out idx_Varying4 { vec4 v; } o4;
vec4 r0, r1, r2, r3, r4, r5, r6;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[3]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs3 { vec4 cb3[8]; } idx_uniforms3_vs;

layout (std140) uniform cb_vs4 { vec4 cb4[4096]; } idx_uniforms4_vs;

layout (std140) uniform cb_vs5 { vec4 cb5[4096]; } idx_uniforms5_vs;


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


void VertexEpilog()
{
	gl_Position = D3DtoGL(gl_Position);
}

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
	r4.x = dot(r4, r0);
	r4 = r4.xxxx * idx_uniforms3_vs.cb3[1];
	r6 = r1.yyyy * idx_uniforms4_vs.cb4[floatBitsToInt(r3.y)];
	r6 = fma(r1.xxxx, idx_uniforms4_vs.cb4[floatBitsToInt(r3.x)], r6);
	r6 = fma(r1.zzzz, idx_uniforms4_vs.cb4[floatBitsToInt(r3.z)], r6);
	r6 = fma(r1.wwww, idx_uniforms4_vs.cb4[floatBitsToInt(r3.w)], r6);
	r6 = fma(r2.xxxx, idx_uniforms4_vs.cb4[floatBitsToInt(r5.x)], r6);
	r6 = fma(r2.yyyy, idx_uniforms4_vs.cb4[floatBitsToInt(r5.y)], r6);
	r6 = fma(r2.zzzz, idx_uniforms4_vs.cb4[floatBitsToInt(r5.z)], r6);
	r6 = fma(r2.wwww, idx_uniforms4_vs.cb4[floatBitsToInt(r5.w)], r6);
	r6.x = dot(r6, r0);
	r4 = fma(r6.xxxx, idx_uniforms3_vs.cb3[0], r4);
	r6 = r1.yyyy * idx_uniforms4_vs.cb4[2 + floatBitsToInt(r3.y)];
	r6 = fma(r1.xxxx, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r3.x)], r6);
	r6 = fma(r1.zzzz, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r3.z)], r6);
	r6 = fma(r1.wwww, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r3.w)], r6);
	r6 = fma(r2.xxxx, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.x)], r6);
	r6 = fma(r2.yyyy, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.y)], r6);
	r6 = fma(r2.zzzz, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.z)], r6);
	r6 = fma(r2.wwww, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r5.w)], r6);
	r6.x = dot(r6, r0);
	r4 = fma(r6.xxxx, idx_uniforms3_vs.cb3[2], r4);
	r4 = r4 + idx_uniforms3_vs.cb3[3];
	gl_Position = r4;
	o2.v = r4;
	r4 = v5.xyxy * idx_uniforms1_vs.cb1[0].yzyz;
	o1.v = r4;
	r4 = r1.yyyy * idx_uniforms5_vs.cb5[1 + floatBitsToInt(r3.y)];
	r4 = fma(r1.xxxx, idx_uniforms5_vs.cb5[1 + floatBitsToInt(r3.x)], r4);
	r4 = fma(r1.zzzz, idx_uniforms5_vs.cb5[1 + floatBitsToInt(r3.z)], r4);
	r4 = fma(r1.wwww, idx_uniforms5_vs.cb5[1 + floatBitsToInt(r3.w)], r4);
	r4 = fma(r2.xxxx, idx_uniforms5_vs.cb5[1 + floatBitsToInt(r5.x)], r4);
	r4 = fma(r2.yyyy, idx_uniforms5_vs.cb5[1 + floatBitsToInt(r5.y)], r4);
	r4 = fma(r2.zzzz, idx_uniforms5_vs.cb5[1 + floatBitsToInt(r5.z)], r4);
	r4 = fma(r2.wwww, idx_uniforms5_vs.cb5[1 + floatBitsToInt(r5.w)], r4);
	r4.x = dot(r4, r0);
	r4 = r4.xxxx * idx_uniforms3_vs.cb3[5];
	r6 = r1.yyyy * idx_uniforms5_vs.cb5[floatBitsToInt(r3.y)];
	r6 = fma(r1.xxxx, idx_uniforms5_vs.cb5[floatBitsToInt(r3.x)], r6);
	r6 = fma(r1.zzzz, idx_uniforms5_vs.cb5[floatBitsToInt(r3.z)], r6);
	r6 = fma(r1.wwww, idx_uniforms5_vs.cb5[floatBitsToInt(r3.w)], r6);
	r6 = fma(r2.xxxx, idx_uniforms5_vs.cb5[floatBitsToInt(r5.x)], r6);
	r6 = fma(r2.yyyy, idx_uniforms5_vs.cb5[floatBitsToInt(r5.y)], r6);
	r6 = fma(r2.zzzz, idx_uniforms5_vs.cb5[floatBitsToInt(r5.z)], r6);
	r6 = fma(r2.wwww, idx_uniforms5_vs.cb5[floatBitsToInt(r5.w)], r6);
	r6.x = dot(r6, r0);
	r4 = fma(r6.xxxx, idx_uniforms3_vs.cb3[4], r4);
	r6 = r1.yyyy * idx_uniforms5_vs.cb5[2 + floatBitsToInt(r3.y)];
	r6 = fma(r1.xxxx, idx_uniforms5_vs.cb5[2 + floatBitsToInt(r3.x)], r6);
	r6 = fma(r1.zzzz, idx_uniforms5_vs.cb5[2 + floatBitsToInt(r3.z)], r6);
	r1 = fma(r1.wwww, idx_uniforms5_vs.cb5[2 + floatBitsToInt(r3.w)], r6);
	r1 = fma(r2.xxxx, idx_uniforms5_vs.cb5[2 + floatBitsToInt(r5.x)], r1);
	r1 = fma(r2.yyyy, idx_uniforms5_vs.cb5[2 + floatBitsToInt(r5.y)], r1);
	r1 = fma(r2.zzzz, idx_uniforms5_vs.cb5[2 + floatBitsToInt(r5.z)], r1);
	r1 = fma(r2.wwww, idx_uniforms5_vs.cb5[2 + floatBitsToInt(r5.w)], r1);
	r0.x = dot(r1, r0);
	r0 = fma(r0.xxxx, idx_uniforms3_vs.cb3[6], r4);
	o3.v = r0 + idx_uniforms3_vs.cb3[7];
	o4.v.xy = fma(v5.xy, idx_uniforms1_vs.cb1[0].yz, idx_uniforms1_vs.cb1[2].xy);
	VertexEpilog();
	return;
}

