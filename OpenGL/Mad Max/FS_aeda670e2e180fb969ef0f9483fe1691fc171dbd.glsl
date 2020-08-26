#version 460 core
// ps_5_0
// Checksum: 09581620_61c2776c_a31a7b26_3aa9a59f
// Name: deferred_pointlight

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[15]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[5]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res2, s1

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
	r0.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.xy = r0.xy * idx_uniforms1_ps.cb1[13].zw;
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.xy)).yzxw).z;
	r0.z = fma(r0.z, idx_uniforms2_ps.cb2[0].x, idx_uniforms2_ps.cb2[0].y);
	r0.z = float(1.00000000f) / r0.z;
	r1.xyz = fma(-r0.zzz, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
	r0.z = dot(r1.xyz, r1.xyz);
	r0.w = inversesqrt(r0.z);
	r0.z = sqrt(r0.z);
	r0.z = saturate(fma(r0.z, idx_uniforms1_ps.cb1[1].w, idx_uniforms1_ps.cb1[0].w));
	r0.z = r0.z + float(-1.00000000f);
	r0.z = fma(-r0.z, r0.z, float(1.00000000f));
	r0.z = sqrt(r0.z);
	r0.z = -r0.z + float(1.00000000f);
	r1.xyz = r0.www * r1.xyz;
	r2.xyz = ((texture(resourceSamplerPair_1_ps, r0.xy))).xyz;
	r2.xyz = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xyz = r0.www * r2.xyz;
	r0.w = dot(r2.xyz, r1.xyz);
	r1.xyz = ((texture(resourceSamplerPair_2_ps, r0.xy)).wxzy).xyz;
	r3.xyz = ((texture(resourceSamplerPair_3_ps, r0.xy))).xyz;
	r0.x = -r1.z + float(0.500000000f);
	r0.x = saturate(r0.x + r0.x);
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.x;
	r0.y = fma(r0.x, idx_uniforms2_ps.cb2[2].x, r0.w);
	r1.w = fma(r0.x, idx_uniforms2_ps.cb2[2].x, float(1.00000000f));
	r0.x = r0.x * idx_uniforms2_ps.cb2[2].x;
	r0.x = saturate(r0.x);
	r0.y = saturate(r0.y / r1.w);
	r1.w = r0.y + float(-1.00000000f);
	r0.x = fma(r0.x, r1.w, float(1.00000000f));
	r0.x = r0.x * r0.y;
	r0.y = dot(-v2.v.xyz, -v2.v.xyz);
	r0.y = inversesqrt(r0.y);
	r4.xyz = r0.yyy * -v2.v.xyz;
	r0.y = saturate(dot(r4.xyz, r2.xyz));
	r0.y = fma(r0.x, r0.y, float(9.99999975e-05f));
	r0.y = log2(r0.y);
	r1.zw = r1.yz + vec2(-0.501960814f, -0.500000000f);
	r2.xy = saturate(r1.zw + r1.zw);
	r1.z = fma(r2.y, idx_uniforms2_ps.cb2[2].y, float(9.99999975e-05f));
	r0.y = r0.y * r1.z;
	r0.y = exp2(r0.y);
	r0.x = r0.x * r0.y;
	r0.x = min(r0.x, float(1.00000000f));
	r4.x = uintBitsToFloat(uint(0x00000000));
	r2.z = uintBitsToFloat(uint(0x00000000));
	r0.y = intBitsToFloat(r1.y < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
	r4.y = r1.y + r1.y;
	r1.zw = saturate(uintBitsToFloat(movc(floatBitsToUint(r0.yy), floatBitsToUint(r4.xy), floatBitsToUint(r2.xz))));
	r0.y = -r2.y + float(1.00000000f);
	r2.x = saturate(fma(r1.w, float(0.500000000f), -r0.w));
	r0.w = r0.w + float(1.00000000f);
	r0.w = saturate(r0.w * float(0.500000000f));
	r0.w = r0.w * r0.w;
	r0.x = fma(r2.x, r1.w, r0.x);
	r1.z = intBitsToFloat(float(0.00000000f) < r1.z ? int(0xffffffff) : int(0x00000000));
	r0.x = min(r0.x, float(1.00000000f));
	r1.w = saturate(r1.x + idx_uniforms2_ps.cb2[3].z);
	r1.w = r1.w + -idx_uniforms2_ps.cb2[3].z;
	r2.x = -idx_uniforms2_ps.cb2[3].z + float(1.00000000f);
	r1.y = r1.w / r2.x;
	r1.xy = fma(r1.xy, idx_uniforms2_ps.cb2[3].xw, idx_uniforms2_ps.cb2[4].xw);
	r0.x = r0.x * r1.y;
	r0.x = r0.x * r0.z;
	r1.w = r0.w * float(5.00000000f);
	r1.w = min(r1.w, float(1.00000000f));
	r2.xyz = fma(r1.www, vec3(0.100000001f, 0.790000021f, 0.939999998f), vec3(0.899999976f, 0.209999993f, 0.0599999987f));
	r2.xyz = r1.yyy * r2.xyz;
	r1.x = r0.z * r1.x;
	r1.xyw = r1.xxx * idx_uniforms1_ps.cb1[14].xyz;
	r1.xyw = r3.xyz * r1.xyw;
	r1.xyw = r0.yyy * r1.xyw;
	r2.xyz = r0.www * r2.xyz;
	r2.xyz = r0.zzz * r2.xyz;
	r0.xzw = uintBitsToFloat(movc(floatBitsToUint(r1.zzz), floatBitsToUint(r2.xyz), floatBitsToUint(r0.xxx)));
	r0.xzw = r0.xzw * idx_uniforms1_ps.cb1[4].zzz;
	r0.xzw = r3.xyz * r0.xzw;
	r0.xyz = r0.yyy * r0.xzw;
	o0.xyz = fma(idx_uniforms1_ps.cb1[1].xyz, r0.xyz, r1.xyw);
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

