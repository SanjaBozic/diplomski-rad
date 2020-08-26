//ATTRIBMAP-00-30-50-5D-xx
#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout(std140, binding = 13 ) uniform PerViewConstantBuffer_t {
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
layout( binding = 18 ) uniform sampler2D g_tTransformTexture;
layout(std140, binding = 12 ) uniform _Globals_ {
	vec4 g_vWindStrengthFreqMulHighStrength;
	vec3 g_vWindOffset;
	vec3 g_vWindDir;
	vec2 g_vTexCoordScale;
	vec2 g_vTexCoordOffset;
	float g_flWindFlexibility;
	float g_flWindLowFrequencyEffects;
	float g_flWindHighFrequencyEffects;
	float g_flWindSpeedMultiplier;
	float g_flWindLinearity;
} ;
layout( binding = 19 ) uniform sampler2D g_tWindNoise;
layout( binding = 20 ) uniform sampler2D g_tWindMask;
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
layout(location=0) in vec3 VS_INPUT_gl_vPositionOs;
layout(location=1) in vec4 VS_INPUT_gl_vNormalOs;
layout(location=2) in vec2 VS_INPUT_gl_vTexCoord;
layout(location=3) in vec2 VS_INPUT_gl_vTransformTextureUV;
out gl_PerVertex {
	vec4 gl_Position;
	float gl_ClipDistance[1];
} ;
layout(location=0) out vec2 PS_INPUT_gl_vBaseTexCoord;
const float C_0d0 = 0.0;
const ivec2 C_ivec2p1ca0p = ivec2(1, 0);
const ivec2 C_ivec2p2ca0p = ivec2(2, 0);
const float C_1d0 = 1.0;
const float C_0d007 = 0.007;
const vec2 C_oqsmhu = vec2(8192.0);
const float C_128d0 = 128.0;
const vec4 C_cjgqvy1 = vec4(0.125, 0.25, 1.0, 1.5);
const vec3 C_vec3p2d0p = vec3(2.0);
const vec3 C_vec3p1d0p = vec3(1.0);
const vec4 C_vec4p2d0p = vec4(2.0);
const vec4 C_vec4pa1d0p = vec4(-1.0);
const vec4 C_vec4p0d5p = vec4(0.5);
const vec4 C_vec4p3d0p = vec4(3.0);
const vec2 C_vec2p1d0p = vec2(1.0);
const vec2 C_vec2p512d0p = vec2(512.0);
const vec2 C_vec2p2d0p = vec2(2.0);
const vec2 C_vec2pa1d0p = vec2(-1.0);
const float C_2d0 = 2.0;
void main()
{
	gl_ClipDistance[0] = C_0d0;
	vec4 vMatObjectToWorldRow = textureLod(g_tTransformTexture, VS_INPUT_gl_vTransformTextureUV, C_0d0);
	vec4 vMatObjectToWorldRow1 = textureLodOffset(g_tTransformTexture, VS_INPUT_gl_vTransformTextureUV, C_0d0, C_ivec2p1ca0p);
	vec4 vMatObjectToWorldRow2 = textureLodOffset(g_tTransformTexture, VS_INPUT_gl_vTransformTextureUV, C_0d0, C_ivec2p2ca0p);
	vec4 H_ol7vfn1 = vec4(VS_INPUT_gl_vPositionOs.x, VS_INPUT_gl_vPositionOs.y, VS_INPUT_gl_vPositionOs.z, C_1d0);
	float dotres = dot(H_ol7vfn1, vMatObjectToWorldRow);
	float dotres1 = dot(H_ol7vfn1, vMatObjectToWorldRow1);
	float dotres2 = dot(H_ol7vfn1, vMatObjectToWorldRow2);
	vec3 H_3cij4j1 = vec3(dotres, dotres1, dotres2);
	vec2 H_wgjrmr = VS_INPUT_gl_vTexCoord * g_vTexCoordScale;
	vec2 H_pauxoy1 = H_wgjrmr + g_vTexCoordOffset;
	float flDeadZoneShift = g_vWindOffset.x * C_0d007;
	vec2 H_igq5ub = vec2(flDeadZoneShift);
	vec2 H_l9x8uv1 = vec2(dotres, dotres1);
	vec2 H_ni3l331 = H_l9x8uv1 / C_oqsmhu;
	vec2 H_k23rme = H_igq5ub + H_ni3l331;
	vec4 flDeadZoneWindMap = textureLod(g_tWindNoise, H_k23rme, C_0d0);
	float misc3a = clamp(flDeadZoneWindMap.x, C_0d0, C_1d0);
	float flModifiedFlexibility = g_flWindFlexibility * misc3a;
	vec2 H_cb82941 = vec2(flModifiedFlexibility);
	vec4 vWindMaskLowHigh = textureLod(g_tWindMask, H_pauxoy1, C_0d0);
	vec2 vWindMaskLowHigh1 = H_cb82941 * vWindMaskLowHigh.xy;
	float flHeightHigh = max(VS_INPUT_gl_vPositionOs.z, C_128d0);
	vec3 H_6i7fsg = vec3(flHeightHigh);
	float flLowFreqResponse = g_flWindLowFrequencyEffects * vWindMaskLowHigh1.x;
	float flHighFreqRespone = g_flWindHighFrequencyEffects * vWindMaskLowHigh1.y;
	vec4 H_8pmg03 = vec4(g_flWindSpeedMultiplier);
	vec4 vFrequencyValues = H_8pmg03 * C_cjgqvy1;
	vec4 H_i55j6q1 = vec4(flLowFreqResponse, flLowFreqResponse, flHighFreqRespone, flHighFreqRespone);
	vec3 H_l4ewzl = vec3(vMatObjectToWorldRow.w, vMatObjectToWorldRow1.w, vMatObjectToWorldRow2.w);
	vec3 vWindPos = mix(H_3cij4j1, H_l4ewzl, g_flWindLinearity);
	vec3 param = vWindPos * C_vec3p2d0p;
	vec3 H_aiaonl = param;
	H_aiaonl.z = C_0d0;
	vec3 H_i8fujz = H_aiaonl * g_vWindStrengthFreqMulHighStrength.zzz;
	vec3 H_4h915t1 = H_i8fujz + g_vWindOffset;
	float vNewPosition = dot(H_4h915t1, C_vec3p1d0p);
	vec4 H_dsmngs = vec4(H_4h915t1.x, H_4h915t1.y, H_4h915t1.z, vNewPosition);
	vec4 param1 = H_dsmngs * vFrequencyValues;
	vec4 H_cb84n3 = fract(param1);
	vec4 H_ehupjp = H_cb84n3 * C_vec4p2d0p;
	vec4 vWaves = H_ehupjp + C_vec4pa1d0p;
	vec4 param2 = vWaves + C_vec4p0d5p;
	vec4 H_30pd531 = fract(param2);
	vec4 H_idalqo = C_vec4p2d0p * H_30pd531;
	vec4 H_706h0p = C_vec4pa1d0p + H_idalqo;
	vec4 H_0l4lsb1 = abs(H_706h0p);
	vec4 H_5a1nuv1 = H_0l4lsb1 * H_0l4lsb1;
	vec4 H_c70wos = C_vec4p2d0p * H_0l4lsb1;
	vec4 H_lkca2h1 = C_vec4p3d0p - H_c70wos;
	vec4 H_m1iai11 = H_5a1nuv1 * H_lkca2h1;
	vec4 vWaves1 = H_i55j6q1 * H_m1iai11;
	float flAmplitudeLow = dot(vWaves1.xy, C_vec2p1d0p);
	float flAmplitudeLow1 = flAmplitudeLow * g_vWindStrengthFreqMulHighStrength.x;
	vec3 H_bj2cx11 = vec3(flAmplitudeLow1);
	float flAmplitudeHigh = dot(vWaves1.zw, C_vec2p1d0p);
	float flAmplitudeHigh1 = flAmplitudeHigh * g_vWindStrengthFreqMulHighStrength.w;
	vec3 H_f3z8vc1 = vec3(flAmplitudeHigh1);
	vec2 H_0imhon1 = param.xy / C_vec2p512d0p;
	vec4 vNoise = textureLod(g_tWindNoise, H_0imhon1, C_0d0);
	vec2 H_c8zlz51 = vNoise.xy * C_vec2p2d0p;
	vec2 vNoise1 = H_c8zlz51 + C_vec2pa1d0p;
	vec3 H_yuecjn1 = vec3(vNoise1.x, vNoise1.y, C_0d0);
	vec3 H_qmlh6w1 = C_vec3p2d0p * H_yuecjn1;
	vec3 H_ufnfai1 = H_qmlh6w1 + g_vWindDir;
	vec3 vWindDirHigh = normalize(H_ufnfai1);
	vec3 H_ugqkwf1 = H_bj2cx11 * g_vWindDir;
	vec3 H_4tqpq41 = H_ugqkwf1 * VS_INPUT_gl_vPositionOs.zzz;
	vec3 H_2jap501 = H_f3z8vc1 * vWindDirHigh;
	vec3 H_g1gb2q1 = H_2jap501 * H_6i7fsg;
	vec3 vSkew = H_4tqpq41 + H_g1gb2q1;
	vec3 vPositionWs = H_3cij4j1 + vSkew;
	vec4 H_vhymbl = vec4(vPositionWs.x, vPositionWs.y, vPositionWs.z, C_1d0);
	vec4 H_w5uycy1 = H_vhymbl + g_vWorldToCameraOffset;
	float dotres3 = dot(H_w5uycy1, g_matWorldToProjection[0]);
	float dotres4 = dot(H_w5uycy1, g_matWorldToProjection[1]);
	float dotres5 = dot(H_w5uycy1, g_matWorldToProjection[2]);
	float dotres6 = dot(H_w5uycy1, g_matWorldToProjection[3]);
	PS_INPUT_gl_vBaseTexCoord = H_pauxoy1;
	float H_rdf2pt1 = C_0d0 - dotres4;
	float H_rrbnew1 = dotres5 * C_2d0;
	float H_36c2hm1 = H_rrbnew1 - dotres6;
	vec4 H_6n8lpq1 = vec4(dotres3, H_rdf2pt1, H_36c2hm1, dotres6);
	gl_Position = H_6n8lpq1;
}