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
layout(location=5) out vec4 PS_INPUT_gl_vTangentUWs_flTangentVSign;
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
const float C_0d007 = 0.007;
const vec2 C_oqsmhu = vec2(8192.0);
const float C_128d0 = 128.0;
const vec4 C_cjgqvy1 = vec4(0.125, 0.25, 1.0, 1.5);
const vec3 C_vec3p2d0p = vec3(2.0);
const vec3 C_vec3p1d0p = vec3(1.0);
const vec4 C_vec4pa1d0p = vec4(-1.0);
const vec4 C_vec4p0d5p = vec4(0.5);
const vec4 C_vec4p3d0p = vec4(3.0);
const vec2 C_vec2p1d0p = vec2(1.0);
const vec2 C_vec2p512d0p = vec2(512.0);
const vec2 C_vec2p2d0p = vec2(2.0);
const vec2 C_vec2pa1d0p = vec2(-1.0);
const vec3 C_vec3p0d0p = vec3(0.0);
const float C_16d0 = 16.0;
const ivec2 C_ivec2p3ca0p = ivec2(3, 0);
const float C_2d0 = 2.0;
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
	int H_kair8w = ivec4(VS_INPUT_gl_vBlendIndices).z << C_2;
	int H_zea32w1 = C_8 + H_kair8w;
	float H_6ql47n1 = float(H_zea32w1);
	float H_rrwmss1 = C_0d5 + H_6ql47n1;
	float H_cqhl0j1 = H_rrwmss1 * g_vInvGBufferSize.z;
	vec2 H_i2fjh61 = vec2(H_cqhl0j1, C_0d0);
	vec2 vBlendTransform0UV2 = H_i2fjh61 + VS_INPUT_gl_vTransformTextureUV;
	float flWrapLines2 = floor(vBlendTransform0UV2.x);
	float H_r37z221 = vBlendTransform0UV2.x - flWrapLines2;
	float H_qwcewg1 = flWrapLines2 * g_vInvGBufferSize.w;
	float H_hlw5r6 = H_qwcewg1 + vBlendTransform0UV2.y;
	vec2 H_lcamv11 = vec2(H_r37z221, H_hlw5r6);
	vec4 H_ydnqh71 = vec4(VS_INPUT_gl_vBlendWeight.z);
	vec4 vMatObjectToWorldRowa = textureLod(g_tTransformTexture, H_lcamv11, C_0d0);
	vec4 H_vzyszg1 = H_ydnqh71 * vMatObjectToWorldRowa;
	vec4 vMatObjectToWorldRowb = H_vzyszg1 + vMatObjectToWorldRow7;
	vec4 vTmp2 = textureLodOffset(g_tTransformTexture, H_lcamv11, C_0d0, C_ivec2p1ca0p);
	vec4 vTmp3 = textureLodOffset(g_tTransformTexture, H_lcamv11, C_0d0, C_ivec2p2ca0p);
	vec4 H_1kk2vq1 = H_ydnqh71 * vTmp2;
	vec4 vMatObjectToWorldRowc = H_1kk2vq1 + vMatObjectToWorldRow8;
	vec4 H_2vy2lq1 = H_ydnqh71 * vTmp3;
	vec4 vMatObjectToWorldRowd = H_2vy2lq1 + vMatObjectToWorldRow9;
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
	vec4 H_4hnhmp1 = C_vec4p2d0p * ztztSignBits;
	vec4 ztztSigns = C_vec4p1d0p - H_4hnhmp1;
	float H_lk9i08 = C_1d0 - normTan1.x;
	float H_dvpao91 = H_lk9i08 - normTan1.y;
	vec3 H_7olu74 = vec3(normTan1.x, normTan1.y, H_dvpao91);
	vec3 o_vNormalOs = normalize(H_7olu74);
	vec2 H_g1gr9q = o_vNormalOs.xy * xyxySigns.xy;
	float H_csfx2e = o_vNormalOs.z * ztztSigns.x;
	float H_n62jg7 = C_1d0 - normTan1.z;
	float H_4tnj1d1 = H_n62jg7 - normTan1.w;
	vec3 H_zfbbuh = vec3(normTan1.z, normTan1.w, H_4tnj1d1);
	vec3 o_vTangentUOs_flTangentVSign = normalize(H_zfbbuh);
	vec2 H_yap5rf = o_vTangentUOs_flTangentVSign.xy * xyxySigns.zw;
	float H_42nb75 = o_vTangentUOs_flTangentVSign.z * ztztSigns.z;
	vec4 H_bjyqbe1 = vec4(H_g1gr9q.x, H_g1gr9q.y, H_csfx2e, C_0d0);
	float dotres = dot(H_bjyqbe1, vMatObjectToWorldRowb);
	float dotres1 = dot(H_bjyqbe1, vMatObjectToWorldRowc);
	float dotres2 = dot(H_bjyqbe1, vMatObjectToWorldRowd);
	vec3 H_3cij4j1 = vec3(dotres, dotres1, dotres2);
	vec3 vNormalWs = normalize(H_3cij4j1);
	vec4 H_cs27ko1 = vec4(H_yap5rf.x, H_yap5rf.y, H_42nb75, C_0d0);
	float dotres3 = dot(H_cs27ko1, vMatObjectToWorldRowb);
	float dotres4 = dot(H_cs27ko1, vMatObjectToWorldRowc);
	float dotres5 = dot(H_cs27ko1, vMatObjectToWorldRowd);
	vec3 H_25kyhb = vec3(dotres3, dotres4, dotres5);
	float vTangentUWs = dot(H_25kyhb, vNormalWs);
	vec3 H_5m70t21 = vec3(vTangentUWs);
	vec3 H_7g28ki = H_5m70t21 * vNormalWs;
	vec3 H_tiz4n5 = H_25kyhb - H_7g28ki;
	vec3 vTangentUWs1 = normalize(H_tiz4n5);
	vec4 H_5as0dk1 = vec4(vTangentUWs1.x, vTangentUWs1.y, vTangentUWs1.z, ztztSigns.w);
	vec3 H_u8espd = VS_INPUT_gl_vPositionOs * vAnimationControlWord.zzz;
	vec4 H_2f7gnb = vec4(H_u8espd.x, H_u8espd.y, H_u8espd.z, C_1d0);
	float dotres6 = dot(H_2f7gnb, vMatObjectToWorldRowb);
	float dotres7 = dot(H_2f7gnb, vMatObjectToWorldRowc);
	float dotres8 = dot(H_2f7gnb, vMatObjectToWorldRowd);
	vec3 H_v3pmtu1 = vec3(dotres6, dotres7, dotres8);
	vec2 H_wgjrmr = VS_INPUT_gl_vTexCoord * g_vTexCoordScale;
	vec2 H_pauxoy1 = H_wgjrmr + g_vTexCoordOffset;
	float flDeadZoneShift = g_vWindOffset.x * C_0d007;
	vec2 H_igq5ub = vec2(flDeadZoneShift);
	vec2 H_5i56m7 = vec2(dotres6, dotres7);
	vec2 H_dgfej61 = H_5i56m7 / C_oqsmhu;
	vec2 H_ymhfpl = H_dgfej61 + H_igq5ub;
	vec4 flDeadZoneWindMap = textureLod(g_tWindNoise, H_ymhfpl, C_0d0);
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
	vec3 H_fzk4hm = vec3(vMatObjectToWorldRowb.w, vMatObjectToWorldRowc.w, vMatObjectToWorldRowd.w);
	vec3 vWindPos = mix(H_v3pmtu1, H_fzk4hm, g_flWindLinearity);
	vec3 param1 = vWindPos * C_vec3p2d0p;
	vec3 H_l5b53r1 = param1;
	H_l5b53r1.z = C_0d0;
	vec3 H_somohi = H_l5b53r1 * g_vWindStrengthFreqMulHighStrength.zzz;
	vec3 H_he2vkp1 = H_somohi + g_vWindOffset;
	float vNewPosition = dot(H_he2vkp1, C_vec3p1d0p);
	vec4 H_oxj759 = vec4(H_he2vkp1.x, H_he2vkp1.y, H_he2vkp1.z, vNewPosition);
	vec4 param2 = H_oxj759 * vFrequencyValues;
	vec4 H_30pd531 = fract(param2);
	vec4 H_idalqo = C_vec4p2d0p * H_30pd531;
	vec4 vWaves = H_idalqo + C_vec4pa1d0p;
	vec4 param3 = vWaves + C_vec4p0d5p;
	vec4 H_2hj25d1 = fract(param3);
	vec4 H_mkdhlr1 = C_vec4p2d0p * H_2hj25d1;
	vec4 H_wfplk4 = C_vec4pa1d0p + H_mkdhlr1;
	vec4 H_dm7zhk = abs(H_wfplk4);
	vec4 H_t9iptr1 = H_dm7zhk * H_dm7zhk;
	vec4 H_3cozhs = C_vec4p2d0p * H_dm7zhk;
	vec4 H_eq2txm = C_vec4p3d0p - H_3cozhs;
	vec4 H_tf0gzm = H_eq2txm * H_t9iptr1;
	vec4 vWaves1 = H_i55j6q1 * H_tf0gzm;
	float flAmplitudeLow = dot(vWaves1.xy, C_vec2p1d0p);
	float flAmplitudeLow1 = flAmplitudeLow * g_vWindStrengthFreqMulHighStrength.x;
	vec3 H_bj2cx11 = vec3(flAmplitudeLow1);
	float flAmplitudeHigh = dot(vWaves1.zw, C_vec2p1d0p);
	float flAmplitudeHigh1 = flAmplitudeHigh * g_vWindStrengthFreqMulHighStrength.w;
	vec3 H_f3z8vc1 = vec3(flAmplitudeHigh1);
	vec2 H_hdshzz = param1.xy / C_vec2p512d0p;
	vec4 vNoise = textureLod(g_tWindNoise, H_hdshzz, C_0d0);
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
	vec3 vPositionWs = H_v3pmtu1 + vSkew;
	vec3 H_523oj5 = vPositionWs - g_vCameraPositionWs;
	float H_4kxo191 = dot(g_vCameraDirWs, H_523oj5);
	vec4 H_yvacz51 = vec4(vPositionWs.x, vPositionWs.y, vPositionWs.z, H_4kxo191);
	vec3 H_0rv61p = normalize(H_523oj5);
	vec3 H_jxvi9a1 = C_vec3p0d0p - H_0rv61p;
	vec3 vReflectedLightDirWs = reflect(g_vGlobalLightDir, vNormalWs);
	float param4 = dot(H_jxvi9a1, vReflectedLightDirWs);
	float misc3a1 = clamp(param4, C_0d0, C_1d0);
	float param5 = pow(misc3a1, C_16d0);
	float misc3a2 = clamp(param5, C_0d0, C_1d0);
	vec4 H_y5nt8a1 = vec4(vNormalWs.x, vNormalWs.y, vNormalWs.z, misc3a2);
	vec4 H_vhymbl = vec4(vPositionWs.x, vPositionWs.y, vPositionWs.z, C_1d0);
	vec4 H_w5uycy1 = H_vhymbl + g_vWorldToCameraOffset;
	float dotres9 = dot(H_w5uycy1, g_matWorldToProjection[0]);
	float dotresa = dot(H_w5uycy1, g_matWorldToProjection[1]);
	float dotresb = dot(H_w5uycy1, g_matWorldToProjection[2]);
	float dotresc = dot(H_w5uycy1, g_matWorldToProjection[3]);
	vec4 vRet = textureLodOffset(g_tTransformTexture, VS_INPUT_gl_vTransformTextureUV, C_0d0, C_ivec2p3ca0p);
	PS_INPUT_gl_vBaseTexCoord = H_pauxoy1;
	PS_INPUT_gl_vPositionWs_flLinearDepth = H_yvacz51;
	PS_INPUT_gl_vNormalWs_flSpecularAmount = H_y5nt8a1;
	PS_INPUT_gl_vVertexColor = vRet;
	PS_INPUT_gl_flClipPlaneDist = C_0d0;
	PS_INPUT_gl_vTangentUWs_flTangentVSign = H_5as0dk1;
	float H_kfk4hf = C_0d0 - dotresa;
	float H_mjutop1 = dotresb * C_2d0;
	float H_nyldz61 = H_mjutop1 - dotresc;
	vec4 H_0yoa0k = vec4(dotres9, H_kfk4hf, H_nyldz61, dotresc);
	gl_Position = H_0yoa0k;
}
