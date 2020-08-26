#version 460 core
// ps_5_0
// Checksum: 4c2d2455_ed76b452_152428fb_0b414707
// Name: deferred_spotlightsh

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[15]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[5]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s0

uniform sampler2D resourceSamplerPair_2_ps; // res2, s1

uniform sampler2D resourceSamplerPair_3_ps; // res3, s0

uniform sampler2D resourceSamplerPair_4_ps; // res13, s15

uniform sampler2DShadow resourceSamplerPair_5_ps; // res13, s14


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
	r0.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.zw = r0.xy * idx_uniforms1_ps.cb1[13].zw;
	r1.x = ((texture(resourceSamplerPair_0_ps, r0.zw))).x;
	r1.y = fma(r1.x, idx_uniforms2_ps.cb2[0].x, idx_uniforms2_ps.cb2[0].y);
	r1.y = float(1.00000000f) / r1.y;
	r1.yzw = fma(-r1.yyy, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
	r2.x = dot(r1.yzw, r1.yzw);
	r2.y = sqrt(r2.x);
	r2.z = saturate(fma(r2.y, idx_uniforms1_ps.cb1[3].x, idx_uniforms1_ps.cb1[0].w));
	r2.z = r2.z + float(-1.00000000f);
	r2.z = fma(-r2.z, r2.z, float(1.00000000f));
	r2.z = sqrt(r2.z);
	r2.z = -r2.z + float(1.00000000f);
	r3.xyz = ((texture(resourceSamplerPair_1_ps, r0.zw))).xyz;
	r4.xyz = ((texture(resourceSamplerPair_2_ps, r0.zw))).xyz;
	r4.xyz = fma(r4.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r5.xyz = ((texture(resourceSamplerPair_3_ps, r0.zw)).wxzy).xyz;
	r0.z = dot(r4.xyz, r4.xyz);
	r0.z = inversesqrt(r0.z);
	r4.xyz = r0.zzz * r4.xyz;
	r0.z = intBitsToFloat(r5.y < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
	r6.x = r5.y + r5.y;
	r6.zw = r5.yz + vec2(-0.501960814f, -0.500000000f);
	r7.xy = saturate(r6.zw + r6.zw);
	r6.y = uintBitsToFloat(uint(0x00000000));
	r7.z = uintBitsToFloat(uint(0x00000000));
	r0.zw = saturate(uintBitsToFloat(movc(floatBitsToUint(r0.zz), floatBitsToUint(r6.xy), floatBitsToUint(r7.zx))));
	r2.w = fma(r7.y, idx_uniforms2_ps.cb2[2].y, float(9.99999975e-05f));
	r3.w = dot(-v2.v.xyz, -v2.v.xyz);
	r3.w = inversesqrt(r3.w);
	r6.xyz = r3.www * -v2.v.xyz;
	r2.x = inversesqrt(r2.x);
	r1.yzw = r1.yzw * r2.xxx;
	r2.x = saturate(dot(r6.xyz, r4.xyz));
	r3.w = -r5.z + float(0.500000000f);
	r3.w = saturate(r3.w + r3.w);
	r3.w = r3.w * r3.w;
	r3.w = r3.w * r3.w;
	r4.w = r3.w * idx_uniforms2_ps.cb2[2].x;
	r5.z = dot(r4.xyz, r1.yzw);
	r5.w = fma(r3.w, idx_uniforms2_ps.cb2[2].x, r5.z);
	r3.w = fma(r3.w, idx_uniforms2_ps.cb2[2].x, float(1.00000000f));
	r3.w = saturate(r5.w / r3.w);
	r4.w = saturate(r4.w);
	r5.w = r3.w + float(-1.00000000f);
	r4.w = fma(r4.w, r5.w, float(1.00000000f));
	r3.w = r3.w * r4.w;
	r2.x = fma(r3.w, r2.x, float(9.99999975e-05f));
	r2.x = log2(r2.x);
	r2.x = r2.x * r2.w;
	r2.x = exp2(r2.x);
	r2.x = r3.w * r2.x;
	r2.x = min(r2.x, float(1.00000000f));
	r2.w = r0.w * float(2.50000000f);
	r3.w = saturate(fma(r0.z, float(0.500000000f), -r5.z));
	r0.z = fma(r3.w, r0.z, r2.x);
	r0.z = min(r0.z, float(1.00000000f));
	r1.y = dot(-r1.yzw, idx_uniforms1_ps.cb1[2].xyz);
	r1.y = saturate(fma(r1.y, idx_uniforms1_ps.cb1[1].w, idx_uniforms1_ps.cb1[2].w));
	r1.z = saturate(fma(r2.y, idx_uniforms1_ps.cb1[13].y, -idx_uniforms1_ps.cb1[13].x));
	r1.y = r1.z * r1.y;
	r1.y = r1.y * r1.y;
	r6 = fma(idx_uniforms1_ps.cb1[9], r0.xxxx, idx_uniforms1_ps.cb1[12]);
	r6 = fma(idx_uniforms1_ps.cb1[10], r0.yyyy, r6);
	r6 = fma(idx_uniforms1_ps.cb1[11], r1.xxxx, r6);
	r1.xzw = r6.xyz / r6.www;
	r0.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r0.x = fract(r0.x);
	r2.x = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
	r0.y = fract(r2.x);
	r0.xy = r0.xy + vec2(-0.500000000f, -0.500000000f);
	r6.xy = r0.xy * vec2(0.000976562500f, 0.000976562500f);
	r8 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r1.xzxz);
	r2.xy = fma(r0.xy, vec2(0.000976562500f, 0.000976562500f), r8.xy);
	r5.zw = fma(-r0.xy, vec2(0.000976562500f, 0.000976562500f), r8.zw);
	r8 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r1.xzxz);
	r6.z = -1.f * r6.x;
	r6.xw = r6.yz + r8.xy;
	r7.xz = -r6.yz + r8.zw;
	r8 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(1.50000000f, 0.500000000f, -0.500000000f, 1.50000000f), r1.xzxz);
	r8.xy = -r6.yz + r8.xy;
	r6.yz = r6.yz + r8.zw;
	r9 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(-1.50000000f, -0.500000000f, 0.500000000f, -1.50000000f), r1.xzxz);
	r1.xz = fma(r0.xy, vec2(0.000976562500f, 0.000976562500f), r9.xy);
	r0.xy = fma(-r0.xy, vec2(0.000976562500f, 0.000976562500f), r9.zw);
	r3.w = intBitsToFloat(float(0.00000000f) < r0.w ? int(0xffffffff) : int(0x00000000));
	r4.w = ((texture(resourceSamplerPair_4_ps, r2.xy)).yzwx).w;
	r7.w = ((texture(resourceSamplerPair_4_ps, r5.zw)).yzwx).w;
	r8.z = ((texture(resourceSamplerPair_4_ps, r6.xw)).yzxw).z;
	r8.w = ((texture(resourceSamplerPair_4_ps, r7.xz)).yzwx).w;
	r9.x = ((texture(resourceSamplerPair_4_ps, r8.xy))).x;
	r9.y = ((texture(resourceSamplerPair_4_ps, r6.yz)).yxzw).y;
	r9.z = ((texture(resourceSamplerPair_4_ps, r1.xz)).yzxw).z;
	r9.w = ((texture(resourceSamplerPair_4_ps, r0.xy)).yzwx).w;
	if (floatBitsToUint(r3.w) != uint(0))
	{
		r0.w = fma(r0.w, float(0.300000012f), float(0.0500000007f));
		r0.w = float(1.00000000f) / r0.w;
		r10.x = fma(r1.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r10.x = float(1.00000000f) / r10.x;
		r4.w = fma(r4.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r4.w = float(1.00000000f) / r4.w;
		r4.w = -r4.w + r10.x;
		r4.w = saturate(r0.w * r4.w);
		r4.w = -r4.w + float(1.00000000f);
		r7.w = fma(r7.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r7.w = float(1.00000000f) / r7.w;
		r7.w = -r7.w + r10.x;
		r7.w = saturate(r0.w * r7.w);
		r4.w = r4.w + -r7.w;
		r4.w = r4.w + float(1.00000000f);
		r7.w = fma(r8.z, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r7.w = float(1.00000000f) / r7.w;
		r7.w = -r7.w + r10.x;
		r7.w = saturate(r0.w * r7.w);
		r4.w = r4.w + -r7.w;
		r4.w = r4.w + float(1.00000000f);
		r7.w = fma(r8.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r7.w = float(1.00000000f) / r7.w;
		r7.w = -r7.w + r10.x;
		r7.w = saturate(r0.w * r7.w);
		r4.w = r4.w + -r7.w;
		r4.w = r4.w + float(1.00000000f);
		r7.w = fma(r9.x, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r7.w = float(1.00000000f) / r7.w;
		r7.w = -r7.w + r10.x;
		r7.w = saturate(r0.w * r7.w);
		r4.w = r4.w + -r7.w;
		r4.w = r4.w + float(1.00000000f);
		r7.w = fma(r9.y, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r7.w = float(1.00000000f) / r7.w;
		r7.w = -r7.w + r10.x;
		r7.w = saturate(r0.w * r7.w);
		r4.w = r4.w + -r7.w;
		r4.w = r4.w + float(1.00000000f);
		r7.w = fma(r9.z, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r7.w = float(1.00000000f) / r7.w;
		r7.w = -r7.w + r10.x;
		r7.w = saturate(r0.w * r7.w);
		r4.w = r4.w + -r7.w;
		r4.w = r4.w + float(1.00000000f);
		r7.w = fma(r9.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r7.w = float(1.00000000f) / r7.w;
		r7.w = -r7.w + r10.x;
		r0.w = saturate(r0.w * r7.w);
		r0.w = -r0.w + r4.w;
		r0.w = r0.w + float(1.00000000f);
		r0.w = r0.w * float(0.125000000f);
		r0.w = r0.w * r0.w;
		r0.w = r0.w * r0.w;
	}
	else
	{
		r2.x = textureLod(resourceSamplerPair_5_ps, vec3(r2.xy, r1.w), float(0));
		r2.y = textureLod(resourceSamplerPair_5_ps, vec3(r5.zw, r1.w), float(0));
		r2.x = r2.y + r2.x;
		r2.y = textureLod(resourceSamplerPair_5_ps, vec3(r6.xw, r1.w), float(0));
		r2.x = r2.y + r2.x;
		r2.y = textureLod(resourceSamplerPair_5_ps, vec3(r7.xz, r1.w), float(0));
		r2.x = r2.y + r2.x;
		r2.y = textureLod(resourceSamplerPair_5_ps, vec3(r8.xy, r1.w), float(0));
		r2.x = r2.y + r2.x;
		r2.y = textureLod(resourceSamplerPair_5_ps, vec3(r6.yz, r1.w), float(0));
		r2.x = r2.y + r2.x;
		r1.x = textureLod(resourceSamplerPair_5_ps, vec3(r1.xz, r1.w), float(0));
		r1.x = r1.x + r2.x;
		r0.x = textureLod(resourceSamplerPair_5_ps, vec3(r0.xy, r1.w), float(0));
		r0.x = r0.x + r1.x;
		r0.w = r0.x * float(0.125000000f);
	}
	r0.x = -r0.w + float(1.00000000f);
	r0.x = fma(-idx_uniforms1_ps.cb1[3].w, r0.x, float(1.00000000f));
	r0.x = r0.x * r1.y;
	r0.y = r0.x * r2.z;
	r0.w = saturate(r5.x + idx_uniforms2_ps.cb2[3].z);
	r0.w = r0.w + -idx_uniforms2_ps.cb2[3].z;
	r1.x = -idx_uniforms2_ps.cb2[3].z + float(1.00000000f);
	r5.y = r0.w / r1.x;
	r1.xy = fma(r5.xy, idx_uniforms2_ps.cb2[3].xw, idx_uniforms2_ps.cb2[4].xw);
	r0.yz = r0.yz * r1.xy;
	r0.w = idx_uniforms1_ps.cb1[3].w + float(-0.750000000f);
	r0.w = saturate(r0.w * float(4.00000000f));
	r0.w = r0.w * idx_uniforms1_ps.cb1[4].w;
	r1.x = dot(r4.xyz, -idx_uniforms1_ps.cb1[2].xyz);
	r1.z = r1.x + float(0.600000024f);
	r1.z = saturate(r1.z * float(0.625000000f));
	r1.z = r1.z * r1.z;
	r1.z = r0.x * r1.z;
	r1.w = saturate(r1.z * float(3.00000000f));
	r4.xyz = fma(r1.www, vec3(0.100000001f, 0.790000021f, 0.939999998f), vec3(0.899999976f, 0.209999993f, 0.0599999987f));
	r4.xyz = r1.yyy * r4.xyz;
	r1.x = -r1.x + float(0.150000006f);
	r1.x = saturate(r1.x + r1.x);
	r1.x = r0.x * r1.x;
	r5.xyz = r1.xxx * vec3(0.200000003f, 0.0460000001f, 0.00999999978f);
	r1.x = min(r2.w, float(1.00000000f));
	r2.xyw = r1.xxx * r5.xyz;
	r2.xyw = r0.www * r2.xyw;
	r1.xzw = fma(r4.xyz, r1.zzz, r2.xyw);
	r1.xzw = r1.xzw * r2.zzz;
	r0.z = r0.z * r2.z;
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), uint(0x3f800000), floatBitsToUint(r0.x)));
	r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r3.www), floatBitsToUint(r1.xzw), floatBitsToUint(r0.zzz)));
	r0.z = -r7.y + float(1.00000000f);
	r2.xyz = r0.xxx * idx_uniforms1_ps.cb1[1].xyz;
	r1.xyz = r1.xyz * idx_uniforms1_ps.cb1[4].zzz;
	r1.xyz = r3.xyz * r1.xyz;
	r1.xyz = r0.zzz * r1.xyz;
	r0.xyw = r0.yyy * idx_uniforms1_ps.cb1[14].xyz;
	r0.xyw = r3.xyz * r0.xyw;
	r0.xyz = r0.zzz * r0.xyw;
	o0.xyz = fma(r2.xyz, r1.xyz, r0.xyz);
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

