#version 460 core
// ps_5_0
// Checksum: f66f90d9_ede4a6f6_e0d51181_3ed4252d
// Name: ssao_nvidia

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[7]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1


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
	r0.z = ((textureLod(resourceSamplerPair_0_ps, v1.v.xy, float(1.00000000f))).yzxw).z;
	r0.w = intBitsToFloat(r0.z >= idx_uniforms1_ps.cb1[1].z ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r0.w) != uint(0))
	{
		o0 = uintBitsToFloat(uvec4(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000));
		return;
	}
	r1.xy = fma(v1.v.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r0.xy = r0.zz * r1.xy;
	r1.xy = intBitsToFloat(ivec2(v0.xy));
	r0.w = intBitsToFloat(int(3) * floatBitsToInt(r1.x));
	r1.x = intBitsToFloat(floatBitsToInt(r1.x) * floatBitsToInt(r1.y) + floatBitsToInt(r1.y));
	r0.w = uintBitsToFloat(floatBitsToUint(r0.w) ^ floatBitsToUint(r1.x));
	r0.w = float(floatBitsToInt(r0.w));
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = r1.yyy * idx_uniforms1_ps.cb1[5].xyz;
	r1.xyw = fma(idx_uniforms1_ps.cb1[4].xyz, r1.xxx, r2.xyz);
	r1.xyz = fma(idx_uniforms1_ps.cb1[6].xyz, r1.zzz, r1.xyw);
	r1.w = saturate(r0.z / idx_uniforms1_ps.cb1[1].z);
	r2.x = -idx_uniforms1_ps.cb1[0].y + idx_uniforms1_ps.cb1[0].z;
	r2.x = fma(r1.w, r2.x, idx_uniforms1_ps.cb1[0].y);
	r2.z = r2.x * idx_uniforms1_ps.cb1[0].x;
	r2.y = r2.z / r0.z;
	r2.z = -idx_uniforms1_ps.cb1[3].z + idx_uniforms1_ps.cb1[3].w;
	r2.z = fma(r1.w, r2.z, idx_uniforms1_ps.cb1[3].z);
	r2.w = intBitsToFloat(float(0.200000003f) < r2.y ? int(0xffffffff) : int(0x00000000));
	r3.x = r2.y * float(5.00000000f);
	r3.x = r2.x / r3.x;
	r3.y = uintBitsToFloat(uint(0x3e4ccccd));
	r2.xy = uintBitsToFloat(movc(floatBitsToUint(r2.ww), floatBitsToUint(r3.xy), floatBitsToUint(r2.xy)));
	r2.w = r2.x * r2.x;
	r3.x = -idx_uniforms1_ps.cb1[1].x + idx_uniforms1_ps.cb1[1].y;
	r1.w = fma(r1.w, r3.x, idx_uniforms1_ps.cb1[1].x);
	r3.x = r2.w * r2.w;
	r2.w = r2.w * r3.x;
	r1.w = r1.w / r2.w;
	r3 = r0.wwww + vec4(0.666060627f, 1.99818182f, 3.33030295f, 4.66242409f);
	{ float src = r3.x; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.0151515156f, 15.1515150f, 0.0454545468f, 45.4545441f);
	r4.zw = log2(r5.yw);
	r4.zw = floor(r4.zw);
	r4.zw = r4.zw + vec2(-3.00000000f, -3.00000000f);
	r4.zw = max(r4.zw, vec2(0.00000000f, 0.00000000f));
	r4.zw = min(r4.zw, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r4.z)).yzwx).w;
	r4.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r4.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r2.w = dot(r4.xyz, r4.xyz);
	r1.xyz = r1.xyz * vec3(-1.00000000f, 1.00000000f, -1.00000000f);
	r3.x = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r2.w);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.x = -r2.z + r3.x;
	r2.w = r2.w + float(0.00999999978f);
	r2.w = r3.x / r2.w;
	r2.w = max(r2.w, float(0.00000000f));
	{ float src = r3.y; r3.x = sin(src); r5.x = cos(src); }
	r5.y = r3.x;
	r3.xy = fma(r5.zz, r5.xy, v1.v.xy);
	r4.w = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r4.w)).wyzx).w;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.yz = r4.ww * r3.xy;
	r4.yzw = -r0.xyz + r4.yzw;
	r3.x = dot(r4.yzw, r4.yzw);
	r3.y = dot(r4.yzw, r1.xyz);
	r4.y = fma(r2.x, r2.x, -r3.x);
	r4.y = max(r4.y, float(0.00000000f));
	r4.z = r4.y * r4.y;
	r4.y = r4.y * r4.z;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r3.x = r3.x * r4.y;
	r2.w = fma(r4.x, r2.w, r3.x);
	{ float src = r3.z; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.0757575780f, 75.7575760f, 0.106060609f, 106.060608f);
	r3.yz = log2(r5.yw);
	r3.yz = floor(r3.yz);
	r3.yz = r3.yz + vec2(-3.00000000f, -3.00000000f);
	r3.yz = max(r3.yz, vec2(0.00000000f, 0.00000000f));
	r3.yz = min(r3.yz, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r3.y)).yzwx).w;
	r3.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r3.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.w; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r3.z)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r3.xyz = -r0.xyz + r4.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.x = dot(r3.xyz, r1.xyz);
	r3.y = fma(r2.x, r2.x, -r3.w);
	r3.y = max(r3.y, float(0.00000000f));
	r3.z = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r3.x = -r2.z + r3.x;
	r3.z = r3.w + float(0.00999999978f);
	r3.x = r3.x / r3.z;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r3.y, r3.x, r2.w);
	r3 = r0.wwww + vec4(5.99454546f, 7.32666683f, 8.65878773f, 9.99090862f);
	{ float src = r3.x; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.136363640f, 136.363632f, 0.166666672f, 166.666672f);
	r4.zw = log2(r5.yw);
	r4.zw = floor(r4.zw);
	r4.zw = r4.zw + vec2(-3.00000000f, -3.00000000f);
	r4.zw = max(r4.zw, vec2(0.00000000f, 0.00000000f));
	r4.zw = min(r4.zw, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r4.z)).yzwx).w;
	r4.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r4.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r4.x = dot(r4.xyz, r1.xyz);
	r4.y = fma(r2.x, r2.x, -r3.x);
	r4.y = max(r4.y, float(0.00000000f));
	r4.z = r4.y * r4.y;
	r4.y = r4.y * r4.z;
	r4.x = -r2.z + r4.x;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r4.x / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.y, r3.x, r2.w);
	{ float src = r3.y; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r4.w)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r4.xyz = -r0.xyz + r4.xyz;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.z; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.196969703f, 196.969696f, 0.227272734f, 227.272720f);
	r3.yz = log2(r5.yw);
	r3.yz = floor(r3.yz);
	r3.yz = r3.yz + vec2(-3.00000000f, -3.00000000f);
	r3.yz = max(r3.yz, vec2(0.00000000f, 0.00000000f));
	r3.yz = min(r3.yz, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r3.y)).yzwx).w;
	r3.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r3.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.w; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r3.z)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r3.xyz = -r0.xyz + r4.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.x = dot(r3.xyz, r1.xyz);
	r3.y = fma(r2.x, r2.x, -r3.w);
	r3.y = max(r3.y, float(0.00000000f));
	r3.z = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r3.x = -r2.z + r3.x;
	r3.z = r3.w + float(0.00999999978f);
	r3.x = r3.x / r3.z;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r3.y, r3.x, r2.w);
	r3 = r0.wwww + vec4(11.3230305f, 12.6551514f, 13.9872723f, 15.3193941f);
	{ float src = r3.x; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.257575750f, 257.575745f, 0.287878782f, 287.878784f);
	r4.zw = log2(r5.yw);
	r4.zw = floor(r4.zw);
	r4.zw = r4.zw + vec2(-3.00000000f, -3.00000000f);
	r4.zw = max(r4.zw, vec2(0.00000000f, 0.00000000f));
	r4.zw = min(r4.zw, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r4.z)).yzwx).w;
	r4.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r4.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r4.x = dot(r4.xyz, r1.xyz);
	r4.y = fma(r2.x, r2.x, -r3.x);
	r4.y = max(r4.y, float(0.00000000f));
	r4.z = r4.y * r4.y;
	r4.y = r4.y * r4.z;
	r4.x = -r2.z + r4.x;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r4.x / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.y, r3.x, r2.w);
	{ float src = r3.y; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r4.w)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r4.xyz = -r0.xyz + r4.xyz;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.z; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.318181813f, 318.181824f, 0.348484844f, 348.484863f);
	r3.yz = log2(r5.yw);
	r3.yz = floor(r3.yz);
	r3.yz = r3.yz + vec2(-3.00000000f, -3.00000000f);
	r3.yz = max(r3.yz, vec2(0.00000000f, 0.00000000f));
	r3.yz = min(r3.yz, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r3.y)).yzwx).w;
	r3.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r3.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.w; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r3.z)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r3.xyz = -r0.xyz + r4.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.x = dot(r3.xyz, r1.xyz);
	r3.y = fma(r2.x, r2.x, -r3.w);
	r3.y = max(r3.y, float(0.00000000f));
	r3.z = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r3.x = -r2.z + r3.x;
	r3.z = r3.w + float(0.00999999978f);
	r3.x = r3.x / r3.z;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r3.y, r3.x, r2.w);
	r3 = r0.wwww + vec4(16.6515160f, 17.9836369f, 19.3157578f, 20.6478786f);
	{ float src = r3.x; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.378787875f, 378.787872f, 0.409090906f, 409.090912f);
	r4.zw = log2(r5.yw);
	r4.zw = floor(r4.zw);
	r4.zw = r4.zw + vec2(-3.00000000f, -3.00000000f);
	r4.zw = max(r4.zw, vec2(0.00000000f, 0.00000000f));
	r4.zw = min(r4.zw, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r4.z)).yzwx).w;
	r4.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r4.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r4.x = dot(r4.xyz, r1.xyz);
	r4.y = fma(r2.x, r2.x, -r3.x);
	r4.y = max(r4.y, float(0.00000000f));
	r4.z = r4.y * r4.y;
	r4.y = r4.y * r4.z;
	r4.x = -r2.z + r4.x;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r4.x / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.y, r3.x, r2.w);
	{ float src = r3.y; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r4.w)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r4.xyz = -r0.xyz + r4.xyz;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.z; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.439393938f, 439.393951f, 0.469696969f, 469.696960f);
	r3.yz = log2(r5.yw);
	r3.yz = floor(r3.yz);
	r3.yz = r3.yz + vec2(-3.00000000f, -3.00000000f);
	r3.yz = max(r3.yz, vec2(0.00000000f, 0.00000000f));
	r3.yz = min(r3.yz, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r3.y)).yzwx).w;
	r3.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r3.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.w; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r3.z)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r3.xyz = -r0.xyz + r4.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.x = dot(r3.xyz, r1.xyz);
	r3.y = fma(r2.x, r2.x, -r3.w);
	r3.y = max(r3.y, float(0.00000000f));
	r3.z = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r3.x = -r2.z + r3.x;
	r3.z = r3.w + float(0.00999999978f);
	r3.x = r3.x / r3.z;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r3.y, r3.x, r2.w);
	r3 = r0.wwww + vec4(21.9799995f, 23.3121204f, 24.6442432f, 25.9763641f);
	{ float src = r3.x; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.500000000f, 500.000000f, 0.530303001f, 530.303040f);
	r4.zw = log2(r5.yw);
	r4.zw = floor(r4.zw);
	r4.zw = r4.zw + vec2(-3.00000000f, -3.00000000f);
	r4.zw = max(r4.zw, vec2(0.00000000f, 0.00000000f));
	r4.zw = min(r4.zw, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r4.z)).yzwx).w;
	r4.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r4.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r4.x = dot(r4.xyz, r1.xyz);
	r4.y = fma(r2.x, r2.x, -r3.x);
	r4.y = max(r4.y, float(0.00000000f));
	r4.z = r4.y * r4.y;
	r4.y = r4.y * r4.z;
	r4.x = -r2.z + r4.x;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r4.x / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.y, r3.x, r2.w);
	{ float src = r3.y; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r4.w)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r4.xyz = -r0.xyz + r4.xyz;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.z; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.560606062f, 560.606079f, 0.590909064f, 590.909119f);
	r3.yz = log2(r5.yw);
	r3.yz = floor(r3.yz);
	r3.yz = r3.yz + vec2(-3.00000000f, -3.00000000f);
	r3.yz = max(r3.yz, vec2(0.00000000f, 0.00000000f));
	r3.yz = min(r3.yz, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r3.y)).yzwx).w;
	r3.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r3.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.w; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r3.z)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r3.xyz = -r0.xyz + r4.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.x = dot(r3.xyz, r1.xyz);
	r3.y = fma(r2.x, r2.x, -r3.w);
	r3.y = max(r3.y, float(0.00000000f));
	r3.z = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r3.x = -r2.z + r3.x;
	r3.z = r3.w + float(0.00999999978f);
	r3.x = r3.x / r3.z;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r3.y, r3.x, r2.w);
	r3 = r0.wwww + vec4(27.3084850f, 28.6406059f, 29.9727268f, 31.3048477f);
	{ float src = r3.x; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.621212125f, 621.212097f, 0.651515126f, 651.515137f);
	r4.zw = log2(r5.yw);
	r4.zw = floor(r4.zw);
	r4.zw = r4.zw + vec2(-3.00000000f, -3.00000000f);
	r4.zw = max(r4.zw, vec2(0.00000000f, 0.00000000f));
	r4.zw = min(r4.zw, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r4.z)).yzwx).w;
	r4.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r4.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r4.x = dot(r4.xyz, r1.xyz);
	r4.y = fma(r2.x, r2.x, -r3.x);
	r4.y = max(r4.y, float(0.00000000f));
	r4.z = r4.y * r4.y;
	r4.y = r4.y * r4.z;
	r4.x = -r2.z + r4.x;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r4.x / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.y, r3.x, r2.w);
	{ float src = r3.y; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r4.w)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r4.xyz = -r0.xyz + r4.xyz;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.z; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.681818187f, 681.818176f, 0.712121189f, 712.121216f);
	r3.yz = log2(r5.yw);
	r3.yz = floor(r3.yz);
	r3.yz = r3.yz + vec2(-3.00000000f, -3.00000000f);
	r3.yz = max(r3.yz, vec2(0.00000000f, 0.00000000f));
	r3.yz = min(r3.yz, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r3.y)).yzwx).w;
	r3.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r3.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.w; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r3.z)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r3.xyz = -r0.xyz + r4.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.x = dot(r3.xyz, r1.xyz);
	r3.y = fma(r2.x, r2.x, -r3.w);
	r3.y = max(r3.y, float(0.00000000f));
	r3.z = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r3.x = -r2.z + r3.x;
	r3.z = r3.w + float(0.00999999978f);
	r3.x = r3.x / r3.z;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r3.y, r3.x, r2.w);
	r3 = r0.wwww + vec4(32.6369705f, 33.9690895f, 35.3012123f, 36.6333351f);
	{ float src = r3.x; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.742424250f, 742.424255f, 0.772727251f, 772.727295f);
	r4.zw = log2(r5.yw);
	r4.zw = floor(r4.zw);
	r4.zw = r4.zw + vec2(-3.00000000f, -3.00000000f);
	r4.zw = max(r4.zw, vec2(0.00000000f, 0.00000000f));
	r4.zw = min(r4.zw, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r4.z)).yzwx).w;
	r4.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r4.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r4.x = dot(r4.xyz, r1.xyz);
	r4.y = fma(r2.x, r2.x, -r3.x);
	r4.y = max(r4.y, float(0.00000000f));
	r4.z = r4.y * r4.y;
	r4.y = r4.y * r4.z;
	r4.x = -r2.z + r4.x;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r4.x / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.y, r3.x, r2.w);
	{ float src = r3.y; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r4.w)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r4.xyz = -r0.xyz + r4.xyz;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.z; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.803030312f, 803.030273f, 0.833333313f, 833.333313f);
	r3.yz = log2(r5.yw);
	r3.yz = floor(r3.yz);
	r3.yz = r3.yz + vec2(-3.00000000f, -3.00000000f);
	r3.yz = max(r3.yz, vec2(0.00000000f, 0.00000000f));
	r3.yz = min(r3.yz, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r3.y)).yzwx).w;
	r3.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r3.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.w; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r3.z)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r3.xyz = -r0.xyz + r4.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.x = dot(r3.xyz, r1.xyz);
	r3.y = fma(r2.x, r2.x, -r3.w);
	r3.y = max(r3.y, float(0.00000000f));
	r3.z = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r3.x = -r2.z + r3.x;
	r3.z = r3.w + float(0.00999999978f);
	r3.x = r3.x / r3.z;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r3.y, r3.x, r2.w);
	r3 = r0.wwww + vec4(37.9654541f, 39.2975769f, 40.6296959f, 41.9618187f);
	{ float src = r3.x; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.863636374f, 863.636353f, 0.893939376f, 893.939392f);
	r4.zw = log2(r5.yw);
	r4.zw = floor(r4.zw);
	r4.zw = r4.zw + vec2(-3.00000000f, -3.00000000f);
	r4.zw = max(r4.zw, vec2(0.00000000f, 0.00000000f));
	r4.zw = min(r4.zw, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r4.z)).yzwx).w;
	r4.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r4.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r4.x = dot(r4.xyz, r1.xyz);
	r4.y = fma(r2.x, r2.x, -r3.x);
	r4.y = max(r4.y, float(0.00000000f));
	r4.z = r4.y * r4.y;
	r4.y = r4.y * r4.z;
	r4.x = -r2.z + r4.x;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r4.x / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.y, r3.x, r2.w);
	{ float src = r3.y; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r4.w)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r4.xyz = -r0.xyz + r4.xyz;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.z; r3.x = sin(src); r4.x = cos(src); }
	r5 = r2.yyyy * vec4(0.924242437f, 924.242432f, 0.954545438f, 954.545471f);
	r3.yz = log2(r5.yw);
	r3.yz = floor(r3.yz);
	r3.yz = r3.yz + vec2(-3.00000000f, -3.00000000f);
	r3.yz = max(r3.yz, vec2(0.00000000f, 0.00000000f));
	r3.yz = min(r3.yz, vec2(5.00000000f, 5.00000000f));
	r4.y = r3.x;
	r4.xy = fma(r5.xx, r4.xy, v1.v.xy);
	r5.w = ((textureLod(resourceSamplerPair_0_ps, r4.xy, r3.y)).yzwx).w;
	r3.xy = fma(r4.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r5.xy = r5.ww * r3.xy;
	r4.xyz = -r0.xyz + r5.xyw;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.y = dot(r4.xyz, r1.xyz);
	r4.x = fma(r2.x, r2.x, -r3.x);
	r4.x = max(r4.x, float(0.00000000f));
	r4.y = r4.x * r4.x;
	r4.x = r4.x * r4.y;
	r3.y = -r2.z + r3.y;
	r3.x = r3.x + float(0.00999999978f);
	r3.x = r3.y / r3.x;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r4.x, r3.x, r2.w);
	{ float src = r3.w; r3.x = sin(src); r4.x = cos(src); }
	r4.y = r3.x;
	r3.xy = fma(r5.zz, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r3.z)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r3.xyz = -r0.xyz + r4.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.x = dot(r3.xyz, r1.xyz);
	r3.y = fma(r2.x, r2.x, -r3.w);
	r3.y = max(r3.y, float(0.00000000f));
	r3.z = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r3.x = -r2.z + r3.x;
	r3.z = r3.w + float(0.00999999978f);
	r3.x = r3.x / r3.z;
	r3.x = max(r3.x, float(0.00000000f));
	r2.w = fma(r3.y, r3.x, r2.w);
	r0.w = r0.w + float(43.2939377f);
	{ float src = r0.w; r3.x = sin(src); r4.x = cos(src); }
	r3.yz = r2.yy * vec2(0.984848499f, 984.848511f);
	r0.w = log2(r3.z);
	r0.w = floor(r0.w);
	r0.w = r0.w + float(-3.00000000f);
	r0.w = max(r0.w, float(0.00000000f));
	r0.w = min(r0.w, float(5.00000000f));
	r4.y = r3.x;
	r3.xy = fma(r3.yy, r4.xy, v1.v.xy);
	r4.z = ((textureLod(resourceSamplerPair_0_ps, r3.xy, r0.w)).yzxw).z;
	r3.xy = fma(r3.xy, idx_uniforms1_ps.cb1[2].xy, idx_uniforms1_ps.cb1[2].zw);
	r4.xy = r4.zz * r3.xy;
	r0.xyw = -r0.xyz + r4.xyz;
	r2.y = dot(r0.xyw, r0.xyw);
	r0.x = dot(r0.xyw, r1.xyz);
	r0.y = fma(r2.x, r2.x, -r2.y);
	r0.y = max(r0.y, float(0.00000000f));
	r0.w = r0.y * r0.y;
	r0.y = r0.y * r0.w;
	r0.x = -r2.z + r0.x;
	r0.w = r2.y + float(0.00999999978f);
	r0.x = r0.x / r0.w;
	r0.x = max(r0.x, float(0.00000000f));
	r0.x = fma(r0.y, r0.x, r2.w);
	r0.x = r1.w * r0.x;
	r0.x = r0.x * float(0.151515156f);
	r0.y = -r0.z + idx_uniforms1_ps.cb1[1].z;
	r0.y = r0.y / idx_uniforms1_ps.cb1[1].z;
	r0.y = saturate(r0.y * float(6.00000000f));
	r0.x = r0.y * r0.x;
	r0.x = log2(r0.x);
	r0.x = r0.x * idx_uniforms1_ps.cb1[1].w;
	r0.x = exp2(r0.x);
	r0.x = -r0.x + float(1.00000000f);
	o0.xyz = max(r0.xxx, vec3(0.00000000f, 0.00000000f, 0.00000000f));
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

