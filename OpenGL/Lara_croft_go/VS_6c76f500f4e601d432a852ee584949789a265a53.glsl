#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Color;
uniform 	float _Vertex;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_COLOR0;
out float vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.xyz = in_COLOR0.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_Vertex) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    vs_COLOR0.xyz = u_xlat0.xyz * _Color.xyz;
    vs_COLOR0.w = 1.0;
    return;
}