#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _TintColor;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
void main()
{
    u_xlat0 = vs_COLOR0 * _TintColor;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlatb1 = 0.00499999989>=u_xlat0.w;
    SV_Target0 = u_xlat0 + u_xlat0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    return;
}