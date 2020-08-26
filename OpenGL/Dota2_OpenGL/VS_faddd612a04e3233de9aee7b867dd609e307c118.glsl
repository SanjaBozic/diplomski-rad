//ATTRIBMAP-00-30-50-20-10-5D-xx
#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout(std140, binding = 12 ) uniform PerViewConstantBuffer_t {
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
layout(std140, binding = 13 ) uniform _Globals_ {
	vec2 g_vTexCoordScale;
	vec2 g_vTexCoordOffset;
} ;
layout(std140, binding = 14 ) uniform DotaGlobalParams_t {
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
layout(location=3) in uvec4 VS_INPUT_gl_vBlendIndices;
layout(location=4) in vec4 VS_INPUT_gl_vBlendWeight;
layout(location=5) in vec2 VS_INPUT_gl_vTransformTextureUV;
out gl_PerVertex {
	vec4 gl_Position;
	float gl_ClipDistance[1];
} ;
layout(location=0) out vec2 PS_INPUT_gl_vBaseTexCoord;
layout(location=1) out vec4 PS_INPUT_gl_vPositionWs_flLinearDepth;
layout(location=2) out vec4 PS_INPUT_gl_vNormalWs_flSpecularAmount;
layout(location=3) out vec4 PS_INPUT_gl_vVertexColor;
layout(location=4) out float PS_INPUT_gl_flClipPlaneDist;
const float C_0d0 = 0.0;
const int C_2 = 2;
const int C_8 = 8;
const float C_0d5 = 0.5;
const ivec2 C_ivec2p2ca0p = ivec2(2, 0);
const ivec2 C_ivec2p1ca0p = ivec2(1, 0);
const vec4 C_vec4p255d0p = vec4(255.0);
const vec4 C_avvsno = vec4(-128.0);
const vec4 C_vec4p0d0p = vec4(0.0);
const vec4 C_vec4pa64d0p = vec4(-64.0);
const vec4 C_vec4p63d0p = vec4(63.0);
const vec4 C_vec4p2d0p = vec4(2.0);
const vec4 C_vec4p1d0p = vec4(1.0);
const float C_1d0 = 1.0;
const float C_2d0 = 2.0;
const vec3 C_vec3p0d0p = vec3(0.0);
const float C_16d0 = 16.0;
const ivec2 C_ivec2p3ca0p = ivec2(3, 0);
void main()
{
	gl_ClipDistance[0] = C_0d0;
	int H_iu02zk1 = ivec4(VS_INPUT_gl_vBlendIndices).x << C_2;
	int H_pusuqs1 = H_iu02zk1 + C_8;
	float H_nwbnx31 = float(H_pusuqs1);
	float H_tmfqxf = H_nwbnx31 + C_0d5;
	float H_pik68t = H_tmfqxf * g_vInvGBufferSize.z;
	vec2 H_5f7u4m1 = vec2(H_pik68t, C_0d0);
	vec2 vBlendTransform0UV = H_5f7u4m1 + VS_INPUT_gl_vTransformTextureUV;
	float flWrapLines = floor(vBlendTransform0UV.x);
	float H_7mdp57 = vBlendTransform0UV.x - flWrapLines;
	float H_wgm8gx = flWrapLines * g_vInvGBufferSize.w;
	float H_06afd41 = H_wgm8gx + vBlendTransform0UV.y;
	vec2 H_crnj9e1 = vec2(H_7mdp57, H_06afd41);
	vec4 vMatObjectToWorldRow = textureLodOffset(g_tTransformTexture, H_crnj9e1, C_0d0, C_ivec2p2ca0p);
	vec4 vMatObjectToWorldRow1 = textureLodOffset(g_tTransformTexture, H_crnj9e1, C_0d0, C_ivec2p1ca0p);
	vec4 vMatObjectToWorldRow2 = textureLod(g_tTransformTexture, H_crnj9e1, C_0d0);
	vec4 vMatObjectToWorldRow3 = VS_INPUT_gl_vBlendWeight.xxxx * vMatObjectToWorldRow;
	vec4 vMatObjectToWorldRow4 = VS_INPUT_gl_vBlendWeight.xxxx * vMatObjectToWorldRow1;
	vec4 vMatObjectToWorldRow5 = VS_INPUT_gl_vBlendWeight.xxxx * vMatObjectToWorldRow2;
	int H_vwqhmc = ivec4(VS_INPUT_gl_vBlendIndices).y << C_2;
	int H_bheuh8 = C_8 + H_vwqhmc;
	float H_1y0o031 = float(H_bheuh8);
	float H_p432w41 = C_0d5 + H_1y0o031;
	float H_oos4t = H_p432w41 * g_vInvGBufferSize.z;
	vec2 H_0tllf5 = vec2(H_oos4t, C_0d0);
	vec2 vBlendTransform0UV1 = H_0tllf5 + VS_INPUT_gl_vTransformTextureUV;
	float flWrapLines1 = floor(vBlendTransform0UV1.x);
	float H_lbkazl1 = vBlendTransform0UV1.x - flWrapLines1;
	float H_bgf3c8 = flWrapLines1 * g_vInvGBufferSize.w;
	float H_yyulap1 = H_bgf3c8 + vBlendTransform0UV1.y;
	vec2 H_sg29b2 = vec2(H_lbkazl1, H_yyulap1);
	vec4 H_tmwdli1 = vec4(VS_INPUT_gl_vBlendWeight.y);
	vec4 vMatObjectToWorldRow6 = textureLod(g_tTransformTexture, H_sg29b2, C_0d0);
	vec4 H_svdh2 = H_tmwdli1 * vMatObjectToWorldRow6;
	vec4 vMatObjectToWorldRow7 = H_svdh2 + vMatObjectToWorldRow5;
	vec4 vTmp = textureLodOffset(g_tTransformTexture, H_sg29b2, C_0d0, C_ivec2p1ca0p);
	vec4 vTmp1 = textureLodOffset(g_tTransformTexture, H_sg29b2, C_0d0, C_ivec2p2ca0p);
	vec4 H_jid0w8 = H_tmwdli1 * vTmp;
	vec4 vMatObjectToWorldRow8 = H_jid0w8 + vMatObjectToWorldRow4;
	vec4 H_usujrj1 = H_tmwdli1 * vTmp1;
	vec4 vMatObjectToWorldRow9 = H_usujrj1 + vMatObjectToWorldRow3;
	vec4 vAnimationControlWord = textureLod(g_tTransformTexture, VS_INPUT_gl_vTransformTextureUV, C_0d0);
	vec4 param = VS_INPUT_gl_vNormalOs * C_vec4p255d0p;
	vec4 H_s4fazc1 = param + C_avvsno;
	bvec4 H_nqcyuo = lessThan(H_s4fazc1, C_vec4p0d0p);
	vec4 ztztSignBits = vec4(H_nqcyuo);
	vec4 xyxyAbs = abs(H_s4fazc1);
	vec4 xyxyAbs1 = xyxyAbs - ztztSignBits;
	vec4 H_0msvjm1 = xyxyAbs1 + C_vec4pa64d0p;
	bvec4 H_xidabx = lessThan(H_0msvjm1, C_vec4p0d0p);
	vec4 xyxySignBits = vec4(H_xidabx);
	vec4 normTan = abs(H_0msvjm1);
	vec4 H_if834f1 = normTan - xyxySignBits;
	vec4 normTan1 = H_if834f1 / C_vec4p63d0p;
	vec4 H_s1685x1 = xyxySignBits * C_vec4p2d0p;
	vec4 xyxySigns = C_vec4p1d0p - H_s1685x1;
	float H_lk9i08 = C_1d0 - normTan1.x;
	float H_dvpao91 = H_lk9i08 - normTan1.y;
	vec3 H_7olu74 = vec3(normTan1.x, normTan1.y, H_dvpao91);
	vec3 o_vNormalOs = normalize(H_7olu74);
	vec2 H_g1gr9q = o_vNormalOs.xy * xyxySigns.xy;
	float _L = ztztSignBits.x * C_2d0;
	float H_46brk31 = C_1d0 - _L;
	float H_8dugyy = H_46brk31 * o_vNormalOs.z;
	vec4 H_crrejn = vec4(H_g1gr9q.x, H_g1gr9q.y, H_8dugyy, C_0d0);
	float dotres = dot(H_crrejn, vMatObjectToWorldRow7);
	float dotres1 = dot(H_crrejn, vMatObjectToWorldRow8);
	float dotres2 = dot(H_crrejn, vMatObjectToWorldRow9);
	vec3 H_3cij4j1 = vec3(dotres, dotres1, dotres2);
	vec3 vNormalWs = normalize(H_3cij4j1);
	vec3 H_u8espd = VS_INPUT_gl_vPositionOs * vAnimationControlWord.zzz;
	vec4 H_2f7gnb = vec4(H_u8espd.x, H_u8espd.y, H_u8espd.z, C_1d0);
	float dotres3 = dot(H_2f7gnb, vMatObjectToWorldRow7);
	float dotres4 = dot(H_2f7gnb, vMatObjectToWorldRow8);
	float dotres5 = dot(H_2f7gnb, vMatObjectToWorldRow9);
	vec3 H_25kyhb = vec3(dotres3, dotres4, dotres5);
	vec2 H_wgjrmr = VS_INPUT_gl_vTexCoord * g_vTexCoordScale;
	vec2 H_pauxoy1 = H_wgjrmr + g_vTexCoordOffset;
	vec3 H_uktff21 = H_25kyhb - g_vCameraPositionWs;
	float H_tuff051 = dot(g_vCameraDirWs, H_uktff21);
	vec4 H_l3q6cr1 = vec4(dotres3, dotres4, dotres5, H_tuff051);
	vec4 H_ywfxcw = vec4(dotres3, dotres4, dotres5, C_1d0);
	float H_yzs5al1 = dot(H_ywfxcw, g_vClipPlane0);
	vec3 H_dgzhuw1 = normalize(H_uktff21);
	vec3 H_qf9c0z = C_vec3p0d0p - H_dgzhuw1;
	vec3 vReflectedLightDirWs = reflect(g_vGlobalLightDir, vNormalWs);
	float param1 = dot(H_qf9c0z, vReflectedLightDirWs);
	float misc3a = clamp(param1, C_0d0, C_1d0);
	float param2 = pow(misc3a, C_16d0);
	float misc3a1 = clamp(param2, C_0d0, C_1d0);
	vec4 H_tewgcl1 = vec4(vNormalWs.x, vNormalWs.y, vNormalWs.z, misc3a1);
	vec4 H_attytl1 = H_ywfxcw + g_vWorldToCameraOffset;
	float dotres6 = dot(H_attytl1, g_matWorldToProjection[0]);
	float dotres7 = dot(H_attytl1, g_matWorldToProjection[1]);
	float dotres8 = dot(H_attytl1, g_matWorldToProjection[2]);
	float dotres9 = dot(H_attytl1, g_matWorldToProjection[3]);
	vec4 vRet = textureLodOffset(g_tTransformTexture, VS_INPUT_gl_vTransformTextureUV, C_0d0, C_ivec2p3ca0p);
	PS_INPUT_gl_vBaseTexCoord = H_pauxoy1;
	PS_INPUT_gl_vPositionWs_flLinearDepth = H_l3q6cr1;
	PS_INPUT_gl_vNormalWs_flSpecularAmount = H_tewgcl1;
	PS_INPUT_gl_vVertexColor = vRet;
	PS_INPUT_gl_flClipPlaneDist = H_yzs5al1;
	float H_q212zt1 = C_0d0 - dotres7;
	float H_8665611 = C_2d0 * dotres8;
	float H_wyecv81 = H_8665611 - dotres9;
	vec4 H_dbr10s1 = vec4(dotres6, H_q212zt1, H_wyecv81, dotres9);
	gl_Position = H_dbr10s1;
	gl_ClipDistance[0] = H_yzs5al1;
}
