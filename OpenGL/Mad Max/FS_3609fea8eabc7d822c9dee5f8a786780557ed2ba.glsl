#version 460 core
// ps_5_0
// Checksum: 16a708b2_c31264fc_9bf87694_841648e7
// Name: particleeffectadditivesoftnscullingvolume

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 8) in idx_Varying8 { vec4 v; } v8;
layout(location = 9) in idx_Varying9 { vec4 v; } v9;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5, r6;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[6]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[11]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0

uniform sampler2D resourceSamplerPair_2_ps; // res7, s7

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3

uniform samplerCube resourceSamplerPair_4_ps; // res8, s8

uniform samplerCube resourceSamplerPair_5_ps; // res4, s4


void Initialise()
{
}



void PixelEpilog()
{
	if (discarded)
		discard;
}

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v0.xy * idx_uniforms1_ps.cb1[2].zw;
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy))).x;
	r0.x = v0.z / r0.x;
	r0.x = saturate(fma(r0.x, idx_uniforms1_ps.cb1[0].z, -idx_uniforms1_ps.cb1[0].z));
	r1 = v3.v.yyyy * idx_uniforms1_ps.cb1[6];
	r1 = fma(v3.v.xxxx, idx_uniforms1_ps.cb1[5], r1);
	r1 = fma(v3.v.zzzz, idx_uniforms1_ps.cb1[7], r1);
	r1 = r1 + idx_uniforms1_ps.cb1[8];
	r0.yzw = r1.xyz / r1.www;
	r0.yzw = abs(r0.yzw) + -idx_uniforms1_ps.cb1[9].xxx;
	r0.y = max(r0.z, r0.y);
	r0.y = max(r0.w, r0.y);
	r0.y = saturate(r0.y * idx_uniforms1_ps.cb1[9].y);
	r1 = (texture(resourceSamplerPair_1_ps, v1.v.xy));
	r1.w = r0.y * r1.w;
	r2 = r1 * v2.v;
	r0.y = fma(r1.w, float(-0.200000003f), float(1.00000000f));
	r1.xyz = fma(r1.xyz, v2.v.xyz, vec3(0.00999999978f, 0.00999999978f, 0.00999999978f));
	r0.x = r0.x * r2.w;
	r0.z = fma(idx_uniforms4_ps.cb4[4].x, r0.x, idx_uniforms4_ps.cb4[4].y);
	o0.w = r0.x;
	r0.x = intBitsToFloat(r0.z < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.xzw = v3.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
	r3.xyz = r0.yyy * r0.xzw;
	r4.xyz = fma(r0.xzw, r0.yyy, idx_uniforms0_ps.cb0[5].xyz);
	r0.y = dot(r3.xyz, r3.xyz);
	r0.y = sqrt(r0.y);
	r0.y = r0.y * idx_uniforms1_ps.cb1[1].w;
	r0.y = r0.y * float(8.00000000f);
	r0.y = max(r0.y, float(1.00000000f));
	r0.y = min(r0.y, float(6.00000000f));
	r3.xy = r4.xz + idx_uniforms1_ps.cb1[1].yz;
	r5.x = r4.y * idx_uniforms0_ps.cb0[1].w;
	r5.y = r4.y * idx_uniforms0_ps.cb0[3].w;
	r3.xy = r3.xy + -r5.xy;
	r3.xy = r3.xy * idx_uniforms1_ps.cb1[1].ww;
	r0.y = ((textureLod(resourceSamplerPair_2_ps, r3.xy, r0.y)).xwyz).y;
	r0.y = saturate(r0.y + idx_uniforms1_ps.cb1[1].x);
	r1.w = saturate(v9.v.x);
	r0.y = r0.y * r1.w;
	r0.y = fma(r0.y, float(0.949999988f), float(0.0500000007f));
	r3 = (texture(resourceSamplerPair_3_ps, v1.v.xy));
	r4.xy = r3.ww * idx_uniforms1_ps.cb1[2].yx;
	r1.w = r2.w * r4.x;
	r2.w = dot(r0.xzw, r0.xzw);
	r2.w = inversesqrt(r2.w);
	r0.xzw = r0.xzw * r2.www;
	r5 = v6.v.zxyx * v8.v.yzxz;
	r5 = fma(v6.v.yzxz, v8.v.zxyx, -r5);
	r5 = r5 * v8.v.wwww;
	r6 = r5.zxwx * v6.v.yzxz;
	r6 = fma(r5.wzxz, v6.v.zxyx, -r6);
	r6 = r6 * v8.v.wwww;
	r3.xyz = fma(r3.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r5 = r5 * r3.yyyy;
	r5 = fma(r3.xxxx, r6, r5);
	r5 = fma(r3.zzzz, v6.v.xyzy, r5);
	r2.w = dot(r5.xzw, r5.xzw);
	r2.w = inversesqrt(r2.w);
	r5 = r2.wwww * r5;
	r2.w = dot(r0.xwz, r5.xzw);
	r2.w = r2.w + r2.w;
	r3.xyz = fma(r5.xwz, -r2.www, r0.xzw);
	r0.xzw = fma(r5.xyz, vec3(-0.400000006f, -0.400000006f, -0.400000006f), r0.xzw);
	r2.w = saturate(dot(r3.xyz, v7.v.xyz));
	r2.w = log2(r2.w);
	r2.w = r2.w * r4.y;
	r2.w = exp2(r2.w);
	r1.w = r1.w * r2.w;
	r2.w = dot(r5.xwz, v7.v.xyz);
	r4.x = fma(r5.w, float(0.500000000f), float(0.500000000f));
	r4.y = saturate(r2.w);
	r2.w = saturate(r2.w + v7.v.w);
	r5.xyz = r2.www * v4.v.xyz;
	r1.w = r1.w * r4.y;
	r1.w = r0.y * r1.w;
	r4.yzw = ((textureLod(resourceSamplerPair_4_ps, r3.xyz, idx_uniforms1_ps.cb1[10].x)).wxyz).yzw;
	r3.xyz = ((textureLod(resourceSamplerPair_5_ps, r3.xyz, idx_uniforms1_ps.cb1[10].x))).xyz;
	r4.yzw = -r3.xyz + r4.yzw;
	r3.xyz = fma(idx_uniforms1_ps.cb1[10].yyy, r4.yzw, r3.xyz);
	r3.xyz = r3.xyz * idx_uniforms1_ps.cb1[2].yyy;
	r3.xyz = r3.www * r3.xyz;
	r3.xyz = r3.xyz * idx_uniforms1_ps.cb1[3].www;
	r3.xyz = fma(r1.www, v4.v.xyz, r3.xyz);
	r4.yzw = -idx_uniforms1_ps.cb1[3].xyz + idx_uniforms1_ps.cb1[4].xyz;
	r4.xyz = fma(r4.xxx, r4.yzw, idx_uniforms1_ps.cb1[3].xyz);
	r4.xyz = fma(r4.xyz, idx_uniforms1_ps.cb1[4].www, v5.v.xyz);
	r4.xyz = fma(r5.xyz, r0.yyy, r4.xyz);
	r2.xyz = fma(r2.xyz, r4.xyz, r3.xyz);
	r1.w = dot(r0.xzw, r0.xzw);
	r1.w = inversesqrt(r1.w);
	r0.xzw = r0.xzw * r1.www;
	r0.x = saturate(dot(r0.xzw, v7.v.xyz));
	r0.x = log2(r0.x);
	r0.x = r0.x * float(16.0000000f);
	r0.x = exp2(r0.x);
	r0.x = r0.y * r0.x;
	r0.xyz = r1.xyz * r0.xxx;
	o0.xyz = fma(r0.xyz, v4.v.xyz, r2.xyz);
	PixelEpilog();
	return;
}
