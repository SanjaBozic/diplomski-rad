#version 460 core
// ps_5_0
// Checksum: d122d965_a5c1056b_4e7809ec_fc982d38
// Name: characterskingenerallod2_fw_fade

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
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[4]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[4096]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3

uniform sampler2D resourceSamplerPair_2_ps; // res1, s1

uniform sampler2D resourceSamplerPair_3_ps; // res2, s2

uniform sampler2D resourceSamplerPair_4_ps; // res7, s7

uniform sampler2DArrayShadow resourceSamplerPair_5_ps; // res14, s13

uniform sampler2D resourceSamplerPair_6_ps; // res6, s6

uniform usampler2D resourceSamplerPair_7_ps; // res10, s-1


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
	r2.yw = ((texture(resourceSamplerPair_3_ps, v1.v.xy)).xywz).yw;
	r1.w = dot(v2.v.xyz, v2.v.xyz);
	r1.w = inversesqrt(r1.w);
	r3.xyz = r1.www * v2.v.xyz;
	r1.w = dot(v3.v.xyz, v3.v.xyz);
	r1.w = inversesqrt(r1.w);
	r4.xyz = r1.www * v3.v.xyz;
	r4.xyz = r2.zzz * r4.xyz;
	r3.xyz = fma(r3.xyz, r2.xxx, r4.xyz);
	r1.w = dot(v4.v.xyz, v4.v.xyz);
	r1.w = inversesqrt(r1.w);
	r4.xyz = r1.www * v4.v.xyz;
	r3.xyz = fma(r4.xyz, r0.www, r3.xyz);
	r0.w = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r3.xyz = r0.www * r3.xyz;
	r0.w = fma(r2.y, float(7.00000000f), float(2.00000000f));
	r0.w = exp2(r0.w);
	r4.x = v3.v.w;
	r4.y = v4.v.w;
	r2.xz = r4.xy * idx_uniforms2_ps.cb2[1].zw;
	r4 = (texture(resourceSamplerPair_4_ps, r2.xz));
	r1.w = v2.v.w + v2.v.w;
	r2.x = max(r1.w, float(0.500000000f));
	r2.x = float(1.00000000f) / r2.x;
	r1.w = saturate(r1.w);
	r2.yz = r2.yx + vec2(8.00000000f, -1.00000000f);
	r2.x = saturate(fma(r2.x, r4.w, -r2.z));
	r1.w = r1.w * r2.x;
	r1.w = min(r1.w, r4.w);
	r1.w = max(r1.w, float(0.00000000f));
	r0.xyz = fma(-r0.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), r4.xyz);
	r0.xyz = fma(r1.www, r0.xyz, r1.xyz);
	if (floatBitsToUint(idx_uniforms4_ps.cb4[3].x) != uint(0))
	{
		r1.xy = fma(v6.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r1.x = max(abs(r1.y), abs(r1.x));
		r1.y = intBitsToFloat(float(4.94999981f) >= r1.x ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r1.y) != uint(0))
		{
			r1.x = intBitsToFloat(r1.x < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
			r1.yzw = uintBitsToFloat(movc(floatBitsToUint(r1.xxx), floatBitsToUint(v6.v.zxy), floatBitsToUint(v7.v.zxy)));
			r4.z = uintBitsToFloat(movc(floatBitsToUint(r1.x), uint(0x3f800000), uint(0x40000000)));
			r1.y = saturate(r1.y);
			r1.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
			r2.x = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
			r5.xw = fract(r1.xx);
			r5.yz = fract(r2.xx);
			r5 = r5 + vec4(-0.500000000f, -0.500000000f, -0.500000000f, -0.500000000f);
			r6 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r1.zwzw);
			r4.xy = fma(r5.xz, vec2(0.00195312500f, 0.00195312500f), r6.xy);
			r7.x = texture(resourceSamplerPair_5_ps, vec4(r4.xyz, r1.y));
			r4.xy = fma(-r5.xy, vec2(0.00195312500f, 0.00195312500f), r6.zw);
			r7.y = texture(resourceSamplerPair_5_ps, vec4(r4.xyz, r1.y));
			r6 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r1.zwzw);
			r4.xy = fma(r5.zw, vec2(0.00195312500f, -0.00195312500f), r6.xy);
			r7.z = texture(resourceSamplerPair_5_ps, vec4(r4.xyz, r1.y));
			r4.xy = fma(-r5.zw, vec2(0.00195312500f, -0.00195312500f), r6.zw);
			r7.w = texture(resourceSamplerPair_5_ps, vec4(r4.xyz, r1.y));
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
	r1.yzw = -v5.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r2.x = dot(r1.yzw, r1.yzw);
	r2.x = inversesqrt(r2.x);
	r2.z = saturate(fma(r3.y, float(0.500000000f), float(0.500000000f)));
	r4.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
	r4.xyz = fma(r2.zzz, r4.xyz, idx_uniforms0_ps.cb0[11].xyz);
	r1.yzw = fma(r1.yzw, r2.xxx, -idx_uniforms0_ps.cb0[3].xyz);
	r2.x = dot(r1.yzw, r1.yzw);
	r2.x = inversesqrt(r2.x);
	r1.yzw = r1.yzw * r2.xxx;
	r2.x = dot(-idx_uniforms0_ps.cb0[3].xyz, r3.xyz);
	r2.z = saturate(r2.x);
	r2.z = r1.x * r2.z;
	r5.xyz = v5.v.xyz + -idx_uniforms0_ps.cb0[7].xyz;
	r6.xy = fma(r5.xz, vec2(0.250000000f, 0.250000000f), idx_uniforms0_ps.cb0[8].xy);
	r6.xy = intBitsToFloat(ivec2(r6.xy));
	r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r6 = uintBitsToFloat((texelFetch(resourceSamplerPair_7_ps, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w)))));
	if (floatBitsToUint(r6.x) != uint(0))
	{
		r7.xyz = -r5.xyz + idx_uniforms0_ps.cb0[17 + floatBitsToInt(r6.x)].xyz;
		r8.xyz = -r5.xyz + idx_uniforms0_ps.cb0[17 + floatBitsToInt(r6.y)].xyz;
		r3.w = dot(r7.xyz, r7.xyz);
		r3.w = r3.w + -idx_uniforms0_ps.cb0[82 + floatBitsToInt(r6.x)].w;
		r3.w = max(r3.w, float(0.00100000005f));
		r4.w = dot(r8.xyz, r8.xyz);
		r4.w = r4.w + -idx_uniforms0_ps.cb0[82 + floatBitsToInt(r6.y)].w;
		r4.w = max(r4.w, float(0.00100000005f));
		r5.w = saturate(fma(-r3.w, idx_uniforms0_ps.cb0[17 + floatBitsToInt(r6.x)].w, float(1.00000000f)));
		r7.w = saturate(fma(-r4.w, idx_uniforms0_ps.cb0[17 + floatBitsToInt(r6.y)].w, float(1.00000000f)));
		r5.w = r5.w * r5.w;
		r7.w = r7.w * r7.w;
		r3.w = inversesqrt(r3.w);
		r4.w = inversesqrt(r4.w);
		r3.w = r3.w * r5.w;
		r4.w = r4.w * r7.w;
		r5.w = dot(r7.xyz, r3.xyz);
		r3.w = saturate(r3.w * r5.w);
		r5.w = dot(r8.xyz, r3.xyz);
		r4.w = saturate(r4.w * r5.w);
		r7.xyz = r4.www * idx_uniforms0_ps.cb0[82 + floatBitsToInt(r6.y)].xyz;
		r7.xyz = fma(r3.www, idx_uniforms0_ps.cb0[82 + floatBitsToInt(r6.x)].xyz, r7.xyz);
		if (floatBitsToUint(r6.z) != uint(0))
		{
			r8.xyz = -r5.xyz + idx_uniforms0_ps.cb0[17 + floatBitsToInt(r6.z)].xyz;
			r5.xyz = -r5.xyz + idx_uniforms0_ps.cb0[17 + floatBitsToInt(r6.w)].xyz;
			r3.w = dot(r8.xyz, r8.xyz);
			r3.w = r3.w + -idx_uniforms0_ps.cb0[82 + floatBitsToInt(r6.z)].w;
			r3.w = max(r3.w, float(0.00100000005f));
			r4.w = dot(r5.xyz, r5.xyz);
			r4.w = r4.w + -idx_uniforms0_ps.cb0[82 + floatBitsToInt(r6.w)].w;
			r4.w = max(r4.w, float(0.00100000005f));
			r5.w = saturate(fma(-r3.w, idx_uniforms0_ps.cb0[17 + floatBitsToInt(r6.z)].w, float(1.00000000f)));
			r6.x = saturate(fma(-r4.w, idx_uniforms0_ps.cb0[17 + floatBitsToInt(r6.w)].w, float(1.00000000f)));
			r5.w = r5.w * r5.w;
			r6.x = r6.x * r6.x;
			r3.w = inversesqrt(r3.w);
			r4.w = inversesqrt(r4.w);
			r3.w = r3.w * r5.w;
			r4.w = r4.w * r6.x;
			r5.w = dot(r8.xyz, r3.xyz);
			r3.w = saturate(r3.w * r5.w);
			r5.x = dot(r5.xyz, r3.xyz);
			r4.w = saturate(r4.w * r5.x);
			r5.xyz = fma(r3.www, idx_uniforms0_ps.cb0[82 + floatBitsToInt(r6.z)].xyz, r7.xyz);
			r7.xyz = fma(r4.www, idx_uniforms0_ps.cb0[82 + floatBitsToInt(r6.w)].xyz, r5.xyz);
		}
	}
	else
	{
		r7.xyz = uintBitsToFloat(uvec3(0x00000000, 0x00000000, 0x00000000));
	}
	r5.xyz = fma(r2.zzz, idx_uniforms0_ps.cb0[2].xyz, r7.xyz);
	r4.xyz = r4.xyz + r5.xyz;
	r2.z = r2.w * r2.w;
	r2.z = fma(r2.z, r2.w, float(0.100000001f));
	r2.y = r2.z * r2.y;
	r2.y = r2.y * float(0.0398089178f);
	r0.w = fma(r0.w, float(1.44269502f), float(1.44269502f));
	r1.y = dot(r1.yzw, r3.xyz);
	r0.w = fma(r0.w, r1.y, -r0.w);
	r0.w = saturate(exp2(r0.w));
	r0.w = r0.w * r2.y;
	r1.yzw = r2.xxx * idx_uniforms0_ps.cb0[1].xyz;
	r0.w = r0.w * r1.x;
	r1.xyz = r0.www * r1.yzw;
	r0.xyz = fma(r0.xyz, r4.xyz, r1.xyz);
	r1.x = uintBitsToFloat(uint(0x3f800000));
	r1.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r1 = r1 * -v5.v.wwww;
	r1 = saturate(exp2(r1));
	r0.w = -r1.x + float(1.00000000f);
	r2.xyz = r0.www * idx_uniforms0_ps.cb0[13].xyz;
	r0.xyz = fma(r0.xyz, r1.yzw, r2.xyz);
	r0.w = saturate(float(1.00000000f) + -idx_uniforms1_ps.cb1[0].w);
	o0.xyz = fma(r0.xyz, r0.www, idx_uniforms1_ps.cb1[0].xyz);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

