#version 460 core
// ps_5_0
// Checksum: eb9cb279_a9d92992_85b87703_84b431c5
// Name: rendervelocitybuffer

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;


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

void main()
{
	Initialise();
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).wxyz).x;
	r0.x = fma(idx_uniforms4_ps.cb4[4].x, r0.x, idx_uniforms4_ps.cb4[4].y);
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.xyz = v3.v.xyz / v3.v.www;
	r1.xyz = v2.v.xyz / v2.v.www;
	r0.xyz = r0.xyz + -r1.xyz;
	r0.z = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.z);
	r0.z = sqrt(r0.z);
	r0.z = r0.z * float(20.0000000f);
	r0.z = min(r0.z, float(1.00000000f));
	r0.xy = r0.ww * r0.xy;
	r0.xy = r0.zz * r0.xy;
	r0.z = intBitsToFloat(float(0.00000000f) < r0.z ? int(0xffffffff) : int(0x00000000));
	r0.xy = uintBitsToFloat(floatBitsToUint(r0.xy) & floatBitsToUint(r0.zz));
	r0.xy = r0.xy + vec2(1.00000000f, 1.00000000f);
	o0.xy = r0.xy * vec2(0.500000000f, 0.500000000f);
	o0.z = v2.v.w * float(0.00999999978f);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	PixelEpilog();
	return;
}

