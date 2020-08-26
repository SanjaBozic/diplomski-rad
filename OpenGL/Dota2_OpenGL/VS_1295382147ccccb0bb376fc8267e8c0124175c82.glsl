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
layout(location=5) out vec4 PS_INPUT_gl_vBaseTexCoord0_vBaseTexCoord1;
layout(location=6) out vec4 PS_INPUT_gl_vBaseTexCoord2_vBaseTexCoord3;
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
const float C_2d0 = 2.0;
const vec3 C_vec3p0d0p = vec3(0.0);
const float C_16d0 = 16.0;
const float C_0d0174533 = 0.0174533;
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
	float H_lk9i08 = C_1d0 - normTan1.x;
	float H_dvpao91 = H_lk9i08 - normTan1.y;
	vec3 H_7olu74 = vec3(normTan1.x, normTan1.y, H_dvpao91);
	vec3 o_vNormalOs = normalize(H_7olu74);
	vec2 H_g1gr9q = o_vNormalOs.xy * xyxySigns.xy;
	float _L = ztztSignBits.x * C_2d0;
	float H_46brk31 = C_1d0 - _L;
	float H_8dugyy = H_46brk31 * o_vNormalOs.z;
	vec4 H_crrejn = vec4(H_g1gr9q.x, H_g1gr9q.y, H_8dugyy, C_0d0);
	float dotres = dot(H_crrejn, vMatObjectToWorldRow);
	float dotres1 = dot(H_crrejn, vMatObjectToWorldRow1);
	float dotres2 = dot(H_crrejn, vMatObjectToWorldRow2);
	vec3 H_3cij4j1 = vec3(dotres, dotres1, dotres2);
	vec3 vNormalWs = normalize(H_3cij4j1);
	vec4 H_pj8mqi1;
	H_pj8mqi1.xyz = vNormalWs.xyz;
	o.member1 = H_pj8mqi1;
	vec4 H_ol7vfn1 = vec4(VS_INPUT_gl_vPositionOs.x, VS_INPUT_gl_vPositionOs.y, VS_INPUT_gl_vPositionOs.z, C_1d0);
	float dotres3 = dot(H_ol7vfn1, vMatObjectToWorldRow);
	float dotres4 = dot(H_ol7vfn1, vMatObjectToWorldRow1);
	float dotres5 = dot(H_ol7vfn1, vMatObjectToWorldRow2);
	vec3 H_25kyhb = vec3(dotres3, dotres4, dotres5);
	vec4 Lg_1;
	Lg_1.xyz = vec3(dotres3, dotres4, dotres5);
	o.member0 = Lg_1;
	vec3 H_uktff21 = H_25kyhb - g_vCameraPositionWs;
	float H_tuff051 = dot(g_vCameraDirWs, H_uktff21);
	vec4 H_l3q6cr1 = vec4(dotres3, dotres4, dotres5, H_tuff051);
	o.member0 = H_l3q6cr1;
	vec4 H_ywfxcw = vec4(dotres3, dotres4, dotres5, C_1d0);
	float H_yzs5al1 = dot(H_ywfxcw, g_vClipPlane0);
	o.member8 = H_yzs5al1;
	vec3 H_dgzhuw1 = normalize(H_uktff21);
	vec3 H_qf9c0z = C_vec3p0d0p - H_dgzhuw1;
	vec3 vReflectedLightDirWs = reflect(g_vGlobalLightDir, vNormalWs);
	float param1 = dot(H_qf9c0z, vReflectedLightDirWs);
	float misc3a = clamp(param1, C_0d0, C_1d0);
	float param2 = pow(misc3a, C_16d0);
	float misc3a1 = clamp(param2, C_0d0, C_1d0);
	vec4 H_tewgcl1 = vec4(vNormalWs.x, vNormalWs.y, vNormalWs.z, misc3a1);
	o.member1 = H_tewgcl1;
	vec4 H_attytl1 = H_ywfxcw + g_vWorldToCameraOffset;
	float dotres6 = dot(H_attytl1, g_matWorldToProjection[0]);
	float dotres7 = dot(H_attytl1, g_matWorldToProjection[1]);
	float dotres8 = dot(H_attytl1, g_matWorldToProjection[2]);
	float dotres9 = dot(H_attytl1, g_matWorldToProjection[3]);
	vec4 H_8t1tx71 = vec4(dotres6, dotres7, dotres8, dotres9);
	o.member7 = H_8t1tx71;
	float param3 = g_flTexCoordRotate0 * C_0d0174533;
	vec2 H_6yh3dc1 = vec2(g_flTexCoordScale0);
	vec2 vAdjust = VS_INPUT_gl_vTexCoord + C_vec2pa0d5p;
	float H_x6o6531 = cos(param3);
	float H_wftr481 = sin(param3);
	float H_39rb4g = H_x6o6531 * vAdjust.x;
	float H_0xbs4o = H_wftr481 * vAdjust.y;
	float H_9k40i11 = H_39rb4g - H_0xbs4o;
	float H_zlxreo = H_wftr481 * vAdjust.x;
	float H_4k5cuf = H_x6o6531 * vAdjust.y;
	float H_wl9kjg = H_4k5cuf + H_zlxreo;
	vec2 H_h0lzdt1 = vec2(H_9k40i11, H_wl9kjg);
	vec2 H_w21hp = H_6yh3dc1 * H_h0lzdt1;
	vec2 H_iuugoo1 = H_w21hp + C_vec2p0d5p;
	vec2 H_ts6vqy1 = vec2(g_flTime);
	vec2 H_plg0l4 = H_ts6vqy1 * g_vTexCoordScroll0;
	vec2 H_8597es = H_iuugoo1 + H_plg0l4;
	vec2 H_9s5ew6 = H_8597es + g_vTexCoordOffset0;
	vec4 H_9ftzl71 = o.member5;
	H_9ftzl71.xy = H_9s5ew6.xy;
	o.member5 = H_9ftzl71;
	float param4 = C_0d0174533 * g_flTexCoordRotate1;
	vec2 H_z234mk = vec2(g_flTexCoordScale1);
	float H_mwr5m3 = cos(param4);
	float H_jsp6w51 = sin(param4);
	float H_sa307h1 = H_mwr5m3 * vAdjust.x;
	float H_qfqblu = H_jsp6w51 * vAdjust.y;
	float H_uhmpaq = H_sa307h1 - H_qfqblu;
	float H_p4cbvu = H_jsp6w51 * vAdjust.x;
	float H_rzozgh1 = H_mwr5m3 * vAdjust.y;
	float H_vl7nyp1 = H_p4cbvu + H_rzozgh1;
	vec2 H_pzs58z = vec2(H_uhmpaq, H_vl7nyp1);
	vec2 H_86e0z2 = H_pzs58z * H_z234mk;
	vec2 H_libcmt1 = C_vec2p0d5p + H_86e0z2;
	vec2 H_qwu0b4 = H_ts6vqy1 * g_vTexCoordScroll1;
	vec2 H_1rvdzp = H_libcmt1 + H_qwu0b4;
	vec2 H_ag8e3p1 = H_1rvdzp + g_vTexCoordOffset1;
	vec4 H_wtbnis1 = vec4(H_9s5ew6.x, H_9s5ew6.y, H_ag8e3p1.x, H_ag8e3p1.y);
	o.member5 = H_wtbnis1;
	float param5 = C_0d0174533 * g_flTexCoordRotate2;
	vec2 H_86eb9b1 = vec2(g_flTexCoordScale2);
	float H_j0fawa1 = cos(param5);
	float H_i9kvvf1 = sin(param5);
	float H_ve5kcf1 = H_j0fawa1 * vAdjust.x;
	float H_wxa78a1 = H_i9kvvf1 * vAdjust.y;
	float H_04r3jz = H_ve5kcf1 - H_wxa78a1;
	float H_vmw6ia1 = H_i9kvvf1 * vAdjust.x;
	float H_wpjk2f1 = H_j0fawa1 * vAdjust.y;
	float H_ge18n4 = H_vmw6ia1 + H_wpjk2f1;
	vec2 H_2piom = vec2(H_04r3jz, H_ge18n4);
	vec2 H_d7pgxn1 = H_2piom * H_86eb9b1;
	vec2 H_fgm3b8 = C_vec2p0d5p + H_d7pgxn1;
	vec2 H_r79114 = H_ts6vqy1 * g_vTexCoordScroll2;
	vec2 H_5er5ru = H_fgm3b8 + H_r79114;
	vec2 H_s1mtpv = H_5er5ru + g_vTexCoordOffset2;
	vec4 H_cc01s61 = o.member6;
	H_cc01s61.xy = H_s1mtpv.xy;
	o.member6 = H_cc01s61;
	float param6 = C_0d0174533 * g_flTexCoordRotate3;
	vec2 H_17rqgn1 = vec2(g_flTexCoordScale3);
	float H_sby0eb = cos(param6);
	float H_hxbpp9 = sin(param6);
	float H_a8v13g = H_sby0eb * vAdjust.x;
	float H_3pfwuv = H_hxbpp9 * vAdjust.y;
	float H_1e5uc91 = H_a8v13g - H_3pfwuv;
	float H_40uwkv = H_hxbpp9 * vAdjust.x;
	float H_9xg1dg = H_sby0eb * vAdjust.y;
	float H_5jn71r1 = H_40uwkv + H_9xg1dg;
	vec2 H_1wmood = vec2(H_1e5uc91, H_5jn71r1);
	vec2 H_hglrzb1 = H_17rqgn1 * H_1wmood;
	vec2 H_cmm3071 = C_vec2p0d5p + H_hglrzb1;
	vec2 H_sin1r3 = H_ts6vqy1 * g_vTexCoordScroll3;
	vec2 H_gp0pqe1 = H_cmm3071 + H_sin1r3;
	vec2 H_1ttp8x1 = H_gp0pqe1 + g_vTexCoordOffset3;
	vec4 H_6j5izu = vec4(H_s1mtpv.x, H_s1mtpv.y, H_1ttp8x1.x, H_1ttp8x1.y);
	o.member6 = H_6j5izu;
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
	vec4 H_unzlmm1 = vec4(VS_INPUT_gl_vColorBlendValues.x, VS_INPUT_gl_vColorBlendValues.y, VS_INPUT_gl_vColorBlendValues.z, C_0d0);
	o.member3 = H_unzlmm1;
	vec4 H_cobels1 = vec4(H_7rv8k2.x, H_7rv8k2.y, H_7rv8k2.z, C_0d0);
	o.member4 = H_cobels1;
	PS_INPUT_gl_vPositionWs_flLinearDepth = o.member0;
	PS_INPUT_gl_vNormalWs_flSpecularAmount = o.member1;
	PS_INPUT_gl_vVertexColor = o.member2;
	PS_INPUT_gl_vColorBlendValues_BlendY = o.member3;
	PS_INPUT_gl_vAlphaBlendValues_BlendZ = o.member4;
	PS_INPUT_gl_vBaseTexCoord0_vBaseTexCoord1 = o.member5;
	PS_INPUT_gl_vBaseTexCoord2_vBaseTexCoord3 = o.member6;
	float H_rgxxo6 = C_0d0 - o.member7.y;
	float H_tdu3gi1 = C_2d0 * o.member7.z;
	float H_fbrf2q = H_tdu3gi1 - o.member7.w;
	vec4 H_b1m0271 = o.member7;
	H_b1m0271.yz = vec2(H_rgxxo6, H_fbrf2q);
	gl_Position = H_b1m0271;
	gl_ClipDistance[0] = o.member8;
}
