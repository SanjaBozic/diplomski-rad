#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _World2ReceiverRow1;
uniform 	vec4 _LightDirection;
uniform 	vec3 _MinClamp;
uniform 	vec3 _MaxClamp;
in  vec4 in_POSITION0;
out float vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat4;
bool u_xlatb4;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = min(u_xlat0.xyz, _MaxClamp.xyz);
    u_xlat0.xyz = max(u_xlat1.xyz, _MinClamp.xyz);
    u_xlat1.x = dot(_World2ReceiverRow1, u_xlat0);
    u_xlat4 = dot(_LightDirection, _LightDirection);
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat2 = vec4(u_xlat4) * _LightDirection;
    u_xlat4 = dot(_World2ReceiverRow1, (-u_xlat2));
    u_xlat7 = u_xlat1.x / (-u_xlat4);
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlatb4 = u_xlat4<0.0;
    u_xlatb1 = u_xlatb4 && u_xlatb1;
    u_xlat2 = vec4(u_xlat7) * (-u_xlat2);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2, vec4(bvec4(u_xlatb1)));
    u_xlat0 = u_xlat1 * vec4(0.970000029, 0.970000029, 0.970000029, 0.970000029) + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    return;
}