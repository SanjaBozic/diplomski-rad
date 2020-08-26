#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4unity_CameraToWorld[4];
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform  sampler2D _CameraDepthTexture;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D _CameraGBufferTexture0;
uniform  sampler2D _CameraGBufferTexture1;
uniform  sampler2D _CameraGBufferTexture2;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
float u_xlat12;
float u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
bool u_xlatb19;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_2 = texture(_CameraDepthTexture, u_xlat1.xy);
    u_xlat18 = _ZBufferParams.x * u_xlat10_2.x + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = inversesqrt(u_xlat18);
    u_xlat18 = u_xlat18 * _LightPos.w;
    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat18));
    u_xlat3.xyz = u_xlat10_3.www * _LightColor.xyz;
    u_xlat4.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
    u_xlat10_5 = texture(_CameraGBufferTexture2, u_xlat1.xy);
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_5.xyz = vec3(u_xlat16_18) * u_xlat16_5.xyz;
    u_xlat0.w = dot(u_xlat16_5.xyz, u_xlat4.xyz);
    u_xlat13 = dot((-u_xlat0.xyz), u_xlat4.xyz);
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat0.xyz));
    u_xlat0.y = dot(u_xlat16_5.xyz, (-u_xlat2.xyz));
    u_xlat0.z = max(u_xlat13, 0.0);
    u_xlat0.xyw = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat18 = u_xlat0.w * u_xlat0.w;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1 = texture(_CameraGBufferTexture0, u_xlat1.xy);
    u_xlat16_4 = (-u_xlat10_2.wxyz) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_19 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_20 = u_xlat16_19 * u_xlat16_19 + -1.0;
    u_xlat18 = u_xlat18 * u_xlat16_20 + 1.0;
    u_xlat20 = u_xlat18 * 3.14159274;
    u_xlat18 = u_xlat20 * u_xlat18 + 1.00000001e-007;
    u_xlat16_20 = u_xlat16_19 * u_xlat16_19;
    u_xlat18 = u_xlat16_20 / u_xlat18;
    u_xlat16_20 = (-u_xlat16_4.x) * u_xlat16_4.x + 1.0;
    u_xlat21 = u_xlat0.y * u_xlat16_20 + u_xlat16_19;
    u_xlat19 = u_xlat0.x * u_xlat16_20 + u_xlat16_19;
    u_xlat19 = u_xlat0.y * u_xlat19;
    u_xlat19 = u_xlat0.x * u_xlat21 + u_xlat19;
    u_xlat19 = u_xlat19 + 9.99999975e-006;
    u_xlat19 = 2.0 / u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat19 = max(u_xlat18, 9.99999975e-005);
    u_xlat19 = sqrt(u_xlat19);
    u_xlatb20 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb20) ? u_xlat19 : u_xlat18;
    u_xlat18 = u_xlat0.x * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat19 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
    u_xlatb19 = u_xlat19!=0.0;
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat5.xyz = u_xlat3.xyz * vec3(u_xlat18);
    u_xlat6.xz = (-u_xlat0.yz) + vec2(1.0, 1.0);
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat12 = dot(vec2(u_xlat12), u_xlat16_4.xx);
    u_xlat12 = u_xlat12 + -0.5;
    u_xlat19 = u_xlat6.z * u_xlat6.z;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat6.z * u_xlat19;
    u_xlat2.xyz = u_xlat16_4.yzw * vec3(u_xlat18) + u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat18 = u_xlat6.x * u_xlat6.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat6.x = u_xlat6.x * u_xlat18;
    u_xlat6.x = u_xlat12 * u_xlat6.x + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat19 = u_xlat18 * u_xlat18;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat12 = u_xlat12 * u_xlat18 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}