#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout( binding = 0 ) uniform sampler2D g_tInputTexture;
layout( binding = 1 ) uniform sampler3D g_tColorWarp3D;
layout(std140, binding = 0 ) uniform _Globals_ {
	vec4 g_vInvTextureDim;
	float g_flColorWarpBlendFactor;
	float g_flGreyScale;
	vec4 g_vFadeColor;
} ;
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
layout(location=0) in vec2 PS_INPUT_gl_vTexCoord;
layout(location=1) in vec4 PS_INPUT_gl_vColor;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const vec3 C_j1b5gn = vec3(0.4545);
const vec3 C_shpsoq1 = vec3(0.3, 0.59, 0.11);
const vec3 C_vec3p2d2p = vec3(2.2);
void main()
{
	vec4 vSrcTexel = texture(g_tInputTexture, PS_INPUT_gl_vTexCoord);
	vec3 vTexCoord3D = pow(vSrcTexel.xyz, C_j1b5gn);
	vec4 vColorCorrected = texture(g_tColorWarp3D, vTexCoord3D);
	vec3 H_tbq5bo1 = mix(vSrcTexel.xyz, vColorCorrected.xyz, g_flColorWarpBlendFactor);
	float flGreyScale = dot(H_tbq5bo1, C_shpsoq1);
	vec3 H_65kkc1 = vec3(flGreyScale);
	vec3 H_s7wiec1 = mix(H_tbq5bo1, H_65kkc1, g_flGreyScale);
	vec3 H_sxho69 = mix(H_s7wiec1, g_vFadeColor.xyz, g_vFadeColor.w);
	vec3 H_ma9gjo = H_sxho69 * PS_INPUT_gl_vColor.xyz;
	vec3 H_5hpv6b = pow(H_ma9gjo, C_vec3p2d2p);
	vec4 H_b7m2kv1 = vSrcTexel;
	H_b7m2kv1.xyz = H_5hpv6b.xyz;
	PS_OUTPUT_gl_vColor = H_b7m2kv1;
}
