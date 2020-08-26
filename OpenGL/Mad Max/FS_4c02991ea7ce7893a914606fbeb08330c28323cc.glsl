#version 460 core
// ps_5_0
// Checksum: 64a2cec7_1daa6743_3215c425_2e4b29e6
// Name: skidmarks

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res2, s2

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy))).x;
	r0.x = fma(r0.x, idx_uniforms1_ps.cb1[0].x, idx_uniforms1_ps.cb1[0].y);
	r0.x = float(1.00000000f) / r0.x;
	r0.y = v1.v.w + float(0.150000006f);
	r0.x = -r0.y + r0.x;
	r0.x = saturate(r0.x * float(4.00000000f));
	r0.x = -r0.x + float(1.00000000f);
	r0.y = -v2.v.w + float(1.00000000f);
	r1 = (texture(resourceSamplerPair_1_ps, v1.v.xy));
	r0.y = -r0.y + r1.w;
	o0.xyz = r1.xyz * v2.v.xyz;
	r0.y = r0.y / v2.v.w;
	r0.y = saturate(r0.y + r0.y);
	r0.y = r0.y * v1.v.z;
	r0.w = r0.x * r0.y;
	o0.w = r0.w;
	r0.xy = uintBitsToFloat(uvec2(0x3f400000, 0x3f800000));
	o1 = r0.xyxw;
	o2.w = r0.w;
	o2.xyz = uintBitsToFloat(uvec3(0x00000000, 0x3ba3d70a, 0x3d8f5c29));
	return;
}

