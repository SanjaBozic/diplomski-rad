#version 460 core
// vs_5_0
// Checksum: 989d26e5_720ada2e_683d1f72_59e1be5e
// Name: particleeffectflareblend

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 v3;
layout(location = 4) in vec4 v4;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[9]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[18]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[3]; } idx_uniforms2_vs;


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
	r0.xy = v0.xy * idx_uniforms1_vs.cb1[0].xy;
	r0.zw = uintBitsToFloat(uvec2(0x00000000, 0x3f800000));
	r1 = v1 * idx_uniforms1_vs.cb1[17];
	r2.x = intBitsToFloat(r1.w < float(0.00999999978f) ? int(0xffffffff) : int(0x00000000));
	gl_Position = uintBitsToFloat(movc(floatBitsToUint(r2.xxxx), uvec4(0xbf800000, 0xbf800000, 0xbf800000, 0x3f800000), floatBitsToUint(r0)));
	o1.v.xy = v4.xy * vec2(1.99218750f, 1.99218750f);
	o2.v.xy = v4.zw * vec2(1.99218750f, 1.99218750f);
	o2.v.z = v3.y;
	r0.xyz = -idx_uniforms0_vs.cb0[4].xyz + idx_uniforms1_vs.cb1[7].xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r2.x = inversesqrt(r0.w);
	r0.w = sqrt(r0.w);
	r0.w = r0.w + -idx_uniforms1_vs.cb1[8].w;
	r0.xyz = r0.xyz * r2.xxx;
	r2.x = dot(-r0.xyz, idx_uniforms1_vs.cb1[9].xyz);
	r2.x = saturate(r2.x + idx_uniforms1_vs.cb1[9].w);
	r2.x = r2.x * r2.x;
	r2.y = idx_uniforms1_vs.cb1[7].w + -idx_uniforms1_vs.cb1[8].w;
	r2.y = max(r2.y, float(9.99999997e-07f));
	r0.w = saturate(r0.w / r2.y);
	r0.w = r0.w + float(-1.00000000f);
	r0.w = fma(-r0.w, r0.w, float(1.00000000f));
	r0.w = sqrt(r0.w);
	r2.y = intBitsToFloat(float(0.00000000f) < idx_uniforms1_vs.cb1[16].x ? int(0xffffffff) : int(0x00000000));
	r2.z = intBitsToFloat(idx_uniforms1_vs.cb1[16].x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r2.y = intBitsToFloat(floatBitsToInt(r2.z) + -floatBitsToInt(r2.y));
	r2.y = float(floatBitsToInt(r2.y));
	r2.z = intBitsToFloat(idx_uniforms1_vs.cb1[16].x == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r2.y = uintBitsToFloat(movc(floatBitsToUint(r2.z), uint(0x3f800000), floatBitsToUint(r2.y)));
	r2.yzw = r2.yyy * idx_uniforms0_vs.cb0[5].xyz;
	r0.x = dot(r0.xyz, r2.yzw);
	r3.xyz = v2.xyz + vec3(-0.500000000f, -0.500000000f, -0.500000000f);
	r3.xyz = r3.xyz + r3.xyz;
	r0.y = dot(r3.xyz, r3.xyz);
	r0.y = sqrt(r0.y);
	r0.yzw = -r0.yyw + vec3(1.00000000f, 2.00000000f, 1.00000000f);
	r0.x = max(r0.y, r0.x);
	r0.z = float(1.00000000f) / r0.z;
	r0.x = saturate(r0.z * r0.x);
	r0.x = r0.x * r0.w;
	r0.x = r2.x * r0.x;
	r3.xyz = r0.xxx * idx_uniforms1_vs.cb1[8].xyz;
	r0.x = idx_uniforms1_vs.cb1[4].w + -idx_uniforms1_vs.cb1[5].w;
	r0.x = max(r0.x, float(9.99999997e-07f));
	r4.xyz = -idx_uniforms0_vs.cb0[4].xyz + idx_uniforms1_vs.cb1[4].xyz;
	r0.w = dot(r4.xyz, r4.xyz);
	r2.x = sqrt(r0.w);
	r0.w = inversesqrt(r0.w);
	r4.xyz = r0.www * r4.xyz;
	r0.w = r2.x + -idx_uniforms1_vs.cb1[5].w;
	r0.x = saturate(r0.w / r0.x);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(-r0.x, r0.x, float(1.00000000f));
	r0.x = sqrt(r0.x);
	r0.x = -r0.x + float(1.00000000f);
	r0.w = dot(r4.xyz, r2.yzw);
	r2.x = dot(-r4.xyz, idx_uniforms1_vs.cb1[6].xyz);
	r2.x = saturate(r2.x + idx_uniforms1_vs.cb1[6].w);
	r2.x = r2.x * r2.x;
	r0.w = max(r0.y, r0.w);
	r0.w = saturate(r0.z * r0.w);
	r0.x = r0.w * r0.x;
	r0.x = r2.x * r0.x;
	r3.xyz = fma(r0.xxx, idx_uniforms1_vs.cb1[5].xyz, r3.xyz);
	r0.x = idx_uniforms1_vs.cb1[10].w + -idx_uniforms1_vs.cb1[11].w;
	r0.x = max(r0.x, float(9.99999997e-07f));
	r4.xyz = -idx_uniforms0_vs.cb0[4].xyz + idx_uniforms1_vs.cb1[10].xyz;
	r0.w = dot(r4.xyz, r4.xyz);
	r2.x = sqrt(r0.w);
	r0.w = inversesqrt(r0.w);
	r4.xyz = r0.www * r4.xyz;
	r0.w = r2.x + -idx_uniforms1_vs.cb1[11].w;
	r0.x = saturate(r0.w / r0.x);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(-r0.x, r0.x, float(1.00000000f));
	r0.x = sqrt(r0.x);
	r0.x = -r0.x + float(1.00000000f);
	r0.w = dot(r4.xyz, r2.yzw);
	r2.x = dot(-r4.xyz, idx_uniforms1_vs.cb1[12].xyz);
	r2.x = saturate(r2.x + idx_uniforms1_vs.cb1[12].w);
	r2.x = r2.x * r2.x;
	r0.w = max(r0.y, r0.w);
	r0.w = saturate(r0.z * r0.w);
	r0.x = r0.w * r0.x;
	r0.x = r2.x * r0.x;
	r3.xyz = fma(r0.xxx, idx_uniforms1_vs.cb1[11].xyz, r3.xyz);
	r4.xyz = -idx_uniforms0_vs.cb0[4].xyz + idx_uniforms1_vs.cb1[13].xyz;
	r0.x = dot(r4.xyz, r4.xyz);
	r0.w = inversesqrt(r0.x);
	r0.x = sqrt(r0.x);
	r0.x = r0.x + -idx_uniforms1_vs.cb1[14].w;
	r4.xyz = r0.www * r4.xyz;
	r0.w = dot(r4.xyz, r2.yzw);
	r2.x = saturate(dot(r2.yzw, -idx_uniforms0_vs.cb0[8].xyz));
	r2.x = r0.y + r2.x;
	r2.x = saturate(r0.z * r2.x);
	r2.xyz = r2.xxx * idx_uniforms2_vs.cb2[2].xyz;
	r2.w = dot(-r4.xyz, idx_uniforms1_vs.cb1[15].xyz);
	r2.w = saturate(r2.w + idx_uniforms1_vs.cb1[15].w);
	r2.w = r2.w * r2.w;
	r0.w = max(r0.y, r0.w);
	r0.z = saturate(r0.z * r0.w);
	r0.w = idx_uniforms1_vs.cb1[13].w + -idx_uniforms1_vs.cb1[14].w;
	r0.w = max(r0.w, float(9.99999997e-07f));
	r0.x = saturate(r0.x / r0.w);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(-r0.x, r0.x, float(1.00000000f));
	r0.x = sqrt(r0.x);
	r0.xy = -r0.xy + vec2(1.00000000f, 1.00000000f);
	r0.x = r0.z * r0.x;
	r0.x = r2.w * r0.x;
	r0.xzw = fma(r0.xxx, idx_uniforms1_vs.cb1[14].xyz, r3.xyz);
	r2.w = -idx_uniforms0_vs.cb0[5].y + float(0.100000001f);
	r2.w = r2.w + r2.w;
	r0.y = saturate(r0.y * r2.w);
	r3.xyz = idx_uniforms2_vs.cb2[0].xyz + -idx_uniforms2_vs.cb2[1].xyz;
	r3.xyz = fma(r0.yyy, r3.xyz, idx_uniforms2_vs.cb2[1].xyz);
	r0.y = v3.x * float(8.00000000f);
	r2.xyz = r0.yyy * r2.xyz;
	r2.xyz = fma(r3.xyz, idx_uniforms1_vs.cb1[16].www, r2.xyz);
	r0.xyz = fma(r0.xzw, idx_uniforms1_vs.cb1[16].yyy, r2.xyz);
	r0.xyz = fma(v2.www, vec3(32.0000000f, 32.0000000f, 32.0000000f), r0.xyz);
	r0.w = dot(r0.xzy, vec3(0.300000012f, 0.300000012f, 0.400000006f));
	r0.xyz = -r0.www + r0.xyz;
	r0.xyz = fma(idx_uniforms1_vs.cb1[16].zzz, r0.xyz, r0.www);
	o3.v.xyz = r0.xyz * r1.xyz;
	o3.v.w = r1.w;
	VertexEpilog();
	return;
}

