#version 410 core
// LunarGOO output
#extension GL_ARB_gpu_shader5 : enable
#extension GL_ARB_shading_language_420pack : enable
#extension GL_ARB_tessellation_shader : enable
layout(binding=0) uniform sampler2D g_tTexture0;
layout(std140, binding=0) uniform FancyQuadCoreConstants_t {
	vec4 g_vOutercornerradii0;
	vec4 g_vOutercornerradii1;
	vec4 g_vInnercornerradii0;
	vec4 g_vInnercornerradii1;
	vec4 g_vBordercolor;
	float g_flHueShift;
	float g_flSaturation;
	float g_flBrightness;
	float g_flContrast;
	vec2 g_vGradientradialoffset;
	float g_flOpacityMaskOpacity;
} ;
layout(binding=1) uniform sampler2D g_tTexture1;
layout(location=0) in vec4 PS_INPUT_gl_vTexcoordgradientcoord;
layout(location=1) in vec4 PS_INPUT_gl_vOutercornercoord0;
layout(location=2) in vec4 PS_INPUT_gl_vOutercornercoord1;
layout(location=3) in vec4 PS_INPUT_gl_vColor0;
layout(location=4) in vec4 PS_INPUT_gl_vColor1;
layout(location=5) in vec4 PS_INPUT_gl_vInnercornercoord0;
layout(location=6) in vec4 PS_INPUT_gl_vInnercornercoord1;
layout(location=7) in vec4 PS_INPUT_gl_vOpacitytexcoord;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const float C_1d0 = 1.0;
void main()
{
	vec4 vTexCol = texture(g_tTexture0, PS_INPUT_gl_vTexcoordgradientcoord.xy);
	vec4 vTexCol1 = PS_INPUT_gl_vColor0 * vTexCol;
	vec4 H_ac57mo = vec4(g_flOpacityMaskOpacity);
	float H_1c259m = C_1d0 - g_flOpacityMaskOpacity;
	vec4 H_ib5cz81 = vec4(H_1c259m);
	vec4 H_g6fd1k1 = H_ib5cz81 * vTexCol1;
	vec4 vTexCol2 = texture(g_tTexture1, PS_INPUT_gl_vOpacitytexcoord.xy);
	vec4 H_6jsz1n = vTexCol1 * vTexCol2.wwww;
	vec4 H_57jup11 = H_6jsz1n * H_ac57mo;
	vec4 vTexCol3 = H_57jup11 + H_g6fd1k1;
	PS_OUTPUT_gl_vColor = vTexCol3;
}