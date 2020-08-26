#version 460 core
// vs_5_0
// Checksum: 4cf03b9e_4a9f259a_d000f79d_1e260d39
// Name: deformablewindow

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
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[32]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[8]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[16]; } idx_uniforms2_vs;


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
	r0.xyz = -v0.xyz + idx_uniforms2_vs.cb2[0].xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = saturate(fma(-r0.x, idx_uniforms2_vs.cb2[0].w, float(1.00000000f)));
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[1].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[1].w, float(1.00000000f)));
	r0.x = r0.y + r0.x;
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[2].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.z = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[2].w, float(1.00000000f)));
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[8].w, float(1.00000000f)));
	r0.x = r0.z + r0.x;
	r1.xyz = -v0.xyz + idx_uniforms2_vs.cb2[3].xyz;
	r0.z = dot(r1.xyz, r1.xyz);
	r0.w = saturate(fma(-r0.z, idx_uniforms2_vs.cb2[3].w, float(1.00000000f)));
	r0.z = saturate(fma(-r0.z, idx_uniforms2_vs.cb2[9].w, float(1.00000000f)));
	r0.x = r0.w + r0.x;
	r1.xyz = -v0.xyz + idx_uniforms2_vs.cb2[4].xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = saturate(fma(-r0.w, idx_uniforms2_vs.cb2[4].w, float(1.00000000f)));
	r0.x = r0.w + r0.x;
	r1.xyz = -v0.xyz + idx_uniforms2_vs.cb2[5].xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = saturate(fma(-r0.w, idx_uniforms2_vs.cb2[5].w, float(1.00000000f)));
	r0.x = r0.w + r0.x;
	r1.xyz = -v0.xyz + idx_uniforms2_vs.cb2[6].xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = saturate(fma(-r0.w, idx_uniforms2_vs.cb2[6].w, float(1.00000000f)));
	r0.x = r0.w + r0.x;
	r1.xyz = -v0.xyz + idx_uniforms2_vs.cb2[7].xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = saturate(fma(-r0.w, idx_uniforms2_vs.cb2[7].w, float(1.00000000f)));
	r0.x = r0.w + r0.x;
	r0.x = r0.y + r0.x;
	r0.x = r0.z + r0.x;
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[10].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[10].w, float(1.00000000f)));
	r0.x = r0.y + r0.x;
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[11].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[11].w, float(1.00000000f)));
	r0.x = r0.y + r0.x;
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[12].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[12].w, float(1.00000000f)));
	r0.x = r0.y + r0.x;
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[13].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[13].w, float(1.00000000f)));
	r0.x = r0.y + r0.x;
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[14].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[14].w, float(1.00000000f)));
	r0.x = r0.y + r0.x;
	r0.x = -r0.x + float(1.00000000f);
	r0.w = max(r0.x, float(0.00000000f));
	r1.x = -r0.w + float(1.00000000f);
	r1.x = r1.x * idx_uniforms2_vs.cb2[15].x;
	r1.yzw = v0.www * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r1.yzw = fract(r1.yzw);
	r1.yzw = fma(r1.yzw, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.xyz = fma(r1.xxx, r1.yzw, v0.xyz);
	r2 = r1.yyyy * idx_uniforms1_vs.cb1[5];
	r2 = fma(r1.xxxx, idx_uniforms1_vs.cb1[4], r2);
	r2 = fma(r1.zzzz, idx_uniforms1_vs.cb1[6], r2);
	r2 = r2 + idx_uniforms1_vs.cb1[7];
	gl_Position = r2;
	r3.xyz = r1.yyy * idx_uniforms1_vs.cb1[1].xyz;
	r3.xyz = fma(r1.xxx, idx_uniforms1_vs.cb1[0].xyz, r3.xyz);
	r3.xyz = fma(r1.zzz, idx_uniforms1_vs.cb1[2].xyz, r3.xyz);
	r0.xyz = r3.xyz + idx_uniforms1_vs.cb1[3].xyz;
	o1.v.zw = fma(r0.xz, vec2(3.05175781e-05f, 3.05175781e-05f), vec2(0.500000000f, 0.500000000f));
	o1.v.xy = v2.xy;
	r3.xyz = r0.xyz + -idx_uniforms0_vs.cb0[9].xyz;
	r4.xyz = fma(idx_uniforms0_vs.cb0[20].xyz, r3.xxx, idx_uniforms0_vs.cb0[23].xyz);
	r4.xyz = fma(idx_uniforms0_vs.cb0[21].xyz, r3.yyy, r4.xyz);
	o2.v.xyz = fma(idx_uniforms0_vs.cb0[22].xyz, r3.zzz, r4.xyz);
	r4.xyz = fma(idx_uniforms0_vs.cb0[24].xyz, r3.xxx, idx_uniforms0_vs.cb0[27].xyz);
	r4.xyz = fma(idx_uniforms0_vs.cb0[25].xyz, r3.yyy, r4.xyz);
	o3.v.xyz = fma(idx_uniforms0_vs.cb0[26].xyz, r3.zzz, r4.xyz);
	r4.xyz = fma(idx_uniforms0_vs.cb0[28].xyz, r3.xxx, idx_uniforms0_vs.cb0[31].xyz);
	r3.xyw = fma(idx_uniforms0_vs.cb0[29].xyz, r3.yyy, r4.xyz);
	o4.v.xyz = fma(idx_uniforms0_vs.cb0[30].xyz, r3.zzz, r3.xyw);
	o5.v.w = r1.x;
	r3.xyz = v1.xxx * vec3(1.52587891e-05f, 1.00000000f, 0.00390625000f);
	r3.xyz = fract(r3.xyz);
	r3.xyz = fma(r3.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.x = dot(r3.xyz, r3.xyz);
	r1.x = inversesqrt(r1.x);
	r3.xyz = r1.xxx * r3.xyz;
	r4.xyz = r3.zzz * idx_uniforms1_vs.cb1[1].xyz;
	r4.xyz = fma(r3.yyy, idx_uniforms1_vs.cb1[0].xyz, r4.xyz);
	o5.v.xyz = fma(r3.xxx, idx_uniforms1_vs.cb1[2].xyz, r4.xyz);
	o6.v.w = r1.y;
	o7.v.w = r1.z;
	r1.xyz = abs(v1.zzz) * vec3(0.00390625000f, 1.52587891e-05f, 1.00000000f);
	r1.xyz = fract(r1.xyz);
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r4.xyz = r1.xxx * idx_uniforms1_vs.cb1[1].xyz;
	r4.xyz = fma(r1.zzz, idx_uniforms1_vs.cb1[0].xyz, r4.xyz);
	o6.v.xyz = fma(r1.yyy, idx_uniforms1_vs.cb1[2].xyz, r4.xyz);
	r4.xyz = r1.xyz * r3.xyz;
	r1.xyz = fma(r3.zxy, r1.yzx, -r4.xyz);
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r1.w = intBitsToFloat(float(0.00000000f) < v1.z ? int(0xffffffff) : int(0x00000000));
	r3.x = intBitsToFloat(v1.z < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r1.w = intBitsToFloat(floatBitsToInt(r3.x) + -floatBitsToInt(r1.w));
	r1.w = float(floatBitsToInt(r1.w));
	r1.xyz = r1.www * r1.xyz;
	r3.xyz = r1.yyy * idx_uniforms1_vs.cb1[1].xyz;
	r1.xyw = fma(r1.xxx, idx_uniforms1_vs.cb1[0].xyz, r3.xyz);
	o7.v.xyz = fma(r1.zzz, idx_uniforms1_vs.cb1[2].xyz, r1.xyw);
	o8.v = r0;
	r0.x = fma(r0.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r0.x = min(r0.x, idx_uniforms0_vs.cb0[13].y);
	r0.x = -r0.x + float(1.00000000f);
	r0.y = -r2.z + r2.w;
	r0.z = saturate(r0.y * idx_uniforms0_vs.cb0[13].w);
	r0.x = fma(r0.z, r0.x, -idx_uniforms0_vs.cb0[12].x);
	o9.v.w = fma(r0.y, idx_uniforms0_vs.cb0[12].z, r0.x);
	r0.xyz = r2.xyw * vec3(0.500000000f, -0.500000000f, 0.500000000f);
	o9.v.z = r2.w;
	o9.v.xy = r0.zz + r0.xy;
	VertexEpilog();
	return;
}

