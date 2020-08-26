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
uniform 	vec3 _RimColor;
uniform 	float _RimPower;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bvec3 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
bool u_xlatb3;
bool u_xlatb6;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0 = vec4(_ShadowBlur) * vec4(1.0, 0.0, -1.0, 0.0) + vs_TEXCOORD5.xyxy;
    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat0.xy);
    u_xlat10_0 = texture(_ShadowMapTexture, u_xlat0.zw);
    u_xlat3 = vs_TEXCOORD5.z + (-_ShadowCameraSettings.xxyx.z);
    u_xlat3 = u_xlat3 / _ShadowCameraSettings.xxyx.y;
    u_xlatb0.z = u_xlat3>=u_xlat10_1.x;
    u_xlatb0.x = u_xlat3>=u_xlat10_0.x;
    u_xlat0.xz = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb0.xz));
    u_xlat0.x = u_xlat0.x + u_xlat0.z;
    u_xlat1 = vec4(_ShadowBlur) * vec4(0.0, 1.0, 0.0, -1.0) + vs_TEXCOORD5.xyxy;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat1.xy);
    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat1.zw);
    u_xlatb6 = u_xlat3>=u_xlat10_1.x;
    u_xlatb3 = u_xlat3>=u_xlat10_2.x;
    u_xlat3 = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat3 + u_xlat0.x;
    u_xlat3 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat3 + u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) * 0.25 + 1.0;
    u_xlat0.xyz = max(u_xlat0.xxx, _ShadowColor.xyz);
    u_xlat9 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat9 = min(u_xlat9, u_xlat1.x);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = max(u_xlat9, 0.00100000005);
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat9 = u_xlat9 + -1.0;
    u_xlat9 = u_xlat9 * 0.0399999991;
    u_xlat9 = sqrt(u_xlat9);
    u_xlatb1 = greaterThanEqual(_PointLightDistances, vec4(u_xlat9));
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat2.yzw = u_xlat1.xyz;
    u_xlat2.x = 0.0;
    u_xlat1 = u_xlat1 + (-u_xlat2);
    u_xlat9 = dot(u_xlat1, _PointLightIntensities);
    u_xlat1.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD0.xyz;
    u_xlat10 = dot(u_xlat1.xyz, _DirectionalLightForward.xyz);
    u_xlat2.x = (-u_xlat10) + 1.0;
    u_xlat2.x = _PointLightAmbientFalloff * u_xlat2.x + u_xlat10;
    u_xlat9 = u_xlat9 * u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat9) * _PointLightColor.xyz;
    u_xlat2.xyz = vec3(u_xlat10) * _DirectionalLightColor.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat2.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    u_xlat0.xyz = vs_COLOR0.xyz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat10 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * vs_TEXCOORD2.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _RimPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _RimColor.xyz;
    u_xlat0.w = vs_COLOR0.w;
    u_xlat1.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat1;
    return;
}