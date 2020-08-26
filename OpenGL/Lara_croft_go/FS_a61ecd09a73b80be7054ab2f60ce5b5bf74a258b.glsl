#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat2.xx);
    u_xlat2.xyz = u_xlat10_1.www * _LightColor0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    return;
}