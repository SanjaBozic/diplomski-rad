#version 460 core
// vs_5_0
// Checksum: e0792fd6_ef86e71b_c3215c3e_1c6e56ba
// Name: particleeffectdebugcolor

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 4) in vec4 v4;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[10]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[23]; } idx_uniforms1_vs;

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

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xyz = v0.xyz + idx_uniforms2_vs.cb2[3].xyz;
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r1 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	r0.xyz = r0.xyz + -idx_uniforms0_vs.cb0[9].xyz;
	r1 = r1 + idx_uniforms1_vs.cb1[3];
	r0.w = v1.w;
	r0.w = r0.w * idx_uniforms1_vs.cb1[17].w;
	r2.x = intBitsToFloat(r0.w < float(0.00999999978f) ? int(0xffffffff) : int(0x00000000));
	gl_Position = uintBitsToFloat(movc(floatBitsToUint(r2.xxxx), uvec4(0xbf800000, 0xbf800000, 0xbf800000, 0x3f800000), floatBitsToUint(r1)));
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r1.x);
	r0.xyz = r0.xyz * r1.xxx;
	r1.xyz = fma(v2.xyz, vec3(2.00787401f, 2.00787401f, 2.00787401f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r0.x = dot(r0.xyz, r1.xyz);
	r0.x = abs(r0.x) + -idx_uniforms1_vs.cb1[22].z;
	r0.x = saturate(r0.x * idx_uniforms1_vs.cb1[22].w);
	r0.y = intBitsToFloat(float(0.00000000f) < idx_uniforms1_vs.cb1[22].w ? int(0xffffffff) : int(0x00000000));
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r0.y), floatBitsToUint(r0.x), uint(0x3f800000)));
	o1.v.w = r0.x * r0.w;
	r0.xyz = v1.xyz * idx_uniforms1_vs.cb1[17].xyz;
	o1.v.xyz = r0.xyz * vec3(4.00000000f, 4.00000000f, 4.00000000f);
	o2.v.xy = v4.xy * vec2(1.99993896f, 1.99993896f);
	VertexEpilog();
	return;
}

