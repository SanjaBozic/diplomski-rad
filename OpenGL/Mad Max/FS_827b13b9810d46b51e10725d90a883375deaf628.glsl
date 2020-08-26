#version 460 core
// ps_5_0
// Checksum: a363ed85_d91aa4d2_51971e7e_f00f84ec
// Name: deferred_sunlight_clt_clfot

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[17]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[39]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2DArray resourceSamplerPair_1_ps; // res14, s15

uniform sampler2D resourceSamplerPair_2_ps; // res8, s2

uniform sampler2D resourceSamplerPair_3_ps; // res1, s0

uniform sampler2D resourceSamplerPair_4_ps; // res2, s1

uniform sampler2D resourceSamplerPair_5_ps; // res3, s0

uniform sampler2DArrayShadow resourceSamplerPair_6_ps; // res14, s14

uniform samplerCube resourceSamplerPair_7_ps; // res6, s3

uniform samplerCube resourceSamplerPair_8_ps; // res7, s3


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
	r2.xyz = fma(r0.xxx, v2.v.xyz, idx_uniforms0_ps.cb0[4].xyz);
	r3.xyz = fma(idx_uniforms1_ps.cb1[1].xyz, r1.xxx, idx_uniforms1_ps.cb1[4].xyz);
	r1.xyw = fma(idx_uniforms1_ps.cb1[2].xyz, r1.yyy, r3.xyz);
	r1.xyz = fma(idx_uniforms1_ps.cb1[3].xyz, r1.zzz, r1.xyw);
	r3.x = idx_uniforms1_ps.cb1[21].w;
	r3.z = uintBitsToFloat(uint(0x3f800000));
	r3.xyz = fma(r1.xyz, r3.xxz, idx_uniforms1_ps.cb1[21].xyz);
	r4.x = idx_uniforms1_ps.cb1[22].w;
	r4.z = uintBitsToFloat(uint(0x3f800000));
	r4.xyz = fma(r1.xyz, r4.xxz, idx_uniforms1_ps.cb1[22].xyz);
	r0.zw = fma(r1.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r5.xy = fma(r3.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r0.z = max(abs(r0.w), abs(r0.z));
	r0.w = max(abs(r5.y), abs(r5.x));
	r1.w = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r5.x = fract(r1.w);
	r1.w = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
	r5.y = fract(r1.w);
	r0.zw = r0.zw + r5.xx;
	r0.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(r0.zw, vec2(4.94999981f, 4.94999981f)))));
	r3.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.www), floatBitsToUint(r3.xyz), floatBitsToUint(r4.xyz)));
	r3.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.zzz), floatBitsToUint(r1.zxy), floatBitsToUint(r3.zxy)));
	r0.w = uintBitsToFloat(movc(floatBitsToUint(r0.w), uint(0x3f800000), uint(0x40000000)));
	r6.z = uintBitsToFloat(movc(floatBitsToUint(r0.z), uint(0x00000000), floatBitsToUint(r0.w)));
	r0.zw = r5.xy + vec2(-0.500000000f, -0.500000000f);
	r5.xy = r0.zw * vec2(0.00195312500f, 0.00195312500f);
	r7 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r3.yzyz);
	r6.xy = fma(r0.zw, vec2(0.00195312500f, 0.00195312500f), r7.xy);
	r7.xy = fma(-r0.zw, vec2(0.00195312500f, 0.00195312500f), r7.zw);
	r8 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r3.yzyz);
	r5.z = -1.f * r5.x;
	r9.xy = r5.yz + r8.xy;
	r8.xy = -r5.yz + r8.zw;
	r10 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(1.50000000f, 0.500000000f, -0.500000000f, 1.50000000f), r3.yzyz);
	r11.xy = -r5.yz + r10.xy;
	r5.xy = r5.yz + r10.zw;
	r10 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-1.50000000f, -0.500000000f, 0.500000000f, -1.50000000f), r3.yzyz);
	r12.xy = fma(r0.zw, vec2(0.00195312500f, 0.00195312500f), r10.xy);
	r10.xy = fma(-r0.zw, vec2(0.00195312500f, 0.00195312500f), r10.zw);
	r0.z = ((texture(resourceSamplerPair_1_ps, r6.xyz)).yzxw).z;
	r7.z = r6.z;
	r0.w = ((texture(resourceSamplerPair_1_ps, r7.xyz)).yzwx).w;
	r9.z = r7.z;
	r1.z = ((texture(resourceSamplerPair_1_ps, r9.xyz)).yzxw).z;
	r8.z = r9.z;
	r1.w = ((texture(resourceSamplerPair_1_ps, r8.xyz)).yzwx).w;
	r11.z = r8.z;
	r2.w = ((texture(resourceSamplerPair_1_ps, r11.xyz)).yzwx).w;
	r5.z = r11.z;
	r3.y = ((texture(resourceSamplerPair_1_ps, r5.xyz)).yxzw).y;
	r12.z = r5.z;
	r3.z = ((texture(resourceSamplerPair_1_ps, r12.xyz)).yzxw).z;
	r10.z = r12.z;
	r3.w = ((texture(resourceSamplerPair_1_ps, r10.xyz)).yzwx).w;
	r4.zw = r2.xz + -idx_uniforms1_ps.cb1[29].xz;
	r4.zw = fma(r4.zw, vec2(0.00130208337f, 0.00130208337f), vec2(0.501953125f, 0.501953125f));
	r13 = (texture(resourceSamplerPair_2_ps, r4.zw));
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r14 = (texture(resourceSamplerPair_3_ps, v1.v.xy));
		r15.xyz = ((texture(resourceSamplerPair_4_ps, v1.v.xy))).xyz;
		r15.xyz = fma(r15.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r16 = (texture(resourceSamplerPair_5_ps, v1.v.xy));
		r17.xyz = -r16.yyz + vec3(0.125000000f, 1.00000000f, 0.500000000f);
		r17.x = saturate(r17.x);
		r0.y = intBitsToFloat(r16.x < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
		r18.x = r16.x + r16.x;
		r4.zw = r16.xz + vec2(-0.501960814f, -0.500000000f);
		r19.xy = saturate(r4.zw + r4.zw);
		r18.z = uintBitsToFloat(uint(0x00000000));
		r19.z = uintBitsToFloat(uint(0x00000000));
		r18.xyz = saturate(uintBitsToFloat(movc(floatBitsToUint(r0.yyy), floatBitsToUint(r18.xzz), floatBitsToUint(r19.zxx))));
		r0.y = dot(-v2.v.xyz, -v2.v.xyz);
		r0.y = inversesqrt(r0.y);
		r19.xzw = r0.yyy * -v2.v.xyz;
		r20.xyz = fma(-v2.v.xyz, r0.yyy, -r15.xyz);
		r15.xyz = fma(r17.xxx, r20.xyz, r15.xyz);
		r4.z = dot(r15.xyz, r15.xyz);
		r4.z = inversesqrt(r4.z);
		r15.xyz = r4.zzz * r15.xyz;
		r4.z = r16.y * float(3.00000000f);
		r20.xyz = fma(r16.ywz, vec3(8.00000000f, 1.60000002f, 4.59999990f), vec3(1.00000000f, 0.200000003f, -1.29999995f));
		r4.w = exp2(r20.x);
		r5.w = r17.y * float(5.00000000f);
		r6.w = intBitsToFloat(r18.z == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		r7.w = saturate(r17.z + r17.z);
		r7.w = r7.w * r7.w;
		r7.w = r7.w * r7.w;
		r21.x = r7.w * float(0.800000012f);
		r21.y = min(r21.x, float(0.400000006f));
		r17.xz = uintBitsToFloat(floatBitsToUint(r6.ww) & floatBitsToUint(r21.xy));
		r6.w = fma(r19.y, float(4.00000000f), float(9.99999975e-05f));
		r21.xyz = fma(-v2.v.xyz, r0.yyy, -idx_uniforms0_ps.cb0[3].xyz);
		r7.w = dot(r21.xyz, r21.xyz);
		r7.w = inversesqrt(r7.w);
		r21.xyz = r7.www * r21.xyz;
		r7.w = dot(r19.xzw, r15.xyz);
		r8.w = saturate(r7.w);
		r4.xy = fma(r4.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r4.x = max(abs(r4.y), abs(r4.x));
		r3.x = saturate(r3.x);
		r4.y = intBitsToFloat(float(0.00000000f) < r18.z ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r9.w = fma(r18.z, float(0.300000012f), float(0.0500000007f));
			r9.w = idx_uniforms1_ps.cb1[34].x / r9.w;
			r0.zw = -r0.zw + r3.xx;
			r0.zw = saturate(r9.ww * r0.zw);
			r0.z = -r0.z + float(1.00000000f);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r1.z + r3.x;
			r0.w = saturate(r9.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r1.w + r3.x;
			r0.w = saturate(r9.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r2.w + r3.x;
			r0.w = saturate(r9.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r3.y + r3.x;
			r0.w = saturate(r9.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r3.z + r3.x;
			r0.w = saturate(r9.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r3.w + r3.x;
			r0.w = saturate(r9.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.z = r0.z * float(0.125000000f);
			r0.z = r0.z * r0.z;
			r0.z = r0.z * r0.z;
		}
		else
		{
			r0.w = texture(resourceSamplerPair_6_ps, vec4(r6.xyz, r3.x));
			r1.z = texture(resourceSamplerPair_6_ps, vec4(r7.xyz, r3.x));
			r0.w = r0.w + r1.z;
			r1.z = texture(resourceSamplerPair_6_ps, vec4(r9.xyz, r3.x));
			r0.w = r0.w + r1.z;
			r1.z = texture(resourceSamplerPair_6_ps, vec4(r8.xyz, r3.x));
			r0.w = r0.w + r1.z;
			r1.z = texture(resourceSamplerPair_6_ps, vec4(r11.xyz, r3.x));
			r0.w = r0.w + r1.z;
			r1.z = texture(resourceSamplerPair_6_ps, vec4(r5.xyz, r3.x));
			r0.w = r0.w + r1.z;
			r1.z = texture(resourceSamplerPair_6_ps, vec4(r12.xyz, r3.x));
			r0.w = r0.w + r1.z;
			r1.z = texture(resourceSamplerPair_6_ps, vec4(r10.xyz, r3.x));
			r0.w = r0.w + r1.z;
			r0.z = r0.w * float(0.125000000f);
		}
		r0.w = saturate(r4.x + float(-4.00000000f));
		r0.z = r0.w + r0.z;
		r0.z = min(r0.z, float(1.00000000f));
		r0.w = saturate(fma(r15.y, float(0.500000000f), float(0.500000000f)));
		r3.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
		r3.xyz = fma(r0.www, r3.xyz, idx_uniforms0_ps.cb0[11].xyz);
		r0.w = dot(r15.xyz, -idx_uniforms0_ps.cb0[3].xyz);
		r1.z = r17.z + r0.w;
		r1.w = r17.z + float(1.00000000f);
		r1.z = saturate(r1.z / r1.w);
		r1.w = r1.z + float(-1.00000000f);
		r1.w = fma(r17.x, r1.w, float(1.00000000f));
		r1.z = r1.w * r1.z;
		r1.w = fma(r1.z, r8.w, float(9.99999975e-05f));
		r1.w = log2(r1.w);
		r1.w = r1.w * r6.w;
		r1.w = exp2(r1.w);
		r1.w = r1.z * r1.w;
		r1.w = min(r1.w, float(1.00000000f));
		r2.w = r18.y * float(2.50000000f);
		r3.w = saturate(fma(r18.x, float(0.500000000f), -r0.w));
		r1.w = fma(r3.w, r18.x, r1.w);
		r1.w = min(r1.w, float(1.00000000f));
		r5.xyz = fma(r16.www, idx_uniforms1_ps.cb1[35].xyz, idx_uniforms1_ps.cb1[36].xyz);
		r3.w = saturate(r5.y + idx_uniforms1_ps.cb1[35].w);
		r3.w = r3.w + -idx_uniforms1_ps.cb1[35].w;
		r4.x = -idx_uniforms1_ps.cb1[35].w + float(1.00000000f);
		r3.w = r3.w / r4.x;
		r1.xy = fma(r1.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -25.0000000f));
		r1.x = max(abs(r1.y), abs(r1.x));
		r1.x = saturate(r1.x + float(-3.70000005f));
		r1.x = -r1.x + float(1.00000000f);
		r1.y = fma(idx_uniforms1_ps.cb1[34].y, float(0.0480000004f), float(1.00000000f));
		r1.x = r1.x / r1.y;
		r1.y = r0.w + float(0.300000012f);
		r1.y = saturate(r1.y * float(0.769230783f));
		r1.y = r0.z * r1.y;
		r4.x = r1.y * float(5.00000000f);
		r4.x = min(r4.x, float(1.00000000f));
		r6.xyz = fma(r4.xxx, vec3(0.100000001f, 0.790000021f, 0.939999998f), vec3(0.899999976f, 0.209999993f, 0.0599999987f));
		r6.xyz = r3.www * r6.xyz;
		r0.w = -r0.w + float(0.150000006f);
		r0.w = saturate(r0.w + r0.w);
		r0.w = r0.w * r0.z;
		r7.xyz = r0.www * vec3(0.200000003f, 0.0460000001f, 0.00999999978f);
		r0.w = min(r2.w, float(1.00000000f));
		r7.xyz = r0.www * r7.xyz;
		r7.xyz = r1.xxx * r7.xyz;
		r6.xyz = fma(r6.xyz, r1.yyy, r7.xyz);
		r0.w = r0.z * r1.w;
		r0.w = r3.w * r0.w;
		r6.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.yyy), floatBitsToUint(r6.xyz), floatBitsToUint(r0.www)));
		r3.xyz = r3.xyz * idx_uniforms1_ps.cb1[0].zzz;
		r0.w = saturate(fma(r16.z, float(2.00000000f), float(-1.00000000f)));
		r0.w = fma(r0.w, float(0.649999976f), float(0.0500000007f));
		r1.x = -r0.w + float(1.00000000f);
		r1.y = saturate(fma(r7.w, float(0.899999976f), float(0.100000001f)));
		r1.y = -r1.y + float(1.00100005f);
		r1.y = min(r1.y, float(1.00000000f));
		r2.w = r1.y * r1.y;
		r2.w = r2.w * r2.w;
		r1.y = r1.y * r2.w;
		r0.w = fma(r1.x, r1.y, r0.w);
		r0.w = min(r0.w, float(1.00000000f));
		r1.x = r4.w + float(8.00000000f);
		r1.x = r1.x * float(0.0398089178f);
		r1.y = fma(r4.w, float(1.44269502f), float(1.44269502f));
		r2.w = dot(r21.xyz, r15.xyz);
		r2.w = fma(r1.y, r2.w, -r1.y);
		r2.w = exp2(r2.w);
		r2.w = min(r2.w, float(1.00000000f));
		r2.w = r1.x * r2.w;
		r7.xyz = r14.xyz + vec3(0.00999999978f, 0.00999999978f, 0.00999999978f);
		r3.w = dot(r7.xyz, r7.xyz);
		r3.w = inversesqrt(r3.w);
		r7.xyz = fma(r7.xyz, r3.www, vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7.xyz = fma(r19.yyy, r7.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
		r8.xyz = r7.xyz * idx_uniforms0_ps.cb0[1].xyz;
		r8.xyz = r1.zzz * r8.xyz;
		r8.xyz = r16.www * r8.xyz;
		r8.xyz = r0.zzz * r8.xyz;
		r8.xyz = r2.www * r8.xyz;
		r1.x = r1.x * r16.w;
		r1.x = r0.w * r1.x;
		r2.w = r1.z * r2.w;
		r2.w = r0.w * r2.w;
		r9.xyz = -r2.xyz + idx_uniforms1_ps.cb1[19].xyz;
		r3.w = dot(r9.xyz, r9.xyz);
		r3.w = sqrt(r3.w);
		r4.x = dot(idx_uniforms1_ps.cb1[18].xyz, r15.xyz);
		r4.w = r4.x + float(0.250000000f);
		r4.w = r4.w * float(0.800000012f);
		r4.x = saturate(uintBitsToFloat(movc(floatBitsToUint(r4.y), floatBitsToUint(r4.w), floatBitsToUint(r4.x))));
		r9.xyz = fma(-v2.v.xyz, r0.yyy, idx_uniforms1_ps.cb1[18].xyz);
		r4.y = dot(r9.xyz, r9.xyz);
		r4.y = inversesqrt(r4.y);
		r9.xyz = r4.yyy * r9.xyz;
		r4.y = r4.x * idx_uniforms1_ps.cb1[17].x;
		r4.x = r1.x * r4.x;
		r4.w = dot(r9.xyz, r15.xyz);
		r4.w = fma(r1.y, r4.w, -r1.y);
		r4.w = exp2(r4.w);
		r4.w = min(r4.w, float(1.00000000f));
		r4.x = r4.w * r4.x;
		r4.x = r4.x * idx_uniforms1_ps.cb1[17].y;
		r3.w = r3.w / idx_uniforms1_ps.cb1[19].w;
		r3.w = saturate(-r3.w + float(1.00000000f));
		r4.y = r3.w * r4.y;
		r3.w = r3.w * r4.x;
		r9.xyz = -r2.xyz + idx_uniforms1_ps.cb1[27].xyz;
		r2.x = dot(r9.xyz, r9.xyz);
		r2.x = sqrt(r2.x);
		r2.x = r2.x / idx_uniforms1_ps.cb1[27].w;
		r2.x = saturate(-r2.x + float(1.00000000f));
		r1.w = r1.w * r2.x;
		r2.x = r2.x * r2.w;
		r9.xyz = r1.www * idx_uniforms1_ps.cb1[25].xyz;
		r4.xyw = fma(idx_uniforms1_ps.cb1[16].xyz, r4.yyy, r9.xyz);
		r2.xzw = r2.xxx * idx_uniforms1_ps.cb1[26].xyz;
		r2.xzw = fma(idx_uniforms1_ps.cb1[16].xyz, r3.www, r2.xzw);
		r3.xyz = r5.xxx * r3.xyz;
		r1.w = dot(idx_uniforms1_ps.cb1[31].xy, idx_uniforms1_ps.cb1[31].xy);
		r1.w = intBitsToFloat(r1.w != float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r1.w) != uint(0))
		{
			r9.xy = r17.zz + vec2(0.300000012f, 1.29999995f);
			r5.y = r13.w * float(128.000000f);
			r5.x = fma(r13.w, float(128.000000f), idx_uniforms1_ps.cb1[28].w);
			r5.xy = r2.yy + -r5.xy;
			r10.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(r5.xy, vec2(0.00000000f, 0.00000000f)))));
			r10.xy = uintBitsToFloat(movc(floatBitsToUint(r10.xy), floatBitsToUint(idx_uniforms1_ps.cb1[30].yy), floatBitsToUint(idx_uniforms1_ps.cb1[30].xx)));
			r5.xy = saturate(r5.xy * r10.xy);
			r5.xy = -r5.xy + vec2(1.00000000f, 1.00000000f);
			r1.w = dot(idx_uniforms1_ps.cb1[28].xyz, r15.xyz);
			r9.z = -1.f * r9.x;
			r10.xy = r1.ww + r9.xz;
			r9.w = -r9.x + float(-1.00000000f);
			r9.xy = r10.xy / r9.yw;
			r5.xy = r5.xy * r5.xy;
			r5.xy = saturate(r9.xy * r5.xy);
			r5.xy = r5.xy * idx_uniforms1_ps.cb1[31].xy;
			r1.w = r5.y + r5.x;
			r9.xyz = r1.www * r13.xyz;
			r10.xyz = fma(-v2.v.xyz, r0.yyy, idx_uniforms1_ps.cb1[28].xyz);
			r0.y = dot(r10.xyz, r10.xyz);
			r0.y = inversesqrt(r0.y);
			r10.xyz = r0.yyy * r10.xyz;
			r11.xyz = r9.xyz * idx_uniforms0_ps.cb0[2].xyz;
			r9.xyz = r9.xyz * idx_uniforms0_ps.cb0[1].xyz;
			r9.xyz = r1.xxx * r9.xyz;
			r0.y = dot(r10.xyz, r15.xyz);
			r0.y = fma(r1.y, r0.y, -r1.y);
			r0.y = exp2(r0.y);
			r0.y = min(r0.y, float(1.00000000f));
			r1.xyw = r0.yyy * r9.xyz;
		}
		else
		{
			r11.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
			r1.xyw = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
		}
		r0.y = -r5.z + float(1.00000000f);
		r0.y = fma(r17.z, r0.y, r5.z);
		r9.xyz = r0.yyy * r11.xyz;
		r4.xyw = fma(r4.xyw, r5.zzz, r9.xyz);
		r1.xyw = r0.yyy * r1.xyw;
		r1.xyw = fma(r2.xzw, r5.zzz, r1.xyw);
		r1.xyw = r7.xyz * r1.xyw;
		r2.xzw = fma(idx_uniforms0_ps.cb0[2].xyz, r6.xyz, r3.xyz);
		r2.xzw = r4.xyw + r2.xzw;
		r2.xzw = r14.xyz * r2.xzw;
		r0.y = r7.w + r7.w;
		r3.xyz = fma(r0.yyy, r15.xyz, -r19.xzw);
		r4.xy = r3.zz * idx_uniforms1_ps.cb1[33].yw;
		r5.xz = fma(-r3.xx, idx_uniforms1_ps.cb1[33].xz, r4.xy);
		r3.zw = r3.zz * idx_uniforms1_ps.cb1[38].yw;
		r6.xz = fma(-r3.xx, idx_uniforms1_ps.cb1[38].xz, r3.zw);
		r5.y = r3.y;
		r3.xyz = ((textureLod(resourceSamplerPair_7_ps, r5.xyz, r5.w))).xyz;
		r6.y = r5.y;
		r4.xyw = ((textureLod(resourceSamplerPair_8_ps, r6.xyz, r5.w)).xywz).xyw;
		r4.xyw = -r3.xyz + r4.xyw;
		r3.xyz = fma(idx_uniforms1_ps.cb1[0].www, r4.xyw, r3.xyz);
		r3.xyz = r7.xyz * r3.xyz;
		r3.xyz = r3.xyz * idx_uniforms1_ps.cb1[20].zzz;
		r0.y = saturate(fma(-r16.z, float(2.00000000f), float(1.00000000f)));
		r0.y = r0.y + r0.y;
		r0.y = max(r18.z, r0.y);
		r3.w = fma(-r18.z, float(8.00000000f), float(1.00000000f));
		r3.w = saturate(fma(r4.z, r3.w, float(-1.00000000f)));
		r4.xy = r0.yy + vec2(2.00000000f, 1.00000000f);
		r0.y = fma(r16.w, r4.x, -r4.y);
		r3.w = max(r3.w, r19.y);
		r4.x = -r0.y + r20.y;
		r0.y = saturate(fma(r3.w, r4.x, r0.y));
		r3.w = dot(vec3(0.212500006f, 0.715399981f, 0.0720999986f), idx_uniforms0_ps.cb0[10].zzz);
		r3.w = r3.w * float(3.00000000f);
		r4.x = dot(vec3(0.212500006f, 0.715399981f, 0.0720999986f), idx_uniforms0_ps.cb0[2].xyz);
		r4.x = max(r4.x, float(0.100000001f));
		r3.w = r3.w / r4.x;
		r3.w = max(r3.w, float(0.100000001f));
		r3.w = min(r3.w, float(1.00000000f));
		r4.x = fma(r19.y, r17.y, r16.y);
		r0.z = r0.z * r1.z;
		r0.z = fma(r0.z, float(6.00000000f), r3.w);
		r0.z = min(r0.z, float(1.00000000f));
		r0.z = fma(idx_uniforms1_ps.cb1[31].z, r0.z, float(-1.00000000f));
		r0.z = r0.z * idx_uniforms1_ps.cb1[31].z;
		r0.z = fma(r4.x, r0.z, float(1.00000000f));
		r0.y = r0.y * r0.z;
		r0.y = r4.x * r0.y;
		r0.z = max(r20.z, float(0.0799999982f));
		r0.z = min(r0.z, float(1.00000000f));
		r0.z = min(r0.z, r0.w);
		r0.y = saturate(r0.y * r0.z);
		r0.z = -r0.y + float(1.00000000f);
		r1.z = -r19.y + float(1.00000000f);
		r0.z = r0.z * r1.z;
		r3.xyz = r0.yyy * r3.xyz;
		r2.xzw = fma(r2.xzw, r0.zzz, r3.xyz);
		r0.yzw = fma(r8.xyz, r0.www, r1.xyw);
		r0.yzw = r0.yzw + r2.xzw;
		r1.x = saturate(r0.x * idx_uniforms0_ps.cb0[16].w);
		r1.y = fma(r2.y, idx_uniforms0_ps.cb0[16].z, -idx_uniforms0_ps.cb0[16].x);
		r1.y = min(r1.y, idx_uniforms0_ps.cb0[16].y);
		r1.y = -r1.y + float(1.00000000f);
		r1.x = fma(r1.x, r1.y, -idx_uniforms0_ps.cb0[14].w);
		r0.x = fma(r0.x, idx_uniforms0_ps.cb0[15].w, r1.x);
		r1.x = dot(idx_uniforms1_ps.cb1[37].xyz, r19.xzw);
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
		o0.w = r14.w;
	}
	else
	{
		o0 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	}
	return;
}

