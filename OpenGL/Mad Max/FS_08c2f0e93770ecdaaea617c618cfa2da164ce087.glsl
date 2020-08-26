#version 460 core
// ps_5_0
// Checksum: 12069f57_5014abe1_76627b5b_5d6cfe06
// Name: deferred_sunlight_ind

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[17]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[39]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s0

uniform sampler2D resourceSamplerPair_2_ps; // res2, s1

uniform sampler2D resourceSamplerPair_3_ps; // res3, s0

uniform samplerCube resourceSamplerPair_4_ps; // res6, s3

uniform samplerCube resourceSamplerPair_5_ps; // res7, s3


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
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).x;
	r0.y = intBitsToFloat(float(0.00000000f) < r0.x ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r1 = (texture(resourceSamplerPair_1_ps, v1.v.xy));
		r0.yzw = ((texture(resourceSamplerPair_2_ps, v1.v.xy)).wxyz).yzw;
		r0.yzw = fma(r0.yzw, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r2 = (texture(resourceSamplerPair_3_ps, v1.v.xy));
		r3.xyz = -r2.yyz + vec3(0.125000000f, 1.00000000f, 0.500000000f);
		r3.x = saturate(r3.x);
		r3.w = intBitsToFloat(r2.x < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
		r4.xy = r2.xz + vec2(-0.501960814f, -0.500000000f);
		r4.xy = saturate(r4.xy + r4.xy);
		r2.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), uint(0x00000000), floatBitsToUint(r4.x)));
		r3.w = dot(-v2.v.xyz, -v2.v.xyz);
		r3.w = inversesqrt(r3.w);
		r4.xzw = r3.www * -v2.v.xyz;
		r5.xyz = fma(-v2.v.xyz, r3.www, -r0.yzw);
		r0.yzw = fma(r3.xxx, r5.xyz, r0.yzw);
		r3.x = dot(r0.yzw, r0.yzw);
		r3.x = inversesqrt(r3.x);
		r0.yzw = r0.yzw * r3.xxx;
		r3.x = r3.y * float(5.00000000f);
		r3.w = intBitsToFloat(r2.x == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		r3.z = saturate(r3.z + r3.z);
		r3.z = r3.z * r3.z;
		r3.z = r3.z * r3.z;
		r5.x = r3.z * float(0.800000012f);
		r5.y = min(r5.x, float(0.400000006f));
		r3.zw = uintBitsToFloat(floatBitsToUint(r3.ww) & floatBitsToUint(r5.xy));
		r0.x = fma(r0.x, idx_uniforms1_ps.cb1[0].x, idx_uniforms1_ps.cb1[0].y);
		r0.x = float(1.00000000f) / r0.x;
		r5.x = fma(r0.x, v2.v.y, idx_uniforms0_ps.cb0[4].y);
		r5.y = dot(r4.xzw, r0.yzw);
		r5.z = saturate(fma(r0.z, float(0.500000000f), float(0.500000000f)));
		r6.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
		r6.xyz = fma(r5.zzz, r6.xyz, idx_uniforms0_ps.cb0[11].xyz);
		r5.z = dot(r0.yzw, -idx_uniforms0_ps.cb0[3].xyz);
		r5.z = r3.w + r5.z;
		r3.w = r3.w + float(1.00000000f);
		r3.w = saturate(r5.z / r3.w);
		r5.z = r3.w + float(-1.00000000f);
		r3.z = fma(r3.z, r5.z, float(1.00000000f));
		r3.z = r3.z * r3.w;
		r3.w = fma(r2.w, idx_uniforms1_ps.cb1[35].x, idx_uniforms1_ps.cb1[36].x);
		r6.xyz = r6.xyz * idx_uniforms1_ps.cb1[0].zzz;
		r5.z = saturate(fma(r2.z, float(2.00000000f), float(-1.00000000f)));
		r5.z = fma(r5.z, float(0.649999976f), float(0.0500000007f));
		r5.w = -r5.z + float(1.00000000f);
		r6.w = saturate(fma(r5.y, float(0.899999976f), float(0.100000001f)));
		r6.w = -r6.w + float(1.00100005f);
		r6.w = min(r6.w, float(1.00000000f));
		r7.x = r6.w * r6.w;
		r7.x = r7.x * r7.x;
		r6.w = r6.w * r7.x;
		r5.z = fma(r5.w, r6.w, r5.z);
		r5.z = min(r5.z, float(1.00000000f));
		r7.xyz = r1.xyz + vec3(0.00999999978f, 0.00999999978f, 0.00999999978f);
		r5.w = dot(r7.xyz, r7.xyz);
		r5.w = inversesqrt(r5.w);
		r7.xyz = fma(r7.xyz, r5.www, vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7.xyz = fma(r4.yyy, r7.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
		r6.xyz = r3.www * r6.xyz;
		r1.xyz = r1.xyz * r6.xyz;
		r3.w = r5.y + r5.y;
		r0.yzw = fma(r3.www, r0.yzw, -r4.xzw);
		r5.yw = r0.ww * idx_uniforms1_ps.cb1[33].yw;
		r6.xz = fma(-r0.yy, idx_uniforms1_ps.cb1[33].xz, r5.yw);
		r5.yw = r0.ww * idx_uniforms1_ps.cb1[38].yw;
		r8.xz = fma(-r0.yy, idx_uniforms1_ps.cb1[38].xz, r5.yw);
		r6.y = r0.z;
		r0.yzw = ((textureLod(resourceSamplerPair_4_ps, r6.xyz, r3.x)).wxyz).yzw;
		r8.y = r6.y;
		r6.xyz = ((textureLod(resourceSamplerPair_5_ps, r8.xyz, r3.x))).xyz;
		r6.xyz = -r0.yzw + r6.xyz;
		r0.yzw = fma(idx_uniforms1_ps.cb1[0].www, r6.xyz, r0.yzw);
		r0.yzw = r7.xyz * r0.yzw;
		r0.yzw = r0.yzw * idx_uniforms1_ps.cb1[20].zzz;
		r3.x = saturate(fma(-r2.z, float(2.00000000f), float(1.00000000f)));
		r3.x = r3.x + r3.x;
		r3.x = max(r2.x, r3.x);
		r3.w = r2.y * float(3.00000000f);
		r2.x = fma(-r2.x, float(8.00000000f), float(1.00000000f));
		r2.x = saturate(fma(r3.w, r2.x, float(-1.00000000f)));
		r3.xw = r3.xx + vec2(2.00000000f, 1.00000000f);
		r3.x = fma(r2.w, r3.x, -r3.w);
		r2.zw = fma(r2.wz, vec2(1.60000002f, 4.59999990f), vec2(0.200000003f, -1.29999995f));
		r2.x = max(r2.x, r4.y);
		r2.z = -r3.x + r2.z;
		r2.x = saturate(fma(r2.x, r2.z, r3.x));
		r2.z = dot(vec3(0.212500006f, 0.715399981f, 0.0720999986f), idx_uniforms0_ps.cb0[10].zzz);
		r2.z = r2.z * float(3.00000000f);
		r3.x = dot(vec3(0.212500006f, 0.715399981f, 0.0720999986f), idx_uniforms0_ps.cb0[2].xyz);
		r3.x = max(r3.x, float(0.100000001f));
		r2.z = r2.z / r3.x;
		r2.z = max(r2.z, float(0.100000001f));
		r2.z = min(r2.z, float(1.00000000f));
		r2.y = fma(r4.y, r3.y, r2.y);
		r3.x = r3.z * idx_uniforms0_ps.cb0[9].w;
		r2.z = saturate(fma(r3.x, float(6.00000000f), r2.z));
		r2.z = fma(idx_uniforms1_ps.cb1[31].z, r2.z, float(-1.00000000f));
		r2.z = r2.z * idx_uniforms1_ps.cb1[31].z;
		r2.z = fma(r2.y, r2.z, float(1.00000000f));
		r2.x = r2.x * r2.z;
		r2.x = r2.y * r2.x;
		r2.y = max(r2.w, float(0.0799999982f));
		r2.y = min(r2.y, float(1.00000000f));
		r2.y = min(r2.y, r5.z);
		r2.x = saturate(r2.x * r2.y);
		r2.y = -r2.x + float(1.00000000f);
		r2.z = -r4.y + float(1.00000000f);
		r2.y = r2.z * r2.y;
		r0.yzw = r0.yzw * r2.xxx;
		r0.yzw = fma(r1.xyz, r2.yyy, r0.yzw);
		r1.x = saturate(r0.x * idx_uniforms0_ps.cb0[16].w);
		r1.y = fma(r5.x, idx_uniforms0_ps.cb0[16].z, -idx_uniforms0_ps.cb0[16].x);
		r1.y = min(r1.y, idx_uniforms0_ps.cb0[16].y);
		r1.y = -r1.y + float(1.00000000f);
		r1.x = fma(r1.x, r1.y, -idx_uniforms0_ps.cb0[14].w);
		r0.x = fma(r0.x, idx_uniforms0_ps.cb0[15].w, r1.x);
		r1.x = dot(idx_uniforms1_ps.cb1[37].xyz, r4.xzw);
		r1.x = r1.x + float(0.500000000f);
		r2.x = uintBitsToFloat(uint(0x3f800000));
		r2.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
		r2 = -r0.xxxx * r2;
		r2 = exp2(r2);
		r2 = min(r2, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
		r0.x = -r2.x + float(1.00000000f);
		r1.y = r1.x * r1.x;
		r1.x = r1.x * r1.y;
		r1.xyz = fma(r1.xxx, idx_uniforms0_ps.cb0[14].xyz, idx_uniforms0_ps.cb0[15].xyz);
		r1.xyz = r0.xxx * r1.xyz;
		o0.xyz = fma(r0.yzw, r2.yzw, r1.xyz);
		o0.w = r1.w;
	}
	else
	{
		o0 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	}
	return;
}

