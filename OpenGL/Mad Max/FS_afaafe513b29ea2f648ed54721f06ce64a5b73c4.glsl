#version 460 core
// ps_4_0
// Checksum: f88efc04_543973e5_3aea13eb_7df94465
// Name: built_in_resolve_depth8.fb

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
	r1.y = r2.x;
	r2 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(2)));
	r1.z = r2.x;
	r2 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(3)));
	r1.w = r2.x;
	r2 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(4)));
	r3 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(5)));
	r2.y = r3.x;
	r3 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(6)));
	r0 = (texelFetch(resourceSamplerPair_0_ps, floatBitsToInt(r0.xy), int(7)));
	r2.w = r0.x;
	r2.z = r3.x;
	r0 = min(r1, r2);
	r0.xy = min(r0.zw, r0.xy);
	o0.x = min(r0.y, r0.x);
	return;
}

