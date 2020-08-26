#version 460 core
// vs_5_0
// Checksum: 92e25008_04e3cb3b_977233f6_fe40ede8
// Name: particleeffectdebugtexcoordtrail

layout(location = 0) in vec4 v0;
layout(location = 4) in vec4 v4;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[4]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[4]; } idx_uniforms2_vs;


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
	r0.xyz = v0.xyz + idx_uniforms2_vs.cb2[3].xyz;
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r0 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	o1.v.xy = v4.xy * vec2(31.9990234f, 31.9990234f);
	o1.v.zw = uintBitsToFloat(uvec2(0x00000000, 0x3f800000));
	o2.v.xy = v4.xy * vec2(31.9990234f, 31.9990234f);
	VertexEpilog();
	return;
}

