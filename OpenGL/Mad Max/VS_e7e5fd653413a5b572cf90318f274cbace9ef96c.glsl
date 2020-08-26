#version 460 core
// vs_5_0
// Checksum: 57aebdf0_adac00a1_77c9763a_8bdab08a
// Name: terrainshaderforest

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[14]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[5]; } idx_uniforms1_vs;

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

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0 = v0 * idx_uniforms2_vs.cb2[1].xyxy;
	r0 = fma(r0, vec4(32767.0000f, 32767.0000f, 32767.0000f, 32767.0000f), idx_uniforms2_vs.cb2[0].xyzy);
	r1.x = max(abs(r0.z), abs(r0.x));
	r1.y = saturate(fma(r1.x, idx_uniforms2_vs.cb2[1].z, idx_uniforms2_vs.cb2[1].w));
	r1.xz = saturate(fma(r1.xx, idx_uniforms1_vs.cb1[4].wy, -idx_uniforms1_vs.cb1[4].zx));
	r0.w = -r0.y + r0.w;
	r0.y = fma(r1.y, r0.w, r0.y);
	r2 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r2 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r2);
	r2 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r2);
	r0.xyz = r0.xyz + idx_uniforms0_vs.cb0[9].xyz;
	r2 = r2 + idx_uniforms1_vs.cb1[3];
	gl_Position.xyw = r2.xyw;
	r0.w = fma(r2.w, float(9.99999997e-07f), r2.z);
	r1.y = -r0.w + r2.w;
	gl_Position.z = r0.w;
	r2 = r0.xzxz + vec4(16384.0000f, 16384.0000f, 0.00000000f, 0.00000000f);
	r0.x = fma(r0.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r0.x = min(r0.x, idx_uniforms0_vs.cb0[13].y);
	r0.x = -r0.x + float(1.00000000f);
	o1.v = r2 * vec4(3.05175781e-05f, 3.05175781e-05f, 0.00249999994f, 0.00249999994f);
	r0.y = -r1.x + float(1.00000000f);
	o2.v.y = min(r0.y, r1.z);
	r0.y = saturate(r1.y * idx_uniforms0_vs.cb0[13].w);
	r0.x = fma(r0.y, r0.x, -idx_uniforms0_vs.cb0[12].x);
	o2.v.x = fma(r1.y, idx_uniforms0_vs.cb0[12].z, r0.x);
	VertexEpilog();
	return;
}

