#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform 	vec4 _CubemapColor;
uniform  samplerCube _Cubemap;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _DirectionalLightForward.xyz);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalLightColor.xyz;
    u_xlat10_1 = texture(_Cubemap, vs_TEXCOORD2.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _CubemapColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _CubemapColor.www + vs_COLOR0.xyz;
    u_xlat2.xyz = u_xlat1.xyz * _AmbientLightColor.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}