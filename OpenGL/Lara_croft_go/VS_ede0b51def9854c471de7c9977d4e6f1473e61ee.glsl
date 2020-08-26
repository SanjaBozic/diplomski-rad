#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4_PointLightMatrixC0[4];
uniform 	vec4 hlslcc_mtx4_PointLightMatrixC1[4];
uniform 	vec4 hlslcc_mtx4_ShadowMapMat[4];
uniform 	vec4 hlslcc_mtx4_ShadowMapMV[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4_PointLightMatrixC0[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4_PointLightMatrixC0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4_PointLightMatrixC0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4_PointLightMatrixC0[3].xyz * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4_PointLightMatrixC1[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4_PointLightMatrixC1[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4_PointLightMatrixC1[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4_PointLightMatrixC1[3].xyz * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.x = u_xlat0.y * hlslcc_mtx4_ShadowMapMV[1].z;
    u_xlat1.x = hlslcc_mtx4_ShadowMapMV[0].z * u_xlat0.x + u_xlat1.x;
    u_xlat1.x = hlslcc_mtx4_ShadowMapMV[2].z * u_xlat0.z + u_xlat1.x;
    u_xlat1.x = hlslcc_mtx4_ShadowMapMV[3].z * u_xlat0.w + u_xlat1.x;
    vs_TEXCOORD5.z = (-u_xlat1.x);
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4_ShadowMapMat[1].xy;
    u_xlat0.xy = hlslcc_mtx4_ShadowMapMat[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4_ShadowMapMat[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD5.xy = hlslcc_mtx4_ShadowMapMat[3].xy * u_xlat0.ww + u_xlat0.xy;
    return;
}