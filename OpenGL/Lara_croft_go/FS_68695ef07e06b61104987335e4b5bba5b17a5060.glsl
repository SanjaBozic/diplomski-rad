#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _BlinkColor;
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform 	vec4 _ShadowColor;
uniform 	vec2 _ShadowCameraSettings;
uniform 	vec4 _CubemapColor;
uniform  samplerCube _Cubemap;
uniform  sampler2D _PaletteTex;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.z + (-_ShadowCameraSettings.xxyx.z);
    u_xlat0.x = u_xlat0.x / _ShadowCameraSettings.xxyx.y;
    u_xlat10_1 = texture(_ShadowMapTexture, vs_TEXCOORD5.xy);
    u_xlatb0 = u_xlat0.x>=u_xlat10_1.x;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat0.xyz = max(u_xlat0.xxx, _ShadowColor.xyz);
    u_xlat9 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, _DirectionalLightForward.xyz);
    u_xlat1.xyz = vec3(u_xlat9) * _DirectionalLightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat9 = dot(u_xlat1.xyz, vs_TEXCOORD1.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = vs_TEXCOORD1.xyz * (-vec3(u_xlat9)) + u_xlat1.xyz;
    u_xlat10_1 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _CubemapColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _CubemapColor.www;
    u_xlat10_2 = texture(_PaletteTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat10_2 + vs_COLOR0;
    u_xlat1.w = vs_COLOR0.w;
    u_xlat1 = u_xlat2 * vec4(1.60000002, 1.60000002, 1.60000002, 1.60000002) + u_xlat1;
    u_xlat2.xyz = u_xlat1.xyz * _AmbientLightColor.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = u_xlat1.w;
    SV_Target0.xyz = _BlinkColor.www * _BlinkColor.xyz + u_xlat0.xyz;
    return;
}