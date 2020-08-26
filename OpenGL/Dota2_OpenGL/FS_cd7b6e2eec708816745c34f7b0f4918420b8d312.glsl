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
layout( binding = 0 ) uniform sampler2D g_tScrollSpeed;
layout(std140, binding = 0 ) uniform _Globals_ {
	float g_flBumpStrength;
	float g_flOpacityScale;
	vec3 g_vColorTint;
	vec3 g_vColorTint2;
	float g_flSpecularBloom;
	float g_flSpecularIntensity;
	vec2 g_vScrollUvDirection;
	float g_flScrollUvSpeed;
	float g_flAlphaAnglePower;
	float g_flOverbrightFactor;
	vec2 g_vTexCoordScale;
} ;
layout( binding = 1 ) uniform sampler2D g_tColor;
layout( binding = 2 ) uniform sampler2D g_tSpecular;
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
const float C_1d0 = 1.0;
const float C_a1d0 = -1.0;
const vec3 C_vec3p0d0p = vec3(0.0);
const float C_0d0 = 0.0;
void main()
{
	float i = gl_FrontFacing ? C_1d0 : C_a1d0;
	vec3 H_48fig1 = vec3(i);
	vec3 H_urrma8 = H_48fig1 * PS_INPUT_gl_vNormalWs_flSpecularAmount.xyz;
	vec3 vGeometricNormalWs = normalize(H_urrma8);
	vec4 flScrollSpeedFromTexture = texture(g_tScrollSpeed, PS_INPUT_gl_vBaseTexCoord);
	vec2 H_xxdgdf = flScrollSpeedFromTexture.yy * g_vScrollUvDirection;
	vec2 H_nfqz1i = vec2(g_flScrollUvSpeed);
	vec2 H_fai554 = H_nfqz1i * H_xxdgdf;
	vec2 H_ts6vqy1 = vec2(g_flTime);
	vec2 vDiffuseOnlyOffset = H_fai554 * H_ts6vqy1;
	vec2 H_91ppum1 = PS_INPUT_gl_vBaseTexCoord + vDiffuseOnlyOffset;
	vec4 vDiffuse = texture(g_tColor, H_91ppum1);
	vec3 H_ysarle = g_vColorTint * vDiffuse.xyz;
	vec4 H_xgyfl71 = vDiffuse;
	H_xgyfl71.xyz = H_ysarle.xyz;
	vec4 vDiffuse1 = H_xgyfl71 * PS_INPUT_gl_vVertexColor;
	vec4 vSpecular = texture(g_tSpecular, PS_INPUT_gl_vBaseTexCoord);
	float H_i0xhec = g_flSpecularIntensity * vSpecular.x;
	float flTranslucency = PS_INPUT_gl_vVertexColor.w * flScrollSpeedFromTexture.w;
	float flTranslucency1 = flTranslucency * g_flOpacityScale;
	float flTranslucency2 = dot(g_vCameraDirWs, vGeometricNormalWs);
	float flTranslucency3 = abs(flTranslucency2);
	float flTranslucency4 = pow(flTranslucency3, g_flAlphaAnglePower);
	float flTranslucency5 = flTranslucency1 * flTranslucency4;
	vec3 H_8mjky01 = PS_INPUT_gl_vPositionWs_flLinearDepth.xyz - g_vCameraPositionWs;
	vec3 H_i1nbjv1 = normalize(H_8mjky01);
	vec3 H_t3ywhi1 = C_vec3p0d0p - H_i1nbjv1;
	vec3 vReflect = reflect(H_t3ywhi1, vGeometricNormalWs);
	float flSpecular = dot(g_vGlobalLightSpecularDir, vReflect);
	float misc3a = clamp(flSpecular, C_0d0, C_1d0);
	float flSpecular1 = pow(misc3a, g_flGlobalLightSpecularExp);
	float flSpecular2 = H_i0xhec * flSpecular1;
	vec3 H_s6408y = vec3(flSpecular2);
	vec3 flSpecularRGB = H_s6408y * g_vGlobalLightSpecularColor;
	float misc3a1 = clamp(g_flGlobalLightSpecularIndependence, C_0d0, C_1d0);
	vec3 H_gsyr871 = vec3(misc3a1);
	float H_euv0u1 = C_1d0 - misc3a1;
	vec3 H_0pogms1 = vec3(H_euv0u1);
	vec3 H_p2p5k7 = H_0pogms1 * flSpecularRGB;
	vec3 H_4ml3bj = H_p2p5k7 + vDiffuse1.xyz;
	vec3 H_bcfwoi = vec3(g_flGlobalLightSpecularScale);
	vec3 H_knhpna = H_bcfwoi * flSpecularRGB;
	vec3 H_m3o57h = H_gsyr871 * H_knhpna;
	vec3 H_jxb07r = H_4ml3bj + H_m3o57h;
	vec3 H_eqbz9z = vec3(g_flOverbrightFactor);
	vec3 H_tg7l6y = H_eqbz9z * H_jxb07r;
	vec4 H_9x0re91 = vec4(H_tg7l6y.x, H_tg7l6y.y, H_tg7l6y.z, flTranslucency5);
	PS_OUTPUT_gl_vDiffuse = H_9x0re91;
	PS_OUTPUT_gl_flDepth = PS_INPUT_gl_vPositionWs_flLinearDepth.wwww;
}