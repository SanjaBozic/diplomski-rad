#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD3;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat1.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6 = vs_TEXCOORD3;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat6);
    return;
}