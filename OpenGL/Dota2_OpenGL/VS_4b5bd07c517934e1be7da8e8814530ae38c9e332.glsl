//ATTRIBMAP-00-30-60-50-20-5D-xx
#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
struct PS_INPUT {
	vec4 member0;
	vec3 member1;
	vec4 member2;
	vec4 member3;
	vec4 member4;
	vec4 member5;
	vec4 member6;
	vec4 member7;
	float member8;
};
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
	vec4 g_vInvCMTDims;
	vec2 g_vTexCoordScale;
	float g_flTexCoordRotation;
	vec2 g_vTexCoordOffset;
	vec4 g_vTexCoordXform;
	vec2 g_vDetailTexCoordScale;
	float g_flDetailTexCoordRotation;
	vec2 g_vDetailTexCoordOffset;
	vec4 g_vDetailTexCoordXform;
	vec4 g_vDetail2TexCoordXformFromCode;
	float g_flRimLightScale;
	vec3 g_vRimLightColor;
	float g_flDiffuseModulationAmount;
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
uniform sampler2D g_tCompositeMorphTextureAtlas;
layout(location=0) in vec3 VS_INPUT_gl_vPositionOs;
layout(location=1) in vec4 VS_INPUT_gl_vNormalOs;
layout(location=2) in vec4 VS_INPUT_gl_vTangentUOs_flTangentVSign;
layout(location=3) in vec2 VS_INPUT_gl_vTexCoord;
layout(location=4) in uvec4 VS_INPUT_gl_vBlendIndices;
layout(location=5) in vec2 VS_INPUT_gl_vTransformTextureUV;
out gl_PerVertex {
	vec4 gl_Position;
	float gl_ClipDistance[1];
} ;
layout(location=0) out vec4 PS_INPUT_gl_vBaseTexCoord_vDetailTexCoord;
layout(location=1) out vec3 PS_INPUT_gl_vNormalWs;
layout(location=2) out vec4 PS_INPUT_gl_vTangentUWs_flTangentVSign;
layout(location=3) out vec4 PS_INPUT_gl_vVertexColor;
layout(location=4) out vec4 PS_INPUT_gl_vPositionWs_flLinearDepth;
layout(location=5) out vec4 PS_INPUT_gl_vRimColor_flFog;
layout(location=6) out vec4 PS_INPUT_gl_vLightAtten;
const float C_0d0 = 0.0;
const int C_2 = 2;
const int C_8 = 8;
const float C_0d5 = 0.5;
const ivec2 C_ivec2p1ca0p = ivec2(1, 0);
const ivec2 C_ivec2p2ca0p = ivec2(2, 0);
const vec4 C_vec4p255d0p = vec4(255.0);
const vec4 C_avvsno = vec4(-128.0);
const vec4 C_vec4p0d0p = vec4(0.0);
const vec4 C_vec4pa64d0p = vec4(-64.0);
const vec4 C_vec4p63d0p = vec4(63.0);
const vec4 C_vec4p2d0p = vec4(2.0);
const vec4 C_vec4p1d0p = vec4(1.0);
const float C_1d0 = 1.0;
const ivec2 C_ivec2p3ca0p = ivec2(3, 0);
const vec3 C_vec3p1d0p = vec3(1.0);
const float C_2d0 = 2.0;
void main()
{
	PS_INPUT o;
	PS_INPUT mainOut;
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
	vec4 vMatObjectToWorldRow = textureLod(g_tTransformTexture, H_crnj9e1, C_0d0);
	vec4 vMatObjectToWorldRow1 = textureLodOffset(g_tTransformTexture, H_crnj9e1, C_0d0, C_ivec2p1ca0p);
	vec4 vMatObjectToWorldRow2 = textureLodOffset(g_tTransformTexture, H_crnj9e1, C_0d0, C_ivec2p2ca0p);
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
	float dotres = dot(H_bjyqbe1, vMatObjectToWorldRow);
	float dotres1 = dot(H_bjyqbe1, vMatObjectToWorldRow1);
	float dotres2 = dot(H_bjyqbe1, vMatObjectToWorldRow2);
	vec3 H_3cij4j1 = vec3(dotres, dotres1, dotres2);
	vec3 vNormalWs = normalize(H_3cij4j1);
	vec4 H_cs27ko1 = vec4(H_yap5rf.x, H_yap5rf.y, H_42nb75, C_0d0);
	float dotres3 = dot(H_cs27ko1, vMatObjectToWorldRow);
	float dotres4 = dot(H_cs27ko1, vMatObjectToWorldRow1);
	float dotres5 = dot(H_cs27ko1, vMatObjectToWorldRow2);
	vec3 H_25kyhb = vec3(dotres3, dotres4, dotres5);
	float vTangentUWs = dot(H_25kyhb, vNormalWs);
	vec3 H_5m70t21 = vec3(vTangentUWs);
	vec3 H_7g28ki = H_5m70t21 * vNormalWs;
	vec3 H_tiz4n5 = H_25kyhb - H_7g28ki;
	vec3 vTangentUWs1 = normalize(H_tiz4n5);
	vec4 H_5as0dk1 = vec4(vTangentUWs1.x, vTangentUWs1.y, vTangentUWs1.z, ztztSigns.w);
	o.member2 = H_5as0dk1;
	o.member1 = vNormalWs;
	vec3 H_u8espd = VS_INPUT_gl_vPositionOs * vAnimationControlWord.zzz;
	vec4 H_2f7gnb = vec4(H_u8espd.x, H_u8espd.y, H_u8espd.z, C_1d0);
	float dotres6 = dot(H_2f7gnb, vMatObjectToWorldRow);
	float dotres7 = dot(H_2f7gnb, vMatObjectToWorldRow1);
	float dotres8 = dot(H_2f7gnb, vMatObjectToWorldRow2);
	vec3 H_v3pmtu1 = vec3(dotres6, dotres7, dotres8);
	float H_5d060x1 = dot(g_vTexCoordXform.xy, VS_INPUT_gl_vTexCoord);
	float H_p6n1821 = dot(g_vTexCoordXform.zw, VS_INPUT_gl_vTexCoord);
	vec4 Lg_1;
	Lg_1.xy = vec2(H_5d060x1, H_p6n1821);
	o.member0 = Lg_1;
	vec2 H_ipk1y31 = vec2(H_5d060x1, H_p6n1821);
	vec2 H_sk3tid1 = H_ipk1y31 + g_vTexCoordOffset;
	vec4 H_m6u7rh = vec4(H_sk3tid1.x, H_sk3tid1.y, VS_INPUT_gl_vTexCoord.x, VS_INPUT_gl_vTexCoord.y);
	o.member0 = H_m6u7rh;
	vec4 H_pzx5dy = vec4(dotres6, dotres7, dotres8, C_1d0);
	float H_0a1nwy = dot(H_pzx5dy, g_vClipPlane0);
	o.member8 = H_0a1nwy;
	vec4 H_sg41bi = H_pzx5dy + g_vWorldToCameraOffset;
	float dotres9 = dot(H_sg41bi, g_matWorldToProjection[0]);
	float dotresa = dot(H_sg41bi, g_matWorldToProjection[1]);
	float dotresb = dot(H_sg41bi, g_matWorldToProjection[2]);
	float dotresc = dot(H_sg41bi, g_matWorldToProjection[3]);
	vec4 H_zolhrr1 = vec4(dotres9, dotresa, dotresb, dotresc);
	o.member7 = H_zolhrr1;
	vec4 H_aq70c71 = o.member4;
	H_aq70c71.xyz = vec3(dotres6, dotres7, dotres8);
	o.member4 = H_aq70c71;
	vec3 H_n1robs1 = H_v3pmtu1 - g_vCameraPositionWs;
	float H_q6adkl = dot(g_vCameraDirWs, H_n1robs1);
	vec4 H_s4cwvz = vec4(dotres6, dotres7, dotres8, H_q6adkl);
	o.member4 = H_s4cwvz;
	vec4 vRet = textureLodOffset(g_tTransformTexture, VS_INPUT_gl_vTransformTextureUV, C_0d0, C_ivec2p3ca0p);
	vec3 H_w08st6 = mix(C_vec3p1d0p, vRet.xyz, g_flDiffuseModulationAmount);
	vec4 H_4n00ue1 = vec4(H_w08st6.x, H_w08st6.y, H_w08st6.z, vRet.w);
	o.member3 = H_4n00ue1;
	vec3 H_33u9np = g_vGlobalLightAmbientColor1 * g_vRimLightColor;
	vec3 H_3i5p1w = vec3(g_flRimLightScale);
	vec3 H_snnc0b1 = H_33u9np * H_3i5p1w;
	vec4 H_jk7un5 = vec4(H_snnc0b1.x, H_snnc0b1.y, H_snnc0b1.z, C_0d0);
	o.member5 = H_jk7un5;
	o.member6 = C_vec4p0d0p;
	PS_INPUT_gl_vBaseTexCoord_vDetailTexCoord = o.member0;
	PS_INPUT_gl_vNormalWs = o.member1;
	PS_INPUT_gl_vTangentUWs_flTangentVSign = o.member2;
	PS_INPUT_gl_vVertexColor = o.member3;
	PS_INPUT_gl_vPositionWs_flLinearDepth = o.member4;
	PS_INPUT_gl_vRimColor_flFog = o.member5;
	PS_INPUT_gl_vLightAtten = o.member6;
	float H_rgxxo6 = C_0d0 - o.member7.y;
	float H_d94dkd1 = o.member7.z * C_2d0;
	float H_7dzuxj = H_d94dkd1 - o.member7.w;
	vec4 H_b1m0271 = o.member7;
	H_b1m0271.yz = vec2(H_rgxxo6, H_7dzuxj);
	gl_Position = H_b1m0271;
	gl_ClipDistance[0] = o.member8;
}
