#version 460 core
// cs_5_0
// Checksum: 3e76b06f_d8996682_d44758fb_6f389b42
// Name: lowreshqblurh

vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8;
layout(local_size_x = 16, local_size_y = 16, local_size_z = 1) in;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_cs1 { vec4 cb1[2]; } idx_uniforms1_cs;

writeonly uniform restrict image2D u0;

// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_cs; // res0, s-1

uniform sampler2D resourceSamplerPair_1_cs; // res1, s-1


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = vec2(ivec2(gl_GlobalInvocationID.xy));
	r0.xy = r0.xy * idx_uniforms1_cs.cb1[0].zw;
	r0.xy = uintBitsToFloat(uvec2(r0.xy));
	r0.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r0 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w))));
	r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r2.xy = intBitsToFloat(ivec2(idx_uniforms1_cs.cb1[0].xy));
	r3 = intBitsToFloat(ivec4(-4, -4, -3, -3) * floatBitsToInt(r2.xyxy) + ivec4(gl_GlobalInvocationID.xyxy));
	r3 = vec4(floatBitsToInt(r3));
	r3 = r3 * idx_uniforms1_cs.cb1[0].zwzw;
	r3 = uintBitsToFloat(uvec4(r3.zwxy));
	r1.xy = r3.zw;
	r1 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w))));
	r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r5 = intBitsToFloat(floatBitsToInt(r2.xyxy) * ivec4(-6, -6, -8, -8) + ivec4(gl_GlobalInvocationID.xyxy));
	r4.xy = r5.zw;
	r2.z = ((texelFetch(resourceSamplerPair_1_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w)))).yzxw).z;
	r2.z = fma(r2.z, idx_uniforms1_cs.cb1[1].x, idx_uniforms1_cs.cb1[1].y);
	r2.z = float(1.00000000f) / r2.z;
	r4.xy = uintBitsToFloat(gl_GlobalInvocationID.xy);
	r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r2.w = ((texelFetch(resourceSamplerPair_1_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w)))).yzwx).w;
	r2.w = fma(r2.w, idx_uniforms1_cs.cb1[1].x, idx_uniforms1_cs.cb1[1].y);
	r2.w = float(1.00000000f) / r2.w;
	r2.z = -r2.w + r2.z;
	r4.x = fma(r2.w, float(0.0500000007f), float(1.00000000f));
	r4.x = idx_uniforms1_cs.cb1[1].z / r4.x;
	r2.z = saturate(fma(-r4.x, abs(r2.z), float(1.00000000f)));
	r4.y = r2.z * float(0.0629699975f);
	r2.z = fma(r2.z, float(0.0629699975f), float(0.153170004f));
	r1 = r1 * r4.yyyy;
	r0 = fma(r0, vec4(0.153170004f, 0.153170004f, 0.153170004f, 0.153170004f), r1);
	r3.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r1 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r3.xy), int(floatBitsToInt(r3.w))));
	r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r3.x = ((texelFetch(resourceSamplerPair_1_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w))))).x;
	r3.x = fma(r3.x, idx_uniforms1_cs.cb1[1].x, idx_uniforms1_cs.cb1[1].y);
	r3.x = float(1.00000000f) / r3.x;
	r3.x = -r2.w + r3.x;
	r3.x = saturate(fma(-r4.x, abs(r3.x), float(1.00000000f)));
	r3.y = r3.x * float(0.0929019973f);
	r2.z = fma(r3.x, float(0.0929019973f), r2.z);
	r0 = fma(r1, r3.yyyy, r0);
	r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r3 = intBitsToFloat(ivec4(-2, -2, 3, 3) * floatBitsToInt(r2.xyxy) + ivec4(gl_GlobalInvocationID.xyxy));
	r3 = vec4(floatBitsToInt(r3));
	r3 = r3 * idx_uniforms1_cs.cb1[0].zwzw;
	r3 = uintBitsToFloat(uvec4(r3.zwxy));
	r1.xy = r3.zw;
	r1 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w))));
	r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r6 = intBitsToFloat(floatBitsToInt(r2.xyxy) * ivec4(-2, -2, -4, -4) + ivec4(gl_GlobalInvocationID.xyxy));
	r5.xy = r6.zw;
	r4.y = ((texelFetch(resourceSamplerPair_1_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w)))).yxzw).y;
	r4.y = fma(r4.y, idx_uniforms1_cs.cb1[1].x, idx_uniforms1_cs.cb1[1].y);
	r4.y = float(1.00000000f) / r4.y;
	r4.y = -r2.w + r4.y;
	r4.y = saturate(fma(-r4.x, abs(r4.y), float(1.00000000f)));
	r4.z = r4.y * float(0.122648999f);
	r2.z = fma(r4.y, float(0.122648999f), r2.z);
	r0 = fma(r1, r4.zzzz, r0);
	r1.xy = intBitsToFloat(ivec2(gl_GlobalInvocationID.xy) + -floatBitsToInt(r2.xy));
	r1.xy = vec2(floatBitsToInt(r1.xy));
	r1.xy = r1.xy * idx_uniforms1_cs.cb1[0].zw;
	r1.xy = uintBitsToFloat(uvec2(r1.xy));
	r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r1 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w))));
	r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r4.y = ((texelFetch(resourceSamplerPair_1_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w)))).yxzw).y;
	r4.y = fma(r4.y, idx_uniforms1_cs.cb1[1].x, idx_uniforms1_cs.cb1[1].y);
	r4.y = float(1.00000000f) / r4.y;
	r4.y = -r2.w + r4.y;
	r4.y = saturate(fma(-r4.x, abs(r4.y), float(1.00000000f)));
	r4.z = r4.y * float(0.144893005f);
	r2.z = fma(r4.y, float(0.144893005f), r2.z);
	r0 = fma(r1, r4.zzzz, r0);
	r1.xy = intBitsToFloat(ivec2(gl_GlobalInvocationID.xy) + floatBitsToInt(r2.xy));
	r1.xy = vec2(floatBitsToInt(r1.xy));
	r1.xy = r1.xy * idx_uniforms1_cs.cb1[0].zw;
	r1.xy = uintBitsToFloat(uvec2(r1.xy));
	r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r1 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w))));
	r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r6 = intBitsToFloat(floatBitsToInt(r2.xyxy) << ivec4(1, 1, 2, 2));
	r7.xy = intBitsToFloat(floatBitsToInt(r2.xy) * ivec2(6, 6) + ivec2(gl_GlobalInvocationID.xy));
	r8 = intBitsToFloat(ivec4(gl_GlobalInvocationID.xyxy) + floatBitsToInt(r6));
	r6 = intBitsToFloat(floatBitsToInt(r6.xyxy) << ivec4(1, 1, 2, 2));
	r6 = intBitsToFloat(ivec4(gl_GlobalInvocationID.xyxy) + floatBitsToInt(r6.zwxy));
	r5.xy = r8.xy;
	r8 = vec4(floatBitsToInt(r8));
	r8 = r8 * idx_uniforms1_cs.cb1[0].zwzw;
	r8 = uintBitsToFloat(uvec4(r8.zwxy));
	r2.x = ((texelFetch(resourceSamplerPair_1_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w))))).x;
	r2.x = fma(r2.x, idx_uniforms1_cs.cb1[1].x, idx_uniforms1_cs.cb1[1].y);
	r2.x = float(1.00000000f) / r2.x;
	r2.x = -r2.w + r2.x;
	r2.x = saturate(fma(-r4.x, abs(r2.x), float(1.00000000f)));
	r2.y = r2.x * float(0.144893005f);
	r2.x = fma(r2.x, float(0.144893005f), r2.z);
	r0 = fma(r1, r2.yyyy, r0);
	r1.xy = r8.zw;
	r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r1 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w))));
	r5.xy = r6.zw;
	r5.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r2.y = ((texelFetch(resourceSamplerPair_1_cs, floatBitsToInt(r5.xy), int(floatBitsToInt(r5.w)))).yxzw).y;
	r2.y = fma(r2.y, idx_uniforms1_cs.cb1[1].x, idx_uniforms1_cs.cb1[1].y);
	r2.y = float(1.00000000f) / r2.y;
	r2.y = -r2.w + r2.y;
	r2.y = saturate(fma(-r4.x, abs(r2.y), float(1.00000000f)));
	r2.z = r2.y * float(0.122648999f);
	r2.x = fma(r2.y, float(0.122648999f), r2.x);
	r0 = fma(r1, r2.zzzz, r0);
	r3.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r1 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r3.xy), int(floatBitsToInt(r3.w))));
	r7.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r2.y = ((texelFetch(resourceSamplerPair_1_cs, floatBitsToInt(r7.xy), int(floatBitsToInt(r7.w)))).yxzw).y;
	r2.y = fma(r2.y, idx_uniforms1_cs.cb1[1].x, idx_uniforms1_cs.cb1[1].y);
	r2.y = float(1.00000000f) / r2.y;
	r2.y = -r2.w + r2.y;
	r2.y = saturate(fma(-r4.x, abs(r2.y), float(1.00000000f)));
	r2.z = r2.y * float(0.0929019973f);
	r2.x = fma(r2.y, float(0.0929019973f), r2.x);
	r0 = fma(r1, r2.zzzz, r0);
	r8.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r1 = (texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r8.xy), int(floatBitsToInt(r8.w))));
	r6.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r2.y = ((texelFetch(resourceSamplerPair_1_cs, floatBitsToInt(r6.xy), int(floatBitsToInt(r6.w)))).yxzw).y;
	r2.y = fma(r2.y, idx_uniforms1_cs.cb1[1].x, idx_uniforms1_cs.cb1[1].y);
	r2.y = float(1.00000000f) / r2.y;
	r2.y = -r2.w + r2.y;
	r2.y = saturate(fma(-r4.x, abs(r2.y), float(1.00000000f)));
	r2.z = r2.y * float(0.0629699975f);
	r2.x = fma(r2.y, float(0.0629699975f), r2.x);
	r2.x = r2.x + float(9.99999975e-05f);
	r0 = fma(r1, r2.zzzz, r0);
	r0 = r0 / r2.xxxx;
	imageStore(u0, ivec2(gl_GlobalInvocationID.xy), r0);
	return;
}

