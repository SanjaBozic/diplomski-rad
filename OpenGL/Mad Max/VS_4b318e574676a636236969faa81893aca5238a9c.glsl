#version 460 core
// vs_5_0
// Checksum: dadf223c_11df0c1e_22c9c169_9011b492
// Name: screenspacetex

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
vec4 r0;

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
	gl_Position.xy = v0.xy;
	gl_Position.zw = uintBitsToFloat(uvec2(0x3f800000, 0x3f800000));
	r0.xy = fma(v0.xy, vec2(0.500000000f, -0.500000000f), vec2(0.500000000f, 0.500000000f));
	o1.v.xy = r0.xy * idx_uniforms1_vs.cb1[0].xy;
	VertexEpilog();
	return;
}

