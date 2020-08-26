#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform 	vec4 _TintColor;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD1;
in  float vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
float u_xlat6;
void main()
{
    u_xlat0 = vs_COLOR0 * _TintColor;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlatb1 = 0.00499999989>=u_xlat0.w;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    u_xlat6 = u_xlat0.w + u_xlat0.w;
    SV_Target0.w = u_xlat6;
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat0.xyz + unity_FogColor.xyz;
    return;
}