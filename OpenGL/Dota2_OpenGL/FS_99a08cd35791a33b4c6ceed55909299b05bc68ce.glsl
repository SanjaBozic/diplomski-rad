#version 410 core
// LunarGOO output
#extension GL_ARB_gpu_shader5 : enable
#extension GL_ARB_shading_language_420pack : enable
#extension GL_ARB_tessellation_shader : enable
layout(binding=0) uniform sampler2D g_tTexture0;
 uniform FancyQuadCoreConstants_t {
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
layout(location=0) in vec4 PS_INPUT_gl_vTexcoordgradientcoord;
layout(location=1) in vec4 PS_INPUT_gl_vOutercornercoord0;
layout(location=2) in vec4 PS_INPUT_gl_vOutercornercoord1;
layout(location=3) in vec4 PS_INPUT_gl_vColor0;
layout(location=4) in vec4 PS_INPUT_gl_vColor1;
layout(location=5) in vec4 PS_INPUT_gl_vInnercornercoord0;
layout(location=6) in vec4 PS_INPUT_gl_vInnercornercoord1;
layout(location=7) in vec4 PS_INPUT_gl_vOpacitytexcoord;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
void main()
{
	vec4 vTexCol = texture(g_tTexture0, PS_INPUT_gl_vTexcoordgradientcoord.xy);
	vec4 vTexCol1 = PS_INPUT_gl_vColor0 * vTexCol;
	PS_OUTPUT_gl_vColor = vTexCol1;
}
