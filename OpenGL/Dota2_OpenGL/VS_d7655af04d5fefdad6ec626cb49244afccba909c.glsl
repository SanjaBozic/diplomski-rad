//ATTRIBMAP-50-51-90-00-53-xx
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
layout(std140, binding = 12 ) uniform SpritecardVertexControls_t {
	vec4 g_vecRadiusControls;
	vec4 g_vecExtraData;
	vec4 g_vecSequenceAddressingControls;
	vec4 g_vecDepthControlAndRotationCenterData;
	vec4 g_vecOrientationFadeControlData;
	vec4 g_vecTexelSizeControls;
	vec4 g_vecFinalUVOffsetAndScale;
	vec4 g_vecExtraData2;
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
layout(std140, binding = 15 ) uniform SpriteCardPixelControls_t {
	vec4 g_vecPixelControls;
	vec4 g_vecBlendControl;
	vec4 g_vRefractControl;
	vec4 g_vecSeq0Scale;
	vec4 g_vecSeq0Bias;
	vec4 g_vecSeq0AlphaBlendControl;
	vec4 g_vecSeq1Scale;
	vec4 g_vecSeq1Bias;
	vec4 g_vecSeq1AlphaBlendControl;
	vec4 g_vecMotionVectorsControl;
	vec4 g_vColorTransformScale;
	float g_flColorTransformAlphaBias;
	float g_flDesatAmount;
	vec2 _g_vPadding_;
	vec4 g_vecOutlineColor;
	vec4 g_vecOutlineRanges;
	vec4 g_vecHSVShiftShadowDensity;
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
uniform sampler2D g_tParticleSheetTexture;
layout(std140) uniform SpritecardSheetData_t {
	vec4 g_vSheetDataIndex;
} ;
layout(std140) uniform SpritecardNormalSheetData_t {
	vec4 g_vNormalSheetDataIndex;
} ;
layout(std140) uniform SpritecardMotionVectorsSheetData_t {
	vec4 g_vMotionVectorsSheetDataIndex;
} ;
uniform sampler2D g_tBaseTexture;
uniform sampler2D g_tBaseTextureNoSRGB;
uniform sampler2D g_tClouds;
uniform sampler2DShadow g_tShadowDepthTexture;
layout(location=0) in vec2 VS_INPUT_gl_m_vCornerID;
layout(location=1) in vec4 VS_INPUT_gl_m_vSequenceAndTimeData;
layout(location=2) in vec4 VS_INPUT_gl_m_vTint;
layout(location=3) in vec3 VS_INPUT_gl_m_vPos;
layout(location=4) in vec4 VS_INPUT_gl_m_vRotationAndRadiusData;
out gl_PerVertex {
	vec4 gl_Position;
	float gl_ClipDistance[1];
} ;
layout(location=0) out vec4 PS_INPUT_gl_m_vTexCoords;
layout(location=1) out vec4 PS_INPUT_gl_m_vTintColor;
layout(location=2) out vec4 PS_INPUT_gl_vPositionWs_flLinearDepth;
layout(location=3) out vec3 PS_INPUT_gl_vNormalWs;
layout(location=4) out vec4 PS_INPUT_gl_m_vAnimationBlendValues;
const float C_0d0 = 0.0;
const float C_0d5 = 0.5;
const float C_a0d5 = -0.5;
const vec3 C_vec3p12d92p = vec3(12.92);
const vec3 C_vec3p1d055p = vec3(1.055);
const vec3 C_bw96as = vec3(0.0521327);
const vec3 C_vec3p2d4p = vec3(2.4);
const float C_0d04045 = 0.04045;
const vec3 C_1fua5g = vec3(0.0, -1.0, 0.0);
const vec3 C_ypnorl1 = vec3(1.0, 0.0, 0.0);
const float C_1d0 = 1.0;
const vec4 C_vec4p0d0p = vec4(0.0);
const float C_0d00392157 = 0.00392157;
const float C_0d001 = 0.001;
const vec3 C_vec3p0d0p = vec3(0.0);
const vec4 C_8k04jx = vec4(1.0, 0.0, 1.0, 0.0);
const float C_2d0 = 2.0;
void main()
{
	vec4 param;
	float param1;
	gl_ClipDistance[0] = C_0d0;
	float H_1kbkgh1 = VS_INPUT_gl_m_vCornerID.x * C_0d5;
	float H_jex36n1 = C_0d5 + H_1kbkgh1;
	float H_9bzbx5 = VS_INPUT_gl_m_vCornerID.y * C_a0d5;
	float H_whevlw = C_0d5 + H_9bzbx5;
	vec4 H_4p7ye11 = vec4(H_jex36n1, H_whevlw, H_jex36n1, H_whevlw);
	float H_m7577j1 = C_0d5 * VS_INPUT_gl_m_vCornerID.y;
	float H_w5pvb6 = C_0d5 + H_m7577j1;
	float flDistance = mix(VS_INPUT_gl_m_vSequenceAndTimeData.x, VS_INPUT_gl_m_vSequenceAndTimeData.y, H_w5pvb6);
	vec4 H_uu6dtn = H_4p7ye11 * g_vecFinalUVOffsetAndScale.zwzw;
	vec4 H_eqzjsp = H_uu6dtn + g_vecFinalUVOffsetAndScale.xyxy;
	float H_48kbar1 = flDistance + g_vecTexelSizeControls.z;
	float H_5beijh1 = H_48kbar1 * g_vecTexelSizeControls.w;
	float H_qmduo9 = H_5beijh1 * g_vecFinalUVOffsetAndScale.w;
	float H_k1gvhu = H_qmduo9 + g_vecFinalUVOffsetAndScale.y;
	vec2 H_fid00w = vec2(H_k1gvhu);
	vec2 H_ixjc2c = mix(H_eqzjsp.yw, H_fid00w, g_vecTexelSizeControls.x);
	vec4 H_5qazuw = H_eqzjsp;
	H_5qazuw.yw = H_ixjc2c.xy;
	vec3 vLinearSegment = VS_INPUT_gl_m_vTint.xyz / C_vec3p12d92p;
	vec3 H_t1ew65 = VS_INPUT_gl_m_vTint.xyz / C_vec3p1d055p;
	vec3 H_fsgtks = H_t1ew65 + C_bw96as;
	vec3 vExpSegment = pow(H_fsgtks, C_vec3p2d4p);
	bool H_woa5qi1 = VS_INPUT_gl_m_vTint.x > C_0d04045;
	float select = H_woa5qi1 ? vExpSegment.x : vLinearSegment.x;
	bool H_zk280s = VS_INPUT_gl_m_vTint.y > C_0d04045;
	float select1 = H_zk280s ? vExpSegment.y : vLinearSegment.y;
	bool H_2iabxr = VS_INPUT_gl_m_vTint.z > C_0d04045;
	float select2 = H_2iabxr ? vExpSegment.z : vLinearSegment.z;
	vec4 H_6033rx = vec4(select, select1, select2, VS_INPUT_gl_m_vTint.w);
	vec4 vecTint = mix(VS_INPUT_gl_m_vTint, H_6033rx, g_vecExtraData2.x);
	float flCosRot = cos(VS_INPUT_gl_m_vRotationAndRadiusData.x);
	vec3 H_zxczdp = vec3(flCosRot);
	float flSinRot = sin(VS_INPUT_gl_m_vRotationAndRadiusData.x);
	vec3 H_yaca1b = vec3(flSinRot);
	vec3 H_g944pm = H_zxczdp * C_1fua5g;
	vec3 H_ig8dbd = H_yaca1b * C_ypnorl1;
	vec3 H_tdqazs = H_g944pm + H_ig8dbd;
	vec3 H_293u8w = C_ypnorl1 * H_zxczdp;
	vec3 H_g3zim31 = C_1fua5g * H_yaca1b;
	vec3 H_6kkxqj = H_293u8w - H_g3zim31;
	float flSin = sin(VS_INPUT_gl_m_vRotationAndRadiusData.y);
	float flCos = cos(VS_INPUT_gl_m_vRotationAndRadiusData.y);
	float flAxisXSquared = H_6kkxqj.x * H_6kkxqj.x;
	float flAxisYSquared = H_6kkxqj.y * H_6kkxqj.y;
	float flAxisZSquared = H_6kkxqj.z * H_6kkxqj.z;
	float H_1zt6w01 = C_1d0 - flAxisXSquared;
	float H_itict51 = H_1zt6w01 * flCos;
	float H_m0w0j91 = H_itict51 + flAxisXSquared;
	float H_mdo2q51 = H_6kkxqj.x * H_6kkxqj.y;
	float H_k83isr = C_1d0 - flCos;
	float H_u9f30z = H_k83isr * H_mdo2q51;
	float H_p9f7j51 = H_6kkxqj.z * flSin;
	float H_lo7prz = H_p9f7j51 + H_u9f30z;
	float H_no23g51 = H_6kkxqj.x * H_6kkxqj.z;
	float H_kedlam1 = H_k83isr * H_no23g51;
	float H_4sj4b8 = H_6kkxqj.y * flSin;
	float H_m6b53y = H_kedlam1 - H_4sj4b8;
	float H_jp35i6 = H_u9f30z - H_p9f7j51;
	float H_0hkqtj1 = C_1d0 - flAxisYSquared;
	float H_aobm0p = H_0hkqtj1 * flCos;
	float H_73knml1 = H_aobm0p + flAxisYSquared;
	float H_u21eej = H_6kkxqj.y * H_6kkxqj.z;
	float H_vor7rn = H_k83isr * H_u21eej;
	float H_r2v1qt = H_6kkxqj.x * flSin;
	float H_e34zt61 = H_r2v1qt + H_vor7rn;
	float H_uqguxs = H_4sj4b8 + H_kedlam1;
	float H_s5u4f1 = H_vor7rn - H_r2v1qt;
	float H_7i1isn1 = C_1d0 - flAxisZSquared;
	float H_lr8md3 = H_7i1isn1 * flCos;
	float H_rv88f5 = H_lr8md3 + flAxisZSquared;
	vec3 H_gwfyku1 = vec3(H_m0w0j91, H_jp35i6, H_uqguxs);
	vec3 H_7vmyxd1 = vec3(H_lo7prz, H_73knml1, H_s5u4f1);
	vec3 H_23bxze = vec3(H_m6b53y, H_e34zt61, H_rv88f5);
	float dotres = dot(H_tdqazs, H_gwfyku1);
	float dotres1 = dot(H_tdqazs, H_7vmyxd1);
	float dotres2 = dot(H_tdqazs, H_23bxze);
	vec3 H_3cij4j1 = vec3(dotres, dotres1, dotres2);
	float H_0vgzbo1 = VS_INPUT_gl_m_vCornerID.x + g_vecDepthControlAndRotationCenterData.y;
	vec3 H_9rly2r = vec3(H_0vgzbo1);
	vec3 H_l57h3f1 = H_3cij4j1 * H_9rly2r;
	float H_0hb90j1 = VS_INPUT_gl_m_vCornerID.y + g_vecDepthControlAndRotationCenterData.z;
	vec3 H_y0t86z = vec3(H_0hb90j1);
	vec3 H_nfrrhp1 = H_6kkxqj * H_y0t86z;
	vec3 H_xqkwq91 = H_l57h3f1 + H_nfrrhp1;
	vec3 H_5vlz4l1 = g_vCameraPositionWs - VS_INPUT_gl_m_vPos;
	float flDistanceFromEyeToParticle = length(H_5vlz4l1);
	bool H_ab3nes1 = g_vecOrientationFadeControlData.z > C_0d0;
	param = vecTint;
	param1 = VS_INPUT_gl_m_vRotationAndRadiusData.w;
	if (H_ab3nes1) {
		float H_1fzll = flDistanceFromEyeToParticle * g_vecRadiusControls.y;
		bool H_0fy6si = VS_INPUT_gl_m_vRotationAndRadiusData.w > H_1fzll;
		float H_8b8rsy1 = flDistanceFromEyeToParticle * g_vecRadiusControls.z;
		bool H_0mhdov1 = VS_INPUT_gl_m_vRotationAndRadiusData.w > H_8b8rsy1;
		float H_dgfxa7 = VS_INPUT_gl_m_vRotationAndRadiusData.w - H_1fzll;
		float H_d9g5p91 = g_vecRadiusControls.z - g_vecRadiusControls.y;
		float H_o95ex61 = H_d9g5p91 * flDistanceFromEyeToParticle;
		float H_aiav7a = H_dgfxa7 / H_o95ex61;
		float H_rl2wwh1 = C_1d0 - H_aiav7a;
		vec4 H_0qwkvf1 = vec4(H_rl2wwh1);
		vec4 H_l9aejv1 = H_0qwkvf1 * vecTint;
		vec4 select3 = H_0mhdov1 ? C_vec4p0d0p : H_l9aejv1;
		vec4 select4 = H_0fy6si ? select3 : vecTint;
		float param2 = flDistanceFromEyeToParticle * g_vecRadiusControls.x;
		float param3 = flDistanceFromEyeToParticle * g_vecRadiusControls.w;
		float H_3cvx9d1 = clamp(VS_INPUT_gl_m_vRotationAndRadiusData.w, param2, param3);
		param = select4;
		param1 = H_3cvx9d1;
	}
	bool H_gud1601 = param.w < C_0d00392157;
	float param4 = H_gud1601 ? C_0d0 : param1;
	vec3 H_kpd7uy = vec3(param4);
	float flAlphaAdjustment = VS_INPUT_gl_m_vRotationAndRadiusData.w / param4;
	float vecTint1 = mix(C_1d0, flAlphaAdjustment, g_vecOrientationFadeControlData.w);
	float H_771o8l = param.w * vecTint1;
	vec3 H_fph1j9 = H_kpd7uy * H_xqkwq91;
	vec3 vecWorldPos = H_fph1j9 + VS_INPUT_gl_m_vPos;
	vec4 H_i283401 = vec4(vecWorldPos.x, vecWorldPos.y, vecWorldPos.z, C_1d0);
	vec4 H_bo52ih1 = H_i283401 + g_vWorldToCameraOffsetMultiview[0];
	float dotres3 = dot(H_bo52ih1, g_matWorldToProjectionMultiview[0][0]);
	float dotres4 = dot(H_bo52ih1, g_matWorldToProjectionMultiview[0][1]);
	float dotres5 = dot(H_bo52ih1, g_matWorldToProjectionMultiview[0][2]);
	float dotres6 = dot(H_bo52ih1, g_matWorldToProjectionMultiview[0][3]);
	vec3 H_b734ov1 = g_vCameraDirWs * g_vecDepthControlAndRotationCenterData.xxx;
	vec3 param5 = H_b734ov1 + vecWorldPos;
	vec4 H_u7v683 = vec4(param5.x, param5.y, param5.z, C_1d0);
	vec4 H_z5ctld1 = H_u7v683 + g_vWorldToCameraOffsetMultiview[0];
	float dotres7 = dot(H_z5ctld1, g_matWorldToProjectionMultiview[0][2]);
	float dotres8 = dot(H_z5ctld1, g_matWorldToProjectionMultiview[0][3]);
	float H_nbz4rl1 = dotres7 / dotres8;
	float flDesiredZ = H_nbz4rl1 * dotres6;
	float misc2a = min(C_0d001, dotres5);
	float misc2a1 = max(flDesiredZ, misc2a);
	vec3 H_ejiuyb = vecWorldPos - g_vCameraPositionWs;
	float H_yil48l1 = dot(g_vCameraDirWs, H_ejiuyb);
	vec4 H_f4kfbg1 = vec4(vecWorldPos.x, vecWorldPos.y, vecWorldPos.z, H_yil48l1);
	vec3 vCameraToWorld = vecWorldPos - g_vCameraPositionWs;
	vec3 H_tbpgk91 = C_vec3p0d0p - vCameraToWorld;
	vec3 vNormalWs = normalize(H_tbpgk91);
	float H_hinrhc = dot(H_i283401, g_vClipPlane0);
	vec3 H_j03jbn = C_vec3p0d0p - g_vGlobalLightDir;
	float flNDotL = dot(H_j03jbn, vNormalWs);
	float misc3a = clamp(flNDotL, C_0d0, C_1d0);
	vec3 H_lzb5nn1 = vec3(misc3a);
	float flAmbientNdotL = dot(g_vGlobalLightAmbientDir, vNormalWs);
	float misc3a1 = clamp(flAmbientNdotL, C_0d0, C_1d0);
	float H_nf97ey = C_0d5 * vNormalWs.z;
	float H_ufn3gr1 = C_0d5 + H_nf97ey;
	vec3 vShadowAmbientColor = mix(g_vGlobalLightAmbientColor3, g_vGlobalLightAmbientColor2, H_ufn3gr1);
	vec3 H_s7noda1 = vec3(g_flGlobalLightAmbientScale2);
	vec3 vShadowAmbientColor1 = H_s7noda1 * vShadowAmbientColor;
	vec3 H_ow3p99 = H_lzb5nn1 * g_vGlobalLightColor;
	float H_20af7c1 = g_flGlobalLightAmbientScale1 * misc3a1;
	vec3 H_uwwiot = vec3(H_20af7c1);
	vec3 H_caodfv = H_uwwiot * g_vGlobalLightAmbientColor1;
	vec3 H_oap4u6 = H_caodfv + H_ow3p99;
	float H_fhpmz7 = C_1d0 - misc3a;
	vec3 H_w9ymz71 = vec3(H_fhpmz7);
	vec3 H_uz1i81 = H_w9ymz71 * vShadowAmbientColor1;
	vec3 vLighting = H_oap4u6 + H_uz1i81;
	vec3 H_remlte1 = param.xyz * vLighting;
	vec3 H_cvpgvi = H_remlte1 * g_vRefractControl.zzz;
	vec3 H_bowvye1 = H_cvpgvi * g_vecBlendControl.zzz;
	vec4 H_kghe1o1 = vec4(H_bowvye1.x, H_bowvye1.y, H_bowvye1.z, H_771o8l);
	PS_INPUT_gl_m_vTexCoords = H_5qazuw;
	PS_INPUT_gl_m_vTintColor = H_kghe1o1;
	PS_INPUT_gl_vPositionWs_flLinearDepth = H_f4kfbg1;
	PS_INPUT_gl_vNormalWs = vNormalWs;
	PS_INPUT_gl_m_vAnimationBlendValues = C_8k04jx;
	float H_rdf2pt1 = C_0d0 - dotres4;
	float H_1is19k = misc2a1 * C_2d0;
	float H_6cdnge1 = H_1is19k - dotres6;
	vec4 H_c6tviq = vec4(dotres3, H_rdf2pt1, H_6cdnge1, dotres6);
	gl_Position = H_c6tviq;
	gl_ClipDistance[0] = H_hinrhc;
}
