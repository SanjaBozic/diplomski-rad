#version 460 core
// vs_5_0
// Checksum: 5fb9be69_101e33f2_0997f75b_35b349af
// Name: fogvolumeapplyfs

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;

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
	gl_Position.xy = v0.xy;
	gl_Position.zw = uintBitsToFloat(uvec2(0x3f800000, 0x3f800000));
	o1.v.xy = fma(v0.xy, vec2(0.500000000f, -0.500000000f), vec2(0.500000000f, 0.500000000f));
	o1.v.zw = idx_uniforms1_vs.cb1[8].xy;
	VertexEpilog();
	return;
}

