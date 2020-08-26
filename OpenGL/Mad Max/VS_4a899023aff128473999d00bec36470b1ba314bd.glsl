#version 460 core
// vs_5_0
// Checksum: ea5a4f2f_1590b083_de5e0e00_3efce99b
// Name: starsshader

layout(location = 0) in vec4 v0;
uint idx_VertexID = uint(gl_VertexID);
uniform vec4 idx_VertexID_offset;
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
	r0.x = intBitsToFloat(int((idx_VertexID - uint(idx_VertexID_offset.x))) + int(1));
	r0.x = uintBitsToFloat( uint(mod( floatBitsToUint(r0.x), uint(0x00000006) )) );
	r0.x = intBitsToFloat(floatBitsToUint(r0.x) < uint(0x00000003) ? int(0xffffffff) : int(0x00000000));
	r0.y = uintBitsToFloat(movc(floatBitsToUint(r0.x), uint(0x3f800000), uint(0xbf800000)));
	r0.z = uintBitsToFloat((idx_VertexID - uint(idx_VertexID_offset.x)) & uint(0x00000001));
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r0.z), uint(0x3f800000), uint(0xbf800000)));
	r0.zw = r0.xy * idx_uniforms1_vs.cb1[4].xy;
	o1.v.xy = fma(r0.xy, vec2(0.500000000f, 0.500000000f), vec2(0.500000000f, 0.500000000f));
	r1.xyz = v0.yyy * idx_uniforms1_vs.cb1[1].xyw;
	r1.xyz = fma(v0.xxx, idx_uniforms1_vs.cb1[0].xyw, r1.xyz);
	r1.xyz = fma(v0.zzz, idx_uniforms1_vs.cb1[2].xyw, r1.xyz);
	r1.xyz = r1.xyz + idx_uniforms1_vs.cb1[3].xyw;
	r0.x = r1.z * v0.w;
	gl_Position.xy = fma(r0.zw, r0.xx, r1.xy);
	gl_Position.w = r1.z;
	gl_Position.z = uintBitsToFloat(uint(0x00000000));
	VertexEpilog();
	return;
}

