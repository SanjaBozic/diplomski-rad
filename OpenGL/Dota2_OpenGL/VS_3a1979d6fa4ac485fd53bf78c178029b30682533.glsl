//ATTRIBMAP-00-90-50-xx
#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout(location=0) in vec3 VS_INPUT_gl_vPositionSs;
layout(location=1) in vec4 VS_INPUT_gl_vColor;
layout(location=2) in vec2 VS_INPUT_gl_vTexCoord;
out gl_PerVertex {
	vec4 gl_Position;
	float gl_ClipDistance[1];
} ;
layout(location=0) out vec4 PS_INPUT_gl_vColor;
layout(location=1) out vec2 PS_INPUT_gl_vTexCoord;
const float C_0d0 = 0.0;
const float C_a1d0 = -1.0;
const float C_1d0 = 1.0;
void main()
{
	gl_ClipDistance[0] = C_0d0;
	float H_eu8hhf = VS_INPUT_gl_vPositionSs.y * C_a1d0;
	PS_INPUT_gl_vColor = VS_INPUT_gl_vColor;
	PS_INPUT_gl_vTexCoord = VS_INPUT_gl_vTexCoord;
	float H_3f8abv = C_0d0 - H_eu8hhf;
	vec4 H_pyb177 = vec4(VS_INPUT_gl_vPositionSs.x, H_3f8abv, C_1d0, C_1d0);
	gl_Position = H_pyb177;
}
