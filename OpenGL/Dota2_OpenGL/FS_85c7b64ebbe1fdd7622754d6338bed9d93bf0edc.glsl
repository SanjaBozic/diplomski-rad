#version 410 core
// LunarGOO output
#extension GL_ARB_gpu_shader5 : enable
#extension GL_ARB_shading_language_420pack : enable
#extension GL_ARB_tessellation_shader : enable
layout(std140, binding=0) uniform FastBlurFilterParams_t {
	float g_flCenterWeight;
	vec4 g_vSample1;
	vec4 g_vSample2;
	vec4 g_vSample3;
	vec4 g_vSample4;
	vec4 g_vSample5;
	vec4 g_vSample6;
	vec4 g_vSample7;
	vec4 g_vSample8;
} ;
layout(binding=0) uniform sampler2D g_tTexture0;
layout(location=0) in vec4 PS_INPUT_gl_vTex;
layout(location=1) in vec4 PS_INPUT_gl_vColor;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
void main()
{
	vec4 H_zjfgb81 = vec4(g_flCenterWeight);
	vec4 vColor = texture(g_tTexture0, PS_INPUT_gl_vTex.xy);
	vec4 vColor1 = H_zjfgb81 * vColor;
	vec2 vOffset = PS_INPUT_gl_vTex.zw * g_vSample1.xy;
	vec2 H_kb5w06 = PS_INPUT_gl_vTex.xy + vOffset;
	vec4 vColor2 = texture(g_tTexture0, H_kb5w06);
	vec4 H_97s4g7 = g_vSample1.zzzz * vColor2;
	vec4 vColor3 = H_97s4g7 + vColor1;
	vec2 H_iewf8i = PS_INPUT_gl_vTex.xy - vOffset;
	vec4 vColor4 = texture(g_tTexture0, H_iewf8i);
	vec4 H_f167s5 = g_vSample1.zzzz * vColor4;
	vec4 vColor5 = H_f167s5 + vColor3;
	vec2 vOffset1 = PS_INPUT_gl_vTex.zw * g_vSample2.xy;
	vec2 H_3gxuhu1 = PS_INPUT_gl_vTex.xy + vOffset1;
	vec4 vColor6 = texture(g_tTexture0, H_3gxuhu1);
	vec4 H_y6wour = g_vSample2.zzzz * vColor6;
	vec4 vColor7 = H_y6wour + vColor5;
	vec2 H_p6jgxu = PS_INPUT_gl_vTex.xy - vOffset1;
	vec4 vColor8 = texture(g_tTexture0, H_p6jgxu);
	vec4 H_chguyn = g_vSample2.zzzz * vColor8;
	vec4 vColor9 = H_chguyn + vColor7;
	vec2 vOffset2 = PS_INPUT_gl_vTex.zw * g_vSample3.xy;
	vec2 H_25juru1 = PS_INPUT_gl_vTex.xy + vOffset2;
	vec4 vColora = texture(g_tTexture0, H_25juru1);
	vec4 H_yqfj9w1 = g_vSample3.zzzz * vColora;
	vec4 vColorb = H_yqfj9w1 + vColor9;
	vec2 H_s3qh3u = PS_INPUT_gl_vTex.xy - vOffset2;
	vec4 vColorc = texture(g_tTexture0, H_s3qh3u);
	vec4 H_0d8kpv1 = g_vSample3.zzzz * vColorc;
	vec4 vColord = H_0d8kpv1 + vColorb;
	vec2 vOffset3 = PS_INPUT_gl_vTex.zw * g_vSample4.xy;
	vec2 H_1u4u1v1 = PS_INPUT_gl_vTex.xy + vOffset3;
	vec4 vColore = texture(g_tTexture0, H_1u4u1v1);
	vec4 H_dexdm91 = g_vSample4.zzzz * vColore;
	vec4 vColorf = H_dexdm91 + vColord;
	vec2 H_rsbhdu = PS_INPUT_gl_vTex.xy - vOffset3;
	vec4 vColorg = texture(g_tTexture0, H_rsbhdu);
	vec4 H_f0qe291 = g_vSample4.zzzz * vColorg;
	vec4 vColorh = H_f0qe291 + vColorf;
	PS_OUTPUT_gl_vColor = vColorh;
}
