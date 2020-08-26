#version 460 core
// vs_5_0
// Checksum: bd009be1_c6e55701_e92b8080_49fbddd5
// Name: particleeffectdebugnormaltrail

layout(location = 0) in vec4 v0;
layout(location = 2) in vec4 v2;
layout(location = 4) in vec4 v4;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[9]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[17]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[4]; } idx_uniforms2_vs;


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
	r0.xyz = v0.xyz + idx_uniforms2_vs.cb2[3].xyz;
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r0 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	gl_Position = r0 + idx_uniforms1_vs.cb1[3];
	r0.x = intBitsToFloat(float(0.00000000f) < idx_uniforms1_vs.cb1[16].x ? int(0xffffffff) : int(0x00000000));
	r0.y = intBitsToFloat(idx_uniforms1_vs.cb1[16].x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.x = intBitsToFloat(floatBitsToInt(r0.y) + -floatBitsToInt(r0.x));
	r0.x = float(floatBitsToInt(r0.x));
	r0.y = intBitsToFloat(idx_uniforms1_vs.cb1[16].x == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r0.y), uint(0x3f800000), floatBitsToUint(r0.x)));
	r0.yzw = fma(v2.xyz, vec3(2.00787401f, 2.00787401f, 2.00787401f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = inversesqrt(r1.x);
	r0.yzw = r0.yzw * r1.xxx;
	r1.xyz = fma(idx_uniforms0_vs.cb0[5].xyz, r0.xxx, -r0.yzw);
	r0.x = float(1.00000000f) + -abs(idx_uniforms1_vs.cb1[16].x);
	r0.x = max(r0.x, float(0.00000000f));
	r1.w = dot(idx_uniforms0_vs.cb0[5].xyz, -idx_uniforms0_vs.cb0[8].xyz);
	r0.x = r0.x * abs(r1.w);
	r0.xyz = fma(r0.xxx, r1.xyz, r0.yzw);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	o1.v.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.v.w = uintBitsToFloat(uint(0x3f800000));
	o2.v.xy = v4.xy * vec2(31.9990234f, 31.9990234f);
	VertexEpilog();
	return;
}

