#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D unity_Lightmap;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  float vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}