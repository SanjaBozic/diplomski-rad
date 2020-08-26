#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	float _Level;
uniform  samplerCube _MainTex;
in  vec4 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = textureLod(_MainTex, vs_TEXCOORD0.xyz, _Level);
    return;
}