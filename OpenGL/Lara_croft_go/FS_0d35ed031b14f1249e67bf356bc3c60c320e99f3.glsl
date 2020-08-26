#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
uniform  sampler2D _AlphaTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_AlphaTex, vs_TEXCOORD0.xy);
    u_xlat0.w = u_xlat10_1.x;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}