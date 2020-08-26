#version 460 core
// cs_5_0
// Checksum: b2cc34de_dcd9acf8_4b76c709_c871022d
// Name: bokehextractneardof

vec4 r0, r1;
layout(local_size_x = 32, local_size_y = 8, local_size_z = 1) in;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_cs1 { vec4 cb1[3]; } idx_uniforms1_cs;

writeonly uniform restrict image2D u0;

// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_cs; // res0, s-1


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = uintBitsToFloat(uvec4(imageSize( u0 ), 0, 1).xy);
	r0.xy = vec2(floatBitsToUint(r0.xy));
	r0.zw = vec2(gl_GlobalInvocationID.xy);
	r0.xy = r0.zw / r0.xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), idx_uniforms1_cs.cb1[1].xy);
	r0.xy = r0.xy + vec2(-1.00000000f, -1.00000000f);
	r0.x = r0.x / idx_uniforms1_cs.cb1[2].z;
	r0.x = dot(r0.xy, r0.xy);
	r0.x = sqrt(r0.x);
	r0.x = saturate(r0.x + -idx_uniforms1_cs.cb1[2].x);
	r0.x = r0.x * r0.x;
	r0.x = saturate(r0.x * idx_uniforms1_cs.cb1[2].y);
	r1.xy = intBitsToFloat(ivec2(gl_GlobalInvocationID.xy) << ivec2(2, 2));
	r1.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r0.y = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r1.xy), int(floatBitsToInt(r1.w)))).yxzw).y;
	r0.y = fma(r0.y, idx_uniforms1_cs.cb1[1].z, idx_uniforms1_cs.cb1[1].w);
	r0.y = float(1.00000000f) / r0.y;
	r0.y = saturate(fma(r0.y, idx_uniforms1_cs.cb1[0].z, idx_uniforms1_cs.cb1[0].w));
	r0.y = saturate(r0.y * idx_uniforms1_cs.cb1[0].x);
	r0.x = r0.x + r0.y;
	r0.x = min(r0.x, float(1.00000000f));
	r0.x = r0.x * r0.x;
	imageStore(u0, ivec2(gl_GlobalInvocationID.xy), r0.xxxx);
	return;
}

