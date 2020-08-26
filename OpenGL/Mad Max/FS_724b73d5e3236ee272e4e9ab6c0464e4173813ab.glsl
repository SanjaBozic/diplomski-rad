#version 460 core
// ps_5_0
// Checksum: af6f57f8_d495e808_24561dee_889b1595
// Name: rendervelocitybuffernotexclamp

layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xyz = v3.v.xyz / v3.v.www;
	r1.xyz = v2.v.xyz / v2.v.www;
	r0.xyz = r0.xyz + -r1.xyz;
	r0.z = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.z);
	r0.z = sqrt(r0.z);
	r0.z = min(r0.z, idx_uniforms1_ps.cb1[0].x);
	r0.z = saturate(r0.z * float(20.0000000f));
	r0.xy = r0.ww * r0.xy;
	r0.xy = r0.zz * r0.xy;
	r0.z = intBitsToFloat(float(0.00000000f) < r0.z ? int(0xffffffff) : int(0x00000000));
	r0.xy = uintBitsToFloat(floatBitsToUint(r0.xy) & floatBitsToUint(r0.zz));
	r0.xy = r0.xy + vec2(1.00000000f, 1.00000000f);
	o0.xy = r0.xy * vec2(0.500000000f, 0.500000000f);
	o0.z = v2.v.w * float(0.00999999978f);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

