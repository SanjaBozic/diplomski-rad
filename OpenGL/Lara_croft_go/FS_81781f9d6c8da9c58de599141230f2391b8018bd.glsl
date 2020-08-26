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
uniform 	vec4 _CameraNormalsTexture_ST;
uniform  sampler2D _CameraDepthTexture;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D _CameraNormalsTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat6;
vec3 u_xlat9;
float u_xlat12;
mediump float u_xlat16_12;
float u_xlat18;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xyz = unity_ColorSpaceLuminance.xyz * _LightColor.xyz;
    u_xlat0.xz = u_xlat0.yz + u_xlat0.xx;
    u_xlat6.x = u_xlat0.z * u_xlat0.y;
    u_xlat0.x = _LightColor.z * unity_ColorSpaceLuminance.z + u_xlat0.x;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = dot(unity_ColorSpaceLuminance.ww, u_xlat6.xx);
    u_xlat0.x = u_xlat6.x + u_xlat0.x;
    u_xlat6.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture(_CameraDepthTexture, u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
    u_xlat10_2 = texture(_CameraNormalsTexture, u_xlat6.xy);
    u_xlat6.x = _ZBufferParams.x * u_xlat10_1.x + _ZBufferParams.y;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat12 = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD1.xyz;
    u_xlat1.xyw = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.yyy * hlslcc_mtx4unity_CameraToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_CameraToWorld[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_CameraToWorld[2].xyz * u_xlat1.www + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4unity_CameraToWorld[3].xyz;
    u_xlat4.xyz = u_xlat3.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat5.xyz = u_xlat3.xyz + (-_LightPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat6.x = (-u_xlat1.z) * u_xlat6.x + u_xlat18;
    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat1.w;
    u_xlat6.x = u_xlat6.x * unity_LightmapFade.z + unity_LightmapFade.w;
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat18 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat18);
    u_xlat18 = u_xlat18 * _LightPos.w;
    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat18)).wxyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat9.xyz = (-u_xlat4.xyz) * vec3(u_xlat12) + (-u_xlat1.xyz);
    u_xlat12 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat9.xyz = vec3(u_xlat12) * u_xlat9.xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = u_xlat10_2.w * 128.0;
    u_xlat16_18 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = vec3(u_xlat16_18) * u_xlat16_2.xyz;
    u_xlat18 = dot(u_xlat9.xyz, u_xlat16_2.xyz);
    u_xlat1.x = dot((-u_xlat1.xyz), u_xlat16_2.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat10_3.x * u_xlat1.x;
    u_xlat16_3 = u_xlat10_3.x;
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor.xyz;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = log2(u_xlat18);
    u_xlat12 = u_xlat18 * u_xlat16_12;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat16_3 * u_xlat12;
    u_xlat1.w = u_xlat0.x * u_xlat12;
    u_xlat0 = u_xlat6.xxxx * u_xlat1;
    SV_Target0 = exp2((-u_xlat0));
    return;
}