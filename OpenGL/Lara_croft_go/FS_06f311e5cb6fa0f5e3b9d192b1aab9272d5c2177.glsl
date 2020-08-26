#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 unity_LightmapFade;
uniform 	vec4 _CameraNormalsTexture_ST;
uniform  sampler2D _CameraDepthTexture;
uniform  sampler2D _CameraNormalsTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
float u_xlat10;
mediump float u_xlat16_10;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xyz = unity_ColorSpaceLuminance.xyz * _LightColor.xyz;
    u_xlat0.xz = u_xlat0.yz + u_xlat0.xx;
    u_xlat5.x = u_xlat0.z * u_xlat0.y;
    u_xlat0.x = _LightColor.z * unity_ColorSpaceLuminance.z + u_xlat0.x;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = dot(unity_ColorSpaceLuminance.ww, u_xlat5.xx);
    u_xlat0.x = u_xlat5.x + u_xlat0.x;
    u_xlat5.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture(_CameraDepthTexture, u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
    u_xlat10_2 = texture(_CameraNormalsTexture, u_xlat5.xy);
    u_xlat5.x = _ZBufferParams.x * u_xlat10_1.x + _ZBufferParams.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat10 = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat1.xyz = vec3(u_xlat10) * vs_TEXCOORD1.xyz;
    u_xlat1.xyw = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.yyy * hlslcc_mtx4unity_CameraToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_CameraToWorld[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_CameraToWorld[2].xyz * u_xlat1.www + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4unity_CameraToWorld[3].xyz;
    u_xlat4.xyz = u_xlat3.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat10 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10 = sqrt(u_xlat10);
    u_xlat5.x = (-u_xlat1.z) * u_xlat5.x + u_xlat10;
    u_xlat5.x = unity_ShadowFadeCenterAndType.w * u_xlat5.x + u_xlat1.w;
    u_xlat5.x = u_xlat5.x * unity_LightmapFade.z + unity_LightmapFade.w;
    u_xlat5.x = (-u_xlat5.x) + 1.0;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat10 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(u_xlat10) + (-_LightDir.xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10 = u_xlat10_2.w * 128.0;
    u_xlat16_15 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = vec3(u_xlat16_15) * u_xlat16_2.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat1.x = dot((-_LightDir.xyz), u_xlat16_2.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor.xyz;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat10 = u_xlat15 * u_xlat16_10;
    u_xlat10 = exp2(u_xlat10);
    u_xlat1.w = u_xlat0.x * u_xlat10;
    SV_Target0 = u_xlat5.xxxx * u_xlat1;
    return;
}