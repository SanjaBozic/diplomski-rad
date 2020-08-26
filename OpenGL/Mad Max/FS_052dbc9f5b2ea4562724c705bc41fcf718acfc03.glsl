#version 460 core
// ps_5_0
// Checksum: 4aa8fe88_351ee6cf_09eef868_26303503
// Name: characterhairprezfade

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[1]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


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
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).wxyz).x;
	r0.x = saturate(r0.x * idx_uniforms2_ps.cb2[0].x);
	r0.y = fma(idx_uniforms4_ps.cb4[4].x, r0.x, idx_uniforms4_ps.cb4[4].y);
	r0.x = fma(-r0.x, idx_uniforms1_ps.cb1[0].x, float(1.00000000f));
	r0.y = intBitsToFloat(r0.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.y) != uint(0);
	r0.y = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r0.y = fract(r0.y);
	r0.x = -r0.x + r0.y;
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	PixelEpilog();
	return;
}
