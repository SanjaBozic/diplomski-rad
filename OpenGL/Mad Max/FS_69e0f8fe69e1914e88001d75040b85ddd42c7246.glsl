#version 460 core
// ps_5_0
// Checksum: aa5d48ed_44c6492f_8cf77a1b_23268bc7
// Name: deferred_spotlight

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[15]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[5]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res2, s1

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0

uniform sampler2D resourceSamplerPair_2_ps; // res3, s0

uniform sampler2D resourceSamplerPair_3_ps; // res1, s0


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
	r0.xyz = r0.xxx * -v2.v.xyz;
	r1.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r1.xy = r1.xy * idx_uniforms1_ps.cb1[13].zw;
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy))).xyz;
	r2.xyz = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xyz = r0.www * r2.xyz;
	r0.x = saturate(dot(r0.xyz, r2.xyz));
	r0.y = ((texture(resourceSamplerPair_1_ps, r1.xy)).yxzw).y;
	r0.y = fma(r0.y, idx_uniforms2_ps.cb2[0].x, idx_uniforms2_ps.cb2[0].y);
	r0.y = float(1.00000000f) / r0.y;
	r0.yzw = fma(-r0.yyy, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
	r1.z = dot(r0.yzw, r0.yzw);
	r1.w = inversesqrt(r1.z);
	r1.z = sqrt(r1.z);
	r0.yzw = r0.yzw * r1.www;
	r1.w = dot(r2.xyz, r0.yzw);
	r0.y = dot(-r0.yzw, idx_uniforms1_ps.cb1[2].xyz);
	r0.y = saturate(fma(r0.y, idx_uniforms1_ps.cb1[1].w, idx_uniforms1_ps.cb1[2].w));
	r2.xyz = ((texture(resourceSamplerPair_2_ps, r1.xy)).wxzy).xyz;
	r3.xyz = ((texture(resourceSamplerPair_3_ps, r1.xy))).xyz;
	r0.z = -r2.z + float(0.500000000f);
	r0.z = saturate(r0.z + r0.z);
	r0.z = r0.z * r0.z;
	r0.z = r0.z * r0.z;
	r0.w = fma(r0.z, idx_uniforms2_ps.cb2[2].x, r1.w);
	r1.x = fma(r0.z, idx_uniforms2_ps.cb2[2].x, float(1.00000000f));
	r0.z = r0.z * idx_uniforms2_ps.cb2[2].x;
	r0.z = saturate(r0.z);
	r0.w = saturate(r0.w / r1.x);
	r1.x = r0.w + float(-1.00000000f);
	r0.z = fma(r0.z, r1.x, float(1.00000000f));
	r0.z = r0.z * r0.w;
	r0.x = fma(r0.z, r0.x, float(9.99999975e-05f));
	r0.x = log2(r0.x);
	r1.xy = r2.yz + vec2(-0.501960814f, -0.500000000f);
	r4.xy = saturate(r1.xy + r1.xy);
	r0.w = fma(r4.y, idx_uniforms2_ps.cb2[2].y, float(9.99999975e-05f));
	r0.x = r0.x * r0.w;
	r0.x = exp2(r0.x);
	r0.x = r0.z * r0.x;
	r0.x = min(r0.x, float(1.00000000f));
	r1.x = uintBitsToFloat(uint(0x00000000));
	r4.z = uintBitsToFloat(uint(0x00000000));
	r0.z = intBitsToFloat(r2.y < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
	r1.y = r2.y + r2.y;
	r0.zw = saturate(uintBitsToFloat(movc(floatBitsToUint(r0.zz), floatBitsToUint(r1.xy), floatBitsToUint(r4.xz))));
	r1.x = -r4.y + float(1.00000000f);
	r1.y = saturate(fma(r0.w, float(0.500000000f), -r1.w));
	r1.w = r1.w + float(1.00000000f);
	r1.w = saturate(r1.w * float(0.500000000f));
	r1.w = r1.w * r1.w;
	r0.x = fma(r1.y, r0.w, r0.x);
	r0.z = intBitsToFloat(float(0.00000000f) < r0.z ? int(0xffffffff) : int(0x00000000));
	r0.x = min(r0.x, float(1.00000000f));
	r0.w = saturate(r2.x + idx_uniforms2_ps.cb2[3].z);
	r0.w = r0.w + -idx_uniforms2_ps.cb2[3].z;
	r1.y = -idx_uniforms2_ps.cb2[3].z + float(1.00000000f);
	r2.y = r0.w / r1.y;
	r2.xy = fma(r2.xy, idx_uniforms2_ps.cb2[3].xw, idx_uniforms2_ps.cb2[4].xw);
	r0.x = r0.x * r2.y;
	r0.w = saturate(fma(r1.z, idx_uniforms1_ps.cb1[3].x, idx_uniforms1_ps.cb1[0].w));
	r1.y = saturate(fma(r1.z, idx_uniforms1_ps.cb1[13].y, -idx_uniforms1_ps.cb1[13].x));
	r0.y = r0.y * r1.y;
	r0.w = r0.w + float(-1.00000000f);
	r0.w = fma(-r0.w, r0.w, float(1.00000000f));
	r0.w = sqrt(r0.w);
	r0.w = -r0.w + float(1.00000000f);
	r0.xy = r0.xy * r0.wy;
	r1.y = r1.w * float(5.00000000f);
	r1.y = min(r1.y, float(1.00000000f));
	r4.xyz = fma(r1.yyy, vec3(0.100000001f, 0.790000021f, 0.939999998f), vec3(0.899999976f, 0.209999993f, 0.0599999987f));
	r2.yzw = r2.yyy * r4.xyz;
	r1.yzw = r1.www * r2.yzw;
	r1.yzw = r0.www * r1.yzw;
	r0.w = r0.y * r0.w;
	r2.yzw = r0.yyy * idx_uniforms1_ps.cb1[1].xyz;
	r0.y = r2.x * r0.w;
	r4.xyz = r0.yyy * idx_uniforms1_ps.cb1[14].xyz;
	r4.xyz = r3.xyz * r4.xyz;
	r4.xyz = r1.xxx * r4.xyz;
	r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.zzz), floatBitsToUint(r1.yzw), floatBitsToUint(r0.xxx)));
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[4].zzz;
	r0.xyz = r3.xyz * r0.xyz;
	r0.xyz = r1.xxx * r0.xyz;
	o0.xyz = fma(r2.yzw, r0.xyz, r4.xyz);
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

