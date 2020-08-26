#version 460 core
// vs_5_0
// Checksum: 001943b7_b6d46076_4d1a02d2_2e104603
// Name: depthoffield

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0;

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
	gl_Position.xy = v0.xy;
	gl_Position.zw = uintBitsToFloat(uvec2(0x3f800000, 0x3f800000));
	o1.v = fma(v0.xyxy, vec4(0.500000000f, -0.500000000f, 0.0500000007f, -0.0500000007f), vec4(0.500000000f, 0.500000000f, 0.0500000007f, 0.0500000007f));
	r0 = v0.yyyy * idx_uniforms1_vs.cb1[2];
	r0 = fma(v0.xxxx, idx_uniforms1_vs.cb1[1], r0);
	r0 = r0 + idx_uniforms1_vs.cb1[4];
	r0.xyz = r0.xyz / r0.www;
	o2.v.xyz = r0.xyz * idx_uniforms1_vs.cb1[0].xxx;
	VertexEpilog();
	return;
}

