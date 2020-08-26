#version 460 core
// vs_5_0
// Checksum: 5d1c1edd_35099f39_cfcb2aba_63a99501
// Name: wheelprezvelocity

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[9]; } idx_uniforms1_vs;

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
	r0 = v0.yyyy * idx_uniforms1_vs.cb1[1];
	r0 = fma(v0.xxxx, idx_uniforms1_vs.cb1[0], r0);
	r0 = fma(v0.zzzz, idx_uniforms1_vs.cb1[2], r0);
	r0 = r0 + idx_uniforms1_vs.cb1[3];
	gl_Position = r0;
	o1.v = r0;
	r0.xyz = v0.yzx * vec3(0.00000000f, 1.00000000f, 0.00000000f);
	r0.xyz = fma(v0.zxy, vec3(0.00000000f, 0.00000000f, 1.00000000f), -r0.xyz);
	r0.xyz = fma(-idx_uniforms1_vs.cb1[8].xxx, r0.xyz, v0.xyz);
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r0 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	o2.v = r0 + idx_uniforms1_vs.cb1[3];
	o3.v.xy = v1.xy * idx_uniforms2_vs.cb2[0].xy;
	VertexEpilog();
	return;
}

