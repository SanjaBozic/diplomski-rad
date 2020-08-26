#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_modelview0[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_invtrans_modelview0[4];
uniform 	vec4 unity_FogParams;
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
out float vs_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat8;
vec3 u_xlat10;
float u_xlat18;
float u_xlat19;
int u_xlati21;
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
    u_xlat19 = inversesqrt(u_xlat18);
    u_xlat2 = _Shininess * 128.0;
    u_xlat8.x = float(0.0);
    u_xlat8.y = float(0.0);
    u_xlat8.z = float(0.0);
    u_xlat3.x = float(0.0);
    u_xlat3.y = float(0.0);
    u_xlat3.z = float(0.0);
    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat4.x = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat4.x = max(u_xlat4.x, 0.0);
        u_xlat10.xyz = u_xlat4.xxx * _Color.xyz;
        u_xlat10.xyz = u_xlat10.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb4 = 0.0<u_xlat4.x;
        if(u_xlatb4){
            u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat19) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat4.x = inversesqrt(u_xlat4.x);
            u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
            u_xlat4.x = dot(u_xlat1.xyz, u_xlat5.xyz);
            u_xlat4.x = max(u_xlat4.x, 0.0);
            u_xlat4.x = log2(u_xlat4.x);
            u_xlat4.x = u_xlat2 * u_xlat4.x;
            u_xlat4.x = exp2(u_xlat4.x);
            u_xlat4.x = min(u_xlat4.x, 1.0);
            u_xlat4.x = u_xlat4.x * 0.5;
            u_xlat3.xyz = u_xlat4.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat3.xyz;
        //ENDIF
        }
        u_xlat4.xyz = u_xlat10.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat4.xyz = min(u_xlat4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat8.xyz = u_xlat8.xyz + u_xlat4.xyz;
    }
    vs_COLOR1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat8.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat18);
    vs_TEXCOORD2 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD2 = clamp(vs_TEXCOORD2, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    return;
}