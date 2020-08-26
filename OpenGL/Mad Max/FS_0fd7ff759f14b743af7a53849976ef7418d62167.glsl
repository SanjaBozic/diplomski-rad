#version 460 core
// ps_5_0
// Checksum: 6aac687e_e7a11f63_276ca376_965f999b
// Name: fogvolumeapply

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[17]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2DArrayShadow resourceSamplerPair_1_ps; // res14, s14


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

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v1.v.zw * v1.v.xy;
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy))).x;
	r1 = v1.v.yyyy * idx_uniforms1_ps.cb1[13];
	r1 = fma(v1.v.xxxx, idx_uniforms1_ps.cb1[12], r1);
	r0 = fma(r0.xxxx, idx_uniforms1_ps.cb1[14], r1);
	r0 = r0 + idx_uniforms1_ps.cb1[15];
	r0.xyz = r0.xyz / r0.www;
	r1.xyz = r0.xyz + -idx_uniforms0_ps.cb0[4].xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r1.w = sqrt(r0.w);
	r1.w = max(r1.w, float(9.99999975e-05f));
	r2.xyz = -r1.xyz / r1.www;
	r2.w = r1.w * float(0.0250000004f);
	r2.w = min(r2.w, idx_uniforms1_ps.cb1[16].z);
	r3.x = saturate(-1.f * r2.y);
	r3.x = r3.x * r3.x;
	r3.x = fma(r3.x, idx_uniforms1_ps.cb1[16].w, float(1.00000000f));
	r2.xyz = r2.www * r2.xyz;
	r1.w = r1.w / r2.w;
	r3.y = intBitsToFloat(int(r1.w));
	r3.y = intBitsToFloat(min(floatBitsToInt(r3.y), int(40)));
	r3.z = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r3.z = fract(r3.z);
	r3.y = float(floatBitsToInt(r3.y));
	r1.w = r1.w + -r3.y;
	r0.xyz = fma(r2.xyz, r1.www, r0.xyz);
	r0.xyz = fma(r3.zzz, r2.xyz, r0.xyz);
	r3.yzw = r2.yyy * idx_uniforms1_ps.cb1[5].xyz;
	r3.yzw = fma(r2.xxx, idx_uniforms1_ps.cb1[4].xyz, r3.yzw);
	r3.yzw = fma(r2.zzz, idx_uniforms1_ps.cb1[6].xyz, r3.yzw);
	r0.xyz = r0.xyz + -idx_uniforms0_ps.cb0[4].xyz;
	r4.xyz = r0.yyy * idx_uniforms1_ps.cb1[5].xyz;
	r4.xyz = fma(r0.xxx, idx_uniforms1_ps.cb1[4].xyz, r4.xyz);
	r4.xyz = fma(r0.zzz, idx_uniforms1_ps.cb1[6].xyz, r4.xyz);
	r4.xyz = r4.xyz + idx_uniforms1_ps.cb1[7].xyz;
	r5.xyz = r2.yyy * idx_uniforms1_ps.cb1[9].xyz;
	r5.xyz = fma(r2.xxx, idx_uniforms1_ps.cb1[8].xyz, r5.xyz);
	r2.xyz = fma(r2.zzz, idx_uniforms1_ps.cb1[10].xyz, r5.xyz);
	r5.xyz = r0.yyy * idx_uniforms1_ps.cb1[9].xyz;
	r5.xyz = fma(r0.xxx, idx_uniforms1_ps.cb1[8].xyz, r5.xyz);
	r0.xyz = fma(r0.zzz, idx_uniforms1_ps.cb1[10].xyz, r5.xyz);
	r0.xyz = r0.xyz + idx_uniforms1_ps.cb1[11].xyz;
	r5.xyz = r4.xyz;
	r6.xyz = r0.xyz;
	r1.w = uintBitsToFloat(uint(0x00000000));
	r4.w = uintBitsToFloat(uint(0x00000000));
	while (true)
	{
		r5.w = intBitsToFloat(floatBitsToInt(r4.w) >= int(40) ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r5.w) != uint(0))
			break;
		r7.xy = fma(r5.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r5.w = max(abs(r7.y), abs(r7.x));
		r5.w = intBitsToFloat(r5.w < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
		r7.xyz = uintBitsToFloat(movc(floatBitsToUint(r5.www), floatBitsToUint(r5.zxy), floatBitsToUint(r6.zxy)));
		r7.w = uintBitsToFloat(movc(floatBitsToUint(r5.w), uint(0x3f800000), uint(0x40000000)));
		r7.x = saturate(r7.x);
		r5.w = texture(resourceSamplerPair_1_ps, vec4(r7.yzw, r7.x));
		r1.w = r1.w + r5.w;
		r5.xyz = r3.yzw + r5.xyz;
		r6.xyz = r2.xyz + r6.xyz;
		r4.w = intBitsToFloat(floatBitsToInt(r4.w) + int(1));
	}
	r0.x = r1.w * float(0.200000003f);
	r0.y = uintBitsToFloat(uint(0x3f800000));
	r0.z = r2.w / idx_uniforms1_ps.cb1[16].z;
	r0.xy = r0.zz * r0.xy;
	r0.xy = r0.xy / r3.xx;
	r0.z = inversesqrt(r0.w);
	r1.xyz = r0.zzz * r1.xyz;
	r0.z = dot(r1.xyz, -idx_uniforms0_ps.cb0[3].xyz);
	r0.z = r0.z + float(1.00000000f);
	r0.z = r0.z * float(0.500000000f);
	r0.w = idx_uniforms1_ps.cb1[16].y * idx_uniforms1_ps.cb1[16].y;
	r0.w = fma(r0.w, float(25.0000000f), float(0.00100000005f));
	r0.z = log2(r0.z);
	r0.z = r0.z * r0.w;
	r0.z = exp2(r0.z);
	r0.z = r0.z + float(-1.00000000f);
	r0.z = fma(idx_uniforms1_ps.cb1[16].y, r0.z, float(1.00000000f));
	r0.w = r0.z * r0.x;
	o0.z = uintBitsToFloat(uint(0x00000000));
	r0.x = fma(r0.x, r0.z, float(-1.00000000f));
	o0.w = saturate(r0.x * float(0.125000000f));
	o0.xy = r0.wy;
	return;
}
