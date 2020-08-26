#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_modelview0[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_invtrans_modelview0[4];
uniform 	vec4 _Color;
uniform 	vec4 _SpecColor;
uniform 	float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_COLOR1;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
bool u_xlatb11;
float u_xlat18;
float u_xlat19;
int u_xlati20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4glstate_matrix_modelview0[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4glstate_matrix_modelview0[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4glstate_matrix_modelview0[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4glstate_matrix_modelview0[3].xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4glstate_matrix_invtrans_modelview0[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4glstate_matrix_invtrans_modelview0[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4glstate_matrix_invtrans_modelview0[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = _Shininess * 128.0;
    u_xlat3.x = float(0.0);
    u_xlat3.y = float(0.0);
    u_xlat3.z = float(0.0);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat4.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat22 = unity_LightAtten[u_xlati_loop_1].z * u_xlat21 + 1.0;
        u_xlat22 = float(1.0) / u_xlat22;
        u_xlatb5 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb11 = unity_LightAtten[u_xlati_loop_1].w<u_xlat21;
        u_xlatb5 = u_xlatb11 && u_xlatb5;
        u_xlat21 = inversesqrt(u_xlat21);
        u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
        u_xlat21 = u_xlat22 * 0.5;
        u_xlat21 = (u_xlatb5) ? 0.0 : u_xlat21;
        u_xlat22 = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat22 = max(u_xlat22, 0.0);
        u_xlat5.xyz = vec3(u_xlat22) * _Color.xyz;
        u_xlat5.xyz = u_xlat5.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb22 = 0.0<u_xlat22;
        if(u_xlatb22){
            u_xlat4.xyz = (-u_xlat0.xyz) * vec3(u_xlat18) + u_xlat4.xyz;
            u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
            u_xlat22 = inversesqrt(u_xlat22);
            u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
            u_xlat4.x = dot(u_xlat1.xyz, u_xlat4.xyz);
            u_xlat4.x = max(u_xlat4.x, 0.0);
            u_xlat4.x = log2(u_xlat4.x);
            u_xlat4.x = u_xlat19 * u_xlat4.x;
            u_xlat4.x = exp2(u_xlat4.x);
            u_xlat4.x = min(u_xlat4.x, 1.0);
            u_xlat4.x = u_xlat21 * u_xlat4.x;
            u_xlat3.xyz = u_xlat4.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat3.xyz;
        //ENDIF
        }
        u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz;
        u_xlat4.xyz = min(u_xlat4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat2.xyz = u_xlat2.xyz + u_xlat4.xyz;
    }
    vs_COLOR1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    return;
}