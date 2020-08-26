#version 460 core
// ps_5_0
// Checksum: 9fcc8f49_49cd2f51_7a345719_ebfaee66
// Name: fastter_noplxlod0cidx4cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res5, s5

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2

uniform sampler2DArray resourceSamplerPair_3_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_4_ps; // res9, s9

uniform sampler2D resourceSamplerPair_5_ps; // res12, s12

uniform sampler2D resourceSamplerPair_6_ps; // res11, s11

uniform sampler2D resourceSamplerPair_7_ps; // res13, s13


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v2.v.xz * vec2(0.00390625000f, 0.00390625000f);
	r1.xy = v2.v.xz * idx_uniforms1_ps.cb1[4].zz;
	r0.zw = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).yzxw).zw;
	r0.zw = fma(r0.zw, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r2.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r3.x = saturate(dot(r2.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r2.w = -r3.x + float(1.00000000f);
	r3.x = dot(r2, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r2 = r2 / r3.xxxx;
	r3.x = r2.y * idx_uniforms1_ps.cb1[7].w;
	r3.x = fma(idx_uniforms1_ps.cb1[6].w, r2.x, r3.x);
	r3.x = fma(idx_uniforms1_ps.cb1[8].w, r2.z, r3.x);
	r3.x = fma(idx_uniforms1_ps.cb1[9].w, r2.w, r3.x);
	r0.xy = ((texture(resourceSamplerPair_2_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r3.x = r3.x * float(1.50000000f);
	r0.xy = fma(r3.xx, r0.xy, -r0.zw);
	r3.x = r2.x * idx_uniforms1_ps.cb1[6].z;
	r3.y = r2.y * idx_uniforms1_ps.cb1[7].z;
	r3.z = r2.z * idx_uniforms1_ps.cb1[8].z;
	r3.w = r2.w * idx_uniforms1_ps.cb1[9].z;
	r3 = r3 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r0.z = dot(r0.xy, r0.xy);
	r0.z = r0.z + float(1.00000000f);
	r4.x = inversesqrt(r0.z);
	r0.xz = r0.xy * r4.xx;
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r5.xy = ((texture(resourceSamplerPair_3_ps, r1.xyz)).ywxz).xy;
	r5.xy = fma(r5.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.w = ((texture(resourceSamplerPair_4_ps, r1.xyz))).w;
	r1.w = idx_uniforms1_ps.cb1[7].y;
	r5.zw = ((texture(resourceSamplerPair_3_ps, r1.xyw)).xzyw).zw;
	r5.zw = fma(r5.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r5.zw = r3.yy * r5.zw;
	r3.xy = fma(r3.xx, r5.xy, r5.zw);
	r4.w = ((texture(resourceSamplerPair_4_ps, r1.xyw))).w;
	r2.y = r2.y * r4.w;
	r0.w = fma(r2.x, r0.w, r2.y);
	r1.z = idx_uniforms1_ps.cb1[8].y;
	r2.xy = ((texture(resourceSamplerPair_3_ps, r1.xyz)).ywxz).xy;
	r2.xy = fma(r2.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r2.xy = fma(r3.zz, r2.xy, r3.xy);
	r1.z = ((texture(resourceSamplerPair_4_ps, r1.xyz)).xywz).z;
	r0.w = fma(r2.z, r1.z, r0.w);
	r1.w = idx_uniforms1_ps.cb1[9].y;
	r3.xy = ((texture(resourceSamplerPair_3_ps, r1.xyw)).ywxz).xy;
	r3.xy = fma(r3.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r2.xy = fma(r3.ww, r3.xy, r2.xy);
	r1.x = ((texture(resourceSamplerPair_4_ps, r1.xyw)).wxyz).x;
	r1.y = saturate(fma(r2.w, r1.x, r0.w));
	r0.w = dot(r2.xy, r2.xy);
	r0.w = -r0.w + float(1.00000000f);
	r0.w = sqrt(abs(r0.w));
	r4.y = -1.f * r0.x;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r0.y = r4.x;
	r2.xzw = fma(r2.xxx, r4.xyz, r0.xyz);
	r2.xzw = fma(r0.www, r0.xyz, r2.xzw);
	r3.xz = r4.zx * vec2(1.00000000f, -1.00000000f);
	r3.y = r0.z;
	r2.xyz = fma(r2.yyy, r3.xyz, r2.xzw);
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = inversesqrt(r0.w);
	r2.xzw = r0.www * r2.xyz;
	r5.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r5.x = v2.v.x;
	r6 = r5.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_5_ps, r6.xy))).xyz;
	r1.w = saturate(r2.w * idx_uniforms1_ps.cb1[14].z);
	r0.w = fma(r2.y, r0.w, r1.w);
	r1.w = intBitsToFloat(r0.w >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_6_ps, r6.xy));
	r2.y = ((texture(resourceSamplerPair_6_ps, r6.zw)).xwyz).y;
	r5.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r5.xy = fma(r5.xy, vec2(0.0206250008f, 0.00562500022f), r5.zw);
	r3.w = ((texture(resourceSamplerPair_6_ps, r5.xy))).w;
	if (floatBitsToUint(r1.w) != uint(0))
	{
		r5.xyz = fma(r7.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r5.w = r5.y * float(2.00000000f);
		r4.xyz = fma(r5.wwy, r4.xyz, r0.xyz);
		r0.xyz = fma(r5.xxx, r0.xyz, r4.xyz);
		r4.xyz = r5.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r0.xyz = fma(r4.xyz, r3.xyz, r0.xyz);
		r1.w = dot(r0.xyz, r0.xyz);
		r1.w = inversesqrt(r1.w);
		r4 = (texture(resourceSamplerPair_7_ps, v1.v.zw));
		r3.x = min(r4.w, idx_uniforms1_ps.cb1[14].x);
		r3.x = saturate(r3.x * idx_uniforms1_ps.cb1[14].y);
		r3.y = uintBitsToFloat(uint(0x3f800000));
		r4.xyz = r4.xyz * r8.xyz;
		r3.y = fma(r8.w, r3.y, float(0.750000000f));
		r3.z = r2.y * r3.y;
		r4.w = r3.x * float(0.699999988f);
		r2.y = fma(-r2.y, r3.y, float(0.100000001f));
		r2.y = fma(r4.w, r2.y, r3.z);
		r3.y = -r3.w + float(1.00000000f);
		r2.y = saturate(fma(-r3.y, idx_uniforms1_ps.cb1[15].x, r2.y));
		r2.y = r2.y * r3.x;
		r3.x = r2.y * float(3.00000000f);
		r2.y = fma(r2.y, float(-0.300000012f), float(0.800000012f));
		r3.x = min(r3.x, float(1.00000000f));
		r3.y = -r2.y + float(1.00000000f);
		r3.x = r3.x / r3.y;
		r0.w = r0.w + -r2.y;
		r0.w = saturate(r3.x * r0.w);
		r3.xyz = fma(r4.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r3.xyz = fma(r0.www, r3.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r1.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r1.xyz = fma(r0.www, r4.xyz, r1.xyz);
		r0.xyz = fma(r0.xyz, r1.www, -r2.xzw);
		r0.xyz = fma(r0.www, r0.xyz, r2.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r2.xzw = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r2.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r3.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r1.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

