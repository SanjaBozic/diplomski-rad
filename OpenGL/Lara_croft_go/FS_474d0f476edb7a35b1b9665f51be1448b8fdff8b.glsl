#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat10_0.w + -0.00100000005;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
    SV_Target0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat0.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
    u_xlat0.xy = fract(u_xlat0.xy);
    SV_Target0.z = (-u_xlat0.y) * 0.00392156886 + u_xlat0.x;
    SV_Target0.w = u_xlat0.y;
    return;
}