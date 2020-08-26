#version 460 core
// vs_5_0
// Checksum: 7a01bb8e_a7b7a7b3_f9880d09_331b9d96
// Name: deferred_spotlight

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[5]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[5]; } idx_uniforms2_vs;


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
	r0.x = fma(v0.x, float(6.28318548f), float(-3.14159274f));
	{ float src = r0.x; r0.x = sin(src); r1.x = cos(src); }
	r1.y = r0.x;
	r0.xy = r1.xy * v0.zz;
	r0.z = v0.y * idx_uniforms1_vs.cb1[4].x;
	{ float src = r0.z; r1.x = sin(src); r2.x = cos(src); }
	r0.xy = r0.xy * r1.xx;
	r0.z = r2.x * v0.z;
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r0 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	r0 = r0 + idx_uniforms1_vs.cb1[3];
	gl_Position = r0;
	r1.xy = r0.xy / r0.ww;
	o1.v.xy = fma(r1.xy, vec2(0.500000000f, -0.500000000f), vec2(0.500000000f, 0.500000000f));
	r1 = r0.yyyy * idx_uniforms2_vs.cb2[2];
	r1 = fma(r0.xxxx, idx_uniforms2_vs.cb2[1], r1);
	r0 = fma(r0.wwww, idx_uniforms2_vs.cb2[4], r1);
	r0.xyz = r0.xyz / r0.www;
	o2.v.xyz = r0.xyz * idx_uniforms2_vs.cb2[0].xxx;
	VertexEpilog();
	return;
}

