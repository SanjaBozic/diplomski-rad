//ATTRIBMAP-00-30-50-51-52-53-5D-xx
#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
struct PS_INPUT {
	vec4 member0;
	vec4 member1;
	vec4 member2;
	vec4 member3;
	vec4 member4;
	vec4 member5;
	vec4 member6;
	vec4 member7;
	vec4 member8;
	vec4 member9;
	vec4 member10;
	float member11;
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
layout(std140, binding = 13 ) uniform DotaGlobalParams_t {
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
layout(std140, binding = 14 ) uniform _Globals_ {
	float g_flTexCoordScale0;
	float g_flTexCoordScale1;
	float g_flTexCoordScale2;
	float g_flTexCoordRotate0;
	float g_flTexCoordRotate1;
	float g_flTexCoordRotate2;
	vec2 g_vTexCoordScroll0;
	vec2 g_vTexCoordScroll1;
	vec2 g_vTexCoordScroll2;
	vec2 g_vTexCoordOffset0;
	vec2 g_vTexCoordOffset1;
	vec2 g_vTexCoordOffset2;
	float g_flTexCoordScale3;
	float g_flTexCoordRotate3;
	vec2 g_vTexCoordScroll3;
	vec2 g_vTexCoordOffset3;
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
layout(location=3) in vec3 VS_INPUT_gl_vColorBlendValues;
layout(location=4) in vec3 VS_INPUT_gl_vAlphaBlendValues;
layout(location=5) in vec3 VS_INPUT_gl_vBlendColorTint;
layout(location=6) in vec2 VS_INPUT_gl_vTransformTextureUV;
out gl_PerVertex {
	vec4 gl_Position;
	float gl_ClipDistance[1];
} ;
layout(location=0) out vec4 PS_INPUT_gl_vPositionWs_flLinearDepth;
layout(location=1) out vec4 PS_INPUT_gl_vNormalWs_flSpecularAmount;
layout(location=2) out vec4 PS_INPUT_gl_vVertexColor;
layout(location=3) out vec4 PS_INPUT_gl_vColorBlendValues_BlendY;
layout(location=4) out vec4 PS_INPUT_gl_vAlphaBlendValues_BlendZ;
layout(location=5) out vec4 PS_INPUT_gl_vTangentUWs_flTangentVSign;
layout(location=6) out vec4 PS_INPUT_gl_vProjTexCoord0_X_Y;
layout(location=7) out vec4 PS_INPUT_gl_vProjTexCoord1_X_Y;
layout(location=8) out vec4 PS_INPUT_gl_vProjTexCoord2_X_Y;
layout(location=9) out vec4 PS_INPUT_gl_vProjTexCoord_0Z_1Z;
const float C_0d0 = 0.0;
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
const vec3 C_vec3p0d0p = vec3(0.0);
const float C_16d0 = 16.0;
const float C_0d0174533 = 0.0174533;
const vec3 C_vec3p128d0p = vec3(128.0);
const vec2 C_vec2pa0d5p = vec2(-0.5);
const vec2 C_vec2p0d5p = vec2(0.5);
const ivec2 C_ivec2p3ca0p = ivec2(3, 0);
const vec3 C_vec3p0d5p = vec3(0.5);
const float C_0d0001 = 0.0001;
const vec3 C_vec3p12d92p = vec3(12.92);
const vec3 C_vec3p1d055p = vec3(1.055);
const vec3 C_bw96as = vec3(0.0521327);
const vec3 C_vec3p2d4p = vec3(2.4);
const float C_0d04045 = 0.04045;
const float C_0d01 = 0.01;
const float C_2d0 = 2.0;
void main()
{
	PS_INPUT o;
	PS_INPUT mainOut;
	gl_ClipDistance[0] = C_0d0;
	vec4 vMatObjectToWorldRow = textureLod(g_tTransformTexture, VS_INPUT_gl_vTransformTextureUV, C_0d0);
	vec4 vMatObjectToWorldRow1 = textureLodOffset(g_tTransformTexture, VS_INPUT_gl_vTransformTextureUV, C_0d0, C_ivec2p1ca0p);
	vec4 vMatObjectToWorldRow2 = textureLodOffset(g_tTransformTexture, VS_INPUT_gl_vTransformTextureUV, C_0d0, C_ivec2p2ca0p);
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
	vec4 H_pj8mqi1;
	H_pj8mqi1.xyz = vNormalWs.xyz;
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
	o.member5 = H_5as0dk1;
	o.member1 = H_pj8mqi1;
	vec4 H_ol7vfn1 = vec4(VS_INPUT_gl_vPositionOs.x, VS_INPUT_gl_vPositionOs.y, VS_INPUT_gl_vPositionOs.z, C_1d0);
	float dotres6 = dot(H_ol7vfn1, vMatObjectToWorldRow);
	float dotres7 = dot(H_ol7vfn1, vMatObjectToWorldRow1);
	float dotres8 = dot(H_ol7vfn1, vMatObjectToWorldRow2);
	vec3 H_v3pmtu1 = vec3(dotres6, dotres7, dotres8);
	vec4 Lg_1;
	Lg_1.xyz = vec3(dotres6, dotres7, dotres8);
	o.member0 = Lg_1;
	vec3 H_n1robs1 = H_v3pmtu1 - g_vCameraPositionWs;
	float H_q6adkl = dot(g_vCameraDirWs, H_n1robs1);
	vec4 H_s4cwvz = vec4(dotres6, dotres7, dotres8, H_q6adkl);
	o.member0 = H_s4cwvz;
	vec4 H_pzx5dy = vec4(dotres6, dotres7, dotres8, C_1d0);
	float H_0a1nwy = dot(H_pzx5dy, g_vClipPlane0);
	o.member11 = H_0a1nwy;
	vec3 H_aojmgm = normalize(H_n1robs1);
	vec3 H_p188i31 = C_vec3p0d0p - H_aojmgm;
	vec3 vReflectedLightDirWs = reflect(g_vGlobalLightDir, vNormalWs);
	float param1 = dot(H_p188i31, vReflectedLightDirWs);
	float misc3a = clamp(param1, C_0d0, C_1d0);
	float param2 = pow(misc3a, C_16d0);
	float misc3a1 = clamp(param2, C_0d0, C_1d0);
	vec4 H_tewgcl1 = vec4(vNormalWs.x, vNormalWs.y, vNormalWs.z, misc3a1);
	o.member1 = H_tewgcl1;
	vec4 H_sg41bi = H_pzx5dy + g_vWorldToCameraOffset;
	float dotres9 = dot(H_sg41bi, g_matWorldToProjection[0]);
	float dotresa = dot(H_sg41bi, g_matWorldToProjection[1]);
	float dotresb = dot(H_sg41bi, g_matWorldToProjection[2]);
	float dotresc = dot(H_sg41bi, g_matWorldToProjection[3]);
	vec4 H_zolhrr1 = vec4(dotres9, dotresa, dotresb, dotresc);
	o.member10 = H_zolhrr1;
	float flTexCoordRotate = g_flTexCoordRotate0 * C_0d0174533;
	float flTexCoordRotate1 = C_0d0174533 * g_flTexCoordRotate1;
	float flTexCoordRotate2 = C_0d0174533 * g_flTexCoordRotate2;
	vec2 H_ts6vqy1 = vec2(g_flTime);
	vec2 H_plg0l4 = H_ts6vqy1 * g_vTexCoordScroll0;
	vec2 flTexCoordOffset = H_plg0l4 + g_vTexCoordOffset0;
	vec2 H_qwu0b4 = H_ts6vqy1 * g_vTexCoordScroll1;
	vec2 flTexCoordOffset1 = H_qwu0b4 + g_vTexCoordOffset1;
	vec2 H_r79114 = H_ts6vqy1 * g_vTexCoordScroll2;
	vec2 flTexCoordOffset2 = H_r79114 + g_vTexCoordOffset2;
	vec3 vScaledPos = H_v3pmtu1 / C_vec3p128d0p;
	float H_wq616s = C_0d0 - vScaledPos.z;
	vec2 H_mwy6ma1 = vec2(vScaledPos.y, H_wq616s);
	vec2 H_f13mre = vec2(vScaledPos.x, H_wq616s);
	float H_ttzzzs = C_0d0 - vScaledPos.y;
	vec2 H_su6fkn1 = vec2(vScaledPos.x, H_ttzzzs);
	vec2 H_6yh3dc1 = vec2(g_flTexCoordScale0);
	vec2 vAdjust = H_mwy6ma1 + C_vec2pa0d5p;
	float H_a41hck1 = cos(flTexCoordRotate);
	float H_3yh3lz = sin(flTexCoordRotate);
	float H_g6ow161 = H_a41hck1 * vAdjust.x;
	float H_t296zz = H_3yh3lz * vAdjust.y;
	float H_odg0uv = H_g6ow161 - H_t296zz;
	float H_udn6pz = H_3yh3lz * vAdjust.x;
	float H_fv9wb61 = H_a41hck1 * vAdjust.y;
	float H_0u260m = H_fv9wb61 + H_udn6pz;
	vec2 H_rj584l1 = vec2(H_odg0uv, H_0u260m);
	vec2 H_t7hvtl = H_6yh3dc1 * H_rj584l1;
	vec2 H_lppiep1 = H_t7hvtl + C_vec2p0d5p;
	vec2 H_fmkmrs = H_lppiep1 + flTexCoordOffset;
	vec4 H_cc01s61 = o.member6;
	H_cc01s61.xy = H_fmkmrs.xy;
	o.member6 = H_cc01s61;
	vec2 H_z234mk = vec2(g_flTexCoordScale1);
	float H_ho0rdv1 = cos(flTexCoordRotate1);
	float H_y7bjq6 = sin(flTexCoordRotate1);
	float H_t3kgz91 = H_ho0rdv1 * vAdjust.x;
	float H_xtkwhj1 = H_y7bjq6 * vAdjust.y;
	float H_qq2pa41 = H_t3kgz91 - H_xtkwhj1;
	float H_y4zw7j1 = H_y7bjq6 * vAdjust.x;
	float H_ueygp91 = H_ho0rdv1 * vAdjust.y;
	float H_kam528 = H_ueygp91 + H_y4zw7j1;
	vec2 H_e3kczs = vec2(H_qq2pa41, H_kam528);
	vec2 H_7islw3 = H_e3kczs * H_z234mk;
	vec2 H_rbsswt = C_vec2p0d5p + H_7islw3;
	vec2 H_amak04 = H_rbsswt + flTexCoordOffset1;
	vec4 H_b1m0271 = o.member7;
	H_b1m0271.xy = H_amak04.xy;
	o.member7 = H_b1m0271;
	vec2 vAdjust1 = C_vec2pa0d5p + H_f13mre;
	float H_z8b21o1 = H_a41hck1 * vAdjust1.x;
	float H_ifs9cf = H_3yh3lz * vAdjust1.y;
	float H_lk9boy1 = H_z8b21o1 - H_ifs9cf;
	float H_h4e9mf = H_3yh3lz * vAdjust1.x;
	float H_0kp2rn1 = H_a41hck1 * vAdjust1.y;
	float H_l6jwxc = H_0kp2rn1 + H_h4e9mf;
	vec2 H_hgvfhp = vec2(H_lk9boy1, H_l6jwxc);
	vec2 H_69jzs9 = H_6yh3dc1 * H_hgvfhp;
	vec2 H_bjmqrj1 = C_vec2p0d5p + H_69jzs9;
	vec2 H_jfzcm5 = H_bjmqrj1 + flTexCoordOffset;
	vec4 H_0k0jo31 = vec4(H_fmkmrs.x, H_fmkmrs.y, H_jfzcm5.x, H_jfzcm5.y);
	o.member6 = H_0k0jo31;
	float H_05ktga = H_ho0rdv1 * vAdjust1.x;
	float H_2nblmw1 = H_y7bjq6 * vAdjust1.y;
	float H_dgnr0k = H_05ktga - H_2nblmw1;
	float H_1cxkww1 = H_y7bjq6 * vAdjust1.x;
	float H_zt5tqa = H_ho0rdv1 * vAdjust1.y;
	float H_lzvz1x = H_1cxkww1 + H_zt5tqa;
	vec2 H_jh3osu1 = vec2(H_dgnr0k, H_lzvz1x);
	vec2 H_phipza1 = H_jh3osu1 * H_z234mk;
	vec2 H_d251ht = C_vec2p0d5p + H_phipza1;
	vec2 H_zx2w541 = H_d251ht + flTexCoordOffset1;
	vec4 H_gnbj6e1 = vec4(H_amak04.x, H_amak04.y, H_zx2w541.x, H_zx2w541.y);
	o.member7 = H_gnbj6e1;
	vec2 H_86eb9b1 = vec2(g_flTexCoordScale2);
	float H_uxjz2y = cos(flTexCoordRotate2);
	float H_l20w2 = sin(flTexCoordRotate2);
	float H_dju00c = H_uxjz2y * vAdjust.x;
	float H_l1kjqq1 = H_l20w2 * vAdjust.y;
	float H_dpcsqb = H_dju00c - H_l1kjqq1;
	float H_mcyjgq1 = H_l20w2 * vAdjust.x;
	float H_eu81qb = H_uxjz2y * vAdjust.y;
	float H_e162c11 = H_eu81qb + H_mcyjgq1;
	vec2 H_2jo1om1 = vec2(H_dpcsqb, H_e162c11);
	vec2 H_n1zmv6 = H_2jo1om1 * H_86eb9b1;
	vec2 H_e5l7us = C_vec2p0d5p + H_n1zmv6;
	vec2 H_tw539z = H_e5l7us + flTexCoordOffset2;
	vec4 H_6imyf81 = o.member8;
	H_6imyf81.xy = H_tw539z.xy;
	o.member8 = H_6imyf81;
	float H_cyvihs1 = H_uxjz2y * vAdjust1.x;
	float H_un4ass1 = H_l20w2 * vAdjust1.y;
	float H_ipr3f71 = H_cyvihs1 - H_un4ass1;
	float H_tcq92t1 = H_l20w2 * vAdjust1.x;
	float H_bnhirs1 = H_uxjz2y * vAdjust1.y;
	float H_9r99l41 = H_bnhirs1 + H_tcq92t1;
	vec2 H_g6rtx6 = vec2(H_ipr3f71, H_9r99l41);
	vec2 H_lu8h271 = H_86eb9b1 * H_g6rtx6;
	vec2 H_hl1uha1 = C_vec2p0d5p + H_lu8h271;
	vec2 H_qkxw671 = H_hl1uha1 + flTexCoordOffset2;
	vec4 H_c1jjzq = vec4(H_tw539z.x, H_tw539z.y, H_qkxw671.x, H_qkxw671.y);
	o.member8 = H_c1jjzq;
	vec2 vAdjust2 = C_vec2pa0d5p + H_su6fkn1;
	float H_ayn9871 = H_a41hck1 * vAdjust2.x;
	float H_z9f5ka1 = H_3yh3lz * vAdjust2.y;
	float H_uajfex1 = H_ayn9871 - H_z9f5ka1;
	float H_0lt5aa1 = H_3yh3lz * vAdjust2.x;
	float H_9n99i71 = H_a41hck1 * vAdjust2.y;
	float H_2m7mpi = H_0lt5aa1 + H_9n99i71;
	vec2 H_m0izee = vec2(H_uajfex1, H_2m7mpi);
	vec2 H_nle7li = H_6yh3dc1 * H_m0izee;
	vec2 H_b7sybn = C_vec2p0d5p + H_nle7li;
	vec2 H_x0iob81 = H_b7sybn + flTexCoordOffset;
	vec4 H_578yp81 = o.member9;
	H_578yp81.xy = H_x0iob81.xy;
	o.member9 = H_578yp81;
	float H_d9mnhe1 = H_ho0rdv1 * vAdjust2.x;
	float H_fiwcts = H_y7bjq6 * vAdjust2.y;
	float H_4qi95l = H_d9mnhe1 - H_fiwcts;
	float H_gtadjs = H_y7bjq6 * vAdjust2.x;
	float H_ek0o7e1 = H_ho0rdv1 * vAdjust2.y;
	float H_n4tt7y1 = H_ek0o7e1 + H_gtadjs;
	vec2 H_rypbkr1 = vec2(H_4qi95l, H_n4tt7y1);
	vec2 H_rfuh781 = H_rypbkr1 * H_z234mk;
	vec2 H_rojvs21 = C_vec2p0d5p + H_rfuh781;
	vec2 H_a257q31 = H_rojvs21 + flTexCoordOffset1;
	vec4 H_qye1lt1 = vec4(H_x0iob81.x, H_x0iob81.y, H_a257q31.x, H_a257q31.y);
	o.member9 = H_qye1lt1;
	vec4 vRet = textureLodOffset(g_tTransformTexture, VS_INPUT_gl_vTransformTextureUV, C_0d0, C_ivec2p3ca0p);
	o.member2 = vRet;
	vec4 H_f972y51 = o.member3;
	H_f972y51.xyz = VS_INPUT_gl_vColorBlendValues.xyz;
	o.member3 = H_f972y51;
	vec3 H_9jgiys = VS_INPUT_gl_vAlphaBlendValues * C_vec3p0d5p;
	vec3 H_7rv8k2 = max(H_9jgiys, C_0d0001);
	vec4 H_aq70c71 = o.member4;
	H_aq70c71.xyz = H_7rv8k2.xyz;
	o.member4 = H_aq70c71;
	vec3 vLinearSegment = VS_INPUT_gl_vBlendColorTint / C_vec3p12d92p;
	vec3 H_e3ai8x = VS_INPUT_gl_vBlendColorTint / C_vec3p1d055p;
	vec3 H_rq9rhu1 = H_e3ai8x + C_bw96as;
	vec3 vExpSegment = pow(H_rq9rhu1, C_vec3p2d4p);
	bool H_imsmae = VS_INPUT_gl_vBlendColorTint.x > C_0d04045;
	float select = H_imsmae ? vExpSegment.x : vLinearSegment.x;
	bool H_d2bi461 = VS_INPUT_gl_vBlendColorTint.y > C_0d04045;
	float select1 = H_d2bi461 ? vExpSegment.y : vLinearSegment.y;
	bool H_ctsg351 = VS_INPUT_gl_vBlendColorTint.z > C_0d04045;
	float select2 = H_ctsg351 ? vExpSegment.z : vLinearSegment.z;
	vec3 H_g5tqsp = vec3(select, select1, select2);
	vec3 H_euxrm51 = H_g5tqsp * vRet.xyz;
	vec4 H_498olf1 = vRet;
	H_498olf1.xyz = H_euxrm51.xyz;
	o.member2 = H_498olf1;
	vec3 vAbsNormalWs = abs(vNormalWs);
	float flMax = max(vAbsNormalWs.x, vAbsNormalWs.y);
	float flMax1 = max(flMax, vAbsNormalWs.z);
	vec3 H_gevyzc1 = vec3(flMax1);
	vec3 vMaxMinusNormal = H_gevyzc1 - vAbsNormalWs;
	bool H_mdu3p = vMaxMinusNormal.y < C_0d01;
	float H_zui91t = H_mdu3p ? C_1d0 : C_0d0;
	vec4 H_fpoile = vec4(VS_INPUT_gl_vColorBlendValues.x, VS_INPUT_gl_vColorBlendValues.y, VS_INPUT_gl_vColorBlendValues.z, H_zui91t);
	o.member3 = H_fpoile;
	bool H_d2pmqi = vMaxMinusNormal.z < C_0d01;
	float H_rvqr45 = H_d2pmqi ? C_1d0 : C_0d0;
	vec4 H_vieiy41 = vec4(H_7rv8k2.x, H_7rv8k2.y, H_7rv8k2.z, H_rvqr45);
	o.member4 = H_vieiy41;
	PS_INPUT_gl_vPositionWs_flLinearDepth = o.member0;
	PS_INPUT_gl_vNormalWs_flSpecularAmount = o.member1;
	PS_INPUT_gl_vVertexColor = o.member2;
	PS_INPUT_gl_vColorBlendValues_BlendY = o.member3;
	PS_INPUT_gl_vAlphaBlendValues_BlendZ = o.member4;
	PS_INPUT_gl_vTangentUWs_flTangentVSign = o.member5;
	PS_INPUT_gl_vProjTexCoord0_X_Y = o.member6;
	PS_INPUT_gl_vProjTexCoord1_X_Y = o.member7;
	PS_INPUT_gl_vProjTexCoord2_X_Y = o.member8;
	PS_INPUT_gl_vProjTexCoord_0Z_1Z = o.member9;
	float H_hfp213 = C_0d0 - o.member10.y;
	float H_5ctil = o.member10.z * C_2d0;
	float H_brsb331 = H_5ctil - o.member10.w;
	vec4 H_vjhl6y = o.member10;
	H_vjhl6y.yz = vec2(H_hfp213, H_brsb331);
	gl_Position = H_vjhl6y;
	gl_ClipDistance[0] = o.member11;
}
