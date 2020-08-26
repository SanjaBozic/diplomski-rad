#version 460 core
// vs_5_0
// Checksum: d1c3e430_7ac9012d_384056f3_65b88376
// Name: generalshadow_d1_vertexanim_texanim

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[5]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[2]; } idx_uniforms2_vs;

layout (std140) uniform cb_vs3 { vec4 cb3[3]; } idx_uniforms3_vs;


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
	r0.w = dot(idx_uniforms1_vs.cb1[4].xyz, r0.xyz);
	r0.w = saturate(r0.w * float(4.00000000f));
	r1.w = uintBitsToFloat(uint(0x3f800000));
	r2.xyz = v2.zzz * vec3(1.00000000f, 0.0156250000f, 0.000244140625f);
	r2.xyz = fract(r2.xyz);
	r3.xz = fma(r2.yy, r2.yy, vec2(0.300000012f, 0.00200000009f));
	r3.y = r2.x;
	r3.xyz = r3.xyz * idx_uniforms2_vs.cb2[1].xyw;
	r1.xyz = v0.xyz * idx_uniforms1_vs.cb1[4].www;
	r1.w = dot(r1.wyzx, r3.xzzz);
	r3.xzw = r1.www * vec3(1.00000000f, 0.713199973f, 1.28170002f);
	r3.xzw = fract(r3.xzw);
	r3.xzw = fma(-r3.xzw, r3.xzw, r3.xzw);
	r3.xzw = r3.xzw * r3.xzw;
	r3.xzw = fma(r3.xzw, vec3(32.0000000f, 32.0000000f, 32.0000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r3.xzw = r3.yyy * r3.xzw;
	r4.xyz = r3.yyy * idx_uniforms1_vs.cb1[4].xyz;
	r5.xyz = fma(v0.xyz, idx_uniforms1_vs.cb1[4].www, r3.xzw);
	r1.w = dot(r3.xzw, r3.xzw);
	r1.w = sqrt(r1.w);
	r0.xyz = r0.xyz * r1.www;
	r0.xyz = fma(r0.xyz, vec3(3.00000000f, 3.00000000f, 3.00000000f), r1.xyz);
	r1.x = r2.y * r2.y;
	r1.xyz = r1.xxx * r4.xyz;
	r1.xyz = r1.xyz * vec3(30.0000000f, 30.0000000f, 30.0000000f);
	r1.xyz = fma(r1.xyz, r0.www, r5.xyz);
	r0.xyz = r0.xyz + -r1.xyz;
	r0.xyz = fma(r2.zzz, r0.xyz, r1.xyz);
	r0.xyz = r0.xyz / idx_uniforms1_vs.cb1[4].www;
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r0 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	r0.xy = v1.zw * idx_uniforms2_vs.cb2[0].zw;
	r0.yz = r0.yy * idx_uniforms3_vs.cb3[1].xy;
	r0.xy = fma(r0.xx, idx_uniforms3_vs.cb3[0].xy, r0.yz);
	o1.v.xy = r0.xy + idx_uniforms3_vs.cb3[2].xy;
	VertexEpilog();
	return;
}

