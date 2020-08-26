#version 460 core
// ps_5_0
// Checksum: 447c245a_4ee7267e_3081162e_f826153b
// Name: separableblurmed

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = v1.v.xyxy + -idx_uniforms1_ps.cb1[0];
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r0.xy))).xyz;
	r0.xyz = ((texture(resourceSamplerPair_0_ps, r0.zw))).xyz;
	r1.xyz = r1.xyz * vec3(0.225400001f, 0.225400001f, 0.225400001f);
	r2 = v1.v.xyxy + idx_uniforms1_ps.cb1[0];
	r3.xyz = ((texture(resourceSamplerPair_0_ps, r2.xy))).xyz;
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r2.zw))).xyz;
	r1.xyz = fma(r3.xyz, vec3(0.225400001f, 0.225400001f, 0.225400001f), r1.xyz);
	r1.xyz = fma(r2.xyz, vec3(0.165600002f, 0.165600002f, 0.165600002f), r1.xyz);
	r0.xyz = fma(r0.xyz, vec3(0.165600002f, 0.165600002f, 0.165600002f), r1.xyz);
	r1 = v1.v.xyxy + idx_uniforms1_ps.cb1[1];
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy))).xyz;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r1.zw))).xyz;
	r0.xyz = fma(r2.xyz, vec3(0.0824000016f, 0.0824000016f, 0.0824000016f), r0.xyz);
	r2 = v1.v.xyxy + -idx_uniforms1_ps.cb1[1];
	r3.xyz = ((texture(resourceSamplerPair_0_ps, r2.xy))).xyz;
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r2.zw))).xyz;
	r0.xyz = fma(r3.xyz, vec3(0.0824000016f, 0.0824000016f, 0.0824000016f), r0.xyz);
	r0.xyz = fma(r1.xyz, vec3(0.0265999995f, 0.0265999995f, 0.0265999995f), r0.xyz);
	o0.xyz = fma(r2.xyz, vec3(0.0265999995f, 0.0265999995f, 0.0265999995f), r0.xyz);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

