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
uniform 	vec4 _DepthColorUp;
uniform 	vec4 _DepthColorDown;
uniform 	vec2 _DepthBoundsUp;
uniform 	vec2 _DepthBoundsDown;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
vec3 u_xlat3;
float u_xlat6;
vec2 u_xlat8;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat3.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = min(u_xlat3.x, u_xlat0.x);
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
    u_xlat3.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD0.xyz;
    u_xlat3.x = dot(u_xlat3.xyz, _DirectionalLightForward.xyz);
    u_xlat6 = (-u_xlat3.x) + 1.0;
    u_xlat6 = _PointLightAmbientFalloff * u_xlat6 + u_xlat3.x;
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.xzw = u_xlat0.xxx * _PointLightColor.xyz;
    u_xlat0.xyz = u_xlat3.xxx * _DirectionalLightColor.xyz + u_xlat0.xzw;
    u_xlat1.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    u_xlat0.xyz = vs_COLOR0.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_COLOR0.w;
    u_xlat1 = (-u_xlat0) + _DepthColorUp;
    u_xlat2.xy = (-vec2(_DepthBoundsUp.y, _DepthBoundsDown.y)) + vec2(_DepthBoundsUp.x, _DepthBoundsDown.x);
    u_xlat8.xy = vs_TEXCOORD2.yy + (-vec2(_DepthBoundsUp.y, _DepthBoundsDown.y));
    u_xlat2.xy = u_xlat8.xy / u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat2.xy = (-u_xlat2.xy) + vec2(1.0, 1.0);
    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
    u_xlat0 = _DepthColorUp.wwww * u_xlat1 + u_xlat0;
    u_xlat1 = (-u_xlat0) + _DepthColorDown;
    u_xlat1 = u_xlat1 * u_xlat2.yyyy;
    SV_Target0 = _DepthColorDown.wwww * u_xlat1 + u_xlat0;
    return;
}