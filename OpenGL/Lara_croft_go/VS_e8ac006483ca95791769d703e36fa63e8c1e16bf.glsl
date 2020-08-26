#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_modelview0[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_invtrans_modelview0[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4_TerrainEngineBendTree[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4glstate_matrix_modelview0[1].z;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_modelview0[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_modelview0[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + hlslcc_mtx4glstate_matrix_modelview0[3].z;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD1.w = (-u_xlat0.x);
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4glstate_matrix_invtrans_modelview0[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4glstate_matrix_invtrans_modelview0[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4glstate_matrix_invtrans_modelview0[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = (-u_xlat0.xyz);
    return;
}