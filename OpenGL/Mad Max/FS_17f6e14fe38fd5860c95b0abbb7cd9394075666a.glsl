#version 460 core
// ps_5_0
// Checksum: e15ff489_fba2edcd_880e69cd_b88c101f
// Name: deferred_sunlight_ind_clt_clfo

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11;

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
		r4.x = r2.x + r2.x;
		r4.yw = r2.xz + vec2(-0.501960814f, -0.500000000f);
		r5.xy = saturate(r4.yw + r4.yw);
		r4.z = uintBitsToFloat(uint(0x00000000));
		r5.z = uintBitsToFloat(uint(0x00000000));
		r4.xy = saturate(uintBitsToFloat(movc(floatBitsToUint(r3.ww), floatBitsToUint(r4.xz), floatBitsToUint(r5.zx))));
		r2.x = dot(-v2.v.xyz, -v2.v.xyz);
		r2.x = inversesqrt(r2.x);
		r5.xzw = r2.xxx * -v2.v.xyz;
		r6.xyz = fma(-v2.v.xyz, r2.xxx, -r0.yzw);
		r0.yzw = fma(r3.xxx, r6.xyz, r0.yzw);
		r3.x = dot(r0.yzw, r0.yzw);
		r3.x = inversesqrt(r3.x);
		r0.yzw = r0.yzw * r3.xxx;
		r3.x = r2.y * float(3.00000000f);
		r6.xyz = fma(r2.ywz, vec3(8.00000000f, 1.60000002f, 4.59999990f), vec3(1.00000000f, 0.200000003f, -1.29999995f));
		r3.w = exp2(r6.x);
		r4.z = r3.y * float(5.00000000f);
		r4.w = intBitsToFloat(r4.y == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		r3.z = saturate(r3.z + r3.z);
		r3.z = r3.z * r3.z;
		r3.z = r3.z * r3.z;
		r7.x = r3.z * float(0.800000012f);
		r7.y = min(r7.x, float(0.400000006f));
		r6.xw = uintBitsToFloat(floatBitsToUint(r4.ww) & floatBitsToUint(r7.xy));
		r3.z = fma(r5.y, float(4.00000000f), float(9.99999975e-05f));
		r0.x = fma(r0.x, idx_uniforms1_ps.cb1[0].x, idx_uniforms1_ps.cb1[0].y);
		r0.x = float(1.00000000f) / r0.x;
		r7.xyz = fma(r0.xxx, v2.v.xyz, idx_uniforms0_ps.cb0[4].xyz);
		r8.xyz = fma(-v2.v.xyz, r2.xxx, -idx_uniforms0_ps.cb0[3].xyz);
		r4.w = dot(r8.xyz, r8.xyz);
		r4.w = inversesqrt(r4.w);
		r8.xyz = r4.www * r8.xyz;
		r4.w = dot(r5.xzw, r0.yzw);
		r7.w = saturate(r4.w);
		r8.w = saturate(fma(r0.z, float(0.500000000f), float(0.500000000f)));
		r9.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
		r9.xyz = fma(r8.www, r9.xyz, idx_uniforms0_ps.cb0[11].xyz);
		r8.w = dot(r0.yzw, -idx_uniforms0_ps.cb0[3].xyz);
		r9.w = r6.w + r8.w;
		r6.w = r6.w + float(1.00000000f);
		r6.w = saturate(r9.w / r6.w);
		r9.w = r6.w + float(-1.00000000f);
		r6.x = fma(r6.x, r9.w, float(1.00000000f));
		r6.x = r6.x * r6.w;
		r6.w = fma(r6.x, r7.w, float(9.99999975e-05f));
		r6.w = log2(r6.w);
		r3.z = r3.z * r6.w;
		r3.z = exp2(r3.z);
		r3.z = r6.x * r3.z;
		r3.z = min(r3.z, float(1.00000000f));
		r6.w = saturate(fma(r4.x, float(0.500000000f), -r8.w));
		r3.z = fma(r6.w, r4.x, r3.z);
		r10.xy = fma(r2.ww, idx_uniforms1_ps.cb1[35].xz, idx_uniforms1_ps.cb1[36].xz);
		r9.xyz = r9.xyz * idx_uniforms1_ps.cb1[0].zzz;
		r4.x = saturate(fma(r2.z, float(2.00000000f), float(-1.00000000f)));
		r4.x = fma(r4.x, float(0.649999976f), float(0.0500000007f));
		r6.w = -r4.x + float(1.00000000f);
		r7.w = saturate(fma(r4.w, float(0.899999976f), float(0.100000001f)));
		r7.w = -r7.w + float(1.00100005f);
		r7.w = min(r7.w, float(1.00000000f));
		r8.w = r7.w * r7.w;
		r8.w = r8.w * r8.w;
		r7.w = r7.w * r8.w;
		r4.x = fma(r6.w, r7.w, r4.x);
		r4.x = min(r4.x, float(1.00000000f));
		r6.w = r3.w + float(8.00000000f);
		r6.w = r6.w * float(0.0398089178f);
		r3.w = fma(r3.w, float(1.44269502f), float(1.44269502f));
		r7.w = dot(r8.xyz, r0.yzw);
		r7.w = fma(r3.w, r7.w, -r3.w);
		r7.w = exp2(r7.w);
		r7.w = min(r7.w, float(1.00000000f));
		r7.w = r6.w * r7.w;
		r8.xyz = r1.xyz + vec3(0.00999999978f, 0.00999999978f, 0.00999999978f);
		r8.w = dot(r8.xyz, r8.xyz);
		r8.w = inversesqrt(r8.w);
		r8.xyz = fma(r8.xyz, r8.www, vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r8.xyz = fma(r5.yyy, r8.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
		r6.w = r2.w * r6.w;
		r6.w = r4.x * r6.w;
		r7.w = r6.x * r7.w;
		r7.w = r4.x * r7.w;
		r11.xyz = -r7.xyz + idx_uniforms1_ps.cb1[19].xyz;
		r7.x = dot(r11.xyz, r11.xyz);
		r7.x = sqrt(r7.x);
		r7.z = dot(idx_uniforms1_ps.cb1[18].xyz, r0.yzw);
		r8.w = intBitsToFloat(float(0.00000000f) < r4.y ? int(0xffffffff) : int(0x00000000));
		r9.w = r7.z + float(0.250000000f);
		r9.w = r9.w * float(0.800000012f);
		r7.z = saturate(uintBitsToFloat(movc(floatBitsToUint(r8.w), floatBitsToUint(r9.w), floatBitsToUint(r7.z))));
		r11.xyz = fma(-v2.v.xyz, r2.xxx, idx_uniforms1_ps.cb1[18].xyz);
		r2.x = dot(r11.xyz, r11.xyz);
		r2.x = inversesqrt(r2.x);
		r11.xyz = r2.xxx * r11.xyz;
		r2.x = r7.z * idx_uniforms1_ps.cb1[17].x;
		r6.w = r6.w * r7.z;
		r7.z = dot(r11.xyz, r0.yzw);
		r3.w = fma(r3.w, r7.z, -r3.w);
		r3.w = exp2(r3.w);
		r3.zw = min(r3.zw, vec2(1.00000000f, 1.00000000f));
		r3.w = r3.w * r6.w;
		r3.w = r3.w * idx_uniforms1_ps.cb1[17].y;
		r6.w = r7.x / idx_uniforms1_ps.cb1[19].w;
		r6.w = saturate(-r6.w + float(1.00000000f));
		r2.x = r2.x * r6.w;
		r3.w = r3.w * r6.w;
		r11.xyz = r3.zzz * idx_uniforms1_ps.cb1[25].xyz;
		r11.xyz = fma(idx_uniforms1_ps.cb1[16].xyz, r2.xxx, r11.xyz);
		r7.xzw = r7.www * idx_uniforms1_ps.cb1[26].xyz;
		r7.xzw = fma(idx_uniforms1_ps.cb1[16].xyz, r3.www, r7.xzw);
		r11.xyz = r10.yyy * r11.xyz;
		r7.xzw = r10.yyy * r7.xzw;
		r9.xyz = fma(r9.xyz, r10.xxx, r11.xyz);
		r1.xyz = r1.xyz * r9.xyz;
		r2.x = r4.w + r4.w;
		r0.yzw = fma(r2.xxx, r0.yzw, -r5.xzw);
		r3.zw = r0.ww * idx_uniforms1_ps.cb1[33].yw;
		r9.xz = fma(-r0.yy, idx_uniforms1_ps.cb1[33].xz, r3.zw);
		r3.zw = r0.ww * idx_uniforms1_ps.cb1[38].yw;
		r10.xz = fma(-r0.yy, idx_uniforms1_ps.cb1[38].xz, r3.zw);
		r9.y = r0.z;
		r0.yzw = ((textureLod(resourceSamplerPair_4_ps, r9.xyz, r4.z)).wxyz).yzw;
		r10.y = r9.y;
		r9.xyz = ((textureLod(resourceSamplerPair_5_ps, r10.xyz, r4.z))).xyz;
		r9.xyz = -r0.yzw + r9.xyz;
		r0.yzw = fma(idx_uniforms1_ps.cb1[0].www, r9.xyz, r0.yzw);
		r0.yzw = r8.xyz * r0.yzw;
		r0.yzw = r0.yzw * idx_uniforms1_ps.cb1[20].zzz;
		r2.x = saturate(fma(-r2.z, float(2.00000000f), float(1.00000000f)));
		r2.x = r2.x + r2.x;
		r2.x = max(r4.y, r2.x);
		r2.z = fma(-r4.y, float(8.00000000f), float(1.00000000f));
		r2.z = saturate(fma(r3.x, r2.z, float(-1.00000000f)));
		r3.xz = r2.xx + vec2(2.00000000f, 1.00000000f);
		r2.x = fma(r2.w, r3.x, -r3.z);
		r2.z = max(r2.z, r5.y);
		r2.w = -r2.x + r6.y;
		r2.x = saturate(fma(r2.z, r2.w, r2.x));
		r2.z = dot(vec3(0.212500006f, 0.715399981f, 0.0720999986f), idx_uniforms0_ps.cb0[10].zzz);
		r2.z = r2.z * float(3.00000000f);
		r2.w = dot(vec3(0.212500006f, 0.715399981f, 0.0720999986f), idx_uniforms0_ps.cb0[2].xyz);
		r2.w = max(r2.w, float(0.100000001f));
		r2.z = r2.z / r2.w;
		r2.z = max(r2.z, float(0.100000001f));
		r2.z = min(r2.z, float(1.00000000f));
		r2.y = fma(r5.y, r3.y, r2.y);
		r2.w = r6.x * idx_uniforms0_ps.cb0[9].w;
		r2.z = saturate(fma(r2.w, float(6.00000000f), r2.z));
		r2.z = fma(idx_uniforms1_ps.cb1[31].z, r2.z, float(-1.00000000f));
		r2.z = r2.z * idx_uniforms1_ps.cb1[31].z;
		r2.z = fma(r2.y, r2.z, float(1.00000000f));
		r2.x = r2.x * r2.z;
		r2.x = r2.y * r2.x;
		r2.y = max(r6.z, float(0.0799999982f));
		r2.y = min(r2.y, float(1.00000000f));
		r2.y = min(r2.y, r4.x);
		r2.x = saturate(r2.x * r2.y);
		r2.y = -r2.x + float(1.00000000f);
		r2.z = -r5.y + float(1.00000000f);
		r2.y = r2.z * r2.y;
		r0.yzw = r0.yzw * r2.xxx;
		r0.yzw = fma(r1.xyz, r2.yyy, r0.yzw);
		r0.yzw = fma(r7.xzw, r8.xyz, r0.yzw);
		r1.x = saturate(r0.x * idx_uniforms0_ps.cb0[16].w);
		r1.y = fma(r7.y, idx_uniforms0_ps.cb0[16].z, -idx_uniforms0_ps.cb0[16].x);
		r1.y = min(r1.y, idx_uniforms0_ps.cb0[16].y);
		r1.y = -r1.y + float(1.00000000f);
		r1.x = fma(r1.x, r1.y, -idx_uniforms0_ps.cb0[14].w);
		r0.x = fma(r0.x, idx_uniforms0_ps.cb0[15].w, r1.x);
		r1.x = dot(idx_uniforms1_ps.cb1[37].xyz, r5.xzw);
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

