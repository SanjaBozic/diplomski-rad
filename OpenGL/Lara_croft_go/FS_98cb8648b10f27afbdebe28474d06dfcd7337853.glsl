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
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform  sampler2D _CameraDepthTexture;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D _CameraGBufferTexture0;
uniform  sampler2D _CameraGBufferTexture1;
uniform  sampler2D _CameraGBufferTexture2;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat7;
mediump float u_xlat16_7;
float u_xlat8;
float u_xlat12;
mediump float u_xlat16_12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = (-_LightShadowData.x) + 1.0;
    u_xlat6.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat6.xyz = u_xlat6.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_2 = texture(_CameraDepthTexture, u_xlat1.xy);
    u_xlat13.x = _ZBufferParams.x * u_xlat10_2.x + _ZBufferParams.y;
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat13.xxx;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    vec3 txVec17 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
    u_xlat0.x = u_xlat10_6 * u_xlat0.x + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = (-u_xlat6.z) * u_xlat13.x + u_xlat6.x;
    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat2.z;
    u_xlat6.x = u_xlat6.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat0.x = u_xlat6.x + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.xyz = u_xlat2.yyy * hlslcc_mtx4unity_WorldToLight[1].xyw;
    u_xlat6.xyz = hlslcc_mtx4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4unity_WorldToLight[3].xyw;
    u_xlat6.xy = u_xlat6.xy / u_xlat6.zz;
    u_xlatb18 = u_xlat6.z<0.0;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat10_3 = texture(_LightTexture0, u_xlat6.xy, -8.0);
    u_xlat6.x = u_xlat18 * u_xlat10_3.w;
    u_xlat3.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = u_xlat12 * _LightPos.w;
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat18));
    u_xlat6.x = u_xlat6.x * u_xlat10_4.w;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.xyw = u_xlat0.xxx * _LightColor.xyz;
    u_xlat13.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13.x = inversesqrt(u_xlat13.x);
    u_xlat2.xyz = u_xlat13.xxx * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat12) + (-u_xlat2.xyz);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat4.xyz;
    u_xlat10_5 = texture(_CameraGBufferTexture2, u_xlat1.xy);
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_5.xyz = vec3(u_xlat16_12) * u_xlat16_5.xyz;
    u_xlat12 = dot(u_xlat16_5.xyz, u_xlat4.xyz);
    u_xlat13.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat13.y = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat2.x = dot(u_xlat16_5.xyz, (-u_xlat2.xyz));
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat13.xy = max(u_xlat13.xy, vec2(0.0, 0.0));
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_4 = texture(_CameraGBufferTexture0, u_xlat1.xy);
    u_xlat16_5 = (-u_xlat10_3.wxyz) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_1 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_7 = u_xlat16_1 * u_xlat16_1 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_7 + 1.0;
    u_xlat7 = u_xlat12 * 3.14159274;
    u_xlat12 = u_xlat7 * u_xlat12 + 1.00000001e-007;
    u_xlat16_7 = u_xlat16_1 * u_xlat16_1;
    u_xlat12 = u_xlat16_7 / u_xlat12;
    u_xlat16_7 = (-u_xlat16_5.x) * u_xlat16_5.x + 1.0;
    u_xlat8 = u_xlat2.x * u_xlat16_7 + u_xlat16_1;
    u_xlat1.x = u_xlat13.y * u_xlat16_7 + u_xlat16_1;
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat7 = (-u_xlat2.x) + 1.0;
    u_xlat1.x = u_xlat13.y * u_xlat8 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + 9.99999975e-006;
    u_xlat1.x = 2.0 / u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = u_xlat12 * 0.785398185;
    u_xlat1.x = max(u_xlat12, 9.99999975e-005);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlatb2 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12 = (u_xlatb2) ? u_xlat1.x : u_xlat12;
    u_xlat12 = u_xlat13.y * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat1.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlatb1 = u_xlat1.x!=0.0;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat2.xyz = u_xlat0.xyw * vec3(u_xlat12);
    u_xlat12 = (-u_xlat13.x) + 1.0;
    u_xlat1.x = u_xlat13.x * u_xlat13.x;
    u_xlat1.x = dot(u_xlat1.xx, u_xlat16_5.xx);
    u_xlat1.x = u_xlat1.x + -0.5;
    u_xlat13.x = u_xlat12 * u_xlat12;
    u_xlat13.x = u_xlat13.x * u_xlat13.x;
    u_xlat12 = u_xlat12 * u_xlat13.x;
    u_xlat3.xyz = u_xlat16_5.yzw * vec3(u_xlat12) + u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat12 = u_xlat7 * u_xlat7;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat7 * u_xlat12;
    u_xlat12 = u_xlat1.x * u_xlat12 + 1.0;
    u_xlat7 = (-u_xlat13.y) + 1.0;
    u_xlat13.x = u_xlat7 * u_xlat7;
    u_xlat13.x = u_xlat13.x * u_xlat13.x;
    u_xlat7 = u_xlat7 * u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat7 + 1.0;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = u_xlat13.y * u_xlat12;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyw;
    u_xlat0.xyz = u_xlat10_4.xyz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.w = 1.0;
    SV_Target0 = exp2((-u_xlat0));
    return;
}