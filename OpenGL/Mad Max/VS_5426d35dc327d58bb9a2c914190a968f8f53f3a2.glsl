#version 460 core
// vs_5_0
// Checksum: 8ceeef32_a8cd10c0_a1bb3dd8_3b3db349
// Name: generalshadow

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[4]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[1]; } idx_uniforms2_vs;


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
	r0 = v0.yyyy * idx_uniforms1_vs.cb1[1];
	r0 = fma(v0.xxxx, idx_uniforms1_vs.cb1[0], r0);
	r0 = fma(v0.zzzz, idx_uniforms1_vs.cb1[2], r0);
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	o1.v.xy = v1.xy * idx_uniforms2_vs.cb2[0].xy;
	VertexEpilog();
	return;
}

