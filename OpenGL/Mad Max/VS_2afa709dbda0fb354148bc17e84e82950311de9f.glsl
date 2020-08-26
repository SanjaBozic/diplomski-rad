#version 460 core
// vs_5_0
// Checksum: 185eb94a_59d42d6c_16bacb66_7965fef7
// Name: screenspace

layout(location = 0) in vec4 v0;
// gl_Position

// Uniform buffer declarations (dcl_constant_buffer)


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
	VertexEpilog();
	return;
}

