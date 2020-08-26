#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD4;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat3 = max(u_xlat3, 0.0);
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
    u_xlat3 = vs_TEXCOORD4;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat3);
    SV_Target0.w = 1.0;
    return;
}