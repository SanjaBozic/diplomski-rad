#version 460 core
// ps_5_0
// Checksum: 6b5c0dab_d3fbbb7f_30dd3422_1609d100
// Name: fastter_noplxlod01cidx2cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
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
	r0.z = saturate(v3.v.x);
	r2.xy = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).xwyz).xy;
	r2.xy = fma(r2.xy, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r3.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r0.w = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r0.w + float(1.00000000f);
	r4.x = dot(r3, idx_uniforms1_ps.cb1[10]);
	r4.y = dot(r3, idx_uniforms1_ps.cb1[11]);
	r4.z = dot(r3, idx_uniforms1_ps.cb1[12]);
	r4.w = dot(r3, idx_uniforms1_ps.cb1[13]);
	r0.w = dot(r4, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r2.zw = r4.xy / r0.ww;
	r3.z = r2.z * idx_uniforms1_ps.cb1[6].z;
	r3.xw = r2.ww * idx_uniforms1_ps.cb1[7].wz;
	r0.w = fma(idx_uniforms1_ps.cb1[6].w, r2.z, r3.x);
	r0.xy = ((texture(resourceSamplerPair_2_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xyw = r0.xyw * vec3(1.00000000f, -1.00000000f, 1.50000000f);
	r0.xy = fma(r0.ww, r0.xy, -r2.xy);
	r2.xy = r3.zw * vec2(8.00000000f, 8.00000000f);
	r3.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r3.z = idx_uniforms1_ps.cb1[6].y;
	r4.xy = ((texture(resourceSamplerPair_3_ps, r3.xyz)).ywxz).xy;
	r4.xy = fma(r4.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.w = ((texture(resourceSamplerPair_4_ps, r3.xyz))).w;
	r3.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r3.z = idx_uniforms1_ps.cb1[7].y;
	r4.zw = ((texture(resourceSamplerPair_3_ps, r3.xyz)).xzyw).zw;
	r4.zw = fma(r4.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.zw = r2.yy * r4.zw;
	r4.xy = fma(r2.xx, r4.xy, r4.zw);
	r3.x = ((texture(resourceSamplerPair_4_ps, r3.xyz)).wxyz).x;
	r3.x = r2.w * r3.x;
	r0.w = fma(r2.z, r0.w, r3.x);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r3.x = dot(r0.xy, r0.xy);
	r3.x = r3.x + float(1.00000000f);
	r3.x = inversesqrt(r3.x);
	r5.xz = r0.xy * r3.xx;
	r1.z = idx_uniforms1_ps.cb1[6].y;
	r0.xy = ((texture(resourceSamplerPair_3_ps, r1.xyz)).ywxz).xy;
	r0.xy = fma(r0.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.z = ((texture(resourceSamplerPair_4_ps, r1.xyz)).xywz).z;
	r1.w = idx_uniforms1_ps.cb1[7].y;
	r4.zw = ((texture(resourceSamplerPair_3_ps, r1.xyw)).xzyw).zw;
	r4.zw = fma(r4.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.zw = r2.yy * r4.zw;
	r0.xy = fma(r2.xx, r0.xy, r4.zw);
	r1.x = ((texture(resourceSamplerPair_4_ps, r1.xyw)).wxyz).x;
	r1.x = r1.x * r2.w;
	r1.x = fma(r2.z, r1.z, r1.x);
	r0.xy = fma(r0.xy, r0.zz, -r4.xy);
	r0.xy = fma(r0.zz, r0.xy, r4.xy);
	r1.y = dot(r0.xy, r0.xy);
	r1.y = -r1.y + float(1.00000000f);
	r1.y = sqrt(abs(r1.y));
	r3.y = -1.f * r5.x;
	r3.z = uintBitsToFloat(uint(0x00000000));
	r5.y = r3.x;
	r2.xyz = fma(r0.xxx, r3.xyz, r5.xyz);
	r1.yzw = fma(r1.yyy, r5.xyz, r2.xyz);
	r2.xz = r3.zx * vec2(1.00000000f, -1.00000000f);
	r2.y = r5.z;
	r1.yzw = fma(r0.yyy, r2.xyz, r1.yzw);
	r0.x = dot(r1.yzw, r1.yzw);
	r0.x = inversesqrt(r0.x);
	r4.xyz = r0.xxx * r1.yzw;
	r0.y = -r0.w + r1.x;
	r6.y = saturate(fma(r0.z, r0.y, r0.w));
	r1.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r1.x = v2.v.x;
	r7 = r1.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r0.yzw = ((texture(resourceSamplerPair_5_ps, r7.xy)).wxyz).yzw;
	r1.w = saturate(r4.z * idx_uniforms1_ps.cb1[14].z);
	r0.x = fma(r1.z, r0.x, r1.w);
	r1.z = intBitsToFloat(r0.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_6_ps, r7.xy));
	r1.w = ((texture(resourceSamplerPair_6_ps, r7.zw))).w;
	r7.xy = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r1.xy = fma(r1.xy, vec2(0.0206250008f, 0.00562500022f), r7.xy);
	r1.x = ((texture(resourceSamplerPair_6_ps, r1.xy)).wxyz).x;
	if (floatBitsToUint(r1.z) != uint(0))
	{
		r7.xyz = fma(r0.wyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7.w = r7.y * float(2.00000000f);
		r0.yzw = fma(r7.wwy, r3.xyz, r5.xyz);
		r0.yzw = fma(r7.xxx, r5.xyz, r0.yzw);
		r3.xyz = r7.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r0.yzw = fma(r3.xyz, r2.xyz, r0.yzw);
		r1.y = dot(r0.yzw, r0.yzw);
		r1.y = inversesqrt(r1.y);
		r2 = (texture(resourceSamplerPair_7_ps, v1.v.zw));
		r1.z = min(r2.w, idx_uniforms1_ps.cb1[14].x);
		r1.z = saturate(r1.z * idx_uniforms1_ps.cb1[14].y);
		r2.w = uintBitsToFloat(uint(0x3f800000));
		r2.xyz = r2.xyz * r8.xyz;
		r2.w = fma(r8.w, r2.w, float(0.750000000f));
		r3.x = r1.w * r2.w;
		r3.y = r1.z * float(0.699999988f);
		r1.w = fma(-r1.w, r2.w, float(0.100000001f));
		r1.w = fma(r3.y, r1.w, r3.x);
		r1.x = -r1.x + float(1.00000000f);
		r1.x = saturate(fma(-r1.x, idx_uniforms1_ps.cb1[15].x, r1.w));
		r1.x = r1.x * r1.z;
		r1.z = r1.x * float(3.00000000f);
		r1.x = fma(r1.x, float(-0.300000012f), float(0.800000012f));
		r1.z = min(r1.z, float(1.00000000f));
		r1.w = -r1.x + float(1.00000000f);
		r1.z = r1.z / r1.w;
		r0.x = r0.x + -r1.x;
		r0.x = saturate(r1.z * r0.x);
		r1.xzw = fma(r2.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r1.xzw = fma(r0.xxx, r1.xzw, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r6.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r2.xyz = -r6.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r6.xyz = fma(r0.xxx, r2.xyz, r6.xyz);
		r0.yzw = fma(r0.yzw, r1.yyy, -r4.xyz);
		r0.xyz = fma(r0.xxx, r0.yzw, r4.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r4.xyz = r0.www * r0.xyz;
	}
	else
	{
		r1.xzw = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r6.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r4.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r1.xzw;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r6.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

