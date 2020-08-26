#version 460 core
// vs_5_0
// Checksum: 6464bcb0_eac83658_c3c882cf_bd4d084b
// Name: pointlightreflection

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

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
	r0.xyz = v0.zxy + -idx_uniforms1_vs.cb1[4].zxy;
	r1.xyz = r0.xyz * vec3(1.00000000f, 0.00000000f, 0.00000000f);
	r1.xyz = fma(r0.zxy, vec3(0.00000000f, 0.00000000f, 1.00000000f), -r1.xyz);
	r0.w = dot(r1.xz, r1.xz);
	r0.w = inversesqrt(r0.w);
	r1.xyz = r0.www * r1.xyz;
	r2.xyz = r0.xyz * r1.yzx;
	r0.xyz = fma(r0.zxy, r1.zxy, -r2.xyz);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = r0.xyz * v1.yyy;
	r0.xyz = fma(r1.xyz, v1.xxx, r0.xyz);
	r0.w = v0.w * idx_uniforms1_vs.cb1[5].x;
	r0.xyz = fma(r0.www, r0.xyz, v0.xyz);
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r0 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	o1.v.xy = v1.xy;
	o2.v.xyz = v2.xyz * idx_uniforms1_vs.cb1[5].yyy;
	VertexEpilog();
	return;
}

