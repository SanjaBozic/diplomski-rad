#version 460 core
// vs_5_0
// Checksum: 72b86b44_97e27029_60eedc0c_b9ea02c3
// Name: window

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
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
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[32]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[14]; } idx_uniforms1_vs;


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
	r0 = v0.yyyy * idx_uniforms1_vs.cb1[8];
	r0 = fma(v0.xxxx, idx_uniforms1_vs.cb1[7], r0);
	r0 = fma(v0.zzzz, idx_uniforms1_vs.cb1[9], r0);
	r0 = r0 + idx_uniforms1_vs.cb1[10];
	gl_Position = r0;
	r1.xy = v1.yy * idx_uniforms1_vs.cb1[5].xy;
	r1.xy = fma(v1.xx, idx_uniforms1_vs.cb1[4].xy, r1.xy);
	o1.v.xy = r1.xy + idx_uniforms1_vs.cb1[6].xy;
	o1.v.zw = v1.zw;
	r1.xyz = v0.yyy * idx_uniforms1_vs.cb1[1].xyz;
	r1.xyz = fma(v0.xxx, idx_uniforms1_vs.cb1[0].xyz, r1.xyz);
	r1.xyz = fma(v0.zzz, idx_uniforms1_vs.cb1[2].xyz, r1.xyz);
	r1.xyz = r1.xyz + idx_uniforms1_vs.cb1[3].xyz;
	r2.xyz = r1.xyz + -idx_uniforms0_vs.cb0[9].xyz;
	r3.xyz = fma(idx_uniforms0_vs.cb0[24].xyz, r2.xxx, idx_uniforms0_vs.cb0[27].xyz);
	r3.xyz = fma(idx_uniforms0_vs.cb0[25].xyz, r2.yyy, r3.xyz);
	o2.v.xyz = fma(idx_uniforms0_vs.cb0[26].xyz, r2.zzz, r3.xyz);
	r3.xyz = fma(idx_uniforms0_vs.cb0[28].xyz, r2.xxx, idx_uniforms0_vs.cb0[31].xyz);
	r2.xyw = fma(idx_uniforms0_vs.cb0[29].xyz, r2.yyy, r3.xyz);
	o3.v.xyz = fma(idx_uniforms0_vs.cb0[30].xyz, r2.zzz, r2.xyw);
	r1.w = fma(r1.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	o4.v.xyz = r1.xyz;
	r1.x = min(r1.w, idx_uniforms0_vs.cb0[13].y);
	r1.x = -r1.x + float(1.00000000f);
	r0.z = -r0.z + r0.w;
	r1.y = saturate(r0.z * idx_uniforms0_vs.cb0[13].w);
	r1.x = fma(r1.y, r1.x, -idx_uniforms0_vs.cb0[12].x);
	o4.v.w = fma(r0.z, idx_uniforms0_vs.cb0[12].z, r1.x);
	r1.xyz = abs(v2.yyy) * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r1.xyz = fract(r1.xyz);
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.z = dot(r1.xyz, r1.xyz);
	r0.z = inversesqrt(r0.z);
	r1.xyz = r0.zzz * r1.xyz;
	r2.xyz = r1.yyy * idx_uniforms1_vs.cb1[1].xyz;
	r1.xyw = fma(r1.xxx, idx_uniforms1_vs.cb1[0].xyz, r2.xyz);
	r1.xyz = fma(r1.zzz, idx_uniforms1_vs.cb1[2].xyz, r1.xyw);
	o5.v.xyz = r1.xyz;
	r0.xyz = r0.xwy * vec3(0.500000000f, 0.500000000f, -0.500000000f);
	o7.v.w = r0.w;
	o5.v.w = r0.y + r0.x;
	o6.v.w = r0.y + r0.z;
	r0.xyz = v2.xxx * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r0.xyz = fract(r0.xyz);
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r2.xyz = r0.yyy * idx_uniforms1_vs.cb1[1].xyz;
	r0.xyw = fma(r0.xxx, idx_uniforms1_vs.cb1[0].xyz, r2.xyz);
	r0.xyz = fma(r0.zzz, idx_uniforms1_vs.cb1[2].xyz, r0.xyw);
	r2.xyz = r1.yzx * r0.zxy;
	r1.xyz = fma(r0.yzx, r1.zxy, -r2.xyz);
	r0.w = intBitsToFloat(float(0.00000000f) < v2.y ? int(0xffffffff) : int(0x00000000));
	r1.w = intBitsToFloat(v2.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.w = intBitsToFloat(floatBitsToInt(r1.w) + -floatBitsToInt(r0.w));
	r0.w = float(floatBitsToInt(r0.w));
	o6.v.xyz = r0.www * r1.xyz;
	o7.v.xyz = r0.xyz;
	r1.xyz = r0.yyy * idx_uniforms1_vs.cb1[12].xyz;
	r0.xyw = fma(r0.xxx, idx_uniforms1_vs.cb1[11].xyz, r1.xyz);
	r0.xyz = fma(r0.zzz, idx_uniforms1_vs.cb1[13].xyz, r0.xyw);
	r0.z = dot(r0.xyz, r0.xyz);
	r0.z = inversesqrt(r0.z);
	r0.xy = r0.zz * r0.xy;
	r0.z = -1.f * r0.y;
	o8.v.xy = r0.xz;
	r0.xyz = v2.zzz * vec3(1.00000000f, 0.0156250000f, 0.000244140625f);
	o9.v.xyz = fract(r0.xyz);
	VertexEpilog();
	return;
}

