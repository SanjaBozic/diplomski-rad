#version 460 core
// vs_5_0
// Checksum: 2a8b25a9_1f11e461_fe750d2a_132543d1
// Name: generalmm_d0_ed1_vertexanim_inst

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
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[5]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[9]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[3]; } idx_uniforms2_vs;

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
	r0.xyz = v2.zzz * vec3(1.00000000f, 0.0156250000f, 0.000244140625f);
	r0.xyz = fract(r0.xyz);
	r1.xz = fma(r0.yy, r0.yy, vec2(0.300000012f, 0.00200000009f));
	r1.y = r0.x;
	r1.xyz = r1.xyz * idx_uniforms2_vs.cb2[2].xyw;
	r2.xyz = r1.yyy * idx_uniforms1_vs.cb1[8].xyz;
	r0.x = r0.y * r0.y;
	r0.xyw = r0.xxx * r2.xyz;
	r0.xyw = r0.xyw * vec3(30.0000000f, 30.0000000f, 30.0000000f);
	r2.xyz = v2.xxx * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r2.xyz = fract(r2.xyz);
	r2.xyz = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = r1.www * r2.xyz;
	r1.w = dot(idx_uniforms1_vs.cb1[8].xyz, r2.xyz);
	r1.w = saturate(r1.w * float(4.00000000f));
	r3.w = uintBitsToFloat(uint(0x3f800000));
	r3.xyz = v0.xyz * idx_uniforms2_vs.cb2[0].www;
	r1.x = dot(r3.wyzx, r1.xzzz);
	r4.xyz = r1.xxx * vec3(1.00000000f, 0.713199973f, 1.28170002f);
	r4.xyz = fract(r4.xyz);
	r4.xyz = fma(-r4.xyz, r4.xyz, r4.xyz);
	r4.xyz = r4.xyz * r4.xyz;
	r4.xyz = fma(r4.xyz, vec3(32.0000000f, 32.0000000f, 32.0000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.xyz = r1.yyy * r4.xyz;
	r4.xyz = fma(v0.xyz, idx_uniforms2_vs.cb2[0].www, r1.xyz);
	r1.x = dot(r1.xyz, r1.xyz);
	r1.x = sqrt(r1.x);
	r1.xyz = r1.xxx * r2.xyz;
	r1.xyz = fma(r1.xyz, vec3(3.00000000f, 3.00000000f, 3.00000000f), r3.xyz);
	r0.xyw = fma(r0.xyw, r1.www, r4.xyz);
	r1.xyz = -r0.xyw + r1.xyz;
	r0.xyz = fma(r0.zzz, r1.xyz, r0.xyw);
	r1.x = v3.w;
	r1.y = v4.w;
	r1.z = v5.w;
	r1.xyz = r1.xyz + -idx_uniforms0_vs.cb0[4].xyz;
	r4.xyz = fma(r0.zzz, v5.xyz, r1.xyz);
	r1.xyz = fma(r3.zzz, v5.xyz, r1.xyz);
	r1.xyz = fma(r3.yyy, v4.xyz, r1.xyz);
	r1.xyz = fma(r3.xxx, v3.xyz, r1.xyz);
	r0.yzw = fma(r0.yyy, v4.xyz, r4.xyz);
	r0.xyz = fma(r0.xxx, v3.xyz, r0.yzw);
	r3 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r3 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r3);
	r3 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r3);
	r0.xyz = r0.xyz + idx_uniforms0_vs.cb0[4].xyz;
	r3 = r3 + idx_uniforms1_vs.cb1[3];
	gl_Position.z = fma(idx_uniforms2_vs.cb2[0].x, r3.w, r3.z);
	gl_Position.xyw = r3.xyw;
	o1.v.zw = fma(r0.xz, vec2(3.05175781e-05f, 3.05175781e-05f), vec2(0.500000000f, 0.500000000f));
	o5.v.xyz = r0.xyz;
	r0 = v1 * idx_uniforms2_vs.cb2[1];
	r3.xy = r0.yy * idx_uniforms3_vs.cb3[1].xy;
	r0.xy = fma(r0.xx, idx_uniforms3_vs.cb3[0].xy, r3.xy);
	r0.xy = r0.xy + idx_uniforms3_vs.cb3[2].xy;
	o1.v.xy = r0.xy;
	o2.v.xy = r0.xy;
	r0.xy = r0.ww * idx_uniforms3_vs.cb3[4].xy;
	r0.xy = fma(r0.zz, idx_uniforms3_vs.cb3[3].xy, r0.xy);
	o2.v.zw = r0.xy + idx_uniforms3_vs.cb3[5].xy;
	r0.xyz = r2.yyy * v4.xyz;
	r0.xyz = fma(r2.xxx, v3.xyz, r0.xyz);
	o3.v.xyz = fma(r2.zzz, v5.xyz, r0.xyz);
	r0.xyz = abs(v2.yyy) * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r0.xyz = fract(r0.xyz);
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r2.xyz = r0.yyy * v4.xyz;
	r0.xyw = fma(r0.xxx, v3.xyz, r2.xyz);
	o4.v.xyz = fma(r0.zzz, v5.xyz, r0.xyw);
	r0.x = intBitsToFloat(float(0.00000000f) < v2.y ? int(0xffffffff) : int(0x00000000));
	r0.y = intBitsToFloat(v2.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.x = intBitsToFloat(floatBitsToInt(r0.y) + -floatBitsToInt(r0.x));
	o4.v.w = float(floatBitsToInt(r0.x));
	o6.v = uintBitsToFloat(uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
	o7.v.xyz = v3.xyz;
	o7.v.w = v6.w;
	o8.v.xyz = v4.xyz;
	o9.v.xyz = v5.xyz;
	r1.w = fma(-r1.y, float(0.400000006f), r1.z);
	o10.v = r1.xwxw * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	VertexEpilog();
	return;
}

