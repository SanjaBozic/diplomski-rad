#version 460 core
// cs_5_0
// Checksum: b5324b6f_048cd7fc_3bde2d46_0d4d42d3
// Name: bokehblurneardof

vec4 r0, r1, r2;
layout(local_size_x = 32, local_size_y = 8, local_size_z = 1) in;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_cs1 { vec4 cb1[1]; } idx_uniforms1_cs;

writeonly uniform restrict image2D u0;

// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_cs; // res0, s-1


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = uintBitsToFloat(gl_GlobalInvocationID.xy);
	r0.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r0.x = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w))))).x;
	r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r0.yz = intBitsToFloat(ivec2(idx_uniforms1_cs.cb1[0].xy));
	r2 = intBitsToFloat(ivec4(-2, -2, -3, -3) * floatBitsToInt(r0.yzyz) + ivec4(gl_GlobalInvocationID.xyxy));
	r1.xy = r2.zw;
	r0.w = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w)))).yzwx).w;
	r0.w = r0.w * float(0.0929019973f);
	r0.x = fma(r0.x, float(0.153170004f), r0.w);
	r2.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r0.w = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r2.xy), int(floatBitsToInt(r2.w)))).yzwx).w;
	r0.x = fma(r0.w, float(0.122648999f), r0.x);
	r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r1.xy = intBitsToFloat(ivec2(gl_GlobalInvocationID.xy) + -floatBitsToInt(r0.yz));
	r0.w = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w)))).yzwx).w;
	r0.x = fma(r0.w, float(0.144893005f), r0.x);
	r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r1.xy = intBitsToFloat(ivec2(gl_GlobalInvocationID.xy) + floatBitsToInt(r0.yz));
	r0.w = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w)))).yzwx).w;
	r0.x = fma(r0.w, float(0.144893005f), r0.x);
	r1.xy = intBitsToFloat(floatBitsToInt(r0.yz) << ivec2(1, 1));
	r2.xy = intBitsToFloat(ivec2(3, 3) * floatBitsToInt(r0.yz) + ivec2(gl_GlobalInvocationID.xy));
	r1.xy = intBitsToFloat(ivec2(gl_GlobalInvocationID.xy) + floatBitsToInt(r1.xy));
	r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r0.y = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w)))).yxzw).y;
	r0.x = fma(r0.y, float(0.122648999f), r0.x);
	r2.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r0.y = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r2.xy), int(floatBitsToInt(r2.w)))).yxzw).y;
	r0.x = fma(r0.y, float(0.0929019973f), r0.x);
	r0.x = r0.x * float(1.14395797f);
	imageStore(u0, ivec2(gl_GlobalInvocationID.xy), r0.xxxx);
	return;
}
