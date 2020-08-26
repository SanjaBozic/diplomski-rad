#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _Alpha;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  float vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat0.xyz + unity_FogColor.xyz;
    u_xlat10_0 = texture(_Alpha, vs_TEXCOORD1.xy);
    SV_Target0.w = u_xlat10_0.w;
    return;
}