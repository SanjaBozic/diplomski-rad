#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _Color;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = _Color;
    return;
}