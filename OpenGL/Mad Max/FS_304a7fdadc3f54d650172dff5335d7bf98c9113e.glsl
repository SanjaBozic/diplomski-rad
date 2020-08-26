#version 460 core
// ps_5_0
// Checksum: 4943c355_a0053c5f_6435d15e_cfe3e93a
// Name: motionblur

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = (textureLod(resourceSamplerPair_0_ps, v1.v.xy, float(0.00000000f)));
	r1 = (textureLod(resourceSamplerPair_1_ps, v1.v.xy, float(0.00000000f)));
	r1.xy = r1.xy + vec2(-0.500000000f, -0.500000000f);
	r1.w = r1.w * float(0.0299999993f);
	r1.w = max(r1.w, idx_uniforms1_ps.cb1[0].x);
	r2.xy = r1.ww * r1.xy;
	r2.z = dot(r2.xy, r2.xy);
	r2.w = intBitsToFloat(float(9.99999994e-09f) < r2.z ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r2.w) != uint(0))
	{
		r3 = r2.xyxy * vec4(-4.00000000f, -4.00000000f, -3.00000000f, -3.00000000f);
		r4 = fma(r2.xyxy, vec4(-4.00000000f, -4.00000000f, -3.00000000f, -3.00000000f), v1.v.xyxy);
		r5 = (textureLod(resourceSamplerPair_1_ps, r4.xy, float(0.00000000f)));
		r5.xy = r5.xy + vec2(-0.500000000f, -0.500000000f);
		r2.w = r5.w * float(0.0299999993f);
		r2.w = max(r2.w, idx_uniforms1_ps.cb1[0].x);
		r5.xy = r2.ww * r5.xy;
		r2.w = intBitsToFloat(r5.z >= r1.z ? int(0xffffffff) : int(0x00000000));
		r5.x = dot(r5.xy, r5.xy);
		r5.x = r5.x * float(16.0000000f);
		r3.x = dot(r3.xy, r3.xy);
		r3.x = intBitsToFloat(r5.x >= r3.x ? int(0xffffffff) : int(0x00000000));
		r2.w = uintBitsToFloat(floatBitsToUint(r2.w) | floatBitsToUint(r3.x));
		if (floatBitsToUint(r2.w) != uint(0))
		{
			r5 = (textureLod(resourceSamplerPair_0_ps, r4.xy, float(0.00000000f)));
			r0 = r0 + r5;
			r2.w = uintBitsToFloat(uint(0x40000000));
		}
		else
		{
			r2.w = uintBitsToFloat(uint(0x3f800000));
		}
		r5 = (textureLod(resourceSamplerPair_1_ps, r4.zw, float(0.00000000f)));
		r3.xy = r5.xy + vec2(-0.500000000f, -0.500000000f);
		r4.x = r5.w * float(0.0299999993f);
		r4.x = max(r4.x, idx_uniforms1_ps.cb1[0].x);
		r3.xy = r3.xy * r4.xx;
		r4.x = intBitsToFloat(r5.z >= r1.z ? int(0xffffffff) : int(0x00000000));
		r3.x = dot(r3.xy, r3.xy);
		r3.x = r3.x * float(16.0000000f);
		r3.y = dot(r3.zw, r3.zw);
		r3.x = intBitsToFloat(r3.x >= r3.y ? int(0xffffffff) : int(0x00000000));
		r3.x = uintBitsToFloat(floatBitsToUint(r3.x) | floatBitsToUint(r4.x));
		if (floatBitsToUint(r3.x) != uint(0))
		{
			r3 = (textureLod(resourceSamplerPair_0_ps, r4.zw, float(0.00000000f)));
			r0 = r0 + r3;
			r2.w = r2.w + float(1.00000000f);
		}
		r3 = r2.xyxy * vec4(-2.00000000f, -2.00000000f, 3.00000000f, 3.00000000f);
		r4 = fma(r2.xyxy, vec4(-2.00000000f, -2.00000000f, 3.00000000f, 3.00000000f), v1.v.xyxy);
		r5 = (textureLod(resourceSamplerPair_1_ps, r4.xy, float(0.00000000f)));
		r5.xy = r5.xy + vec2(-0.500000000f, -0.500000000f);
		r5.w = r5.w * float(0.0299999993f);
		r5.w = max(r5.w, idx_uniforms1_ps.cb1[0].x);
		r5.xy = r5.ww * r5.xy;
		r5.z = intBitsToFloat(r5.z >= r1.z ? int(0xffffffff) : int(0x00000000));
		r5.x = dot(r5.xy, r5.xy);
		r5.x = r5.x * float(16.0000000f);
		r3.x = dot(r3.xy, r3.xy);
		r3.x = intBitsToFloat(r5.x >= r3.x ? int(0xffffffff) : int(0x00000000));
		r3.x = uintBitsToFloat(floatBitsToUint(r3.x) | floatBitsToUint(r5.z));
		if (floatBitsToUint(r3.x) != uint(0))
		{
			r5 = (textureLod(resourceSamplerPair_0_ps, r4.xy, float(0.00000000f)));
			r0 = r0 + r5;
			r2.w = r2.w + float(1.00000000f);
		}
		r3.xy = fma(-r1.xy, r1.ww, v1.v.xy);
		r5 = (textureLod(resourceSamplerPair_1_ps, r3.xy, float(0.00000000f)));
		r4.xy = r5.xy + vec2(-0.500000000f, -0.500000000f);
		r5.x = r5.w * float(0.0299999993f);
		r5.x = max(r5.x, idx_uniforms1_ps.cb1[0].x);
		r4.xy = r4.xy * r5.xx;
		r5.x = intBitsToFloat(r5.z >= r1.z ? int(0xffffffff) : int(0x00000000));
		r4.x = dot(r4.xy, r4.xy);
		r4.x = r4.x * float(16.0000000f);
		r4.y = dot(-r2.xy, -r2.xy);
		r4.x = intBitsToFloat(r4.x >= r4.y ? int(0xffffffff) : int(0x00000000));
		r4.x = uintBitsToFloat(floatBitsToUint(r4.x) | floatBitsToUint(r5.x));
		if (floatBitsToUint(r4.x) != uint(0))
		{
			r5 = (textureLod(resourceSamplerPair_0_ps, r3.xy, float(0.00000000f)));
			r0 = r0 + r5;
			r2.w = r2.w + float(1.00000000f);
		}
		r1.xy = fma(r1.xy, r1.ww, v1.v.xy);
		r5 = (textureLod(resourceSamplerPair_1_ps, r1.xy, float(0.00000000f)));
		r3.xy = r5.xy + vec2(-0.500000000f, -0.500000000f);
		r1.w = r5.w * float(0.0299999993f);
		r1.w = max(r1.w, idx_uniforms1_ps.cb1[0].x);
		r3.xy = r1.ww * r3.xy;
		r1.w = intBitsToFloat(r5.z >= r1.z ? int(0xffffffff) : int(0x00000000));
		r3.x = dot(r3.xy, r3.xy);
		r3.x = r3.x * float(16.0000000f);
		r2.z = intBitsToFloat(r3.x >= r2.z ? int(0xffffffff) : int(0x00000000));
		r1.w = uintBitsToFloat(floatBitsToUint(r1.w) | floatBitsToUint(r2.z));
		if (floatBitsToUint(r1.w) != uint(0))
		{
			r5 = (textureLod(resourceSamplerPair_0_ps, r1.xy, float(0.00000000f)));
			r0 = r0 + r5;
			r2.w = r2.w + float(1.00000000f);
		}
		r1.xy = r2.xy + r2.xy;
		r3.xy = fma(r2.xy, vec2(2.00000000f, 2.00000000f), v1.v.xy);
		r5 = (textureLod(resourceSamplerPair_1_ps, r3.xy, float(0.00000000f)));
		r4.xy = r5.xy + vec2(-0.500000000f, -0.500000000f);
		r1.w = r5.w * float(0.0299999993f);
		r1.w = max(r1.w, idx_uniforms1_ps.cb1[0].x);
		r4.xy = r1.ww * r4.xy;
		r1.w = intBitsToFloat(r5.z >= r1.z ? int(0xffffffff) : int(0x00000000));
		r2.z = dot(r4.xy, r4.xy);
		r2.z = r2.z * float(16.0000000f);
		r1.x = dot(r1.xy, r1.xy);
		r1.x = intBitsToFloat(r2.z >= r1.x ? int(0xffffffff) : int(0x00000000));
		r1.x = uintBitsToFloat(floatBitsToUint(r1.x) | floatBitsToUint(r1.w));
		if (floatBitsToUint(r1.x) != uint(0))
		{
			r5 = (textureLod(resourceSamplerPair_0_ps, r3.xy, float(0.00000000f)));
			r0 = r0 + r5;
			r2.w = r2.w + float(1.00000000f);
		}
		r5 = (textureLod(resourceSamplerPair_1_ps, r4.zw, float(0.00000000f)));
		r1.xy = r5.xy + vec2(-0.500000000f, -0.500000000f);
		r1.w = r5.w * float(0.0299999993f);
		r1.w = max(r1.w, idx_uniforms1_ps.cb1[0].x);
		r1.xy = r1.ww * r1.xy;
		r1.w = intBitsToFloat(r5.z >= r1.z ? int(0xffffffff) : int(0x00000000));
		r1.x = dot(r1.xy, r1.xy);
		r1.x = r1.x * float(16.0000000f);
		r1.y = dot(r3.zw, r3.zw);
		r1.x = intBitsToFloat(r1.x >= r1.y ? int(0xffffffff) : int(0x00000000));
		r1.x = uintBitsToFloat(floatBitsToUint(r1.x) | floatBitsToUint(r1.w));
		if (floatBitsToUint(r1.x) != uint(0))
		{
			r3 = (textureLod(resourceSamplerPair_0_ps, r4.zw, float(0.00000000f)));
			r0 = r0 + r3;
			r2.w = r2.w + float(1.00000000f);
		}
		r1.xy = r2.xy * vec2(4.00000000f, 4.00000000f);
		r2.xy = fma(r2.xy, vec2(4.00000000f, 4.00000000f), v1.v.xy);
		r3 = (textureLod(resourceSamplerPair_1_ps, r2.xy, float(0.00000000f)));
		r3.xy = r3.xy + vec2(-0.500000000f, -0.500000000f);
		r1.w = r3.w * float(0.0299999993f);
		r1.w = max(r1.w, idx_uniforms1_ps.cb1[0].x);
		r3.xy = r1.ww * r3.xy;
		r1.z = intBitsToFloat(r3.z >= r1.z ? int(0xffffffff) : int(0x00000000));
		r1.w = dot(r3.xy, r3.xy);
		r1.w = r1.w * float(16.0000000f);
		r1.x = dot(r1.xy, r1.xy);
		r1.x = intBitsToFloat(r1.w >= r1.x ? int(0xffffffff) : int(0x00000000));
		r1.x = uintBitsToFloat(floatBitsToUint(r1.x) | floatBitsToUint(r1.z));
		if (floatBitsToUint(r1.x) != uint(0))
		{
			r1 = (textureLod(resourceSamplerPair_0_ps, r2.xy, float(0.00000000f)));
			r0 = r0 + r1;
			r2.w = r2.w + float(1.00000000f);
		}
		r0 = r0 / r2.wwww;
		o0.w = r0.w;
	}
	else
	{
		o0.w = r0.w;
	}
	r0.xyz = log2(r0.xyz);
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[0].yyy;
	o0.xyz = exp2(r0.xyz);
	return;
}

