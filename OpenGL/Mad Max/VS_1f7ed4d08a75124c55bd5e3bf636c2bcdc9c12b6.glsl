#version 460 core
// vs_4_0
// Checksum: 5a351936_5dc05477_c1640a5b_24f473fd
// Name: built_in_resolve.vb

uint idx_VertexID = uint(gl_VertexID);
uniform vec4 idx_VertexID_offset;
// gl_Position
precise vec4 r0;

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
	r0.x = intBitsToFloat(int((idx_VertexID - uint(idx_VertexID_offset.x))) == int(2) ? int(0xffffffff) : int(0x00000000));
	gl_Position.y = uintBitsToFloat(movc(floatBitsToUint(r0.x), uint(0x40400000), uint(0xbf800000)));
	gl_Position.x = uintBitsToFloat(movc((idx_VertexID - uint(idx_VertexID_offset.x)), uint(0xbf800000), uint(0x40400000)));
	gl_Position.zw = uintBitsToFloat(uvec2(0x3f800000, 0x3f800000));
	VertexEpilog();
	return;
}

