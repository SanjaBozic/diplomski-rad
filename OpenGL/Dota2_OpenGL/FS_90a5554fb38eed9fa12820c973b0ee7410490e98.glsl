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
layout( binding = 0 ) uniform sampler2D g_tGBufferDepth;
layout( binding = 1 ) uniform sampler2D g_tGBufferAlbedo;
layout( binding = 2 ) uniform sampler2D g_tGBufferNormalWs;
layout(std140, binding=0) uniform DeferredLocalLightConstants_t {
	vec3 g_vLightCenter;
	float g_flLightSize;
	vec4 g_vLightColor;
	float g_flLightIntensity;
	float g_flLightDistance;
	float g_flStartFalloff;
	float g_flDistanceFalloff;
	vec3 g_vLightDirection;
	float g_flRotationX;
	float g_flRotationY;
	float g_flFalloffCenter;
	float g_flFalloffRange;
	float g_flFalloffFinal;
	layout(row_major) mat4 g_matWorldToLightProjection;
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
uniform sampler2D g_tClouds;
uniform sampler2DShadow g_tShadowDepthTexture;
uniform sampler2D g_tSsao;
 uniform sampler2D g_tProjected;
layout(location=0) in vec3 PS_INPUT_gl_vPositionWs;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const float C_0d0 = 0.0;
const vec3 C_vec3pa0d5p = vec3(-0.5);
const vec3 C_vec3p2d0p = vec3(2.0);
void main()
{
	vec2 vScreenUv = g_vInvGBufferSize.xy * gl_FragCoord.xy;
	vec4 flLinearDepth = textureLod(g_tGBufferDepth, vScreenUv, C_0d0);
	vec3 H_6tbv721 = PS_INPUT_gl_vPositionWs - g_vCameraPositionWs;
	vec3 H_kkgz3m = normalize(H_6tbv721);
	float vScenePositionWs = dot(g_vCameraDirWs, H_kkgz3m);
	vec3 H_8tk53r1 = vec3(vScenePositionWs);
	vec3 param = H_kkgz3m / H_8tk53r1;
	vec3 H_6fqp2c1 = flLinearDepth.xxx * param;
	vec3 vPositionWs = H_6fqp2c1 + g_vCameraPositionWs;
	vec4 vDiffuse = textureLod(g_tGBufferAlbedo, vScreenUv, C_0d0);
	vec4 vNormal = textureLod(g_tGBufferNormalWs, vScreenUv, C_0d0);
	vec3 H_dk24o2 = vNormal.xyz + C_vec3pa0d5p;
	vec3 H_tzze0x = H_dk24o2 * C_vec3p2d0p;
	vec3 vDelta = g_vLightCenter - vPositionWs;
	float flDist = length(vDelta);
	vec3 vDelta1 = normalize(vDelta);
	float flDelta = g_flLightSize - flDist;
	bool H_ph05dr1 = flDelta < C_0d0;
	if (H_ph05dr1) {
		discard;
	}
	float flDot = dot(H_tzze0x, vDelta1);
	vec3 H_mm6ve7 = vec3(flDot);
	bool H_4de3lw1 = flDot < C_0d0;
	if (H_4de3lw1) {
		discard;
	}
	float flAmountOffcenter = flDelta / g_flLightSize;
	float flAmountOffcenter1 = smoothstep(C_0d0, g_flStartFalloff, flAmountOffcenter);
	vec3 H_igksiu = vec3(flAmountOffcenter1);
	vec3 H_gny2ju1 = g_vLightColor.xyz * vDiffuse.xyz;
	vec3 H_l2aqwk1 = H_gny2ju1 * H_igksiu;
	vec3 H_ymgm1y1 = H_l2aqwk1 * H_mm6ve7;
	vec3 H_6c3cdj = vec3(g_flLightIntensity);
	vec3 H_1j0esz = H_6c3cdj * H_ymgm1y1;
	vec4 H_t3268s1 = vec4(H_1j0esz.x, H_1j0esz.y, H_1j0esz.z, g_vLightColor.w);
	PS_OUTPUT_gl_vColor = H_t3268s1;
}
