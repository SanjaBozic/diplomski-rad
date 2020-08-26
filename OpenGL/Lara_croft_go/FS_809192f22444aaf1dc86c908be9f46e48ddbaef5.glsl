#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
in  vec3 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
    SV_Target2.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.xyz = exp2((-vs_COLOR0.xyz));
    SV_Target3.w = 1.0;
    return;
}