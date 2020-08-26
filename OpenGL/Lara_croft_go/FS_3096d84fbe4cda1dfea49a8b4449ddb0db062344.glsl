#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform 	vec4 _ShadowColor;
uniform 	vec2 _ShadowCameraSettings;
uniform 	vec4 _DepthColor;
uniform 	vec2 _DepthBounds;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  float vs_TEXCOORD5;
in  vec4 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat2;
float u_xlat5;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD4.z + (-_ShadowCameraSettings.xxyx.z);
    u_xlat0.x = u_xlat0.x / _ShadowCameraSettings.xxyx.y;
    u_xlat10_1 = texture(_ShadowMapTexture, vs_TEXCOORD4.xy);
    u_xlatb0 = u_xlat0.x>=u_xlat10_1.x;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat0.xyz = max(u_xlat0.xxx, _ShadowColor.xyz);
    u_xlat9 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, _DirectionalLightForward.xyz);
    u_xlat1.xyz = vec3(u_xlat9) * _DirectionalLightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat1.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    u_xlat0.xyz = vs_COLOR0.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_COLOR0.w;
    u_xlat1 = (-u_xlat0) + _DepthColor;
    u_xlat2 = (-_DepthBounds.y) + _DepthBounds.x;
    u_xlat5 = vs_TEXCOORD1.y + (-_DepthBounds.y);
    u_xlat2 = u_xlat5 / u_xlat2;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = (-u_xlat2) + 1.0;
    u_xlat1 = u_xlat1 * vec4(u_xlat2);
    u_xlat0 = _DepthColor.wwww * u_xlat1 + u_xlat0;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat0.w;
    u_xlat9 = vs_TEXCOORD5;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz + unity_FogColor.xyz;
    return;
}