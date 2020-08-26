#version 460 core
// vs_5_0
// Checksum: 1feded97_624a9c2a_b68dce55_8fe2ec26
// Name: particleeffectblendvertexshadowsofterosionprjfar

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
vec4 r0, r1, r2, r3;

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
	r1.z = uintBitsToFloat(uint(0x00000000));
	r2.xyz = v0.xyz + idx_uniforms2_vs.cb2[3].xyz;
	r3.xyz = r2.yyy * idx_uniforms1_vs.cb1[1].xyw;
	r3.xyz = fma(r2.xxx, idx_uniforms1_vs.cb1[0].xyw, r3.xyz);
	r3.xyz = fma(r2.zzz, idx_uniforms1_vs.cb1[2].xyw, r3.xyz);
	r1.xyw = r3.xyz + idx_uniforms1_vs.cb1[3].xyw;
	gl_Position = uintBitsToFloat(movc(floatBitsToUint(r0.yyyy), uvec4(0xbf800000, 0xbf800000, 0xbf800000, 0x3f800000), floatBitsToUint(r1)));
	r0.y = fma(r2.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r0.y = min(r0.y, idx_uniforms0_vs.cb0[13].y);
	r0.y = -r0.y + float(1.00000000f);
	r0.z = saturate(r1.w * idx_uniforms0_vs.cb0[13].w);
	r0.y = fma(r0.z, r0.y, -idx_uniforms0_vs.cb0[12].x);
	r0.y = fma(r1.w, idx_uniforms0_vs.cb0[12].z, r0.y);
	r0.y = exp2(-r0.y);
	r0.y = -r0.y + float(1.00000000f);
	o1.v.z = max(r0.y, float(0.00000000f));
	o1.v.xy = v4.xy * vec2(1.99993896f, 1.99993896f);
	o1.v.w = v6.w;
	r0.yz = fma(v3.zw, vec2(1.99218750f, 1.99218750f), vec2(-1.00000000f, -1.00000000f));
	o2.v.xy = fma(v4.xy, vec2(1.99993896f, 1.99993896f), r0.yz);
	o2.v.z = v3.y;
	r0.yzw = r2.xyz + -idx_uniforms0_vs.cb0[9].xyz;
	o4.v.xyz = r2.xyz;
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = inversesqrt(r1.x);
	r0.yzw = r0.yzw * r1.xxx;
	r1.xyz = v2.xyz + vec3(-0.500000000f, -0.500000000f, -0.500000000f);
	r1.xyz = r1.xyz + r1.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r2.x = inversesqrt(r1.w);
	r1.w = sqrt(r1.w);
	r2.yz = -r1.ww + vec2(1.00000000f, 2.00000000f);
	r1.xzw = r1.xyz * r2.xxx;
	r1.y = fma(-r1.y, r2.x, float(0.100000001f));
	r1.y = r1.y + r1.y;
	r0.y = dot(r0.yzw, r1.xzw);
	r0.y = abs(r0.y) + -idx_uniforms1_vs.cb1[22].z;
	r0.y = saturate(r0.y * idx_uniforms1_vs.cb1[22].w);
	r0.z = intBitsToFloat(float(0.00000000f) < idx_uniforms1_vs.cb1[22].w ? int(0xffffffff) : int(0x00000000));
	r0.y = uintBitsToFloat(movc(floatBitsToUint(r0.z), floatBitsToUint(r0.y), uint(0x3f800000)));
	o3.v.w = r0.y * r0.x;
	r0.xyz = v1.xyz * idx_uniforms1_vs.cb1[17].xyz;
	o3.v.xyz = r0.xyz * vec3(4.00000000f, 4.00000000f, 4.00000000f);
	r0.x = intBitsToFloat(float(0.00000000f) < idx_uniforms1_vs.cb1[16].x ? int(0xffffffff) : int(0x00000000));
	r0.y = intBitsToFloat(idx_uniforms1_vs.cb1[16].x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.x = intBitsToFloat(floatBitsToInt(r0.y) + -floatBitsToInt(r0.x));
	r0.x = float(floatBitsToInt(r0.x));
	r0.y = intBitsToFloat(idx_uniforms1_vs.cb1[16].x == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r0.y), uint(0x3f800000), floatBitsToUint(r0.x)));
	r0.xyz = fma(idx_uniforms0_vs.cb0[5].xyz, r0.xxx, -r1.xzw);
	r0.w = float(1.00000000f) + -abs(idx_uniforms1_vs.cb1[16].x);
	r0.w = max(r0.w, float(0.00000000f));
	r2.x = dot(idx_uniforms0_vs.cb0[5].xyz, -idx_uniforms0_vs.cb0[8].xyz);
	r2.w = r0.w * abs(r2.x);
	r0.xyz = fma(r2.www, r0.xyz, r1.xzw);
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r1.x);
	r0.xyz = r0.xyz * r1.xxx;
	r0.x = dot(r0.xyz, -idx_uniforms0_vs.cb0[8].xyz);
	r0.x = saturate(fma(abs(r2.x), r0.w, r0.x));
	r0.x = max(r2.y, r0.x);
	r0.y = float(1.00000000f) / r2.z;
	r0.z = -r2.y + float(1.00000000f);
	r0.z = saturate(r0.z * r1.y);
	r0.x = saturate(r0.y * r0.x);
	r0.xyw = r0.xxx * idx_uniforms2_vs.cb2[2].xyz;
	r1.x = v3.x * float(8.00000000f);
	r0.xyw = r0.xyw * r1.xxx;
	r1.x = v5.x * float(0.00390625000f);
	r1.y = fract(r1.x);
	r1.x = floor(r1.x);
	r2.y = fma(r1.x, float(0.00392156886f), float(0.00195312500f));
	r2.x = r1.y + float(0.00195312500f);
	r1.xyz = ((textureLod(resourceSamplerPair_0_vs, r2.xy, float(0.00000000f)))).xyz;
	r2.xyz = r0.xyw * r1.xyz;
	r1.w = dot(r2.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.xyw = fma(r0.xyw, r1.xyz, -r1.www);
	o5.v.xyz = fma(idx_uniforms1_vs.cb1[16].zzz, r0.xyw, r1.www);
	r0.xyw = idx_uniforms2_vs.cb2[0].xyz + -idx_uniforms2_vs.cb2[1].xyz;
	r0.xyz = fma(r0.zzz, r0.xyw, idx_uniforms2_vs.cb2[1].xyz);
	r0.w = v2.w * float(32.0000000f);
	r0.xyz = fma(r0.xyz, idx_uniforms1_vs.cb1[16].www, r0.www);
	r0.w = dot(r0.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.xyz = -r0.www + r0.xyz;
	o6.v.xyz = fma(idx_uniforms1_vs.cb1[16].zzz, r0.xyz, r0.www);
	VertexEpilog();
	return;
}

