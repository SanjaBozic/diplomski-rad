#version 460 core
// vs_5_0
// Checksum: 7e5c6006_1502e46d_62feb13e_04e80a3f
// Name: generalmm_d1_ed2_wireaa

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
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

layout (std140) uniform cb_vs0 { vec4 cb0[24]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[8]; } idx_uniforms1_vs;

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
	r0.x = v0.y * idx_uniforms1_vs.cb1[1].w;
	r0.x = fma(v0.x, idx_uniforms1_vs.cb1[0].w, r0.x);
	r0.x = fma(v0.z, idx_uniforms1_vs.cb1[2].w, r0.x);
	r0.x = r0.x + idx_uniforms1_vs.cb1[3].w;
	r0.x = saturate(r0.x * idx_uniforms2_vs.cb2[3].x);
	r0.y = saturate(r0.x + -v0.w);
	r0.x = saturate(v0.w / r0.x);
	r0.y = r0.y / idx_uniforms2_vs.cb2[0].w;
	r1.xyz = v3.xxx * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r1.xyz = fract(r1.xyz);
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.z = dot(r1.xyz, r1.xyz);
	r0.z = inversesqrt(r0.z);
	r1.xyz = r0.zzz * r1.xyz;
	r0.yzw = fma(r0.yyy, r1.xyz, v0.xyz);
	r2 = r0.zzzz * idx_uniforms1_vs.cb1[1];
	r2 = fma(r0.yyyy, idx_uniforms1_vs.cb1[0], r2);
	r2 = fma(r0.wwww, idx_uniforms1_vs.cb1[2], r2);
	r0.yzw = r0.yzw * idx_uniforms2_vs.cb2[0].www;
	r2 = r2 + idx_uniforms1_vs.cb1[3];
	gl_Position.z = fma(idx_uniforms2_vs.cb2[0].x, r2.w, r2.z);
	gl_Position.xyw = r2.xyw;
	o9.v.w = -r2.z + r2.w;
	r2.xyz = r0.zzz * idx_uniforms1_vs.cb1[5].xyz;
	r2.xyz = fma(r0.yyy, idx_uniforms1_vs.cb1[4].xyz, r2.xyz);
	r0.yzw = fma(r0.www, idx_uniforms1_vs.cb1[6].xyz, r2.xyz);
	r2.xyz = r0.yzw + idx_uniforms1_vs.cb1[7].xyz;
	o1.v.zw = fma(r2.xz, vec2(3.05175781e-05f, 3.05175781e-05f), vec2(0.500000000f, 0.500000000f));
	r3 = v1 * idx_uniforms2_vs.cb2[1];
	r0.yz = r3.ww * idx_uniforms3_vs.cb3[4].xy;
	r0.yz = fma(r3.zz, idx_uniforms3_vs.cb3[3].xy, r0.yz);
	o1.v.xy = r0.yz + idx_uniforms3_vs.cb3[5].xy;
	r0.yz = r3.yy * idx_uniforms3_vs.cb3[1].xy;
	r0.yz = fma(r3.xx, idx_uniforms3_vs.cb3[0].xy, r0.yz);
	o2.v.xy = r0.yz + idx_uniforms3_vs.cb3[2].xy;
	r0.yzw = r1.yyy * idx_uniforms1_vs.cb1[5].xyz;
	r0.yzw = fma(r1.xxx, idx_uniforms1_vs.cb1[4].xyz, r0.yzw);
	o3.v.xyz = fma(r1.zzz, idx_uniforms1_vs.cb1[6].xyz, r0.yzw);
	r0.yzw = abs(v3.yyy) * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r0.yzw = fract(r0.yzw);
	r0.yzw = fma(r0.yzw, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = inversesqrt(r1.x);
	r0.yzw = r0.yzw * r1.xxx;
	r1.xyz = r0.zzz * idx_uniforms1_vs.cb1[5].xyz;
	r1.xyz = fma(r0.yyy, idx_uniforms1_vs.cb1[4].xyz, r1.xyz);
	o4.v.xyz = fma(r0.www, idx_uniforms1_vs.cb1[6].xyz, r1.xyz);
	r0.y = intBitsToFloat(float(0.00000000f) < v3.y ? int(0xffffffff) : int(0x00000000));
	r0.z = intBitsToFloat(v3.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.y = intBitsToFloat(floatBitsToInt(r0.z) + -floatBitsToInt(r0.y));
	o4.v.w = float(floatBitsToInt(r0.y));
	o5.v.xyz = r2.xyz;
	r1 = v3.zzzz * vec4(1.00000000f, 0.0156250000f, 0.000244140625f, 3.81469727e-06f);
	r1 = fract(r1);
	o6.v.w = r0.x * r1.w;
	o6.v.xyz = r1.xyz;
	r0.xyz = r2.xyz + -idx_uniforms0_vs.cb0[9].xyz;
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
	r2.w = fma(-r2.y, float(0.400000006f), r2.z);
	o10.v = r2.xwxw * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	VertexEpilog();
	return;
}

