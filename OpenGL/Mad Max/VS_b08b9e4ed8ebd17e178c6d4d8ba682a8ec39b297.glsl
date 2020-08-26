#version 460 core
// vs_5_0
// Checksum: de513c60_1fe49b3a_fbbd80eb_6a23aa0b
// Name: lightglow

layout(location = 0) in vec4 v0;
layout(location = 1) in ivec4 v1;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[4096]; } idx_uniforms1_vs;


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
	gl_Position.zw = uintBitsToFloat(uvec2(0x00000000, 0x3f800000));
	r0.xy = v0.xy * idx_uniforms1_vs.cb1[5].xy;
	r0.z = uintBitsToFloat(uint(v1.x));
	r0.xy = fma(r0.xy, idx_uniforms1_vs.cb1[floatBitsToInt(r0.z)].zz, idx_uniforms1_vs.cb1[floatBitsToInt(r0.z)].xy);
	o2.v.x = idx_uniforms1_vs.cb1[floatBitsToInt(r0.z)].w;
	gl_Position.x = fma(r0.x, float(2.00000000f), float(-1.00000000f));
	gl_Position.y = fma(-r0.y, float(2.00000000f), float(1.00000000f));
	o1.v.zw = r0.xy;
	o1.v.xy = v0.zw;
	VertexEpilog();
	return;
}

