#version 410 core
// LunarGOO output
#extension GL_ARB_gpu_shader5 : enable
#extension GL_ARB_shading_language_420pack : enable
#extension GL_ARB_tessellation_shader : enable
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
layout(location=0) in vec4 PS_INPUT_gl_vTexcoordgradientcoord;
layout(location=1) in vec4 PS_INPUT_gl_vOutercornercoord0;
layout(location=2) in vec4 PS_INPUT_gl_vOutercornercoord1;
layout(location=3) in vec4 PS_INPUT_gl_vColor0;
layout(location=4) in vec4 PS_INPUT_gl_vColor1;
layout(location=5) in vec4 PS_INPUT_gl_vInnercornercoord0;
layout(location=6) in vec4 PS_INPUT_gl_vInnercornercoord1;
layout(location=7) in vec4 PS_INPUT_gl_vOpacitytexcoord;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const vec4 C_vec4p0d0p = vec4(0.0);
const vec4 C_vec4p1ea06p = vec4(1e-06);
const vec4 C_vec4p1d0p = vec4(1.0);
const float C_0d0 = 0.0;
const float C_1d0 = 1.0;
void main()
{
	vec4 innercorners = max(PS_INPUT_gl_vInnercornercoord0, C_vec4p0d0p);
	vec4 innercorners1 = max(PS_INPUT_gl_vInnercornercoord1, C_vec4p0d0p);
	float innercornerslength = length(innercorners.xy);
	float innercornerslength1 = length(innercorners.zw);
	float innercornerslength2 = length(innercorners1.xy);
	float innercornerslength3 = length(innercorners1.zw);
	vec4 H_e3sm9r1 = vec4(innercornerslength, innercornerslength1, innercornerslength2, innercornerslength3);
	vec4 innercornerslength4 = max(H_e3sm9r1, C_vec4p1ea06p);
	vec4 innercornerslengthmax = min(innercornerslength4, C_vec4p1d0p);
	vec4 innercornersscale = innercornerslengthmax / innercornerslength4;
	vec4 innercorners0nearest = innercorners * innercornersscale.xxyy;
	vec4 innercorners1nearest = innercorners1 * innercornersscale.zzww;
	vec4 H_4vo1mm = innercorners - innercorners0nearest;
	vec4 innercorners0screen = H_4vo1mm * g_vInnercornerradii0;
	vec4 H_a62ckf = innercorners1 - innercorners1nearest;
	vec4 innercorners1screen = H_a62ckf * g_vInnercornerradii1;
	float innercornerdists = length(innercorners0screen.xy);
	float innercornerdists1 = length(innercorners0screen.zw);
	float innercornerdists2 = length(innercorners1screen.xy);
	float innercornerdists3 = length(innercorners1screen.zw);
	vec4 H_ylihd91 = vec4(innercornerdists, innercornerdists1, innercornerdists2, innercornerdists3);
	vec4 innercorneropacities = clamp(H_ylihd91, C_0d0, C_1d0);
	vec4 innercorneropacities1 = C_vec4p1d0p - innercorneropacities;
	float H_2qax5l1 = innercorneropacities1.x * innercorneropacities1.y;
	float H_fomdrg = H_2qax5l1 * innercorneropacities1.z;
	float H_dg807y1 = H_fomdrg * innercorneropacities1.w;
	float innercorneropacity = C_1d0 - H_dg807y1;
	vec4 vTexCol = mix(PS_INPUT_gl_vColor0, g_vBordercolor, innercorneropacity);
	PS_OUTPUT_gl_vColor = vTexCol;
}
