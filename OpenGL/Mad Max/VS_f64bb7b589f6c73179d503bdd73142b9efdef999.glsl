#version 460 core
// vs_5_0
// Checksum: 9c83e409_ba364dfe_0fd70085_179b4505
// Name: carpaintmm_damagetm

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
layout(location = 4) out idx_Varying4 { vec4 v; } o4;
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[10]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[19]; } idx_uniforms2_vs;


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
	r0.xyz = v0.www * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r0.xyz = fract(r0.xyz);
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.xyz = -v0.xyz + idx_uniforms2_vs.cb2[1].xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = saturate(fma(-r0.w, idx_uniforms2_vs.cb2[1].w, float(1.00000000f)));
	r1.x = r0.w * idx_uniforms2_vs.cb2[15].y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[0].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[0].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[15].x, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[2].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[2].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[15].z, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[3].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[3].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[15].w, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[4].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[4].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[16].x, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[5].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[5].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[16].y, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[6].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[6].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[16].z, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[7].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[7].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[16].w, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[8].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[8].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[17].x, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[9].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[9].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[17].y, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[10].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[10].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[17].z, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[11].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[11].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[17].w, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[12].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[12].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[18].x, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[13].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[13].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[18].y, r1.x);
	r0.w = r0.w + r1.y;
	r1.yzw = -v0.xyz + idx_uniforms2_vs.cb2[14].xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r1.y = saturate(fma(-r1.y, idx_uniforms2_vs.cb2[14].w, float(1.00000000f)));
	r1.x = fma(r1.y, idx_uniforms2_vs.cb2[18].z, r1.x);
	r0.w = r0.w + r1.y;
	r0.w = -r0.w + float(1.00000000f);
	r0.w = max(r0.w, float(0.00000000f));
	r0.xyz = fma(r1.xxx, r0.xyz, v0.xyz);
	r1 = r0.yyyy * idx_uniforms1_vs.cb1[1];
	r1 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r1);
	r1 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r1);
	r1 = r1 + idx_uniforms1_vs.cb1[3];
	gl_Position.z = fma(idx_uniforms1_vs.cb1[4].x, r1.w, r1.z);
	gl_Position.xyw = r1.xyw;
	o1.v.xy = v1.xy + idx_uniforms1_vs.cb1[9].xy;
	o1.v.zw = v1.zw;
	o2.v.w = r0.w;
	r0.xyz = v2.xxx * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r0.xyz = fract(r0.xyz);
	r0.xyz = fma(r0.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r1.x);
	r0.xyz = r0.xyz * r1.xxx;
	r1.xyz = v2.zzz * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r1.xyz = fract(r1.xyz);
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = fma(r1.xyz, r1.www, -r0.xyz);
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = fma(r0.www, r2.xyz, r0.xyz);
	r3.xyz = r2.yyy * idx_uniforms1_vs.cb1[6].xyz;
	r2.xyw = fma(r2.xxx, idx_uniforms1_vs.cb1[5].xyz, r3.xyz);
	o2.v.xyz = fma(r2.zzz, idx_uniforms1_vs.cb1[7].xyz, r2.xyw);
	r2.xyz = abs(v2.yyy) * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r2.xyz = fract(r2.xyz);
	r2.xyz = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = r1.www * r2.xyz;
	r3.xyz = abs(v2.www) * vec3(1.00000000f, 0.00390625000f, 1.52587891e-05f);
	r3.xyz = fract(r3.xyz);
	r3.xyz = fma(r3.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.w = dot(r3.xyz, r3.xyz);
	r1.w = inversesqrt(r1.w);
	r4.xyz = fma(r3.xyz, r1.www, -r2.xyz);
	r3.xyz = r1.www * r3.xyz;
	r4.xyz = fma(r0.www, r4.xyz, r2.xyz);
	r5.xyz = r4.yyy * idx_uniforms1_vs.cb1[6].xyz;
	r4.xyw = fma(r4.xxx, idx_uniforms1_vs.cb1[5].xyz, r5.xyz);
	o3.v.xyz = fma(r4.zzz, idx_uniforms1_vs.cb1[7].xyz, r4.xyw);
	r4.xyz = r1.zxy * r3.yzx;
	r1.xyz = fma(r1.yzx, r3.zxy, -r4.xyz);
	r3.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(vec2(0.00000000f, 0.00000000f), v2.yw))));
	r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r3.yyy), floatBitsToUint(r1.xyz), floatBitsToUint(-1.f * r1.xyz)));
	r3.yzw = r0.zxy * r2.yzx;
	r0.xyz = fma(r0.yzx, r2.zxy, -r3.yzw);
	r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r3.xxx), floatBitsToUint(r0.xyz), floatBitsToUint(-1.f * r0.xyz)));
	r1.xyz = -r0.xyz + r1.xyz;
	r0.xyz = fma(r0.www, r1.xyz, r0.xyz);
	r1.xyz = r0.yyy * idx_uniforms1_vs.cb1[6].xyz;
	r0.xyw = fma(r0.xxx, idx_uniforms1_vs.cb1[5].xyz, r1.xyz);
	o4.v.xyz = fma(r0.zzz, idx_uniforms1_vs.cb1[7].xyz, r0.xyw);
	VertexEpilog();
	return;
}

