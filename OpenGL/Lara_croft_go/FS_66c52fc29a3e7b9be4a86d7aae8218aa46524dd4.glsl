#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 unity_LightmapFade;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	vec4 _CameraNormalsTexture_ST;
uniform  sampler2D _CameraDepthTexture;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D _CameraNormalsTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
lowp vec4 u_xlat10_6;
vec2 u_xlat7;
vec3 u_xlat8;
float u_xlat14;
mediump float u_xlat16_14;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
void main()
{
    u_xlat0.xyz = unity_ColorSpaceLuminance.xyz * _LightColor.xyz;
    u_xlat0.xz = u_xlat0.yz + u_xlat0.xx;
    u_xlat7.x = u_xlat0.z * u_xlat0.y;
    u_xlat0.x = _LightColor.z * unity_ColorSpaceLuminance.z + u_xlat0.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = dot(unity_ColorSpaceLuminance.ww, u_xlat7.xx);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture(_CameraDepthTexture, u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
    u_xlat10_2 = texture(_CameraNormalsTexture, u_xlat7.xy);
    u_xlat7.x = _ZBufferParams.x * u_xlat10_1.x + _ZBufferParams.y;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat14 = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat1.xyz = vec3(u_xlat14) * vs_TEXCOORD1.xyz;
    u_xlat1.xyw = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.yyy * hlslcc_mtx4unity_CameraToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_CameraToWorld[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_CameraToWorld[2].xyz * u_xlat1.www + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4unity_CameraToWorld[3].xyz;
    u_xlat4.xyz = u_xlat3.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat14 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat5.xyz = (-u_xlat3.xyz) + _LightPos.xyz;
    u_xlat21 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat21);
    u_xlat21 = u_xlat21 * _LightPos.w;
    u_xlat10_6 = texture(_LightTextureB0, vec2(u_xlat21));
    u_xlat5.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat14) + u_xlat5.xyz;
    u_xlat14 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat4.xyz = vec3(u_xlat14) * u_xlat4.xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14 = u_xlat10_2.w * 128.0;
    u_xlat16_21 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat16_2.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat14 = u_xlat21 * u_xlat16_14;
    u_xlat14 = exp2(u_xlat14);
    u_xlat2.xyz = u_xlat3.yyy * hlslcc_mtx4unity_WorldToLight[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4unity_WorldToLight[0].xyw * u_xlat3.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_WorldToLight[2].xyw * u_xlat3.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat3.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat7.x = (-u_xlat1.z) * u_xlat7.x + u_xlat21;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat1.w;
    u_xlat7.x = u_xlat7.x * unity_LightmapFade.z + unity_LightmapFade.w;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat8.xyz = u_xlat2.xyz + hlslcc_mtx4unity_WorldToLight[3].xyw;
    u_xlat8.xy = u_xlat8.xy / u_xlat8.zz;
    u_xlatb21 = u_xlat8.z<0.0;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat10_2 = texture(_LightTexture0, u_xlat8.xy, -8.0);
    u_xlat21 = u_xlat21 * u_xlat10_2.w;
    u_xlat21 = u_xlat10_6.w * u_xlat21;
    u_xlat8.x = u_xlat21;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat2.xyz = vec3(u_xlat21) * _LightColor.xyz;
    u_xlat14 = u_xlat14 * u_xlat8.x;
    u_xlat2.w = u_xlat0.x * u_xlat14;
    SV_Target0 = u_xlat7.xxxx * u_xlat2;
    return;
}