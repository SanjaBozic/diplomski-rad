#version 410 core
// LunarGOO output
#extension GL_ARB_gpu_shader5 : enable
#extension GL_ARB_shading_language_420pack : enable
#extension GL_ARB_tessellation_shader : enable
layout(binding=0) uniform sampler2D g_tTexture0;
layout(location=0) in vec4 PS_INPUT_gl_vTex;
layout(location=1) in vec4 PS_INPUT_gl_vColor;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const float C_31d875 = 31.875;
const float C_1d0 = 1.0;
const float C_a0d501961 = -0.501961;
const vec3 C_vec3p12d92p = vec3(12.92);
const vec3 C_vec3p1d055p = vec3(1.055);
const vec3 C_bw96as = vec3(0.0521327);
const vec3 C_vec3p2d4p = vec3(2.4);
const float C_0d04045 = 0.04045;
const vec4 C_xx1m2m1 = vec4(0.0, 0.0, 0.0, 1.0);
void main()
{
	vec4 vYCoCg = texture(g_tTexture0, PS_INPUT_gl_vTex.xy);
	float H_ovhksf = vYCoCg.z * C_31d875;
	float flCoCgScale = H_ovhksf + C_1d0;
	float H_4fr0m = vYCoCg.x + C_a0d501961;
	float flCo = H_4fr0m / flCoCgScale;
	float H_bo9r5f = C_a0d501961 + vYCoCg.y;
	float flCg = H_bo9r5f / flCoCgScale;
	float H_i4000r1 = flCo + vYCoCg.w;
	float H_nvkr8v = H_i4000r1 - flCg;
	float H_yqrucl1 = flCg + vYCoCg.w;
	float H_snfwmh = vYCoCg.w - flCo;
	float H_s2rhjm1 = H_snfwmh - flCg;
	vec3 H_h4w9j2 = vec3(H_nvkr8v, H_yqrucl1, H_s2rhjm1);
	vec3 vLinearSegment = H_h4w9j2 / C_vec3p12d92p;
	vec3 H_5z67ut1 = H_h4w9j2 / C_vec3p1d055p;
	vec3 H_d2pl4d = H_5z67ut1 + C_bw96as;
	vec3 vExpSegment = pow(H_d2pl4d, C_vec3p2d4p);
	bool H_8is4cu1 = H_nvkr8v > C_0d04045;
	float select = H_8is4cu1 ? vExpSegment.x : vLinearSegment.x;
	bool H_09rk0j = H_yqrucl1 > C_0d04045;
	float select1 = H_09rk0j ? vExpSegment.y : vLinearSegment.y;
	bool H_aa23r2 = H_s2rhjm1 > C_0d04045;
	float select2 = H_aa23r2 ? vExpSegment.z : vLinearSegment.z;
	vec4 H_rwwpo7 = C_xx1m2m1;
	H_rwwpo7.xyz = vec3(select, select1, select2);
	vec4 H_c5bt741 = H_rwwpo7 * PS_INPUT_gl_vColor;
	PS_OUTPUT_gl_vColor = H_c5bt741;
}
