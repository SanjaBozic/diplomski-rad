#version 460 core
// vs_5_0
// Checksum: a1a30fce_dd257e43_7f41cf67_51b91b80
// Name: ghostproject

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
layout(location = 4) out idx_Varying4 { vec4 v; } o4;
layout(location = 5) out idx_Varying5 { vec4 v; } o5;
layout(location = 6) out idx_Varying6 { vec4 v; } o6;
layout(location = 7) out idx_Varying7 { vec4 v; } o7;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[32]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[16]; } idx_uniforms1_vs;


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
	r0 = v0.yyyy * idx_uniforms1_vs.cb1[8];
	r0 = fma(v0.xxxx, idx_uniforms1_vs.cb1[7], r0);
	r0 = fma(v0.zzzz, idx_uniforms1_vs.cb1[9], r0);
	r0 = r0 + idx_uniforms1_vs.cb1[10];
	gl_Position = r0;
	r0.x = -r0.z + r0.w;
	r0.yz = v1.yy * idx_uniforms1_vs.cb1[5].xy;
	r0.yz = fma(v1.xx, idx_uniforms1_vs.cb1[4].xy, r0.yz);
	o1.v.xy = r0.yz + idx_uniforms1_vs.cb1[6].xy;
	r1.xyz = v0.xyz;
	r1.w = uintBitsToFloat(uint(0x3f800000));
	o1.v.z = dot(r1, idx_uniforms1_vs.cb1[15].xxxy);
	o2.v.xyz = v0.xyz;
	r0.y = saturate(r0.x * idx_uniforms0_vs.cb0[13].w);
	r1.xyz = v0.yyy * idx_uniforms1_vs.cb1[1].xyz;
	r1.xyz = fma(v0.xxx, idx_uniforms1_vs.cb1[0].xyz, r1.xyz);
	r1.xyz = fma(v0.zzz, idx_uniforms1_vs.cb1[2].xyz, r1.xyz);
	r1.xyz = r1.xyz + idx_uniforms1_vs.cb1[3].xyz;
	r0.z = fma(r1.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r0.z = min(r0.z, idx_uniforms0_vs.cb0[13].y);
	r0.z = -r0.z + float(1.00000000f);
	r0.y = fma(r0.y, r0.z, -idx_uniforms0_vs.cb0[12].x);
	o3.v.w = fma(r0.x, idx_uniforms0_vs.cb0[12].z, r0.y);
	o3.v.xyz = r1.xyz;
	r0.xyz = r1.xyz + -idx_uniforms0_vs.cb0[9].xyz;
	r0.w = intBitsToFloat(float(0.00000000f) < v2.y ? int(0xffffffff) : int(0x00000000));
	r1.x = intBitsToFloat(v2.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.w = intBitsToFloat(floatBitsToInt(r1.x) + -floatBitsToInt(r0.w));
	r0.w = float(floatBitsToInt(r0.w));
	r1.xyz = abs(v2.yyy) * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r1.xyz = fract(r1.xyz);
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = r1.yyy * idx_uniforms1_vs.cb1[1].xyz;
	r1.xyw = fma(r1.xxx, idx_uniforms1_vs.cb1[0].xyz, r2.xyz);
	r1.xyz = fma(r1.zzz, idx_uniforms1_vs.cb1[2].xyz, r1.xyw);
	r2.xyz = v2.xxx * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r2.xyz = fract(r2.xyz);
	r2.xyz = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = r1.www * r2.xyz;
	r3.xyz = r2.yyy * idx_uniforms1_vs.cb1[1].xyz;
	r2.xyw = fma(r2.xxx, idx_uniforms1_vs.cb1[0].xyz, r3.xyz);
	r2.xyz = fma(r2.zzz, idx_uniforms1_vs.cb1[2].xyz, r2.xyw);
	r3.xyz = r1.yzx * r2.zxy;
	r3.xyz = fma(r2.yzx, r1.zxy, -r3.xyz);
	r3.xyz = r0.www * r3.xyz;
	r4.xyz = r2.yzx * r3.zxy;
	r4.xyz = fma(r3.yzx, r2.zxy, -r4.xyz);
	o4.v.xyz = r3.xyz;
	o5.v.xyz = r2.xyz;
	r0.w = dot(r4.xyz, r1.xyz);
	r0.w = intBitsToFloat(r0.w < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	o4.v.w = uintBitsToFloat(movc(floatBitsToUint(r0.w), uint(0xbf800000), uint(0x3f800000)));
	r1.xyz = fma(idx_uniforms0_vs.cb0[24].xyz, r0.xxx, idx_uniforms0_vs.cb0[27].xyz);
	r1.xyz = fma(idx_uniforms0_vs.cb0[25].xyz, r0.yyy, r1.xyz);
	o6.v.xyz = fma(idx_uniforms0_vs.cb0[26].xyz, r0.zzz, r1.xyz);
	r1.xyz = fma(idx_uniforms0_vs.cb0[28].xyz, r0.xxx, idx_uniforms0_vs.cb0[31].xyz);
	r0.xyw = fma(idx_uniforms0_vs.cb0[29].xyz, r0.yyy, r1.xyz);
	o7.v.xyz = fma(idx_uniforms0_vs.cb0[30].xyz, r0.zzz, r0.xyw);
	VertexEpilog();
	return;
}

