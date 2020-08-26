#version 460 core
// ps_5_0
// Checksum: 52b062cc_fc6a51a1_391d9386_e6a743ae
// Name: deferred_spotlightspndptsh

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 2) in idx_Varying2 { noperspective vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11;

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

uniform sampler2D resourceSamplerPair_6_ps; // res6, s2


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
	r2.xyz = r1.yyy * v2.v.xyz;
	r1.yzw = fma(-r1.yyy, v2.v.xyz, idx_uniforms1_ps.cb1[0].xyz);
	r2.w = dot(r1.yzw, r1.yzw);
	r3.x = sqrt(r2.w);
	r3.y = saturate(fma(r3.x, idx_uniforms1_ps.cb1[3].x, idx_uniforms1_ps.cb1[0].w));
	r3.y = r3.y + float(-1.00000000f);
	r3.y = fma(-r3.y, r3.y, float(1.00000000f));
	r3.y = sqrt(r3.y);
	r3.y = -r3.y + float(1.00000000f);
	r4.xyz = ((texture(resourceSamplerPair_1_ps, r0.zw))).xyz;
	r5.xyz = ((texture(resourceSamplerPair_2_ps, r0.zw))).xyz;
	r5.xyz = fma(r5.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r6 = (texture(resourceSamplerPair_3_ps, r0.zw)).wxyz;
	r0.z = dot(r5.xyz, r5.xyz);
	r0.z = inversesqrt(r0.z);
	r5.xyz = r0.zzz * r5.xyz;
	r0.z = intBitsToFloat(r6.y < float(0.411764711f) ? int(0xffffffff) : int(0x00000000));
	r3.zw = r6.yw + vec2(-0.501960814f, -0.500000000f);
	r3.zw = saturate(r3.zw + r3.zw);
	r0.z = uintBitsToFloat(movc(floatBitsToUint(r0.z), uint(0x00000000), floatBitsToUint(r3.z)));
	r0.w = fma(r6.z, float(8.00000000f), float(1.00000000f));
	r0.w = exp2(r0.w);
	r3.z = dot(-v2.v.xyz, -v2.v.xyz);
	r3.z = inversesqrt(r3.z);
	r7.xyz = r3.zzz * -v2.v.xyz;
	r2.w = inversesqrt(r2.w);
	r1.yzw = r1.yzw * r2.www;
	r2.w = saturate(dot(r7.xyz, r5.xyz));
	r7.xyz = fma(-v2.v.xyz, r3.zzz, r1.yzw);
	r3.z = dot(r7.xyz, r7.xyz);
	r3.z = inversesqrt(r3.z);
	r7.xyz = r3.zzz * r7.xyz;
	r3.z = r6.z + idx_uniforms2_ps.cb2[0].z;
	r4.w = idx_uniforms2_ps.cb2[0].z * float(3.14000010f);
	r3.z = r3.z / r4.w;
	r0.w = fma(r0.w, float(1.44269502f), float(1.44269502f));
	r4.w = dot(r7.xyz, r5.xyz);
	r0.w = fma(r0.w, r4.w, -r0.w);
	r0.w = exp2(r0.w);
	r0.w = min(r0.w, float(1.00000000f));
	r0.w = r0.w * r3.z;
	r3.z = dot(r4.xyz, vec3(0.300000012f, 0.589999974f, 0.109999999f));
	r3.z = r3.z + float(0.00100000005f);
	r7.xyz = r4.xyz / r3.zzz;
	r7.xyz = r7.xyz + vec3(-1.00000000f, -1.00000000f, -1.00000000f);
	r7.xyz = fma(r3.www, r7.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r3.z = saturate(fma(r6.w, float(2.00000000f), float(-1.00000000f)));
	r3.z = fma(r3.z, float(0.649999976f), float(0.0500000007f));
	r4.w = -r3.z + float(1.00000000f);
	r2.w = -r2.w + float(1.00100005f);
	r2.w = min(r2.w, float(1.00000000f));
	r5.w = r2.w * r2.w;
	r5.w = r5.w * r5.w;
	r2.w = r2.w * r5.w;
	r2.w = fma(r4.w, r2.w, r3.z);
	r2.w = min(r2.w, float(1.00000000f));
	r3.z = r3.y * idx_uniforms1_ps.cb1[4].x;
	r7.xyz = r7.xyz * r3.zzz;
	r7.xyz = r6.xxx * r7.xyz;
	r7.xyz = r0.www * r7.xyz;
	r7.xyz = r2.www * r7.xyz;
	r0.w = dot(-r1.yzw, idx_uniforms1_ps.cb1[2].xyz);
	r0.w = saturate(fma(r0.w, idx_uniforms1_ps.cb1[1].w, idx_uniforms1_ps.cb1[2].w));
	r1.y = saturate(fma(r3.x, idx_uniforms1_ps.cb1[13].y, -idx_uniforms1_ps.cb1[13].x));
	r0.w = r0.w * r1.y;
	r0.w = r0.w * r0.w;
	r8 = fma(idx_uniforms1_ps.cb1[9], r0.xxxx, idx_uniforms1_ps.cb1[12]);
	r8 = fma(idx_uniforms1_ps.cb1[10], r0.yyyy, r8);
	r1 = fma(idx_uniforms1_ps.cb1[11], r1.xxxx, r8);
	r1.xyz = r1.xyz / r1.www;
	r0.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r0.x = fract(r0.x);
	r1.w = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
	r0.y = fract(r1.w);
	r0.xy = r0.xy + vec2(-0.500000000f, -0.500000000f);
	r8.xy = r0.xy * vec2(0.000976562500f, 0.000976562500f);
	r9 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r1.xyxy);
	r3.xz = fma(r0.xy, vec2(0.000976562500f, 0.000976562500f), r9.xy);
	r6.zw = fma(-r0.xy, vec2(0.000976562500f, 0.000976562500f), r9.zw);
	r9 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r1.xyxy);
	r8.z = -1.f * r8.x;
	r8.xw = r8.yz + r9.xy;
	r9.xy = -r8.yz + r9.zw;
	r10 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(1.50000000f, 0.500000000f, -0.500000000f, 1.50000000f), r1.xyxy);
	r9.zw = -r8.yz + r10.xy;
	r8.yz = r8.yz + r10.zw;
	r10 = fma(idx_uniforms0_ps.cb0[4].wwww, vec4(-1.50000000f, -0.500000000f, 0.500000000f, -1.50000000f), r1.xyxy);
	r1.xy = fma(r0.xy, vec2(0.000976562500f, 0.000976562500f), r10.xy);
	r0.xy = fma(-r0.xy, vec2(0.000976562500f, 0.000976562500f), r10.zw);
	r1.w = intBitsToFloat(float(0.00000000f) < r0.z ? int(0xffffffff) : int(0x00000000));
	r2.w = ((texture(resourceSamplerPair_4_ps, r3.xz)).yzwx).w;
	r4.w = ((texture(resourceSamplerPair_4_ps, r6.zw)).yzwx).w;
	r5.w = ((texture(resourceSamplerPair_4_ps, r8.xw)).yzwx).w;
	r7.w = ((texture(resourceSamplerPair_4_ps, r9.xy)).yzwx).w;
	r10.x = ((texture(resourceSamplerPair_4_ps, r9.zw))).x;
	r10.y = ((texture(resourceSamplerPair_4_ps, r8.yz)).yxzw).y;
	r10.z = ((texture(resourceSamplerPair_4_ps, r1.xy)).yzxw).z;
	r10.w = ((texture(resourceSamplerPair_4_ps, r0.xy)).yzwx).w;
	if (floatBitsToUint(r1.w) != uint(0))
	{
		r11.x = fma(r0.z, float(0.300000012f), float(0.0500000007f));
		r11.x = float(1.00000000f) / r11.x;
		r11.y = fma(r1.z, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r11.y = float(1.00000000f) / r11.y;
		r2.w = fma(r2.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r2.w = float(1.00000000f) / r2.w;
		r2.w = -r2.w + r11.y;
		r2.w = saturate(r11.x * r2.w);
		r2.w = -r2.w + float(1.00000000f);
		r4.w = fma(r4.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r4.w = float(1.00000000f) / r4.w;
		r4.w = -r4.w + r11.y;
		r4.w = saturate(r11.x * r4.w);
		r2.w = r2.w + -r4.w;
		r2.w = r2.w + float(1.00000000f);
		r4.w = fma(r5.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r4.w = float(1.00000000f) / r4.w;
		r4.w = -r4.w + r11.y;
		r4.w = saturate(r11.x * r4.w);
		r2.w = r2.w + -r4.w;
		r2.w = r2.w + float(1.00000000f);
		r4.w = fma(r7.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r4.w = float(1.00000000f) / r4.w;
		r4.w = -r4.w + r11.y;
		r4.w = saturate(r11.x * r4.w);
		r2.w = r2.w + -r4.w;
		r2.w = r2.w + float(1.00000000f);
		r4.w = fma(r10.x, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r4.w = float(1.00000000f) / r4.w;
		r4.w = -r4.w + r11.y;
		r4.w = saturate(r11.x * r4.w);
		r2.w = r2.w + -r4.w;
		r2.w = r2.w + float(1.00000000f);
		r4.w = fma(r10.y, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r4.w = float(1.00000000f) / r4.w;
		r4.w = -r4.w + r11.y;
		r4.w = saturate(r11.x * r4.w);
		r2.w = r2.w + -r4.w;
		r2.w = r2.w + float(1.00000000f);
		r4.w = fma(r10.z, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r4.w = float(1.00000000f) / r4.w;
		r4.w = -r4.w + r11.y;
		r4.w = saturate(r11.x * r4.w);
		r2.w = r2.w + -r4.w;
		r2.w = r2.w + float(1.00000000f);
		r4.w = fma(r10.w, idx_uniforms1_ps.cb1[3].y, idx_uniforms1_ps.cb1[3].z);
		r4.w = float(1.00000000f) / r4.w;
		r4.w = -r4.w + r11.y;
		r4.w = saturate(r11.x * r4.w);
		r2.w = r2.w + -r4.w;
		r2.w = r2.w + float(1.00000000f);
		r2.w = r2.w * float(0.125000000f);
		r2.w = r2.w * r2.w;
		r2.w = r2.w * r2.w;
	}
	else
	{
		r3.x = textureLod(resourceSamplerPair_5_ps, vec3(r3.xz, r1.z), float(0));
		r3.z = textureLod(resourceSamplerPair_5_ps, vec3(r6.zw, r1.z), float(0));
		r3.x = r3.z + r3.x;
		r3.z = textureLod(resourceSamplerPair_5_ps, vec3(r8.xw, r1.z), float(0));
		r3.x = r3.z + r3.x;
		r3.z = textureLod(resourceSamplerPair_5_ps, vec3(r9.xy, r1.z), float(0));
		r3.x = r3.z + r3.x;
		r3.z = textureLod(resourceSamplerPair_5_ps, vec3(r9.zw, r1.z), float(0));
		r3.x = r3.z + r3.x;
		r3.z = textureLod(resourceSamplerPair_5_ps, vec3(r8.yz, r1.z), float(0));
		r3.x = r3.z + r3.x;
		r1.x = textureLod(resourceSamplerPair_5_ps, vec3(r1.xy, r1.z), float(0));
		r1.x = r1.x + r3.x;
		r0.x = textureLod(resourceSamplerPair_5_ps, vec3(r0.xy, r1.z), float(0));
		r0.x = r0.x + r1.x;
		r2.w = r0.x * float(0.125000000f);
	}
	r0.x = -r2.w + float(1.00000000f);
	r0.x = fma(-idx_uniforms1_ps.cb1[3].w, r0.x, float(1.00000000f));
	r0.x = r0.x * r0.w;
	r1.xyz = fma(idx_uniforms1_ps.cb1[5].xyw, r2.xxx, idx_uniforms1_ps.cb1[8].xyw);
	r1.xyz = fma(idx_uniforms1_ps.cb1[6].xyw, r2.yyy, r1.xyz);
	r1.xyz = fma(idx_uniforms1_ps.cb1[7].xyw, r2.zzz, r1.xyz);
	r0.yw = r1.xy / r1.zz;
	r1.xyz = ((textureLod(resourceSamplerPair_6_ps, r0.yw, float(0.00000000f)))).xyz;
	r1.xyz = r1.xyz * idx_uniforms1_ps.cb1[1].xyz;
	r0.y = r0.x * r3.y;
	r0.w = saturate(r6.x + idx_uniforms2_ps.cb2[3].z);
	r0.w = r0.w + -idx_uniforms2_ps.cb2[3].z;
	r2.x = -idx_uniforms2_ps.cb2[3].z + float(1.00000000f);
	r6.y = r0.w / r2.x;
	r2.xy = fma(r6.xy, idx_uniforms2_ps.cb2[3].xw, idx_uniforms2_ps.cb2[4].xw);
	r0.y = r0.y * r2.x;
	r0.w = idx_uniforms1_ps.cb1[3].w + float(-0.750000000f);
	r0.w = saturate(r0.w * float(4.00000000f));
	r0.w = r0.w * idx_uniforms1_ps.cb1[4].w;
	r2.x = dot(r5.xyz, -idx_uniforms1_ps.cb1[2].xyz);
	r2.z = r2.x + float(0.600000024f);
	r2.z = saturate(r2.z * float(0.625000000f));
	r2.z = r2.z * r2.z;
	r2.z = r0.x * r2.z;
	r2.w = saturate(r2.z * float(3.00000000f));
	r5.xyz = fma(r2.www, vec3(0.100000001f, 0.790000021f, 0.939999998f), vec3(0.899999976f, 0.209999993f, 0.0599999987f));
	r5.xyz = r2.yyy * r5.xyz;
	r2.x = -r2.x + float(0.150000006f);
	r2.x = saturate(r2.x + r2.x);
	r2.x = r0.x * r2.x;
	r2.xyw = r2.xxx * vec3(0.200000003f, 0.0460000001f, 0.00999999978f);
	r0.z = r0.z * float(2.50000000f);
	r0.z = min(r0.z, float(1.00000000f));
	r2.xyw = r0.zzz * r2.xyw;
	r2.xyw = r0.www * r2.xyw;
	r2.xyz = fma(r5.xyz, r2.zzz, r2.xyw);
	r2.xyz = r2.xyz * r3.yyy;
	r3.xyz = r0.xxx * r7.xyz;
	r0.x = uintBitsToFloat(movc(floatBitsToUint(r1.w), uint(0x3f800000), floatBitsToUint(r0.x)));
	r2.xyz = uintBitsToFloat(floatBitsToUint(r1.www) & floatBitsToUint(r2.xyz));
	r3.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.www), floatBitsToUint(r3.xyz), floatBitsToUint(r7.xyz)));
	r0.z = -r3.w + float(1.00000000f);
	r1.xyz = r0.xxx * r1.xyz;
	r2.xyz = r2.xyz * idx_uniforms1_ps.cb1[4].zzz;
	r2.xyz = r4.xyz * r2.xyz;
	r2.xyz = fma(r2.xyz, r0.zzz, r3.xyz);
	r0.xyw = r0.yyy * idx_uniforms1_ps.cb1[14].xyz;
	r0.xyw = r4.xyz * r0.xyw;
	r0.xyz = r0.zzz * r0.xyw;
	o0.xyz = fma(r1.xyz, r2.xyz, r0.xyz);
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

