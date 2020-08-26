#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4_PreviousVP[4];
uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat0.x = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4_PreviousVP[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4_PreviousVP[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4_PreviousVP[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4_PreviousVP[3].xyw * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat1.xy = u_xlat1.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4_NonJitteredVP[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4_NonJitteredVP[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4_NonJitteredVP[2].xyw * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4_NonJitteredVP[3].xyw * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    SV_Target0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-u_xlat1.xy);
    SV_Target0.zw = vec2(0.0, 1.0);
    return;
}