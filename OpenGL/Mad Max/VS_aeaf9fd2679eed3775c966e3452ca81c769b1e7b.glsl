#version 460 core
// vs_5_0
// Checksum: 8946f006_2561111e_96e4c1b0_31b2d9cd
// Name: blackborders

layout(location = 0) in vec4 v0;
// gl_Position

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[1]; } idx_uniforms1_vs;


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
	gl_Position.xy = fma(v0.xy, idx_uniforms1_vs.cb1[0].xy, idx_uniforms1_vs.cb1[0].zw);
	gl_Position.zw = uintBitsToFloat(uvec2(0x3f800000, 0x3f800000));
	VertexEpilog();
	return;
}

