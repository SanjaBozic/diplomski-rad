#version 460 core
// vs_5_0
// Checksum: 7fa07ce0_c33d50e3_82a31d29_a13cdb6f
// Name: foggradientshader

layout(location = 0) in vec4 v0;
// gl_Position
layout(location = 1) out idx_Varying1 { vec4 v; } o1;
layout(location = 2) out idx_Varying2 { vec4 v; } o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_vs0 { vec4 cb0[9]; } idx_uniforms0_vs;

layout (std140) uniform cb_vs1 { vec4 cb1[5]; } idx_uniforms1_vs;


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
	r0.x = intBitsToFloat(float(0.00000000f) < v0.y ? int(0xffffffff) : int(0x00000000));
	r1.y = float(-200.000000f) / idx_uniforms1_vs.cb1[4].y;
	r2.y = uintBitsToFloat(uint(0x3f800000));
	r1.x = v0.y * float(200.000000f);
	r2.xzw = v0.yxz * idx_uniforms1_vs.cb1[4].yxz;
	r2.xy = uintBitsToFloat(movc(floatBitsToUint(r0.xx), floatBitsToUint(r2.xy), floatBitsToUint(r1.xy)));
	r0.xyz = r2.xxx * idx_uniforms1_vs.cb1[1].xyw;
	r0.xyz = fma(r2.zzz, idx_uniforms1_vs.cb1[0].xyw, r0.xyz);
	r0.xyz = fma(r2.www, idx_uniforms1_vs.cb1[2].xyw, r0.xyz);
	o2.v.xyz = r2.zxw;
	o1.v.y = r2.y;
	gl_Position.xyw = r0.xyz + idx_uniforms1_vs.cb1[3].xyw;
	gl_Position.z = uintBitsToFloat(uint(0x00000000));
	r0.x = dot(-idx_uniforms0_vs.cb0[8].xz, -idx_uniforms0_vs.cb0[8].xz);
	r0.x = inversesqrt(r0.x);
	o1.v.zw = r0.xx * -idx_uniforms0_vs.cb0[8].xz;
	o1.v.x = v0.w;
	VertexEpilog();
	return;
}

