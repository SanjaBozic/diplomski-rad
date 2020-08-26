#version 460 core
// vs_5_0
// Checksum: 000911e1_e18c2db9_f3b93d3a_2eef71cb
// Name: particleeffectblendvertexshadowsoft

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 v3;
layout(location = 4) in vec4 v4;
layout(location = 5) in vec4 v5;
layout(location = 6) in vec4 v6;
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

// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_vs; // res0, s0

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
	r0.x = v5.x * float(0.00390625000f);
	r0.y = fract(r0.x);
	r0.x = floor(r0.x);
	r1.y = fma(r0.x, float(0.00392156886f), float(0.00195312500f));
	r1.x = r0.y + float(0.00195312500f);
	r0.xyz = ((textureLod(resourceSamplerPair_0_vs, r1.xy, float(0.00000000f)))).xyz;
	r1.x = intBitsToFloat(float(0.00000000f) < idx_uniforms1_vs.cb1[16].x ? int(0xffffffff) : int(0x00000000));
	r1.y = intBitsToFloat(idx_uniforms1_vs.cb1[16].x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r1.x = intBitsToFloat(floatBitsToInt(r1.y) + -floatBitsToInt(r1.x));
	r1.x = float(floatBitsToInt(r1.x));
	r1.y = intBitsToFloat(idx_uniforms1_vs.cb1[16].x == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r1.x = uintBitsToFloat(movc(floatBitsToUint(r1.y), uint(0x3f800000), floatBitsToUint(r1.x)));
	r1.xyz = fma(idx_uniforms0_vs.cb0[5].xyz, r1.xxx, -r4.xyz);
	r1.w = float(1.00000000f) + -abs(idx_uniforms1_vs.cb1[16].x);
	r1.w = max(r1.w, float(0.00000000f));
	r2.w = dot(idx_uniforms0_vs.cb0[5].xyz, -idx_uniforms0_vs.cb0[8].xyz);
	r3.z = r1.w * abs(r2.w);
	r1.xyz = fma(r3.zzz, r1.xyz, r4.xyz);
	r3.z = dot(r1.xyz, r1.xyz);
	r3.z = inversesqrt(r3.z);
	r1.xyz = r1.xyz * r3.zzz;
	r1.x = dot(r1.xyz, -idx_uniforms0_vs.cb0[8].xyz);
	r1.x = saturate(fma(abs(r2.w), r1.w, r1.x));
	r1.x = max(r3.x, r1.x);
	r1.y = float(1.00000000f) / r3.y;
	r1.x = saturate(r1.y * r1.x);
	r1.xzw = r1.xxx * idx_uniforms2_vs.cb2[2].xyz;
	r2.w = v3.x * float(8.00000000f);
	r1.xzw = r1.xzw * r2.www;
	r3.yzw = r0.xyz * r1.xzw;
	r2.w = dot(r3.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.xyz = fma(r1.xzw, r0.xyz, -r2.www);
	o5.v.xyz = fma(idx_uniforms1_vs.cb1[16].zzz, r0.xyz, r2.www);
	r0.x = idx_uniforms1_vs.cb1[7].w + -idx_uniforms1_vs.cb1[8].w;
	r0.x = max(r0.x, float(9.99999997e-07f));
	r0.y = v6.w * float(-16.0000000f);
	r1.xzw = fma(v6.xyz, r0.yyy, v0.xyz);
	r3.yzw = -r1.xzw + idx_uniforms1_vs.cb1[7].xyz;
	r0.y = dot(r3.yzw, r3.yzw);
	r0.z = sqrt(r0.y);
	r0.y = inversesqrt(r0.y);
	r3.yzw = r0.yyy * r3.yzw;
	r0.y = r0.z + -idx_uniforms1_vs.cb1[8].w;
	r0.x = saturate(r0.y / r0.x);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(-r0.x, r0.x, float(1.00000000f));
	r0.x = sqrt(r0.x);
	r0.x = -r0.x + float(1.00000000f);
	r2.xzw = fma(r2.xyz, r0.www, idx_uniforms0_vs.cb0[5].xyz);
	r0.y = fma(-r2.y, r0.w, float(0.100000001f));
	r0.y = r0.y + r0.y;
	r0.z = dot(r2.xzw, r2.xzw);
	r0.z = inversesqrt(r0.z);
	r2.xyz = r0.zzz * r2.xzw;
	r0.z = dot(r3.yzw, r2.xyz);
	r0.w = dot(-r3.yzw, idx_uniforms1_vs.cb1[9].xyz);
	r0.w = saturate(r0.w + idx_uniforms1_vs.cb1[9].w);
	r0.w = r0.w * r0.w;
	r0.z = max(r3.x, r0.z);
	r0.z = saturate(r1.y * r0.z);
	r0.x = r0.z * r0.x;
	r0.x = r0.w * r0.x;
	r0.xzw = r0.xxx * idx_uniforms1_vs.cb1[8].xyz;
	r2.w = idx_uniforms1_vs.cb1[4].w + -idx_uniforms1_vs.cb1[5].w;
	r2.w = max(r2.w, float(9.99999997e-07f));
	r3.yzw = -r1.xzw + idx_uniforms1_vs.cb1[4].xyz;
	r4.x = dot(r3.yzw, r3.yzw);
	r4.y = sqrt(r4.x);
	r4.x = inversesqrt(r4.x);
	r3.yzw = r3.yzw * r4.xxx;
	r4.x = r4.y + -idx_uniforms1_vs.cb1[5].w;
	r2.w = saturate(r4.x / r2.w);
	r2.w = r2.w + float(-1.00000000f);
	r2.w = fma(-r2.w, r2.w, float(1.00000000f));
	r2.w = sqrt(r2.w);
	r2.w = -r2.w + float(1.00000000f);
	r4.x = dot(r3.yzw, r2.xyz);
	r3.y = dot(-r3.yzw, idx_uniforms1_vs.cb1[6].xyz);
	r3.y = saturate(r3.y + idx_uniforms1_vs.cb1[6].w);
	r3.y = r3.y * r3.y;
	r3.z = max(r3.x, r4.x);
	r3.z = saturate(r1.y * r3.z);
	r2.w = r2.w * r3.z;
	r2.w = r3.y * r2.w;
	r0.xzw = fma(r2.www, idx_uniforms1_vs.cb1[5].xyz, r0.xzw);
	r3.yzw = -r1.xzw + idx_uniforms1_vs.cb1[10].xyz;
	r1.xzw = -r1.xzw + idx_uniforms1_vs.cb1[13].xyz;
	r2.w = dot(r3.yzw, r3.yzw);
	r4.x = inversesqrt(r2.w);
	r2.w = sqrt(r2.w);
	r2.w = r2.w + -idx_uniforms1_vs.cb1[11].w;
	r3.yzw = r3.yzw * r4.xxx;
	r4.x = dot(r3.yzw, r2.xyz);
	r3.y = dot(-r3.yzw, idx_uniforms1_vs.cb1[12].xyz);
	r3.y = saturate(r3.y + idx_uniforms1_vs.cb1[12].w);
	r3.y = r3.y * r3.y;
	r3.z = max(r3.x, r4.x);
	r3.z = saturate(r1.y * r3.z);
	r3.w = idx_uniforms1_vs.cb1[10].w + -idx_uniforms1_vs.cb1[11].w;
	r3.w = max(r3.w, float(9.99999997e-07f));
	r2.w = saturate(r2.w / r3.w);
	r2.w = r2.w + float(-1.00000000f);
	r2.w = fma(-r2.w, r2.w, float(1.00000000f));
	r2.w = sqrt(r2.w);
	r2.w = -r2.w + float(1.00000000f);
	r2.w = r3.z * r2.w;
	r2.w = r3.y * r2.w;
	r0.xzw = fma(r2.www, idx_uniforms1_vs.cb1[11].xyz, r0.xzw);
	r2.w = dot(r1.xzw, r1.xzw);
	r3.y = inversesqrt(r2.w);
	r2.w = sqrt(r2.w);
	r2.w = r2.w + -idx_uniforms1_vs.cb1[14].w;
	r1.xzw = r1.xzw * r3.yyy;
	r2.x = dot(r1.xzw, r2.xyz);
	r1.x = dot(-r1.xzw, idx_uniforms1_vs.cb1[15].xyz);
	r1.x = saturate(r1.x + idx_uniforms1_vs.cb1[15].w);
	r1.x = r1.x * r1.x;
	r1.z = max(r3.x, r2.x);
	r1.w = -r3.x + float(1.00000000f);
	r0.y = saturate(r0.y * r1.w);
	r1.y = saturate(r1.y * r1.z);
	r1.z = idx_uniforms1_vs.cb1[13].w + -idx_uniforms1_vs.cb1[14].w;
	r1.z = max(r1.z, float(9.99999997e-07f));
	r1.z = saturate(r2.w / r1.z);
	r1.z = r1.z + float(-1.00000000f);
	r1.z = fma(-r1.z, r1.z, float(1.00000000f));
	r1.z = sqrt(r1.z);
	r1.z = -r1.z + float(1.00000000f);
	r1.y = r1.y * r1.z;
	r1.x = r1.x * r1.y;
	r0.xzw = fma(r1.xxx, idx_uniforms1_vs.cb1[14].xyz, r0.xzw);
	r0.xzw = r0.xzw * idx_uniforms1_vs.cb1[16].yyy;
	r1.xyz = idx_uniforms2_vs.cb2[0].xyz + -idx_uniforms2_vs.cb2[1].xyz;
	r1.xyz = fma(r0.yyy, r1.xyz, idx_uniforms2_vs.cb2[1].xyz);
	r0.xyz = fma(r1.xyz, idx_uniforms1_vs.cb1[16].www, r0.xzw);
	r0.xyz = fma(v2.www, vec3(32.0000000f, 32.0000000f, 32.0000000f), r0.xyz);
	r0.w = dot(r0.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.xyz = -r0.www + r0.xyz;
	o6.v.xyz = fma(idx_uniforms1_vs.cb1[16].zzz, r0.xyz, r0.www);
	VertexEpilog();
	return;
}

