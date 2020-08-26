#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform 	vec4 _TintColor;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat1 = vs_COLOR0 + vs_COLOR0;
    u_xlat1 = u_xlat1 * _TintColor;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat10_2.xyz + (-unity_FogColor.xyz);
    u_xlat1.x = u_xlat1.w * u_xlat10_2.w;
    SV_Target0.w = u_xlat1.x;
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat3.xyz + unity_FogColor.xyz;
    return;
}