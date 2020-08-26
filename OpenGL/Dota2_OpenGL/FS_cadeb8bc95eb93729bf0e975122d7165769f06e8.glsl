#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout( binding = 0 ) uniform sampler2D g_tGBufferNormalWs;
layout(std140, binding = 0 ) uniform _Globals_ {
	vec4 g_vInvSsaoTextureSize;
	vec4 g_vInvWidthHeight0;
	vec4 g_vInvWidthHeight1;
	vec4 g_vInvWidthHeight2;
	vec4 g_vInvWidthHeight3;
} ;
layout( binding = 1 ) uniform sampler2D g_tGBufferDepth;
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
layout(std140) uniform DotaGlobalParams_t {
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
uniform sampler2D g_tFow;
uniform sampler2D g_tFrameBufferCopyTexture;
uniform sampler2D g_tDepthTexture;
uniform sampler2D g_tGBufferAlbedo;
uniform sampler2D g_tGBufferLightingTerms;
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
uniform sampler2D g_tSsao;
uniform sampler2D g_tSsaoBuffer;
layout(location=0) in vec2 PS_INPUT_gl_vTexCoord;
layout(location=1) in vec3 PS_INPUT_gl_vCameraToFarPlaneDirWs;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const vec2 C_vec2p0d5p = vec2(0.5);
const vec2 C_a1z03r = vec2(0.0, 0.0);
const float C_65535d0 = 65535.0;
const float C_0d00390625 = 0.00390625;
const float C_256d0 = 256.0;
const float C_255d0 = 255.0;
void main()
{
	vec4 vNormal = texture(g_tGBufferNormalWs, PS_INPUT_gl_vTexCoord);
	vec2 H_vw8ekf1 = g_vInvWidthHeight1.yw * C_vec2p0d5p;
	vec2 vTexCoords = H_vw8ekf1 + PS_INPUT_gl_vTexCoord;
	vec2 H_23b4ob1 = C_a1z03r;
	H_23b4ob1.y = g_vInvWidthHeight0.w;
	vec2 H_jxlmdf1 = H_23b4ob1 + vTexCoords;
	vec4 vMinDepth = texture(g_tGBufferDepth, H_jxlmdf1);
	vec2 H_omfjny = g_vInvWidthHeight0.xw + vTexCoords;
	vec4 vMinDepth1 = texture(g_tGBufferDepth, H_omfjny);
	vec2 H_zwira6 = g_vInvWidthHeight0.yw + vTexCoords;
	vec4 vMinDepth2 = texture(g_tGBufferDepth, H_zwira6);
	vec2 H_2o0p37 = g_vInvWidthHeight0.zw + vTexCoords;
	vec4 vMinDepth3 = texture(g_tGBufferDepth, H_2o0p37);
	vec4 H_kt15aq = vec4(vMinDepth.x, vMinDepth1.x, vMinDepth2.x, vMinDepth3.x);
	vec2 H_23b4ob1r = C_a1z03r;
	H_23b4ob1r.y = g_vInvWidthHeight1.w;
	vec2 H_3dauig = H_23b4ob1r + vTexCoords;
	vec4 vDepth = texture(g_tGBufferDepth, H_3dauig);
	vec2 H_nw8siw1 = g_vInvWidthHeight1.xw + vTexCoords;
	vec4 vDepth1 = texture(g_tGBufferDepth, H_nw8siw1);
	vec2 H_ojzo33 = g_vInvWidthHeight1.yw + vTexCoords;
	vec4 vDepth2 = texture(g_tGBufferDepth, H_ojzo33);
	vec2 H_lpbpes = g_vInvWidthHeight1.zw + vTexCoords;
	vec4 vDepth3 = texture(g_tGBufferDepth, H_lpbpes);
	vec4 H_w69yqu1 = vec4(vDepth.x, vDepth1.x, vDepth2.x, vDepth3.x);
	vec4 vMinDepth4 = min(H_kt15aq, H_w69yqu1);
	vec4 vDepth4 = texture(g_tGBufferDepth, vTexCoords);
	vec2 H_ehkh8f = g_vInvWidthHeight2.xw + vTexCoords;
	vec4 vDepth5 = texture(g_tGBufferDepth, H_ehkh8f);
	vec2 H_9z2ua8 = g_vInvWidthHeight2.yw + vTexCoords;
	vec4 vDepth6 = texture(g_tGBufferDepth, H_9z2ua8);
	vec2 H_4f11uo1 = g_vInvWidthHeight2.zw + vTexCoords;
	vec4 vDepth7 = texture(g_tGBufferDepth, H_4f11uo1);
	vec4 H_8t2rmw = vec4(vDepth4.x, vDepth5.x, vDepth6.x, vDepth7.x);
	vec4 vMinDepth5 = min(vMinDepth4, H_8t2rmw);
	vec2 H_23b4ob1rr = C_a1z03r;
	H_23b4ob1rr.y = g_vInvWidthHeight3.w;
	vec2 H_bb5h3x = H_23b4ob1rr + vTexCoords;
	vec4 vDepth8 = texture(g_tGBufferDepth, H_bb5h3x);
	vec2 H_dfdlp8 = g_vInvWidthHeight3.xw + vTexCoords;
	vec4 vDepth9 = texture(g_tGBufferDepth, H_dfdlp8);
	vec2 H_ave6np1 = g_vInvWidthHeight3.yw + vTexCoords;
	vec4 vDeptha = texture(g_tGBufferDepth, H_ave6np1);
	vec2 H_j1tbhq = g_vInvWidthHeight3.zw + vTexCoords;
	vec4 vDepthb = texture(g_tGBufferDepth, H_j1tbhq);
	vec4 H_c5y8az = vec4(vDepth8.x, vDepth9.x, vDeptha.x, vDepthb.x);
	vec4 vMinDepth6 = min(vMinDepth5, H_c5y8az);
	vec2 vMinDepth7 = min(vMinDepth6.xy, vMinDepth6.zw);
	float flDepth = min(vMinDepth7.x, vMinDepth7.y);
	float param = flDepth / g_flFarPlane;
	float H_yc25iq = param * C_65535d0;
	float H_0g09d21 = floor(H_yc25iq);
	float H_6n260n = H_0g09d21 * C_0d00390625;
	float H_j8w6j5 = floor(H_6n260n);
	float H_jov6k71 = H_j8w6j5 * C_256d0;
	float H_b0istw = H_0g09d21 - H_jov6k71;
	float H_9gnuqq1 = H_j8w6j5 / C_255d0;
	float H_crru9g = H_b0istw / C_255d0;
	vec4 H_dmwtc5 = vec4(H_9gnuqq1, H_crru9g, vNormal.x, vNormal.y);
	PS_OUTPUT_gl_vColor = H_dmwtc5;
}