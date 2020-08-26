#version 460 core
// vs_5_0
// Checksum: e99392ff_abd68754_08c7c7b3_2618e854
// Name: guiroad

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[5]; } idx_uniforms1_vs;


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


uvec4 movc(in uvec4 src0, in uvec4 src1, in uvec4 src2)
{
	return mix(src2, src1, bvec4(src0));
}

uvec3 movc(in uvec3 src0, in uvec3 src1, in uvec3 src2)
{
	return mix(src2, src1, bvec3(src0));
}

uvec2 movc(in uvec2 src0, in uvec2 src1, in uvec2 src2)
{
	return mix(src2, src1, bvec2(src0));
}

uint movc(in uint src0, in uint src1, in uint src2)
{
	return mix(src2, src1, bool(src0));
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
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	r0.x = v0.z / idx_uniforms1_vs.cb1[4].w;
	r0.x = r0.x * idx_uniforms1_vs.cb1[4].z;
	r0.x = roundEven(r0.x);
	r0.y = v0.w + float(1.00000000f);
	r1.x = abs(r0.y);
	r0.y = intBitsToFloat(v0.w < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r1.z = v0.w;
	r1.yw = uintBitsToFloat(uvec2(0x3f800000, 0x00000000));
	r1.xy = uintBitsToFloat(movc(floatBitsToUint(r0.yy), floatBitsToUint(r1.xy), floatBitsToUint(r1.zw)));
	r1.z = r0.x * r1.x;
	o1.v.xy = r1.yz;
	VertexEpilog();
	return;
}

