#version 460 core
// vs_5_0
// Checksum: d662adb8_19a77b8e_566298f7_ec51ac17
// Name: carpaintmmprezvelocity_damagetm

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[9]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[19]; } idx_uniforms2_vs;


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
	r0.xyz = -v0.xyz + idx_uniforms2_vs.cb2[1].xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = saturate(fma(-r0.x, idx_uniforms2_vs.cb2[1].w, float(1.00000000f)));
	r0.x = r0.x * idx_uniforms2_vs.cb2[15].y;
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[0].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[0].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[15].x, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[2].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[2].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[15].z, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[3].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[3].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[15].w, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[4].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[4].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[16].x, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[5].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[5].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[16].y, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[6].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[6].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[16].z, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[7].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[7].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[16].w, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[8].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[8].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[17].x, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[9].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[9].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[17].y, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[10].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[10].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[17].z, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[11].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[11].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[17].w, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[12].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[12].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[18].x, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[13].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[13].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[18].y, r0.x);
	r0.yzw = -v0.xyz + idx_uniforms2_vs.cb2[14].xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = saturate(fma(-r0.y, idx_uniforms2_vs.cb2[14].w, float(1.00000000f)));
	r0.x = fma(r0.y, idx_uniforms2_vs.cb2[18].z, r0.x);
	r0.yzw = v0.www * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r0.yzw = fract(r0.yzw);
	r0.yzw = fma(r0.yzw, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.xyz = fma(r0.xxx, r0.yzw, v0.xyz);
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r1 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	r1 = r1 + idx_uniforms1_vs.cb1[3];
	gl_Position.z = fma(idx_uniforms1_vs.cb1[4].x, r1.w, r1.z);
	gl_Position.xyw = r1.xyw;
	o2.v = r1;
	o1.v = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[6];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[5], r1);
	r0 = fma(r0.zzzz, idx_uniforms1_vs.cb1[7], r1);
	o3.v = r0 + idx_uniforms1_vs.cb1[8];
	VertexEpilog();
	return;
}

