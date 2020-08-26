#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
struct PointLight_t {
	vec3 vPositionWs;
	float flInvRadius;
	vec3 vValue;
	float flLinearFalloff;
	float flQuadraticFalloff;
	float flLightSourceDimension0;
	float flLightSourceDimension1;
	float flPad;
};
struct SpotLight_t {
	vec3 vPositionWs;
	float flInvRadius;
	vec3 vValue;
	float flLinearFalloff;
	float flQuadraticFalloff;
	float flLightSourceDimension0;
	float flLightSourceDimension1;
	float flThetaDot;
	vec3 vDirectionWs;
	float flPhiDot;
	int nCookieSequenceId;
	float flAnimStartTime;
	float flAnimLifeSpan;
	float flSequenceAnimScale;
};
struct ShadowedSpotLight_t {
	vec3 vPositionWs;
	float flInvRadius;
	vec3 vValue;
	float flLinearFalloff;
	float flQuadraticFalloff;
	float flLightSourceDimension0;
	float flLightSourceDimension1;
	float flThetaDot;
	vec3 vDirectionWs;
	float flPhiDot;
	vec4 vShadowMapBiasAndScale;
	int nCookieSequenceId;
	float flAnimStartTime;
	float flAnimLifeSpan;
	float flSequenceAnimScale;
};
struct EnvMapLight_t {
	vec3 vWorldToLocalRow0;
	float flOriginX;
	vec3 vWorldToLocalRow1;
	float flOriginY;
	vec3 vWorldToLocalRow2;
	float flOriginZ;
	vec3 vBoxMins;
	float flRadius;
	vec3 vBoxMaxs;
	int nEnvProbeId;
};
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
layout(std140, binding = 0 ) uniform _Globals_ {
	float g_flBumpStrength;
	float g_flIndirectContrastBoost;
	vec3 g_vTransmissiveColorTint;
	float g_flTransmissiveColorBoost;
	float g_flTransmissiveSoftness;
	float g_flIndirectFresnelReflectance;
	float g_flIndirectFresnelExponent;
	vec3 g_vColorTint;
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
uniform sampler2D g_tIrradianceProbes;
uniform sampler2D g_tIrradianceSampleParams;
layout(std140) uniform IrradTextureActiveRectCB {
	vec4 g_vInvIrradTexDim;
} ;
layout(std140) uniform SunLightShaderParamsCB {
	vec4 g_vSunLightColor;
	vec3 g_vSunLightDir;
	float g_flSunNormalizedRadius;
	vec4 g_vSunTexParams;
	vec4 g_vSunTexParams2;
	vec4 g_vSunTexParams3;
	layout(row_major) mat4 g_matWorldToShadowTexMatrices[4];
	vec4 g_vCascadeAtlasUVOffsets[4];
	vec4 g_flCascadeViewShadowBiasScales[4];
} ;
layout(std140) uniform PerBatchLightProbeVolumeConstantBuffer_t {
	layout(row_major) mat4x3 g_matLightProbeVolumeWorldToLocal;
	vec4 g_vLightProbeVolumeLayer0TextureMin;
	vec4 g_vLightProbeVolumeLayer0TextureMax;
	vec4 g_vLightProbeVolumeColor;
} ;
uniform sampler3D g_tLightProbeVolumeTexture;
uniform sampler3D g_tLightProbeVolumeTextureDirectLightIndices;
uniform sampler3D g_tLightProbeVolumeTextureDirectLightScalars;
uniform sampler2D g_tTotalLightBuffer;
uniform sampler2D g_tLightDepthBuffer;
uniform sampler2D g_tSheetTexture;
uniform sampler2D g_tLightCookieTexture;
layout(std140) uniform PerViewLightData_t {
	PointLight_t g_pointLightData[128];
	SpotLight_t g_spotLightData[128];
	ShadowedSpotLight_t g_shadowedSpotLightData[128];
	EnvMapLight_t g_envMapData[128];
} ;
layout(location=0) in vec4 PS_INPUT_gl_vPositionCs;
layout(location=1) in vec3 PS_INPUT_gl_vPositionWs;
layout(location=2) in vec4 PS_INPUT_gl_vVertexColor;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
void main()
{
	vec3 vAlbedo = PS_INPUT_gl_vVertexColor.xyz * g_vColorTint;
	vec3 H_48eakq = vec3(g_flToneMapScalarLinear);
	vec3 H_7sw7zq1 = H_48eakq * vAlbedo;
	vec3 H_1eh7c21 = H_7sw7zq1 * PS_INPUT_gl_vVertexColor.www;
	vec4 H_7xp82d = PS_INPUT_gl_vVertexColor;
	H_7xp82d.xyz = H_1eh7c21.xyz;
	PS_OUTPUT_gl_vColor = H_7xp82d;
}
