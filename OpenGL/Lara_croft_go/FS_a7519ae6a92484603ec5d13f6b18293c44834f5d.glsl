#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.xy + vec2(1.0, 1.0);
    SV_Target0.xy = u_xlat2.xy * vec2(0.5, 0.5) + (-u_xlat0.xy);
    SV_Target0.zw = vec2(0.0, 1.0);
    return;
}