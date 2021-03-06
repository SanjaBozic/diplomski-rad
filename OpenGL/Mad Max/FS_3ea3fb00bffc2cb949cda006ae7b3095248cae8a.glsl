#version 460 core
// ps_5_0
// Checksum: 69000050_134ad8c8_96a89e39_9f181519
// Name: fogvolumeapplynoisecloudshadowsnear

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[22]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler3D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2DArrayShadow resourceSamplerPair_3_ps; // res14, s14


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
	r0.xyz = r0.xyz + -idx_uniforms0_ps.cb0[4].xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r1.x = sqrt(r0.w);
	r1.x = max(r1.x, float(9.99999975e-05f));
	r1.yzw = r0.xyz / r1.xxx;
	r2.x = saturate(r1.z);
	r2.x = r2.x * r2.x;
	r2.x = fma(r2.x, idx_uniforms1_ps.cb1[16].w, float(1.00000000f));
	r1.x = r1.x * float(0.0250000004f);
	r1.x = min(r1.x, idx_uniforms1_ps.cb1[16].z);
	r1.yzw = r1.xxx * r1.yzw;
	r2.y = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r2.y = fract(r2.y);
	r3.xyz = r1.yzw * r2.yyy;
	r2.yzw = fma(r2.yyy, r1.yzw, idx_uniforms0_ps.cb0[4].xyz);
	r4.xyz = r1.zzz * idx_uniforms1_ps.cb1[5].xyz;
	r4.xyz = fma(r1.yyy, idx_uniforms1_ps.cb1[4].xyz, r4.xyz);
	r4.xyz = fma(r1.www, idx_uniforms1_ps.cb1[6].xyz, r4.xyz);
	r5.xyz = r3.yyy * idx_uniforms1_ps.cb1[5].xyz;
	r5.xyz = fma(r3.xxx, idx_uniforms1_ps.cb1[4].xyz, r5.xyz);
	r5.xyz = fma(r3.zzz, idx_uniforms1_ps.cb1[6].xyz, r5.xyz);
	r5.xyz = r5.xyz + idx_uniforms1_ps.cb1[7].xyz;
	r6.xyz = r1.zzz * idx_uniforms1_ps.cb1[9].xyz;
	r6.xyz = fma(r1.yyy, idx_uniforms1_ps.cb1[8].xyz, r6.xyz);
	r6.xyz = fma(r1.www, idx_uniforms1_ps.cb1[10].xyz, r6.xyz);
	r7.xyz = r3.yyy * idx_uniforms1_ps.cb1[9].xyz;
	r3.xyw = fma(r3.xxx, idx_uniforms1_ps.cb1[8].xyz, r7.xyz);
	r3.xyz = fma(r3.zzz, idx_uniforms1_ps.cb1[10].xyz, r3.xyw);
	r3.xyz = r3.xyz + idx_uniforms1_ps.cb1[11].xyz;
	r7.xyz = r2.yzw + idx_uniforms1_ps.cb1[20].xyz;
	r7.xyz = r7.xyz * idx_uniforms1_ps.cb1[17].xyz;
	r2.yw = r2.yw + idx_uniforms1_ps.cb1[21].yz;
	r2.yzw = r2.yzw * idx_uniforms1_ps.cb1[21].www;
	r8.xyz = r7.xyz;
	r9.xyz = r2.yzw;
	r10.xyz = r5.xyz;
	r11.xyz = r3.xyz;
	r12.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r3.w = uintBitsToFloat(uint(0x00000000));
	while (true)
	{
		r4.w = intBitsToFloat(floatBitsToInt(r3.w) >= int(40) ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r4.w) != uint(0))
			break;
		r4.w = ((texture(resourceSamplerPair_1_ps, r8.xyz)).yzwx).w;
		r13.y = fma(-r4.w, idx_uniforms1_ps.cb1[17].w, float(1.00000000f));
		r8.xyz = fma(r1.yzw, idx_uniforms1_ps.cb1[17].xyz, r8.xyz);
		r14.x = r9.y * idx_uniforms0_ps.cb0[1].w;
		r14.y = r9.y * idx_uniforms0_ps.cb0[3].w;
		r12.zw = r9.xz + -r14.xy;
		r4.w = ((texture(resourceSamplerPair_2_ps, r12.zw)).yzwx).w;
		r4.w = saturate(r4.w + idx_uniforms1_ps.cb1[21].x);
		r12.zw = fma(r10.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r5.w = max(abs(r12.w), abs(r12.z));
		r5.w = intBitsToFloat(r5.w < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
		r14.xyz = uintBitsToFloat(movc(floatBitsToUint(r5.www), floatBitsToUint(r10.zxy), floatBitsToUint(r11.zxy)));
		r14.w = uintBitsToFloat(movc(floatBitsToUint(r5.w), uint(0x3f800000), uint(0x40000000)));
		r14.x = saturate(r14.x);
		r5.w = texture(resourceSamplerPair_3_ps, vec4(r14.yzw, r14.x));
		r5.w = r13.y * r5.w;
		r13.x = r4.w * r5.w;
		r12.xy = r12.xy + r13.xy;
		r9.xyz = fma(r1.yzw, idx_uniforms1_ps.cb1[21].www, r9.xyz);
		r10.xyz = r4.xyz + r10.xyz;
		r11.xyz = r6.xyz + r11.xyz;
		r3.w = intBitsToFloat(floatBitsToInt(r3.w) + int(1));
	}
	r1.y = fma(idx_uniforms1_ps.cb1[17].w, idx_uniforms1_ps.cb1[17].w, float(1.00000000f));
	r1.yz = r1.yy * r12.xy;
	r1.yz = r1.yz * vec2(0.200000003f, 0.0250000004f);
	r1.x = r1.x / idx_uniforms1_ps.cb1[16].z;
	r1.xy = r1.xx * r1.yz;
	r1.xy = r1.xy / r2.xx;
	r0.w = inversesqrt(r0.w);
	r0.xyz = r0.www * r0.xyz;
	r0.x = dot(r0.xyz, -idx_uniforms0_ps.cb0[3].xyz);
	r0.x = r0.x + float(1.00000000f);
	r0.x = r0.x * float(0.500000000f);
	r0.y = idx_uniforms1_ps.cb1[16].y * idx_uniforms1_ps.cb1[16].y;
	r0.y = fma(r0.y, float(25.0000000f), float(0.00100000005f));
	r0.x = log2(r0.x);
	r0.x = r0.x * r0.y;
	r0.x = exp2(r0.x);
	r0.x = r0.x + float(-1.00000000f);
	r0.x = fma(idx_uniforms1_ps.cb1[16].y, r0.x, float(1.00000000f));
	r0.y = r0.x * r1.x;
	o0.z = uintBitsToFloat(uint(0x00000000));
	r0.x = fma(r1.x, r0.x, float(-1.00000000f));
	o0.w = saturate(r0.x * float(0.125000000f));
	o0.y = r1.y;
	o0.x = r0.y;
	return;
}

