#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform 	vec4 _DepthColor;
uniform 	vec2 _DepthBounds;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  float vs_TEXCOORD5;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
void main()
{
    u_xlat0.x = (-_DepthBounds.y) + _DepthBounds.x;
    u_xlat3.x = vs_TEXCOORD1.y + (-_DepthBounds.y);
    u_xlat0.x = u_xlat3.x / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat3.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD0.xyz;
    u_xlat3.x = dot(u_xlat3.xyz, _DirectionalLightForward.xyz);
    u_xlat3.xyz = u_xlat3.xxx * _DirectionalLightColor.xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat1.w = vs_COLOR0.w;
    u_xlat2 = (-u_xlat1) + _DepthColor;
    u_xlat0 = u_xlat0.xxxx * u_xlat2;
    u_xlat0 = _DepthColor.wwww * u_xlat0 + u_xlat1;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat0.w;
    u_xlat9 = vs_TEXCOORD5;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz + unity_FogColor.xyz;
    return;
}