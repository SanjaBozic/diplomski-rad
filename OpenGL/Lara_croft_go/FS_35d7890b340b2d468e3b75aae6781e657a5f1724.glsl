#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4unity_WorldToCamera[4];
uniform  sampler2D _CameraDepthTexture;
uniform  sampler2D _CameraNormalsTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb3;
float u_xlat4;
void main()
{
    u_xlat10_0 = texture(_CameraNormalsTexture, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_0.yyy * hlslcc_mtx4unity_WorldToCamera[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4unity_WorldToCamera[0].xyz * u_xlat16_0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToCamera[2].xyz * u_xlat16_0.zzz + u_xlat0.xyw;
    u_xlat4 = (-u_xlat0.z) + 1.0;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat1.x = _ZBufferParams.x * u_xlat10_1.x + _ZBufferParams.y;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlatb3 = u_xlat1.x<0.999984622;
    u_xlat1.xz = u_xlat1.xx * vec2(1.0, 255.0);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat0.z = (-u_xlat1.z) * 0.00392156886 + u_xlat1.x;
    u_xlat0.w = u_xlat1.z;
    SV_Target0 = (bool(u_xlatb3)) ? u_xlat0 : vec4(0.5, 0.5, 1.0, 1.0);
    return;
}