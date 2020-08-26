#version 460 core
// vs_5_0
// Checksum: 726a2c2c_0c5f3800_b49a7dfc_b589d693
// Name: generalmm_d0_ed1

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
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[8]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[2]; } idx_uniforms2_vs;

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

void main()
{
	Initialise();
	r0 = v0.yyyy * idx_uniforms1_vs.cb1[1];
	r0 = fma(v0.xxxx, idx_uniforms1_vs.cb1[0], r0);
	r0 = fma(v0.zzzz, idx_uniforms1_vs.cb1[2], r0);
	r0 = r0 + idx_uniforms1_vs.cb1[3];
	gl_Position.z = fma(idx_uniforms2_vs.cb2[0].x, r0.w, r0.z);
	gl_Position.xyw = r0.xyw;
	r0.xyz = v0.xyz * idx_uniforms2_vs.cb2[0].www;
	r1.xyz = r0.yyy * idx_uniforms1_vs.cb1[5].xyz;
	r0.xyw = fma(r0.xxx, idx_uniforms1_vs.cb1[4].xyz, r1.xyz);
	r0.xyz = fma(r0.zzz, idx_uniforms1_vs.cb1[6].xyz, r0.xyw);
	r0.xyz = r0.xyz + idx_uniforms1_vs.cb1[7].xyz;
	o1.v.zw = fma(r0.xz, vec2(3.05175781e-05f, 3.05175781e-05f), vec2(0.500000000f, 0.500000000f));
	r1 = v1 * idx_uniforms2_vs.cb2[1];
	r2.xy = r1.yy * idx_uniforms3_vs.cb3[1].xy;
	r1.xy = fma(r1.xx, idx_uniforms3_vs.cb3[0].xy, r2.xy);
	r1.xy = r1.xy + idx_uniforms3_vs.cb3[2].xy;
	o1.v.xy = r1.xy;
	o2.v.xy = r1.xy;
	r1.xy = r1.ww * idx_uniforms3_vs.cb3[4].xy;
	r1.xy = fma(r1.zz, idx_uniforms3_vs.cb3[3].xy, r1.xy);
	o2.v.zw = r1.xy + idx_uniforms3_vs.cb3[5].xy;
	r1.xyz = v2.xxx * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r1.xyz = fract(r1.xyz);
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = r1.yyy * idx_uniforms1_vs.cb1[5].xyz;
	r1.xyw = fma(r1.xxx, idx_uniforms1_vs.cb1[4].xyz, r2.xyz);
	o3.v.xyz = fma(r1.zzz, idx_uniforms1_vs.cb1[6].xyz, r1.xyw);
	r1.xyz = abs(v2.yyy) * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r1.xyz = fract(r1.xyz);
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = r1.yyy * idx_uniforms1_vs.cb1[5].xyz;
	r1.xyw = fma(r1.xxx, idx_uniforms1_vs.cb1[4].xyz, r2.xyz);
	o4.v.xyz = fma(r1.zzz, idx_uniforms1_vs.cb1[6].xyz, r1.xyw);
	r1.x = intBitsToFloat(float(0.00000000f) < v2.y ? int(0xffffffff) : int(0x00000000));
	r1.y = intBitsToFloat(v2.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r1.x = intBitsToFloat(floatBitsToInt(r1.y) + -floatBitsToInt(r1.x));
	o4.v.w = float(floatBitsToInt(r1.x));
	o5.v.xyz = r0.xyz;
	r1 = v2.zzzz * vec4(1.00000000f, 0.0156250000f, 0.000244140625f, 3.81469727e-06f);
	o6.v = fract(r1);
	r0.w = fma(-r0.y, float(0.400000006f), r0.z);
	o7.v = r0.xwxw * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	VertexEpilog();
	return;
}

