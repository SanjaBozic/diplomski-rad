#version 410 core
// LunarGOO output
#extension GL_ARB_gpu_shader5 : enable
#extension GL_ARB_shading_language_420pack : enable
#extension GL_ARB_tessellation_shader : enable
layout(binding=3) uniform sampler2D g_tTexture3;
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
 uniform sampler2D g_tTexture0;
layout(location=0) in vec4 PS_INPUT_gl_vTexcoordgradientcoord;
layout(location=1) in vec4 PS_INPUT_gl_vOutercornercoord0;
layout(location=2) in vec4 PS_INPUT_gl_vOutercornercoord1;
layout(location=3) in vec4 PS_INPUT_gl_vColor0;
layout(location=4) in vec4 PS_INPUT_gl_vColor1;
layout(location=5) in vec4 PS_INPUT_gl_vInnercornercoord0;
layout(location=6) in vec4 PS_INPUT_gl_vInnercornercoord1;
layout(location=7) in vec4 PS_INPUT_gl_vOpacitytexcoord;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const float C_0d0 = 0.0;
const float C_1d0 = 1.0;
const float C_0d999023 = 0.999023;
const float C_0d000488281 = 0.000488281;
void main()
{
	float gradientCoord = clamp(PS_INPUT_gl_vTexcoordgradientcoord.z, C_0d0, C_1d0);
	float H_m1jgfl1 = gradientCoord * C_0d999023;
	float gradientCoord1 = H_m1jgfl1 + C_0d000488281;
	vec2 H_iy052a = vec2(gradientCoord1, C_0d0);
	vec4 vTexCol = texture(g_tTexture3, H_iy052a);
	PS_OUTPUT_gl_vColor = vTexCol;
}
