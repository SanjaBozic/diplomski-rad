#version 460 core
// vs_5_0
// Checksum: e3a40a49_8e47d9a5_66f7b88f_f22dc118
// Name: generalprezvelocity_d1

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[8]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[2]; } idx_uniforms2_vs;


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
	r0 = v0.yyyy * idx_uniforms1_vs.cb1[1];
	r0 = fma(v0.xxxx, idx_uniforms1_vs.cb1[0], r0);
	r0 = fma(v0.zzzz, idx_uniforms1_vs.cb1[2], r0);
	r0 = r0 + idx_uniforms1_vs.cb1[3];
	gl_Position.z = fma(idx_uniforms2_vs.cb2[0].x, r0.w, r0.z);
	gl_Position.xyw = r0.xyw;
	o2.v = r0;
	o1.v.xy = v1.zw * idx_uniforms2_vs.cb2[1].zw;
	o1.v.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r0 = v0.yyyy * idx_uniforms1_vs.cb1[5];
	r0 = fma(v0.xxxx, idx_uniforms1_vs.cb1[4], r0);
	r0 = fma(v0.zzzz, idx_uniforms1_vs.cb1[6], r0);
	o3.v = r0 + idx_uniforms1_vs.cb1[7];
	VertexEpilog();
	return;
}

