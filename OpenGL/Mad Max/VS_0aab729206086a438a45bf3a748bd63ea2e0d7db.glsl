#version 460 core
// vs_5_0
// Checksum: 72538322_45f39e50_f3594259_c9034724
// Name: skidmarks

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[1]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs0 { vec4 cb0[4]; } idx_uniforms0_vs;


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
	r0 = v0.yyyy * idx_uniforms0_vs.cb0[1];
	r0 = fma(v0.xxxx, idx_uniforms0_vs.cb0[0], r0);
	r0 = fma(v0.zzzz, idx_uniforms0_vs.cb0[2], r0);
	r0 = r0 + idx_uniforms0_vs.cb0[3];
	gl_Position = r0 + vec4(0.00000000f, 0.00000000f, 9.99999975e-05f, 0.00000000f);
	o1.v.w = -r0.z + r0.w;
	o1.v.xyz = v1.xyw * vec3(1.00000000f, 8.00000000f, 1.00000000f);
	r0 = v0.wwww * vec4(1.00000000f, 0.0156250000f, 0.000244140625f, 3.81469727e-06f);
	r0 = fract(r0);
	r1.xyz = fma(r0.xyz, vec3(0.610612035f, 0.610612035f, 0.610612035f), vec3(0.682171106f, 0.682171106f, 0.682171106f));
	r0.xyz = r0.xyz + r0.xyz;
	o2.v.w = r0.w * idx_uniforms1_vs.cb1[0].w;
	r1.xyz = fma(r0.xyz, r1.xyz, vec3(0.0125228781f, 0.0125228781f, 0.0125228781f));
	o2.v.xyz = r0.xyz * r1.xyz;
	VertexEpilog();
	return;
}

