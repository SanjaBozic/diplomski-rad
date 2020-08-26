#version 460 core
// vs_5_0
// Checksum: b4c6a15a_9cffea9f_6c87a203_9e481c8d
// Name: guiterrain

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[8]; } idx_uniforms1_vs;


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
	r0.yw = fma(r0.xy, idx_uniforms1_vs.cb1[7].xx, idx_uniforms1_vs.cb1[7].yy);
	r1 = r0.wwww * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.yyyy, idx_uniforms1_vs.cb1[0], r1);
	gl_Position = r1 + idx_uniforms1_vs.cb1[3];
	r0.z = fma(-v0.y, idx_uniforms1_vs.cb1[6].y, float(1.00000000f));
	o1.v.xy = fma(r0.xz, idx_uniforms1_vs.cb1[5].xy, idx_uniforms1_vs.cb1[5].zw);
	o1.v.zw = fma(r0.xz, idx_uniforms1_vs.cb1[4].xy, idx_uniforms1_vs.cb1[4].zw);
	o2.v.xy = v0.xy;
	VertexEpilog();
	return;
}

