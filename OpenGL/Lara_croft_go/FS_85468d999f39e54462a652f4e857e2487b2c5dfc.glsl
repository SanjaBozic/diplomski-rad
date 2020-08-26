#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _TintColor;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat0 = vs_COLOR0 + vs_COLOR0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat0 = u_xlat0 * _TintColor;
    u_xlat1 = vs_TEXCOORD1;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat1);
    SV_Target0.w = u_xlat0.w;
    return;
}