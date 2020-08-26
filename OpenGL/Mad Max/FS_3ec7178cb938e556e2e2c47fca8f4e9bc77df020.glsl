#version 460 core
// ps_5_0
// Checksum: 74760dcc_7e08fd69_e1f429a0_bec3b43a
// Name: fastterrainshader_global

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res10, s10

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0

uniform sampler2D resourceSamplerPair_2_ps; // res7, s7

uniform sampler2D resourceSamplerPair_3_ps; // res13, s13

uniform sampler2D resourceSamplerPair_4_ps; // res11, s11

uniform sampler2D resourceSamplerPair_5_ps; // res12, s12


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0 = v2.v.xzxz * vec4(0.00150000001f, 0.00150000001f, 0.00499999989f, 0.00499999989f);
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw))).z;
	r0.xyw = ((texture(resourceSamplerPair_0_ps, r0.xy))).xyw;
	r0.z = fma(r0.z, float(2.00000000f), float(-1.00000000f));
	r0.zw = r0.zw * vec2(10.0000000f, 0.200000003f);
	r1.xy = ((texture(resourceSamplerPair_1_ps, v1.v.zw)).ywxz).xy;
	r1.xy = fma(r1.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xy = -r1.xy + vec2(0.00787399989f, 0.00000000f);
	r1.z = dot(r1.xy, r1.xy);
	r1.z = min(r1.z, float(1.00000000f));
	r1.z = sqrt(r1.z);
	r1.w = fma(r1.z, float(0.600000024f), float(0.400000006f));
	r1.z = r1.w * r1.z;
	r0.z = fma(r0.z, r1.z, float(1.00000000f));
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r2.y = r0.w * r1.z;
	r1.xy = fma(-r1.zz, r0.xy, r1.xy);
	r0.xy = fma(r0.xy, vec2(0.000399999990f, 0.000399999990f), v1.v.zw);
	r0.xyw = ((texture(resourceSamplerPair_2_ps, r0.xy)).xywz).xyw;
	r0.xyz = saturate(r0.zzz * r0.xyw);
	r1.xy = r1.xy * vec2(4.26337051f, 4.26337051f);
	r3 = (texture(resourceSamplerPair_3_ps, v1.v.zw));
	r0.w = min(r3.w, idx_uniforms1_ps.cb1[14].x);
	r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
	r4.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r4.x = v2.v.x;
	r5 = r4.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r6 = (texture(resourceSamplerPair_4_ps, r5.xy));
	r3.xyz = r3.xyz * r6.xyz;
	r3.xyz = fma(r3.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r0.xyz);
	r1.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r1.zw = fma(r4.xy, vec2(0.0206250008f, 0.00562500022f), r1.zw);
	r1.z = ((texture(resourceSamplerPair_4_ps, r1.zw)).xywz).z;
	r1.z = -r1.z + float(1.00000000f);
	r1.w = r0.w * float(0.699999988f);
	r2.w = ((texture(resourceSamplerPair_4_ps, r5.zw))).w;
	r4.xyz = ((texture(resourceSamplerPair_5_ps, r5.xy))).xyz;
	r4.xyz = fma(r4.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r3.w = uintBitsToFloat(uint(0x3f800000));
	r3.w = fma(r6.w, r3.w, float(0.750000000f));
	r4.w = r2.w * r3.w;
	r2.w = fma(-r2.w, r3.w, float(0.100000001f));
	r1.w = fma(r1.w, r2.w, r4.w);
	r1.z = saturate(fma(-r1.z, idx_uniforms1_ps.cb1[15].x, r1.w));
	r0.w = r0.w * r1.z;
	r1.z = r0.w * float(3.00000000f);
	r0.w = fma(r0.w, float(-0.300000012f), float(0.800000012f));
	r1.z = min(r1.z, float(1.00000000f));
	r1.w = -r0.w + float(1.00000000f);
	r1.z = r1.z / r1.w;
	r1.w = dot(r1.xy, r1.xy);
	r1.w = r1.w + float(1.00000000f);
	r5.y = inversesqrt(r1.w);
	r5.xz = r1.xy * r5.yy;
	r1.x = saturate(r5.z * idx_uniforms1_ps.cb1[14].z);
	r1.x = r1.x + r5.y;
	r0.w = -r0.w + r1.x;
	r0.w = saturate(r1.z * r0.w);
	o0.xyz = fma(r0.www, r3.xyz, r0.xyz);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	r1 = r4.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
	r0.x = r5.y * r1.x;
	r0.y = -r5.x * r1.x;
	r0.z = uintBitsToFloat(uint(0x00000000));
	r0.xyz = r0.xyz + r5.xyz;
	r0.xyz = fma(r4.xxx, r5.xyz, r0.xyz);
	r3.yz = r5.zy * vec2(1.00000000f, -1.00000000f);
	r3.x = uintBitsToFloat(uint(0x00000000));
	r0.xyz = fma(r1.yzw, r3.xyz, r0.xyz);
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r1.x);
	r0.xyz = fma(r0.xyz, r1.xxx, -r5.xyz);
	r0.xyz = fma(r0.www, r0.xyz, r5.xyz);
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r1.x);
	r0.xyz = r0.xyz * r1.xxx;
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	r0.xyz = -r2.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
	o2.xyz = fma(r0.www, r0.xyz, r2.xyz);
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

