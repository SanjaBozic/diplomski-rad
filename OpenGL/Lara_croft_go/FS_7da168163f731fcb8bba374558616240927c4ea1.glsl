#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _CutoffRanges;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xy = (-_CutoffRanges.zz) * _CutoffRanges.xy + u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy * _CutoffRanges.ww;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat0.w = u_xlat1.y * 0.5 + u_xlat1.x;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}