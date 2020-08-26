#version 460 core
// vs_5_0
// Checksum: fdbd673c_0365edcd_bd721cb1_485b46f6
// Name: wheeloutline

layout(location = 0) in vec4 v0;
layout(location = 2) in vec4 v2;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[4]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[6]; } idx_uniforms1_vs;


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
	r0.xyz = v2.xxx * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r0.xyz = fract(r0.xyz);
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r1.xyz = r0.yyy * idx_uniforms1_vs.cb1[1].xyz;
	r0.xyw = fma(r0.xxx, idx_uniforms1_vs.cb1[0].xyz, r1.xyz);
	r0.xyz = fma(r0.zzz, idx_uniforms1_vs.cb1[2].xyz, r0.xyw);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r1.xyz = r0.yyy * idx_uniforms0_vs.cb0[1].xyz;
	r1.xyz = fma(r0.xxx, idx_uniforms0_vs.cb0[0].xyz, r1.xyz);
	r1.xyz = fma(r0.zzz, idx_uniforms0_vs.cb0[2].xyz, r1.xyz);
	o1.v.yzw = r0.xyz;
	r0.x = dot(r1.xyz, r1.xyz);
	r0.x = inversesqrt(r0.x);
	r0.xyz = r0.xxx * r1.xyz;
	r1 = v0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(v0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r1 = fma(v0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	r1 = r1 + idx_uniforms1_vs.cb1[3];
	r2 = r1.yyyy * idx_uniforms0_vs.cb0[1];
	r2 = fma(r1.xxxx, idx_uniforms0_vs.cb0[0], r2);
	r2 = fma(r1.zzzz, idx_uniforms0_vs.cb0[2], r2);
	r2 = fma(r1.wwww, idx_uniforms0_vs.cb0[3], r2);
	o2.v.xyz = r1.xyz;
	r0.w = r2.w * idx_uniforms1_vs.cb1[4].x;
	gl_Position.xyz = fma(r0.xyz, r0.www, r2.xyz);
	gl_Position.w = r2.w;
	r0.xyz = v0.xyz * idx_uniforms1_vs.cb1[4].yyy;
	r0.w = uintBitsToFloat(uint(0x3f800000));
	o1.v.x = dot(r0, idx_uniforms1_vs.cb1[5]);
	VertexEpilog();
	return;
}

