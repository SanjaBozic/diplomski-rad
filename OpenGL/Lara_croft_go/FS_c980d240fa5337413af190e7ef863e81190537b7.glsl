#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _HaloFalloff;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat10_1 = texture(_HaloFalloff, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_1.www * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat10_1.w;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat0);
    return;
}