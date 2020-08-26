#version 460 core
// vs_5_0
// Checksum: 486ae223_90792f7e_1d16ad82_1d2e3840
// Name: character22uvs_fw

layout(location = 0) in vec4 v0;
layout(location = 1) in uvec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 v3;
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
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[32]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[3]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[5]; } idx_uniforms2_vs;

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

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = vec2(v1.xy);
	r0.z = dot(vec2(1.00000000f, 1.00000000f), r0.xy);
	r0.z = float(1.00000000f) / r0.z;
	r0.xy = r0.xy * r0.zz;
	r0.zw = intBitsToFloat(ivec2(v1.zw) * ivec2(3, 3));
	r1 = r0.yyyy * idx_uniforms4_vs.cb4[1 + floatBitsToInt(r0.w)];
	r1 = fma(r0.xxxx, idx_uniforms4_vs.cb4[1 + floatBitsToInt(r0.z)], r1);
	r2.xyz = v0.xyz * idx_uniforms1_vs.cb1[0].xxx;
	r2.w = uintBitsToFloat(uint(0x3f800000));
	r1.w = dot(r1, r2);
	r3 = r1.wwww * idx_uniforms3_vs.cb3[1];
	r4.xyz = r1.www * idx_uniforms3_vs.cb3[5].xyz;
	r5 = r0.yyyy * idx_uniforms4_vs.cb4[floatBitsToInt(r0.w)];
	r5 = fma(r0.xxxx, idx_uniforms4_vs.cb4[floatBitsToInt(r0.z)], r5);
	r1.w = dot(r5, r2);
	r3 = fma(r1.wwww, idx_uniforms3_vs.cb3[0], r3);
	r4.xyz = fma(r1.www, idx_uniforms3_vs.cb3[4].xyz, r4.xyz);
	r6 = r0.yyyy * idx_uniforms4_vs.cb4[2 + floatBitsToInt(r0.w)];
	r0 = fma(r0.xxxx, idx_uniforms4_vs.cb4[2 + floatBitsToInt(r0.z)], r6);
	r0.w = dot(r0, r2);
	r2 = fma(r0.wwww, idx_uniforms3_vs.cb3[2], r3);
	r3.xyz = fma(r0.www, idx_uniforms3_vs.cb3[6].xyz, r4.xyz);
	r3.xyz = r3.xyz + idx_uniforms3_vs.cb3[7].xyz;
	r2 = r2 + idx_uniforms3_vs.cb3[3];
	gl_Position = r2;
	r0.w = -r2.z + r2.w;
	r2.xy = v2.xy * idx_uniforms1_vs.cb1[0].yz;
	r2.zw = v2.zw * idx_uniforms1_vs.cb1[1].xy;
	o1.v = r2;
	o2.v.w = uintBitsToFloat(uint(0x00000000));
	r4 = fma(v3, vec4(6.28318548f, 6.28318548f, 6.28318548f, 6.28318548f), vec4(-3.14159274f, -3.14159274f, -3.14159274f, -3.14159274f));
	{ vec4 src = r4; r6 = sin(src); r7 = cos(src); }
	r1.w = intBitsToFloat(float(0.00000000f) < r4.w ? int(0xffffffff) : int(0x00000000));
	r1.w = uintBitsToFloat(movc(floatBitsToUint(r1.w), uint(0x3f800000), uint(0xbf800000)));
	r4.w = r7.y;
	r4.xy = abs(r6.yw) * r7.xz;
	r7.xy = abs(r6.yw) * r6.xz;
	r4.z = r7.x;
	r6.z = dot(r1.xyz, r4.xzw);
	r8.xyz = r6.zzz * idx_uniforms3_vs.cb3[5].xyz;
	r6.y = dot(r5.xyz, r4.xzw);
	r6.x = dot(r0.xyz, r4.xzw);
	r7.z = r4.y;
	r4.xyz = fma(r6.yyy, idx_uniforms3_vs.cb3[4].xyz, r8.xyz);
	o2.v.xyz = fma(r6.xxx, idx_uniforms3_vs.cb3[6].xyz, r4.xyz);
	r1.x = dot(r1.yxz, r7.yzw);
	r4.xyz = r1.xxx * idx_uniforms3_vs.cb3[5].xyz;
	r1.z = dot(r5.yxz, r7.yzw);
	r1.y = dot(r0.yxz, r7.yzw);
	r0.xyz = fma(r1.zzz, idx_uniforms3_vs.cb3[4].xyz, r4.xyz);
	o3.v.xyz = fma(r1.yyy, idx_uniforms3_vs.cb3[6].xyz, r0.xyz);
	o3.v.w = uintBitsToFloat(uint(0x00000000));
	r0.xyz = r1.xyz * r6.xyz;
	r0.xyz = fma(r6.zxy, r1.yzx, -r0.xyz);
	r0.xyz = r0.xyz * r1.www;
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r1.x);
	r1.xyz = r0.xyz * r1.xxx;
	r0.xyz = intBitsToFloat(mix ( ivec3(0x00000000),ivec3(0xffffffff),bvec3(equal(r0.xyz, vec3(0.00000000f, 0.00000000f, 0.00000000f)))));
	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
	r0.x = uintBitsToFloat(floatBitsToUint(r0.z) & floatBitsToUint(r0.x));
	r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.xxx), uvec3(0x00000000, 0x3f800000, 0x00000000), floatBitsToUint(r1.xyz)));
	r1.xyz = r0.yyy * idx_uniforms3_vs.cb3[5].xyz;
	r1.xyz = fma(r0.xxx, idx_uniforms3_vs.cb3[4].xyz, r1.xyz);
	r0.xyz = fma(r0.zzz, idx_uniforms3_vs.cb3[6].xyz, r1.xyz);
	o4.v.xyz = r0.xyz;
	o4.v.w = uintBitsToFloat(uint(0x00000000));
	r1.x = saturate(r0.w * idx_uniforms0_vs.cb0[13].w);
	r1.y = fma(r3.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r1.y = min(r1.y, idx_uniforms0_vs.cb0[13].y);
	r1.y = -r1.y + float(1.00000000f);
	r1.x = fma(r1.x, r1.y, -idx_uniforms0_vs.cb0[12].x);
	o5.v.w = fma(r0.w, idx_uniforms0_vs.cb0[12].z, r1.x);
	o5.v.xyz = r3.xyz;
	r1.xyz = r3.xyz + -idx_uniforms0_vs.cb0[9].xyz;
	r3 = fma(idx_uniforms0_vs.cb0[24], r1.xxxx, idx_uniforms0_vs.cb0[27]);
	r3 = fma(idx_uniforms0_vs.cb0[25], r1.yyyy, r3);
	o6.v = fma(idx_uniforms0_vs.cb0[26], r1.zzzz, r3);
	r3 = fma(idx_uniforms0_vs.cb0[28], r1.xxxx, idx_uniforms0_vs.cb0[31]);
	r3 = fma(idx_uniforms0_vs.cb0[29], r1.yyyy, r3);
	o7.v = fma(idx_uniforms0_vs.cb0[30], r1.zzzz, r3);
	r0.w = saturate(dot(r0.xyz, idx_uniforms2_vs.cb2[3].xyz));
	r0.x = saturate(dot(r0.xyz, idx_uniforms2_vs.cb2[1].xyz));
	r0.yzw = r0.www * idx_uniforms2_vs.cb2[4].xyz;
	o8.v.xyz = fma(r0.xxx, idx_uniforms2_vs.cb2[2].xyz, r0.yzw);
	o8.v.w = idx_uniforms2_vs.cb2[0].w;
	r0.x = intBitsToFloat(idx_uniforms1_vs.cb1[2].z == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.xy = uintBitsToFloat(movc(floatBitsToUint(r0.xx), floatBitsToUint(r2.xy), floatBitsToUint(r2.zw)));
	o9.v.xy = r0.xy + idx_uniforms1_vs.cb1[2].xy;
	VertexEpilog();
	return;
}

