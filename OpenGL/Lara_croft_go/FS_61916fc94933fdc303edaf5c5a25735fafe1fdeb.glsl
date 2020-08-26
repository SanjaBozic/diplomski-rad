#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform 	vec3 _RimColor;
uniform 	float _RimPower;
uniform 	vec4 _EmissiveColor;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
    u_xlat6 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat1.xyz, _DirectionalLightForward.xyz);
    u_xlat2.xyz = u_xlat2.xxx * _DirectionalLightColor.xyz;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _RimPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat1.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat0.xyz = _RimColor.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _EmissiveColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _EmissiveColor.www;
    SV_Target0.xyz = _EmissiveColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = _EmissiveColor.w;
    return;
}