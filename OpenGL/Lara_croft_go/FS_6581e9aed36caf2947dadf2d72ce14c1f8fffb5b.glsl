#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform 	vec3 _RimColor;
uniform 	float _RimPower;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
    u_xlat9 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat1.xyz, _DirectionalLightForward.xyz);
    u_xlat3.xyz = u_xlat3.xxx * _DirectionalLightColor.xyz;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _RimPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * _RimColor.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    u_xlat0.xyz = vs_COLOR0.xyz * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.w = vs_COLOR0.w;
    u_xlat1.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat1;
    return;
}