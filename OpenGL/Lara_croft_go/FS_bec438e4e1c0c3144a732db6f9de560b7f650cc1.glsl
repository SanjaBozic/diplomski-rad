#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D unity_Lightmap;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD2;
in  float vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(4.0, 4.0, 4.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD3) * u_xlat0.xyz + unity_FogColor.xyz;
    return;
}