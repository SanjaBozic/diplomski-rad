#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform 	vec4 _BlinkColor;
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform 	vec4 _PointLightColor;
uniform 	vec4 _PointLightDistances;
uniform 	vec4 _PointLightIntensities;
uniform 	float _PointLightAmbientFalloff;
uniform  sampler2D _PaletteTex;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD6;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat6;
float u_xlat9;
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
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat3.x = dot(u_xlat3.xyz, _DirectionalLightForward.xyz);
    u_xlat6 = (-u_xlat3.x) + 1.0;
    u_xlat6 = _PointLightAmbientFalloff * u_xlat6 + u_xlat3.x;
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.xzw = u_xlat0.xxx * _PointLightColor.xyz;
    u_xlat0.xyz = u_xlat3.xxx * _DirectionalLightColor.xyz + u_xlat0.xzw;
    u_xlat10_1 = texture(_PaletteTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * vec4(1.60000002, 1.60000002, 1.60000002, 1.60000002);
    u_xlat2.xyz = u_xlat16_1.xyz * _AmbientLightColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat0.xyz = _BlinkColor.www * _BlinkColor.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD6;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz + unity_FogColor.xyz;
    return;
}