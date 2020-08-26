#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0 = sqrt(u_xlat0);
    u_xlat0 = u_xlat0 + unity_LightShadowBias.x;
    SV_Target0 = vec4(u_xlat0) * _LightPositionRange.wwww;
    return;
}