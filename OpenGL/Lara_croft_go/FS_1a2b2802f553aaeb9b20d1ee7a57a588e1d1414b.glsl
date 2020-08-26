#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToShadow[16];
uniform 	vec4 _LightShadowData;
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
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec2 u_xlat5;
vec2 u_xlat10;
lowp float u_xlat10_10;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
void main()
{
    u_xlat0 = (-_LightShadowData.x) + 1.0;
    u_xlat5.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture(_CameraDepthTexture, u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
    u_xlat10_2 = texture(_CameraNormalsTexture, u_xlat5.xy);
    u_xlat5.x = _ZBufferParams.x * u_xlat10_1.x + _ZBufferParams.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat10.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat1.xyz = u_xlat10.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xyw = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.yyy * hlslcc_mtx4unity_CameraToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_CameraToWorld[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_CameraToWorld[2].xyz * u_xlat1.www + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4unity_CameraToWorld[3].xyz;
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4unity_WorldToShadow[1];
    u_xlat4 = hlslcc_mtx4unity_WorldToShadow[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4unity_WorldToShadow[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4unity_WorldToShadow[3];
    u_xlat4.xyz = u_xlat4.xyz / u_xlat4.www;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat10_10 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat0 = u_xlat10_10 * u_xlat0 + _LightShadowData.x;
    u_xlat4.xyz = u_xlat3.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat10.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat5.x = (-u_xlat1.z) * u_xlat5.x + u_xlat10.x;
    u_xlat5.x = unity_ShadowFadeCenterAndType.w * u_xlat5.x + u_xlat1.w;
    u_xlat10.x = u_xlat5.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    u_xlat5.x = u_xlat5.x * unity_LightmapFade.z + unity_LightmapFade.w;
    u_xlat5.x = (-u_xlat5.x) + 1.0;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat0 = u_xlat10.x + u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.yyy * hlslcc_mtx4unity_WorldToLight[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToLight[0].xyw * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToLight[2].xyw * u_xlat3.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToLight[3].xyw;
    u_xlat10.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlatb1 = u_xlat1.z<0.0;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat10_4 = texture(_LightTexture0, u_xlat10.xy, -8.0);
    u_xlat10.x = u_xlat1.x * u_xlat10_4.w;
    u_xlat1.xyz = (-u_xlat3.xyz) + _LightPos.xyz;
    u_xlat3.xyz = u_xlat3.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat16));
    u_xlat10.x = u_xlat10.x * u_xlat10_4.w;
    u_xlat0 = u_xlat0 * u_xlat10.x;
    u_xlat10.x = u_xlat0;
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = u_xlat10_2.w * 128.0;
    u_xlat16_16 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_16 = inversesqrt(u_xlat16_16);
    u_xlat16_2.xyz = vec3(u_xlat16_16) * u_xlat16_2.xyz;
    u_xlat16 = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat0 = u_xlat0 * u_xlat1.x;
    u_xlat2.xyz = vec3(u_xlat0) * _LightColor.xyz;
    u_xlat0 = max(u_xlat16, 0.0);
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * u_xlat16_15;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = u_xlat10.x * u_xlat0;
    u_xlat1.xyz = unity_ColorSpaceLuminance.xyz * _LightColor.xyz;
    u_xlat10.xy = u_xlat1.yz + u_xlat1.xx;
    u_xlat15 = u_xlat10.y * u_xlat1.y;
    u_xlat10.x = _LightColor.z * unity_ColorSpaceLuminance.z + u_xlat10.x;
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = dot(unity_ColorSpaceLuminance.ww, vec2(u_xlat15));
    u_xlat10.x = u_xlat15 + u_xlat10.x;
    u_xlat2.w = u_xlat10.x * u_xlat0;
    SV_Target0 = u_xlat5.xxxx * u_xlat2;
    return;
}