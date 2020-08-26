#version 460 core
// cs_5_0
// Checksum: f5cd61ef_5e66922a_f7a687cd_d400da45
// Name: fxaapass2hdebugcs_highresy

uniform uvec4 icb_cs[8] = uvec4[8] ( uvec4( 0x3f800000, 0x00000000, 0x00000000, 0x00000000 ),
                          uvec4( 0x40200000, 0x00000000, 0x00000000, 0x00000000 ),
                          uvec4( 0x40900000, 0x00000000, 0x00000000, 0x00000000 ),
                          uvec4( 0x40d00000, 0x00000000, 0x00000000, 0x00000000 ),
                          uvec4( 0x41080000, 0x00000000, 0x00000000, 0x00000000 ),
                          uvec4( 0x41280000, 0x00000000, 0x00000000, 0x00000000 ),
                          uvec4( 0x41680000, 0x00000000, 0x00000000, 0x00000000 ),
                          uvec4( 0x41b40000, 0x00000000, 0x00000000, 0x00000000 ) );
layout (std430) readonly buffer res_block1_cs { float res_cs1[]; };
vec4 r0, r1, r2, r3, r4, r5;
layout(local_size_x = 64, local_size_y = 1, local_size_z = 1) in;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_cs0 { vec4 cb0[1]; } idx_uniforms0_cs;

writeonly uniform restrict image2D u0;

// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_cs; // res0, s0


void Initialise()
{
}


ivec4 bfi(in ivec4 src0, in ivec4 src1, in ivec4 src2, in ivec4 src3)
{
	ivec4 result;
	result.x = bitfieldInsert(src0.x,src1.x,src2.x,src3.x);
	result.y = bitfieldInsert(src0.y,src1.y,src2.y,src3.y);
	result.z = bitfieldInsert(src0.z,src1.z,src2.z,src3.z);
	result.w = bitfieldInsert(src0.w,src1.w,src2.w,src3.w);
	return result;
}

ivec3 bfi(in ivec3 src0, in ivec3 src1, in ivec3 src2, in ivec3 src3)
{
	ivec3 result;
	result.x = bitfieldInsert(src0.x,src1.x,src2.x,src3.x);
	result.y = bitfieldInsert(src0.y,src1.y,src2.y,src3.y);
	result.z = bitfieldInsert(src0.z,src1.z,src2.z,src3.z);
	return result;
}

ivec2 bfi(in ivec2 src0, in ivec2 src1, in ivec2 src2, in ivec2 src3)
{
	ivec2 result;
	result.x = bitfieldInsert(src0.x,src1.x,src2.x,src3.x);
	result.y = bitfieldInsert(src0.y,src1.y,src2.y,src3.y);
	return result;
}

int bfi(in int src0, in int src1, in int src2, in int src3)
{
	int result;
	result = bitfieldInsert(src0,src1,src2,src3);
	return result;
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

void main()
{
	Initialise();
	r0.x = res_cs1[gl_GlobalInvocationID.x * 4u  + uint(0x00000000) / 4u + 0u];
	r0.yz = uintBitsToFloat(floatBitsToUint(r0.xx) & uvec2(0x000000fe, 0x00000001));
	r1.xy = vec2(floatBitsToUint(r0.yz));
	r0.y = r1.x * float(0.00196850393f);
	r0.zw = uintBitsToFloat(floatBitsToUint(r0.xx) >> uvec2(0x00000008, 0x00000013));
	r2.xy = uintBitsToFloat(floatBitsToUint(r0.zw) & uvec2(0x000007ff, 0x00001fff));
	r0.x = intBitsToFloat(bfi(int(0), floatBitsToInt(r0.x), int(1), int(1)));
	r3.y = intBitsToFloat(floatBitsToInt(r0.x) + floatBitsToInt(r2.y));
	r2.zw = uintBitsToFloat(uvec2(0xffffffff, 0x00000000));
	r3.xw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r4.xy = intBitsToFloat(floatBitsToInt(r2.xz) + floatBitsToInt(r3.xy));
	r4.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r0.x = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r4.xy), int(floatBitsToInt(r4.w))))).x;
	r0.zw = vec2(floatBitsToUint(r2.xy));
	r1.z = uintBitsToFloat(uint(0x3f000000));
	r0.zw = r1.zy + r0.zw;
	r1.x = ((texelFetch(resourceSamplerPair_0_cs, floatBitsToInt(r2.xy), int(floatBitsToInt(r2.w))))).x;
	r1.y = r0.x + r1.x;
	r0.x = r0.x + -r1.x;
	r1.x = intBitsToFloat(float(0.00000000f) < r0.x ? int(0xffffffff) : int(0x00000000));
	r1.z = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r1.x = intBitsToFloat(floatBitsToInt(r1.z) + -floatBitsToInt(r1.x));
	r1.x = float(floatBitsToInt(r1.x));
	r0.x = abs(r0.x) * float(0.250000000f);
	r3.z = idx_uniforms0_cs.cb0[0].x;
	r3.xy = uintBitsToFloat(uvec2(0x41b40000, 0x00000000));
	r4.xy = uintBitsToFloat(uvec2(0x41b40000, 0x00000000));
	r1.z = uintBitsToFloat(uint(0x00000000));
	while (true)
	{
		r1.w = intBitsToFloat(floatBitsToUint(r1.z) >= uint(0x00000007) ? int(0xffffffff) : int(0x00000000));
		if (floatBitsToUint(r1.w) != uint(0))
			break;
		r2.zw = r3.zw * uintBitsToFloat(icb_cs[floatBitsToInt(r1.z)].xx);
		r4.zw = fma(r0.zw, idx_uniforms0_cs.cb0[0].xy, -r2.zw);
		r2.zw = fma(r0.zw, idx_uniforms0_cs.cb0[0].xy, r2.zw);
		r1.w = ((textureLod(resourceSamplerPair_0_cs, r4.zw, float(0.00000000f))).yzwx).w;
		r1.w = fma(-r1.y, float(0.500000000f), r1.w);
		r4.z = intBitsToFloat(abs(r1.w) >= r0.x ? int(0xffffffff) : int(0x00000000));
		r4.w = intBitsToFloat(uintBitsToFloat(icb_cs[floatBitsToInt(r1.z)].x) < r3.x ? int(0xffffffff) : int(0x00000000));
		r4.z = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r1.w ? int(0xffffffff) : int(0x00000000));
		r1.w = intBitsToFloat(r1.w < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		r1.w = intBitsToFloat(floatBitsToInt(r1.w) + -floatBitsToInt(r4.w));
		r1.w = float(floatBitsToInt(r1.w));
		r5.y = intBitsToFloat(r1.w == r1.x ? int(0xffffffff) : int(0x00000000));
		r5.xz = uintBitsToFloat(icb_cs[floatBitsToInt(r1.z)].xx);
		r3.xy = uintBitsToFloat(movc(floatBitsToUint(r4.zz), floatBitsToUint(r5.xy), floatBitsToUint(r3.xy)));
		r1.w = ((textureLod(resourceSamplerPair_0_cs, r2.zw, float(0.00000000f))).yzwx).w;
		r1.w = fma(-r1.y, float(0.500000000f), r1.w);
		r2.z = intBitsToFloat(abs(r1.w) >= r0.x ? int(0xffffffff) : int(0x00000000));
		r2.w = intBitsToFloat(uintBitsToFloat(icb_cs[floatBitsToInt(r1.z)].x) < r4.x ? int(0xffffffff) : int(0x00000000));
		r2.z = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r2.z));
		r2.w = intBitsToFloat(float(0.00000000f) < r1.w ? int(0xffffffff) : int(0x00000000));
		r1.w = intBitsToFloat(r1.w < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		r1.w = intBitsToFloat(floatBitsToInt(r1.w) + -floatBitsToInt(r2.w));
		r1.w = float(floatBitsToInt(r1.w));
		r5.w = intBitsToFloat(r1.w == r1.x ? int(0xffffffff) : int(0x00000000));
		r4.xy = uintBitsToFloat(movc(floatBitsToUint(r2.zz), floatBitsToUint(r5.zw), floatBitsToUint(r4.xy)));
		r1.z = intBitsToFloat(floatBitsToInt(r1.z) + int(1));
	}
	r0.x = min(r3.x, r4.x);
	r0.z = r3.x + r4.x;
	r0.x = r0.x / r0.z;
	r0.x = -r0.x + float(0.500000000f);
	r0.z = intBitsToFloat(r3.x < r4.x ? int(0xffffffff) : int(0x00000000));
	r0.z = uintBitsToFloat(movc(floatBitsToUint(r0.z), floatBitsToUint(r3.y), floatBitsToUint(r4.y)));
	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
	r0.x = max(r0.x, r0.y);
	r0.y = intBitsToFloat(float(0.00999999978f) < r0.x ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r1.xw = r0.xx + r0.xx;
		r1.y = fma(-r0.x, float(2.00000000f), float(1.00000000f));
		r1.z = uintBitsToFloat(uint(0x00000000));
		imageStore(u0, floatBitsToInt(r2.xy), r1);
	}
	return;
}

