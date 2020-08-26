#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_StereoMatrixVP[8];
uniform 	int unity_StereoEyeIndex;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4unity_ObjectToWorld[3];
    u_xlati1 = unity_StereoEyeIndex << 2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4unity_StereoMatrixVP[u_xlati1 + 1];
    u_xlat2 = hlslcc_mtx4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4unity_StereoMatrixVP[u_xlati1 + 2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4unity_StereoMatrixVP[u_xlati1 + 3] * u_xlat0.wwww + u_xlat2;
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}