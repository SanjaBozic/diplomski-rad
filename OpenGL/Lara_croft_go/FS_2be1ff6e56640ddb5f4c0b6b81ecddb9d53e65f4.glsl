#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_FogColor;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
float u_xlat3;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat10_0.w * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat0.xyz + unity_FogColor.xyz;
    u_xlatb0 = 0.00999999978>=u_xlat3;
    SV_Target0.w = u_xlat3;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    return;
}