#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
in  vec4 in_COLOR0;
out vec4 vs_COLOR0;
void main()
{
    gl_Position = vec4(100000.0, 100000.0, 100000.0, 100000.0);
    vs_COLOR0.x = 100000.0;
    vs_COLOR0.yzw = in_COLOR0.yzw;
    return;
}