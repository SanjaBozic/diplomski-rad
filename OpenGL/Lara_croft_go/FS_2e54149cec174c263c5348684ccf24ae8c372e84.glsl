#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform 	vec4 _ShadowColor;
uniform 	vec2 _ShadowCameraSettings;
uniform 	vec3 _RimColor;
uniform 	float _RimPower;
uniform 	vec4 _EmissiveColor;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  float vs_TEXCOORD6;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat1.x = vs_TEXCOORD5.z + (-_ShadowCameraSettings.xxyx.z);
    u_xlat1.x = u_xlat1.x / _ShadowCameraSettings.xxyx.y;
    u_xlat10_2 = texture(_ShadowMapTexture, vs_TEXCOORD5.xy);
    u_xlatb1 = u_xlat1.x>=u_xlat10_2.x;
    u_xlat1.x = (u_xlatb1) ? 0.0 : 1.0;
    u_xlat4.xyz = max(u_xlat1.xxx, _ShadowColor.xyz);
    u_xlat1.x = u_xlat1.x + _EmissiveColor.w;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat4.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    u_xlat3.xyz = vs_COLOR0.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.xyz = _RimColor.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat4.xyz = (-u_xlat0.xyz) + _EmissiveColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _EmissiveColor.www;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD6;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = _EmissiveColor.w;
    return;
}