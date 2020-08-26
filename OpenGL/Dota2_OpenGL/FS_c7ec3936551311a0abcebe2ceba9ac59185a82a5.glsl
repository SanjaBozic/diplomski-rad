#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout(std140, binding = 1 ) uniform PerViewConstantBuffer_t {
	layout(row_major) mat4 g_matWorldToProjection;
	layout(row_major) mat4 g_matProjectionToWorld;
	layout(row_major) mat4 g_matWorldToView;
	layout(row_major) mat4 g_matViewToProjection;
	vec4 g_vInvProjRow3;
	vec4 g_vClipPlane0;
	float g_flToneMapScalarLinear;
	float g_flLightMapScalar;
	float g_flEnvMapScalar;
	float g_flToneMapScalarGamma;
	vec3 g_vCameraPositionWs;
	float g_flViewportMinZ;
	vec3 g_vCameraDirWs;
	float g_flViewportMaxZ;
	vec3 g_vCameraUpDirWs;
	float g_flTime;
	vec3 g_vDepthPsToVsConversion;
	float g_flNearPlane;
	float g_flFarPlane;
	float g_flLightBinnerFarPlane;
	vec2 g_vInvViewportSize;
	vec2 g_vViewportToGBufferRatio;
	vec2 g_vMorphTextureAtlasSize;
	vec4 g_vInvGBufferSize;
	vec2 g_vViewportOffset;
	vec2 g_vViewportSize;
	vec2 g_vRenderTargetSize;
	float g_flFogBlendToBackground;
	float g_flHenyeyGreensteinCoeff;
	vec3 g_vFogColor;
	float g_flNegFogStartOverFogRange;
	float g_flInvFogRange;
	float g_flFogMaxDensity;
	float g_flFogExponent;
	float g_flMod2xIdentity;
	vec2 g_bRoughnessParams;
	float g_bStereoEnabled;
	float g_flStereoCameraIndex;
	vec3 g_vMiddleEyePositionWs;
	float g_flPad2;
	layout(row_major) mat4 g_matWorldToProjectionMultiview[2];
	vec4 g_vCameraPositionWsMultiview[2];
	vec4 g_vFrameBufferCopyInvSizeAndUvScale;
	vec4 g_vCameraAngles;
	vec4 g_vWorldToCameraOffset;
	vec4 g_vWorldToCameraOffsetMultiview[2];
	vec4 g_vPerViewConstantExtraData0;
	vec4 g_vPerViewConstantExtraData1;
	vec4 g_vPerViewConstantExtraData2;
	vec4 g_vPerViewConstantExtraData3;
} ;
layout(std140, binding = 2 ) uniform DotaGlobalParams_t {
	vec3 g_vGlobalLightDir;
	vec3 g_vGlobalLightColor;
	float g_flGlobalLightSpecularScale;
	vec3 g_vGlobalLightSpecularDir;
	float g_flGlobalLightSpecularExp;
	vec3 g_vGlobalLightSpecularColor;
	float g_flGlobalLightSpecularIndependence;
	vec3 g_vGlobalLightAmbientDir;
	float g_flGlobalLightAmbientScale1;
	vec3 g_vGlobalLightAmbientColor1;
	float g_flGlobalLightAmbientScale2;
	vec3 g_vGlobalLightAmbientColor2;
	float g_flGlobalLightAmbientScale2Hero;
	vec2 g_vGlobalCloud1Offset;
	vec2 g_vGlobalCloud2Offset;
	vec3 g_vFowColor;
	float g_flGlobalCloudScale;
	float g_flFowDarkness;
	float g_flFowGrayFactor;
	float g_flFowColorFactor;
	float g_flFowGrayHilights;
	vec4 g_vFowWorldSize;
	vec4 g_vFowTexOffsets;
	layout(row_major) mat4 g_matShadowWorldToTexture;
	vec4 g_vInvShadowDepthTextureSize;
	vec3 g_vGlobalLightAmbientColor3;
	float g_flGlobalLightAmbientShadowAmount;
} ;
layout( binding = 3 ) uniform sampler2DShadow g_tShadowDepthTexture;
layout(std140, binding = 0 ) uniform _Globals_ {
	float g_flBumpStrength;
	vec3 g_vColorTint;
	vec3 g_vColorTint2;
	float g_flSpecularBloom;
	float g_flSpecularIntensity;
	vec2 g_vTexCoordScale;
} ;
layout( binding = 0 ) uniform sampler2D g_tColor;
layout( binding = 1 ) uniform sampler2D g_tSpecular;
layout( binding = 2 ) uniform sampler2D g_tNormal;
uniform sampler2D g_tFow;
uniform sampler2D g_tFrameBufferCopyTexture;
uniform sampler2D g_tDepthTexture;
uniform sampler2D g_tGBufferAlbedo;
uniform sampler2D g_tGBufferLightingTerms;
uniform sampler2D g_tGBufferDepth;
uniform sampler2D g_tGBufferNormalWs;
layout(std140) uniform PerViewLightingConstantBuffer_t {
	vec4 g_vInvLightTextureDims;
	vec4 g_vLightBinCounts;
	vec2 g_vLowResDeferredLightingTextureDim;
	vec2 g_vLowResDeferredLightingTextureInvDim;
	vec3 g_vToolsAmbientLighting;
	float g_flSSAOEnabled;
	vec3 g_vIrradAtlasInvSize;
	float g_flIrradGlobalLightingFactor;
	vec4 g_vGlobalLightingSHRed;
	vec4 g_vGlobalLightingSHGreen;
	vec4 g_vGlobalLightingSHBlue;
	vec3 g_vRayleighScatteringCoeff;
	float g_flMieScatteringEccentricity;
	vec3 g_vMieScatteringCoeff;
	float g_flMieForwardScatteringRatio;
	vec3 g_vSpecularCubeMapScale;
	float g_flDefaultEnvMapIndex;
	vec4 g_vLightCookieSheetSequenceAndSizes;
	vec3 g_vLpvBoxMinCascade0;
	float g_flLpvBrightnessScale;
	vec3 g_vLpvInvBoxDimCascade0;
	vec2 g_vLpvInvCoeffTextureDim;
} ;
layout(std140) uniform PerLayerConstantBuffer_t {
	vec4 g_vWireframeColor;
} ;
uniform sampler2D g_tClouds;
uniform sampler2D g_tTintMask;
layout(location=0) in vec2 PS_INPUT_gl_vBaseTexCoord;
layout(location=1) in vec4 PS_INPUT_gl_vPositionWs_flLinearDepth;
layout(location=2) in vec4 PS_INPUT_gl_vNormalWs_flSpecularAmount;
layout(location=3) in vec4 PS_INPUT_gl_vVertexColor;
layout(location=4) in float PS_INPUT_gl_flClipPlaneDist;
layout(location=5) in vec4 PS_INPUT_gl_vTangentUWs_flTangentVSign;
layout(location=0) out vec4 PS_OUTPUT_gl_vDiffuse;
layout(location=1) out vec4 PS_OUTPUT_gl_flDepth;
const vec2 C_vec2p2d0p = vec2(2.0);
const vec2 C_vec2pa1d0p = vec2(-1.0);
const float C_1d0 = 1.0;
const float C_0d0 = 0.0;
const vec3 C_vec3p0d0p = vec3(0.0);
const vec4 C_wt9i7t = vec4(0.0749064);
const vec2 C_a1z03r = vec2(0.0, 0.0);
const vec4 C_a1xzaw1 = vec4(0.123596);
const float C_0d205993 = 0.205993;
const float C_1d85 = 1.85;
const float C_0d45 = 0.45;
const float C_2d1 = 2.1;
const float C_0d5 = 0.5;
const vec3 C_kfumqy1 = vec3(0.2125, 0.7154, 0.0721);
const float C_8d0 = 8.0;
void main()
{
	vec3 vGeometricNormalWs = normalize(PS_INPUT_gl_vNormalWs_flSpecularAmount.xyz);
	vec3 vTangentUWs = normalize(PS_INPUT_gl_vTangentUWs_flTangentVSign.xyz);
	vec3 vTangentVWs = cross(vGeometricNormalWs, PS_INPUT_gl_vTangentUWs_flTangentVSign.xyz);
	vec3 vTangentVWs1 = normalize(vTangentVWs);
	vec3 vTangentVWs2 = PS_INPUT_gl_vTangentUWs_flTangentVSign.www * vTangentVWs1;
	vec4 vDiffuse = texture(g_tColor, PS_INPUT_gl_vBaseTexCoord);
	vec3 H_ysarle = g_vColorTint * vDiffuse.xyz;
	vec4 H_xgyfl71 = vDiffuse;
	H_xgyfl71.xyz = H_ysarle.xyz;
	vec4 vDiffuse1 = H_xgyfl71 * PS_INPUT_gl_vVertexColor;
	vec4 vSpecular = texture(g_tSpecular, PS_INPUT_gl_vBaseTexCoord);
	float H_i0xhec = g_flSpecularIntensity * vSpecular.x;
	vec4 vNormalTexel = texture(g_tNormal, PS_INPUT_gl_vBaseTexCoord);
	vec2 H_qgi6bb = vNormalTexel.wy * C_vec2p2d0p;
	vec2 H_mblhlu1 = H_qgi6bb + C_vec2pa1d0p;
	float vNormalTs = dot(H_mblhlu1, H_mblhlu1);
	float param = C_1d0 - vNormalTs;
	float misc3a = clamp(param, C_0d0, C_1d0);
	float vNormalTs1 = sqrt(misc3a);
	float H_vj1l3j = C_0d0 - H_mblhlu1.y;
	vec2 H_x1he8s = vec2(g_flBumpStrength);
	vec2 H_5p8e11 = vec2(H_mblhlu1.x, H_vj1l3j);
	vec2 H_q35u7b1 = H_5p8e11 * H_x1he8s;
	vec3 H_38ejs41 = vec3(H_q35u7b1.x, H_q35u7b1.y, vNormalTs1);
	vec3 vNormalTs2 = normalize(H_38ejs41);
	vec3 vVectorWs = vNormalTs2.xxx * vTangentUWs;
	vec3 H_35021c1 = vNormalTs2.yyy * vTangentVWs2;
	vec3 vVectorWs1 = H_35021c1 + vVectorWs;
	vec3 H_9wf1l91 = vGeometricNormalWs * vNormalTs2.zzz;
	vec3 vVectorWs2 = H_9wf1l91 + vVectorWs1;
	vec3 H_qw6t8a1 = normalize(vVectorWs2);
	vec3 H_8mjky01 = PS_INPUT_gl_vPositionWs_flLinearDepth.xyz - g_vCameraPositionWs;
	vec3 H_i1nbjv1 = normalize(H_8mjky01);
	vec3 H_t3ywhi1 = C_vec3p0d0p - H_i1nbjv1;
	vec3 vReflect = reflect(H_t3ywhi1, H_qw6t8a1);
	float flSpecular = dot(g_vGlobalLightSpecularDir, vReflect);
	float misc3a1 = clamp(flSpecular, C_0d0, C_1d0);
	float flSpecular1 = pow(misc3a1, g_flGlobalLightSpecularExp);
	float flSpecular2 = H_i0xhec * flSpecular1;
	vec3 H_s6408y = vec3(flSpecular2);
	vec3 flSpecularRGB = H_s6408y * g_vGlobalLightSpecularColor;
	float misc3a2 = clamp(g_flGlobalLightSpecularIndependence, C_0d0, C_1d0);
	vec3 H_7pnklg = vec3(misc3a2);
	float H_f5a1k1 = C_1d0 - misc3a2;
	vec3 H_77m74o1 = vec3(H_f5a1k1);
	vec3 H_20dm1p = H_77m74o1 * flSpecularRGB;
	vec3 H_3eo549 = H_20dm1p + vDiffuse1.xyz;
	vec3 H_j03jbn = C_vec3p0d0p - g_vGlobalLightDir;
	float flNDotL = dot(H_j03jbn, H_qw6t8a1);
	float misc3a3 = clamp(flNDotL, C_0d0, C_1d0);
	float product = PS_INPUT_gl_vPositionWs_flLinearDepth.x * g_matShadowWorldToTexture[0].x;
	float product1 = PS_INPUT_gl_vPositionWs_flLinearDepth.y * g_matShadowWorldToTexture[1].x;
	float dotProduct = product + product1;
	float product2 = PS_INPUT_gl_vPositionWs_flLinearDepth.z * g_matShadowWorldToTexture[2].x;
	float dotProduct1 = dotProduct + product2;
	float dotProduct2 = dotProduct1 + g_matShadowWorldToTexture[3].x;
	float product3 = PS_INPUT_gl_vPositionWs_flLinearDepth.x * g_matShadowWorldToTexture[0].y;
	float product4 = PS_INPUT_gl_vPositionWs_flLinearDepth.y * g_matShadowWorldToTexture[1].y;
	float dotProduct3 = product3 + product4;
	float product5 = PS_INPUT_gl_vPositionWs_flLinearDepth.z * g_matShadowWorldToTexture[2].y;
	float dotProduct4 = dotProduct3 + product5;
	float dotProduct5 = dotProduct4 + g_matShadowWorldToTexture[3].y;
	float product6 = PS_INPUT_gl_vPositionWs_flLinearDepth.x * g_matShadowWorldToTexture[0].z;
	float product7 = PS_INPUT_gl_vPositionWs_flLinearDepth.y * g_matShadowWorldToTexture[1].z;
	float dotProduct6 = product6 + product7;
	float product8 = PS_INPUT_gl_vPositionWs_flLinearDepth.z * g_matShadowWorldToTexture[2].z;
	float dotProduct7 = dotProduct6 + product8;
	float dotProduct8 = dotProduct7 + g_matShadowWorldToTexture[3].z;
	float product9 = PS_INPUT_gl_vPositionWs_flLinearDepth.x * g_matShadowWorldToTexture[0].w;
	float producta = PS_INPUT_gl_vPositionWs_flLinearDepth.y * g_matShadowWorldToTexture[1].w;
	float dotProduct9 = product9 + producta;
	float productb = PS_INPUT_gl_vPositionWs_flLinearDepth.z * g_matShadowWorldToTexture[2].w;
	float dotProducta = dotProduct9 + productb;
	float dotProductb = dotProducta + g_matShadowWorldToTexture[3].w;
	vec3 H_16wbh81 = vec3(dotProductb);
	vec3 H_mo5dbs1 = vec3(dotProduct2, dotProduct5, dotProduct8);
	vec3 H_qdsg5k1 = H_mo5dbs1 / H_16wbh81;
	float param1 = C_0d0 - H_qdsg5k1.z;
	float misc3a4 = clamp(param1, C_0d0, C_1d0);
	float H_60ojyb = C_0d0 - g_vInvShadowDepthTextureSize.x;
	vec2 H_t5te6f = vec2(H_60ojyb);
	vec2 H_ep5c3j1 = H_qdsg5k1.xy + g_vInvShadowDepthTextureSize.xx;
	vec3 H_msqlvi = vec3(H_ep5c3j1.x, H_ep5c3j1.y, misc3a4);
	float H_pfhqbt1 = textureLod(g_tShadowDepthTexture, H_msqlvi, C_0d0);
	vec2 H_pv0in9 = vec2(H_60ojyb, g_vInvShadowDepthTextureSize.x);
	vec2 H_he48ts = H_pv0in9 + H_qdsg5k1.xy;
	vec3 H_anpi7s = vec3(H_he48ts.x, H_he48ts.y, misc3a4);
	float H_rra2j11 = textureLod(g_tShadowDepthTexture, H_anpi7s, C_0d0);
	vec2 H_t32u4i1 = vec2(g_vInvShadowDepthTextureSize.x, H_60ojyb);
	vec2 H_3zubtq = H_qdsg5k1.xy + H_t32u4i1;
	vec3 H_igygek1 = vec3(H_3zubtq.x, H_3zubtq.y, misc3a4);
	float H_2abuie = textureLod(g_tShadowDepthTexture, H_igygek1, C_0d0);
	vec2 H_r37y1w = H_qdsg5k1.xy + H_t5te6f;
	vec3 H_up1qjg1 = vec3(H_r37y1w.x, H_r37y1w.y, misc3a4);
	float H_2b6uc4 = textureLod(g_tShadowDepthTexture, H_up1qjg1, C_0d0);
	vec4 H_7il6qo = vec4(H_pfhqbt1, H_rra2j11, H_2abuie, H_2b6uc4);
	float flSum = dot(H_7il6qo, C_wt9i7t);
	vec2 H_e9rh661 = vec2(g_vInvShadowDepthTextureSize.x, C_0d0);
	vec2 H_85dk7x = H_e9rh661 + H_qdsg5k1.xy;
	vec3 H_mytg2n1 = vec3(H_85dk7x.x, H_85dk7x.y, misc3a4);
	float H_n0c46n = textureLod(g_tShadowDepthTexture, H_mytg2n1, C_0d0);
	vec2 H_na4vhz = vec2(H_60ojyb, C_0d0);
	vec2 H_iybrli = H_na4vhz + H_qdsg5k1.xy;
	vec3 H_ivxk8j1 = vec3(H_iybrli.x, H_iybrli.y, misc3a4);
	float H_22sl4p1 = textureLod(g_tShadowDepthTexture, H_ivxk8j1, C_0d0);
	vec2 H_23b4ob1 = C_a1z03r;
	H_23b4ob1.y = H_60ojyb;
	vec2 H_wcm3cs = H_23b4ob1 + H_qdsg5k1.xy;
	vec3 H_aaf3c01 = vec3(H_wcm3cs.x, H_wcm3cs.y, misc3a4);
	float H_kohr3d1 = textureLod(g_tShadowDepthTexture, H_aaf3c01, C_0d0);
	vec2 H_23b4ob1r = C_a1z03r;
	H_23b4ob1r.y = g_vInvShadowDepthTextureSize.x;
	vec2 H_omz8p81 = H_23b4ob1r + H_qdsg5k1.xy;
	vec3 H_mbixvk = vec3(H_omz8p81.x, H_omz8p81.y, misc3a4);
	float H_8l9juu = textureLod(g_tShadowDepthTexture, H_mbixvk, C_0d0);
	vec4 H_ihq79x1 = vec4(H_n0c46n, H_22sl4p1, H_kohr3d1, H_8l9juu);
	float flSum1 = dot(H_ihq79x1, C_a1xzaw1);
	float flSum2 = flSum + flSum1;
	vec3 H_wbit1t = vec3(H_qdsg5k1.x, H_qdsg5k1.y, misc3a4);
	float flSum3 = textureLod(g_tShadowDepthTexture, H_wbit1t, C_0d0);
	float H_xchcee1 = flSum3 * C_0d205993;
	float flSum4 = H_xchcee1 + flSum2;
	vec3 H_k9xsqt1 = vec3(flSum4);
	float flDirectionalAmbientShadow = mix(C_1d0, flSum4, g_flGlobalLightAmbientShadowAmount);
	float flDirectOcclusionFactor = pow(C_1d0, C_1d85);
	float flDirectOcclusionFactor1 = mix(C_0d45, C_1d0, flDirectOcclusionFactor);
	float flIndirectOcclusionFactor = pow(C_1d0, C_2d1);
	vec3 H_fx1uua = vec3(g_flGlobalLightAmbientScale1);
	vec3 vDirectionalAmbientColor = H_fx1uua * g_vGlobalLightAmbientColor1;
	float H_jjpf4g1 = H_qw6t8a1.z * C_0d5;
	float H_ahpdwy = C_0d5 + H_jjpf4g1;
	vec3 vShadowAmbientColor = mix(g_vGlobalLightAmbientColor3, g_vGlobalLightAmbientColor2, H_ahpdwy);
	vec3 H_s7noda1 = vec3(g_flGlobalLightAmbientScale2);
	vec3 vShadowAmbientColor1 = H_s7noda1 * vShadowAmbientColor;
	float flLuminance = dot(vDirectionalAmbientColor, C_kfumqy1);
	vec3 H_t1lelu1 = vec3(flLuminance);
	float flLuminance1 = dot(vShadowAmbientColor1, C_kfumqy1);
	vec3 H_chpant1 = vec3(flLuminance1);
	vec3 vDirectionalAmbientColor1 = mix(vDirectionalAmbientColor, H_t1lelu1, C_vec3p0d0p);
	vec3 vShadowAmbientColor2 = mix(vShadowAmbientColor1, H_chpant1, C_vec3p0d0p);
	float H_1fxyk9 = flSum4 * misc3a3;
	float H_09rr4v1 = H_1fxyk9 * flDirectOcclusionFactor1;
	vec3 H_grf5hu = vec3(H_09rr4v1);
	vec3 vDirectLight = H_grf5hu * g_vGlobalLightColor;
	float vDirectionalAmbientLight = dot(g_vGlobalLightAmbientDir, H_qw6t8a1);
	float misc3a5 = clamp(vDirectionalAmbientLight, C_0d0, C_1d0);
	float H_m4by5e = flDirectionalAmbientShadow * misc3a5;
	float H_64fuii = H_m4by5e * flIndirectOcclusionFactor;
	vec3 H_9cizox = vec3(H_64fuii);
	vec3 vDirectionalAmbientLight1 = H_9cizox * vDirectionalAmbientColor1;
	float H_epes411 = C_1d0 - H_1fxyk9;
	float H_h2z1ua = H_epes411 * flIndirectOcclusionFactor;
	vec3 H_t2bxsq = vec3(H_h2z1ua);
	vec3 vShadowAmbientLight = H_t2bxsq * vShadowAmbientColor2;
	vec3 H_8w78gv1 = vDirectLight + vDirectionalAmbientLight1;
	vec3 vLighting = H_8w78gv1 + vShadowAmbientLight;
	vec3 H_vada67 = H_3eo549 * vLighting;
	vec3 H_bcfwoi = vec3(g_flGlobalLightSpecularScale);
	vec3 H_knhpna = H_bcfwoi * flSpecularRGB;
	vec3 H_8xrc791 = H_7pnklg * H_knhpna;
	vec3 H_0v3pae1 = H_8xrc791 * H_k9xsqt1;
	vec3 H_xwq051 = H_0v3pae1 + H_vada67;
	float H_dcw1e4 = PS_INPUT_gl_flClipPlaneDist + C_8d0;
	float param2 = H_dcw1e4 * g_flInvFogRange;
	float misc3a6 = clamp(param2, C_0d0, C_1d0);
	vec4 H_0lqbnk = vec4(H_xwq051.x, H_xwq051.y, H_xwq051.z, misc3a6);
	PS_OUTPUT_gl_vDiffuse = H_0lqbnk;
	PS_OUTPUT_gl_flDepth = PS_INPUT_gl_vPositionWs_flLinearDepth.wwww;
}
