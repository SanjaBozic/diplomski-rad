#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout( binding = 0 ) uniform sampler2D g_tColor;
layout(location=0) in vec4 PS_INPUT_gl_vColor;
layout(location=1) in vec2 PS_INPUT_gl_vTexCoord;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
void main()
{
	vec4 H_3rq7ml = texture(g_tColor, PS_INPUT_gl_vTexCoord);
	vec4 H_y7z0f91 = H_3rq7ml * PS_INPUT_gl_vColor;
	PS_OUTPUT_gl_vColor = H_y7z0f91;
}
