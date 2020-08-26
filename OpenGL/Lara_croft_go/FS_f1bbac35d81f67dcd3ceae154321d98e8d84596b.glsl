#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform 	vec4 _PointLightColor;
uniform 	vec4 _PointLightDistances;
uniform 	vec4 _PointLightIntensities;
uniform 	float _PointLightAmbientFalloff;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat4;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat2.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = min(u_xlat2.x, u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat0.x * 0.0399999991;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb0 = greaterThanEqual(_PointLightDistances, u_xlat0.xxxx);
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat1.yzw = u_xlat0.xyz;
    u_xlat1.x = 0.0;
    u_xlat0 = u_xlat0 + (-u_xlat1);
    u_xlat0.x = dot(u_xlat0, _PointLightIntensities);
    u_xlat2.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD0.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, _DirectionalLightForward.xyz);
    u_xlat4 = (-u_xlat2.x) + 1.0;
    u_xlat4 = _PointLightAmbientFalloff * u_xlat4 + u_xlat2.x;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat0.xzw = u_xlat0.xxx * _PointLightColor.xyz;
    u_xlat0.xyz = u_xlat2.xxx * _DirectionalLightColor.xyz + u_xlat0.xzw;
    u_xlat1.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    SV_Target0.xyz = vs_COLOR0.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}