#version 460 core
// vs_5_0
// Checksum: 3f554eed_a5594cd2_4550f989_9097d24d
// Name: scope

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 v3;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;

// Uniform buffer declarations (dcl_constant_buffer)


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
	gl_Position.xy = fma(v0.xy, vec2(0.00156250002f, -0.00277777785f), vec2(-1.00000000f, 1.00000000f));
	gl_Position.zw = uintBitsToFloat(uvec2(0x3f800000, 0x3f800000));
	o1.v.xy = v1.xy;
	o1.v.zw = v2.xy;
	o2.v.xy = v3.xy;
	VertexEpilog();
	return;
}

