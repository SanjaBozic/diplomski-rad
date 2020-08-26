#version 460 core
// vs_5_0
// Checksum: d3dd2074_99ed1b31_3a5c0110_09cc97a4
// Name: grass

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
layout(location = 2) in vec4 v2;
layout(location = 3) in vec4 v3;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[10]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[5]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[8]; } idx_uniforms2_vs;


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
	r0.xyz = v0.xyz + vec3(0.00000000f, -0.498039216f, 0.00000000f);
	r0.xyz = fma(r0.xyz, idx_uniforms2_vs.cb2[2].xyz, idx_uniforms1_vs.cb1[4].xyz);
	r1.x = fma(r0.y, float(4.00000000f), r0.z);
	r1.x = r1.x + idx_uniforms2_vs.cb2[1].x;
	r1.x = fma(v1.z, float(5.00000000f), r1.x);
	r1.x = sin(r1.x);
	r1.y = r1.x + float(-8.00000000f);
	r1.x = r1.x * idx_uniforms2_vs.cb2[1].y;
	r1.x = r1.x * v0.w;
	r1.y = r1.y * v1.w;
	r0.w = fma(r1.y, idx_uniforms2_vs.cb2[1].y, r0.z);
	r0.xyz = r0.xyw + -idx_uniforms0_vs.cb0[9].xyz;
	r1.yzw = r0.yyy * idx_uniforms2_vs.cb2[5].xyz;
	r1.yzw = fma(r0.xxx, idx_uniforms2_vs.cb2[4].xyz, r1.yzw);
	r1.yzw = fma(r0.zzz, idx_uniforms2_vs.cb2[6].xyz, r1.yzw);
	r1.yzw = r1.yzw + idx_uniforms2_vs.cb2[7].xyz;
	r1.yzw = r1.yzw / idx_uniforms2_vs.cb2[3].xyz;
	r0.w = dot(abs(r1.yzw), abs(r1.yzw));
	r0.w = r0.w + float(-0.899999976f);
	r0.w = saturate(r0.w * float(10.0000000f));
	r0.w = max(r0.w, float(0.200000003f));
	r1.y = v2.w + float(-0.498039216f);
	r1.z = -idx_uniforms0_vs.cb0[9].y + idx_uniforms1_vs.cb1[4].y;
	r1.y = fma(r1.y, idx_uniforms2_vs.cb2[2].y, r1.z);
	r1.z = r0.y + -r1.y;
	r0.w = fma(r0.w, r1.z, r1.y);
	r2 = r0.wwww * idx_uniforms1_vs.cb1[1];
	r2 = fma(r0.xxxx, idx_uniforms1_vs.cb1[0], r2);
	r2 = fma(r0.zzzz, idx_uniforms1_vs.cb1[2], r2);
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = sqrt(r0.x);
	r2 = r2 + idx_uniforms1_vs.cb1[3];
	r0.y = r2.w * float(10000.0000f);
	r0.z = fma(-v1.z, float(50.0000000f), r0.x);
	r0.x = fma(r0.x, idx_uniforms2_vs.cb2[0].y, idx_uniforms2_vs.cb2[0].x);
	r0.z = saturate(r0.z * float(0.100000001f));
	r0.x = max(r0.z, r0.x);
	r0.x = -r0.x + float(1.00000000f);
	r0.x = max(r0.x, float(0.00000000f));
	r0.z = intBitsToFloat(r0.x < float(0.0313725509f) ? int(0xffffffff) : int(0x00000000));
	o2.v.w = r0.x * float(4.00000000f);
	gl_Position.z = uintBitsToFloat(movc(floatBitsToUint(r0.z), floatBitsToUint(r0.y), floatBitsToUint(r2.z)));
	gl_Position.xyw = r2.xyw;
	o1.v.xy = v1.xy;
	r0.x = fma(v2.x, float(2.00000000f), float(-1.00000000f));
	r0.x = fma(r1.x, float(0.0500000007f), r0.x);
	r0.yz = fma(v2.yz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	o2.v.xyz = r0.www * r0.xyz;
	r0.xyz = fma(v3.xyz, vec3(0.610612035f, 0.610612035f, 0.610612035f), vec3(0.682171106f, 0.682171106f, 0.682171106f));
	r1.xyz = v3.xyz + v3.xyz;
	r0.xyz = fma(r1.xyz, r0.xyz, vec3(0.0125228781f, 0.0125228781f, 0.0125228781f));
	o3.v.xyz = r0.xyz * r1.xyz;
	VertexEpilog();
	return;
}

