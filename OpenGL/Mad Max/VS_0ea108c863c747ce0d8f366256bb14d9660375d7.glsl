#version 460 core
// vs_5_0
// Checksum: 9c2f77e7_5c14deeb_cf9919fc_ee52e18e
// Name: generalmm_d1_wireaa_inst

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 v3;
layout(location = 4) in vec4 v4;
layout(location = 5) in vec4 v5;
layout(location = 6) in vec4 v6;
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

layout (std140) uniform cb_vs0 { vec4 cb0[24]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[9]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[4]; } idx_uniforms2_vs;

layout (std140) uniform cb_vs3 { vec4 cb3[6]; } idx_uniforms3_vs;


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
	r0.x = v3.w;
	r0.y = v4.w;
	r0.z = v5.w;
	r0.xyz = r0.xyz + -idx_uniforms0_vs.cb0[4].xyz;
	r0.w = v0.y * idx_uniforms1_vs.cb1[1].w;
	r0.w = fma(v0.x, idx_uniforms1_vs.cb1[0].w, r0.w);
	r0.w = fma(v0.z, idx_uniforms1_vs.cb1[2].w, r0.w);
	r0.w = r0.w + idx_uniforms1_vs.cb1[3].w;
	r0.w = saturate(r0.w * idx_uniforms2_vs.cb2[3].x);
	r1.x = saturate(r0.w + -v0.w);
	r0.w = saturate(v0.w / r0.w);
	r1.x = r1.x / idx_uniforms2_vs.cb2[0].w;
	r1.yzw = v2.xxx * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r1.yzw = fract(r1.yzw);
	r1.yzw = fma(r1.yzw, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.x = dot(r1.yzw, r1.yzw);
	r2.x = inversesqrt(r2.x);
	r1.yzw = r1.yzw * r2.xxx;
	r2.xyz = fma(r1.xxx, r1.yzw, v0.xyz);
	r2.xyz = r2.xyz * idx_uniforms2_vs.cb2[0].www;
	r0.xyz = fma(r2.zzz, v5.xyz, r0.xyz);
	r0.xyz = fma(r2.yyy, v4.xyz, r0.xyz);
	r0.xyz = fma(r2.xxx, v3.xyz, r0.xyz);
	r2 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r2 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r2);
	r2 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r2);
	r3.xyz = r0.xyz + idx_uniforms0_vs.cb0[4].xyz;
	r2 = r2 + idx_uniforms1_vs.cb1[3];
	gl_Position.z = fma(idx_uniforms2_vs.cb2[0].x, r2.w, r2.z);
	gl_Position.xyw = r2.xyw;
	o9.v.w = -r2.z + r2.w;
	o1.v.zw = fma(r3.xz, vec2(3.05175781e-05f, 3.05175781e-05f), vec2(0.500000000f, 0.500000000f));
	r2 = v1 * idx_uniforms2_vs.cb2[1];
	r0.xy = r2.ww * idx_uniforms3_vs.cb3[4].xy;
	r0.xy = fma(r2.zz, idx_uniforms3_vs.cb3[3].xy, r0.xy);
	o1.v.xy = r0.xy + idx_uniforms3_vs.cb3[5].xy;
	r0.xy = r2.yy * idx_uniforms3_vs.cb3[1].xy;
	r0.xy = fma(r2.xx, idx_uniforms3_vs.cb3[0].xy, r0.xy);
	o2.v.xy = r0.xy + idx_uniforms3_vs.cb3[2].xy;
	r0.xyz = r1.zzz * v4.xyz;
	r0.xyz = fma(r1.yyy, v3.xyz, r0.xyz);
	o3.v.xyz = fma(r1.www, v5.xyz, r0.xyz);
	r0.xyz = abs(v2.yyy) * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r0.xyz = fract(r0.xyz);
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r1.x);
	r0.xyz = r0.xyz * r1.xxx;
	r1.xyz = r0.yyy * v4.xyz;
	r1.xyz = fma(r0.xxx, v3.xyz, r1.xyz);
	o4.v.xyz = fma(r0.zzz, v5.xyz, r1.xyz);
	r0.x = intBitsToFloat(float(0.00000000f) < v2.y ? int(0xffffffff) : int(0x00000000));
	r0.y = intBitsToFloat(v2.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.x = intBitsToFloat(floatBitsToInt(r0.y) + -floatBitsToInt(r0.x));
	o4.v.w = float(floatBitsToInt(r0.x));
	o5.v.xyz = r3.xyz;
	r1 = v2.zzzz * vec4(1.00000000f, 0.0156250000f, 0.000244140625f, 3.81469727e-06f);
	r1 = fract(r1);
	o6.v.w = r0.w * r1.w;
	r0.xyz = fma(v6.xyz, idx_uniforms1_vs.cb1[8].www, vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.xyz = fma(idx_uniforms2_vs.cb2[3].yyy, r0.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	o6.v.xyz = r0.xyz * r1.xyz;
	r0.xyz = r3.xyz + -idx_uniforms0_vs.cb0[9].xyz;
	r1.xyz = fma(idx_uniforms0_vs.cb0[20].xyz, r0.xxx, idx_uniforms0_vs.cb0[23].xyz);
	r0.xyw = fma(idx_uniforms0_vs.cb0[21].xyz, r0.yyy, r1.xyz);
	r0.xyz = fma(idx_uniforms0_vs.cb0[22].xyz, r0.zzz, r0.xyw);
	o7.v.xyz = r0.xyz;
	r1.x = idx_uniforms0_vs.cb0[16].w;
	r1.z = uintBitsToFloat(uint(0x3f800000));
	o8.v.xyz = fma(r0.xyz, r1.xxz, idx_uniforms0_vs.cb0[16].xyz);
	r1.x = idx_uniforms0_vs.cb0[17].w;
	r1.z = uintBitsToFloat(uint(0x3f800000));
	o9.v.xyz = fma(r0.xyz, r1.xxz, idx_uniforms0_vs.cb0[17].xyz);
	r3.w = fma(-r3.y, float(0.400000006f), r3.z);
	o10.v = r3.xwxw * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	VertexEpilog();
	return;
}

