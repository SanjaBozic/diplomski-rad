#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_FogColor;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _Illum;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  float vs_TEXCOORD5;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat1.xyz = u_xlat3.xyz * _LightColor0.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat10_2 = texture(_Illum, vs_TEXCOORD0.zw);
    u_xlat0.xyz = u_xlat3.xyz * u_xlat10_2.www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD5;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}