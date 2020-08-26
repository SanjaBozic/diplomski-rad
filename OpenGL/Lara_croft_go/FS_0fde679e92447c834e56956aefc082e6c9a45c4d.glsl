#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _BlinkColor;
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform  sampler2D _PaletteTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _DirectionalLightForward.xyz);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalLightColor.xyz;
    u_xlat10_1 = texture(_PaletteTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * vec4(1.60000002, 1.60000002, 1.60000002, 1.60000002);
    u_xlat2.xyz = u_xlat16_1.xyz * _AmbientLightColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = u_xlat16_1.w;
    SV_Target0.xyz = _BlinkColor.www * _BlinkColor.xyz + u_xlat0.xyz;
    return;
}