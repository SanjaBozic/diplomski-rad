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
uniform 	vec4 _ShadowColor;
uniform 	vec2 _ShadowCameraSettings;
uniform 	vec3 _RimColor;
uniform 	float _RimPower;
uniform 	vec4 _EmissiveColor;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat10;
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
    u_xlat1.x = dot(u_xlat3.xyz, _DirectionalLightForward.xyz);
    u_xlat4.x = (-u_xlat1.x) + 1.0;
    u_xlat4.x = _PointLightAmbientFalloff * u_xlat4.x + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat4.xyz = u_xlat0.xxx * _PointLightColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * _DirectionalLightColor.xyz + u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD5.z + (-_ShadowCameraSettings.xxyx.z);
    u_xlat0.x = u_xlat0.x / _ShadowCameraSettings.xxyx.y;
    u_xlat10_2 = texture(_ShadowMapTexture, vs_TEXCOORD5.xy);
    u_xlatb0.x = u_xlat0.x>=u_xlat10_2.x;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat2.xyz = max(u_xlat0.xxx, _ShadowColor.xyz);
    u_xlat0.x = u_xlat0.x + _EmissiveColor.w;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat2.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat10 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * vs_TEXCOORD2.xyz;
    u_xlat3.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _RimPower;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.xyz = _RimColor.xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat3.xyz) + _EmissiveColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _EmissiveColor.www;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat3.xyz;
    SV_Target0.w = _EmissiveColor.w;
    return;
}