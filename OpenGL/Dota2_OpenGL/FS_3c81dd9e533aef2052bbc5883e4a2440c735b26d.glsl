#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout( binding = 0 ) uniform sampler2D g_tMapTexture;
layout( binding = 1 ) uniform sampler2D g_tFowTexture;
layout(location=0) in vec4 PS_INPUT_gl_vColor;
layout(location=1) in vec2 PS_INPUT_gl_vTexCoord;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const float C_0d6 = 0.6;
const float C_0d1 = 0.1;
const float C_0d5 = 0.5;
const vec4 C_q7dfgo = vec4(0.7, 0.7, 0.0, 0.0);
void main()
{
	vec4 vMapColor = texture(g_tMapTexture, PS_INPUT_gl_vTexCoord);
	vec4 vFoWColor = texture(g_tFowTexture, PS_INPUT_gl_vTexCoord);
	float H_f5ii6k1 = vFoWColor.w * vMapColor.w;
	vec4 H_p7k0lw = vec4(PS_INPUT_gl_vColor.x, PS_INPUT_gl_vColor.y, PS_INPUT_gl_vColor.z, H_f5ii6k1);
	bool H_drwyws = vFoWColor.w < C_0d6;
	bool H_1xezgk1 = vFoWColor.x < C_0d1;
	bool H_8vj5sq1 = H_drwyws && H_1xezgk1;
	float H_oucgk6 = vMapColor.w * C_0d5;
	vec4 H_vjee1b = C_q7dfgo;
	H_vjee1b.w = H_oucgk6;
	vec4 select = H_8vj5sq1 ? H_vjee1b : H_p7k0lw;
	PS_OUTPUT_gl_vColor = select;
}