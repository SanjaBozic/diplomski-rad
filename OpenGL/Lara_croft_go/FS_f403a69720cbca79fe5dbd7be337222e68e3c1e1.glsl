#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
float u_xlat8;
bool u_xlatb8;
float u_xlat13;
float u_xlat14;
float u_xlat18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = u_xlat0.x * 0.970000029;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat1 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.y = u_xlat10_2.x;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.z = u_xlat10_2.x;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.w = u_xlat10_2.x;
    u_xlatb0 = lessThan(u_xlat1, u_xlat0.xxxx);
    u_xlat0.x = (u_xlatb0.x) ? _LightShadowData.x : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? _LightShadowData.x : float(1.0);
    u_xlat0.z = (u_xlatb0.z) ? _LightShadowData.x : float(1.0);
    u_xlat0.w = (u_xlatb0.w) ? _LightShadowData.x : float(1.0);
    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat6.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTextureB0, u_xlat6.xx);
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_6 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_6;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + (-u_xlat1.xyz);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat4.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, (-u_xlat1.xyz));
    u_xlat7 = max(u_xlat2.x, 0.0);
    u_xlat1.xz = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat19 = (-_Glossiness) + 1.0;
    u_xlat2.x = u_xlat19 * u_xlat19;
    u_xlat8 = u_xlat2.x * u_xlat2.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat8 + 1.0;
    u_xlat8 = u_xlat18 * 3.14159274;
    u_xlat18 = u_xlat8 * u_xlat18 + 1.00000001e-007;
    u_xlat8 = u_xlat2.x * u_xlat2.x;
    u_xlat18 = u_xlat8 / u_xlat18;
    u_xlat8 = (-u_xlat19) * u_xlat19 + 1.0;
    u_xlat14 = u_xlat1.x * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat7 * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat14 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-006;
    u_xlat2.x = 2.0 / u_xlat2.x;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat2.x = max(u_xlat18, 9.99999975e-005);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb8 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb8) ? u_xlat2.x : u_xlat18;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat3.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat3.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat20 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlatb20 = u_xlat20!=0.0;
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat20;
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat18 = (-u_xlat1.z) + 1.0;
    u_xlat13 = u_xlat1.z * u_xlat1.z;
    u_xlat13 = dot(vec2(u_xlat13), vec2(u_xlat19));
    u_xlat13 = u_xlat13 + -0.5;
    u_xlat19 = u_xlat18 * u_xlat18;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat5.xyz = (-u_xlat3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat18 = u_xlat13 * u_xlat18 + 1.0;
    u_xlat1.x = (-u_xlat7) + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat1.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat1.x = u_xlat1.x * u_xlat19;
    u_xlat1.x = u_xlat13 * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}