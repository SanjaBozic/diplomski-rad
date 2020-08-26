#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToShadow[16];
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform  sampler2D _CameraDepthTexture;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
float u_xlat2;
lowp float u_xlat10_2;
float u_xlat4;
void main()
{
    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat2 = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat4 = (-u_xlat2) + u_xlat10_0.x;
    u_xlat2 = unity_OrthoParams.w * u_xlat4 + u_xlat2;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat10_0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat2) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat2) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vec3 txVec1 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat10_2 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4 = (-_LightShadowData.x) + 1.0;
    u_xlat2 = u_xlat10_2 * u_xlat4 + _LightShadowData.x;
    SV_Target0 = u_xlat0.xxxx + vec4(u_xlat2);
    return;
}