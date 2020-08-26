#version 460 core
// vs_5_0
// Checksum: 32e8187f_43280d4e_6d16b09c_bc336878
// Name: splineroadsimple

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[10]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[1]; } idx_uniforms2_vs;


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
	r0.xy = v0.xz + -idx_uniforms0_vs.cb0[9].xz;
	r0.x = max(abs(r0.y), abs(r0.x));
	r0.x = fma(r0.x, float(0.00200000009f), v0.y);
	r0.x = r0.x + float(0.0199999996f);
	r0 = r0.xxxx * idx_uniforms0_vs.cb0[1];
	r0 = fma(v0.xxxx, idx_uniforms0_vs.cb0[0], r0);
	r0 = fma(v0.zzzz, idx_uniforms0_vs.cb0[2], r0);
	r0 = r0 + idx_uniforms0_vs.cb0[3];
	gl_Position.z = fma(r0.w, float(9.99999975e-06f), r0.z);
	gl_Position.xyw = r0.xyw;
	r0 = v2.yyzz * idx_uniforms2_vs.cb2[0].xxxx;
	r0 = r0 * vec4(255.000000f, 255.000000f, 255.000000f, 255.000000f);
	r1.xz = v2.xx;
	r1.yw = v1.xx;
	r2.xz = idx_uniforms2_vs.cb2[0].xx;
	r2.yw = uintBitsToFloat(uvec2(0x3f800000, 0x3f800000));
	o1.v = fma(r1, r2, r0);
	r0.xyz = v0.xyz + -idx_uniforms0_vs.cb0[9].xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = sqrt(r0.x);
	r0.x = r0.x + float(-600.000000f);
	r0.x = r0.x * float(0.00666666683f);
	r0.x = max(r0.x, float(0.00000000f));
	o2.v.x = saturate(-r0.x + v2.w);
	o2.v.y = v2.x;
	VertexEpilog();
	return;
}

