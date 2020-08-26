#version 460 core
// vs_5_0
// Checksum: b3b8c060_4d83e410_89f9752b_e8b5baf9
// Name: particlerefractioneffectblend

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 3) in vec4 v3;
layout(location = 4) in vec4 v4;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[20]; } idx_uniforms1_vs;


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
	r0.x = v1.w * v3.x;
	r0.x = r0.x * idx_uniforms1_vs.cb1[17].w;
	r0.y = intBitsToFloat(r0.x < float(0.000666666660f) ? int(0xffffffff) : int(0x00000000));
	o1.v.z = r0.x * float(0.150000006f);
	r0.x = intBitsToFloat(v3.z < float(0.00392156886f) ? int(0xffffffff) : int(0x00000000));
	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) | floatBitsToUint(r0.y));
	r1 = v0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(v0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r1 = fma(v0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	r1 = r1 + idx_uniforms1_vs.cb1[3];
	gl_Position = uintBitsToFloat(movc(floatBitsToUint(r0.xxxx), uvec4(0xbf800000, 0xbf800000, 0xbf800000, 0x3f800000), floatBitsToUint(r1)));
	o1.v.xy = v4.xy * vec2(1.99218750f, 1.99218750f);
	o1.v.w = v3.z;
	o2.v.xy = v4.zw * vec2(1.99218750f, 1.99218750f);
	o2.v.z = v3.y;
	r0.xyz = r1.xyw * vec3(0.500000000f, -0.500000000f, 0.500000000f);
	o3.v.zw = r1.zw;
	r0.xy = r0.zz + r0.xy;
	o3.v.xy = r0.xy * idx_uniforms1_vs.cb1[19].xy;
	VertexEpilog();
	return;
}

