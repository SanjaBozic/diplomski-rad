#version 460 core
// vs_5_0
// Checksum: a1e4f374_b0f104b4_fd569409_f3c8d1e9
// Name: terrainscroller

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[5]; } idx_uniforms1_vs;


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
	r0.x = idx_uniforms1_vs.cb1[4].y + float(-5.00000000f);
	r0 = r0.xxxx * idx_uniforms1_vs.cb1[1];
	r1.xy = fma(v0.xy, vec2(250.000000f, 250.000000f), idx_uniforms1_vs.cb1[4].xz);
	r0 = fma(r1.xxxx, idx_uniforms1_vs.cb1[0], r0);
	r0 = fma(r1.yyyy, idx_uniforms1_vs.cb1[2], r0);
	o1.v.zw = fma(r1.xy, vec2(3.05175781e-05f, 3.05175781e-05f), vec2(0.500000000f, 0.500000000f));
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	r0.xy = idx_uniforms1_vs.cb1[4].xz * vec2(0.125000000f, 0.125000000f);
	r0.xy = fract(r0.xy);
	o1.v.xy = fma(v0.xy, vec2(25.0000000f, 25.0000000f), r0.xy);
	VertexEpilog();
	return;
}

