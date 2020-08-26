#version 410 core
// LunarGOO output
#extension GL_ARB_gpu_shader5 : enable
#extension GL_ARB_shading_language_420pack : enable
#extension GL_ARB_tessellation_shader : enable
layout(location=0) in vec4 PS_INPUT_gl_vTex;
layout(location=1) in vec4 PS_INPUT_gl_vColor;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
void main()
{
	PS_OUTPUT_gl_vColor = PS_INPUT_gl_vColor;
}
