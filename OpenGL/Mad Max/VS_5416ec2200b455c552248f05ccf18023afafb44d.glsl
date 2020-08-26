#version 460 core
// vs_5_0
// Checksum: fdc40fdb_720ff94e_f19ab0fa_04b6ac34
// Name: spotlightcone

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

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.w = saturate(v0.z + idx_uniforms1_vs.cb1[4].x);
	r0.yz = r0.ww * v0.xy;
	r1 = -r0.zzzz * idx_uniforms1_vs.cb1[1];
	r1 = fma(-r0.yyyy, idx_uniforms1_vs.cb1[0], r1);
	o1.v.yzw = -1.f * r0.yzw;
	r0 = fma(-r0.wwww, idx_uniforms1_vs.cb1[2], r1);
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	o1.v.x = v0.z;
	VertexEpilog();
	return;
}

