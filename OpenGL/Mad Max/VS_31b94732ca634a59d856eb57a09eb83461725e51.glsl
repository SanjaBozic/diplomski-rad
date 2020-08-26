#version 460 core
// vs_5_0
// Checksum: d83d9052_30dbe442_ba119d63_83617211
// Name: cull

layout(location = 0) in vec4 v0;
// gl_Position
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[4]; } idx_uniforms0_vs;


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
	r0 = v0.yyyy * idx_uniforms0_vs.cb0[1];
	r0 = fma(v0.xxxx, idx_uniforms0_vs.cb0[0], r0);
	r0 = fma(v0.zzzz, idx_uniforms0_vs.cb0[2], r0);
	gl_Position = r0 + idx_uniforms0_vs.cb0[3];
	VertexEpilog();
	return;
}

