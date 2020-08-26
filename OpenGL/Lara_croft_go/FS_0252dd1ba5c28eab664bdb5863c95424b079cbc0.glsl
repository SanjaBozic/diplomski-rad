#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0 = max(u_xlat0, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.w = u_xlat1.w;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat0) + u_xlat1.xyz;
    return;
}