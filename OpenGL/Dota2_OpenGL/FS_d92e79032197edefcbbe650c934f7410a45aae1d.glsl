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
layout( binding = 13 ) uniform sampler2DShadow g_tShadowDepthTexture;
layout(std140, binding = 0 ) uniform _Globals_ {
	float g_flBumpStrength;
	vec3 g_vColorTint0;
	vec3 g_vColorTint1;
	vec3 g_vColorTint2;
	vec3 g_vColorTint3;
	vec3 g_vColorTintB0;
	vec3 g_vColorTintB1;
	vec3 g_vColorTintB2;
	vec3 g_vColorTintB3;
	vec4 g_vGlobalTint;
	vec3 g_vBorderColorTint1;
	vec3 g_vBorderColorTint2;
	vec3 g_vBorderColorTint3;
	float g_flBorderOffset1;
	float g_flBorderOffset2;
	float g_flBorderOffset3;
	float g_flBorderTintStrength1;
	float g_flBorderTintStrength2;
	float g_flBorderTintStrength3;
	float g_flBorderTintSoftness1;
	float g_flBorderTintSoftness2;
	float g_flBorderTintSoftness3;
	float g_flParallaxStrength1;
	float g_flSpecularIntensity;
	float g_flSpecularBloom;
	float g_flTexCoordScale0;
	float g_flTexCoordRotate0;
	vec2 g_vTexCoordScroll0;
	vec2 g_vTexCoordOffset0;
	float g_flTexCoordScale1;
	float g_flTexCoordRotate1;
	vec2 g_vTexCoordScroll1;
	vec2 g_vTexCoordOffset1;
	float g_flTexCoordScale2;
	float g_flTexCoordRotate2;
	vec2 g_vTexCoordScroll2;
	vec2 g_vTexCoordOffset2;
	vec2 g_vTexCoordTransform0U;
	vec2 g_vTexCoordTransform0V;
	vec2 g_vTexCoordTransform1U;
	vec2 g_vTexCoordTransform1V;
	vec3 g_vTexCoordTransform2U;
	vec3 g_vTexCoordTransform2V;
	float g_flTexCoordScale3;
	float g_flTexCoordRotate3;
	vec2 g_vTexCoordScroll3;
	vec2 g_vTexCoordOffset3;
	vec3 g_vTexCoordTransform3U;
	vec3 g_vTexCoordTransform3V;
	vec3 g_vNormalTransform0U;
	vec3 g_vNormalTransform0V;
	vec3 g_vNormalTransform1U;
	vec3 g_vNormalTransform1V;
	vec3 g_vNormalTransform2U;
	vec3 g_vNormalTransform2V;
	vec3 g_vNormalTransform3U;
	vec3 g_vNormalTransform3V;
} ;
layout( binding = 0 ) uniform sampler2D g_tColor0;
layout( binding = 1 ) uniform sampler2D g_tColor1;
layout( binding = 2 ) uniform sampler2D g_tColor2;
layout( binding = 3 ) uniform sampler2D g_tColor3;
layout( binding = 4 ) uniform sampler2D g_tTintMasks;
layout( binding = 5 ) uniform sampler2D g_tSpecular0;
layout( binding = 6 ) uniform sampler2D g_tSpecular1;
layout( binding = 7 ) uniform sampler2D g_tSpecular2;
layout( binding = 8 ) uniform sampler2D g_tSpecular3;
layout( binding = 9 ) uniform sampler2D g_tNormal0;
layout( binding = 10 ) uniform sampler2D g_tNormal1;
layout( binding = 11 ) uniform sampler2D g_tNormal2;
layout( binding = 12 ) uniform sampler2D g_tNormal3;
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
uniform sampler2D g_tParallaxMask;
layout(location=0) in vec4 PS_INPUT_gl_vPositionWs_flLinearDepth;
layout(location=1) in vec4 PS_INPUT_gl_vNormalWs_flSpecularAmount;
layout(location=2) in vec4 PS_INPUT_gl_vVertexColor;
layout(location=3) in vec4 PS_INPUT_gl_vColorBlendValues_BlendY;
layout(location=4) in vec4 PS_INPUT_gl_vAlphaBlendValues_BlendZ;
layout(location=5) in vec4 PS_INPUT_gl_vTangentUWs_flTangentVSign;
layout(location=6) in vec4 PS_INPUT_gl_vBaseTexCoord0_vBaseTexCoord1;
layout(location=7) in vec4 PS_INPUT_gl_vBaseTexCoord2_vBaseTexCoord3;
layout(location=0) out vec4 PS_OUTPUT_gl_vDiffuse;
layout(location=1) out vec4 PS_OUTPUT_gl_flDepth;
const float C_0d0 = 0.0;
const float C_1d0 = 1.0;
const vec2 C_vec2p2d0p = vec2(2.0);
const vec2 C_vec2pa1d0p = vec2(-1.0);
const vec3 C_vec3p0d0p = vec3(0.0);
const vec4 C_wt9i7t = vec4(0.0749064);
const vec2 C_a1z03r = vec2(0.0, 0.0);
const vec4 C_a1xzaw1 = vec4(0.123596);
const float C_0d205993 = 0.205993;
const float C_1d85 = 1.85;
const float C_0d45 = 0.45;
const float C_2d1 = 2.1;
const float C_0d5 = 0.5;
const vec3 C_kfumqy1 = vec3(0.2125, 0.7154, 0.0721);
void main()
{
	vec3 vGeometricNormalWs = normalize(PS_INPUT_gl_vNormalWs_flSpecularAmount.xyz);
	vec3 vTangentUWs = normalize(PS_INPUT_gl_vTangentUWs_flTangentVSign.xyz);
	vec3 vTangentVWs = cross(vGeometricNormalWs, PS_INPUT_gl_vTangentUWs_flTangentVSign.xyz);
	vec3 vTangentVWs1 = normalize(vTangentVWs);
	vec3 vTangentVWs2 = PS_INPUT_gl_vTangentUWs_flTangentVSign.www * vTangentVWs1;
	vec4 vDiffuse = texture(g_tColor0, PS_INPUT_gl_vBaseTexCoord0_vBaseTexCoord1.xy);
	vec4 vDiffuse1 = texture(g_tColor1, PS_INPUT_gl_vBaseTexCoord0_vBaseTexCoord1.zw);
	vec4 vDiffuse2 = texture(g_tColor2, PS_INPUT_gl_vBaseTexCoord2_vBaseTexCoord3.xy);
	vec4 vDiffuse3 = texture(g_tColor3, PS_INPUT_gl_vBaseTexCoord2_vBaseTexCoord3.zw);
	vec4 vTintMasks = texture(g_tTintMasks, PS_INPUT_gl_vBaseTexCoord0_vBaseTexCoord1.xy);
	vec4 vTintMasks1 = texture(g_tTintMasks, PS_INPUT_gl_vBaseTexCoord0_vBaseTexCoord1.zw);
	vec4 vTintMasks2 = texture(g_tTintMasks, PS_INPUT_gl_vBaseTexCoord2_vBaseTexCoord3.xy);
	vec4 vTintMasks3 = texture(g_tTintMasks, PS_INPUT_gl_vBaseTexCoord2_vBaseTexCoord3.zw);
	vec3 vTint = mix(g_vColorTintB0, g_vColorTint0, vTintMasks.x);
	vec3 vTint1 = mix(g_vColorTintB1, g_vColorTint1, vTintMasks1.y);
	vec3 vTint2 = mix(g_vColorTintB2, g_vColorTint2, vTintMasks2.z);
	vec3 vTint3 = mix(g_vColorTintB3, g_vColorTint3, vTintMasks3.w);
	vec3 H_dzlz43 = vDiffuse.xyz * vTint;
	vec3 H_73ti64 = vDiffuse1.xyz * vTint1;
	vec3 H_xqutex1 = vDiffuse2.xyz * vTint2;
	vec3 H_fzdaww = vDiffuse3.xyz * vTint3;
	float H_kgh6kc = vDiffuse1.w - PS_INPUT_gl_vAlphaBlendValues_BlendZ.x;
	float minb = max(C_0d0, H_kgh6kc);
	float H_cl72vu1 = PS_INPUT_gl_vAlphaBlendValues_BlendZ.x + vDiffuse1.w;
	float maxb = min(C_1d0, H_cl72vu1);
	float flResult = smoothstep(minb, maxb, PS_INPUT_gl_vColorBlendValues_BlendY.x);
	vec4 H_lbklhh1 = vec4(flResult);
	vec3 H_ce1opy1 = vec3(flResult);
	float H_4abpfv = C_1d0 - flResult;
	float H_8kria8 = vDiffuse2.w - PS_INPUT_gl_vAlphaBlendValues_BlendZ.y;
	float minb1 = max(C_0d0, H_8kria8);
	float H_qcf9ui = PS_INPUT_gl_vAlphaBlendValues_BlendZ.y + vDiffuse2.w;
	float maxb1 = min(C_1d0, H_qcf9ui);
	float flResult1 = smoothstep(minb1, maxb1, PS_INPUT_gl_vColorBlendValues_BlendY.y);
	float flResult2 = clamp(flResult1, C_0d0, H_4abpfv);
	vec4 H_fjfksz = vec4(flResult2);
	vec3 H_cy3lxl = vec3(flResult2);
	float H_x6pp2y1 = H_4abpfv - flResult2;
	float H_snh0yx = vDiffuse3.w - PS_INPUT_gl_vAlphaBlendValues_BlendZ.z;
	float minb2 = max(C_0d0, H_snh0yx);
	float H_cvcskd1 = PS_INPUT_gl_vAlphaBlendValues_BlendZ.z + vDiffuse3.w;
	float maxb2 = min(C_1d0, H_cvcskd1);
	float flResult3 = smoothstep(minb2, maxb2, PS_INPUT_gl_vColorBlendValues_BlendY.z);
	float flResult4 = clamp(flResult3, C_0d0, H_x6pp2y1);
	vec4 H_149rs91 = vec4(flResult4);
	vec3 H_yruoot = vec3(flResult4);
	float H_8qsjgf1 = H_x6pp2y1 - flResult4;
	vec4 H_9rjn0c = vec4(H_8qsjgf1);
	vec3 H_q3sb44 = vec3(H_8qsjgf1);
	vec3 H_184kem1 = H_dzlz43 * H_q3sb44;
	vec3 H_sox36b = H_73ti64 * H_ce1opy1;
	vec3 H_2e738g = H_184kem1 + H_sox36b;
	vec3 H_k75rr51 = H_cy3lxl * H_xqutex1;
	vec3 H_vro33h1 = H_2e738g + H_k75rr51;
	vec3 H_kaiem51 = H_fzdaww * H_yruoot;
	vec3 H_p8ymdn1 = H_kaiem51 + H_vro33h1;
	vec3 H_8gsj1f = H_p8ymdn1 * PS_INPUT_gl_vVertexColor.xyz;
	vec4 vSpecular = texture(g_tSpecular0, PS_INPUT_gl_vBaseTexCoord0_vBaseTexCoord1.xy);
	vec4 vSpecular1 = texture(g_tSpecular1, PS_INPUT_gl_vBaseTexCoord0_vBaseTexCoord1.zw);
	vec4 vSpecular2 = texture(g_tSpecular2, PS_INPUT_gl_vBaseTexCoord2_vBaseTexCoord3.xy);
	vec4 vSpecular3 = texture(g_tSpecular3, PS_INPUT_gl_vBaseTexCoord2_vBaseTexCoord3.zw);
	vec3 H_9hcu15 = H_q3sb44 * vSpecular.xyz;
	vec3 H_naakvz = H_ce1opy1 * vSpecular1.xyz;
	vec3 H_qezh2d = H_9hcu15 + H_naakvz;
	vec3 H_dx2101 = H_cy3lxl * vSpecular2.xyz;
	vec3 H_aw2g5t1 = H_dx2101 + H_qezh2d;
	vec3 H_jsi1kn1 = H_yruoot * vSpecular3.xyz;
	vec3 H_s1w56n = H_aw2g5t1 + H_jsi1kn1;
	float H_ekxfcg1 = H_s1w56n.x * g_flSpecularIntensity;
	float H_ayr8ln = H_s1w56n.z * g_flSpecularBloom;
	vec3 H_0kcqcx = vec3(H_ayr8ln);
	vec4 vNormalTexel = texture(g_tNormal0, PS_INPUT_gl_vBaseTexCoord0_vBaseTexCoord1.xy);
	vec4 vNormalTexel1 = texture(g_tNormal1, PS_INPUT_gl_vBaseTexCoord0_vBaseTexCoord1.zw);
	vec4 vNormalTexel2 = texture(g_tNormal2, PS_INPUT_gl_vBaseTexCoord2_vBaseTexCoord3.xy);
	vec4 vNormalTexel3 = texture(g_tNormal3, PS_INPUT_gl_vBaseTexCoord2_vBaseTexCoord3.zw);
	vec3 H_c9sxtd1 = vec3(vNormalTexel.w, vNormalTexel.y, C_1d0);
	float vNormalTexel4 = dot(g_vNormalTransform0U, H_c9sxtd1);
	float vNormalTexel5 = dot(g_vNormalTransform0V, H_c9sxtd1);
	vec4 H_2ett9s1 = vNormalTexel;
	H_2ett9s1.yw = vec2(vNormalTexel5, vNormalTexel4);
	vec3 H_m9bnvc = vec3(vNormalTexel1.w, vNormalTexel1.y, C_1d0);
	float vNormalTexel6 = dot(g_vNormalTransform1U, H_m9bnvc);
	float vNormalTexel7 = dot(g_vNormalTransform1V, H_m9bnvc);
	vec4 H_d5i45r1 = vNormalTexel1;
	H_d5i45r1.yw = vec2(vNormalTexel7, vNormalTexel6);
	vec3 H_gapr6p1 = vec3(vNormalTexel2.w, vNormalTexel2.y, C_1d0);
	float vNormalTexel8 = dot(g_vNormalTransform2U, H_gapr6p1);
	float vNormalTexel9 = dot(g_vNormalTransform2V, H_gapr6p1);
	vec4 H_g2p5bq1 = vNormalTexel2;
	H_g2p5bq1.yw = vec2(vNormalTexel9, vNormalTexel8);
	vec3 H_2lajvb = vec3(vNormalTexel3.w, vNormalTexel3.y, C_1d0);
	float vNormalTexela = dot(g_vNormalTransform3U, H_2lajvb);
	float vNormalTexelb = dot(g_vNormalTransform3V, H_2lajvb);
	vec4 H_fra5lq1 = vNormalTexel3;
	H_fra5lq1.yw = vec2(vNormalTexelb, vNormalTexela);
	vec4 H_d8o8mm = H_2ett9s1 * H_9rjn0c;
	vec4 H_14tvae = H_d5i45r1 * H_lbklhh1;
	vec4 H_k3x5lf = H_14tvae + H_d8o8mm;
	vec4 H_dk37g91 = H_fjfksz * H_g2p5bq1;
	vec4 H_nh9jil1 = H_dk37g91 + H_k3x5lf;
	vec4 H_oaezte1 = H_149rs91 * H_fra5lq1;
	vec4 vBlendedNormalTexel = H_nh9jil1 + H_oaezte1;
	vec2 H_m8lc3k1 = vBlendedNormalTexel.wy * C_vec2p2d0p;
	vec2 H_k9c4oe1 = H_m8lc3k1 + C_vec2pa1d0p;
	float vNormalTs = dot(H_k9c4oe1, H_k9c4oe1);
	float param = C_1d0 - vNormalTs;
	float misc3a = clamp(param, C_0d0, C_1d0);
	float vNormalTs1 = sqrt(misc3a);
	float H_ikr96c1 = C_0d0 - H_k9c4oe1.y;
	vec2 H_x1he8s = vec2(g_flBumpStrength);
	vec2 H_v0t2831 = vec2(H_k9c4oe1.x, H_ikr96c1);
	vec2 H_ytgoo5 = H_v0t2831 * H_x1he8s;
	vec3 H_xxwq9g1 = vec3(H_ytgoo5.x, H_ytgoo5.y, vNormalTs1);
	vec3 vNormalTs2 = normalize(H_xxwq9g1);
	vec3 vVectorWs = vNormalTs2.xxx * vTangentUWs;
	vec3 H_35021c1 = vNormalTs2.yyy * vTangentVWs2;
	vec3 vVectorWs1 = H_35021c1 + vVectorWs;
	vec3 H_9wf1l91 = vGeometricNormalWs * vNormalTs2.zzz;
	vec3 vVectorWs2 = H_9wf1l91 + vVectorWs1;
	vec3 H_qw6t8a1 = normalize(vVectorWs2);
	vec3 H_8mjky01 = PS_INPUT_gl_vPositionWs_flLinearDepth.xyz - g_vCameraPositionWs;
	vec3 H_i1nbjv1 = normalize(H_8mjky01);
	vec3 H_t3ywhi1 = C_vec3p0d0p - H_i1nbjv1;
	vec3 vReflect = reflect(H_t3ywhi1, H_qw6t8a1);
	float flSpecular = dot(g_vGlobalLightSpecularDir, vReflect);
	float misc3a1 = clamp(flSpecular, C_0d0, C_1d0);
	float flSpecular1 = pow(misc3a1, g_flGlobalLightSpecularExp);
	float flSpecular2 = H_ekxfcg1 * flSpecular1;
	vec3 H_s6408y = vec3(flSpecular2);
	vec3 flSpecularRGB = H_s6408y * g_vGlobalLightSpecularColor;
	float misc3a2 = clamp(g_flGlobalLightSpecularIndependence, C_0d0, C_1d0);
	vec3 H_7pnklg = vec3(misc3a2);
	float H_f5a1k1 = C_1d0 - misc3a2;
	vec3 H_77m74o1 = vec3(H_f5a1k1);
	vec3 H_20dm1p = H_77m74o1 * flSpecularRGB;
	vec3 H_1xnmm7 = H_20dm1p + H_8gsj1f;
	vec3 H_j03jbn = C_vec3p0d0p - g_vGlobalLightDir;
	float flNDotL = dot(H_j03jbn, H_qw6t8a1);
	float misc3a3 = clamp(flNDotL, C_0d0, C_1d0);
	float product = PS_INPUT_gl_vPositionWs_flLinearDepth.x * g_matShadowWorldToTexture[0].x;
	float product1 = PS_INPUT_gl_vPositionWs_flLinearDepth.y * g_matShadowWorldToTexture[1].x;
	float dotProduct = product + product1;
	float product2 = PS_INPUT_gl_vPositionWs_flLinearDepth.z * g_matShadowWorldToTexture[2].x;
	float dotProduct1 = dotProduct + product2;
	float dotProduct2 = dotProduct1 + g_matShadowWorldToTexture[3].x;
	float product3 = PS_INPUT_gl_vPositionWs_flLinearDepth.x * g_matShadowWorldToTexture[0].y;
	float product4 = PS_INPUT_gl_vPositionWs_flLinearDepth.y * g_matShadowWorldToTexture[1].y;
	float dotProduct3 = product3 + product4;
	float product5 = PS_INPUT_gl_vPositionWs_flLinearDepth.z * g_matShadowWorldToTexture[2].y;
	float dotProduct4 = dotProduct3 + product5;
	float dotProduct5 = dotProduct4 + g_matShadowWorldToTexture[3].y;
	float product6 = PS_INPUT_gl_vPositionWs_flLinearDepth.x * g_matShadowWorldToTexture[0].z;
	float product7 = PS_INPUT_gl_vPositionWs_flLinearDepth.y * g_matShadowWorldToTexture[1].z;
	float dotProduct6 = product6 + product7;
	float product8 = PS_INPUT_gl_vPositionWs_flLinearDepth.z * g_matShadowWorldToTexture[2].z;
	float dotProduct7 = dotProduct6 + product8;
	float dotProduct8 = dotProduct7 + g_matShadowWorldToTexture[3].z;
	float product9 = PS_INPUT_gl_vPositionWs_flLinearDepth.x * g_matShadowWorldToTexture[0].w;
	float producta = PS_INPUT_gl_vPositionWs_flLinearDepth.y * g_matShadowWorldToTexture[1].w;
	float dotProduct9 = product9 + producta;
	float productb = PS_INPUT_gl_vPositionWs_flLinearDepth.z * g_matShadowWorldToTexture[2].w;
	float dotProducta = dotProduct9 + productb;
	float dotProductb = dotProducta + g_matShadowWorldToTexture[3].w;
	vec3 H_16wbh81 = vec3(dotProductb);
	vec3 H_mo5dbs1 = vec3(dotProduct2, dotProduct5, dotProduct8);
	vec3 H_qdsg5k1 = H_mo5dbs1 / H_16wbh81;
	float param1 = C_0d0 - H_qdsg5k1.z;
	float misc3a4 = clamp(param1, C_0d0, C_1d0);
	float H_60ojyb = C_0d0 - g_vInvShadowDepthTextureSize.x;
	vec2 H_t5te6f = vec2(H_60ojyb);
	vec2 H_ep5c3j1 = H_qdsg5k1.xy + g_vInvShadowDepthTextureSize.xx;
	vec3 H_msqlvi = vec3(H_ep5c3j1.x, H_ep5c3j1.y, misc3a4);
	float H_pfhqbt1 = textureLod(g_tShadowDepthTexture, H_msqlvi, C_0d0);
	vec2 H_pv0in9 = vec2(H_60ojyb, g_vInvShadowDepthTextureSize.x);
	vec2 H_he48ts = H_pv0in9 + H_qdsg5k1.xy;
	vec3 H_anpi7s = vec3(H_he48ts.x, H_he48ts.y, misc3a4);
	float H_rra2j11 = textureLod(g_tShadowDepthTexture, H_anpi7s, C_0d0);
	vec2 H_t32u4i1 = vec2(g_vInvShadowDepthTextureSize.x, H_60ojyb);
	vec2 H_3zubtq = H_qdsg5k1.xy + H_t32u4i1;
	vec3 H_igygek1 = vec3(H_3zubtq.x, H_3zubtq.y, misc3a4);
	float H_2abuie = textureLod(g_tShadowDepthTexture, H_igygek1, C_0d0);
	vec2 H_r37y1w = H_qdsg5k1.xy + H_t5te6f;
	vec3 H_up1qjg1 = vec3(H_r37y1w.x, H_r37y1w.y, misc3a4);
	float H_2b6uc4 = textureLod(g_tShadowDepthTexture, H_up1qjg1, C_0d0);
	vec4 H_7il6qo = vec4(H_pfhqbt1, H_rra2j11, H_2abuie, H_2b6uc4);
	float flSum = dot(H_7il6qo, C_wt9i7t);
	vec2 H_e9rh661 = vec2(g_vInvShadowDepthTextureSize.x, C_0d0);
	vec2 H_85dk7x = H_e9rh661 + H_qdsg5k1.xy;
	vec3 H_mytg2n1 = vec3(H_85dk7x.x, H_85dk7x.y, misc3a4);
	float H_n0c46n = textureLod(g_tShadowDepthTexture, H_mytg2n1, C_0d0);
	vec2 H_na4vhz = vec2(H_60ojyb, C_0d0);
	vec2 H_iybrli = H_na4vhz + H_qdsg5k1.xy;
	vec3 H_ivxk8j1 = vec3(H_iybrli.x, H_iybrli.y, misc3a4);
	float H_22sl4p1 = textureLod(g_tShadowDepthTexture, H_ivxk8j1, C_0d0);
	vec2 H_23b4ob1 = C_a1z03r;
	H_23b4ob1.y = H_60ojyb;
	vec2 H_wcm3cs = H_23b4ob1 + H_qdsg5k1.xy;
	vec3 H_aaf3c01 = vec3(H_wcm3cs.x, H_wcm3cs.y, misc3a4);
	float H_kohr3d1 = textureLod(g_tShadowDepthTexture, H_aaf3c01, C_0d0);
	vec2 H_23b4ob1r = C_a1z03r;
	H_23b4ob1r.y = g_vInvShadowDepthTextureSize.x;
	vec2 H_omz8p81 = H_23b4ob1r + H_qdsg5k1.xy;
	vec3 H_mbixvk = vec3(H_omz8p81.x, H_omz8p81.y, misc3a4);
	float H_8l9juu = textureLod(g_tShadowDepthTexture, H_mbixvk, C_0d0);
	vec4 H_ihq79x1 = vec4(H_n0c46n, H_22sl4p1, H_kohr3d1, H_8l9juu);
	float flSum1 = dot(H_ihq79x1, C_a1xzaw1);
	float flSum2 = flSum + flSum1;
	vec3 H_wbit1t = vec3(H_qdsg5k1.x, H_qdsg5k1.y, misc3a4);
	float flSum3 = textureLod(g_tShadowDepthTexture, H_wbit1t, C_0d0);
	float H_xchcee1 = flSum3 * C_0d205993;
	float flSum4 = H_xchcee1 + flSum2;
	vec3 H_k9xsqt1 = vec3(flSum4);
	float flDirectionalAmbientShadow = mix(C_1d0, flSum4, g_flGlobalLightAmbientShadowAmount);
	float flDirectOcclusionFactor = pow(C_1d0, C_1d85);
	float flDirectOcclusionFactor1 = mix(C_0d45, C_1d0, flDirectOcclusionFactor);
	float flIndirectOcclusionFactor = pow(C_1d0, C_2d1);
	vec3 H_fx1uua = vec3(g_flGlobalLightAmbientScale1);
	vec3 vDirectionalAmbientColor = H_fx1uua * g_vGlobalLightAmbientColor1;
	float H_jjpf4g1 = H_qw6t8a1.z * C_0d5;
	float H_ahpdwy = C_0d5 + H_jjpf4g1;
	vec3 vShadowAmbientColor = mix(g_vGlobalLightAmbientColor3, g_vGlobalLightAmbientColor2, H_ahpdwy);
	vec3 H_s7noda1 = vec3(g_flGlobalLightAmbientScale2);
	vec3 vShadowAmbientColor1 = H_s7noda1 * vShadowAmbientColor;
	float flLuminance = dot(vDirectionalAmbientColor, C_kfumqy1);
	vec3 H_t1lelu1 = vec3(flLuminance);
	float flLuminance1 = dot(vShadowAmbientColor1, C_kfumqy1);
	vec3 H_chpant1 = vec3(flLuminance1);
	vec3 vDirectionalAmbientColor1 = mix(vDirectionalAmbientColor, H_t1lelu1, H_0kcqcx);
	vec3 vShadowAmbientColor2 = mix(vShadowAmbientColor1, H_chpant1, H_0kcqcx);
	float H_1fxyk9 = flSum4 * misc3a3;
	float H_09rr4v1 = H_1fxyk9 * flDirectOcclusionFactor1;
	vec3 H_grf5hu = vec3(H_09rr4v1);
	vec3 vDirectLight = H_grf5hu * g_vGlobalLightColor;
	float vDirectionalAmbientLight = dot(g_vGlobalLightAmbientDir, H_qw6t8a1);
	float misc3a5 = clamp(vDirectionalAmbientLight, C_0d0, C_1d0);
	float H_m4by5e = flDirectionalAmbientShadow * misc3a5;
	float H_64fuii = H_m4by5e * flIndirectOcclusionFactor;
	vec3 H_9cizox = vec3(H_64fuii);
	vec3 vDirectionalAmbientLight1 = H_9cizox * vDirectionalAmbientColor1;
	float H_epes411 = C_1d0 - H_1fxyk9;
	float H_h2z1ua = H_epes411 * flIndirectOcclusionFactor;
	vec3 H_t2bxsq = vec3(H_h2z1ua);
	vec3 vShadowAmbientLight = H_t2bxsq * vShadowAmbientColor2;
	vec3 H_8w78gv1 = vDirectLight + vDirectionalAmbientLight1;
	vec3 vLighting = H_8w78gv1 + vShadowAmbientLight;
	vec3 H_w6tadf1 = H_1xnmm7 * vLighting;
	vec3 H_bcfwoi = vec3(g_flGlobalLightSpecularScale);
	vec3 H_knhpna = H_bcfwoi * flSpecularRGB;
	vec3 H_8xrc791 = H_7pnklg * H_knhpna;
	vec3 H_0v3pae1 = H_8xrc791 * H_k9xsqt1;
	vec3 H_fmz8nm1 = H_0v3pae1 + H_w6tadf1;
	vec4 H_jenitn1 = vec4(PS_INPUT_gl_vPositionWs_flLinearDepth.x, PS_INPUT_gl_vPositionWs_flLinearDepth.y, PS_INPUT_gl_vPositionWs_flLinearDepth.z, C_1d0);
	float flClipPlaneDist = dot(g_vClipPlane0, H_jenitn1);
	float param2 = flClipPlaneDist * g_flInvFogRange;
	float misc3a6 = clamp(param2, C_0d0, C_1d0);
	vec4 H_plrgt91 = vec4(H_fmz8nm1.x, H_fmz8nm1.y, H_fmz8nm1.z, misc3a6);
	PS_OUTPUT_gl_vDiffuse = H_plrgt91;
	PS_OUTPUT_gl_flDepth = PS_INPUT_gl_vPositionWs_flLinearDepth.wwww;
}
