#version 460 core
// ps_5_0
// Checksum: c6f6a7a9_ea41ff38_996da0c8_0cd4b2f6
// Name: deferred_sunlight_debug_indoor

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[17]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[39]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2DArray resourceSamplerPair_1_ps; // res14, s15

uniform sampler2D resourceSamplerPair_2_ps; // res1, s0

uniform sampler2D resourceSamplerPair_3_ps; // res2, s1

uniform sampler2D resourceSamplerPair_4_ps; // res3, s0

uniform sampler2DArrayShadow resourceSamplerPair_5_ps; // res14, s14

uniform samplerCube resourceSamplerPair_6_ps; // res6, s3

uniform samplerCube resourceSamplerPair_7_ps; // res7, s3


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
	r0.x = fma(r0.x, idx_uniforms1_ps.cb1[0].x, idx_uniforms1_ps.cb1[0].y);
	r0.x = float(1.00000000f) / r0.x;
	r1.xyz = r0.xxx * v2.v.xyz;
	r2.xyz = fma(idx_uniforms1_ps.cb1[1].xyz, r1.xxx, idx_uniforms1_ps.cb1[4].xyz);
	r1.xyw = fma(idx_uniforms1_ps.cb1[2].xyz, r1.yyy, r2.xyz);
	r1.xyz = fma(idx_uniforms1_ps.cb1[3].xyz, r1.zzz, r1.xyw);
	r2.x = idx_uniforms1_ps.cb1[21].w;
	r2.z = uintBitsToFloat(uint(0x3f800000));
	r2.xyz = fma(r1.xyz, r2.xxz, idx_uniforms1_ps.cb1[21].xyz);
	r3.x = idx_uniforms1_ps.cb1[22].w;
	r3.z = uintBitsToFloat(uint(0x3f800000));
	r3.xyz = fma(r1.xyz, r3.xxz, idx_uniforms1_ps.cb1[22].xyz);
	r0.zw = fma(r1.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r4.xy = fma(r2.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r0.z = max(abs(r0.w), abs(r0.z));
	r0.w = max(abs(r4.y), abs(r4.x));
	r1.w = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r4.x = fract(r1.w);
	r1.w = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
	r4.y = fract(r1.w);
	r0.zw = r0.zw + r4.xx;
	r0.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(r0.zw, vec2(4.94999981f, 4.94999981f)))));
	r2.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.www), floatBitsToUint(r2.xyz), floatBitsToUint(r3.xyz)));
	r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.zzz), floatBitsToUint(r1.zxy), floatBitsToUint(r2.zxy)));
	r0.w = uintBitsToFloat(movc(floatBitsToUint(r0.w), uint(0x3f800000), uint(0x40000000)));
	r2.z = uintBitsToFloat(movc(floatBitsToUint(r0.z), uint(0x00000000), floatBitsToUint(r0.w)));
	r0.zw = r4.xy + vec2(-0.500000000f, -0.500000000f);
	r4.xy = r0.zw * vec2(0.00195312500f, 0.00195312500f);
	r5 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r1.yzyz);
	r2.xy = fma(r0.zw, vec2(0.00195312500f, 0.00195312500f), r5.xy);
	r5.xy = fma(-r0.zw, vec2(0.00195312500f, 0.00195312500f), r5.zw);
	r6 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r1.yzyz);
	r4.z = -1.f * r4.x;
	r7.xy = r4.yz + r6.xy;
	r6.xy = -r4.yz + r6.zw;
	r8 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(1.50000000f, 0.500000000f, -0.500000000f, 1.50000000f), r1.yzyz);
	r9.xy = -r4.yz + r8.xy;
	r4.xy = r4.yz + r8.zw;
	r8 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-1.50000000f, -0.500000000f, 0.500000000f, -1.50000000f), r1.yzyz);
	r10.xy = fma(r0.zw, vec2(0.00195312500f, 0.00195312500f), r8.xy);
	r8.xy = fma(-r0.zw, vec2(0.00195312500f, 0.00195312500f), r8.zw);
	r0.z = ((texture(resourceSamplerPair_1_ps, r2.xyz)).yzxw).z;
	r5.z = r2.z;
	r0.w = ((texture(resourceSamplerPair_1_ps, r5.xyz)).yzwx).w;
	r7.z = r5.z;
	r1.y = ((texture(resourceSamplerPair_1_ps, r7.xyz)).yxzw).y;
	r6.z = r7.z;
	r1.z = ((texture(resourceSamplerPair_1_ps, r6.xyz)).yzxw).z;
	r9.z = r6.z;
	r1.w = ((texture(resourceSamplerPair_1_ps, r9.xyz)).yzwx).w;
	r4.z = r9.z;
	r2.w = ((texture(resourceSamplerPair_1_ps, r4.xyz)).yzwx).w;
	r10.z = r4.z;
	r3.z = ((texture(resourceSamplerPair_1_ps, r10.xyz)).yzxw).z;
	r8.z = r10.z;
	r3.w = ((texture(resourceSamplerPair_1_ps, r8.xyz)).yzwx).w;
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r11 = (texture(resourceSamplerPair_2_ps, v1.v.xy));
		r12.xyz = ((texture(resourceSamplerPair_3_ps, v1.v.xy))).xyz;
		r12.xyz = fma(r12.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r13 = (texture(resourceSamplerPair_4_ps, v1.v.xy));
		r14.xyz = -r13.yyz + vec3(0.125000000f, 1.00000000f, 0.500000000f);
		r14.x = saturate(r14.x);
		r0.y = intBitsToFloat(r13.x < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
		r15.x = r13.x + r13.x;
		r15.yw = r13.xz + vec2(-0.501960814f, -0.500000000f);
		r16.xy = saturate(r15.yw + r15.yw);
		r15.z = uintBitsToFloat(uint(0x00000000));
		r16.z = uintBitsToFloat(uint(0x00000000));
		r15.xy = saturate(uintBitsToFloat(movc(floatBitsToUint(r0.yy), floatBitsToUint(r15.zx), floatBitsToUint(r16.xz))));
		r0.y = dot(-v2.v.xyz, -v2.v.xyz);
		r0.y = inversesqrt(r0.y);
		r16.xzw = r0.yyy * -v2.v.xyz;
		r17.xyz = fma(-v2.v.xyz, r0.yyy, -r12.xyz);
		r12.xyz = fma(r14.xxx, r17.xyz, r12.xyz);
		r4.w = dot(r12.xyz, r12.xyz);
		r4.w = inversesqrt(r4.w);
		r12.xyz = r4.www * r12.xyz;
		r4.w = r14.y * float(5.00000000f);
		r5.w = intBitsToFloat(r15.x == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		r6.w = saturate(r14.z + r14.z);
		r6.w = r6.w * r6.w;
		r17.y = r6.w * r6.w;
		r17.xz = r17.yy * vec2(0.800000012f, 0.800000012f);
		r17.w = min(r17.x, float(0.400000006f));
		r17.xyz = uintBitsToFloat(floatBitsToUint(r5.www) & floatBitsToUint(r17.yzw));
		r5.w = fma(r0.x, v2.v.y, idx_uniforms0_ps.cb0[4].y);
		r6.w = dot(r16.xzw, r12.xyz);
		r1.x = saturate(r1.x);
		r7.w = intBitsToFloat(float(0.00000000f) < r15.x ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r7.w) != uint(0))
		{
			r7.w = fma(r15.x, float(0.300000012f), float(0.0500000007f));
			r7.w = idx_uniforms1_ps.cb1[34].x / r7.w;
			r0.zw = -r0.zw + r1.xx;
			r0.zw = saturate(r7.ww * r0.zw);
			r0.z = -r0.z + float(1.00000000f);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r1.y + r1.x;
			r0.w = saturate(r7.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r1.z + r1.x;
			r0.w = saturate(r7.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r1.w + r1.x;
			r0.w = saturate(r7.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r2.w + r1.x;
			r0.w = saturate(r7.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r3.z + r1.x;
			r0.w = saturate(r7.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r3.w + r1.x;
			r0.w = saturate(r7.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.z = r0.z * float(0.125000000f);
			r0.z = r0.z * r0.z;
			r0.z = r0.z * r0.z;
		}
		else
		{
			r0.w = texture(resourceSamplerPair_5_ps, vec4(r2.xyz, r1.x));
			r1.y = texture(resourceSamplerPair_5_ps, vec4(r5.xyz, r1.x));
			r0.w = r0.w + r1.y;
			r1.y = texture(resourceSamplerPair_5_ps, vec4(r7.xyz, r1.x));
			r0.w = r0.w + r1.y;
			r1.y = texture(resourceSamplerPair_5_ps, vec4(r6.xyz, r1.x));
			r0.w = r0.w + r1.y;
			r1.y = texture(resourceSamplerPair_5_ps, vec4(r9.xyz, r1.x));
			r0.w = r0.w + r1.y;
			r1.y = texture(resourceSamplerPair_5_ps, vec4(r4.xyz, r1.x));
			r0.w = r0.w + r1.y;
			r1.y = texture(resourceSamplerPair_5_ps, vec4(r10.xyz, r1.x));
			r0.w = r0.w + r1.y;
			r1.x = texture(resourceSamplerPair_5_ps, vec4(r8.xyz, r1.x));
			r0.w = r0.w + r1.x;
			r0.z = r0.w * float(0.125000000f);
		}
		r0.w = saturate(fma(r12.y, float(0.500000000f), float(0.500000000f)));
		r1.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
		r1.xyz = fma(r0.www, r1.xyz, idx_uniforms0_ps.cb0[11].xyz);
		r0.w = dot(r12.xyz, -idx_uniforms0_ps.cb0[3].xyz);
		r1.w = r17.z + r0.w;
		r2.x = r17.z + float(1.00000000f);
		r1.w = saturate(r1.w / r2.x);
		r2.x = r1.w + float(-1.00000000f);
		r2.x = fma(r17.y, r2.x, float(1.00000000f));
		r1.w = r1.w * r2.x;
		r2.x = fma(r13.w, idx_uniforms1_ps.cb1[35].x, idx_uniforms1_ps.cb1[36].x);
		r2.yzw = r1.xyz * idx_uniforms1_ps.cb1[0].zzz;
		r3.z = saturate(fma(r13.z, float(2.00000000f), float(-1.00000000f)));
		r3.z = fma(r3.z, float(0.649999976f), float(0.0500000007f));
		r3.w = -r3.z + float(1.00000000f);
		r4.x = saturate(fma(r6.w, float(0.899999976f), float(0.100000001f)));
		r4.x = -r4.x + float(1.00100005f);
		r4.x = min(r4.x, float(1.00000000f));
		r4.y = r4.x * r4.x;
		r4.y = r4.y * r4.y;
		r4.x = r4.y * r4.x;
		r3.z = fma(r3.w, r4.x, r3.z);
		r4.xyz = r11.xyz + vec3(0.00999999978f, 0.00999999978f, 0.00999999978f);
		r3.w = dot(r4.xyz, r4.xyz);
		r3.w = inversesqrt(r3.w);
		r4.xyz = fma(r4.xyz, r3.www, vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r4.xyz = fma(r16.yyy, r4.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
		r2.xyz = r2.xxx * r2.yzw;
		r5.xyz = r11.xyz * r2.xyz;
		r2.w = r6.w + r6.w;
		r6.xyz = fma(r2.www, r12.xyz, -r16.xzw);
		r7.xy = r6.zz * idx_uniforms1_ps.cb1[33].yw;
		r7.xz = fma(-r6.xx, idx_uniforms1_ps.cb1[33].xz, r7.xy);
		r8.xy = r6.zz * idx_uniforms1_ps.cb1[38].yw;
		r8.xz = fma(-r6.xx, idx_uniforms1_ps.cb1[38].xz, r8.xy);
		r7.y = r6.y;
		r6.xyz = ((textureLod(resourceSamplerPair_6_ps, r7.xyz, r4.w))).xyz;
		r8.y = r7.y;
		r7.xyz = ((textureLod(resourceSamplerPair_7_ps, r8.xyz, r4.w))).xyz;
		r7.xyz = -r6.xyz + r7.xyz;
		r6.xyz = fma(idx_uniforms1_ps.cb1[0].www, r7.xyz, r6.xyz);
		r7.xyz = r4.xyz * r6.xyz;
		r7.xyz = r7.xyz * idx_uniforms1_ps.cb1[20].zzz;
		r2.w = saturate(fma(-r13.z, float(2.00000000f), float(1.00000000f)));
		r2.w = r2.w + r2.w;
		r2.w = max(r15.x, r2.w);
		r3.w = r13.y * float(3.00000000f);
		r4.w = fma(-r15.x, float(8.00000000f), float(1.00000000f));
		r3.w = saturate(fma(r3.w, r4.w, float(-1.00000000f)));
		r8.xy = r2.ww + vec2(2.00000000f, 1.00000000f);
		r2.w = fma(r13.w, r8.x, -r8.y);
		r8.xy = fma(r13.wz, vec2(1.60000002f, 4.59999990f), vec2(0.200000003f, -1.29999995f));
		r3.w = max(r3.w, r16.y);
		r4.w = -r2.w + r8.x;
		r2.w = saturate(fma(r3.w, r4.w, r2.w));
		r3.w = dot(vec3(0.212500006f, 0.715399981f, 0.0720999986f), idx_uniforms0_ps.cb0[10].zzz);
		r3.w = r3.w * float(3.00000000f);
		r4.w = dot(vec3(0.212500006f, 0.715399981f, 0.0720999986f), idx_uniforms0_ps.cb0[2].xyz);
		r4.w = max(r4.w, float(0.100000001f));
		r3.w = r3.w / r4.w;
		r3.w = max(r3.w, float(0.100000001f));
		r3.zw = min(r3.zw, vec2(1.00000000f, 1.00000000f));
		r4.w = fma(r16.y, r14.y, r13.y);
		r7.w = r1.w * idx_uniforms0_ps.cb0[9].w;
		r3.w = saturate(fma(r7.w, float(6.00000000f), r3.w));
		r3.w = fma(idx_uniforms1_ps.cb1[31].z, r3.w, float(-1.00000000f));
		r3.w = r3.w * idx_uniforms1_ps.cb1[31].z;
		r3.w = fma(r4.w, r3.w, float(1.00000000f));
		r2.w = r2.w * r3.w;
		r2.w = r4.w * r2.w;
		r3.w = max(r8.y, float(0.0799999982f));
		r3.w = min(r3.w, float(1.00000000f));
		r3.w = min(r3.w, r3.z);
		r2.w = saturate(r2.w * r3.w);
		r3.w = -r2.w + float(1.00000000f);
		r4.w = -r16.y + float(1.00000000f);
		r3.w = r3.w * r4.w;
		r7.xyz = r2.www * r7.xyz;
		r8.xyz = fma(r5.xyz, r3.www, r7.xyz);
		r3.w = saturate(r0.x * idx_uniforms0_ps.cb0[16].w);
		r4.w = fma(r5.w, idx_uniforms0_ps.cb0[16].z, -idx_uniforms0_ps.cb0[16].x);
		r4.w = min(r4.w, idx_uniforms0_ps.cb0[16].y);
		r4.w = -r4.w + float(1.00000000f);
		r3.w = fma(r3.w, r4.w, -idx_uniforms0_ps.cb0[14].w);
		r0.x = fma(r0.x, idx_uniforms0_ps.cb0[15].w, r3.w);
		r3.w = dot(idx_uniforms1_ps.cb1[37].xyz, r16.xzw);
		r3.w = r3.w + float(0.500000000f);
		r9.x = uintBitsToFloat(uint(0x3f800000));
		r9.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
		r9 = -r0.xxxx * r9;
		r9 = exp2(r9);
		r9 = min(r9, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
		r0.x = -r9.x + float(1.00000000f);
		r4.w = r3.w * r3.w;
		r3.w = r3.w * r4.w;
		r10.xyz = fma(r3.www, idx_uniforms0_ps.cb0[14].xyz, idx_uniforms0_ps.cb0[15].xyz);
		r10.xyz = r0.xxx * r10.xyz;
		r8.xyz = fma(r8.xyz, r9.yzw, r10.xyz);
		{ float src = idx_uniforms1_ps.cb1[13].x; r0.x = sin(src); r9.x = cos(src); }
		r9.zw = vec2(0.500000000f, 0.500000000f) / idx_uniforms0_ps.cb0[8].zw;
		r9.zw = -r9.zw + v0.xy;
		r9.y = r0.x;
		r0.x = dot(r9.zw, r9.xy);
		r0.x = r0.x + idx_uniforms1_ps.cb1[13].y;
		r0.x = intBitsToFloat(r0.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r0.x) != uint(0))
		{
			r0.x = fma(r13.y, float(8.00000000f), float(1.00000000f));
			r0.x = exp2(r0.x);
			r3.w = fma(r16.y, float(4.00000000f), float(9.99999975e-05f));
			r9.xyz = fma(-v2.v.xyz, r0.yyy, -idx_uniforms0_ps.cb0[3].xyz);
			r0.y = dot(r9.xyz, r9.xyz);
			r0.y = inversesqrt(r0.y);
			r9.xyz = r0.yyy * r9.xyz;
			r6.w = saturate(r6.w);
			r3.xy = fma(r3.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
			r0.y = max(abs(r3.y), abs(r3.x));
			r0.y = saturate(r0.y + float(-4.00000000f));
			r0.y = r0.y + r0.z;
			r0.z = fma(r1.w, r6.w, float(9.99999975e-05f));
			r0.z = log2(r0.z);
			r0.z = r0.z * r3.w;
			r0.z = exp2(r0.z);
			r0.z = r1.w * r0.z;
			r0.yz = min(r0.yz, vec2(1.00000000f, 1.00000000f));
			r0.w = saturate(fma(r15.y, float(0.500000000f), -r0.w));
			r0.z = fma(r0.w, r15.y, r0.z);
			r0.w = r0.x + float(8.00000000f);
			r0.w = r0.w * float(0.0398089178f);
			r0.x = fma(r0.x, float(1.44269502f), float(1.44269502f));
			r3.x = dot(r9.xyz, r12.xyz);
			r0.x = fma(r0.x, r3.x, -r0.x);
			r0.x = exp2(r0.x);
			r0.xz = min(r0.xz, vec2(1.00000000f, 1.00000000f));
			r0.x = r0.x * r0.w;
			r9 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(0.00000000f, 1.00000000f, 2.00000000f, 3.00000000f)))));
			r3.xyw = uintBitsToFloat(movc(floatBitsToUint(r9.xxx), floatBitsToUint(r11.xyz), floatBitsToUint(r8.xyz)));
			r10.xyz = fma(r12.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
			r3.xyw = uintBitsToFloat(movc(floatBitsToUint(r9.yyy), floatBitsToUint(r10.xyz), floatBitsToUint(r3.xyw)));
			r3.xyw = uintBitsToFloat(movc(floatBitsToUint(r9.zzz), floatBitsToUint(r13.xxx), floatBitsToUint(r3.xyw)));
			r3.xyw = uintBitsToFloat(movc(floatBitsToUint(r9.www), floatBitsToUint(r13.yyy), floatBitsToUint(r3.xyw)));
			r9 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(4.00000000f, 5.00000000f, 6.00000000f, 7.00000000f)))));
			r3.xyw = uintBitsToFloat(movc(floatBitsToUint(r9.xxx), floatBitsToUint(r13.zzz), floatBitsToUint(r3.xyw)));
			r3.xyw = uintBitsToFloat(movc(floatBitsToUint(r9.yyy), floatBitsToUint(r13.www), floatBitsToUint(r3.xyw)));
			r3.xyw = uintBitsToFloat(movc(floatBitsToUint(r9.zzz), uvec3(0x00000000, 0x00000000, 0x00000000), floatBitsToUint(r3.xyw)));
			r3.xyw = uintBitsToFloat(movc(floatBitsToUint(r9.www), floatBitsToUint(r0.zzz), floatBitsToUint(r3.xyw)));
			r9 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(8.00000000f, 9.00000000f, 10.0000000f, 11.0000000f)))));
			r0.z = uintBitsToFloat(floatBitsToUint(r9.y) | floatBitsToUint(r9.x));
			r3.xyw = uintBitsToFloat(movc(floatBitsToUint(r0.zzz), uvec3(0x00000000, 0x00000000, 0x00000000), floatBitsToUint(r3.xyw)));
			r0.z = r13.w * r1.w;
			r0.z = r0.z * idx_uniforms0_ps.cb0[9].w;
			r0.x = r0.x * r0.z;
			r0.x = r3.z * r0.x;
			r0.xzw = uintBitsToFloat(movc(floatBitsToUint(r9.zzz), floatBitsToUint(r0.xxx), floatBitsToUint(r3.xyw)));
			r4.xyz = saturate(r4.xyz);
			r0.xzw = uintBitsToFloat(movc(floatBitsToUint(r9.www), floatBitsToUint(r4.xyz), floatBitsToUint(r0.xzw)));
			r4 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(12.0000000f, 13.0000000f, 14.0000000f, 15.0000000f)))));
			r0.xzw = uintBitsToFloat(movc(floatBitsToUint(r4.xxx), uvec3(0x00000000, 0x00000000, 0x00000000), floatBitsToUint(r0.xzw)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.yyy), floatBitsToUint(r0.yyy), floatBitsToUint(r0.xzw)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.zzz), floatBitsToUint(idx_uniforms0_ps.cb0[9].www), floatBitsToUint(r0.xyz)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.www), floatBitsToUint(r3.zzz), floatBitsToUint(r0.xyz)));
			r3 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(16.0000000f, 17.0000000f, 18.0000000f, 19.0000000f)))));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r3.xxx), floatBitsToUint(r6.xyz), floatBitsToUint(r0.xyz)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r3.yyy), floatBitsToUint(r2.www), floatBitsToUint(r0.xyz)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r3.zzz), floatBitsToUint(r7.xyz), floatBitsToUint(r0.xyz)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r3.www), floatBitsToUint(r1.xyz), floatBitsToUint(r0.xyz)));
			r1 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(20.0000000f, 21.0000000f, 22.0000000f, 23.0000000f)))));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), floatBitsToUint(r2.xyz), floatBitsToUint(r0.xyz)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.yyy), floatBitsToUint(r5.xyz), floatBitsToUint(r0.xyz)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.zzz), floatBitsToUint(r17.xxx), floatBitsToUint(r0.xyz)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.www), floatBitsToUint(r15.xxx), floatBitsToUint(r0.xyz)));
			r1.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(equal(idx_uniforms1_ps.cb1[13].zz, vec2(24.0000000f, 25.0000000f)))));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), floatBitsToUint(r15.yyy), floatBitsToUint(r0.xyz)));
			r11.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.yyy), floatBitsToUint(r14.xxx), floatBitsToUint(r0.xyz)));
		}
		else
		{
			r11.xyz = r8.xyz;
		}
		o0 = r11;
	}
	else
	{
		o0 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	}
	return;
}

