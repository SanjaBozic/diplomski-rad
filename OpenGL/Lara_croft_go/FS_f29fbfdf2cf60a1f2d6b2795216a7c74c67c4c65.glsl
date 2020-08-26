#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat5;
mediump float u_xlat16_5;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat12 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat12 = u_xlat12 + u_xlat12;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat12)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.x = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat4.x * u_xlat4.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_4 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat4.xyz = vec3(u_xlat16_4) * u_xlat2.xyz;
    u_xlat13 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat13) + u_xlat4.xyz;
    u_xlat1.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LightPositionRange.w;
    u_xlat1.x = u_xlat1.x * 0.970000029;
    u_xlat10_2 = texture(_ShadowMapTexture, vs_TEXCOORD6.xyz);
    u_xlatb1 = u_xlat10_2.x<u_xlat1.x;
    u_xlat1.x = (u_xlatb1) ? _LightShadowData.x : 1.0;
    u_xlat5 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat5));
    u_xlat10_3 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_5 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat1.x = u_xlat1.x * u_xlat16_5;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}