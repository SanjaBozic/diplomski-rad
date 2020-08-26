#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _LightBuffer;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_LightBuffer, vs_TEXCOORD0.xy);
    u_xlat16_0 = log2(u_xlat10_0);
    SV_Target0 = (-u_xlat16_0);
    return;
}