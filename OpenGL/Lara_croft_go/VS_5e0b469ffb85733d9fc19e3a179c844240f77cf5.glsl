#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
in  vec3 in_NORMAL0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xyz = u_xlat1.xxx * hlslcc_mtx4unity_CameraInvProjection[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat1.xyz + (-hlslcc_mtx4unity_CameraInvProjection[2].xyz);
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_CameraInvProjection[2].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_CameraInvProjection[3].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4unity_CameraInvProjection[3].xyz;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD2.xyz = u_xlat0.xyw;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD3.xyz = u_xlat1.xyw;
    return;
}