#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_modelview0[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4unity_GUIClipTextureMatrix[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec2 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4glstate_matrix_modelview0[1].xy;
    u_xlat0.xy = hlslcc_mtx4glstate_matrix_modelview0[0].xy * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4glstate_matrix_modelview0[2].xy * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4glstate_matrix_modelview0[3].xy;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat1.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}