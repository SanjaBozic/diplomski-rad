#version 460 core
// vs_5_0
// Checksum: c0111263_12609b8a_37561f94_1b72a0aa
// Name: twister

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 v3;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[8]; } idx_uniforms1_vs;

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
	r0.x = v2.w * idx_uniforms1_vs.cb1[7].x;
	r0.xyz = fma(v2.xyz, r0.xxx, v0.xyz);
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r1 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	r0.xyz = -r0.xyz + idx_uniforms0_vs.cb0[9].xyz;
	r1 = fma(v0.wwww, idx_uniforms1_vs.cb1[3], r1);
	gl_Position = r1;
	r0.w = -r1.z + r1.w;
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r1.x);
	r0.xyz = r0.xyz * r1.xxx;
	r0.x = dot(r0.xyz, v2.xyz);
	r0.x = max(r0.x, float(0.00000000f));
	r0.x = -r0.x + float(1.00000000f);
	r0.x = fma(-r0.x, r0.x, float(1.00000000f));
	r0.x = r0.x * v3.w;
	r0.y = r0.x * r0.x;
	o1.v.w = dot(r0.yy, r0.xx);
	r0.x = dot(-idx_uniforms0_vs.cb0[8].xyz, v2.xyz);
	r0.x = r0.x + float(0.250000000f);
	r0.x = max(r0.x, float(0.300000012f));
	o1.v.xyz = fma(idx_uniforms1_vs.cb1[5].xyz, r0.xxx, idx_uniforms0_vs.cb0[6].xyz);
	r0.x = saturate(r0.w * idx_uniforms0_vs.cb0[13].w);
	r0.y = fma(v0.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r0.y = min(r0.y, idx_uniforms0_vs.cb0[13].y);
	r0.y = -r0.y + float(1.00000000f);
	r0.x = fma(r0.x, r0.y, -idx_uniforms0_vs.cb0[12].x);
	o2.v.z = fma(r0.w, idx_uniforms0_vs.cb0[12].z, r0.x);
	o2.v.xy = v1.xy;
	VertexEpilog();
	return;
}

