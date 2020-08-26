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
in  float vs_TEXCOORD3;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat3.xyz);
    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
    u_xlat16_3 = u_xlat10_2.w * u_xlat10_1.w;
    u_xlat3.xyz = vec3(u_xlat16_3) * _LightColor0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * _Color;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat9 = vs_TEXCOORD3;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat9);
    return;
}