#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout( binding = 0 ) uniform sampler2D g_tSourceMorphAtlas;
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
layout(location=0) in vec4 PS_INPUT_gl_vOffsetsPositionSpeed;
layout(location=1) in vec4 PS_INPUT_gl_vRangesPositionSpeed;
layout(location=2) in vec2 PS_INPUT_gl_vWeights;
layout(location=3) in vec4 PS_INPUT_gl_vTexCoords;
layout(location=4) in vec4 PS_INPUT_gl_vOffsetsNormalWrinkle;
layout(location=5) in vec4 PS_INPUT_gl_vRangesNormalWrinkle;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const float C_1d0 = 1.0;
void main()
{
	vec4 vPositionSpeed = texture(g_tSourceMorphAtlas, PS_INPUT_gl_vTexCoords.xy);
	float _L = PS_INPUT_gl_vRangesPositionSpeed.w * vPositionSpeed.w;
	float H_9mclns = PS_INPUT_gl_vOffsetsPositionSpeed.w + _L;
	float H_stt584 = C_1d0 - H_9mclns;
	float H_e75599 = H_stt584 * PS_INPUT_gl_vWeights.x;
	float H_ngol3a = H_9mclns * PS_INPUT_gl_vWeights.y;
	float flFinalWeight = H_e75599 + H_ngol3a;
	vec4 H_gpsfbe1 = vec4(flFinalWeight);
	vec4 vNormalWrinkle = texture(g_tSourceMorphAtlas, PS_INPUT_gl_vTexCoords.zw);
	vec4 H_i3o3pk1 = PS_INPUT_gl_vRangesNormalWrinkle * vNormalWrinkle;
	vec4 vNormalWrinkle1 = H_i3o3pk1 + PS_INPUT_gl_vOffsetsNormalWrinkle;
	vec4 H_udl60f1 = H_gpsfbe1 * vNormalWrinkle1;
	PS_OUTPUT_gl_vColor = H_udl60f1;
}
