#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform 	vec4 _ShadowColor;
in  float vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0 = vs_TEXCOORD0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat1.xyz = (-unity_FogColor.xyz) + _ShadowColor.xyz;
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz + unity_FogColor.xyz;
    SV_Target0.w = _ShadowColor.w;
    return;
}