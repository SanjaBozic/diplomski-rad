#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4unity_WorldToShadow[16];
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform  sampler2D _CameraDepthTexture;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp float u_xlat10_8;
vec3 u_xlat9;
float u_xlat16;
lowp float u_xlat10_16;
vec2 u_xlat17;
lowp float u_xlat10_17;
lowp float u_xlat10_24;
void main()
{
    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat8.x = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat16 = (-u_xlat8.x) + u_xlat10_0.x;
    u_xlat8.x = unity_OrthoParams.w * u_xlat16 + u_xlat8.x;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat10_0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * u_xlat8.xxx + u_xlat0.xzw;
    u_xlat1.xyz = u_xlat8.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat2.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat2.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat2.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat9.xyz = u_xlat2.xyz + u_xlat1.yzw;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat9.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat9.yyy + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.xyz = u_xlat2.xyz * u_xlat9.zzz + u_xlat1.xyz;
    u_xlat8.xy = u_xlat8.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
    u_xlat1.xy = floor(u_xlat8.xy);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat17.xy = (-u_xlat8.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = (-u_xlat8.xy) * vec2(3.0, 3.0) + vec2(4.0, 4.0);
    u_xlat17.xy = u_xlat17.xy / u_xlat2.xy;
    u_xlat3.xy = u_xlat17.xy + vec2(-2.0, -2.0);
    u_xlat4.z = u_xlat3.y;
    u_xlat17.xy = u_xlat8.xy * vec2(3.0, 3.0) + vec2(1.0, 1.0);
    u_xlat2.xz = u_xlat8.xy / u_xlat17.xy;
    u_xlat4.xw = u_xlat2.xz + vec2(2.0, 2.0);
    u_xlat3.w = u_xlat4.x;
    u_xlat2.xz = u_xlat8.xy + vec2(3.0, 3.0);
    u_xlat8.x = u_xlat8.x * 3.0;
    u_xlat5.xz = u_xlat8.xx * vec2(-1.0, 1.0) + vec2(4.0, 1.0);
    u_xlat4.xy = u_xlat2.xz * _ShadowMapTexture_TexelSize.xy;
    u_xlat6.xz = _ShadowMapTexture_TexelSize.yy;
    u_xlat6.y = 0.142857149;
    u_xlat6.xyz = u_xlat4.zyw * u_xlat6.xyz;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.w = u_xlat6.x;
    u_xlat7.xz = _ShadowMapTexture_TexelSize.xx;
    u_xlat7.y = 0.142857149;
    u_xlat4.xyz = u_xlat3.zxw * u_xlat7.yxz;
    u_xlat3 = u_xlat1.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat4.ywxw;
    u_xlat8.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.xy + u_xlat4.zw;
    vec3 txVec8 = vec3(u_xlat8.xy,u_xlat8.z);
    u_xlat10_8 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
    vec3 txVec9 = vec3(u_xlat3.xy,u_xlat8.z);
    u_xlat10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
    vec3 txVec10 = vec3(u_xlat3.zw,u_xlat8.z);
    u_xlat10_17 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
    u_xlat5.y = 7.0;
    u_xlat2.xyz = u_xlat2.yyy * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat17.yyy * u_xlat5.xyz;
    u_xlat5.xy = u_xlat5.xz * vec2(7.0, 7.0);
    u_xlat17.x = u_xlat10_17 * u_xlat2.y;
    u_xlat16 = u_xlat2.x * u_xlat10_16 + u_xlat17.x;
    u_xlat8.x = u_xlat2.z * u_xlat10_8 + u_xlat16;
    u_xlat6.w = u_xlat4.y;
    u_xlat2 = u_xlat1.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat6.wywz;
    u_xlat4.yw = u_xlat6.yz;
    vec3 txVec11 = vec3(u_xlat2.xy,u_xlat8.z);
    u_xlat10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
    vec3 txVec12 = vec3(u_xlat2.zw,u_xlat8.z);
    u_xlat10_17 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
    u_xlat8.x = u_xlat5.x * u_xlat10_16 + u_xlat8.x;
    u_xlat2 = u_xlat1.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat4.xyzy;
    u_xlat4 = u_xlat1.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat4.xwzw;
    vec3 txVec13 = vec3(u_xlat2.xy,u_xlat8.z);
    u_xlat10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
    vec3 txVec14 = vec3(u_xlat2.zw,u_xlat8.z);
    u_xlat10_1 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
    u_xlat8.x = u_xlat10_16 * 49.0 + u_xlat8.x;
    u_xlat8.x = u_xlat5.y * u_xlat10_1 + u_xlat8.x;
    u_xlat8.x = u_xlat3.x * u_xlat10_17 + u_xlat8.x;
    vec3 txVec15 = vec3(u_xlat4.xy,u_xlat8.z);
    u_xlat10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
    vec3 txVec16 = vec3(u_xlat4.zw,u_xlat8.z);
    u_xlat10_24 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
    u_xlat8.x = u_xlat3.y * u_xlat10_16 + u_xlat8.x;
    u_xlat8.x = u_xlat3.z * u_xlat10_24 + u_xlat8.x;
    u_xlat8.x = u_xlat8.x * 0.0069444445;
    u_xlat16 = (-_LightShadowData.x) + 1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16 + _LightShadowData.x;
    SV_Target0 = u_xlat0.xxxx + u_xlat8.xxxx;
    return;
}