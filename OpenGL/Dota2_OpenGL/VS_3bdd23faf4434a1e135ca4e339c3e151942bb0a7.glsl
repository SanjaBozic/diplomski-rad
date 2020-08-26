//ATTRIBMAP-50-51-90-00-53-xx
#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout(std140, binding = 14 ) uniform PerViewConstantBuffer_t {
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
layout(std140, binding = 13 ) uniform SpritecardVertexControls_t {
	vec4 g_vecRadiusControls;
	vec4 g_vecExtraData;
	vec4 g_vecSequenceAddressingControls;
	vec4 g_vecDepthControlAndRotationCenterData;
	vec4 g_vecOrientationFadeControlData;
	vec4 g_vecTexelSizeControls;
	vec4 g_vecFinalUVOffsetAndScale;
	vec4 g_vecExtraData2;
} ;
layout(std140, binding = 12 ) uniform SpritecardSheetData_t {
	vec4 g_vSheetDataIndex;
} ;
layout( binding = 18 ) uniform sampler2D g_tParticleSheetTexture;
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
const float C_1d0 = 1.0;
const float C_3d0 = 3.0;
const vec2 C_a1z03r = vec2(0.0, 0.0);
const float C_2d0 = 2.0;
const float C_a2d0 = -2.0;
const vec4 C_vec4pa0d5p = vec4(-0.5);
const vec4 C_vec4p0d5p = vec4(0.5);
const vec4 C_vec4p2d0p = vec4(2.0);
const vec2 C_vec2p0d0p = vec2(0.0);
const vec2 C_vec2p1d0p = vec2(1.0);
const vec2 C_vec2p2d0p = vec2(2.0);
const vec3 C_vec3p12d92p = vec3(12.92);
const vec3 C_vec3p1d055p = vec3(1.055);
const vec3 C_bw96as = vec3(0.0521327);
const vec3 C_vec3p2d4p = vec3(2.4);
const float C_0d04045 = 0.04045;
const vec4 C_vec4p0d0p = vec4(0.0);
const float C_0d00392157 = 0.00392157;
const float C_0d001 = 0.001;
const vec3 C_vec3p0d0p = vec3(0.0);
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
	float H_fz8gko1 = C_1d0 / g_vSheetDataIndex.y;
	float param2 = VS_INPUT_gl_m_vSequenceAndTimeData.x - g_vSheetDataIndex.w;
	bool H_m4x45s = param2 < C_0d0;
	float phitmp = VS_INPUT_gl_m_vSequenceAndTimeData.x * C_3d0;
	float select = H_m4x45s ? phitmp : C_0d0;
	float H_0ql1v01 = g_vSheetDataIndex.z * select;
	float H_jf16um = H_0ql1v01 + g_vSheetDataIndex.x;
	vec2 H_23b4ob1 = C_a1z03r;
	H_23b4ob1.y = H_jf16um;
	vec4 vecSequenceControlData = textureLod(g_tParticleSheetTexture, H_23b4ob1, C_0d0);
	float H_8sap0s = C_0d5 * g_vSheetDataIndex.y;
	float H_31hyrm1 = H_8sap0s * VS_INPUT_gl_m_vSequenceAndTimeData.z;
	float flSequenceIndexingTime = H_31hyrm1 * g_vecSequenceAddressingControls.x;
	float H_i2zja7 = fract(flSequenceIndexingTime);
	float flTexFrameIndex = floor(flSequenceIndexingTime);
	float flTexFrameIndex1 = flTexFrameIndex * C_2d0;
	bool H_ddp27s1 = vecSequenceControlData.z > C_0d0;
	float param3 = g_vSheetDataIndex.y + C_a2d0;
	float misc2a = min(param3, flTexFrameIndex1);
	float H_1o68ll1 = mod(flTexFrameIndex1, g_vSheetDataIndex.y);
	float select1 = H_ddp27s1 ? misc2a : H_1o68ll1;
	float flTexFrameIndex2 = H_fz8gko1 * select1;
	vec2 H_k06g5s1 = vec2(flTexFrameIndex2, H_jf16um);
	vec4 vFrameControlData = textureLod(g_tParticleSheetTexture, H_k06g5s1, C_0d0);
	float H_bhjmxk = mix(vFrameControlData.x, vFrameControlData.w, H_i2zja7);
	float H_9hsm8w = H_jf16um + g_vSheetDataIndex.z;
	vec2 H_nhdvv4 = vec2(flTexFrameIndex2, H_9hsm8w);
	vec4 H_7wi6px1 = textureLod(g_tParticleSheetTexture, H_nhdvv4, C_0d0);
	float H_k46du = C_2d0 * g_vSheetDataIndex.z;
	float H_7qkvko = H_jf16um + H_k46du;
	vec2 H_qwhub91 = vec2(flTexFrameIndex2, H_7qkvko);
	vec4 H_409qyl1 = textureLod(g_tParticleSheetTexture, H_qwhub91, C_0d0);
	float H_7w4koi1 = H_fz8gko1 + flTexFrameIndex2;
	vec2 H_s1uajz = vec2(H_7w4koi1, H_9hsm8w);
	vec4 H_f1zua7 = textureLod(g_tParticleSheetTexture, H_s1uajz, C_0d0);
	vec2 vCroppedSize = H_f1zua7.zw - H_f1zua7.xy;
	vec2 H_ico401 = H_7wi6px1.zw - H_7wi6px1.xy;
	vec2 vUncroppedSize = H_ico401 / vCroppedSize;
	vec2 H_wgxaqh = H_f1zua7.xy * vUncroppedSize;
	vec2 H_bdpy9p1 = H_7wi6px1.xy - H_wgxaqh;
	vec2 H_7itzqn = H_bdpy9p1 + vUncroppedSize;
	vec2 H_u6lrps1 = H_409qyl1.zw - H_409qyl1.xy;
	vec2 vUncroppedSize1 = H_u6lrps1 / vCroppedSize;
	vec2 H_zscsvo = H_f1zua7.xy * vUncroppedSize1;
	vec2 H_vcjwrl1 = H_409qyl1.xy - H_zscsvo;
	vec2 H_49nf3d1 = H_vcjwrl1 + vUncroppedSize1;
	float param4 = C_1d0 / g_vecSequenceAddressingControls.z;
	float misc3a = clamp(param4, C_0d0, C_1d0);
	vec4 H_kd1ous = vec4(misc3a);
	vec4 H_646op7 = H_4p7ye11 + C_vec4pa0d5p;
	vec4 H_o2xvs01 = H_646op7 * H_kd1ous;
	vec4 vZoomedUVs = H_o2xvs01 + C_vec4p0d5p;
	float H_z9n5hl = C_0d5 * H_bhjmxk;
	float H_4ty8x61 = C_0d5 + H_z9n5hl;
	vec4 H_y1ofkt1 = vec4(H_4ty8x61, H_4ty8x61, H_z9n5hl, H_z9n5hl);
	vec4 vLerpedValue = mix(H_4p7ye11, vZoomedUVs, H_y1ofkt1);
	float H_bv8qvl = g_vecFinalUVOffsetAndScale.z * vLerpedValue.x;
	float H_33kuvq = H_bv8qvl + g_vecFinalUVOffsetAndScale.x;
	float H_tg3onf1 = g_vecFinalUVOffsetAndScale.w * vLerpedValue.y;
	float H_l5gf1j1 = H_tg3onf1 + g_vecFinalUVOffsetAndScale.y;
	float H_99gpfm = g_vecFinalUVOffsetAndScale.z * vLerpedValue.z;
	float H_cs9wd5 = H_99gpfm + g_vecFinalUVOffsetAndScale.x;
	float H_7rntrb1 = g_vecFinalUVOffsetAndScale.w * vLerpedValue.w;
	float H_dqz5sk = H_7rntrb1 + g_vecFinalUVOffsetAndScale.y;
	vec4 H_2wsz46 = vec4(H_33kuvq, H_l5gf1j1, H_cs9wd5, H_dqz5sk);
	vec4 vDeltaUV = g_vecFinalUVOffsetAndScale.xyxy - H_2wsz46;
	vec4 vDeltaUV1 = vDeltaUV * C_vec4p2d0p;
	vec4 vDeltaUV2 = g_vecFinalUVOffsetAndScale.zwzw + vDeltaUV1;
	bool H_cev5er = vDeltaUV2.x < C_0d0;
	float H_hfcrim = H_cev5er ? H_f1zua7.z : H_f1zua7.x;
	bool H_nc5hii1 = vDeltaUV2.y < C_0d0;
	float vTestCorner = H_nc5hii1 ? H_f1zua7.w : H_f1zua7.y;
	vec2 H_t86n621 = vec2(H_hfcrim, vTestCorner);
	vec2 H_vulic1 = vec2(H_33kuvq, H_l5gf1j1);
	vec2 H_3b3i331 = H_t86n621 - H_vulic1;
	vec2 param5 = H_3b3i331 / vDeltaUV2.xy;
	vec2 misc3a1 = clamp(param5, C_vec2p0d0p, C_vec2p1d0p);
	vec4 H_jn1u79 = misc3a1.xyxy * vDeltaUV2;
	vec4 vSeq0LocalCornerUVs = H_2wsz46 + H_jn1u79;
	vec2 H_qvrh911 = misc3a1 * C_vec2p2d0p;
	vec2 H_29apti1 = C_vec2p1d0p - H_qvrh911;
	vec2 H_zxm9bg = H_29apti1 * VS_INPUT_gl_m_vCornerID;
	vec2 H_2uuij31 = H_7itzqn - H_bdpy9p1;
	vec2 H_5uk7ab1 = H_2uuij31 * vSeq0LocalCornerUVs.xy;
	vec2 H_bzuja31 = H_5uk7ab1 + H_bdpy9p1;
	vec2 H_iroh6h1 = H_49nf3d1 - H_vcjwrl1;
	vec2 H_rpare7 = H_iroh6h1 * vSeq0LocalCornerUVs.zw;
	vec2 H_mxht6l1 = H_rpare7 + H_vcjwrl1;
	vec4 H_c3n6se1 = vec4(H_bzuja31.x, H_bzuja31.y, H_mxht6l1.x, H_mxht6l1.y);
	vec4 H_4likw5 = vec4(H_bhjmxk, C_0d0, C_1d0, C_0d0);
	vec3 vLinearSegment = VS_INPUT_gl_m_vTint.xyz / C_vec3p12d92p;
	vec3 H_t1ew65 = VS_INPUT_gl_m_vTint.xyz / C_vec3p1d055p;
	vec3 H_fsgtks = H_t1ew65 + C_bw96as;
	vec3 vExpSegment = pow(H_fsgtks, C_vec3p2d4p);
	bool H_woa5qi1 = VS_INPUT_gl_m_vTint.x > C_0d04045;
	float select2 = H_woa5qi1 ? vExpSegment.x : vLinearSegment.x;
	bool H_zk280s = VS_INPUT_gl_m_vTint.y > C_0d04045;
	float select3 = H_zk280s ? vExpSegment.y : vLinearSegment.y;
	bool H_2iabxr = VS_INPUT_gl_m_vTint.z > C_0d04045;
	float select4 = H_2iabxr ? vExpSegment.z : vLinearSegment.z;
	vec4 H_arfuzm1 = vec4(select2, select3, select4, VS_INPUT_gl_m_vTint.w);
	vec4 vecTint = mix(VS_INPUT_gl_m_vTint, H_arfuzm1, g_vecExtraData2.x);
	vec3 vRight = cross(g_vCameraDirWs, g_vCameraUpDirWs);
	float flCosRot = cos(VS_INPUT_gl_m_vRotationAndRadiusData.x);
	vec3 H_zxczdp = vec3(flCosRot);
	float flSinRot = sin(VS_INPUT_gl_m_vRotationAndRadiusData.x);
	vec3 H_yaca1b = vec3(flSinRot);
	vec3 H_3j552u = H_zxczdp * vRight;
	vec3 H_6fa65h = H_yaca1b * g_vCameraUpDirWs;
	vec3 H_men0jq1 = H_3j552u + H_6fa65h;
	vec3 H_wi1nec1 = H_zxczdp * g_vCameraUpDirWs;
	vec3 H_l64tfc = H_yaca1b * vRight;
	vec3 H_f7awl61 = H_wi1nec1 - H_l64tfc;
	float flSin = sin(VS_INPUT_gl_m_vRotationAndRadiusData.y);
	float flCos = cos(VS_INPUT_gl_m_vRotationAndRadiusData.y);
	float flAxisXSquared = H_f7awl61.x * H_f7awl61.x;
	float flAxisYSquared = H_f7awl61.y * H_f7awl61.y;
	float flAxisZSquared = H_f7awl61.z * H_f7awl61.z;
	float H_1zt6w01 = C_1d0 - flAxisXSquared;
	float H_itict51 = H_1zt6w01 * flCos;
	float H_m0w0j91 = H_itict51 + flAxisXSquared;
	float H_2yunxl1 = H_f7awl61.x * H_f7awl61.y;
	float H_k83isr = C_1d0 - flCos;
	float H_uw1pwt1 = H_2yunxl1 * H_k83isr;
	float H_uyukzc = H_f7awl61.z * flSin;
	float H_oavh5e = H_uw1pwt1 + H_uyukzc;
	float H_399onl1 = H_f7awl61.x * H_f7awl61.z;
	float H_6co2me = H_399onl1 * H_k83isr;
	float H_vxki3e1 = H_f7awl61.y * flSin;
	float H_xgvqn61 = H_6co2me - H_vxki3e1;
	float H_ahm98y1 = H_uw1pwt1 - H_uyukzc;
	float H_0hkqtj1 = C_1d0 - flAxisYSquared;
	float H_aobm0p = H_0hkqtj1 * flCos;
	float H_73knml1 = H_aobm0p + flAxisYSquared;
	float H_sqqax61 = H_f7awl61.y * H_f7awl61.z;
	float H_8jd1x6 = H_k83isr * H_sqqax61;
	float H_gdfg0f1 = H_f7awl61.x * flSin;
	float H_oqg2vu = H_8jd1x6 + H_gdfg0f1;
	float H_bo083l1 = H_6co2me + H_vxki3e1;
	float H_q2rsar = H_8jd1x6 - H_gdfg0f1;
	float H_7i1isn1 = C_1d0 - flAxisZSquared;
	float H_lr8md3 = H_7i1isn1 * flCos;
	float H_rv88f5 = H_lr8md3 + flAxisZSquared;
	vec3 H_6gcnv91 = vec3(H_m0w0j91, H_ahm98y1, H_bo083l1);
	vec3 H_cx3hhg = vec3(H_oavh5e, H_73knml1, H_q2rsar);
	vec3 H_23z3v01 = vec3(H_xgvqn61, H_oqg2vu, H_rv88f5);
	float dotres = dot(H_men0jq1, H_6gcnv91);
	float dotres1 = dot(H_men0jq1, H_cx3hhg);
	float dotres2 = dot(H_men0jq1, H_23z3v01);
	vec3 H_3cij4j1 = vec3(dotres, dotres1, dotres2);
	float H_l4am0o1 = H_zxm9bg.x + g_vecDepthControlAndRotationCenterData.y;
	vec3 H_inio9l = vec3(H_l4am0o1);
	vec3 H_j2ki6s = H_3cij4j1 * H_inio9l;
	float H_lq7nga1 = H_zxm9bg.y + g_vecDepthControlAndRotationCenterData.z;
	vec3 H_j0cr26 = vec3(H_lq7nga1);
	vec3 H_geuufd = H_f7awl61 * H_j0cr26;
	vec3 H_h2adly = H_geuufd + H_j2ki6s;
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
		vec4 select5 = H_0mhdov1 ? C_vec4p0d0p : H_l9aejv1;
		vec4 select6 = H_0fy6si ? select5 : vecTint;
		float param6 = flDistanceFromEyeToParticle * g_vecRadiusControls.x;
		float param7 = flDistanceFromEyeToParticle * g_vecRadiusControls.w;
		float H_v9ug5a1 = clamp(VS_INPUT_gl_m_vRotationAndRadiusData.w, param6, param7);
		param = select6;
		param1 = H_v9ug5a1;
	}
	bool H_gud1601 = param.w < C_0d00392157;
	float param8 = H_gud1601 ? C_0d0 : param1;
	vec3 H_098nor1 = vec3(param8);
	float flAlphaAdjustment = VS_INPUT_gl_m_vRotationAndRadiusData.w / param8;
	float vecTint1 = mix(C_1d0, flAlphaAdjustment, g_vecOrientationFadeControlData.w);
	float H_771o8l = param.w * vecTint1;
	vec3 H_q94xdj = H_098nor1 * H_h2adly;
	vec3 vecWorldPos = H_q94xdj + VS_INPUT_gl_m_vPos;
	vec4 H_i283401 = vec4(vecWorldPos.x, vecWorldPos.y, vecWorldPos.z, C_1d0);
	vec4 H_bo52ih1 = H_i283401 + g_vWorldToCameraOffsetMultiview[0];
	float dotres3 = dot(H_bo52ih1, g_matWorldToProjectionMultiview[0][0]);
	float dotres4 = dot(H_bo52ih1, g_matWorldToProjectionMultiview[0][1]);
	float dotres5 = dot(H_bo52ih1, g_matWorldToProjectionMultiview[0][2]);
	float dotres6 = dot(H_bo52ih1, g_matWorldToProjectionMultiview[0][3]);
	vec3 H_b734ov1 = g_vCameraDirWs * g_vecDepthControlAndRotationCenterData.xxx;
	vec3 param9 = H_b734ov1 + vecWorldPos;
	vec4 H_e0tn48 = vec4(param9.x, param9.y, param9.z, C_1d0);
	vec4 H_9tjrbj1 = H_e0tn48 + g_vWorldToCameraOffsetMultiview[0];
	float dotres7 = dot(H_9tjrbj1, g_matWorldToProjectionMultiview[0][2]);
	float dotres8 = dot(H_9tjrbj1, g_matWorldToProjectionMultiview[0][3]);
	float H_nbz4rl1 = dotres7 / dotres8;
	float flDesiredZ = H_nbz4rl1 * dotres6;
	float misc2a1 = min(C_0d001, dotres5);
	float misc2a2 = max(flDesiredZ, misc2a1);
	vec3 H_ejiuyb = vecWorldPos - g_vCameraPositionWs;
	float H_yil48l1 = dot(g_vCameraDirWs, H_ejiuyb);
	vec4 H_f4kfbg1 = vec4(vecWorldPos.x, vecWorldPos.y, vecWorldPos.z, H_yil48l1);
	vec3 vCameraToWorld = vecWorldPos - g_vCameraPositionWs;
	vec3 H_tbpgk91 = C_vec3p0d0p - vCameraToWorld;
	vec3 vNormalWs = normalize(H_tbpgk91);
	float H_hinrhc = dot(H_i283401, g_vClipPlane0);
	vec3 H_97llm = g_vRefractControl.zzz * param.xyz;
	vec3 H_htmm3o1 = H_97llm * g_vecBlendControl.zzz;
	vec4 H_8tje981 = vec4(H_htmm3o1.x, H_htmm3o1.y, H_htmm3o1.z, H_771o8l);
	PS_INPUT_gl_m_vTexCoords = H_c3n6se1;
	PS_INPUT_gl_m_vTintColor = H_8tje981;
	PS_INPUT_gl_vPositionWs_flLinearDepth = H_f4kfbg1;
	PS_INPUT_gl_vNormalWs = vNormalWs;
	PS_INPUT_gl_m_vAnimationBlendValues = H_4likw5;
	float H_rdf2pt1 = C_0d0 - dotres4;
	float H_cxj8qc1 = C_2d0 * misc2a2;
	float H_sh4wdj = H_cxj8qc1 - dotres6;
	vec4 H_cgmjtr = vec4(dotres3, H_rdf2pt1, H_sh4wdj, dotres6);
	gl_Position = H_cgmjtr;
	gl_ClipDistance[0] = H_hinrhc;
}
