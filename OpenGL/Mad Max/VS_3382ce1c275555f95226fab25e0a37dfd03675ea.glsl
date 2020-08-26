#version 460 core
// vs_5_0
// Checksum: 90b87bf0_1a31edf0_815d4a08_78b0dec4
// Name: terrainshadowsimple

layout(location = 0) in vec4 v0;
// gl_Position
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[10]; } idx_uniforms0_vs;

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
	r0 = fma(v0, idx_uniforms2_vs.cb2[0].xyxy, idx_uniforms2_vs.cb2[1]);
	r1.xy = r0.xz + idx_uniforms0_vs.cb0[4].xz;
	r1.xy = r1.xy + -idx_uniforms0_vs.cb0[9].xz;
	r1.x = max(abs(r1.y), abs(r1.x));
	r1.x = saturate(fma(r1.x, idx_uniforms2_vs.cb2[0].z, idx_uniforms2_vs.cb2[0].w));
	r0.w = -r0.y + r0.w;
	r0.y = fma(r1.x, r0.w, r0.y);
	r0.y = r0.y + -idx_uniforms0_vs.cb0[4].y;
	r0.y = r0.y + -idx_uniforms1_vs.cb1[4].x;
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r0 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	VertexEpilog();
	return;
}

