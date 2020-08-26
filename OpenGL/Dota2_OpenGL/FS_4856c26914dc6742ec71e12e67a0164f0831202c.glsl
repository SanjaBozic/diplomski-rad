#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
struct PS_INPUT {
	vec4 member0;
	vec4 member1;
	vec4 member2;
	vec3 member3;
	vec4 member4;
	vec4 member5;
	vec4 member6;
	vec3 member7;
	vec4 member8;
};
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
layout( binding = 0 ) uniform sampler2D g_tGBufferDepth;
layout( binding = 1 ) uniform sampler2D g_tColor;
layout(std140) uniform _Globals_ {
	float g_flBumpStrength;
	float g_flSolidRange;
	float g_flAlphaRange;
	float g_flFalloffCenter;
	float g_flFalloffRange;
	float g_flFalloffFinal;
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
uniform sampler2D g_tSsao;
layout(location=0) in vec4 PS_INPUT_gl_vDecalOriginWsAndOther;
layout(location=1) in vec4 PS_INPUT_gl_vDecalRightWsAndAlpha;
layout(location=2) in vec4 PS_INPUT_gl_vDecalUpWsAndBlendAlbedo;
layout(location=3) in vec3 PS_INPUT_gl_vDecalForwardWs;
layout(location=4) in vec4 PS_INPUT_gl_vAlbedoRect0;
layout(location=5) in vec4 PS_INPUT_gl_vAlbedoRect1;
layout(location=6) in vec4 PS_INPUT_gl_vTintColor;
layout(location=7) in vec3 PS_INPUT_gl_vPositionWs;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const float C_0d0 = 0.0;
const float C_1d0 = 1.0;
const vec2 C_vec2p1d0p = vec2(1.0);
void main()
{
	PS_INPUT param;
	PS_INPUT mainIn;
	mainIn.member0 = PS_INPUT_gl_vDecalOriginWsAndOther;
	mainIn.member1 = PS_INPUT_gl_vDecalRightWsAndAlpha;
	mainIn.member2 = PS_INPUT_gl_vDecalUpWsAndBlendAlbedo;
	mainIn.member3 = PS_INPUT_gl_vDecalForwardWs;
	mainIn.member4 = PS_INPUT_gl_vAlbedoRect0;
	mainIn.member5 = PS_INPUT_gl_vAlbedoRect1;
	mainIn.member6 = PS_INPUT_gl_vTintColor;
	mainIn.member7 = PS_INPUT_gl_vPositionWs;
	mainIn.member8 = gl_FragCoord;
	vec2 vScreenUv = g_vInvGBufferSize.xy * mainIn.member8.xy;
	vec4 flLinearDepth = textureLod(g_tGBufferDepth, vScreenUv, C_0d0);
	vec3 H_zub2nr1 = mainIn.member7 - g_vCameraPositionWs;
	vec3 H_2pixju1 = normalize(H_zub2nr1);
	float vScenePositionWs = dot(g_vCameraDirWs, H_2pixju1);
	vec3 H_8tk53r1 = vec3(vScenePositionWs);
	vec3 param1 = H_2pixju1 / H_8tk53r1;
	vec3 H_59kv4w1 = flLinearDepth.xxx * param1;
	vec3 vPositionWs = H_59kv4w1 + g_vCameraPositionWs;
	vec3 vDelta = vPositionWs - mainIn.member0.xyz;
	float vDecalSpace = dot(vDelta, mainIn.member1.xyz);
	float vDecalSpace1 = dot(vDelta, mainIn.member2.xyz);
	float H_593wgv = C_1d0 - vDecalSpace1;
	vec2 H_1gg7yu = vec2(vDecalSpace, H_593wgv);
	bool H_2u94of1 = vDecalSpace < C_0d0;
	if (H_2u94of1) {
		discard;
	}
	bool H_bgtg2v1 = H_593wgv < C_0d0;
	if (H_bgtg2v1) {
		discard;
	}
	vec2 param2 = C_vec2p1d0p - H_1gg7yu;
	bool H_4iw9bd = param2.x < C_0d0;
	if (H_4iw9bd) {
		discard;
	}
	bool H_7m3lhw = param2.y < C_0d0;
	if (H_7m3lhw) {
		discard;
	}
	vec2 H_dhd49l1 = H_1gg7yu * mainIn.member4.zw;
	vec2 vUVAlbedo = H_dhd49l1 + mainIn.member4.xy;
	vec2 H_gv8qgi1 = H_1gg7yu * mainIn.member5.zw;
	vec2 vUVAlbedo1 = H_gv8qgi1 + mainIn.member5.xy;
	vec4 vAlbedoAndAlpha = texture(g_tColor, vUVAlbedo);
	vec4 vAlbedoAndAlpha1 = texture(g_tColor, vUVAlbedo1);
	vec4 vAlbedoAndAlpha2 = mix(vAlbedoAndAlpha, vAlbedoAndAlpha1, mainIn.member2.w);
	vec3 H_tk8hg6 = mainIn.member6.xyz * vAlbedoAndAlpha2.xyz;
	float H_hwgvo4 = mainIn.member6.w * vAlbedoAndAlpha2.w;
	vec4 H_wj9gut1 = vec4(H_tk8hg6.x, H_tk8hg6.y, H_tk8hg6.z, H_hwgvo4);
	PS_OUTPUT_gl_vColor = H_wj9gut1;
}