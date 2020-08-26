#version 460 core
// vs_5_0
// Checksum: 0d993786_9153db12_8dfa84ea_bb682ac7
// Name: guiterrainsubmesh

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[9]; } idx_uniforms1_vs;


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
	r0.xy = v0.xy * idx_uniforms1_vs.cb1[6].xy;
	r1.xy = fma(r0.xy, idx_uniforms1_vs.cb1[7].xx, idx_uniforms1_vs.cb1[7].yy);
	r2 = r1.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r1.xxxx, idx_uniforms1_vs.cb1[0], r2);
	gl_Position = r1 + idx_uniforms1_vs.cb1[3];
	r0.z = fma(-v0.y, idx_uniforms1_vs.cb1[6].y, float(1.00000000f));
	o1.v.xy = fma(r0.xz, idx_uniforms1_vs.cb1[5].xy, idx_uniforms1_vs.cb1[5].zw);
	o1.v.zw = fma(r0.xz, idx_uniforms1_vs.cb1[4].xy, idx_uniforms1_vs.cb1[4].zw);
	r0.xy = fma(r0.xy, idx_uniforms1_vs.cb1[8].xy, -idx_uniforms1_vs.cb1[8].zw);
	o2.v.zw = fma(r0.xy, vec2(1.00000000f, -1.00000000f), vec2(0.00000000f, 1.00000000f));
	o2.v.xy = v0.xy;
	VertexEpilog();
	return;
}

