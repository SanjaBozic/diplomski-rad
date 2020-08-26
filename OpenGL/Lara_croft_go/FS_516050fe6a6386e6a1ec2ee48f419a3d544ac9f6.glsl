#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
uniform  sampler2D _GUIClipTexture;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    u_xlat10_0 = texture(_GUIClipTexture, vs_TEXCOORD1.xy);
    SV_Target0.w = u_xlat10_0.w * vs_COLOR0.w;
    return;
}