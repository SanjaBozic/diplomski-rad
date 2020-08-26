//ATTRIBMAP-00-90-50-xx
#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout(std140, binding = 12 ) uniform _Globals_ {
	vec4 g_vViewport;
} ;
layout(location=0) in vec2 VS_INPUT_gl_vPositionSs;
layout(location=1) in vec4 VS_INPUT_gl_vColor;
layout(location=2) in vec2 VS_INPUT_gl_vTexCoord;
out gl_PerVertex {
	vec4 gl_Position;
	float gl_ClipDistance[1];
} ;
layout(location=0) out vec4 PS_INPUT_gl_vColor;
layout(location=1) out vec2 PS_INPUT_gl_vTexCoord;
const float C_0d0 = 0.0;
const vec2 C_vec2p2d0p = vec2(2.0);
const vec2 C_vec2pa1d0p = vec2(-1.0);
const float C_a1d0 = -1.0;
const vec3 C_vec3p12d92p = vec3(12.92);
const vec3 C_vec3p1d055p = vec3(1.055);
const vec3 C_bw96as = vec3(0.0521327);
const vec3 C_vec3p2d4p = vec3(2.4);
const float C_0d04045 = 0.04045;
const float C_1d0 = 1.0;
void main()
{
	gl_ClipDistance[0] = C_0d0;
	vec2 H_hmtr7w = VS_INPUT_gl_vPositionSs - g_vViewport.xy;
	vec2 H_xr2tm2 = H_hmtr7w * C_vec2p2d0p;
	vec2 H_xiwigq = H_xr2tm2 / g_vViewport.zw;
	vec2 H_6bb9ai = H_xiwigq + C_vec2pa1d0p;
	float H_sscqba = H_6bb9ai.y * C_a1d0;
	vec3 vLinearSegment = VS_INPUT_gl_vColor.xyz / C_vec3p12d92p;
	vec3 H_3fa77x1 = VS_INPUT_gl_vColor.xyz / C_vec3p1d055p;
	vec3 H_avlvsp1 = H_3fa77x1 + C_bw96as;
	vec3 vExpSegment = pow(H_avlvsp1, C_vec3p2d4p);
	bool H_qjlc451 = VS_INPUT_gl_vColor.x > C_0d04045;
	float select = H_qjlc451 ? vExpSegment.x : vLinearSegment.x;
	bool H_1ocnu01 = VS_INPUT_gl_vColor.y > C_0d04045;
	float select1 = H_1ocnu01 ? vExpSegment.y : vLinearSegment.y;
	bool H_8draww1 = VS_INPUT_gl_vColor.z > C_0d04045;
	float select2 = H_8draww1 ? vExpSegment.z : vLinearSegment.z;
	vec4 H_6t7a2k1 = vec4(select, select1, select2, VS_INPUT_gl_vColor.w);
	PS_INPUT_gl_vColor = H_6t7a2k1;
	PS_INPUT_gl_vTexCoord = VS_INPUT_gl_vTexCoord;
	float H_g44nu6 = C_0d0 - H_sscqba;
	vec4 H_bi2a32 = vec4(H_6bb9ai.x, H_g44nu6, C_1d0, C_1d0);
	gl_Position = H_bi2a32;
}