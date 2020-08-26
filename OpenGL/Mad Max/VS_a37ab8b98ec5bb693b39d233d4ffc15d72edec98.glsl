#version 460 core
// vs_5_0
// Checksum: d9fe6ed6_f9b245d4_c9a9e7b2_4e68b26d
// Name: particleeffectdebugvertexshadow

layout(location = 0) in vec4 v0;
layout(location = 4) in vec4 v4;
layout(location = 5) in vec4 v5;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[4]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[4]; } idx_uniforms2_vs;


out gl_PerVertex {
	vec4 gl_Position;
};

// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_vs; // res0, s0

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
	r0.xyz = v0.xyz + idx_uniforms2_vs.cb2[3].xyz;
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r0 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	r0.x = v5.x * float(0.00390625000f);
	r0.y = fract(r0.x);
	r0.x = floor(r0.x);
	r1.y = fma(r0.x, float(0.00392156886f), float(0.00195312500f));
	r1.x = r0.y + float(0.00195312500f);
	r0.xyz = ((textureLod(resourceSamplerPair_0_vs, r1.xy, float(0.00000000f)))).xyz;
	o1.v.xyz = r0.xyz;
	o1.v.w = uintBitsToFloat(uint(0x3f800000));
	o2.v.xy = v4.xy * vec2(1.99993896f, 1.99993896f);
	VertexEpilog();
	return;
}

