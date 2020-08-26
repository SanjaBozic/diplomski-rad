#version 460 core
// ps_5_0
// Checksum: 1cb9cec4_8d91d760_c3048626_4ac90c12
// Name: sampleluminitial

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[9]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = v1.v.xy + idx_uniforms1_ps.cb1[1].xy;
	r0.xyz = ((texture(resourceSamplerPair_0_ps, r0.xy))).xyz;
	r0.x = dot(r0.xyz, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.x = r0.x + float(9.99999975e-05f);
	r0.x = log2(r0.x);
	r0.x = r0.x * float(0.693147182f);
	r0.yz = v1.v.xy + idx_uniforms1_ps.cb1[0].xy;
	r0.yzw = ((texture(resourceSamplerPair_0_ps, r0.yz)).wxyz).yzw;
	r0.y = dot(r0.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.y = r0.y + float(9.99999975e-05f);
	r0.y = log2(r0.y);
	r0.x = fma(r0.y, float(0.693147182f), r0.x);
	r0.yz = v1.v.xy + idx_uniforms1_ps.cb1[2].xy;
	r0.yzw = ((texture(resourceSamplerPair_0_ps, r0.yz)).wxyz).yzw;
	r0.y = dot(r0.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.y = r0.y + float(9.99999975e-05f);
	r0.y = log2(r0.y);
	r0.x = fma(r0.y, float(0.693147182f), r0.x);
	r0.yz = v1.v.xy + idx_uniforms1_ps.cb1[3].xy;
	r0.yzw = ((texture(resourceSamplerPair_0_ps, r0.yz)).wxyz).yzw;
	r0.y = dot(r0.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.y = r0.y + float(9.99999975e-05f);
	r0.y = log2(r0.y);
	r0.x = fma(r0.y, float(0.693147182f), r0.x);
	r0.yz = v1.v.xy + idx_uniforms1_ps.cb1[4].xy;
	r0.yzw = ((texture(resourceSamplerPair_0_ps, r0.yz)).wxyz).yzw;
	r0.y = dot(r0.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.y = r0.y + float(9.99999975e-05f);
	r0.y = log2(r0.y);
	r0.x = fma(r0.y, float(0.693147182f), r0.x);
	r0.yz = v1.v.xy + idx_uniforms1_ps.cb1[5].xy;
	r0.yzw = ((texture(resourceSamplerPair_0_ps, r0.yz)).wxyz).yzw;
	r0.y = dot(r0.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.y = r0.y + float(9.99999975e-05f);
	r0.y = log2(r0.y);
	r0.x = fma(r0.y, float(0.693147182f), r0.x);
	r0.yz = v1.v.xy + idx_uniforms1_ps.cb1[6].xy;
	r0.yzw = ((texture(resourceSamplerPair_0_ps, r0.yz)).wxyz).yzw;
	r0.y = dot(r0.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.y = r0.y + float(9.99999975e-05f);
	r0.y = log2(r0.y);
	r0.x = fma(r0.y, float(0.693147182f), r0.x);
	r0.yz = v1.v.xy + idx_uniforms1_ps.cb1[7].xy;
	r0.yzw = ((texture(resourceSamplerPair_0_ps, r0.yz)).wxyz).yzw;
	r0.y = dot(r0.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.y = r0.y + float(9.99999975e-05f);
	r0.y = log2(r0.y);
	r0.x = fma(r0.y, float(0.693147182f), r0.x);
	r0.yz = v1.v.xy + idx_uniforms1_ps.cb1[8].xy;
	r0.yzw = ((texture(resourceSamplerPair_0_ps, r0.yz)).wxyz).yzw;
	r0.y = dot(r0.yzw, vec3(0.212500006f, 0.715399981f, 0.0720999986f));
	r0.y = r0.y + float(9.99999975e-05f);
	r0.y = log2(r0.y);
	r0.x = fma(r0.y, float(0.693147182f), r0.x);
	o0.xyz = r0.xxx * vec3(0.111111112f, 0.111111112f, 0.111111112f);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

