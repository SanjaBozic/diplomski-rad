#version 460 core
// ps_5_0
// Checksum: 8e28f09c_3682f70d_3f15be72_45c39f14
// Name: samplelumfinal

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[17]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = v1.v.xy + idx_uniforms1_ps.cb1[0].xy;
	r0.xy = fma(r0.xy, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy))).x;
	r0.y = max(r0.x, float(0.00999999978f));
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[1].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.z = r0.z * float(0.0625000000f);
	r0.x = fma(r0.x, float(0.0625000000f), r0.z);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[2].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[3].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[4].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[5].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[6].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[7].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[8].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[9].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[10].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[11].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[12].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[13].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[14].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.w = max(r0.z, float(0.00999999978f));
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.y = max(r0.w, r0.y);
	r0.zw = v1.v.xy + idx_uniforms1_ps.cb1[15].xy;
	r0.zw = fma(r0.zw, vec2(0.500000000f, 0.500000000f), vec2(0.250000000f, 0.250000000f));
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.x = fma(r0.z, float(0.0625000000f), r0.x);
	r0.x = r0.x * float(1.44269502f);
	r0.x = exp2(r0.x);
	r0.xw = max(r0.xz, vec2(0.00999999978f, 0.00999999978f));
	r0.y = max(r0.w, r0.y);
	r0.y = r0.y * float(1.44269502f);
	r0.y = exp2(r0.y);
	r0.xy = idx_uniforms1_ps.cb1[16].zz / r0.xy;
	r0.y = -r0.x + r0.y;
	r0.x = fma(idx_uniforms1_ps.cb1[16].x, r0.y, r0.x);
	o0.xyz = r0.xxx * idx_uniforms1_ps.cb1[16].yyy;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

