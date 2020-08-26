#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _Time;
uniform 	vec4 _AmbientLightColor;
uniform 	vec4 _DirectionalLightColor;
uniform 	vec3 _DirectionalLightForward;
uniform 	vec4 _ShadowColor;
uniform 	vec2 _ShadowCameraSettings;
uniform 	vec3 _VertexAnimSpeed;
uniform 	vec3 _VertexAnimRepeat;
uniform 	vec3 _VertexAnimScale;
uniform 	vec4 _DepthColor;
uniform 	vec2 _DepthBounds;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x * _VertexAnimRepeat.x;
    u_xlat0.x = _Time.y * _VertexAnimSpeed.x + u_xlat0.x;
    u_xlat0.x = _VertexAnimRepeat.y * vs_TEXCOORD1.z + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = sin((-u_xlat0.x));
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat3.x = _VertexAnimScale.x * 0.699999988;
    u_xlat0.x = u_xlat3.x * u_xlat0.x + vs_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + (-_DepthBounds.y);
    u_xlat3.x = (-_DepthBounds.y) + _DepthBounds.x;
    u_xlat0.x = u_xlat0.x / u_xlat3.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat3.x = vs_TEXCOORD4.z + (-_ShadowCameraSettings.xxyx.z);
    u_xlat3.x = u_xlat3.x / _ShadowCameraSettings.xxyx.y;
    u_xlat10_1 = texture(_ShadowMapTexture, vs_TEXCOORD4.xy);
    u_xlatb3 = u_xlat3.x>=u_xlat10_1.x;
    u_xlat3.x = (u_xlatb3) ? 0.0 : 1.0;
    u_xlat3.xyz = max(u_xlat3.xxx, _ShadowColor.xyz);
    u_xlat1.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD0.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, _DirectionalLightForward.xyz);
    u_xlat1.xyz = u_xlat1.xxx * _DirectionalLightColor.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat1.xyz = vs_COLOR0.xyz * _AmbientLightColor.xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat1.w = vs_COLOR0.w;
    u_xlat2 = (-u_xlat1) + _DepthColor;
    u_xlat0 = u_xlat0.xxxx * u_xlat2;
    SV_Target0 = _DepthColor.wwww * u_xlat0 + u_xlat1;
    return;
}