#version 460 core
// ps_5_0
// Checksum: 82e18475_d46b16ca_f44bc48b_8a971e6b
// Name: fastterrainshader_globalconstantgraycolor

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res11, s11

uniform sampler2D resourceSamplerPair_1_ps; // res12, s12

uniform sampler2D resourceSamplerPair_2_ps; // res13, s13

uniform sampler2D resourceSamplerPair_3_ps; // res0, s0

uniform sampler2D resourceSamplerPair_4_ps; // res10, s10


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r1.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r1.x = v2.v.x;
	r0.xy = fma(r1.xy, vec2(0.0206250008f, 0.00562500022f), r0.xy);
	r1 = r1.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy)).wxyz).x;
	r0.x = -r0.x + float(1.00000000f);
	r0.y = uintBitsToFloat(uint(0x3f800000));
	r2 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0.y = fma(r2.w, r0.y, float(0.750000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r1.zw)).xywz).z;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, r1.xy))).xyz;
	r1.xyz = fma(r1.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r0.w = r0.y * r0.z;
	r0.y = fma(-r0.z, r0.y, float(0.100000001f));
	r3 = (texture(resourceSamplerPair_2_ps, v1.v.zw));
	r0.z = min(r3.w, idx_uniforms1_ps.cb1[14].x);
	r2.xyz = r2.xyz * r3.xyz;
	r2.xyz = fma(r2.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
	r0.z = saturate(r0.z * idx_uniforms1_ps.cb1[14].y);
	r1.w = r0.z * float(0.699999988f);
	r0.y = fma(r1.w, r0.y, r0.w);
	r0.x = saturate(fma(-r0.x, idx_uniforms1_ps.cb1[15].x, r0.y));
	r0.x = r0.x * r0.z;
	r0.y = r0.x * float(3.00000000f);
	r0.x = fma(r0.x, float(-0.300000012f), float(0.800000012f));
	r0.y = min(r0.y, float(1.00000000f));
	r0.z = -r0.x + float(1.00000000f);
	r0.y = r0.y / r0.z;
	r0.zw = ((texture(resourceSamplerPair_3_ps, v1.v.zw)).xzyw).zw;
	r0.zw = fma(r0.zw, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.zw = -r0.zw + vec2(0.00787399989f, 0.00000000f);
	r1.w = dot(r0.zw, r0.zw);
	r1.w = min(r1.w, float(1.00000000f));
	r1.w = sqrt(r1.w);
	r2.w = fma(r1.w, float(0.600000024f), float(0.400000006f));
	r1.w = r1.w * r2.w;
	r3.xy = v2.v.xz * vec2(0.00150000001f, 0.00150000001f);
	r3.xyz = ((texture(resourceSamplerPair_4_ps, r3.xy)).xywz).xyz;
	r3.xy = fma(r3.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r2.w = r3.z * float(0.200000003f);
	r4.y = r1.w * r2.w;
	r0.zw = fma(-r1.ww, r3.xy, r0.zw);
	r0.zw = r0.zw * vec2(4.26337051f, 4.26337051f);
	r1.w = dot(r0.zw, r0.zw);
	r1.w = r1.w + float(1.00000000f);
	r3.y = inversesqrt(r1.w);
	r3.xz = r0.zw * r3.yy;
	r0.z = saturate(r3.z * idx_uniforms1_ps.cb1[14].z);
	r0.z = r0.z + r3.y;
	r0.x = -r0.x + r0.z;
	r0.x = saturate(r0.y * r0.x);
	o0.xyz = fma(r0.xxx, r2.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
	o0.w = uintBitsToFloat(uint(0x3f800000));
	r2 = r1.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
	r5.x = r3.y * r2.x;
	r5.y = -r3.x * r2.x;
	r5.z = uintBitsToFloat(uint(0x00000000));
	r0.yzw = r3.xyz + r5.xyz;
	r0.yzw = fma(r1.xxx, r3.xyz, r0.yzw);
	r1.yz = r3.zy * vec2(1.00000000f, -1.00000000f);
	r1.x = uintBitsToFloat(uint(0x00000000));
	r0.yzw = fma(r2.yzw, r1.xyz, r0.yzw);
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = inversesqrt(r1.x);
	r0.yzw = fma(r0.yzw, r1.xxx, -r3.xyz);
	r0.yzw = fma(r0.xxx, r0.yzw, r3.xyz);
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = inversesqrt(r1.x);
	r0.yzw = r0.yzw * r1.xxx;
	o1.xyz = fma(r0.yzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r4.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	r0.yzw = -r4.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
	o2.xyz = fma(r0.xxx, r0.yzw, r4.xyz);
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

