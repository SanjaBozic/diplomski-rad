#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_modelview0[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_invtrans_modelview0[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
uniform 	vec4 _Wind;
in  vec4 in_POSITION0;
in  vec4 in_TANGENT0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.x = hlslcc_mtx4unity_ObjectToWorld[0].w;
    u_xlat0.y = hlslcc_mtx4unity_ObjectToWorld[1].w;
    u_xlat0.z = hlslcc_mtx4unity_ObjectToWorld[2].w;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.y = u_xlat0.x + in_COLOR0.x;
    u_xlat10 = u_xlat0.y + in_COLOR0.y;
    u_xlat1.x = dot(in_NORMAL0.xy, hlslcc_mtx4glstate_matrix_invtrans_modelview0[0].xy);
    u_xlat1.y = dot(in_NORMAL0.xy, hlslcc_mtx4glstate_matrix_invtrans_modelview0[1].xy);
    u_xlat1.z = dot(in_NORMAL0.xy, hlslcc_mtx4glstate_matrix_invtrans_modelview0[2].xy);
    u_xlat15 = -abs(in_TANGENT0.w) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat15) + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _TreeInstanceScale.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, vec3(u_xlat10));
    u_xlat2 = u_xlat0.xxyy + _Time.yyyy;
    u_xlat2 = u_xlat2 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = abs(u_xlat2) * abs(u_xlat2);
    u_xlat2 = -abs(u_xlat2) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat0.xy = u_xlat2.yw + u_xlat2.xz;
    u_xlat2.xyz = u_xlat0.yyy * _Wind.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_TEXCOORD1.yyy;
    u_xlat3.y = u_xlat0.y * in_TEXCOORD1.y;
    u_xlat4.w = dot(in_NORMAL0.xyz, hlslcc_mtx4glstate_matrix_invtrans_modelview0[3].xyz);
    u_xlat4.x = dot(in_NORMAL0.xyz, hlslcc_mtx4glstate_matrix_invtrans_modelview0[0].xyz);
    u_xlat4.y = dot(in_NORMAL0.xyz, hlslcc_mtx4glstate_matrix_invtrans_modelview0[1].xyz);
    u_xlat4.z = dot(in_NORMAL0.xyz, hlslcc_mtx4glstate_matrix_invtrans_modelview0[2].xyz);
    u_xlat5 = dot(u_xlat4, u_xlat4);
    u_xlat5 = inversesqrt(u_xlat5);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat5) + (-in_NORMAL0.xyz);
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz + in_NORMAL0.xyz;
    u_xlat5 = in_COLOR0.y * 0.100000001;
    u_xlat3.xz = u_xlat4.xz * vec2(u_xlat5);
    u_xlat0.z = 0.300000012;
    u_xlat0.xyz = u_xlat0.xzx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Wind.www + u_xlat1.xyz;
    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
    u_xlat15 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat15 = u_xlat15 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat15)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4glstate_matrix_invtrans_modelview0[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4glstate_matrix_invtrans_modelview0[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4glstate_matrix_invtrans_modelview0[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat5 = u_xlat0.y * hlslcc_mtx4glstate_matrix_modelview0[1].z;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_modelview0[0].z * u_xlat0.x + u_xlat5;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_modelview0[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + hlslcc_mtx4glstate_matrix_modelview0[3].z;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
    vs_TEXCOORD1.w = (-u_xlat0.x);
    return;
}