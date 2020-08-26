#version 460 core
// vs_5_0
// Checksum: cf435224_727afaa2_7dec5425_6aec7388
// Name: charactervelocity

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in uvec4 v2;
layout(location = 3) in vec4 v3;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
layout(location = 4) out idx_Varying4 { vec4 v; } o4;
vec4 r0, r1, r2, r3, r4;

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
	r1.x = dot(vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f), v1);
	r1.x = float(1.00000000f) / r1.x;
	r1 = r1.xxxx * v1;
	r2 = intBitsToFloat(ivec4(v2) * ivec4(3, 3, 3, 3));
	r3 = r1.yyyy * idx_uniforms4_vs.cb4[1 + floatBitsToInt(r2.y)];
	r3 = fma(r1.xxxx, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r2.x)], r3);
	r3 = fma(r1.zzzz, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r2.z)], r3);
	r3 = fma(r1.wwww, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r2.w)], r3);
	r3.x = dot(r3, r0);
	r3 = r3.xxxx * idx_uniforms3_vs.cb3[1];
	r4 = r1.yyyy * idx_uniforms4_vs.cb4[floatBitsToInt(r2.y)];
	r4 = fma(r1.xxxx, idx_uniforms4_vs.cb4[floatBitsToInt(r2.x)], r4);
	r4 = fma(r1.zzzz, idx_uniforms4_vs.cb4[floatBitsToInt(r2.z)], r4);
	r4 = fma(r1.wwww, idx_uniforms4_vs.cb4[floatBitsToInt(r2.w)], r4);
	r4.x = dot(r4, r0);
	r3 = fma(r4.xxxx, idx_uniforms3_vs.cb3[0], r3);
	r4 = r1.yyyy * idx_uniforms4_vs.cb4[2 + floatBitsToInt(r2.y)];
	r4 = fma(r1.xxxx, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r2.x)], r4);
	r4 = fma(r1.zzzz, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r2.z)], r4);
	r4 = fma(r1.wwww, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r2.w)], r4);
	r4.x = dot(r4, r0);
	r3 = fma(r4.xxxx, idx_uniforms3_vs.cb3[2], r3);
	r3 = r3 + idx_uniforms3_vs.cb3[3];
	gl_Position = r3;
	o2.v = r3;
	r3 = v3.xyxy * idx_uniforms1_vs.cb1[0].yzyz;
	o1.v = r3;
	r3 = r1.yyyy * idx_uniforms5_vs.cb5[1 + floatBitsToInt(r2.y)];
	r3 = fma(r1.xxxx, idx_uniforms5_vs.cb5[1 + floatBitsToInt(r2.x)], r3);
	r3 = fma(r1.zzzz, idx_uniforms5_vs.cb5[1 + floatBitsToInt(r2.z)], r3);
	r3 = fma(r1.wwww, idx_uniforms5_vs.cb5[1 + floatBitsToInt(r2.w)], r3);
	r3.x = dot(r3, r0);
	r3 = r3.xxxx * idx_uniforms3_vs.cb3[5];
	r4 = r1.yyyy * idx_uniforms5_vs.cb5[floatBitsToInt(r2.y)];
	r4 = fma(r1.xxxx, idx_uniforms5_vs.cb5[floatBitsToInt(r2.x)], r4);
	r4 = fma(r1.zzzz, idx_uniforms5_vs.cb5[floatBitsToInt(r2.z)], r4);
	r4 = fma(r1.wwww, idx_uniforms5_vs.cb5[floatBitsToInt(r2.w)], r4);
	r4.x = dot(r4, r0);
	r3 = fma(r4.xxxx, idx_uniforms3_vs.cb3[4], r3);
	r4 = r1.yyyy * idx_uniforms5_vs.cb5[2 + floatBitsToInt(r2.y)];
	r4 = fma(r1.xxxx, idx_uniforms5_vs.cb5[2 + floatBitsToInt(r2.x)], r4);
	r4 = fma(r1.zzzz, idx_uniforms5_vs.cb5[2 + floatBitsToInt(r2.z)], r4);
	r1 = fma(r1.wwww, idx_uniforms5_vs.cb5[2 + floatBitsToInt(r2.w)], r4);
	r0.x = dot(r1, r0);
	r0 = fma(r0.xxxx, idx_uniforms3_vs.cb3[6], r3);
	o3.v = r0 + idx_uniforms3_vs.cb3[7];
	o4.v.xy = fma(v3.xy, idx_uniforms1_vs.cb1[0].yz, idx_uniforms1_vs.cb1[2].xy);
	VertexEpilog();
	return;
}

