#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb16;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10_2 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_2.y * _OcclusionStrength + u_xlat2.x;
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD6.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD6.xxx + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD6.zzz + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat7.xyz : vs_TEXCOORD6.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat7.x = u_xlat2.y * 0.25;
        u_xlat3.x = unity_ProbeVolumeParams.z * 0.5;
        u_xlat8 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat7.x = max(u_xlat7.x, u_xlat3.x);
        u_xlat2.x = min(u_xlat8, u_xlat7.x);
        u_xlat10_3 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_2 = texture(unity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(u_xlat10_3, u_xlat1);
        u_xlat3.y = dot(u_xlat10_4, u_xlat1);
        u_xlat3.z = dot(u_xlat10_2, u_xlat1);
    } else {
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(unity_SHAr, u_xlat1);
        u_xlat3.y = dot(unity_SHAg, u_xlat1);
        u_xlat3.z = dot(unity_SHAb, u_xlat1);
    //ENDIF
    }
    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb16 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat3.xyz = log2(u_xlat2.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = (bool(u_xlatb16)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.www * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz;
    SV_Target3.xyz = exp2((-u_xlat2.xyz));
    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
    return;
}