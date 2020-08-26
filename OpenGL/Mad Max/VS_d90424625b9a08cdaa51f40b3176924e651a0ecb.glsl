#version 460 core
// vs_5_0
// Checksum: 6a04c674_73ed3f75_93d1bb23_d7e58a2c
// Name: lightsource

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
uint idx_VertexID = uint(gl_VertexID);
uniform vec4 idx_VertexID_offset;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[14]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[2]; } idx_uniforms1_vs;


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
	r0.x = intBitsToFloat(int((idx_VertexID - uint(idx_VertexID_offset.x))) + int(1));
	r0.x = uintBitsToFloat( uint(mod( floatBitsToUint(r0.x), uint(0x00000006) )) );
	r0.x = intBitsToFloat(floatBitsToUint(r0.x) < uint(0x00000003) ? int(0xffffffff) : int(0x00000000));
	r0.y = uintBitsToFloat(movc(floatBitsToUint(r0.x), uint(0x3f800000), uint(0xbf800000)));
	r0.z = uintBitsToFloat((idx_VertexID - uint(idx_VertexID_offset.x)) & uint(0x00000001));
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r0.z), uint(0x3f800000), uint(0xbf800000)));
	r0.z = v0.w + float(1.00000000f);
	r0.z = r0.z * float(3276.69995f);
	r0.z = min(r0.z, float(4.50000000f));
	r0.z = r0.z + float(1.50000000f);
	r1.xyz = v0.xyz * vec3(16384.0000f, 16384.0000f, 16384.0000f);
	r2 = r1.yyyy * idx_uniforms0_vs.cb0[1];
	r2 = fma(r1.xxxx, idx_uniforms0_vs.cb0[0], r2);
	r2 = fma(r1.zzzz, idx_uniforms0_vs.cb0[2], r2);
	r0.w = fma(r1.y, idx_uniforms0_vs.cb0[13].z, -idx_uniforms0_vs.cb0[13].x);
	r0.w = min(r0.w, idx_uniforms0_vs.cb0[13].y);
	r0.w = -r0.w + float(1.00000000f);
	r1 = r2 + idx_uniforms0_vs.cb0[3];
	r2.x = idx_uniforms1_vs.cb1[0].x / r1.w;
	r2.x = fma(r2.x, float(0.250000000f), float(1.00000000f));
	r2.x = r0.z * r2.x;
	r0.z = r0.z / r1.w;
	r0.z = fma(r0.z, float(0.0500000007f), r1.z);
	r2.y = max(r2.x, float(3.00000000f));
	r2.x = r2.y * idx_uniforms1_vs.cb1[0].y;
	r2.xy = r0.xy * r2.xy;
	o1.v.xy = fma(r0.xy, vec2(0.500000000f, 0.500000000f), vec2(0.500000000f, 0.500000000f));
	r0.xy = r1.ww * r2.xy;
	gl_Position.xy = fma(r0.xy, vec2(0.00138888892f, 0.00138888892f), r1.xy);
	r0.x = r1.w * float(-2.00000000f);
	gl_Position.w = r1.w;
	r1.xyz = fma(-v0.xyz, vec3(16384.0000f, 16384.0000f, 16384.0000f), idx_uniforms0_vs.cb0[9].xyz);
	r0.y = dot(r1.xyz, r1.xyz);
	r0.y = sqrt(r0.y);
	r1.x = intBitsToFloat(r0.y < idx_uniforms1_vs.cb1[0].z ? int(0xffffffff) : int(0x00000000));
	gl_Position.z = uintBitsToFloat(movc(floatBitsToUint(r1.x), floatBitsToUint(r0.x), floatBitsToUint(r0.z)));
	r0.x = saturate(r0.y * idx_uniforms0_vs.cb0[13].w);
	r0.x = fma(r0.x, r0.w, -idx_uniforms0_vs.cb0[12].x);
	o2.v.w = fma(r0.y, idx_uniforms0_vs.cb0[12].z, r0.x);
	r1.xyz = v0.xyz * vec3(16384.0000f, 16384.0000f, 16384.0000f);
	r1.w = idx_uniforms1_vs.cb1[1].z;
	r0.x = dot(r1, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.xzw = r0.xxx * vec3(1.00000000f, 0.713199973f, 1.28170002f);
	r0.xzw = fract(r0.xzw);
	r0.xzw = fma(-r0.xzw, r0.xzw, r0.xzw);
	r1.x = r0.y * float(0.000500000024f);
	r0.y = saturate(fma(r0.y, idx_uniforms1_vs.cb1[0].w, -idx_uniforms1_vs.cb1[0].z));
	r1.x = min(r1.x, float(1.00000000f));
	r1.y = v1.w + v1.w;
	r1.x = saturate(fma(r1.x, float(0.899999976f), r1.y));
	r0.xzw = r0.xzw * r1.xxx;
	r0.x = dot(r0.xzw, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.z = -r1.x + float(1.00000000f);
	r0.x = fma(r1.x, abs(r0.x), r0.z);
	r0.x = r0.x * r0.y;
	o2.v.xyz = r0.xxx * v1.xyz;
	VertexEpilog();
	return;
}

