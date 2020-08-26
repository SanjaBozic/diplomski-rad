#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout(std140) uniform PerViewConstantBuffer_t {
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
layout( binding = 0 ) uniform sampler2D g_tColor;
layout(std140, binding = 0 ) uniform _Globals_ {
	float g_flBumpStrength;
	vec3 g_vColorTint;
	vec3 g_vColorTint2;
	vec2 g_vTexCoordScale;
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
uniform sampler2DShadow g_tShadowDepthTexture;
uniform sampler2D g_tTintMask;
layout(location=0) in vec2 PS_INPUT_gl_vBaseTexCoord;
layout(location=1) in vec4 PS_INPUT_gl_vPositionWs_flLinearDepth;
layout(location=2) in vec4 PS_INPUT_gl_vNormalWs_flSpecularAmount;
layout(location=3) in vec4 PS_INPUT_gl_vVertexColor;
layout(location=4) in float PS_INPUT_gl_flClipPlaneDist;
layout(location=0) out vec4 PS_OUTPUT_gl_vDiffuse;
layout(location=1) out vec4 PS_OUTPUT_gl_flDepth;
const vec3 C_vec3p0d0p = vec3(0.0);
const float C_0d0 = 0.0;
const float C_1d0 = 1.0;
const vec4 C_xx1m2m1 = vec4(0.0, 0.0, 0.0, 1.0);
void main()
{
	vec4 vDiffuse = texture(g_tColor, PS_INPUT_gl_vBaseTexCoord);
	vec3 H_ysarle = g_vColorTint * vDiffuse.xyz;
	vec4 H_xgyfl71 = vDiffuse;
	H_xgyfl71.xyz = H_ysarle.xyz;
	vec4 vDiffuse1 = H_xgyfl71 * PS_INPUT_gl_vVertexColor;
	vec3 flSpecularRGB = g_vGlobalLightSpecularColor * C_vec3p0d0p;
	float misc3a = clamp(g_flGlobalLightSpecularIndependence, C_0d0, C_1d0);
	vec3 H_lzb5nn1 = vec3(misc3a);
	float H_fhpmz7 = C_1d0 - misc3a;
	vec3 H_w9ymz71 = vec3(H_fhpmz7);
	vec3 H_sjwlw1 = H_w9ymz71 * flSpecularRGB;
	vec3 H_5oud2g1 = H_sjwlw1 + vDiffuse1.xyz;
	vec3 H_bcfwoi = vec3(g_flGlobalLightSpecularScale);
	vec3 H_knhpna = H_bcfwoi * flSpecularRGB;
	vec3 H_7yvyei1 = H_knhpna * H_lzb5nn1;
	vec3 H_x4b0091 = H_5oud2g1 + H_7yvyei1;
	vec4 H_rwwpo7 = C_xx1m2m1;
	H_rwwpo7.xyz = H_x4b0091.xyz;
	PS_OUTPUT_gl_vDiffuse = H_rwwpo7;
	PS_OUTPUT_gl_flDepth = PS_INPUT_gl_vPositionWs_flLinearDepth.wwww;
}
