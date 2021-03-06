#version 460 core
// vs_5_0
// Checksum: 9e05b4b6_d5edac47_0de357c3_8c2a4c30
// Name: carpaintmm

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
layout(location = 4) out idx_Varying4 { vec4 v; } o4;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[10]; } idx_uniforms1_vs;


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
	r0 = fma(v0.zzzz, idx_uniforms1_vs.cb1[2], r0);
	r0 = r0 + idx_uniforms1_vs.cb1[3];
	gl_Position.z = fma(idx_uniforms1_vs.cb1[4].x, r0.w, r0.z);
	gl_Position.xyw = r0.xyw;
	o1.v.xy = v1.xy + idx_uniforms1_vs.cb1[9].xy;
	o1.v.zw = v1.zw;
	r0.xyz = v2.xxx * vec3(1.52587891e-05f, 1.00000000f, 0.00390625000f);
	r0.xyz = fract(r0.xyz);
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r1.xyz = r0.zzz * idx_uniforms1_vs.cb1[6].xyz;
	r1.xyz = fma(r0.yyy, idx_uniforms1_vs.cb1[5].xyz, r1.xyz);
	o2.v.xyz = fma(r0.xxx, idx_uniforms1_vs.cb1[7].xyz, r1.xyz);
	o2.v.w = uintBitsToFloat(uint(0x3f800000));
	r1.xyz = abs(v2.yyy) * vec3(0.00390625000f, 1.52587891e-05f, 1.00000000f);
	r1.xyz = fract(r1.xyz);
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xyz = r0.www * r1.xyz;
	r2.xyz = r1.xxx * idx_uniforms1_vs.cb1[6].xyz;
	r2.xyz = fma(r1.zzz, idx_uniforms1_vs.cb1[5].xyz, r2.xyz);
	o3.v.xyz = fma(r1.yyy, idx_uniforms1_vs.cb1[7].xyz, r2.xyz);
	r2.xyz = r0.xyz * r1.xyz;
	r0.xyz = fma(r0.zxy, r1.yzx, -r2.xyz);
	r0.w = intBitsToFloat(float(0.00000000f) < v2.y ? int(0xffffffff) : int(0x00000000));
	r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.www), floatBitsToUint(r0.xyz), floatBitsToUint(-1.f * r0.xyz)));
	r1.xyz = r0.yyy * idx_uniforms1_vs.cb1[6].xyz;
	r0.xyw = fma(r0.xxx, idx_uniforms1_vs.cb1[5].xyz, r1.xyz);
	o4.v.xyz = fma(r0.zzz, idx_uniforms1_vs.cb1[7].xyz, r0.xyw);
	VertexEpilog();
	return;
}

