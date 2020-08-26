#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4_PreviousVP[4];
uniform 	vec4 hlslcc_mtx4_PreviousM[4];
uniform 	int _HasLastPositionData;
uniform 	float _MotionVectorDepthBias;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4_NonJitteredVP[1];
    u_xlat1 = hlslcc_mtx4_NonJitteredVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4_NonJitteredVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0 = hlslcc_mtx4_NonJitteredVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = in_NORMAL0.xyz;
    u_xlat0.w = 1.0;
    u_xlat0 = (_HasLastPositionData != 0) ? u_xlat0 : in_POSITION0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4_PreviousM[1];
    u_xlat1 = hlslcc_mtx4_PreviousM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4_PreviousM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4_PreviousM[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4_PreviousVP[1];
    u_xlat1 = hlslcc_mtx4_PreviousVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4_PreviousVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1 = hlslcc_mtx4_PreviousVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    gl_Position.z = _MotionVectorDepthBias * u_xlat0.w + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}