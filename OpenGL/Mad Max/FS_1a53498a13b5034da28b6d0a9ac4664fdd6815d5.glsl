#version 460 core
// ps_5_0
// Checksum: c915fea1_4b9b0f48_5ad56ef4_3019591b
// Name: pointlightreflection

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)


void Initialise()
{
}


void main()
{
	Initialise();
	r0.x = dot(v1.v.xy, v1.v.xy);
	r0.x = min(r0.x, float(1.00000000f));
	r0.x = fma(r0.x, float(6.00000000f), float(1.00000000f));
	r0.x = float(1.00000000f) / r0.x;
	r0.x = fma(r0.x, float(1.16666663f), float(-0.166666672f));
	o0.xyz = r0.xxx * v2.v.xyz;
	o0.w = r0.x;
	return;
}

