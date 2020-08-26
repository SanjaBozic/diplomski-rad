#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.x = vs_TEXCOORD2.w;
    u_xlat1.y = vs_TEXCOORD3.w;
    u_xlat1.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat18) + (-u_xlat0.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat0.w = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat1.w = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, (-u_xlat0.xyz));
    u_xlat0.yz = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat18 = u_xlat0.w * u_xlat0.w;
    u_xlat1.x = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat1.x * u_xlat1.x;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat13 + 1.0;
    u_xlat13 = u_xlat18 * 3.14159274;
    u_xlat18 = u_xlat13 * u_xlat18 + 1.00000001e-007;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat18 = u_xlat13 / u_xlat18;
    u_xlat13 = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.y * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.y * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-006;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat18 = u_xlat18 * u_xlat7.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat7.x = max(u_xlat18, 9.99999975e-005);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb13) ? u_xlat7.x : u_xlat18;
    u_xlat18 = u_xlat0.y * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat7.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat7.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat7.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb20 = u_xlat20!=0.0;
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat20;
    u_xlat20 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_3 = texture(_LightTexture0, vec2(u_xlat20));
    u_xlat3.xyz = u_xlat10_3.www * _LightColor0.xyz;
    u_xlat4.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat0.xw = (-u_xlat0.xz) + vec2(1.0, 1.0);
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat12 = dot(vec2(u_xlat12), u_xlat1.xx);
    u_xlat12 = u_xlat12 + -0.5;
    u_xlat1.x = u_xlat0.w * u_xlat0.w;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    u_xlat5.xyz = (-u_xlat7.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat0.x * u_xlat0.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat0.x = u_xlat12 * u_xlat0.x + 1.0;
    u_xlat18 = (-u_xlat0.y) + 1.0;
    u_xlat19 = u_xlat18 * u_xlat18;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat12 = u_xlat12 * u_xlat18 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}