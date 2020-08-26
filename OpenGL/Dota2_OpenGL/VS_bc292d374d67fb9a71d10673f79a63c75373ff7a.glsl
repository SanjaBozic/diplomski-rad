//ATTRIBMAP-00-50-51-xx
#version 410 core
// LunarGOO output
#extension GL_ARB_gpu_shader5 : enable
#extension GL_ARB_shading_language_420pack : enable
#extension GL_ARB_tessellation_shader : enable
layout(location=0) in vec4 VS_INPUT_gl_vPositionSs;
layout(location=1) in vec4 VS_INPUT_gl_vTex;
layout(location=2) in vec4 VS_INPUT_gl_vColor;
out gl_PerVertex {
	vec4 gl_Position;
	float gl_ClipDistance[1];
} ;
layout(location=0) out vec4 PS_INPUT_gl_vTex;
layout(location=1) out vec4 PS_INPUT_gl_vColor;
const float C_0d0 = 0.0;
void main()
{
	gl_ClipDistance[0] = C_0d0;
	PS_INPUT_gl_vTex = VS_INPUT_gl_vTex;
	PS_INPUT_gl_vColor = VS_INPUT_gl_vColor;
	float H_9tbkhr1 = C_0d0 - VS_INPUT_gl_vPositionSs.y;
	float H_n3wpln1 = C_0d0 - VS_INPUT_gl_vPositionSs.w;
	vec4 H_pxw3zx = VS_INPUT_gl_vPositionSs;
	H_pxw3zx.yz = vec2(H_9tbkhr1, H_n3wpln1);
	gl_Position = H_pxw3zx;
}
