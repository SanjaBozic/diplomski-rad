#version 460 core
// vs_5_0
// Checksum: 847d9d58_fa94b147_2af512cd_ec167fa3
// Name: splineroad

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 v3;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
layout(location = 4) out idx_Varying4 { vec4 v; } o4;
layout(location = 5) out idx_Varying5 { vec4 v; } o5;
layout(location = 6) out idx_Varying6 { vec4 v; } o6;
layout(location = 7) out idx_Varying7 { vec4 v; } o7;
layout(location = 8) out idx_Varying8 { vec4 v; } o8;
layout(location = 9) out idx_Varying9 { vec4 v; } o9;
layout(location = 10) out idx_Varying10 { vec4 v; } o10;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[32]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[1]; } idx_uniforms1_vs;

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
	r0.x = -r0.z + r0.w;
	r0.yzw = fma(idx_uniforms0_vs.cb0[20].xyz, v0.xxx, idx_uniforms0_vs.cb0[23].xyz);
	r0.yzw = fma(idx_uniforms0_vs.cb0[21].xyz, v0.yyy, r0.yzw);
	o1.v.xyz = fma(idx_uniforms0_vs.cb0[22].xyz, v0.zzz, r0.yzw);
	r0.yzw = fma(idx_uniforms0_vs.cb0[24].xyz, v0.xxx, idx_uniforms0_vs.cb0[27].xyz);
	r0.yzw = fma(idx_uniforms0_vs.cb0[25].xyz, v0.yyy, r0.yzw);
	o2.v.xyz = fma(idx_uniforms0_vs.cb0[26].xyz, v0.zzz, r0.yzw);
	r0.yzw = fma(idx_uniforms0_vs.cb0[28].xyz, v0.xxx, idx_uniforms0_vs.cb0[31].xyz);
	r0.yzw = fma(idx_uniforms0_vs.cb0[29].xyz, v0.yyy, r0.yzw);
	o3.v.xyz = fma(idx_uniforms0_vs.cb0[30].xyz, v0.zzz, r0.yzw);
	r0.yzw = v0.xyz + -idx_uniforms0_vs.cb0[9].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = sqrt(r0.y);
	r0.y = fma(r0.y, idx_uniforms1_vs.cb1[0].y, -idx_uniforms1_vs.cb1[0].x);
	r0.y = max(r0.y, float(0.00000000f));
	o4.v.w = saturate(-r0.y + v2.w);
	o4.v.xyz = v0.xyz;
	o5.v.z = v3.w;
	o5.v.w = v1.x;
	r1.xz = v2.xx;
	r1.yw = v1.yy;
	o5.v.xy = fma(r1.zw, vec2(1.20000005f, 1.00000000f), vec2(-0.109375000f, -0.00000000f));
	r2 = v2.yyzz * idx_uniforms2_vs.cb2[0].xxxx;
	r2 = r2 * vec4(255.000000f, 255.000000f, 255.000000f, 255.000000f);
	r3.xz = idx_uniforms2_vs.cb2[0].xx;
	r3.yw = uintBitsToFloat(uvec2(0x3f800000, 0x3f800000));
	o6.v = fma(r1, r3, r2);
	r0.yz = r1.zw + vec2(-0.500000000f, -0.500000000f);
	r0.yz = fma(r0.yz, vec2(0.750000000f, 0.750000000f), vec2(0.500000000f, 0.500000000f));
	o7.v.zw = r0.yz + r0.yz;
	o7.v.xy = v0.xz * vec2(0.300000012f, 0.300000012f);
	r0.y = saturate(r0.x * idx_uniforms0_vs.cb0[13].w);
	r0.z = fma(v0.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r0.z = min(r0.z, idx_uniforms0_vs.cb0[13].y);
	r0.z = -r0.z + float(1.00000000f);
	r0.y = fma(r0.y, r0.z, -idx_uniforms0_vs.cb0[12].x);
	o8.v.w = fma(r0.x, idx_uniforms0_vs.cb0[12].z, r0.y);
	o8.v.xyz = fma(v3.xyz, vec3(2.00787401f, 2.00787401f, 2.00787401f), vec3(-1.00787401f, -1.00787401f, -1.00787401f));
	r0.xyz = fma(v3.zxy, vec3(2.00787401f, 2.00787401f, 2.00787401f), vec3(-1.00787401f, -1.00787401f, -1.00787401f));
	r1.xyz = r0.zxy * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r1.xyz = fma(r0.xyz, vec3(0.00000000f, 0.00000000f, -1.00000000f), -r1.xyz);
	o9.v.xyz = r1.xyz;
	r2.xyz = r0.xyz * r1.yzx;
	o10.v.xyz = fma(r0.zxy, r1.zxy, -r2.xyz);
	VertexEpilog();
	return;
}

