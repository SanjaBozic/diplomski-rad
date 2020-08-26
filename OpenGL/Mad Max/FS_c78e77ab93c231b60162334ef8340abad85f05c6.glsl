#version 460 core
// ps_5_0
// Checksum: 79edd1e8_af13c635_6408feb5_fcf250cf
// Name: gui_grayscale

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0


void Initialise()
{
}



void PixelEpilog()
{
	if (discarded)
		discard;
}

void main()
{
	Initialise();
	r0.y = ((texture(resourceSamplerPair_0_ps, v1.v.zw)).xwyz).y;
	r0.z = intBitsToFloat(r0.y < float(0.0156862754f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.z) != uint(0);
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r0.x = dot(r1.xyz, vec3(0.333333343f, 0.333333343f, 0.333333343f));
	r0 = r0.xxxy * idx_uniforms1_ps.cb1[0];
	r0.xyz = log2(r0.xyz);
	o0.w = r0.w;
	r0.xyz = r0.xyz * idx_uniforms2_ps.cb2[1].xxx;
	o0.xyz = exp2(r0.xyz);
	PixelEpilog();
	return;
}

