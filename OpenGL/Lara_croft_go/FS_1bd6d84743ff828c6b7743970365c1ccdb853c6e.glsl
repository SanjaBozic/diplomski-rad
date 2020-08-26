#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _CameraReflectionsTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy);
    SV_Target0.xyz = exp2((-u_xlat10_0.xyz));
    SV_Target0.w = 0.0;
    return;
}