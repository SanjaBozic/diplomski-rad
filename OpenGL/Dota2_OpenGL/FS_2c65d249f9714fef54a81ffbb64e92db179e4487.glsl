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
const float C_1ea06 = 1e-06;
const float C_1d0 = 1.0;
void main()
{
	vec4 vTexCol = texture(g_tTexture0, PS_INPUT_gl_vTexcoordgradientcoord.xy);
	vec4 vTexCol1 = PS_INPUT_gl_vColor0 * vTexCol;
	vec4 outercorners = max(PS_INPUT_gl_vOutercornercoord0, C_vec4p0d0p);
	vec4 outercorners1 = max(PS_INPUT_gl_vOutercornercoord1, C_vec4p0d0p);
	float outercornerslength = length(outercorners.xy);
	float outercornerslength1 = length(outercorners.zw);
	float outercornerslength2 = length(outercorners1.xy);
	float outercornerslength3 = length(outercorners1.zw);
	vec4 H_soghho = vec4(outercornerslength, outercornerslength1, outercornerslength2, outercornerslength3);
	vec4 outercornerslength4 = max(H_soghho, C_vec4p1ea06p);
	vec4 outercornerslengthmin = min(outercornerslength4, C_vec4p1d0p);
	vec4 outercornersscale = outercornerslengthmin / outercornerslength4;
	vec4 outercorners0nearest = outercorners * outercornersscale.xxyy;
	vec4 outercorners1nearest = outercorners1 * outercornersscale.zzww;
	vec4 H_m1519a = outercorners - outercorners0nearest;
	vec4 outercorners0screen = H_m1519a * g_vOutercornerradii0;
	vec4 H_a949c6 = outercorners1 - outercorners1nearest;
	vec4 outercorners1screen = H_a949c6 * g_vOutercornerradii1;
	float outercornerdists = length(outercorners0screen.xy);
	float outercornerdists1 = length(outercorners0screen.zw);
	float outercornerdists2 = length(outercorners1screen.xy);
	float outercornerdists3 = length(outercorners1screen.zw);
	vec4 H_gl8ppb = vec4(outercornerdists, outercornerdists1, outercornerdists2, outercornerdists3);
	vec4 outercorneropacities = clamp(H_gl8ppb, C_1ea06, C_1d0);
	vec4 outercorneropacities1 = C_vec4p1d0p - outercorneropacities;
	float H_em47b7 = outercorneropacities1.x * outercorneropacities1.y;
	float H_8yqzei1 = H_em47b7 * outercorneropacities1.z;
	float outercorneropacity = H_8yqzei1 * outercorneropacities1.w;
	vec4 H_dwiubm = vec4(outercorneropacity);
	vec4 vTexCol2 = H_dwiubm * vTexCol1;
	PS_OUTPUT_gl_vColor = vTexCol2;
}
