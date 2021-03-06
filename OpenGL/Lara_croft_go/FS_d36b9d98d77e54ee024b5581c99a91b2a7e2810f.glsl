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
uniform 	float _ShadowBlur;
uniform 	vec2 _ShadowCameraSettings;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
bool u_xlatb5;
float u_xlat8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = min(u_xlat4.x, u_xlat0.x);
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
    u_xlat4.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * vs_TEXCOORD0.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, _DirectionalLightForward.xyz);
    u_xlat8 = (-u_xlat4.x) + 1.0;
    u_xlat8 = _PointLightAmbientFalloff * u_xlat8 + u_xlat4.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x;
    u_xlat0.xzw = u_xlat0.xxx * _PointLightColor.xyz;
    u_xlat0.xyz = u_xlat4.xxx * _DirectionalLightColor.xyz + u_xlat0.xzw;
    u_xlat1 = vec4(_ShadowBlur) * vec4(1.0, 0.0, -1.0, 0.0) + vs_TEXCOORD4.xyxy;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat1.xy);
    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat1.zw);
    u_xlat12 = vs_TEXCOORD4.z + (-_ShadowCameraSettings.xxyx.z);
    u_xlat12 = u_xlat12 / _ShadowCameraSettings.xxyx.y;
    u_xlatb1.y = u_xlat12>=u_xlat10_2.x;
    u_xlatb1.x = u_xlat12>=u_xlat10_1.x;
    u_xlat1.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb1.xy));
    u_xlat1.x = u_xlat1.x + u_xlat1.y;
    u_xlat2 = vec4(_ShadowBlur) * vec4(0.0, 1.0, 0.0, -1.0) + vs_TEXCOORD4.xyxy;
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.zw);
    u_xlatb5 = u_xlat12>=u_xlat10_2.x;
    u_xlatb12 = u_xlat12>=u_xlat10_3.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat1.x;
    u_xlat1.x = u_xlatb5 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat1.x;
    u_xlat12 = (-u_xlat12) * 0.25 + 1.0;
    u_xlat1.xyz = max(vec3(u_xlat12), _ShadowColor.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat1.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    SV_Target0.xyz = vs_COLOR0.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}