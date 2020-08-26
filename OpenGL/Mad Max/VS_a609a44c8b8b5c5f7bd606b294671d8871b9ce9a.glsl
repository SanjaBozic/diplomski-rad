#version 460 core
// vs_5_0
// Checksum: 816a54b9_02f9bc6d_16b40c4e_4c69fb80
// Name: particleeffectpixelshadowsoftnsprjfar

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 v3;
layout(location = 4) in vec4 v4;
layout(location = 5) in vec4 v5;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
layout(location = 4) out idx_Varying4 { vec4 v; } o4;
layout(location = 5) out idx_Varying5 { vec4 v; } o5;
layout(location = 6) out idx_Varying6 { vec4 v; } o6;
layout(location = 7) out idx_Varying7 { vec4 v; } o7;
layout(location = 8) out idx_Varying8 { vec4 v; } o8;
layout(location = 9) out idx_Varying9 { vec4 v; } o9;
layout(location = 10) out idx_Varying10 { vec4 v; } o10;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[32]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[18]; } idx_uniforms1_vs;

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
	gl_Position.z = uintBitsToFloat(uint(0x00000000));
	r0.x = v1.w;
	r0.x = r0.x * idx_uniforms1_vs.cb1[17].w;
	r0.y = intBitsToFloat(r0.x < float(0.00999999978f) ? int(0xffffffff) : int(0x00000000));
	o2.v.w = r0.x;
	r0.xzw = v0.xyz + idx_uniforms2_vs.cb2[3].xyz;
	r1 = r0.zzzz * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r1 = fma(r0.wwww, idx_uniforms1_vs.cb1[2], r1);
	r1 = r1 + idx_uniforms1_vs.cb1[3];
	gl_Position.xyw = uintBitsToFloat(movc(floatBitsToUint(r0.yyy), uvec3(0xbf800000, 0xbf800000, 0x3f800000), floatBitsToUint(r1.xyw)));
	r0.y = -r1.z + r1.w;
	r1.x = fma(r0.z, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r1.x = min(r1.x, idx_uniforms0_vs.cb0[13].y);
	r1.x = -r1.x + float(1.00000000f);
	r1.y = saturate(r0.y * idx_uniforms0_vs.cb0[13].w);
	r1.x = fma(r1.y, r1.x, -idx_uniforms0_vs.cb0[12].x);
	o1.v.z = saturate(fma(r0.y, idx_uniforms0_vs.cb0[12].z, r1.x));
	o1.v.xy = v4.xy * vec2(1.99993896f, 1.99993896f);
	r1.xyz = v1.xyz * idx_uniforms1_vs.cb1[17].xyz;
	o2.v.xyz = r1.xyz * vec3(4.00000000f, 4.00000000f, 4.00000000f);
	r1.xyz = r0.xzw + -idx_uniforms0_vs.cb0[9].xyz;
	o5.v.xyz = r0.xzw;
	r0.xyz = fma(idx_uniforms0_vs.cb0[24].xyz, r1.xxx, idx_uniforms0_vs.cb0[27].xyz);
	r0.xyz = fma(idx_uniforms0_vs.cb0[25].xyz, r1.yyy, r0.xyz);
	o3.v.xyz = fma(idx_uniforms0_vs.cb0[26].xyz, r1.zzz, r0.xyz);
	r0.xyz = fma(idx_uniforms0_vs.cb0[28].xyz, r1.xxx, idx_uniforms0_vs.cb0[31].xyz);
	r0.xyz = fma(idx_uniforms0_vs.cb0[29].xyz, r1.yyy, r0.xyz);
	o4.v.xyz = fma(idx_uniforms0_vs.cb0[30].xyz, r1.zzz, r0.xyz);
	r0.x = v3.x * float(8.00000000f);
	r0.yzw = r0.xxx * idx_uniforms2_vs.cb2[2].xyz;
	r0.y = dot(r0.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.xzw = fma(idx_uniforms2_vs.cb2[2].xyz, r0.xxx, -r0.yyy);
	o6.v.xyz = fma(idx_uniforms1_vs.cb1[16].zzz, r0.xzw, r0.yyy);
	r0.x = v2.w * float(32.0000000f);
	o7.v.xyz = r0.xxx;
	r0.xyz = fma(v2.xyz, vec3(2.00787401f, 2.00787401f, 2.00787401f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r0.w);
	r0.w = sqrt(r0.w);
	r0.w = r0.w + float(-0.500000000f);
	o9.v.w = saturate(fma(-r0.w, float(2.00000000f), float(1.00000000f)));
	o8.v.xyz = r0.xyz * r1.xxx;
	r0.x = dot(-idx_uniforms0_vs.cb0[8].xyz, -idx_uniforms0_vs.cb0[8].xyz);
	r0.x = inversesqrt(r0.x);
	o9.v.xyz = r0.xxx * -idx_uniforms0_vs.cb0[8].xyz;
	r0 = v5 + vec4(-0.500000000f, -0.500000000f, -0.500000000f, -0.500000000f);
	r0 = r0 + r0;
	r1.x = dot(r0, r0);
	r1.x = inversesqrt(r1.x);
	o10.v = r0 * r1.xxxx;
	VertexEpilog();
	return;
}

