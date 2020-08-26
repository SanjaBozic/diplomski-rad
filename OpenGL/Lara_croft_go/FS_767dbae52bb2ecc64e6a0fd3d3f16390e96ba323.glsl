#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _Illum;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
    SV_Target2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 1.0;
    u_xlat1.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat10_2 = texture(_Illum, vs_TEXCOORD0.zw);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.www + u_xlat1.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}