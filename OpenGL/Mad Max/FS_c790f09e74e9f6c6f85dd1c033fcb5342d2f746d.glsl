#version 460 core
// ps_5_0
// Checksum: defb5119_c29211d3_7e489fd8_6d29756e
// Name: particleeffectshadowoutput

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[15]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2DArrayShadow resourceSamplerPair_0_ps; // res14, s13


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
	r0.xyz = v1.v.xyz + -idx_uniforms0_ps.cb0[4].xyz;
	r1.xyz = fma(idx_uniforms1_ps.cb1[11].xyz, r0.xxx, idx_uniforms1_ps.cb1[14].xyz);
	r1.xyz = fma(idx_uniforms1_ps.cb1[12].xyz, r0.yyy, r1.xyz);
	r1.xyz = fma(idx_uniforms1_ps.cb1[13].xyz, r0.zzz, r1.xyz);
	r2.xy = fma(r1.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.w = max(abs(r2.y), abs(r2.x));
	r0.w = intBitsToFloat(float(1.00000000f) >= r0.w ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r0.w) != uint(0))
	{
		r2.xyz = fma(idx_uniforms1_ps.cb1[3].xyz, r0.xxx, idx_uniforms1_ps.cb1[6].xyz);
		r2.xyz = fma(idx_uniforms1_ps.cb1[4].xyz, r0.yyy, r2.xyz);
		r2.xyz = fma(idx_uniforms1_ps.cb1[5].xyz, r0.zzz, r2.xyz);
		r3.xyz = fma(idx_uniforms1_ps.cb1[7].xyz, r0.xxx, idx_uniforms1_ps.cb1[10].xyz);
		r0.xyw = fma(idx_uniforms1_ps.cb1[8].xyz, r0.yyy, r3.xyz);
		r0.xyz = fma(idx_uniforms1_ps.cb1[9].xyz, r0.zzz, r0.xyw);
		r3.xy = fma(r2.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r3.zw = fma(r0.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r0.w = max(abs(r3.y), abs(r3.x));
		r0.w = intBitsToFloat(r0.w < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
		r1.w = max(abs(r3.w), abs(r3.z));
		r1.w = intBitsToFloat(r1.w < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
		r2.w = uintBitsToFloat(movc(floatBitsToUint(r1.w), floatBitsToUint(idx_uniforms1_ps.cb1[2].y), floatBitsToUint(idx_uniforms1_ps.cb1[2].z)));
		r2.w = uintBitsToFloat(movc(floatBitsToUint(r0.w), floatBitsToUint(idx_uniforms1_ps.cb1[2].x), floatBitsToUint(r2.w)));
		r0.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.www), floatBitsToUint(r0.xyz), floatBitsToUint(r1.xyz)));
		r3.xyz = uintBitsToFloat(movc(floatBitsToUint(r0.www), floatBitsToUint(r2.xyz), floatBitsToUint(r0.xyz)));
		r0.x = uintBitsToFloat(movc(floatBitsToUint(r1.w), uint(0x3f800000), uint(0x40000000)));
		r0.w = uintBitsToFloat(movc(floatBitsToUint(r0.w), uint(0x00000000), floatBitsToUint(r0.x)));
		r3.w = saturate(r3.z);
		r1.x = v1.v.w / r2.w;
		r2 = r1.xxxx * vec4(-0.149460003f, -0.0737529993f, 0.0301959999f, 0.0776700005f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.y = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2 = r1.xxxx * vec4(-0.173096001f, 0.284866005f, 0.240042999f, -0.0698539987f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2 = r1.xxxx * vec4(0.402942002f, 0.296036988f, -0.0809710026f, -0.408722997f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2 = r1.xxxx * vec4(0.440210998f, -0.500657976f, -0.579936981f, 0.0628560036f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2 = r1.xxxx * vec4(-0.575273991f, -0.602913022f, 0.0152620003f, 0.749845028f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2 = r1.xxxx * vec4(-0.781122983f, 0.624377012f, 0.914593995f, 0.0616080016f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2 = r1.xxxx * vec4(-0.207513005f, 0.139421001f, 0.0824979991f, 0.0939100012f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2 = r1.xxxx * vec4(0.472503006f, -0.163526997f, -0.167282999f, -0.335620999f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2 = r1.xxxx * vec4(-0.747904003f, 0.0560309999f, 0.126606002f, 0.612042010f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2 = r1.xxxx * vec4(0.983187020f, 0.182598993f, 0.0475989990f, -0.873704016f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2 = r1.xxxx * vec4(-0.332020998f, 0.223073006f, 0.131997004f, 0.150255993f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r1.z = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.y = r1.z + r1.y;
		r2 = r1.xxxx * vec4(0.756003976f, -0.261644006f, -0.267652988f, -0.536993980f);
		r4.xy = r2.zw;
		r4.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r3.xyw + r4.xyz;
		r1.x = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r1.x = r1.x + r1.y;
		r2.z = uintBitsToFloat(uint(0x00000000));
		r0.xyz = r2.xyz + r3.xyw;
		r0.x = texture(resourceSamplerPair_0_ps, vec4(r0.xyw, r0.z));
		r0.x = r0.x + r1.x;
		r0.x = r0.x * float(0.0416666679f);
	}
	else
	{
		r0.x = uintBitsToFloat(uint(0x3f800000));
	}
	o0.xyz = r0.xxx;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

