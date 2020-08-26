#version 460 core
// ps_4_0
// Checksum: a14e6aee_75c4920c_cd1a47b1_a98374a1
// Name: built_in_resolve_color2.fb

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 0) out vec4 o0;
precise vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)


// Sampler/resource pairs

uniform sampler2DMS resourceSamplerPair_0_ps; // res0, s-1


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = intBitsToFloat(ivec2(v0.xy));
	r0.zw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	r1 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(0)));
	r0 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(1)));
	r0 = r0 + r1;
	o0 = r0 * vec4(0.500000000f, 0.500000000f, 0.500000000f, 0.500000000f);
	return;
}

