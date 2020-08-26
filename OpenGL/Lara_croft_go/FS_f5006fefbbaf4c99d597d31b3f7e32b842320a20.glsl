#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
    u_xlatb9 = 0.0<u_xlat0.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat0.xx);
    u_xlat0.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat10_1.w * u_xlat0.x;
    u_xlat0.x = u_xlat10_2.w * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * _Color;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat9 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 0.0);
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    return;
}