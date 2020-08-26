#version 460 core
// ps_5_0
// Checksum: ba039db2_530ba230_2ffbf46e_59ee1ca3
// Name: box

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(vec2(-0.899999976f, -0.899999976f), v1.v.xz))));
	r1.xyz = intBitsToFloat(mix ( ivec3(0x00000000),ivec3(0xffffffff),bvec3(greaterThanEqual(v1.v.xzy, vec3(0.899999976f, 0.899999976f, 0.990000010f)))));
	r1.xyz = uintBitsToFloat(floatBitsToUint(r1.xzy) & uvec3(0x00000001, 0x3f800000, 0x00000001));
	r0.xy = intBitsToFloat(floatBitsToInt(r1.xz) + floatBitsToInt(r0.xy));
	r1.xz = vec2(floatBitsToInt(r0.xy));
	r0.x = dot(r1.xyz, r1.xyz);
	r0.x = inversesqrt(r0.x);
	r0.xyz = r0.xxx * r1.xyz;
	r0.w = fma(r0.y, float(0.500000000f), float(0.500000000f));
	r0.x = saturate(dot(r0.xyz, -idx_uniforms0_ps.cb0[3].xyz));
	r0.y = min(r0.w, float(1.00000000f));
	r1.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
	r0.yzw = fma(r0.yyy, r1.xyz, idx_uniforms0_ps.cb0[11].xyz);
	r0.xyz = fma(r0.xxx, idx_uniforms0_ps.cb0[2].xyz, r0.yzw);
	r1.x = uintBitsToFloat(uint(0x3f800000));
	r1.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r1 = r1 * -v2.v.zzzz;
	r1 = exp2(r1);
	r1 = min(r1, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = -r1.x + float(1.00000000f);
	r2.xyz = r0.www * idx_uniforms0_ps.cb0[13].xyz;
	o0.xyz = fma(r0.xyz, r1.yzw, r2.xyz);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

