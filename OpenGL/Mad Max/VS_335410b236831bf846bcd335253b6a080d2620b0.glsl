#version 460 core
// vs_5_0
// Checksum: b6850e95_e3f76d15_804776b1_2e425b91
// Name: characteroutline2

layout(location = 0) in vec4 v0;
layout(location = 1) in uvec4 v1;
layout(location = 3) in vec4 v3;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs1 { vec4 cb1[1]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[2]; } idx_uniforms2_vs;

layout (std140) uniform cb_vs3 { vec4 cb3[8]; } idx_uniforms3_vs;

layout (std140) uniform cb_vs4 { vec4 cb4[4096]; } idx_uniforms4_vs;


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
	r0.xy = vec2(v1.xy);
	r0.z = dot(vec2(1.00000000f, 1.00000000f), r0.xy);
	r0.z = float(1.00000000f) / r0.z;
	r0.xy = r0.xy * r0.zz;
	r0.zw = intBitsToFloat(ivec2(v1.zw) * ivec2(3, 3));
	r1 = r0.yyyy * idx_uniforms4_vs.cb4[floatBitsToInt(r0.w)];
	r1 = fma(r0.xxxx, idx_uniforms4_vs.cb4[floatBitsToInt(r0.z)], r1);
	r2 = fma(v3, vec4(6.28318548f, 6.28318548f, 6.28318548f, 6.28318548f), vec4(-3.14159274f, -3.14159274f, -3.14159274f, -3.14159274f));
	{ vec4 src = r2; r3 = sin(src); r4 = cos(src); }
	r2.x = intBitsToFloat(float(0.00000000f) < r2.w ? int(0xffffffff) : int(0x00000000));
	r2.x = uintBitsToFloat(movc(floatBitsToUint(r2.x), uint(0x3f800000), uint(0xbf800000)));
	r5.w = r4.y;
	r5.xy = abs(r3.yw) * r4.xz;
	r4.xy = abs(r3.yw) * r3.xz;
	r5.z = r4.x;
	r3.y = dot(r1.xyz, r5.xzw);
	r6 = r0.yyyy * idx_uniforms4_vs.cb4[1 + floatBitsToInt(r0.w)];
	r6 = fma(r0.xxxx, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r0.z)], r6);
	r3.z = dot(r6.xyz, r5.xzw);
	r7 = r0.yyyy * idx_uniforms4_vs.cb4[2 + floatBitsToInt(r0.w)];
	r0 = fma(r0.xxxx, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r0.z)], r7);
	r3.x = dot(r0.xyz, r5.xzw);
	r4.z = r5.y;
	r5.z = dot(r1.yxz, r4.yzw);
	r5.x = dot(r6.yxz, r4.yzw);
	r5.y = dot(r0.yxz, r4.yzw);
	r2.yzw = r3.xyz * r5.xyz;
	r2.yzw = fma(r3.zxy, r5.yzx, -r2.yzw);
	r2.xyz = r2.yzw * r2.xxx;
	r2.w = dot(r2.xyz, r2.xyz);
	r2.w = inversesqrt(r2.w);
	r3.xyz = r2.www * r2.xyz;
	r2.xyz = intBitsToFloat(mix ( ivec3(0x00000000),ivec3(0xffffffff),bvec3(equal(r2.xyz, vec3(0.00000000f, 0.00000000f, 0.00000000f)))));
	r2.x = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r2.x));
	r2.x = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r2.x));
	r2.xyz = uintBitsToFloat(movc(floatBitsToUint(r2.xxx), uvec3(0x00000000, 0x3f800000, 0x00000000), floatBitsToUint(r3.xyz)));
	r3.xyz = r2.yyy * idx_uniforms3_vs.cb3[1].xyz;
	r3.xyz = fma(r2.xxx, idx_uniforms3_vs.cb3[0].xyz, r3.xyz);
	r3.xyz = fma(r2.zzz, idx_uniforms3_vs.cb3[2].xyz, r3.xyz);
	r2.w = dot(r3.xyz, r3.xyz);
	r2.w = inversesqrt(r2.w);
	r3.xyz = r2.www * r3.xyz;
	r4.xyz = v0.xyz * idx_uniforms1_vs.cb1[0].xxx;
	r4.w = uintBitsToFloat(uint(0x3f800000));
	r5.y = dot(r6, r4);
	r6 = r5.yyyy * idx_uniforms3_vs.cb3[1];
	r5.x = dot(r1, r4);
	r5.z = dot(r0, r4);
	r0 = fma(r5.xxxx, idx_uniforms3_vs.cb3[0], r6);
	r0 = fma(r5.zzzz, idx_uniforms3_vs.cb3[2], r0);
	r0 = r0 + idx_uniforms3_vs.cb3[3];
	r1.x = r0.w * idx_uniforms2_vs.cb2[0].x;
	gl_Position.xyz = fma(r3.xyz, r1.xxx, r0.xyz);
	gl_Position.w = r0.w;
	r0.xyz = r2.yyy * idx_uniforms3_vs.cb3[5].xyz;
	r0.xyz = fma(r2.xxx, idx_uniforms3_vs.cb3[4].xyz, r0.xyz);
	o1.v.yzw = fma(r2.zzz, idx_uniforms3_vs.cb3[6].xyz, r0.xyz);
	r5.w = uintBitsToFloat(uint(0x3f800000));
	o1.v.x = dot(r5, idx_uniforms2_vs.cb2[1]);
	r0.xyz = r5.yyy * idx_uniforms3_vs.cb3[5].xyz;
	r0.xyz = fma(r5.xxx, idx_uniforms3_vs.cb3[4].xyz, r0.xyz);
	r0.xyz = fma(r5.zzz, idx_uniforms3_vs.cb3[6].xyz, r0.xyz);
	o2.v.xyz = r0.xyz + idx_uniforms3_vs.cb3[7].xyz;
	VertexEpilog();
	return;
}

