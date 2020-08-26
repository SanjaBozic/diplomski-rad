#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout(std140, binding = 0 ) uniform PerViewConstantBuffer_t {
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
layout(std140, binding = 1 ) uniform DotaGlobalParams_t {
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
layout( binding = 4 ) uniform sampler2DShadow g_tShadowDepthTexture;
layout( binding = 0 ) uniform sampler2D g_tGBufferNormalWs;
layout( binding = 1 ) uniform sampler2D g_tGBufferAlbedo;
layout( binding = 2 ) uniform sampler2D g_tGBufferDepth;
layout( binding = 3 ) uniform sampler2D g_tGBufferLightingTerms;
layout(std140) uniform _Globals_ {
	vec4 g_vTextureSize;
	vec4 g_vInvTextureSize;
} ;
uniform sampler2D g_tFow;
uniform sampler2D g_tFrameBufferCopyTexture;
uniform sampler2D g_tDepthTexture;
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
uniform sampler2D g_tSsao;
layout(location=0) in vec2 PS_INPUT_gl_vTexCoord;
layout(location=1) in vec3 PS_INPUT_gl_vCameraToFarPlaneDirWs;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const float C_0d0 = 0.0;
const vec3 C_vec3pa0d5p = vec3(-0.5);
const vec3 C_vec3p2d0p = vec3(2.0);
const vec3 C_vec3p0d0p = vec3(0.0);
const float C_1d0 = 1.0;
const vec4 C_wt9i7t = vec4(0.0749064);
const vec2 C_a1z03r = vec2(0.0, 0.0);
const vec4 C_a1xzaw1 = vec4(0.123596);
const float C_0d205993 = 0.205993;
const float C_1d85 = 1.85;
const float C_0d45 = 0.45;
const float C_2d1 = 2.1;
const float C_0d5 = 0.5;
const vec3 C_kfumqy1 = vec3(0.2125, 0.7154, 0.0721);
void main()
{
	vec2 vScreenUv = g_vInvGBufferSize.xy * gl_FragCoord.xy;
	vec4 vNormal = textureLod(g_tGBufferNormalWs, vScreenUv, C_0d0);
	vec3 H_dk24o2 = vNormal.xyz + C_vec3pa0d5p;
	vec3 H_tzze0x = H_dk24o2 * C_vec3p2d0p;
	vec4 vDiffuse = textureLod(g_tGBufferAlbedo, vScreenUv, C_0d0);
	vec4 flLinearDepth = textureLod(g_tGBufferDepth, vScreenUv, C_0d0);
	vec3 H_28t7ha1 = PS_INPUT_gl_vCameraToFarPlaneDirWs * flLinearDepth.xxx;
	vec3 vPositionWs = H_28t7ha1 + g_vCameraPositionWs;
	vec4 vSpecular = textureLod(g_tGBufferLightingTerms, vScreenUv, C_0d0);
	vec3 H_523oj5 = vPositionWs - g_vCameraPositionWs;
	vec3 H_0rv61p = normalize(H_523oj5);
	vec3 H_jxvi9a1 = C_vec3p0d0p - H_0rv61p;
	vec3 vReflect = reflect(H_jxvi9a1, H_tzze0x);
	float flSpecular = dot(g_vGlobalLightSpecularDir, vReflect);
	float misc3a = clamp(flSpecular, C_0d0, C_1d0);
	float flSpecular1 = pow(misc3a, g_flGlobalLightSpecularExp);
	float flSpecular2 = flSpecular1 * vSpecular.x;
	vec3 H_s6408y = vec3(flSpecular2);
	vec3 flSpecularRGB = H_s6408y * g_vGlobalLightSpecularColor;
	float misc3a1 = clamp(g_flGlobalLightSpecularIndependence, C_0d0, C_1d0);
	vec3 H_gsyr871 = vec3(misc3a1);
	float H_euv0u1 = C_1d0 - misc3a1;
	vec3 H_0pogms1 = vec3(H_euv0u1);
	vec3 H_p2p5k7 = H_0pogms1 * flSpecularRGB;
	vec3 H_za5uuj = H_p2p5k7 + vDiffuse.xyz;
	vec3 H_j03jbn = C_vec3p0d0p - g_vGlobalLightDir;
	float flNDotL = dot(H_j03jbn, H_tzze0x);
	float misc3a2 = clamp(flNDotL, C_0d0, C_1d0);
	float product = g_matShadowWorldToTexture[0].x * vPositionWs.x;
	float product1 = g_matShadowWorldToTexture[1].x * vPositionWs.y;
	float dotProduct = product + product1;
	float product2 = g_matShadowWorldToTexture[2].x * vPositionWs.z;
	float dotProduct1 = dotProduct + product2;
	float dotProduct2 = dotProduct1 + g_matShadowWorldToTexture[3].x;
	float product3 = g_matShadowWorldToTexture[0].y * vPositionWs.x;
	float product4 = g_matShadowWorldToTexture[1].y * vPositionWs.y;
	float dotProduct3 = product3 + product4;
	float product5 = g_matShadowWorldToTexture[2].y * vPositionWs.z;
	float dotProduct4 = dotProduct3 + product5;
	float dotProduct5 = dotProduct4 + g_matShadowWorldToTexture[3].y;
	float product6 = g_matShadowWorldToTexture[0].z * vPositionWs.x;
	float product7 = g_matShadowWorldToTexture[1].z * vPositionWs.y;
	float dotProduct6 = product6 + product7;
	float product8 = g_matShadowWorldToTexture[2].z * vPositionWs.z;
	float dotProduct7 = dotProduct6 + product8;
	float dotProduct8 = dotProduct7 + g_matShadowWorldToTexture[3].z;
	float product9 = g_matShadowWorldToTexture[0].w * vPositionWs.x;
	float producta = g_matShadowWorldToTexture[1].w * vPositionWs.y;
	float dotProduct9 = product9 + producta;
	float productb = g_matShadowWorldToTexture[2].w * vPositionWs.z;
	float dotProducta = dotProduct9 + productb;
	float dotProductb = dotProducta + g_matShadowWorldToTexture[3].w;
	vec3 H_16wbh81 = vec3(dotProductb);
	vec3 H_mo5dbs1 = vec3(dotProduct2, dotProduct5, dotProduct8);
	vec3 H_qdsg5k1 = H_mo5dbs1 / H_16wbh81;
	float param = C_0d0 - H_qdsg5k1.z;
	float misc3a3 = clamp(param, C_0d0, C_1d0);
	float H_60ojyb = C_0d0 - g_vInvShadowDepthTextureSize.x;
	vec2 H_t5te6f = vec2(H_60ojyb);
	vec2 H_ep5c3j1 = H_qdsg5k1.xy + g_vInvShadowDepthTextureSize.xx;
	vec3 H_9wp3wi = vec3(H_ep5c3j1.x, H_ep5c3j1.y, misc3a3);
	float H_0g0t4m = textureLod(g_tShadowDepthTexture, H_9wp3wi, C_0d0);
	vec2 H_pv0in9 = vec2(H_60ojyb, g_vInvShadowDepthTextureSize.x);
	vec2 H_he48ts = H_pv0in9 + H_qdsg5k1.xy;
	vec3 H_xqo08s = vec3(H_he48ts.x, H_he48ts.y, misc3a3);
	float H_84s32o1 = textureLod(g_tShadowDepthTexture, H_xqo08s, C_0d0);
	vec2 H_t32u4i1 = vec2(g_vInvShadowDepthTextureSize.x, H_60ojyb);
	vec2 H_3zubtq = H_qdsg5k1.xy + H_t32u4i1;
	vec3 H_9dn9rt = vec3(H_3zubtq.x, H_3zubtq.y, misc3a3);
	float H_31oqtf = textureLod(g_tShadowDepthTexture, H_9dn9rt, C_0d0);
	vec2 H_r37y1w = H_qdsg5k1.xy + H_t5te6f;
	vec3 H_lmqiwp = vec3(H_r37y1w.x, H_r37y1w.y, misc3a3);
	float H_vra2tr1 = textureLod(g_tShadowDepthTexture, H_lmqiwp, C_0d0);
	vec4 H_wpg1wt = vec4(H_0g0t4m, H_84s32o1, H_31oqtf, H_vra2tr1);
	float flSum = dot(H_wpg1wt, C_wt9i7t);
	vec2 H_e9rh661 = vec2(g_vInvShadowDepthTextureSize.x, C_0d0);
	vec2 H_85dk7x = H_e9rh661 + H_qdsg5k1.xy;
	vec3 H_92ty2n1 = vec3(H_85dk7x.x, H_85dk7x.y, misc3a3);
	float H_ykg8mj = textureLod(g_tShadowDepthTexture, H_92ty2n1, C_0d0);
	vec2 H_na4vhz = vec2(H_60ojyb, C_0d0);
	vec2 H_iybrli = H_na4vhz + H_qdsg5k1.xy;
	vec3 H_5zw29j1 = vec3(H_iybrli.x, H_iybrli.y, misc3a3);
	float H_1h6v5 = textureLod(g_tShadowDepthTexture, H_5zw29j1, C_0d0);
	vec2 H_23b4ob1 = C_a1z03r;
	H_23b4ob1.y = H_60ojyb;
	vec2 H_wcm3cs = H_23b4ob1 + H_qdsg5k1.xy;
	vec3 H_9lo6gr = vec3(H_wcm3cs.x, H_wcm3cs.y, misc3a3);
	float H_gabb6n = textureLod(g_tShadowDepthTexture, H_9lo6gr, C_0d0);
	vec2 H_23b4ob1r = C_a1z03r;
	H_23b4ob1r.y = g_vInvShadowDepthTextureSize.x;
	vec2 H_omz8p81 = H_23b4ob1r + H_qdsg5k1.xy;
	vec3 H_9tojib1 = vec3(H_omz8p81.x, H_omz8p81.y, misc3a3);
	float H_f5t68b1 = textureLod(g_tShadowDepthTexture, H_9tojib1, C_0d0);
	vec4 H_c211vj1 = vec4(H_ykg8mj, H_1h6v5, H_gabb6n, H_f5t68b1);
	float flSum1 = dot(H_c211vj1, C_a1xzaw1);
	float flSum2 = flSum + flSum1;
	vec3 H_joe8tq = vec3(H_qdsg5k1.x, H_qdsg5k1.y, misc3a3);
	float flSum3 = textureLod(g_tShadowDepthTexture, H_joe8tq, C_0d0);
	float H_xchcee1 = flSum3 * C_0d205993;
	float flSum4 = H_xchcee1 + flSum2;
	vec3 H_k9xsqt1 = vec3(flSum4);
	float flDirectionalAmbientShadow = mix(C_1d0, flSum4, g_flGlobalLightAmbientShadowAmount);
	float flDirectOcclusionFactor = pow(C_1d0, C_1d85);
	float flDirectOcclusionFactor1 = mix(C_0d45, C_1d0, flDirectOcclusionFactor);
	float flIndirectOcclusionFactor = pow(C_1d0, C_2d1);
	vec3 H_fx1uua = vec3(g_flGlobalLightAmbientScale1);
	vec3 vDirectionalAmbientColor = H_fx1uua * g_vGlobalLightAmbientColor1;
	float H_kc8u2q = H_tzze0x.z * C_0d5;
	float H_461fcm1 = C_0d5 + H_kc8u2q;
	vec3 vShadowAmbientColor = mix(g_vGlobalLightAmbientColor3, g_vGlobalLightAmbientColor2, H_461fcm1);
	vec3 H_s7noda1 = vec3(g_flGlobalLightAmbientScale2);
	vec3 vShadowAmbientColor1 = H_s7noda1 * vShadowAmbientColor;
	float flLuminance = dot(vDirectionalAmbientColor, C_kfumqy1);
	vec3 H_t1lelu1 = vec3(flLuminance);
	float flLuminance1 = dot(vShadowAmbientColor1, C_kfumqy1);
	vec3 H_chpant1 = vec3(flLuminance1);
	vec3 vDirectionalAmbientColor1 = mix(vDirectionalAmbientColor, H_t1lelu1, vSpecular.zzz);
	vec3 vShadowAmbientColor2 = mix(vShadowAmbientColor1, H_chpant1, vSpecular.zzz);
	float H_2qbza9 = flSum4 * misc3a2;
	float H_hdj5p31 = H_2qbza9 * flDirectOcclusionFactor1;
	vec3 H_p4hsts = vec3(H_hdj5p31);
	vec3 vDirectLight = H_p4hsts * g_vGlobalLightColor;
	float vDirectionalAmbientLight = dot(g_vGlobalLightAmbientDir, H_tzze0x);
	float misc3a4 = clamp(vDirectionalAmbientLight, C_0d0, C_1d0);
	float H_ltwxfe = flDirectionalAmbientShadow * misc3a4;
	float H_i440gr1 = H_ltwxfe * flIndirectOcclusionFactor;
	vec3 H_9ndjlc = vec3(H_i440gr1);
	vec3 vDirectionalAmbientLight1 = H_9ndjlc * vDirectionalAmbientColor1;
	float H_5tfloa = C_1d0 - H_2qbza9;
	float H_fbszkj1 = H_5tfloa * flIndirectOcclusionFactor;
	vec3 H_dfnb911 = vec3(H_fbszkj1);
	vec3 vShadowAmbientLight = H_dfnb911 * vShadowAmbientColor2;
	vec3 H_8w78gv1 = vDirectLight + vDirectionalAmbientLight1;
	vec3 vLighting = H_8w78gv1 + vShadowAmbientLight;
	vec3 vLighted = H_za5uuj * vLighting;
	vec3 H_bcfwoi = vec3(g_flGlobalLightSpecularScale);
	vec3 H_knhpna = H_bcfwoi * flSpecularRGB;
	vec3 H_m3o57h = H_gsyr871 * H_knhpna;
	vec3 H_9xzwmj1 = H_k9xsqt1 * H_m3o57h;
	vec3 vLighted1 = H_9xzwmj1 + vLighted;
	vec3 vDiffuse1 = mix(vLighted1, H_za5uuj, vSpecular.y);
	float misc3a5 = clamp(flSpecular2, C_0d0, C_1d0);
	float H_1odp6j1 = misc3a5 * vSpecular.z;
	vec4 H_8emi851 = vec4(vDiffuse1.x, vDiffuse1.y, vDiffuse1.z, H_1odp6j1);
	PS_OUTPUT_gl_vColor = H_8emi851;
}
