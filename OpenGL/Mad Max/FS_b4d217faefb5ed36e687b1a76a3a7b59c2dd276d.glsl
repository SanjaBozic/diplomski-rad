#version 460 core
// ps_5_0
// Checksum: 00ca9ace_1893bc2b_7cb98f05_624b69cf
// Name: deferred_sunlight_debug

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22;

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
	r2.xz = r2.xz + -idx_uniforms1_ps.cb1[29].xz;
	r2.xz = fma(r2.xz, vec2(0.00130208337f, 0.00130208337f), vec2(0.501953125f, 0.501953125f));
	r13 = (texture(resourceSamplerPair_2_ps, r2.xz));
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r14 = (texture(resourceSamplerPair_3_ps, v1.v.xy));
		r15.xyz = ((texture(resourceSamplerPair_4_ps, v1.v.xy))).xyz;
		r15.xyz = fma(r15.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r16 = (texture(resourceSamplerPair_5_ps, v1.v.xy));
		r17.xyz = -r16.yyz + vec3(0.125000000f, 1.00000000f, 0.500000000f);
		r17.x = saturate(r17.x);
		r0.y = intBitsToFloat(r16.x < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
		r2.x = r16.x + r16.x;
		r4.zw = r16.xz + vec2(-0.501960814f, -0.500000000f);
		r18.xy = saturate(r4.zw + r4.zw);
		r2.z = uintBitsToFloat(uint(0x00000000));
		r18.z = uintBitsToFloat(uint(0x00000000));
		r18.xzw = saturate(uintBitsToFloat(movc(floatBitsToUint(r0.yyy), floatBitsToUint(r2.xzz), floatBitsToUint(r18.zxx))));
		r0.y = dot(-v2.v.xyz, -v2.v.xyz);
		r0.y = inversesqrt(r0.y);
		r19.xyz = r0.yyy * -v2.v.xyz;
		r20.xyz = fma(-v2.v.xyz, r0.yyy, -r15.xyz);
		r15.xyz = fma(r17.xxx, r20.xyz, r15.xyz);
		r2.x = dot(r15.xyz, r15.xyz);
		r2.x = inversesqrt(r2.x);
		r15.xyz = r2.xxx * r15.xyz;
		r2.x = r16.y * float(3.00000000f);
		r20.xyz = fma(r16.ywz, vec3(8.00000000f, 1.60000002f, 4.59999990f), vec3(1.00000000f, 0.200000003f, -1.29999995f));
		r2.z = exp2(r20.x);
		r4.z = r17.y * float(5.00000000f);
		r4.w = intBitsToFloat(r18.w == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		r5.w = saturate(r17.z + r17.z);
		r5.w = r5.w * r5.w;
		r21.y = r5.w * r5.w;
		r21.xz = r21.yy * vec2(0.800000012f, 0.800000012f);
		r21.w = min(r21.x, float(0.400000006f));
		r21.xyz = uintBitsToFloat(floatBitsToUint(r4.www) & floatBitsToUint(r21.yzw));
		r4.w = fma(r18.y, float(4.00000000f), float(9.99999975e-05f));
		r22.xyz = fma(-v2.v.xyz, r0.yyy, -idx_uniforms0_ps.cb0[3].xyz);
		r5.w = dot(r22.xyz, r22.xyz);
		r5.w = inversesqrt(r5.w);
		r22.xyz = r5.www * r22.xyz;
		r5.w = dot(r19.xyz, r15.xyz);
		r6.w = saturate(r5.w);
		r4.xy = fma(r4.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r4.x = max(abs(r4.y), abs(r4.x));
		r3.x = saturate(r3.x);
		r4.y = intBitsToFloat(float(0.00000000f) < r18.w ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r4.y) != uint(0))
		{
			r7.w = fma(r18.w, float(0.300000012f), float(0.0500000007f));
			r7.w = idx_uniforms1_ps.cb1[34].x / r7.w;
			r0.zw = -r0.zw + r3.xx;
			r0.zw = saturate(r7.ww * r0.zw);
			r0.z = -r0.z + float(1.00000000f);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r1.z + r3.x;
			r0.w = saturate(r7.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r1.w + r3.x;
			r0.w = saturate(r7.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r2.w + r3.x;
			r0.w = saturate(r7.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r3.y + r3.x;
			r0.w = saturate(r7.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r3.z + r3.x;
			r0.w = saturate(r7.w * r0.w);
			r0.z = -r0.w + r0.z;
			r0.z = r0.z + float(1.00000000f);
			r0.w = -r3.w + r3.x;
			r0.w = saturate(r7.w * r0.w);
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
		r1.z = r21.z + r0.w;
		r1.w = r21.z + float(1.00000000f);
		r1.z = saturate(r1.z / r1.w);
		r1.w = r1.z + float(-1.00000000f);
		r1.w = fma(r21.y, r1.w, float(1.00000000f));
		r1.z = r1.w * r1.z;
		r1.w = fma(r1.z, r6.w, float(9.99999975e-05f));
		r1.w = log2(r1.w);
		r1.w = r1.w * r4.w;
		r1.w = exp2(r1.w);
		r1.w = r1.z * r1.w;
		r1.w = min(r1.w, float(1.00000000f));
		r2.w = r18.z * float(2.50000000f);
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
		r4.xyw = uintBitsToFloat(movc(floatBitsToUint(r4.yyy), floatBitsToUint(r6.xyz), floatBitsToUint(r0.www)));
		r6.xyz = r4.xyw * idx_uniforms0_ps.cb0[2].xyz;
		r7.xyz = r3.xyz * idx_uniforms1_ps.cb1[0].zzz;
		r0.w = saturate(fma(r16.z, float(2.00000000f), float(-1.00000000f)));
		r0.w = fma(r0.w, float(0.649999976f), float(0.0500000007f));
		r1.x = -r0.w + float(1.00000000f);
		r1.y = saturate(fma(r5.w, float(0.899999976f), float(0.100000001f)));
		r1.y = -r1.y + float(1.00100005f);
		r1.y = min(r1.y, float(1.00000000f));
		r2.w = r1.y * r1.y;
		r2.w = r2.w * r2.w;
		r1.y = r1.y * r2.w;
		r0.w = fma(r1.x, r1.y, r0.w);
		r0.w = min(r0.w, float(1.00000000f));
		r1.x = r2.z + float(8.00000000f);
		r1.x = r1.x * float(0.0398089178f);
		r1.y = fma(r2.z, float(1.44269502f), float(1.44269502f));
		r2.z = dot(r22.xyz, r15.xyz);
		r2.z = fma(r1.y, r2.z, -r1.y);
		r2.z = exp2(r2.z);
		r2.z = min(r2.z, float(1.00000000f));
		r2.z = r1.x * r2.z;
		r8.xyz = r14.xyz + vec3(0.00999999978f, 0.00999999978f, 0.00999999978f);
		r2.w = dot(r8.xyz, r8.xyz);
		r2.w = inversesqrt(r2.w);
		r8.xyz = fma(r8.xyz, r2.www, vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r8.xyz = fma(r18.yyy, r8.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
		r9.xyz = r8.xyz * idx_uniforms0_ps.cb0[1].xyz;
		r9.xyz = r1.zzz * r9.xyz;
		r9.xyz = r16.www * r9.xyz;
		r9.xyz = r0.zzz * r9.xyz;
		r9.xyz = r2.zzz * r9.xyz;
		r9.xyz = r0.www * r9.xyz;
		r7.xyz = r5.xxx * r7.xyz;
		r2.w = dot(idx_uniforms1_ps.cb1[31].xy, idx_uniforms1_ps.cb1[31].xy);
		r2.w = intBitsToFloat(r2.w != float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r2.w) != uint(0))
		{
			r1.x = r1.x * r16.w;
			r1.x = r0.w * r1.x;
			r10.xy = r21.zz + vec2(0.300000012f, 1.29999995f);
			r5.y = r13.w * float(128.000000f);
			r5.x = fma(r13.w, float(128.000000f), idx_uniforms1_ps.cb1[28].w);
			r5.xy = r2.yy + -r5.xy;
			r11.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(r5.xy, vec2(0.00000000f, 0.00000000f)))));
			r11.xy = uintBitsToFloat(movc(floatBitsToUint(r11.xy), floatBitsToUint(idx_uniforms1_ps.cb1[30].yy), floatBitsToUint(idx_uniforms1_ps.cb1[30].xx)));
			r5.xy = saturate(r5.xy * r11.xy);
			r5.xy = -r5.xy + vec2(1.00000000f, 1.00000000f);
			r2.w = dot(idx_uniforms1_ps.cb1[28].xyz, r15.xyz);
			r10.z = -1.f * r10.x;
			r11.xy = r2.ww + r10.xz;
			r10.w = -r10.x + float(-1.00000000f);
			r10.xy = r11.xy / r10.yw;
			r5.xy = r5.xy * r5.xy;
			r5.xy = saturate(r10.xy * r5.xy);
			r5.xy = r5.xy * idx_uniforms1_ps.cb1[31].xy;
			r2.w = r5.y + r5.x;
			r10.xyz = r2.www * r13.xyz;
			r11.xyz = fma(-v2.v.xyz, r0.yyy, idx_uniforms1_ps.cb1[28].xyz);
			r0.y = dot(r11.xyz, r11.xyz);
			r0.y = inversesqrt(r0.y);
			r11.xyz = r0.yyy * r11.xyz;
			r12.xyz = r10.xyz * idx_uniforms0_ps.cb0[2].xyz;
			r10.xyz = r10.xyz * idx_uniforms0_ps.cb0[1].xyz;
			r10.xyz = r1.xxx * r10.xyz;
			r0.y = dot(r11.xyz, r15.xyz);
			r0.y = fma(r1.y, r0.y, -r1.y);
			r0.y = exp2(r0.y);
			r0.y = min(r0.y, float(1.00000000f));
			r10.xyz = r0.yyy * r10.xyz;
		}
		else
		{
			r12.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
			r10.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
		}
		r0.y = -r5.z + float(1.00000000f);
		r0.y = fma(r21.z, r0.y, r5.z);
		r5.xyz = r0.yyy * r10.xyz;
		r4.xyw = fma(idx_uniforms0_ps.cb0[2].xyz, r4.xyw, r7.xyz);
		r4.xyw = fma(r12.xyz, r0.yyy, r4.xyw);
		r4.xyw = r14.xyz * r4.xyw;
		r0.y = r5.w + r5.w;
		r10.xyz = fma(r0.yyy, r15.xyz, -r19.xyz);
		r1.xy = r10.zz * idx_uniforms1_ps.cb1[33].yw;
		r11.xz = fma(-r10.xx, idx_uniforms1_ps.cb1[33].xz, r1.xy);
		r1.xy = r10.zz * idx_uniforms1_ps.cb1[38].yw;
		r13.xz = fma(-r10.xx, idx_uniforms1_ps.cb1[38].xz, r1.xy);
		r11.y = r10.y;
		r10.xyz = ((textureLod(resourceSamplerPair_7_ps, r11.xyz, r4.z))).xyz;
		r13.y = r11.y;
		r11.xyz = ((textureLod(resourceSamplerPair_8_ps, r13.xyz, r4.z))).xyz;
		r11.xyz = -r10.xyz + r11.xyz;
		r10.xyz = fma(idx_uniforms1_ps.cb1[0].www, r11.xyz, r10.xyz);
		r11.xyz = r8.xyz * r10.xyz;
		r11.xyz = r11.xyz * idx_uniforms1_ps.cb1[20].zzz;
		r0.y = saturate(fma(-r16.z, float(2.00000000f), float(1.00000000f)));
		r0.y = r0.y + r0.y;
		r0.y = max(r18.w, r0.y);
		r1.x = fma(-r18.w, float(8.00000000f), float(1.00000000f));
		r1.x = saturate(fma(r2.x, r1.x, float(-1.00000000f)));
		r2.xw = r0.yy + vec2(2.00000000f, 1.00000000f);
		r0.y = fma(r16.w, r2.x, -r2.w);
		r1.x = max(r1.x, r18.y);
		r1.y = -r0.y + r20.y;
		r0.y = saturate(fma(r1.x, r1.y, r0.y));
		r1.x = dot(vec3(0.212500006f, 0.715399981f, 0.0720999986f), idx_uniforms0_ps.cb0[10].zzz);
		r1.x = r1.x * float(3.00000000f);
		r1.y = dot(vec3(0.212500006f, 0.715399981f, 0.0720999986f), idx_uniforms0_ps.cb0[2].xyz);
		r1.y = max(r1.y, float(0.100000001f));
		r1.x = r1.x / r1.y;
		r1.x = max(r1.x, float(0.100000001f));
		r1.x = min(r1.x, float(1.00000000f));
		r1.y = fma(r18.y, r17.y, r16.y);
		r2.x = r0.z * r1.z;
		r1.x = fma(r2.x, float(6.00000000f), r1.x);
		r1.x = min(r1.x, float(1.00000000f));
		r1.x = fma(idx_uniforms1_ps.cb1[31].z, r1.x, float(-1.00000000f));
		r1.x = r1.x * idx_uniforms1_ps.cb1[31].z;
		r1.x = fma(r1.y, r1.x, float(1.00000000f));
		r0.y = r0.y * r1.x;
		r0.y = r1.y * r0.y;
		r1.x = max(r20.z, float(0.0799999982f));
		r1.x = min(r1.x, float(1.00000000f));
		r1.x = min(r0.w, r1.x);
		r0.y = saturate(r0.y * r1.x);
		r1.x = -r0.y + float(1.00000000f);
		r1.y = -r18.y + float(1.00000000f);
		r1.x = r1.y * r1.x;
		r11.xyz = r0.yyy * r11.xyz;
		r4.xyz = fma(r4.xyw, r1.xxx, r11.xyz);
		r5.xyz = fma(r5.xyz, r8.xyz, r9.xyz);
		r4.xyz = r4.xyz + r5.xyz;
		r1.x = saturate(r0.x * idx_uniforms0_ps.cb0[16].w);
		r1.y = fma(r2.y, idx_uniforms0_ps.cb0[16].z, -idx_uniforms0_ps.cb0[16].x);
		r1.y = min(r1.y, idx_uniforms0_ps.cb0[16].y);
		r1.y = -r1.y + float(1.00000000f);
		r1.x = fma(r1.x, r1.y, -idx_uniforms0_ps.cb0[14].w);
		r0.x = fma(r0.x, idx_uniforms0_ps.cb0[15].w, r1.x);
		r1.x = dot(idx_uniforms1_ps.cb1[37].xyz, r19.xyz);
		r1.x = r1.x + float(0.500000000f);
		r5.x = uintBitsToFloat(uint(0x3f800000));
		r5.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
		r5 = -r0.xxxx * r5;
		r5 = exp2(r5);
		r5 = min(r5, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
		r0.x = -r5.x + float(1.00000000f);
		r1.y = r1.x * r1.x;
		r1.x = r1.x * r1.y;
		r2.xyw = fma(r1.xxx, idx_uniforms0_ps.cb0[14].xyz, idx_uniforms0_ps.cb0[15].xyz);
		r2.xyw = r0.xxx * r2.xyw;
		r2.xyw = fma(r4.xyz, r5.yzw, r2.xyw);
		{ float src = idx_uniforms1_ps.cb1[13].x; r0.x = sin(src); r1.x = cos(src); }
		r4.xy = vec2(0.500000000f, 0.500000000f) / idx_uniforms0_ps.cb0[8].zw;
		r4.xy = -r4.xy + v0.xy;
		r1.y = r0.x;
		r0.x = dot(r4.xy, r1.xy);
		r0.x = r0.x + idx_uniforms1_ps.cb1[13].y;
		r0.x = intBitsToFloat(r0.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r0.x) != uint(0))
		{
			r4 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(0.00000000f, 1.00000000f, 2.00000000f, 3.00000000f)))));
			r5.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.xxx), floatBitsToUint(r14.xyz), floatBitsToUint(r2.xyw)));
			r13.xyz = fma(r15.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
			r5.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.yyy), floatBitsToUint(r13.xyz), floatBitsToUint(r5.xyz)));
			r4.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.zzz), floatBitsToUint(r16.xxx), floatBitsToUint(r5.xyz)));
			r4.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.www), floatBitsToUint(r16.yyy), floatBitsToUint(r4.xyz)));
			r5 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(4.00000000f, 5.00000000f, 6.00000000f, 7.00000000f)))));
			r4.xyz = uintBitsToFloat(movc(floatBitsToUint(r5.xxx), floatBitsToUint(r16.zzz), floatBitsToUint(r4.xyz)));
			r4.xyz = uintBitsToFloat(movc(floatBitsToUint(r5.yyy), floatBitsToUint(r16.www), floatBitsToUint(r4.xyz)));
			r4.xyz = uintBitsToFloat(movc(floatBitsToUint(r5.zzz), floatBitsToUint(r12.xyz), floatBitsToUint(r4.xyz)));
			r1.xyw = uintBitsToFloat(movc(floatBitsToUint(r5.www), floatBitsToUint(r1.www), floatBitsToUint(r4.xyz)));
			r4 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(8.00000000f, 9.00000000f, 10.0000000f, 11.0000000f)))));
			r1.xyw = uintBitsToFloat(movc(floatBitsToUint(r4.xxx), floatBitsToUint(r6.xyz), floatBitsToUint(r1.xyw)));
			r5.xyz = r14.xyz * r6.xyz;
			r1.xyw = uintBitsToFloat(movc(floatBitsToUint(r4.yyy), floatBitsToUint(r5.xyz), floatBitsToUint(r1.xyw)));
			r0.x = r16.w * r1.z;
			r0.x = r0.z * r0.x;
			r0.x = r2.z * r0.x;
			r0.x = r0.w * r0.x;
			r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.zzz), floatBitsToUint(r0.xxx), floatBitsToUint(r1.xyw)));
			r8.xyz = saturate(r8.xyz);
			r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.www), floatBitsToUint(r8.xyz), floatBitsToUint(r1.xyz)));
			r4 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(12.0000000f, 13.0000000f, 14.0000000f, 15.0000000f)))));
			r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r4.xxx), floatBitsToUint(r9.xyz), floatBitsToUint(r1.xyz)));
			r0.x = uintBitsToFloat(floatBitsToUint(r4.z) | floatBitsToUint(r4.y));
			r1.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.xxx), floatBitsToUint(r0.zzz), floatBitsToUint(r1.xyz)));
			r0.xzw = uintBitsToFloat(movc(floatBitsToUint(r4.www), floatBitsToUint(r0.www), floatBitsToUint(r1.xyz)));
			r1 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(16.0000000f, 17.0000000f, 18.0000000f, 19.0000000f)))));
			r0.xzw = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), floatBitsToUint(r10.xyz), floatBitsToUint(r0.xzw)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.yyy), floatBitsToUint(r0.yyy), floatBitsToUint(r0.xzw)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.zzz), floatBitsToUint(r11.xyz), floatBitsToUint(r0.xyz)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.www), floatBitsToUint(r3.xyz), floatBitsToUint(r0.xyz)));
			r1 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(equal(idx_uniforms1_ps.cb1[13].zzzz, vec4(20.0000000f, 21.0000000f, 22.0000000f, 23.0000000f)))));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), floatBitsToUint(r7.xyz), floatBitsToUint(r0.xyz)));
			r3.xyz = r14.xyz * r7.xyz;
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.yyy), floatBitsToUint(r3.xyz), floatBitsToUint(r0.xyz)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.zzz), floatBitsToUint(r21.xxx), floatBitsToUint(r0.xyz)));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.www), floatBitsToUint(r18.www), floatBitsToUint(r0.xyz)));
			r1.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(equal(idx_uniforms1_ps.cb1[13].zz, vec2(24.0000000f, 25.0000000f)))));
			r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), floatBitsToUint(r18.xxx), floatBitsToUint(r0.xyz)));
			r14.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.yyy), floatBitsToUint(r17.xxx), floatBitsToUint(r0.xyz)));
		}
		else
		{
			r14.xyz = r2.xyw;
		}
		o0 = r14;
	}
	else
	{
		o0 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	}
	return;
}
