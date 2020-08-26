#version 460 core
// vs_5_0
// Checksum: c832bce1_f15b2900_0bc00bcd_73ff8ee8
// Name: twisterdust

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[6]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs0 { vec4 cb0[14]; } idx_uniforms0_vs;


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

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0 = v0.yyyy * idx_uniforms1_vs.cb1[1];
	r0 = fma(v0.xxxx, idx_uniforms1_vs.cb1[0], r0);
	r0 = fma(v0.zzzz, idx_uniforms1_vs.cb1[2], r0);
	r0 = fma(v0.wwww, idx_uniforms1_vs.cb1[3], r0);
	gl_Position = r0;
	r0.x = -r0.z + r0.w;
	r0.y = max(v1.z, float(0.300000012f));
	o1.v.xyz = fma(idx_uniforms1_vs.cb1[5].xyz, r0.yyy, idx_uniforms1_vs.cb1[4].xyz);
	o1.v.w = v1.w;
	r0.y = saturate(r0.x * idx_uniforms0_vs.cb0[13].w);
	r0.z = fma(v0.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r0.z = min(r0.z, idx_uniforms0_vs.cb0[13].y);
	r0.z = -r0.z + float(1.00000000f);
	r0.y = fma(r0.y, r0.z, -idx_uniforms0_vs.cb0[12].x);
	o2.v.z = fma(r0.x, idx_uniforms0_vs.cb0[12].z, r0.y);
	o2.v.xy = v2.xy;
	VertexEpilog();
	return;
}

