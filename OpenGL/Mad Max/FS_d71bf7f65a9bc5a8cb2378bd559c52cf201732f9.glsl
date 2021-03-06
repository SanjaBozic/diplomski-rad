#version 460 core
// ps_4_0
// Checksum: 2bb73455_33dcd6dc_fce3b07e_b6aedde2
// Name: built_in_resolve_color.fb

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 0) out vec4 o0;
precise vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s-1


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = intBitsToFloat(ivec2(v0.xy));
	r0.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	o0 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(floatBitsToInt(r0.w))));
	return;
}

