#version 460 core
// ps_5_0
// Checksum: b79fd57c_0b526b34_040b0d31_b69300c7
// Name: blurhorizontal

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = v1.v.xyxy + vec4(0.00156250002f, 0.00000000f, -0.00156250002f, -0.00000000f);
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r0.zw))).xyz;
	r0.xyz = ((texture(resourceSamplerPair_0_ps, r0.xy))).xyz;
	r1.xyz = r1.xyz * vec3(0.128571436f, 0.128571436f, 0.128571436f);
	r0.xyz = fma(r0.xyz, vec3(0.128571436f, 0.128571436f, 0.128571436f), r1.xyz);
	r1 = v1.v.xyxy + vec4(0.00468750019f, 0.00000000f, -0.00468750019f, -0.00000000f);
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy))).xyz;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r1.zw))).xyz;
	r0.xyz = fma(r2.xyz, vec3(0.114285715f, 0.114285715f, 0.114285715f), r0.xyz);
	r0.xyz = fma(r1.xyz, vec3(0.114285715f, 0.114285715f, 0.114285715f), r0.xyz);
	r1 = v1.v.xyxy + vec4(0.00781250000f, 0.00000000f, -0.00781250000f, -0.00000000f);
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy))).xyz;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r1.zw))).xyz;
	r0.xyz = fma(r2.xyz, vec3(0.100000001f, 0.100000001f, 0.100000001f), r0.xyz);
	r0.xyz = fma(r1.xyz, vec3(0.100000001f, 0.100000001f, 0.100000001f), r0.xyz);
	r1 = v1.v.xyxy + vec4(0.0109374998f, 0.00000000f, -0.0109374998f, -0.00000000f);
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy))).xyz;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r1.zw))).xyz;
	r0.xyz = fma(r2.xyz, vec3(0.0857142881f, 0.0857142881f, 0.0857142881f), r0.xyz);
	r0.xyz = fma(r1.xyz, vec3(0.0857142881f, 0.0857142881f, 0.0857142881f), r0.xyz);
	r1 = v1.v.xyxy + vec4(0.0140624996f, 0.00000000f, -0.0140624996f, -0.00000000f);
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy))).xyz;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r1.zw))).xyz;
	r0.xyz = fma(r2.xyz, vec3(0.0714285746f, 0.0714285746f, 0.0714285746f), r0.xyz);
	r0.xyz = fma(r1.xyz, vec3(0.0714285746f, 0.0714285746f, 0.0714285746f), r0.xyz);
	r1 = v1.v.xyxy + vec4(0.0171875004f, 0.00000000f, -0.0171875004f, -0.00000000f);
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy))).xyz;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r1.zw))).xyz;
	r0.xyz = fma(r2.xyz, vec3(0.0571428575f, 0.0571428575f, 0.0571428575f), r0.xyz);
	r0.xyz = fma(r1.xyz, vec3(0.0571428575f, 0.0571428575f, 0.0571428575f), r0.xyz);
	r1 = v1.v.xyxy + vec4(0.0203124993f, 0.00000000f, -0.0203124993f, -0.00000000f);
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy))).xyz;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r1.zw))).xyz;
	r0.xyz = fma(r2.xyz, vec3(0.0428571440f, 0.0428571440f, 0.0428571440f), r0.xyz);
	r0.xyz = fma(r1.xyz, vec3(0.0428571440f, 0.0428571440f, 0.0428571440f), r0.xyz);
	r1 = v1.v.xyxy + vec4(0.0234375000f, 0.00000000f, -0.0234375000f, -0.00000000f);
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy))).xyz;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r1.zw))).xyz;
	r0.xyz = fma(r2.xyz, vec3(0.0285714287f, 0.0285714287f, 0.0285714287f), r0.xyz);
	o0.xyz = fma(r1.xyz, vec3(0.0285714287f, 0.0285714287f, 0.0285714287f), r0.xyz);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

