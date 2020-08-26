#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_modelview0[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.w = u_xlat0.w;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4glstate_matrix_modelview0[1].z;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_modelview0[0].z * in_POSITION0.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_modelview0[2].z * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + hlslcc_mtx4glstate_matrix_modelview0[3].z;
    vs_TEXCOORD2.z = (-u_xlat0.x);
    return;
}