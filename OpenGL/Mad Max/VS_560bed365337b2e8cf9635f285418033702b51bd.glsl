#version 460 core
// vs_5_0
// Checksum: 81fd52ce_6937ffa2_cd4de59b_302e800a
// Name: terrainshaderforestfin

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[14]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[7]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[2]; } idx_uniforms2_vs;


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
	r0.y = v0.x + idx_uniforms2_vs.cb2[0].y;
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r0.xz = fma(v1.xy, idx_uniforms2_vs.cb2[0].ww, idx_uniforms2_vs.cb2[0].xz);
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r1 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	r1 = r1 + idx_uniforms1_vs.cb1[3];
	r0.w = dot(r0.xz, r0.xz);
	r0.w = sqrt(r0.w);
	r0.w = intBitsToFloat(r0.w < idx_uniforms1_vs.cb1[4].x ? int(0xffffffff) : int(0x00000000));
	r0.w = uintBitsToFloat(movc(floatBitsToUint(r0.w), floatBitsToUint(-1.f * r1.w), floatBitsToUint(r1.z)));
	gl_Position.z = r0.w;
	r0.w = -r0.w + r1.w;
	gl_Position.xyw = r1.xyw;
	o1.v = fma(v1, idx_uniforms1_vs.cb1[6], idx_uniforms2_vs.cb2[1]);
	r1.xyz = r0.xyz + idx_uniforms0_vs.cb0[9].xyz;
	r0.x = max(abs(r0.z), abs(r0.x));
	r0.xy = saturate(fma(r0.xx, idx_uniforms1_vs.cb1[5].wy, -idx_uniforms1_vs.cb1[5].zx));
	r0.z = fma(r1.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	o2.v.xy = fma(r1.xz, vec2(3.05175781e-05f, 3.05175781e-05f), vec2(0.500000000f, 0.500000000f));
	r0.z = min(r0.z, idx_uniforms0_vs.cb0[13].y);
	r0.z = -r0.z + float(1.00000000f);
	r1.x = saturate(r0.w * idx_uniforms0_vs.cb0[13].w);
	r0.z = fma(r1.x, r0.z, -idx_uniforms0_vs.cb0[12].x);
	o2.v.z = fma(r0.w, idx_uniforms0_vs.cb0[12].z, r0.z);
	r0.x = -r0.x + float(1.00000000f);
	r0.x = min(r0.x, r0.y);
	o2.v.w = r0.x + r0.x;
	VertexEpilog();
	return;
}

