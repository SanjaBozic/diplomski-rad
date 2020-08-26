#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  float vs_TEXCOORD7;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat9;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_9 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat2.xyz = vec3(u_xlat16_9) * u_xlat2.xyz;
    u_xlat9 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat9 = vs_TEXCOORD7;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat9);
    SV_Target0.w = 1.0;
    return;
}