#version 460 core
// vs_5_0
// Checksum: ca6c1cb1_5a62e82a_167a28bd_6e8a6c3d
// Name: fogvolumeblur

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;

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
	o1.v.xy = fma(v0.xy, vec2(0.500000000f, -0.500000000f), vec2(0.500000000f, 0.500000000f));
	o1.v.zw = uintBitsToFloat(uvec2(0x3f800000, 0x3f800000));
	VertexEpilog();
	return;
}

