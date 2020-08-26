#version 150
in vec4 pos;
in vec4 color;
out vec4 out_color;

void main()
{
    gl_Position = pos;
    out_color = color;
}
