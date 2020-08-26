#version 460 core
// vs_5_0
// Checksum: e0784c23_14a0110c_6cc41e57_c09103c3
// Name: distortionparticle

layout(location = 0) in uvec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
layout(location = 3) out idx_Varying3 { vec4 v; } o3;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[10]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[4096]; } idx_uniforms1_vs;

layout (std140) uniform cb_vs2 { vec4 cb2[4096]; } idx_uniforms2_vs;

layout (std140) uniform cb_vs3 { vec4 cb3[6]; } idx_uniforms3_vs;


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
	r0.x = float(int(v0.y));
	r0.yz = intBitsToFloat(ivec2(v0.xx) * ivec2(3, 3) + ivec2(2, 1));
	r0.w = roundEven(idx_uniforms1_vs.cb1[floatBitsToInt(r0.y)].x);
	r0.x = fma(r0.w, float(2.00000000f), r0.x);
	r0.x = uintBitsToFloat(uint(r0.x));
	r1.xy = uintBitsToFloat(movc(v0.zz, floatBitsToUint(idx_uniforms2_vs.cb2[floatBitsToInt(r0.x)].zw), floatBitsToUint(idx_uniforms2_vs.cb2[floatBitsToInt(r0.x)].xy)));
	r0.x = uintBitsToFloat(movc(v0.w, floatBitsToUint(r1.y), floatBitsToUint(r1.x)));
	r1.x = trunc(r0.x);
	r1.y = fract(r0.x);
	r1 = fma(r1.xyxy, vec4(0.000977039570f, 2.00097704f, 0.00195407914f, 4.00195408f), vec4(-0.500000000f, -0.500000000f, -2.00000000f, -2.00000000f));
	r2.y = r1.w * idx_uniforms1_vs.cb1[floatBitsToInt(r0.y)].w;
	r0.x = intBitsToFloat(int(v0.x) * int(3));
	r2.x = r1.z * idx_uniforms1_vs.cb1[floatBitsToInt(r0.x)].w;
	{ float src = idx_uniforms1_vs.cb1[floatBitsToInt(r0.y)].y; r3.x = sin(src); r4.x = cos(src); }
	r1.zw = r2.xy * r4.xx;
	r4.y = fma(r2.x, r3.x, -r1.w);
	r4.x = fma(r2.y, r3.x, r1.z);
	r4.z = uintBitsToFloat(uint(0x3f800000));
	r2.x = dot(idx_uniforms3_vs.cb3[0].xyw, r4.xyz);
	r2.y = dot(idx_uniforms3_vs.cb3[1].xyw, r4.xyz);
	r2.z = dot(idx_uniforms3_vs.cb3[2].xyw, r4.xyz);
	r0.y = dot(idx_uniforms3_vs.cb3[3].xyw, r4.xyz);
	r2.xyz = r2.xyz + idx_uniforms1_vs.cb1[floatBitsToInt(r0.x)].xyz;
	r3.xyz = idx_uniforms0_vs.cb0[9].xyz + -idx_uniforms1_vs.cb1[floatBitsToInt(r0.x)].xyz;
	r0.x = dot(r3.xyz, r3.xyz);
	r0.x = sqrt(r0.x);
	r0.x = saturate(fma(r0.x, idx_uniforms3_vs.cb3[4].w, -idx_uniforms3_vs.cb3[4].z));
	r0.x = r0.x * idx_uniforms1_vs.cb1[floatBitsToInt(r0.z)].w;
	o3.v.xyz = idx_uniforms1_vs.cb1[floatBitsToInt(r0.z)].xyz;
	r3 = r2.yyyy * idx_uniforms0_vs.cb0[1];
	r3 = fma(r2.xxxx, idx_uniforms0_vs.cb0[0], r3);
	r2 = fma(r2.zzzz, idx_uniforms0_vs.cb0[2], r3);
	r2 = fma(r0.yyyy, idx_uniforms0_vs.cb0[3], r2);
	r0.y = intBitsToFloat(r0.x < float(0.00999999978f) ? int(0xffffffff) : int(0x00000000));
	o3.v.w = r0.x;
	gl_Position = uintBitsToFloat(movc(floatBitsToUint(r0.yyyy), uvec4(0xbf800000, 0xbf800000, 0xbf800000, 0x3f800000), floatBitsToUint(r2)));
	r0.x = r0.w * idx_uniforms3_vs.cb3[4].x;
	r0.x = fract(r0.x);
	r0.z = fma(r0.w, idx_uniforms3_vs.cb3[4].x, -r0.x);
	r0.y = r0.z * idx_uniforms3_vs.cb3[4].y;
	o1.v.xy = fma(idx_uniforms3_vs.cb3[4].xy, r1.xy, r0.xy);
	o1.v.z = idx_uniforms3_vs.cb3[5].x;
	r0.xyz = r2.xyw * vec3(0.500000000f, -0.500000000f, 0.500000000f);
	o2.v.zw = r2.zw;
	o2.v.xy = r0.zz + r0.xy;
	VertexEpilog();
	return;
}

