#version 460 core
// ps_5_0
// Checksum: 7a16b2d6_9ceba792_cc3d4378_15789d75
// Name: deferred_spotlightspndsh

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
	r5 = (texture(resourceSamplerPair_3_ps, r0.zw)).wxyz;
	r0.z = dot(r4.xyz, r4.xyz);
	r0.z = inversesqrt(r0.z);
	r4.xyz = r0.zzz * r4.xyz;
	r0.z = intBitsToFloat(r5.y < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
	r6.xy = r5.yw + vec2(-0.501960814f, -0.500000000f);
	r6.xy = saturate(r6.xy + r6.xy);
	r0.z = uintBitsToFloat(movc(floatBitsToUint(r0.z), uint(0x00000000), floatBitsToUint(r6.x)));
	r0.w = fma(r5.z, float(8.00000000f), float(1.00000000f));
	r0.w = exp2(r0.w);
	r2.w = dot(-v2.v.xyz, -v2.v.xyz);
	r2.w = inversesqrt(r2.w);
	r6.xzw = r2.www * -v2.v.xyz;
	r2.x = inversesqrt(r2.x);
	r1.yzw = r1.yzw * r2.xxx;
	r2.x = saturate(dot(r6.xzw, r4.xyz));
	r6.xzw = fma(-v2.v.xyz, r2.www, r1.yzw);
	r2.w = dot(r6.xzw, r6.xzw);
	r2.w = inversesqrt(r2.w);
	r6.xzw = r2.www * r6.xzw;
	r2.w = r5.z + idx_uniforms2_ps.cb2[0].z;
	r3.w = idx_uniforms2_ps.cb2[0].z * float(3.14000010f);
	r2.w = r2.w / r3.w;
	r0.w = fma(r0.w, float(1.44269502f), float(1.44269502f));
	r3.w = dot(r6.xzw, r4.xyz);
	r0.w = fma(r0.w, r3.w, -r0.w);
	r0.w = exp2(r0.w);
	r0.w = min(r0.w, float(1.00000000f));
	r0.w = r0.w * r2.w;
	r2.w = dot(r3.xyz, vec3(0.300000012f, 0.589999974f, 0.109999999f));
	r2.w = r2.w + float(0.00100000005f);
	r6.xzw = r3.xyz / r2.www;
	r6.xzw = r6.xzw + vec3(-1.00000000f, -1.00000000f, -1.00000000f);
	r6.xzw = fma(r6.yyy, r6.xzw, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r2.w = saturate(fma(r5.w, float(2.00000000f), float(-1.00000000f)));
	r2.w = fma(r2.w, float(0.649999976f), float(0.0500000007f));
	r3.w = -r2.w + float(1.00000000f);
	r2.x = -r2.x + float(1.00100005f);
	r2.x = min(r2.x, float(1.00000000f));
	r4.w = r2.x * r2.x;
	r4.w = r4.w * r4.w;
	r2.x = r2.x * r4.w;
	r2.x = fma(r3.w, r2.x, r2.w);
	r2.x = min(r2.x, float(1.00000000f));
	r2.w = r2.z * idx_uniforms1_ps.cb1[4].x;
	r6.xzw = r6.xzw * r2.www;
	r6.xzw = r5.xxx * r6.xzw;
	r6.xzw = r0.www * r6.xzw;
	r6.xzw = r2.xxx * r6.xzw;
	r0.w = dot(-r1.yzw, idx_uniforms1_ps.cb1[2].xyz);
	r0.w = saturate(fma(r0.w, idx_uniforms1_ps.cb1[1].w, idx_uniforms1_ps.cb1[2].w));
	r1.y = saturate(fma(r2.y, idx_uniforms1_ps.cb1[13].y, -idx_uniforms1_ps.cb1[13].x));
	r0.w = r0.w * r1.y;
	r0.w = r0.w * r0.w;
	r7 = fma(idx_uniforms1_ps.cb1[9], r0.xxxx, idx_uniforms1_ps.cb1[12]);
	r7 = fma(idx_uniforms1_ps.cb1[10], r0.yyyy, r7);
	r1 = fma(idx_uniforms1_ps.cb1[11], r1.xxxx, r7);
	r1.xyz = r1.xyz / r1.www;
	r0.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r0.x = fract(r0.x);
	r1.w = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
	r0.y = fract(r1.w);
	r0.xy = r0.xy + vec2(-0.500000000f, -0.500000000f);
	r7.xy = r0.xy * vec2(0.000976562500f, 0.000976562500f);
	r8 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r1.xyxy);
	r2.xy = fma(r0.xy, vec2(0.000976562500f, 0.000976562500f), r8.xy);
	r5.zw = fma(-r0.xy, vec2(0.000976562500f, 0.000976562500f), r8.zw);
	r8 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r1.xyxy);
	r7.z = -1.f * r7.x;
	r7.xw = r7.yz + r8.xy;
	r8.xy = -r7.yz + r8.zw;
	r9 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(1.50000000f, 0.500000000f, -0.500000000f, 1.50000000f), r1.xyxy);
	r8.zw = -r7.yz + r9.xy;
	r7.yz = r7.yz + r9.zw;
	r9 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(-1.50000000f, -0.500000000f, 0.500000000f, -1.50000000f), r1.xyxy);
	r1.xy = fma(r0.xy, vec2(0.000976562500f, 0.000976562500f), r9.xy);
	r0.xy = fma(-r0.xy, vec2(0.000976562500f, 0.000976562500f), r9.zw);
	r1.w = intBitsToFloat(float(0.00000000f) < r0.z ? int(0xffffffff) : int(0x00000000));
	r2.w = ((texture(resourceSamplerPair_4_ps, r2.xy)).yzwx).w;
	r3.w = ((texture(resourceSamplerPair_4_ps, r5.zw)).yzwx).w;
	r4.w = ((texture(resourceSamplerPair_4_ps, r7.xw)).yzwx).w;
	r9.x = ((texture(resourceSamplerPair_4_ps, r8.xy))).x;
	r9.y = ((texture(resourceSamplerPair_4_ps, r8.zw)).yxzw).y;
	r9.z = ((texture(resourceSamplerPair_4_ps, r7.yz)).yzxw).z;
	r9.w = ((texture(resourceSamplerPair_4_ps, r1.xy)).yzwx).w;
	r10.x = ((texture(resourceSamplerPair_4_ps, r0.xy))).x;
	if (floatBitsToUint(r1.w) != uint(0))
	{
		r10.y = fma(r0.z, float(0.300000012f), float(0.0500000007f));
		r10.y = float(1.00000000f) / r10.y;
		r10.z = fma(r1.z, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r10.z = float(1.00000000f) / r10.z;
		r2.w = fma(r2.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r2.w = float(1.00000000f) / r2.w;
		r2.w = -r2.w + r10.z;
		r2.w = saturate(r10.y * r2.w);
		r2.w = -r2.w + float(1.00000000f);
		r3.w = fma(r3.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r3.w = float(1.00000000f) / r3.w;
		r3.w = -r3.w + r10.z;
		r3.w = saturate(r10.y * r3.w);
		r2.w = r2.w + -r3.w;
		r2.w = r2.w + float(1.00000000f);
		r3.w = fma(r4.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r3.w = float(1.00000000f) / r3.w;
		r3.w = -r3.w + r10.z;
		r3.w = saturate(r10.y * r3.w);
		r2.w = r2.w + -r3.w;
		r2.w = r2.w + float(1.00000000f);
		r3.w = fma(r9.x, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r3.w = float(1.00000000f) / r3.w;
		r3.w = -r3.w + r10.z;
		r3.w = saturate(r10.y * r3.w);
		r2.w = r2.w + -r3.w;
		r2.w = r2.w + float(1.00000000f);
		r3.w = fma(r9.y, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r3.w = float(1.00000000f) / r3.w;
		r3.w = -r3.w + r10.z;
		r3.w = saturate(r10.y * r3.w);
		r2.w = r2.w + -r3.w;
		r2.w = r2.w + float(1.00000000f);
		r3.w = fma(r9.z, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r3.w = float(1.00000000f) / r3.w;
		r3.w = -r3.w + r10.z;
		r3.w = saturate(r10.y * r3.w);
		r2.w = r2.w + -r3.w;
		r2.w = r2.w + float(1.00000000f);
		r3.w = fma(r9.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r3.w = float(1.00000000f) / r3.w;
		r3.w = -r3.w + r10.z;
		r3.w = saturate(r10.y * r3.w);
		r2.w = r2.w + -r3.w;
		r2.w = r2.w + float(1.00000000f);
		r3.w = fma(r10.x, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r3.w = float(1.00000000f) / r3.w;
		r3.w = -r3.w + r10.z;
		r3.w = saturate(r10.y * r3.w);
		r2.w = r2.w + -r3.w;
		r2.w = r2.w + float(1.00000000f);
		r2.w = r2.w * float(0.125000000f);
		r2.w = r2.w * r2.w;
		r2.w = r2.w * r2.w;
	}
	else
	{
		r2.x = textureLod(resourceSamplerPair_5_ps, vec3(r2.xy, r1.z), float(0));
		r2.y = textureLod(resourceSamplerPair_5_ps, vec3(r5.zw, r1.z), float(0));
		r2.x = r2.y + r2.x;
		r2.y = textureLod(resourceSamplerPair_5_ps, vec3(r7.xw, r1.z), float(0));
		r2.x = r2.y + r2.x;
		r2.y = textureLod(resourceSamplerPair_5_ps, vec3(r8.xy, r1.z), float(0));
		r2.x = r2.y + r2.x;
		r2.y = textureLod(resourceSamplerPair_5_ps, vec3(r8.zw, r1.z), float(0));
		r2.x = r2.y + r2.x;
		r2.y = textureLod(resourceSamplerPair_5_ps, vec3(r7.yz, r1.z), float(0));
		r2.x = r2.y + r2.x;
		r1.x = textureLod(resourceSamplerPair_5_ps, vec3(r1.xy, r1.z), float(0));
		r1.x = r1.x + r2.x;
		r0.x = textureLod(resourceSamplerPair_5_ps, vec3(r0.xy, r1.z), float(0));
		r0.x = r0.x + r1.x;
		r2.w = r0.x * float(0.125000000f);
	}
	r0.x = -r2.w + float(1.00000000f);
	r0.x = fma(-idx_uniforms1_ps.cb1[3].w, r0.x, float(1.00000000f));
	r0.x = r0.x * r0.w;
	r0.y = r0.x * r2.z;
	r0.w = saturate(r5.x + idx_uniforms2_ps.cb2[3].z);
	r0.w = r0.w + -idx_uniforms2_ps.cb2[3].z;
	r1.x = -idx_uniforms2_ps.cb2[3].z + float(1.00000000f);
	r5.y = r0.w / r1.x;
	r1.xy = fma(r5.xy, idx_uniforms2_ps.cb2[3].xw, idx_uniforms2_ps.cb2[4].xw);
	r0.y = r0.y * r1.x;
	r0.w = idx_uniforms1_ps.cb1[3].w + float(-0.750000000f);
	r0.w = saturate(r0.w * float(4.00000000f));
	r0.w = r0.w * idx_uniforms1_ps.cb1[4].w;
	r1.x = dot(r4.xyz, -idx_uniforms1_ps.cb1[2].xyz);
	r1.z = r1.x + float(0.600000024f);
	r1.z = saturate(r1.z * float(0.625000000f));
	r1.z = r1.z * r1.z;
	r1.z = r0.x * r1.z;
	r2.x = saturate(r1.z * float(3.00000000f));
	r2.xyw = fma(r2.xxx, vec3(0.100000001f, 0.790000021f, 0.939999998f), vec3(0.899999976f, 0.209999993f, 0.0599999987f));
	r2.xyw = r1.yyy * r2.xyw;
	r1.x = -r1.x + float(0.150000006f);
	r1.x = saturate(r1.x + r1.x);
	r1.x = r0.x * r1.x;
	r4.xyz = r1.xxx * vec3(0.200000003f, 0.0460000001f, 0.00999999978f);
	r0.z = r0.z * float(2.50000000f);
	r0.z = min(r0.z, float(1.00000000f));
	r4.xyz = r0.zzz * r4.xyz;
	r4.xyz = r0.www * r4.xyz;
	r1.xyz = fma(r2.xyw, r1.zzz, r4.xyz);
	r1.xyz = r1.xyz * r2.zzz;
	r2.xyz = r0.xxx * r6.xzw;
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r1.w), uint(0x3f800000), floatBitsToUint(r0.x)));
	r1.xyz = uintBitsToFloat(floatBitsToUint(r1.xyz) & floatBitsToUint(r1.www));
	r2.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.www), floatBitsToUint(r2.xyz), floatBitsToUint(r6.xzw)));
	r0.z = -r6.y + float(1.00000000f);
	r4.xyz = r0.xxx * idx_uniforms1_ps.cb1[1].xyz;
	r1.xyz = r1.xyz * idx_uniforms1_ps.cb1[4].zzz;
	r1.xyz = r3.xyz * r1.xyz;
	r1.xyz = fma(r1.xyz, r0.zzz, r2.xyz);
	r0.xyw = r0.yyy * idx_uniforms1_ps.cb1[14].xyz;
	r0.xyw = r3.xyz * r0.xyw;
	r0.xyz = r0.zzz * r0.xyw;
	o0.xyz = fma(r4.xyz, r1.xyz, r0.xyz);
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

