#version 460 core
// vs_5_0
// Checksum: efe10b2c_96b44fbf_9481ff4f_31dd4095
// Name: wheel

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[7]; } idx_uniforms1_vs;

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

void main()
{
	Initialise();
	r0 = v0.yyyy * idx_uniforms1_vs.cb1[1];
	r0 = fma(v0.xxxx, idx_uniforms1_vs.cb1[0], r0);
	r0 = fma(v0.zzzz, idx_uniforms1_vs.cb1[2], r0);
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	o1.v.xy = v1.xy * idx_uniforms2_vs.cb2[0].xy;
	r0.xyz = v2.xxx * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r0.xyz = fract(r0.xyz);
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r1.xyz = r0.yyy * idx_uniforms1_vs.cb1[5].xyz;
	r0.xyw = fma(r0.xxx, idx_uniforms1_vs.cb1[4].xyz, r1.xyz);
	o2.v.xyz = fma(r0.zzz, idx_uniforms1_vs.cb1[6].xyz, r0.xyw);
	r0.xyz = abs(v2.yyy) * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r0.xyz = fract(r0.xyz);
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r1.xyz = r0.yyy * idx_uniforms1_vs.cb1[5].xyz;
	r0.xyw = fma(r0.xxx, idx_uniforms1_vs.cb1[4].xyz, r1.xyz);
	o3.v.xyz = fma(r0.zzz, idx_uniforms1_vs.cb1[6].xyz, r0.xyw);
	r0.x = intBitsToFloat(float(0.00000000f) < v2.y ? int(0xffffffff) : int(0x00000000));
	r0.y = intBitsToFloat(v2.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.x = intBitsToFloat(floatBitsToInt(r0.y) + -floatBitsToInt(r0.x));
	o3.v.w = float(floatBitsToInt(r0.x));
	VertexEpilog();
	return;
}

