#version 460 core
// ps_5_0
// Checksum: 2e340c96_32170dc7_1218b8b9_f8b1f581
// Name: charactereyegloss_indoor

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[4]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[13]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[5]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2DArrayShadow resourceSamplerPair_1_ps; // res14, s13

uniform sampler2D resourceSamplerPair_2_ps; // res6, s6

uniform samplerCube resourceSamplerPair_3_ps; // res3, s3

uniform samplerCube resourceSamplerPair_4_ps; // res5, s5


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
	r0.w = dot(v4.v.xyz, v4.v.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xyz = r0.www * v4.v.xyz;
	if (floatBitsToUint(idx_uniforms4_ps.cb4[3].x) != uint(0))
	{
		r2.xy = fma(v6.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r0.w = max(abs(r2.y), abs(r2.x));
		r1.w = intBitsToFloat(float(4.94999981f) >= r0.w ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r1.w) != uint(0))
		{
			r0.w = intBitsToFloat(r0.w < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
			r2.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.www), floatBitsToUint(v6.v.zxy), floatBitsToUint(v7.v.zxy)));
			r3.z = uintBitsToFloat(movc(floatBitsToUint(r0.w), uint(0x3f800000), uint(0x40000000)));
			r2.x = saturate(r2.x);
			r0.w = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
			r1.w = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
			r4.xw = fract(r0.ww);
			r4.yz = fract(r1.ww);
			r4 = r4 + vec4(-0.500000000f, -0.500000000f, -0.500000000f, -0.500000000f);
			r5 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r2.yzyz);
			r3.xy = fma(r4.xz, vec2(0.00195312500f, 0.00195312500f), r5.xy);
			r6.x = texture(resourceSamplerPair_1_ps, vec4(r3.xyz, r2.x));
			r3.xy = fma(-r4.xy, vec2(0.00195312500f, 0.00195312500f), r5.zw);
			r6.y = texture(resourceSamplerPair_1_ps, vec4(r3.xyz, r2.x));
			r5 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r2.yzyz);
			r3.xy = fma(r4.zw, vec2(0.00195312500f, -0.00195312500f), r5.xy);
			r6.z = texture(resourceSamplerPair_1_ps, vec4(r3.xyz, r2.x));
			r3.xy = fma(-r4.zw, vec2(0.00195312500f, -0.00195312500f), r5.zw);
			r6.w = texture(resourceSamplerPair_1_ps, vec4(r3.xyz, r2.x));
			r0.w = dot(r6, vec4(0.250000000f, 0.250000000f, 0.250000000f, 0.250000000f));
		}
		else
		{
			r0.w = uintBitsToFloat(uint(0x3f800000));
		}
	}
	else
	{
		r0.w = uintBitsToFloat(uint(0x3f800000));
	}
	r2.xy = v5.v.xz + idx_uniforms2_ps.cb2[0].xy;
	r3.x = v5.v.y * idx_uniforms0_ps.cb0[1].w;
	r3.y = v5.v.y * idx_uniforms0_ps.cb0[3].w;
	r2.xy = r2.xy + -r3.xy;
	r2.xy = r2.xy * idx_uniforms2_ps.cb2[0].zz;
	r1.w = ((texture(resourceSamplerPair_2_ps, r2.xy))).w;
	r1.w = saturate(r1.w + idx_uniforms2_ps.cb2[0].w);
	r0.w = r0.w * r1.w;
	r2.xyz = -v5.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = r1.www * r2.xyz;
	r0.w = r0.w * idx_uniforms2_ps.cb2[2].z;
	r3.xyz = fma(r2.xyz, vec3(5.00000000f, 5.00000000f, 5.00000000f), -idx_uniforms0_ps.cb0[3].xyz);
	r1.w = dot(r3.xyz, r3.xyz);
	r1.w = inversesqrt(r1.w);
	r3.xyz = r1.www * r3.xyz;
	r1.w = dot(-r2.xyz, r1.xyz);
	r1.w = r1.w + r1.w;
	r4.xyz = fma(r1.xyz, -r1.www, -r2.xyz);
	r5.x = dot(r4.xz, idx_uniforms2_ps.cb2[3].xy);
	r5.z = dot(r4.xz, idx_uniforms2_ps.cb2[3].zw);
	r5.y = r4.y;
	r4.xyz = ((textureLod(resourceSamplerPair_3_ps, r5.xyz, idx_uniforms2_ps.cb2[2].y))).xyz;
	r5.xyz = ((textureLod(resourceSamplerPair_4_ps, r5.xyz, idx_uniforms2_ps.cb2[2].y))).xyz;
	r5.xyz = -r4.xyz + r5.xyz;
	r4.xyz = fma(idx_uniforms2_ps.cb2[2].xxx, r5.xyz, r4.xyz);
	r1.w = saturate(dot(r4.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f)));
	r1.w = log2(r1.w);
	r1.w = r1.w * idx_uniforms2_ps.cb2[1].w;
	r1.w = exp2(r1.w);
	r1.w = r1.w * idx_uniforms2_ps.cb2[1].z;
	r5.xy = max(r0.ww, vec2(0.400000006f, 0.0500000007f));
	r0.w = r1.w * r5.x;
	r4.xyz = r0.www * r4.xyz;
	r0.w = -idx_uniforms2_ps.cb2[2].z + float(1.00000000f);
	r5.xzw = r0.www + idx_uniforms0_ps.cb0[2].xyz;
	r4.xyz = r4.xyz * r5.xzw;
	r0.w = saturate(dot(r1.xyz, r2.xyz));
	r0.w = -r0.w + float(1.00000000f);
	r1.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r0.w = fma(r0.w, float(4.00000000f), float(0.0500000007f));
	r0.w = min(r0.w, float(1.00000000f));
	r0.w = r0.w * idx_uniforms2_ps.cb2[4].x;
	r1.x = saturate(dot(r3.xyz, r1.xyz));
	r1.x = log2(r1.x);
	r1.x = r1.x * idx_uniforms2_ps.cb2[1].x;
	r1.x = exp2(r1.x);
	r1.x = r1.x * idx_uniforms2_ps.cb2[1].y;
	r1.xyz = r1.xxx * idx_uniforms0_ps.cb0[1].xyz;
	r1.xyz = r5.yyy * r1.xyz;
	r1.xyz = r1.xyz * idx_uniforms2_ps.cb2[4].xxx;
	r2.xyz = r0.www * r4.xyz;
	r0.yzw = fma(r2.xyz, r0.xyz, r1.xyz);
	r0.x = fma(r0.x, idx_uniforms2_ps.cb2[2].w, -idx_uniforms2_ps.cb2[2].w);
	o0.w = r0.x + float(1.00000000f);
	r0.x = saturate(float(1.00000000f) + -idx_uniforms1_ps.cb1[0].w);
	o0.xyz = fma(r0.yzw, r0.xxx, idx_uniforms1_ps.cb1[0].xyz);
	return;
}

