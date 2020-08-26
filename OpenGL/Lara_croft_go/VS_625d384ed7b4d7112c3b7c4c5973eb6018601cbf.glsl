#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_modelview0[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_invtrans_modelview0[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 _Color;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Emission;
uniform 	float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_COLOR1;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat21;
float u_xlat22;
int u_xlati23;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4glstate_matrix_modelview0[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4glstate_matrix_modelview0[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4glstate_matrix_modelview0[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4glstate_matrix_modelview0[3].xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4glstate_matrix_invtrans_modelview0[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4glstate_matrix_invtrans_modelview0[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4glstate_matrix_invtrans_modelview0[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat22 = _Shininess * 128.0;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat24 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat24 = max(u_xlat24, 0.0);
        u_xlat5.xyz = vec3(u_xlat24) * _Color.xyz;
        u_xlat5.xyz = u_xlat5.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb24 = 0.0<u_xlat24;
        if(u_xlatb24){
            u_xlat6.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat24 = inversesqrt(u_xlat24);
            u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
            u_xlat24 = dot(u_xlat1.xyz, u_xlat6.xyz);
            u_xlat24 = max(u_xlat24, 0.0);
            u_xlat24 = log2(u_xlat24);
            u_xlat24 = u_xlat22 * u_xlat24;
            u_xlat24 = exp2(u_xlat24);
            u_xlat24 = min(u_xlat24, 1.0);
            u_xlat24 = u_xlat24 * 0.5;
            u_xlat4.xyz = vec3(u_xlat24) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat5.xyz = min(u_xlat5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat5.xyz;
    }
    vs_COLOR1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat3.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    return;
}