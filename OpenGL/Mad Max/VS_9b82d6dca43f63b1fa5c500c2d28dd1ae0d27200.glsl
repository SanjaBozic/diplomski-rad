#version 460 core
// vs_5_0
// Checksum: d839b29a_17f115ab_1aef431d_955b9f4b
// Name: carpaintmmoutline_damagetm

layout(location = 0) in vec4 v0;
layout(location = 2) in vec4 v2;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[9]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[19]; } idx_uniforms2_vs;

layout (std140) uniform cb_vs3 { vec4 cb3[2]; } idx_uniforms3_vs;


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
	r0.xyz = v2.xxx * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r0.xyz = fract(r0.xyz);
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r1.xyz = v2.zzz * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r1.xyz = fract(r1.xyz);
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xyz = fma(r1.xyz, r0.www, -r0.xyz);
	r2.xyz = -v0.xyz + idx_uniforms2_vs.cb2[0].xyz;
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = saturate(fma(-r0.w, idx_uniforms2_vs.cb2[0].w, float(1.00000000f)));
	r2.xyz = -v0.xyz + idx_uniforms2_vs.cb2[1].xyz;
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[1].w, float(1.00000000f)));
	r2.x = r0.w + r1.w;
	r1.w = r1.w * idx_uniforms2_vs.cb2[15].y;
	r0.w = fma(r0.w, idx_uniforms2_vs.cb2[15].x, r1.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[2].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[2].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[15].z, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[3].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[3].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[15].w, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[4].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[4].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[16].x, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[5].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[5].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[16].y, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[6].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[6].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[16].z, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[7].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[7].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[16].w, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[8].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[8].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[17].x, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[9].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[9].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[17].y, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[10].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[10].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[17].z, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[11].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[11].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[17].w, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[12].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[12].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[18].x, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[13].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[13].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[18].y, r0.w);
	r2.yzw = -v0.xyz + idx_uniforms2_vs.cb2[14].xyz;
	r1.w = dot(r2.yzw, r2.yzw);
	r1.w = saturate(fma(-r1.w, idx_uniforms2_vs.cb2[14].w, float(1.00000000f)));
	r2.x = r1.w + r2.x;
	r0.w = fma(r1.w, idx_uniforms2_vs.cb2[18].z, r0.w);
	r0.w = saturate(-r0.w + float(1.00000000f));
	r0.w = -r0.w + float(1.00000000f);
	r0.w = r0.w * idx_uniforms2_vs.cb2[18].w;
	r1.w = -r2.x + float(1.00000000f);
	r1.w = max(r1.w, float(0.00000000f));
	r0.xyz = fma(r1.www, r1.xyz, r0.xyz);
	r1.xyz = r0.yyy * idx_uniforms1_vs.cb1[1].xyz;
	r1.xyz = fma(r0.xxx, idx_uniforms1_vs.cb1[0].xyz, r1.xyz);
	r1.xyz = fma(r0.zzz, idx_uniforms1_vs.cb1[2].xyz, r1.xyz);
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = v0.www * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r2.xyz = fract(r2.xyz);
	r2.xyz = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.xyz = fma(r0.www, r2.xyz, v0.xyz);
	r3 = r2.yyyy * idx_uniforms1_vs.cb1[1];
	r3 = fma(r2.xxxx, idx_uniforms1_vs.cb1[0], r3);
	r3 = fma(r2.zzzz, idx_uniforms1_vs.cb1[2], r3);
	r3 = r3 + idx_uniforms1_vs.cb1[3];
	r0.w = r3.w * idx_uniforms3_vs.cb3[0].x;
	gl_Position.xyz = fma(r1.xyz, r0.www, r3.xyz);
	gl_Position.w = r3.w;
	r1.xyz = r0.yyy * idx_uniforms1_vs.cb1[6].xyz;
	r0.xyw = fma(r0.xxx, idx_uniforms1_vs.cb1[5].xyz, r1.xyz);
	r0.xyz = fma(r0.zzz, idx_uniforms1_vs.cb1[7].xyz, r0.xyw);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	o1.v.yzw = r0.www * r0.xyz;
	r2.w = uintBitsToFloat(uint(0x3f800000));
	o1.v.x = dot(r2, idx_uniforms3_vs.cb3[1]);
	r0.xyz = r2.yyy * idx_uniforms1_vs.cb1[6].xyz;
	r0.xyz = fma(r2.xxx, idx_uniforms1_vs.cb1[5].xyz, r0.xyz);
	r0.xyz = fma(r2.zzz, idx_uniforms1_vs.cb1[7].xyz, r0.xyz);
	o2.v.xyz = r0.xyz + idx_uniforms1_vs.cb1[8].xyz;
	VertexEpilog();
	return;
}

