#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}