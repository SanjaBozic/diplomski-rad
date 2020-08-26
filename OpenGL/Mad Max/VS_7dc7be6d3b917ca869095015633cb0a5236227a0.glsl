#version 460 core
// vs_5_0
// Checksum: 721ac9e5_b5cf9ba0_d0b26cf7_2fd52adb
// Name: skygradientshader

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
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
	r0.xyz = v0.yyy * idx_uniforms1_vs.cb1[1].xyw;
	r0.xyz = fma(v0.xxx, idx_uniforms1_vs.cb1[0].xyw, r0.xyz);
	r0.xyz = fma(v0.zzz, idx_uniforms1_vs.cb1[2].xyw, r0.xyz);
	gl_Position.xyw = fma(v0.www, idx_uniforms1_vs.cb1[3].xyw, r0.xyz);
	gl_Position.z = uintBitsToFloat(uint(0x00000000));
	o1.v.xz = v1.xx + idx_uniforms1_vs.cb1[4].xy;
	o1.v.yw = v1.yy;
	VertexEpilog();
	return;
}

