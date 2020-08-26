#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
uniform sampler2D g_tBaseTextureNoSRGB;
layout( binding = 0 ) uniform sampler2D g_tBaseTexture;
layout(std140, binding = 0 ) uniform SpriteCardPixelControls_t {
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
layout(std140) uniform PerViewConstantBuffer_t {
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
layout(std140) uniform SpritecardVertexControls_t {
	vec4 g_vecRadiusControls;
	vec4 g_vecExtraData;
	vec4 g_vecSequenceAddressingControls;
	vec4 g_vecDepthControlAndRotationCenterData;
	vec4 g_vecOrientationFadeControlData;
	vec4 g_vecTexelSizeControls;
	vec4 g_vecFinalUVOffsetAndScale;
	vec4 g_vecExtraData2;
} ;
uniform sampler2D g_tInputTexture;
layout(std140) uniform FilterTaps_t {
	vec4 g_vFilterControl;
	vec4 g_vTextureBounds;
	layout(row_major) mat4 g_matOutputTransform;
	vec4 g_vFilterTaps[32];
} ;
uniform sampler2D g_tClouds;
uniform sampler2DShadow g_tShadowDepthTexture;
layout(location=0) in vec4 PS_INPUT_gl_m_vTexCoords;
layout(location=1) in vec4 PS_INPUT_gl_m_vTintColor;
layout(location=2) in vec4 PS_INPUT_gl_vPositionWs_flLinearDepth;
layout(location=3) in vec3 PS_INPUT_gl_vNormalWs;
layout(location=4) in vec4 PS_INPUT_gl_m_vAnimationBlendValues;
layout(location=0) out vec4 PS_OUTPUT_gl_m_vColor;
const float C_1d0 = 1.0;
const vec3 C_vec3p0d0p = vec3(0.0);
const vec3 C_vec3p1d0p = vec3(1.0);
const vec3 C_3ivpjf1 = vec3(0.0, 0.0, 0.0);
const float C_0d0 = 0.0;
const vec2 C_0rznsf = vec2(2.0, 4.0);
const float C_6d0 = 6.0;
const float C_a1d0 = -1.0;
const vec2 C_vec2p0d0p = vec2(0.0);
const vec2 C_vec2p1d0p = vec2(1.0);
const float C_2d0 = 2.0;
const float C_3d0 = 3.0;
const float C_4d0 = 4.0;
const vec3 C_kfumqy1 = vec3(0.2125, 0.7154, 0.0721);
void main()
{
	vec3 vHSV;
	vec3 vRGB;
	vec4 vecSourceTexel = texture(g_tBaseTexture, PS_INPUT_gl_m_vTexCoords.xy);
	vec3 H_7tk0431 = PS_INPUT_gl_m_vTintColor.xyz * vecSourceTexel.xyz;
	float maxVal = max(H_7tk0431.y, H_7tk0431.z);
	float maxVal1 = max(H_7tk0431.x, maxVal);
	float maxVal2 = max(maxVal1, C_1d0);
	vec3 H_yiibq21 = vec3(maxVal2);
	vec3 param = H_7tk0431 / H_yiibq21;
	vec3 misc3a = clamp(param, C_vec3p0d0p, C_vec3p1d0p);
	float minVal = min(misc3a.y, misc3a.z);
	float minVal1 = min(misc3a.x, minVal);
	float maxVal3 = max(misc3a.y, misc3a.z);
	float maxVal4 = max(misc3a.x, maxVal3);
	vec3 H_c7z9ez = vec3(maxVal4);
	float delta = maxVal4 - minVal1;
	vec3 H_ba9l051 = vec3(delta);
	vec3 H_0jsavh = C_3ivpjf1;
	H_0jsavh.z = maxVal4;
	bool H_r1ts391 = delta == C_0d0;
	vHSV = H_0jsavh;
	if (! H_r1ts391) {
		float H_vimeyt1 = delta / maxVal4;
		vec3 H_19kzlb = H_c7z9ez - misc3a;
		vec3 H_pnk4fl1 = H_19kzlb / H_ba9l051;
		vec3 H_rvtdqx1 = H_pnk4fl1 - H_pnk4fl1.zxy;
		vec2 H_p1i37n = H_rvtdqx1.xy + C_0rznsf;
		bool H_ckeo3r1 = misc3a.x < maxVal4;
		bool H_3tcl58 = misc3a.y < maxVal4;
		vec3 H_0tjgpo = H_0jsavh;
		H_0tjgpo.xy = vec2(H_p1i37n.y, H_vimeyt1);
		vec3 H_0tjgpor = H_0jsavh;
		H_0tjgpor.xy = vec2(H_p1i37n.x, H_vimeyt1);
		vec3 select = H_3tcl58 ? H_0tjgpo : H_0tjgpor;
		vec3 H_nswv9 = vec3(H_rvtdqx1.z, H_vimeyt1, H_0jsavh.z);
		vec3 select1 = H_ckeo3r1 ? select : H_nswv9;
		float param1 = select1.x / C_6d0;
		float H_cb84n3 = fract(param1);
		vec3 H_kgk2q4 = select1;
		H_kgk2q4.x = H_cb84n3;
		vHSV = H_kgk2q4;
	}
	float H_09jtoa1 = g_vecHSVShiftShadowDensity.x + vHSV.x;
	bool H_ezifb9 = H_09jtoa1 < C_0d0;
	float param2 = C_1d0 + H_09jtoa1;
	float select2 = H_ezifb9 ? param2 : H_09jtoa1;
	float param3 = select2 + C_a1d0;
	vec2 H_rrw6uy = g_vecHSVShiftShadowDensity.yz * vHSV.yz;
	vec2 misc3a1 = clamp(H_rrw6uy, C_vec2p0d0p, C_vec2p1d0p);
	vec3 H_9jp4k6;
	H_9jp4k6.x = misc3a1.y;
	bool H_q7lyfv1 = misc3a1.x == C_0d0;
	vRGB = misc3a1.yyy;
	if (! H_q7lyfv1) {
		bool H_5z6bjd = param3 < C_0d0;
		float ternary = H_5z6bjd ? select2 : param3;
		float var_h = C_6d0 * ternary;
		float var_i = floor(var_h);
		float H_0sy0bp1 = C_1d0 - misc3a1.x;
		float var_ = H_0sy0bp1 * misc3a1.y;
		float H_jnl6uy = var_h - var_i;
		float H_jopa1w1 = H_jnl6uy * misc3a1.x;
		float H_darjw61 = C_1d0 - H_jopa1w1;
		float var_1 = H_darjw61 * misc3a1.y;
		float H_austyp1 = C_1d0 - H_jnl6uy;
		float H_wq7xb5 = H_austyp1 * misc3a1.x;
		float H_0la7fx1 = C_1d0 - H_wq7xb5;
		float var_2 = H_0la7fx1 * misc3a1.y;
		bool H_6h0jcf1 = var_i == C_0d0;
		vec3 H_6q1awy = H_9jp4k6;
		H_6q1awy.yz = vec2(var_2, var_);
		bool H_5yfbga1 = var_i == C_1d0;
		vec3 H_koxqxf1 = vec3(var_1, misc3a1.y, var_);
		bool H_o10iwj1 = var_i == C_2d0;
		vec3 H_dlj35v = vec3(var_, misc3a1.y, var_2);
		bool H_78ez2k = var_i == C_3d0;
		vec3 H_o34j6o = vec3(var_, var_1, misc3a1.y);
		bool H_q1ah4r1 = var_i == C_4d0;
		vec3 H_dpr3hm1 = vec3(var_2, var_, misc3a1.y);
		vec3 H_6q1awyr = H_9jp4k6;
		H_6q1awyr.yz = vec2(var_, var_1);
		vec3 select3 = H_q1ah4r1 ? H_dpr3hm1 : H_6q1awyr;
		vec3 select4 = H_78ez2k ? H_o34j6o : select3;
		vec3 select5 = H_o10iwj1 ? H_dlj35v : select4;
		vec3 select6 = H_5yfbga1 ? H_koxqxf1 : select5;
		vec3 select7 = H_6h0jcf1 ? H_6q1awy : select6;
		vRGB = select7;
	}
	vec3 H_4iwnh7 = H_yiibq21 * vRGB;
	float flLuminance = dot(H_4iwnh7, C_kfumqy1);
	vec3 H_t1lelu1 = vec3(flLuminance);
	vec3 vecSourceTexel1 = mix(H_4iwnh7, H_t1lelu1, g_flDesatAmount);
	vec4 H_s911ye1 = vecSourceTexel;
	H_s911ye1.xyz = vecSourceTexel1.xyz;
	vec4 vecSourceTexel2 = H_s911ye1 * g_vColorTransformScale;
	float H_6jtzu9 = g_flColorTransformAlphaBias + vecSourceTexel2.w;
	float misc3a2 = clamp(H_6jtzu9, C_0d0, C_1d0);
	float H_hpqrbr1 = PS_INPUT_gl_m_vTintColor.w * misc3a2;
	vec3 H_imt73b = vec3(H_hpqrbr1);
	vec3 misc3a3 = clamp(vecSourceTexel2.xyz, C_vec3p0d0p, C_vec3p1d0p);
	vec3 H_xbsgo61 = H_imt73b * misc3a3;
	float H_zr08kx = H_hpqrbr1 * g_vecBlendControl.w;
	vec4 H_oq7joo = vec4(H_xbsgo61.x, H_xbsgo61.y, H_xbsgo61.z, H_zr08kx);
	PS_OUTPUT_gl_m_vColor = H_oq7joo;
}
