#version 460 core
// vs_5_0
// Checksum: b5f31305_71e6e0e1_b8a72181_5af232d2
// Name: fastterrainshader_reflection

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
layout(location = 4) out idx_Varying4 { vec4 v; } o4;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[14]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[4]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[3]; } idx_uniforms2_vs;


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
	r1.x = max(abs(r0.z), abs(r0.x));
	r1.x = saturate(fma(r1.x, idx_uniforms2_vs.cb2[0].z, idx_uniforms2_vs.cb2[0].w));
	r0.w = -r0.y + r0.w;
	r0.w = fma(r1.x, r0.w, r0.y);
	r0.y = r0.w + -idx_uniforms0_vs.cb0[9].y;
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r1 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	r0.xyz = r0.xyz + idx_uniforms0_vs.cb0[9].xyz;
	r1 = r1 + idx_uniforms1_vs.cb1[3];
	gl_Position = r1;
	r0.w = -r1.z + r1.w;
	o1.v.zw = fma(r0.xz, vec2(3.05175781e-05f, 3.05175781e-05f), vec2(0.500000000f, 0.500000000f));
	o1.v.xy = fma(v0.xz, idx_uniforms2_vs.cb2[2].zz, idx_uniforms2_vs.cb2[2].xy);
	r1.x = saturate(r0.w * idx_uniforms0_vs.cb0[13].w);
	r1.y = fma(r0.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	o2.v.xyz = r0.xyz;
	r0.x = min(r1.y, idx_uniforms0_vs.cb0[13].y);
	r0.x = -r0.x + float(1.00000000f);
	r0.x = fma(r1.x, r0.x, -idx_uniforms0_vs.cb0[12].x);
	o2.v.w = fma(r0.w, idx_uniforms0_vs.cb0[12].z, r0.x);
	o3.v.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
	o4.v.xyz = v1.xyz + vec3(-0.500000000f, -0.500000000f, -0.500000000f);
	VertexEpilog();
	return;
}

