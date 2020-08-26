#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _TexA_HDR;
uniform 	vec4 _TexB_HDR;
uniform 	float _Level;
uniform 	float _value;
uniform  samplerCube _TexA;
uniform  samplerCube _TexB;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
mediump float u_xlat16_6;
void main()
{
    u_xlat10_0 = textureLod(_TexA, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_6 = log2(u_xlat10_0.w);
    u_xlat6 = u_xlat16_6 * _TexA_HDR.y;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = u_xlat6 * _TexA_HDR.x;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(u_xlat6);
    u_xlat10_1 = textureLod(_TexB, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_6 = log2(u_xlat10_1.w);
    u_xlat6 = u_xlat16_6 * _TexB_HDR.y;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = u_xlat6 * _TexB_HDR.x;
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat10_1.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_value, _value, _value)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}