#version 460 core
// ps_5_0
// Checksum: e1569f91_bb879430_20255999_6bcac010
// Name: characterskingenerallod2_fw_refl

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 9) in idx_Varying9 { vec4 v; } v9;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[4]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[4096]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[3]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3

uniform sampler2D resourceSamplerPair_2_ps; // res1, s1

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2

uniform sampler2D resourceSamplerPair_4_ps; // res7, s7

uniform sampler2DArrayShadow resourceSamplerPair_5_ps; // res14, s13

uniform sampler2D resourceSamplerPair_6_ps; // res6, s6

uniform usampler2D resourceSamplerPair_7_ps; // res10, s-1

uniform samplerCube resourceSamplerPair_8_ps; // res8, s8


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
	r0.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r1.xy = v9.v.xy * idx_uniforms2_ps.cb2[1].xy;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, r1.xy))).xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = r0.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	r0.w = intBitsToFloat(idx_uniforms1_ps.cb1[1].z == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r2.xy = uintBitsToFloat(movc(floatBitsToUint(r0.ww), floatBitsToUint(v1.v.xy), floatBitsToUint(v1.v.zw)));
	r2.xyz = ((texture(resourceSamplerPair_2_ps, r2.xy)).xywz).xyz;
	r2.yzw = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.x = r2.w * r2.y;
	r0.w = dot(r2.xz, r2.xz);
	r0.w = -r0.w + float(1.00000000f);
	r0.w = max(r0.w, float(0.00000000f));
	r0.w = sqrt(r0.w);
	r3.xyz = ((texture(resourceSamplerPair_3_ps, v1.v.xy))).xyz;
	r1.w = dot(v2.v.xyz, v2.v.xyz);
	r1.w = inversesqrt(r1.w);
	r4.xyz = r1.www * v2.v.xyz;
	r1.w = dot(v3.v.xyz, v3.v.xyz);
	r1.w = inversesqrt(r1.w);
	r5.xyz = r1.www * v3.v.xyz;
	r2.yzw = r2.zzz * r5.xyz;
	r2.xyz = fma(r4.xyz, r2.xxx, r2.yzw);
	r1.w = dot(v4.v.xyz, v4.v.xyz);
	r1.w = inversesqrt(r1.w);
	r4.xyz = r1.www * v4.v.xyz;
	r2.xyz = fma(r4.xyz, r0.www, r2.xyz);
	r0.w = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r2.xyz = r0.www * r2.xyz;
	r0.w = fma(r3.y, float(7.00000000f), float(2.00000000f));
	r0.w = exp2(r0.w);
	r1.w = -r3.x + float(1.00000000f);
	r1.w = r1.w * float(5.00000000f);
	r4.x = v3.v.w;
	r4.y = v4.v.w;
	r3.xw = r4.xy * idx_uniforms2_ps.cb2[1].zw;
	r4 = (texture(resourceSamplerPair_4_ps, r3.xw));
	r2.w = v2.v.w + v2.v.w;
	r3.x = max(r2.w, float(0.500000000f));
	r3.x = float(1.00000000f) / r3.x;
	r2.w = saturate(r2.w);
	r3.w = r3.x + float(-1.00000000f);
	r3.x = saturate(fma(r3.x, r4.w, -r3.w));
	r2.w = r2.w * r3.x;
	r2.w = min(r2.w, r4.w);
	r2.w = max(r2.w, float(0.00000000f));
	r0.xyz = fma(-r0.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), r4.xyz);
	r0.xyz = fma(r2.www, r0.xyz, r1.xyz);
	if (floatBitsToUint(idx_uniforms4_ps.cb4[3].x) != uint(0))
	{
		r1.xy = fma(v6.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r1.x = max(abs(r1.y), abs(r1.x));
		r1.y = intBitsToFloat(float(4.94999981f) >= r1.x ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r1.y) != uint(0))
		{
			r1.x = intBitsToFloat(r1.x < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
			r4.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), floatBitsToUint(v6.v.zxy), floatBitsToUint(v7.v.zxy)));
			r1.z = uintBitsToFloat(movc(floatBitsToUint(r1.x), uint(0x3f800000), uint(0x40000000)));
			r4.x = saturate(r4.x);
			r2.w = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
			r3.x = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
			r5.xw = fract(r2.ww);
			r5.yz = fract(r3.xx);
			r5 = r5 + vec4(-0.500000000f, -0.500000000f, -0.500000000f, -0.500000000f);
			r6 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r4.yzyz);
			r1.xy = fma(r5.xz, vec2(0.00195312500f, 0.00195312500f), r6.xy);
			r7.x = texture(resourceSamplerPair_5_ps, vec4(r1.xyz, r4.x));
			r1.xy = fma(-r5.xy, vec2(0.00195312500f, 0.00195312500f), r6.zw);
			r7.y = texture(resourceSamplerPair_5_ps, vec4(r1.xyz, r4.x));
			r6 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r4.yzyz);
			r1.xy = fma(r5.zw, vec2(0.00195312500f, -0.00195312500f), r6.xy);
			r7.z = texture(resourceSamplerPair_5_ps, vec4(r1.xyz, r4.x));
			r1.xy = fma(-r5.zw, vec2(0.00195312500f, -0.00195312500f), r6.zw);
			r7.w = texture(resourceSamplerPair_5_ps, vec4(r1.xyz, r4.x));
			r1.x = dot(r7, vec4(0.250000000f, 0.250000000f, 0.250000000f, 0.250000000f));
		}
		else
		{
			r1.x = uintBitsToFloat(uint(0x3f800000));
		}
	}
	else
	{
		r1.x = uintBitsToFloat(uint(0x3f800000));
	}
	r1.yz = v5.v.xz + idx_uniforms2_ps.cb2[0].xy;
	r4.x = v5.v.y * idx_uniforms0_ps.cb0[1].w;
	r4.y = v5.v.y * idx_uniforms0_ps.cb0[3].w;
	r1.yz = r1.yz + -r4.xy;
	r1.yz = r1.yz * idx_uniforms2_ps.cb2[0].zz;
	r1.y = ((texture(resourceSamplerPair_6_ps, r1.yz)).xwyz).y;
	r1.y = saturate(r1.y + idx_uniforms2_ps.cb2[0].w);
	r1.x = r1.y * r1.x;
	r4.xyz = -v5.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r1.y = dot(r4.xyz, r4.xyz);
	r1.y = inversesqrt(r1.y);
	r5.xyz = r1.yyy * r4.xyz;
	r1.z = saturate(fma(r2.y, float(0.500000000f), float(0.500000000f)));
	r6.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
	r6.xyz = fma(r1.zzz, r6.xyz, idx_uniforms0_ps.cb0[11].xyz);
	r4.xyz = fma(r4.xyz, r1.yyy, -idx_uniforms0_ps.cb0[3].xyz);
	r1.y = dot(r4.xyz, r4.xyz);
	r1.y = inversesqrt(r1.y);
	r4.xyz = r1.yyy * r4.xyz;
	r1.y = dot(-idx_uniforms0_ps.cb0[3].xyz, r2.xyz);
	r1.z = saturate(r1.y);
	r1.z = r1.x * r1.z;
	r7.xyz = v5.v.xyz + -idx_uniforms0_ps.cb0[7].xyz;
	r3.xw = fma(r7.xz, vec2(0.250000000f, 0.250000000f), idx_uniforms0_ps.cb0[8].xy);
	r8.xy = intBitsToFloat(ivec2(r3.xw));
	r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r8 = uintBitsToFloat((texelFetch(resourceSamplerPair_7_ps, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w)))));
	if (floatBitsToUint(r8.x) != uint(0))
	{
		r9.xyz = -r7.xyz + idx_uniforms0_ps.cb0[17 + floatBitsToInt(r8.x)].xyz;
		r10.xyz = -r7.xyz + idx_uniforms0_ps.cb0[17 + floatBitsToInt(r8.y)].xyz;
		r2.w = dot(r9.xyz, r9.xyz);
		r2.w = r2.w + -idx_uniforms0_ps.cb0[82 + floatBitsToInt(r8.x)].w;
		r2.w = max(r2.w, float(0.00100000005f));
		r3.x = dot(r10.xyz, r10.xyz);
		r3.x = r3.x + -idx_uniforms0_ps.cb0[82 + floatBitsToInt(r8.y)].w;
		r3.x = max(r3.x, float(0.00100000005f));
		r3.w = saturate(fma(-r2.w, idx_uniforms0_ps.cb0[17 + floatBitsToInt(r8.x)].w, float(1.00000000f)));
		r4.w = saturate(fma(-r3.x, idx_uniforms0_ps.cb0[17 + floatBitsToInt(r8.y)].w, float(1.00000000f)));
		r3.w = r3.w * r3.w;
		r4.w = r4.w * r4.w;
		r2.w = inversesqrt(r2.w);
		r3.x = inversesqrt(r3.x);
		r2.w = r2.w * r3.w;
		r3.x = r3.x * r4.w;
		r3.w = dot(r9.xyz, r2.xyz);
		r2.w = saturate(r2.w * r3.w);
		r3.w = dot(r10.xyz, r2.xyz);
		r3.x = saturate(r3.w * r3.x);
		r9.xyz = r3.xxx * idx_uniforms0_ps.cb0[82 + floatBitsToInt(r8.y)].xyz;
		r9.xyz = fma(r2.www, idx_uniforms0_ps.cb0[82 + floatBitsToInt(r8.x)].xyz, r9.xyz);
		if (floatBitsToUint(r8.z) != uint(0))
		{
			r10.xyz = -r7.xyz + idx_uniforms0_ps.cb0[17 + floatBitsToInt(r8.z)].xyz;
			r7.xyz = -r7.xyz + idx_uniforms0_ps.cb0[17 + floatBitsToInt(r8.w)].xyz;
			r2.w = dot(r10.xyz, r10.xyz);
			r2.w = r2.w + -idx_uniforms0_ps.cb0[82 + floatBitsToInt(r8.z)].w;
			r2.w = max(r2.w, float(0.00100000005f));
			r3.x = dot(r7.xyz, r7.xyz);
			r3.x = r3.x + -idx_uniforms0_ps.cb0[82 + floatBitsToInt(r8.w)].w;
			r3.x = max(r3.x, float(0.00100000005f));
			r3.w = saturate(fma(-r2.w, idx_uniforms0_ps.cb0[17 + floatBitsToInt(r8.z)].w, float(1.00000000f)));
			r4.w = saturate(fma(-r3.x, idx_uniforms0_ps.cb0[17 + floatBitsToInt(r8.w)].w, float(1.00000000f)));
			r3.w = r3.w * r3.w;
			r4.w = r4.w * r4.w;
			r2.w = inversesqrt(r2.w);
			r3.x = inversesqrt(r3.x);
			r2.w = r2.w * r3.w;
			r3.x = r3.x * r4.w;
			r3.w = dot(r10.xyz, r2.xyz);
			r2.w = saturate(r2.w * r3.w);
			r3.w = dot(r7.xyz, r2.xyz);
			r3.x = saturate(r3.w * r3.x);
			r7.xyz = fma(r2.www, idx_uniforms0_ps.cb0[82 + floatBitsToInt(r8.z)].xyz, r9.xyz);
			r9.xyz = fma(r3.xxx, idx_uniforms0_ps.cb0[82 + floatBitsToInt(r8.w)].xyz, r7.xyz);
		}
	}
	else
	{
		r9.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
	}
	r7.xyz = fma(r1.zzz, idx_uniforms0_ps.cb0[2].xyz, r9.xyz);
	r6.xyz = r6.xyz + r7.xyz;
	r7.xyz = r0.xyz * r6.xyz;
	r1.z = saturate(dot(r5.xyz, r2.xyz));
	r2.w = r1.z + r1.z;
	r5.xyz = fma(r2.www, r2.xyz, -r5.xyz);
	r5.xyz = ((textureLod(resourceSamplerPair_8_ps, r5.xyz, r1.w))).xyz;
	r1.z = -r1.z + float(1.00000000f);
	r1.z = log2(r1.z);
	r1.z = r1.z * idx_uniforms2_ps.cb2[2].x;
	r1.z = exp2(r1.z);
	r1.z = saturate(r1.z + idx_uniforms2_ps.cb2[2].y);
	r1.z = saturate(r3.z * r1.z);
	r0.xyz = fma(-r0.xyz, r6.xyz, r5.xyz);
	r0.xyz = fma(r1.zzz, r0.xyz, r7.xyz);
	r1.z = r3.z * r3.z;
	r1.z = fma(r1.z, r3.z, float(0.100000001f));
	r1.w = r3.y + float(8.00000000f);
	r1.z = r1.z * r1.w;
	r1.z = r1.z * float(0.0398089178f);
	r0.w = fma(r0.w, float(1.44269502f), float(1.44269502f));
	r1.w = dot(r4.xyz, r2.xyz);
	r0.w = fma(r0.w, r1.w, -r0.w);
	r0.w = exp2(r0.w);
	r0.w = min(r0.w, float(1.00000000f));
	r0.w = r0.w * r1.z;
	r1.yzw = r1.yyy * idx_uniforms0_ps.cb0[1].xyz;
	r0.w = r0.w * r1.x;
	r0.xyz = fma(r1.yzw, r0.www, r0.xyz);
	r1.x = uintBitsToFloat(uint(0x3f800000));
	r1.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r1 = r1 * -v5.v.wwww;
	r1 = exp2(r1);
	r1 = min(r1, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = -r1.x + float(1.00000000f);
	r2.xyz = r0.www * idx_uniforms0_ps.cb0[13].xyz;
	r0.xyz = fma(r0.xyz, r1.yzw, r2.xyz);
	r0.w = saturate(float(1.00000000f) + -idx_uniforms1_ps.cb1[0].w);
	o0.xyz = fma(r0.xyz, r0.www, idx_uniforms1_ps.cb1[0].xyz);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

