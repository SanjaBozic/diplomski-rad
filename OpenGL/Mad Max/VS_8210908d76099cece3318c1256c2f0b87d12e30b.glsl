#version 460 core
// vs_5_0
// Checksum: 15a2ae79_c634fa00_2149d609_0a16fee0
// Name: motionblur

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
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
	gl_Position.xy = fma(v0.xy, vec2(2.00000000f, -2.00000000f), vec2(-1.00000000f, 1.00000000f));
	gl_Position.zw = uintBitsToFloat(uvec2(0x3f800000, 0x3f800000));
	o1.v.xy = v1.xy;
	VertexEpilog();
	return;
}

