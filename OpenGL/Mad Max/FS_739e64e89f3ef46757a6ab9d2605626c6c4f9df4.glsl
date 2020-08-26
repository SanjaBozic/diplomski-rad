#version 460 core
// ps_5_0
// Checksum: f89776f8_3547fe5b_8e30d9ce_33e963be
// Name: trail

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v2.v.xz * vec2(1.00000000f, 3.00000000f);
	r0.x = ((texture(resourceSamplerPair_0_ps, r0.xy)).wxyz).x;
	r0.x = -r0.x + float(1.00000000f);
	r1 = fma(idx_uniforms1_ps.cb1[0].zwwz, vec4(0.500000000f, 0.500000000f, 0.500000000f, 0.500000000f), v2.v.xyxy);
	r2 = (texture(resourceSamplerPair_1_ps, r1.xy));
	r1 = (texture(resourceSamplerPair_1_ps, r1.zw));
	r0.y = saturate(fma(r2.w, r1.w, float(0.800000012f)));
	r1.xyz = r1.xyz * r2.xyz;
	r1.w = saturate(-r0.x + r0.y);
	r0 = saturate(r1 * v1.v);
	o0 = r0 * vec4(1.00000000f, 1.00000000f, 1.00000000f, 0.750000000f);
	return;
}

