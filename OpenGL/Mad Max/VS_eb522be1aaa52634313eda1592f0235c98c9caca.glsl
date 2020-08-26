#version 460 core
// vs_5_0
// Checksum: fadf207e_3763aab0_854c503b_6e0d58c3
// Name: particleeffectblend

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
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[14]; } idx_uniforms0_vs;

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
	r0.x = v1.w;
	r0.x = r0.x * idx_uniforms1_vs.cb1[17].w;
	r0.y = intBitsToFloat(r0.x < float(0.00999999978f) ? int(0xffffffff) : int(0x00000000));
	r1.xyz = v0.xyz + idx_uniforms2_vs.cb2[3].xyz;
	r2 = r1.yyyy * idx_uniforms1_vs.cb1[1];
	r2 = fma(r1.xxxx, idx_uniforms1_vs.cb1[0], r2);
	r2 = fma(r1.zzzz, idx_uniforms1_vs.cb1[2], r2);
	r2 = r2 + idx_uniforms1_vs.cb1[3];
	gl_Position = uintBitsToFloat(movc(floatBitsToUint(r0.yyyy), uvec4(0xbf800000, 0xbf800000, 0xbf800000, 0x3f800000), floatBitsToUint(r2)));
	r0.y = -r2.z + r2.w;
	r0.z = fma(r1.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r0.z = min(r0.z, idx_uniforms0_vs.cb0[13].y);
	r0.z = -r0.z + float(1.00000000f);
	r0.w = saturate(r0.y * idx_uniforms0_vs.cb0[13].w);
	r0.z = fma(r0.w, r0.z, -idx_uniforms0_vs.cb0[12].x);
	r0.y = fma(r0.y, idx_uniforms0_vs.cb0[12].z, r0.z);
	r0.y = exp2(-r0.y);
	r0.y = -r0.y + float(1.00000000f);
	o1.v.z = max(r0.y, float(0.00000000f));
	o1.v.xy = v4.xy * vec2(1.99993896f, 1.99993896f);
	r0.yz = fma(v3.zw, vec2(1.99218750f, 1.99218750f), vec2(-1.00000000f, -1.00000000f));
	o2.v.xy = fma(v4.xy, vec2(1.99993896f, 1.99993896f), r0.yz);
	o2.v.z = v3.y;
	r0.yzw = v1.xyz * idx_uniforms1_vs.cb1[17].xyz;
	o3.v.xyz = r0.yzw * vec3(4.00000000f, 4.00000000f, 4.00000000f);
	r0.y = intBitsToFloat(float(0.00000000f) < idx_uniforms1_vs.cb1[22].w ? int(0xffffffff) : int(0x00000000));
	r2.xyz = r1.xyz + -idx_uniforms0_vs.cb0[9].xyz;
	o4.v.xyz = r1.xyz;
	r0.z = dot(r2.xyz, r2.xyz);
	r0.z = inversesqrt(r0.z);
	r1.xyz = r0.zzz * r2.xyz;
	r2.xyz = v2.xyz + vec3(-0.500000000f, -0.500000000f, -0.500000000f);
	r2.xyz = r2.xyz + r2.xyz;
	r0.z = dot(r2.xyz, r2.xyz);
	r0.w = inversesqrt(r0.z);
	r0.z = sqrt(r0.z);
	r3.xy = -r0.zz + vec2(1.00000000f, 2.00000000f);
	r4.xyz = r0.www * r2.xyz;
	r0.z = dot(r1.xyz, r4.xyz);
	r0.z = abs(r0.z) + -idx_uniforms1_vs.cb1[22].z;
	r0.z = saturate(r0.z * idx_uniforms1_vs.cb1[22].w);
	r0.y = uintBitsToFloat(movc(floatBitsToUint(r0.y), floatBitsToUint(r0.z), uint(0x3f800000)));
	o3.v.w = r0.y * r0.x;
	r0.x = intBitsToFloat(float(0.00000000f) < idx_uniforms1_vs.cb1[16].x ? int(0xffffffff) : int(0x00000000));
	r0.y = intBitsToFloat(idx_uniforms1_vs.cb1[16].x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.x = intBitsToFloat(floatBitsToInt(r0.y) + -floatBitsToInt(r0.x));
	r0.x = float(floatBitsToInt(r0.x));
	r0.y = intBitsToFloat(idx_uniforms1_vs.cb1[16].x == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r0.y), uint(0x3f800000), floatBitsToUint(r0.x)));
	r0.xyz = fma(idx_uniforms0_vs.cb0[5].xyz, r0.xxx, -r4.xyz);
	r1.x = float(1.00000000f) + -abs(idx_uniforms1_vs.cb1[16].x);
	r1.x = max(r1.x, float(0.00000000f));
	r1.y = dot(idx_uniforms0_vs.cb0[5].xyz, -idx_uniforms0_vs.cb0[8].xyz);
	r1.z = r1.x * abs(r1.y);
	r0.xyz = fma(r1.zzz, r0.xyz, r4.xyz);
	r1.z = dot(r0.xyz, r0.xyz);
	r1.z = inversesqrt(r1.z);
	r0.xyz = r0.xyz * r1.zzz;
	r0.x = dot(r0.xyz, -idx_uniforms0_vs.cb0[8].xyz);
	r0.x = saturate(fma(abs(r1.y), r1.x, r0.x));
	r0.x = max(r3.x, r0.x);
	r0.y = float(1.00000000f) / r3.y;
	r0.x = saturate(r0.y * r0.x);
	r1.xyz = r0.xxx * idx_uniforms2_vs.cb2[2].xyz;
	r0.x = v3.x * float(8.00000000f);
	r3.yzw = r0.xxx * r1.xyz;
	r0.z = dot(r3.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r1.xyz = fma(r1.xyz, r0.xxx, -r0.zzz);
	o5.v.xyz = fma(idx_uniforms1_vs.cb1[16].zzz, r1.xyz, r0.zzz);
	r0.x = idx_uniforms1_vs.cb1[7].w + -idx_uniforms1_vs.cb1[8].w;
	r0.x = max(r0.x, float(9.99999997e-07f));
	r0.z = v5.w * float(-16.0000000f);
	r1.xyz = fma(v5.xyz, r0.zzz, v0.xyz);
	r3.yzw = -r1.xyz + idx_uniforms1_vs.cb1[7].xyz;
	r0.z = dot(r3.yzw, r3.yzw);
	r1.w = sqrt(r0.z);
	r0.z = inversesqrt(r0.z);
	r3.yzw = r0.zzz * r3.yzw;
	r0.z = r1.w + -idx_uniforms1_vs.cb1[8].w;
	r0.x = saturate(r0.z / r0.x);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(-r0.x, r0.x, float(1.00000000f));
	r0.x = sqrt(r0.x);
	r0.x = -r0.x + float(1.00000000f);
	r2.xzw = fma(r2.xyz, r0.www, idx_uniforms0_vs.cb0[5].xyz);
	r0.z = fma(-r2.y, r0.w, float(0.100000001f));
	r0.z = r0.z + r0.z;
	r0.w = dot(r2.xzw, r2.xzw);
	r0.w = inversesqrt(r0.w);
	r2.xyz = r0.www * r2.xzw;
	r0.w = dot(r3.yzw, r2.xyz);
	r1.w = dot(-r3.yzw, idx_uniforms1_vs.cb1[9].xyz);
	r1.w = saturate(r1.w + idx_uniforms1_vs.cb1[9].w);
	r1.w = r1.w * r1.w;
	r0.w = max(r3.x, r0.w);
	r0.w = saturate(r0.y * r0.w);
	r0.x = r0.w * r0.x;
	r0.x = r1.w * r0.x;
	r3.yzw = r0.xxx * idx_uniforms1_vs.cb1[8].xyz;
	r0.x = idx_uniforms1_vs.cb1[4].w + -idx_uniforms1_vs.cb1[5].w;
	r0.x = max(r0.x, float(9.99999997e-07f));
	r4.xyz = -r1.xyz + idx_uniforms1_vs.cb1[4].xyz;
	r0.w = dot(r4.xyz, r4.xyz);
	r1.w = sqrt(r0.w);
	r0.w = inversesqrt(r0.w);
	r4.xyz = r0.www * r4.xyz;
	r0.w = r1.w + -idx_uniforms1_vs.cb1[5].w;
	r0.x = saturate(r0.w / r0.x);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(-r0.x, r0.x, float(1.00000000f));
	r0.x = sqrt(r0.x);
	r0.x = -r0.x + float(1.00000000f);
	r0.w = dot(r4.xyz, r2.xyz);
	r1.w = dot(-r4.xyz, idx_uniforms1_vs.cb1[6].xyz);
	r1.w = saturate(r1.w + idx_uniforms1_vs.cb1[6].w);
	r1.w = r1.w * r1.w;
	r0.w = max(r3.x, r0.w);
	r0.w = saturate(r0.y * r0.w);
	r0.x = r0.w * r0.x;
	r0.x = r1.w * r0.x;
	r3.yzw = fma(r0.xxx, idx_uniforms1_vs.cb1[5].xyz, r3.yzw);
	r4.xyz = -r1.xyz + idx_uniforms1_vs.cb1[10].xyz;
	r1.xyz = -r1.xyz + idx_uniforms1_vs.cb1[13].xyz;
	r0.x = dot(r4.xyz, r4.xyz);
	r0.w = inversesqrt(r0.x);
	r0.x = sqrt(r0.x);
	r0.x = r0.x + -idx_uniforms1_vs.cb1[11].w;
	r4.xyz = r0.www * r4.xyz;
	r0.w = dot(r4.xyz, r2.xyz);
	r1.w = dot(-r4.xyz, idx_uniforms1_vs.cb1[12].xyz);
	r1.w = saturate(r1.w + idx_uniforms1_vs.cb1[12].w);
	r1.w = r1.w * r1.w;
	r0.w = max(r3.x, r0.w);
	r0.w = saturate(r0.y * r0.w);
	r2.w = idx_uniforms1_vs.cb1[10].w + -idx_uniforms1_vs.cb1[11].w;
	r2.w = max(r2.w, float(9.99999997e-07f));
	r0.x = saturate(r0.x / r2.w);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(-r0.x, r0.x, float(1.00000000f));
	r0.x = sqrt(r0.x);
	r0.x = -r0.x + float(1.00000000f);
	r0.x = r0.w * r0.x;
	r0.x = r1.w * r0.x;
	r3.yzw = fma(r0.xxx, idx_uniforms1_vs.cb1[11].xyz, r3.yzw);
	r0.x = dot(r1.xyz, r1.xyz);
	r0.w = inversesqrt(r0.x);
	r0.x = sqrt(r0.x);
	r0.x = r0.x + -idx_uniforms1_vs.cb1[14].w;
	r1.xyz = r0.www * r1.xyz;
	r0.w = dot(r1.xyz, r2.xyz);
	r1.x = dot(-r1.xyz, idx_uniforms1_vs.cb1[15].xyz);
	r1.x = saturate(r1.x + idx_uniforms1_vs.cb1[15].w);
	r1.x = r1.x * r1.x;
	r0.w = max(r3.x, r0.w);
	r1.y = -r3.x + float(1.00000000f);
	r0.z = saturate(r0.z * r1.y);
	r0.y = saturate(r0.y * r0.w);
	r0.w = idx_uniforms1_vs.cb1[13].w + -idx_uniforms1_vs.cb1[14].w;
	r0.w = max(r0.w, float(9.99999997e-07f));
	r0.x = saturate(r0.x / r0.w);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(-r0.x, r0.x, float(1.00000000f));
	r0.x = sqrt(r0.x);
	r0.x = -r0.x + float(1.00000000f);
	r0.x = r0.y * r0.x;
	r0.x = r1.x * r0.x;
	r0.xyw = fma(r0.xxx, idx_uniforms1_vs.cb1[14].xyz, r3.yzw);
	r0.xyw = r0.xyw * idx_uniforms1_vs.cb1[16].yyy;
	r1.xyz = idx_uniforms2_vs.cb2[0].xyz + -idx_uniforms2_vs.cb2[1].xyz;
	r1.xyz = fma(r0.zzz, r1.xyz, idx_uniforms2_vs.cb2[1].xyz);
	r0.xyz = fma(r1.xyz, idx_uniforms1_vs.cb1[16].www, r0.xyw);
	r0.xyz = fma(v2.www, vec3(32.0000000f, 32.0000000f, 32.0000000f), r0.xyz);
	r0.w = dot(r0.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.xyz = -r0.www + r0.xyz;
	o6.v.xyz = fma(idx_uniforms1_vs.cb1[16].zzz, r0.xyz, r0.www);
	VertexEpilog();
	return;
}

