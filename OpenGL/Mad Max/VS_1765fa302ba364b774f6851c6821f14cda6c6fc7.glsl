#version 460 core
// vs_5_0
// Checksum: 5a69c2cb_ae91339c_f6eca54c_221c533a
// Name: particleeffectshadowoutput

layout(location = 0) in vec4 v0;
layout(location = 3) in vec4 v3;
layout(location = 5) in vec4 v5;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[4]; } idx_uniforms1_vs;


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
	r0.x = v5.x * float(0.00390625000f);
	r0.y = fract(r0.x);
	r0.x = floor(r0.x);
	gl_Position.y = fma(-r0.x, float(0.00784313772f), float(0.998046875f));
	gl_Position.x = fma(r0.y, float(2.00000000f), float(-0.998046875f));
	gl_Position.zw = uintBitsToFloat(uvec2(0x3f800000, 0x3f800000));
	r0.xyz = v0.yyy * idx_uniforms1_vs.cb1[1].xyz;
	r0.xyz = fma(v0.xxx, idx_uniforms1_vs.cb1[0].xyz, r0.xyz);
	r0.xyz = fma(v0.zzz, idx_uniforms1_vs.cb1[2].xyz, r0.xyz);
	o1.v.xyz = r0.xyz + idx_uniforms1_vs.cb1[3].xyz;
	o1.v.w = v3.w * float(16.0000000f);
	VertexEpilog();
	return;
}
