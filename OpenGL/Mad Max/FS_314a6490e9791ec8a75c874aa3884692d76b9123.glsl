#version 460 core
// ps_4_0
// Checksum: 823735be_d66ee6dc_bd032b51_41f75ab4
// Name: built_in_resolve_color8.fb

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 0) out vec4 o0;
precise vec4 r0, r1, r2, r3;

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
	r2 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(1)));
	r1 = r1 + r2;
	r2 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(2)));
	r3 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(3)));
	r2 = r2 + r3;
	r1 = r1 + r2;
	r2 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(4)));
	r3 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(5)));
	r2 = r2 + r3;
	r3 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(6)));
	r0 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(7)));
	r0 = r0 + r3;
	r0 = r0 + r2;
	r0 = r0 + r1;
	o0 = r0 * vec4(0.125000000f, 0.125000000f, 0.125000000f, 0.125000000f);
	return;
}

