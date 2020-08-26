#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform 	vec4 _DepthColorUp;
uniform 	vec4 _DepthColorDown;
uniform 	vec2 _DepthBoundsUp;
uniform 	vec2 _DepthBoundsDown;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  float vs_TEXCOORD5;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
vec2 u_xlat8;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _DirectionalLightForward.xyz);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalLightColor.xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    u_xlat0.xyz = vs_COLOR0.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_COLOR0.w;
    u_xlat1 = (-u_xlat0) + _DepthColorUp;
    u_xlat2.xy = (-vec2(_DepthBoundsUp.y, _DepthBoundsDown.y)) + vec2(_DepthBoundsUp.x, _DepthBoundsDown.x);
    u_xlat8.xy = vs_TEXCOORD1.yy + (-vec2(_DepthBoundsUp.y, _DepthBoundsDown.y));
    u_xlat2.xy = u_xlat8.xy / u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat2.xy = (-u_xlat2.xy) + vec2(1.0, 1.0);
    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
    u_xlat0 = _DepthColorUp.wwww * u_xlat1 + u_xlat0;
    u_xlat1 = (-u_xlat0) + _DepthColorDown;
    u_xlat1 = u_xlat1 * u_xlat2.yyyy;
    u_xlat0 = _DepthColorDown.wwww * u_xlat1 + u_xlat0;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat0.w;
    u_xlat9 = vs_TEXCOORD5;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz + unity_FogColor.xyz;
    return;
}