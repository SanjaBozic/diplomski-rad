#version 460 core
// vs_5_0
// Checksum: df1ec207_3f09c4c9_3f6d2047_8599f412
// Name: trail

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

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
	r0 = v0.yyyy * idx_uniforms0_vs.cb0[1];
	r0 = fma(v0.xxxx, idx_uniforms0_vs.cb0[0], r0);
	r0 = fma(v0.zzzz, idx_uniforms0_vs.cb0[2], r0);
	r0 = r0 + idx_uniforms0_vs.cb0[3];
	gl_Position = r0;
	r0.x = -r0.z + r0.w;
	r1 = v0.wwww * vec4(1.00000000f, 0.0156250000f, 0.000244140625f, 3.81469727e-06f);
	o1.v = fract(r1);
	r0.y = saturate(r0.x * idx_uniforms0_vs.cb0[13].w);
	r0.z = fma(v0.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r0.z = min(r0.z, idx_uniforms0_vs.cb0[13].y);
	r0.z = -r0.z + float(1.00000000f);
	r0.y = fma(r0.y, r0.z, -idx_uniforms0_vs.cb0[12].x);
	o2.v.w = fma(r0.x, idx_uniforms0_vs.cb0[12].z, r0.y);
	o2.v.xyz = v1.xyz;
	VertexEpilog();
	return;
}

