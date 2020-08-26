#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD4;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat0.xyz);
    u_xlat10_0 = texture(_LightTextureB0, vec2(u_xlat6));
    u_xlat16_0 = u_xlat10_1.w * u_xlat10_0.w;
    u_xlat0.xyz = vec3(u_xlat16_0) * _LightColor0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat6 = vs_TEXCOORD4;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat6);
    SV_Target0.w = 1.0;
    return;
}