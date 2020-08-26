#version 460 core
// vs_5_0
// Checksum: 8963bec9_5a974331_01259d46_5d8f7f2e
// Name: generalshadow_inst

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 v3;
layout(location = 4) in vec4 v4;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[5]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[5]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[1]; } idx_uniforms2_vs;


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
	r0.x = v2.w;
	r0.y = v3.w;
	r0.z = v4.w;
	r0.xyz = r0.xyz + -idx_uniforms0_vs.cb0[4].xyz;
	r1.xyz = v0.xyz * idx_uniforms1_vs.cb1[4].www;
	r0.xyz = fma(r1.zzz, v4.xyz, r0.xyz);
	r0.xyz = fma(r1.yyy, v3.xyz, r0.xyz);
	r0.xyz = fma(r1.xxx, v2.xyz, r0.xyz);
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r0 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	o1.v.xy = v1.xy * idx_uniforms2_vs.cb2[0].xy;
	VertexEpilog();
	return;
}

