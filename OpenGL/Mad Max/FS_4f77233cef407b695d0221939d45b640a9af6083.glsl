#version 460 core
// ps_5_0
// Checksum: 16ea254f_0be991c0_bffb38ab_19fc5292
// Name: deferred_spotlightspndpt

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[15]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[5]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res2, s1

uniform sampler2D resourceSamplerPair_2_ps; // res3, s0

uniform sampler2D resourceSamplerPair_3_ps; // res1, s0

uniform sampler2D resourceSamplerPair_4_ps; // res6, s2


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
	r0.x = dot(-v2.v.xyz, -v2.v.xyz);
	r0.x = inversesqrt(r0.x);
	r0.yz = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.yz = r0.yz * idx_uniforms1_ps.cb1[13].zw;
	r0.w = ((texture(resourceSamplerPair_0_ps, r0.yz)).yzwx).w;
	r0.w = fma(r0.w, idx_uniforms2_ps.cb2[0].x, idx_uniforms2_ps.cb2[0].y);
	r0.w = float(1.00000000f) / r0.w;
	r1.xyz = fma(-r0.www, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
	r2.xyz = r0.www * v2.v.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r0.w);
	r0.w = sqrt(r0.w);
	r1.xyz = r1.www * r1.xyz;
	r3.xyz = fma(-v2.v.xyz, r0.xxx, r1.xyz);
	r4.xyz = r0.xxx * -v2.v.xyz;
	r0.x = dot(r3.xyz, r3.xyz);
	r0.x = inversesqrt(r0.x);
	r3.xyz = r0.xxx * r3.xyz;
	r5.xyz = ((texture(resourceSamplerPair_1_ps, r0.yz))).xyz;
	r5.xyz = fma(r5.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.x = dot(r5.xyz, r5.xyz);
	r0.x = inversesqrt(r0.x);
	r5.xyz = r0.xxx * r5.xyz;
	r0.x = dot(r3.xyz, r5.xyz);
	r3 = (texture(resourceSamplerPair_2_ps, r0.yz));
	r6.xyz = ((texture(resourceSamplerPair_3_ps, r0.yz))).xyz;
	r0.y = fma(r3.y, float(8.00000000f), float(1.00000000f));
	r0.y = exp2(r0.y);
	r0.y = fma(r0.y, float(1.44269502f), float(1.44269502f));
	r0.x = fma(r0.y, r0.x, -r0.y);
	r0.x = exp2(r0.x);
	r0.x = min(r0.x, float(1.00000000f));
	r0.y = idx_uniforms2_ps.cb2[0].z * float(3.14000010f);
	r0.z = r3.y + idx_uniforms2_ps.cb2[0].z;
	r0.y = r0.z / r0.y;
	r0.x = r0.x * r0.y;
	r0.y = saturate(fma(r0.w, idx_uniforms1_ps.cb1[3].x, idx_uniforms1_ps.cb1[0].w));
	r0.z = saturate(fma(r0.w, idx_uniforms1_ps.cb1[13].y, -idx_uniforms1_ps.cb1[13].x));
	r0.y = r0.y + float(-1.00000000f);
	r0.y = fma(-r0.y, r0.y, float(1.00000000f));
	r0.y = sqrt(r0.y);
	r0.y = -r0.y + float(1.00000000f);
	r0.w = r0.y * idx_uniforms1_ps.cb1[4].x;
	r1.w = dot(r6.xyz, vec3(0.300000012f, 0.589999974f, 0.109999999f));
	r1.w = r1.w + float(0.00100000005f);
	r7.xyz = r6.xyz / r1.www;
	r7.xyz = r7.xyz + vec3(-1.00000000f, -1.00000000f, -1.00000000f);
	r8.xy = r3.xz + vec2(-0.501960814f, -0.500000000f);
	r8.xy = saturate(r8.xy + r8.xy);
	r7.xyz = fma(r8.yyy, r7.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r7.xyz = r0.www * r7.xyz;
	r7.xyz = r3.www * r7.xyz;
	r7.xyz = r0.xxx * r7.xyz;
	r0.x = saturate(dot(r4.xyz, r5.xyz));
	r0.w = dot(r5.xyz, r1.xyz);
	r1.x = dot(-r1.xyz, idx_uniforms1_ps.cb1[2].xyz);
	r1.x = saturate(fma(r1.x, idx_uniforms1_ps.cb1[1].w, idx_uniforms1_ps.cb1[2].w));
	r0.z = r0.z * r1.x;
	r0.z = r0.z * r0.z;
	r0.w = r0.w + float(1.00000000f);
	r0.w = saturate(r0.w * float(0.500000000f));
	r0.w = r0.w * r0.w;
	r0.x = -r0.x + float(1.00100005f);
	r0.x = min(r0.x, float(1.00000000f));
	r1.x = r0.x * r0.x;
	r1.x = r1.x * r1.x;
	r0.x = r0.x * r1.x;
	r1.x = saturate(fma(r3.z, float(2.00000000f), float(-1.00000000f)));
	r1.x = fma(r1.x, float(0.649999976f), float(0.0500000007f));
	r1.y = -r1.x + float(1.00000000f);
	r0.x = fma(r1.y, r0.x, r1.x);
	r0.x = min(r0.x, float(1.00000000f));
	r1.xyz = r0.xxx * r7.xyz;
	r0.x = r0.w * float(5.00000000f);
	r0.x = min(r0.x, float(1.00000000f));
	r4.xyz = fma(r0.xxx, vec3(0.100000001f, 0.790000021f, 0.939999998f), vec3(0.899999976f, 0.209999993f, 0.0599999987f));
	r0.x = saturate(r3.w + idx_uniforms2_ps.cb2[3].z);
	r0.x = r0.x + -idx_uniforms2_ps.cb2[3].z;
	r1.w = -idx_uniforms2_ps.cb2[3].z + float(1.00000000f);
	r5.y = r0.x / r1.w;
	r5.x = r3.w;
	r0.x = intBitsToFloat(r3.x < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
	r3.xy = fma(r5.xy, idx_uniforms2_ps.cb2[3].xw, idx_uniforms2_ps.cb2[4].xw);
	r3.yzw = r3.yyy * r4.xyz;
	r3.yzw = r0.www * r3.yzw;
	r3.yzw = r0.yyy * r3.yzw;
	r0.y = r0.z * r0.y;
	r0.y = r3.x * r0.y;
	r4.xyz = r0.yyy * idx_uniforms1_ps.cb1[14].xyz;
	r4.xyz = r6.xyz * r4.xyz;
	r0.y = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
	r0.w = -r8.y + float(1.00000000f);
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r0.x), uint(0x00000000), floatBitsToUint(r0.y)));
	r3.xyz = uintBitsToFloat(floatBitsToUint(r3.yzw) & floatBitsToUint(r0.xxx));
	r3.xyz = r3.xyz * idx_uniforms1_ps.cb1[4].zzz;
	r3.xyz = r6.xyz * r3.xyz;
	r1.xyz = fma(r3.xyz, r0.www, r1.xyz);
	r0.xyw = r0.www * r4.xyz;
	r3.xyz = fma(idx_uniforms1_ps.cb1[5].xyw, r2.xxx, idx_uniforms1_ps.cb1[8].xyw);
	r2.xyw = fma(idx_uniforms1_ps.cb1[6].xyw, r2.yyy, r3.xyz);
	r2.xyz = fma(idx_uniforms1_ps.cb1[7].xyw, r2.zzz, r2.xyw);
	r2.xy = r2.xy / r2.zz;
	r2.xyz = ((textureLod(resourceSamplerPair_4_ps, r2.xy, float(0.00000000f)))).xyz;
	r2.xyz = r2.xyz * idx_uniforms1_ps.cb1[1].xyz;
	r2.xyz = r0.zzz * r2.xyz;
	o0.xyz = fma(r2.xyz, r1.xyz, r0.xyw);
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

