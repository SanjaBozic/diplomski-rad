#version 460 core
// vs_5_0
// Checksum: 3c9ca233_3bf76ab3_838fcd4a_b32f9d6a
// Name: characterdepth

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in uvec4 v2;
// gl_Position
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[1]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs3 { vec4 cb3[4]; } idx_uniforms3_vs;

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
	r1 = fma(r1.wwww, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r2.w)], r4);
	r0.x = dot(r1, r0);
	r0 = fma(r0.xxxx, idx_uniforms3_vs.cb3[2], r3);
	gl_Position = r0 + idx_uniforms3_vs.cb3[3];
	VertexEpilog();
	return;
}

