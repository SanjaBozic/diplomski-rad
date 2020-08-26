#version 460 core
// ps_5_0
// Checksum: 96fded4c_2e8aaca5_538ff6bc_3f6b760b
// Name: ghostproject_animated

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[3]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2DArrayShadow resourceSamplerPair_0_ps; // res14, s13

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3


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
	r0.xy = fma(v6.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r0.x = max(abs(r0.y), abs(r0.x));
	r0.y = intBitsToFloat(float(4.94999981f) >= r0.x ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r0.x = intBitsToFloat(r0.x < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
		r0.yzw = uintBitsToFloat(movc(floatBitsToUint(r0.xxx), floatBitsToUint(v6.v.zxy), floatBitsToUint(v7.v.zxy)));
		r1.z = uintBitsToFloat(movc(floatBitsToUint(r0.x), uint(0x3f800000), uint(0x40000000)));
		r0.y = saturate(r0.y);
		r0.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
		r1.w = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
		r2.xw = fract(r0.xx);
		r2.yz = fract(r1.ww);
		r2 = r2 + vec4(-0.500000000f, -0.500000000f, -0.500000000f, -0.500000000f);
		r3 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r0.zwzw);
		r1.xy = fma(r2.xz, vec2(0.00195312500f, 0.00195312500f), r3.xy);
		r4.x = texture(resourceSamplerPair_0_ps, vec4(r1.xyz, r0.y));
		r1.xy = fma(-r2.xy, vec2(0.00195312500f, 0.00195312500f), r3.zw);
		r4.y = texture(resourceSamplerPair_0_ps, vec4(r1.xyz, r0.y));
		r3 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r0.zwzw);
		r1.xy = fma(r2.zw, vec2(0.00195312500f, -0.00195312500f), r3.xy);
		r4.z = texture(resourceSamplerPair_0_ps, vec4(r1.xyz, r0.y));
		r1.xy = fma(-r2.zw, vec2(0.00195312500f, -0.00195312500f), r3.zw);
		r4.w = texture(resourceSamplerPair_0_ps, vec4(r1.xyz, r0.y));
		r0.x = dot(r4, vec4(0.250000000f, 0.250000000f, 0.250000000f, 0.250000000f));
	}
	else
	{
		r0.x = uintBitsToFloat(uint(0x3f800000));
	}
	r0.x = fma(idx_uniforms1_ps.cb1[1].y, r0.x, idx_uniforms1_ps.cb1[1].z);
	r0.yzw = -v3.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = inversesqrt(r1.x);
	r0.yzw = r0.yzw * r1.xxx;
	r1.x = dot(v5.v.xyz, v5.v.xyz);
	r1.x = inversesqrt(r1.x);
	r1.xyz = r1.xxx * v5.v.xyz;
	r2.xyz = v4.v.zxy * v5.v.yzx;
	r2.xyz = fma(v4.v.yzx, v5.v.zxy, -r2.xyz);
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = inversesqrt(r1.w);
	r2.xyz = r1.www * r2.xyz;
	r3.xyz = r1.zxy * r2.yzx;
	r3.xyz = fma(r1.yzx, r2.zxy, -r3.xyz);
	r2.xyz = r2.xyz * v4.v.www;
	r0.y = dot(r0.yzw, r1.xyz);
	r0.z = min(abs(r0.y), float(1.00000000f));
	r0.z = -r0.z + float(1.00000000f);
	r0.z = log2(r0.z);
	r0.z = r0.z * idx_uniforms1_ps.cb1[0].x;
	r0.z = exp2(r0.z);
	r0.z = r0.z * idx_uniforms1_ps.cb1[0].z;
	r4.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r4.xyz = r0.xxx * r4.xyz;
	r4.xyz = fma(r4.xyz, r0.zzz, r4.xyz);
	r2.xyz = r2.xyz * v2.v.yyy;
	r2.xyz = fma(r3.xyz, v2.v.xxx, -r2.xyz);
	r1.xyz = fma(r1.xyz, v2.v.zzz, r2.xyz);
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = inversesqrt(r0.w);
	r0.w = r0.w * r1.y;
	r0.w = log2(abs(r0.w));
	r0.w = r0.w * idx_uniforms1_ps.cb1[0].y;
	r0.w = exp2(r0.w);
	r0.z = saturate(fma(r0.w, idx_uniforms1_ps.cb1[0].w, r0.z));
	r0.w = fract(v1.v.z);
	r0.w = r0.w * float(1.50000000f);
	r0.w = min(r0.w, float(1.00000000f));
	r1.x = fma(-r0.w, float(3.79999995f), float(3.79999995f));
	r0.w = r0.w * r1.x;
	r0.w = r0.w * r0.w;
	r0.w = min(r0.w, float(1.00000000f));
	r0.w = r0.w + float(-0.300000012f);
	r1.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
	r2.xyz = r1.xyz * idx_uniforms1_ps.cb1[2].xyz;
	r3.xy = fma(idx_uniforms1_ps.cb1[1].xx, r0.ww, vec2(-0.200000003f, 0.300000012f));
	r3.x = saturate(r3.x);
	r1.xyz = fma(-idx_uniforms1_ps.cb1[2].xyz, r1.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r1.xyz = fma(r3.xxx, r1.xyz, r2.xyz);
	r0.w = -r3.y + float(2.00000000f);
	r0.w = max(r0.w, float(0.00000000f));
	r1.w = r3.y + idx_uniforms1_ps.cb1[1].w;
	r0.y = saturate(r0.y);
	r0.y = saturate(-r0.y + r1.w);
	r0.y = log2(r0.y);
	r0.y = r0.y * r0.w;
	r0.y = exp2(r0.y);
	r0.y = saturate(r0.y * idx_uniforms1_ps.cb1[2].w);
	r1.xyz = fma(r1.xyz, r0.xxx, -r4.xyz);
	r1.xyz = fma(r0.yyy, r1.xyz, r4.xyz);
	r0.x = r0.y + r0.z;
	o0.w = min(r0.x, float(1.00000000f));
	r0.x = uintBitsToFloat(uint(0x3f800000));
	r0.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0 = r0 * -v3.v.wwww;
	r0 = exp2(r0);
	r0 = min(r0, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.x = -r0.x + float(1.00000000f);
	r2.xyz = r0.xxx * idx_uniforms0_ps.cb0[13].xyz;
	o0.xyz = fma(r1.xyz, r0.yzw, r2.xyz);
	return;
}

