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
};
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
layout(location=0) in vec4 PS_INPUT_gl_vPositionWs_flLinearDepth;
layout(location=1) in vec4 PS_INPUT_gl_vNormalWs_flSpecularAmount;
layout(location=2) in vec4 PS_INPUT_gl_vVertexColor;
layout(location=3) in vec4 PS_INPUT_gl_vColorBlendValues_BlendY;
layout(location=4) in vec4 PS_INPUT_gl_vAlphaBlendValues_BlendZ;
layout(location=5) in vec4 PS_INPUT_gl_vTangentUWs_flTangentVSign;
layout(location=6) in vec4 PS_INPUT_gl_vProjTexCoord0_X_Y;
layout(location=7) in vec4 PS_INPUT_gl_vProjTexCoord1_X_Y;
layout(location=8) in vec4 PS_INPUT_gl_vProjTexCoord2_X_Y;
layout(location=9) in vec4 PS_INPUT_gl_vProjTexCoord_0Z_1Z;
layout(location=0) out vec4 PS_OUTPUT_gl_vDiffuse;
layout(location=1) out vec4 PS_OUTPUT_gl_flDepth;
const vec3 C_vec3p128d0p = vec3(128.0);
const float C_0d0 = 0.0;
const float C_1d0 = 1.0;
const float C_2d0 = 2.0;
const vec2 C_vec2p2d0p = vec2(2.0);
const vec2 C_vec2pa1d0p = vec2(-1.0);
const vec3 C_sc72c91 = vec3(0.0, 1.0, 0.0);
const float C_1ea05 = 1e-05;
const vec3 C_1oqnzq = vec3(0.0, 0.0, -1.0);
const vec3 C_ypnorl1 = vec3(1.0, 0.0, 0.0);
const vec3 C_1fua5g = vec3(0.0, -1.0, 0.0);
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
	PS_INPUT param;
	PS_INPUT mainIn;
	mainIn.member0 = PS_INPUT_gl_vPositionWs_flLinearDepth;
	mainIn.member1 = PS_INPUT_gl_vNormalWs_flSpecularAmount;
	mainIn.member2 = PS_INPUT_gl_vVertexColor;
	mainIn.member3 = PS_INPUT_gl_vColorBlendValues_BlendY;
	mainIn.member4 = PS_INPUT_gl_vAlphaBlendValues_BlendZ;
	mainIn.member5 = PS_INPUT_gl_vTangentUWs_flTangentVSign;
	mainIn.member6 = PS_INPUT_gl_vProjTexCoord0_X_Y;
	mainIn.member7 = PS_INPUT_gl_vProjTexCoord1_X_Y;
	mainIn.member8 = PS_INPUT_gl_vProjTexCoord2_X_Y;
	mainIn.member9 = PS_INPUT_gl_vProjTexCoord_0Z_1Z;
	vec3 vGeometricNormalWs = normalize(mainIn.member1.xyz);
	vec3 vScaledPos = mainIn.member0.xyz / C_vec3p128d0p;
	float H_wq616s = C_0d0 - vScaledPos.z;
	vec3 H_moxbzf1 = vec3(vScaledPos.y, H_wq616s, C_1d0);
	vec3 H_nhxvm9 = vScaledPos;
	H_nhxvm9.yz = vec2(H_wq616s, C_1d0);
	float H_ttzzzs = C_0d0 - vScaledPos.y;
	vec3 H_nhxvm9r = vScaledPos;
	H_nhxvm9r.yz = vec2(H_ttzzzs, C_1d0);
	float vProjTexCoord_3X = dot(g_vTexCoordTransform3U, H_moxbzf1);
	float vProjTexCoord_3X1 = dot(g_vTexCoordTransform3V, H_moxbzf1);
	vec2 H_56v5wc = vec2(vProjTexCoord_3X, vProjTexCoord_3X1);
	float vProjTexCoord_3Y = dot(g_vTexCoordTransform3U, H_nhxvm9);
	float vProjTexCoord_3Y1 = dot(g_vTexCoordTransform3V, H_nhxvm9);
	vec2 H_d4o2x91 = vec2(vProjTexCoord_3Y, vProjTexCoord_3Y1);
	float vProjTexCoord_3Z = dot(g_vTexCoordTransform3U, H_nhxvm9r);
	float vProjTexCoord_3Z1 = dot(g_vTexCoordTransform3V, H_nhxvm9r);
	vec2 H_9xv0dz = vec2(vProjTexCoord_3Z, vProjTexCoord_3Z1);
	float vProjTexCoord_2Z = dot(g_vTexCoordTransform2U, H_nhxvm9r);
	float vProjTexCoord_2Z1 = dot(g_vTexCoordTransform2V, H_nhxvm9r);
	vec2 H_lykagc = vec2(vProjTexCoord_2Z, vProjTexCoord_2Z1);
	float param1 = mainIn.member3.w * C_2d0;
	float misc3a = clamp(param1, C_0d0, C_1d0);
	float param2 = C_2d0 * mainIn.member4.w;
	float misc3a1 = clamp(param2, C_0d0, C_1d0);
	vec4 vDiffuse0_X = texture(g_tColor0, mainIn.member6.xy);
	vec4 vDiffuse1_X = texture(g_tColor1, mainIn.member7.xy);
	vec4 vDiffuse2_X = texture(g_tColor2, mainIn.member8.xy);
	vec4 vDiffuse3_X = texture(g_tColor3, H_56v5wc);
	vec4 vDiffuse0_Y = texture(g_tColor0, mainIn.member6.zw);
	vec4 vDiffuse1_Y = texture(g_tColor1, mainIn.member7.zw);
	vec4 vDiffuse2_Y = texture(g_tColor2, mainIn.member8.zw);
	vec4 vDiffuse3_Y = texture(g_tColor3, H_d4o2x91);
	vec4 vDiffuse = mix(vDiffuse0_X, vDiffuse0_Y, misc3a);
	vec4 vDiffuse1 = mix(vDiffuse1_X, vDiffuse1_Y, misc3a);
	vec4 vDiffuse2 = mix(vDiffuse2_X, vDiffuse2_Y, misc3a);
	vec4 vDiffuse3 = mix(vDiffuse3_X, vDiffuse3_Y, misc3a);
	vec4 vDiffuse0_Z = texture(g_tColor0, mainIn.member9.xy);
	vec4 vDiffuse1_Z = texture(g_tColor1, mainIn.member9.zw);
	vec4 vDiffuse2_Z = texture(g_tColor2, H_lykagc);
	vec4 vDiffuse3_Z = texture(g_tColor3, H_9xv0dz);
	vec4 vDiffuse4 = mix(vDiffuse, vDiffuse0_Z, misc3a1);
	vec4 vDiffuse5 = mix(vDiffuse1, vDiffuse1_Z, misc3a1);
	vec4 vDiffuse6 = mix(vDiffuse2, vDiffuse2_Z, misc3a1);
	vec4 vDiffuse7 = mix(vDiffuse3, vDiffuse3_Z, misc3a1);
	vec4 vTintMasks_X = texture(g_tTintMasks, mainIn.member6.xy);
	vec4 vTintMasks_X1 = texture(g_tTintMasks, mainIn.member7.xy);
	vec4 vTintMasks_X2 = texture(g_tTintMasks, mainIn.member8.xy);
	vec4 vTintMasks_X3 = texture(g_tTintMasks, H_56v5wc);
	vec4 H_cfad1v = vec4(vTintMasks_X.x, vTintMasks_X1.y, vTintMasks_X2.z, vTintMasks_X3.w);
	vec4 vTintMasks_Y = texture(g_tTintMasks, mainIn.member6.zw);
	vec4 vTintMasks_Y1 = texture(g_tTintMasks, mainIn.member7.zw);
	vec4 vTintMasks_Y2 = texture(g_tTintMasks, mainIn.member8.zw);
	vec4 vTintMasks_Y3 = texture(g_tTintMasks, H_d4o2x91);
	vec4 H_2h5zau1 = vec4(vTintMasks_Y.x, vTintMasks_Y1.y, vTintMasks_Y2.z, vTintMasks_Y3.w);
	vec4 vTintMasks = mix(H_cfad1v, H_2h5zau1, misc3a);
	vec4 vTintMasks_Z = texture(g_tTintMasks, mainIn.member9.xy);
	vec4 vTintMasks_Z1 = texture(g_tTintMasks, mainIn.member9.zw);
	vec4 vTintMasks_Z2 = texture(g_tTintMasks, H_lykagc);
	vec4 vTintMasks_Z3 = texture(g_tTintMasks, H_9xv0dz);
	vec4 H_glsg1m = vec4(vTintMasks_Z.x, vTintMasks_Z1.y, vTintMasks_Z2.z, vTintMasks_Z3.w);
	vec4 vTintMasks1 = mix(vTintMasks, H_glsg1m, misc3a1);
	vec3 vTint = mix(g_vColorTintB0, g_vColorTint0, vTintMasks1.x);
	vec3 vTint1 = mix(g_vColorTintB1, g_vColorTint1, vTintMasks1.y);
	vec3 vTint2 = mix(g_vColorTintB2, g_vColorTint2, vTintMasks1.z);
	vec3 vTint3 = mix(g_vColorTintB3, g_vColorTint3, vTintMasks1.w);
	vec3 H_ra0p951 = vDiffuse4.xyz * vTint;
	vec3 H_j3ypt = vDiffuse5.xyz * vTint1;
	vec3 H_9n0jzh1 = vDiffuse6.xyz * vTint2;
	vec3 H_j5v7tc1 = vDiffuse7.xyz * vTint3;
	float H_8uuilq = vDiffuse5.w - mainIn.member4.x;
	float minb = max(C_0d0, H_8uuilq);
	float H_co5txr = mainIn.member4.x + vDiffuse5.w;
	float maxb = min(C_1d0, H_co5txr);
	float flResult = smoothstep(minb, maxb, mainIn.member3.x);
	vec2 H_fomviv1 = vec2(flResult);
	vec3 H_ce1opy1 = vec3(flResult);
	float H_4abpfv = C_1d0 - flResult;
	float H_cm5tb5 = vDiffuse6.w - mainIn.member4.y;
	float minb1 = max(C_0d0, H_cm5tb5);
	float H_qdcaay = mainIn.member4.y + vDiffuse6.w;
	float maxb1 = min(C_1d0, H_qdcaay);
	float flResult1 = smoothstep(minb1, maxb1, mainIn.member3.y);
	float flResult2 = clamp(flResult1, C_0d0, H_4abpfv);
	vec2 H_ltjhbf1 = vec2(flResult2);
	vec3 H_cy3lxl = vec3(flResult2);
	float H_x6pp2y1 = H_4abpfv - flResult2;
	float H_wbvjh1 = vDiffuse7.w - mainIn.member4.z;
	float minb2 = max(C_0d0, H_wbvjh1);
	float H_gtnp7p = mainIn.member4.z + vDiffuse7.w;
	float maxb2 = min(C_1d0, H_gtnp7p);
	float flResult3 = smoothstep(minb2, maxb2, mainIn.member3.z);
	float flResult4 = clamp(flResult3, C_0d0, H_x6pp2y1);
	vec2 H_7nal2n1 = vec2(flResult4);
	vec3 H_yruoot = vec3(flResult4);
	float H_8qsjgf1 = H_x6pp2y1 - flResult4;
	vec2 H_z5x9xm = vec2(H_8qsjgf1);
	vec3 H_q3sb44 = vec3(H_8qsjgf1);
	vec3 H_mve4911 = H_q3sb44 * H_ra0p951;
	vec3 H_tiq79m = H_ce1opy1 * H_j3ypt;
	vec3 H_i04ofl1 = H_mve4911 + H_tiq79m;
	vec3 H_iv2vx7 = H_9n0jzh1 * H_cy3lxl;
	vec3 H_n66otr1 = H_i04ofl1 + H_iv2vx7;
	vec3 H_dny7x21 = H_j5v7tc1 * H_yruoot;
	vec3 H_1i58ut1 = H_dny7x21 + H_n66otr1;
	vec3 H_k0k8in = H_1i58ut1 * mainIn.member2.xyz;
	vec4 vSpecular0_X = texture(g_tSpecular0, mainIn.member6.xy);
	vec4 vSpecular1_X = texture(g_tSpecular1, mainIn.member7.xy);
	vec4 vSpecular2_X = texture(g_tSpecular2, mainIn.member8.xy);
	vec4 vSpecular3_X = texture(g_tSpecular3, H_56v5wc);
	vec4 vSpecular0_Y = texture(g_tSpecular0, mainIn.member6.zw);
	vec4 vSpecular1_Y = texture(g_tSpecular1, mainIn.member7.zw);
	vec4 vSpecular2_Y = texture(g_tSpecular2, mainIn.member8.zw);
	vec4 vSpecular3_Y = texture(g_tSpecular3, H_d4o2x91);
	vec4 vSpecular = mix(vSpecular0_X, vSpecular0_Y, misc3a);
	vec4 vSpecular1 = mix(vSpecular1_X, vSpecular1_Y, misc3a);
	vec4 vSpecular2 = mix(vSpecular2_X, vSpecular2_Y, misc3a);
	vec4 vSpecular3 = mix(vSpecular3_X, vSpecular3_Y, misc3a);
	vec4 vSpecular0_Z = texture(g_tSpecular0, mainIn.member9.xy);
	vec4 vSpecular1_Z = texture(g_tSpecular1, mainIn.member9.zw);
	vec4 vSpecular2_Z = texture(g_tSpecular2, H_lykagc);
	vec4 vSpecular3_Z = texture(g_tSpecular3, H_9xv0dz);
	vec4 vSpecular4 = mix(vSpecular, vSpecular0_Z, misc3a1);
	vec4 vSpecular5 = mix(vSpecular1, vSpecular1_Z, misc3a1);
	vec4 vSpecular6 = mix(vSpecular2, vSpecular2_Z, misc3a1);
	vec4 vSpecular7 = mix(vSpecular3, vSpecular3_Z, misc3a1);
	vec3 H_9ax3ho1 = H_q3sb44 * vSpecular4.xyz;
	vec3 H_vz4y2m1 = H_ce1opy1 * vSpecular5.xyz;
	vec3 H_6d5qwr1 = H_9ax3ho1 + H_vz4y2m1;
	vec3 H_px2sjl = H_cy3lxl * vSpecular6.xyz;
	vec3 H_339y6g = H_6d5qwr1 + H_px2sjl;
	vec3 H_v21nh71 = H_yruoot * vSpecular7.xyz;
	vec3 H_kj2mz7 = H_339y6g + H_v21nh71;
	float H_lvzeez = H_kj2mz7.x * g_flSpecularIntensity;
	float H_9ditsv1 = H_kj2mz7.z * g_flSpecularBloom;
	vec3 H_w78ji6 = vec3(H_9ditsv1);
	vec4 vNormalTexel0_X = texture(g_tNormal0, mainIn.member6.xy);
	vec4 vNormalTexel1_X = texture(g_tNormal1, mainIn.member7.xy);
	vec4 vNormalTexel2_X = texture(g_tNormal2, mainIn.member8.xy);
	vec4 vNormalTexel3_X = texture(g_tNormal3, H_56v5wc);
	vec3 H_221bqb1 = vec3(vNormalTexel0_X.w, vNormalTexel0_X.y, C_1d0);
	float vNormalTexel0_X1 = dot(g_vNormalTransform0U, H_221bqb1);
	float vNormalTexel0_X2 = dot(g_vNormalTransform0V, H_221bqb1);
	vec2 H_xtvrcc1 = vec2(vNormalTexel0_X1, vNormalTexel0_X2);
	vec3 H_4i0dbz = vec3(vNormalTexel1_X.w, vNormalTexel1_X.y, C_1d0);
	float vNormalTexel1_X1 = dot(g_vNormalTransform1U, H_4i0dbz);
	float vNormalTexel1_X2 = dot(g_vNormalTransform1V, H_4i0dbz);
	vec2 H_hzxca6 = vec2(vNormalTexel1_X1, vNormalTexel1_X2);
	vec3 H_ambdp1 = vec3(vNormalTexel2_X.w, vNormalTexel2_X.y, C_1d0);
	float vNormalTexel2_X1 = dot(g_vNormalTransform2U, H_ambdp1);
	float vNormalTexel2_X2 = dot(g_vNormalTransform2V, H_ambdp1);
	vec2 H_9wwoay1 = vec2(vNormalTexel2_X1, vNormalTexel2_X2);
	vec3 H_gkx56p = vec3(vNormalTexel3_X.w, vNormalTexel3_X.y, C_1d0);
	float vNormalTexel3_X1 = dot(g_vNormalTransform3U, H_gkx56p);
	float vNormalTexel3_X2 = dot(g_vNormalTransform3V, H_gkx56p);
	vec2 H_hq1lmu = vec2(vNormalTexel3_X1, vNormalTexel3_X2);
	vec2 H_pgkq13 = H_xtvrcc1 * H_z5x9xm;
	vec2 H_lb5z8g = H_fomviv1 * H_hzxca6;
	vec2 H_v0e9q91 = H_lb5z8g + H_pgkq13;
	vec2 H_v5g2ao1 = H_9wwoay1 * H_ltjhbf1;
	vec2 H_og0b771 = H_v0e9q91 + H_v5g2ao1;
	vec2 H_6lzvmx1 = H_7nal2n1 * H_hq1lmu;
	vec2 vBlendedNormal_X = H_6lzvmx1 + H_og0b771;
	vec2 H_fexc5r = vBlendedNormal_X * C_vec2p2d0p;
	vec2 H_u53gm31 = H_fexc5r + C_vec2pa1d0p;
	float vNormalTs = dot(H_u53gm31, H_u53gm31);
	float param3 = C_1d0 - vNormalTs;
	float misc3a2 = clamp(param3, C_0d0, C_1d0);
	float vNormalTs1 = sqrt(misc3a2);
	float H_rkq5hu = C_0d0 - H_u53gm31.y;
	vec2 H_x1he8s = vec2(g_flBumpStrength);
	vec2 H_v8za97 = vec2(H_u53gm31.x, H_rkq5hu);
	vec2 H_rzvubn1 = H_v8za97 * H_x1he8s;
	vec3 H_bic2b31 = vec3(H_rzvubn1.x, H_rzvubn1.y, vNormalTs1);
	vec3 vNormalTs2 = normalize(H_bic2b31);
	float vTmp = dot(vGeometricNormalWs, C_sc72c91);
	vec3 H_k9ykq2 = vec3(vTmp);
	vec3 H_90usi6 = H_k9ykq2 * vGeometricNormalWs;
	vec3 vTmp1 = C_sc72c91 - H_90usi6;
	float flLen = length(vTmp1);
	bool H_e3vd98 = flLen < C_1ea05;
	vec3 ternary = H_e3vd98 ? C_sc72c91 : vTmp1;
	float vTmp2 = dot(vGeometricNormalWs, C_1oqnzq);
	vec3 H_spcdqf1 = vec3(vTmp2);
	vec3 H_mv4gdk = H_spcdqf1 * vGeometricNormalWs;
	vec3 vTmp3 = C_1oqnzq - H_mv4gdk;
	float flLen1 = length(vTmp3);
	bool H_d2kz96 = flLen1 < C_1ea05;
	vec3 _L = H_d2kz96 ? C_1oqnzq : vTmp3;
	vec3 vVectorWs = ternary * vNormalTs2.xxx;
	vec3 H_lz17u91 = _L * vNormalTs2.yyy;
	vec3 vVectorWs1 = H_lz17u91 + vVectorWs;
	vec3 H_9wf1l91 = vGeometricNormalWs * vNormalTs2.zzz;
	vec3 vVectorWs2 = H_9wf1l91 + vVectorWs1;
	vec4 vNormalTexel0_Y = texture(g_tNormal0, mainIn.member6.zw);
	vec4 vNormalTexel1_Y = texture(g_tNormal1, mainIn.member7.zw);
	vec4 vNormalTexel2_Y = texture(g_tNormal2, mainIn.member8.zw);
	vec4 vNormalTexel3_Y = texture(g_tNormal3, H_d4o2x91);
	vec3 H_81kymo = vec3(vNormalTexel0_Y.w, vNormalTexel0_Y.y, C_1d0);
	float vNormalTexel0_Y1 = dot(g_vNormalTransform0U, H_81kymo);
	float vNormalTexel0_Y2 = dot(g_vNormalTransform0V, H_81kymo);
	vec2 H_1bg4vg1 = vec2(vNormalTexel0_Y1, vNormalTexel0_Y2);
	vec3 H_6xu9we = vec3(vNormalTexel1_Y.w, vNormalTexel1_Y.y, C_1d0);
	float vNormalTexel1_Y1 = dot(g_vNormalTransform1U, H_6xu9we);
	float vNormalTexel1_Y2 = dot(g_vNormalTransform1V, H_6xu9we);
	vec2 H_pfohk61 = vec2(vNormalTexel1_Y1, vNormalTexel1_Y2);
	vec3 H_gst8111 = vec3(vNormalTexel2_Y.w, vNormalTexel2_Y.y, C_1d0);
	float vNormalTexel2_Y1 = dot(g_vNormalTransform2U, H_gst8111);
	float vNormalTexel2_Y2 = dot(g_vNormalTransform2V, H_gst8111);
	vec2 H_ltg2q51 = vec2(vNormalTexel2_Y1, vNormalTexel2_Y2);
	vec3 H_uxw2ip1 = vec3(vNormalTexel3_Y.w, vNormalTexel3_Y.y, C_1d0);
	float vNormalTexel3_Y1 = dot(g_vNormalTransform3U, H_uxw2ip1);
	float vNormalTexel3_Y2 = dot(g_vNormalTransform3V, H_uxw2ip1);
	vec2 H_1ax7ki = vec2(vNormalTexel3_Y1, vNormalTexel3_Y2);
	vec2 H_c70zxc = H_1bg4vg1 * H_z5x9xm;
	vec2 H_0brayo1 = H_fomviv1 * H_pfohk61;
	vec2 H_ty78xy1 = H_0brayo1 + H_c70zxc;
	vec2 H_ip5key1 = H_ltg2q51 * H_ltjhbf1;
	vec2 H_ufsq8w1 = H_ip5key1 + H_ty78xy1;
	vec2 H_lnzp9c = H_1ax7ki * H_7nal2n1;
	vec2 vBlendedNormal_Y = H_lnzp9c + H_ufsq8w1;
	vec2 H_8qujwi1 = C_vec2p2d0p * vBlendedNormal_Y;
	vec2 H_oyi9a6 = C_vec2pa1d0p + H_8qujwi1;
	float vNormalTs3 = dot(H_oyi9a6, H_oyi9a6);
	float param4 = C_1d0 - vNormalTs3;
	float misc3a3 = clamp(param4, C_0d0, C_1d0);
	float vNormalTs4 = sqrt(misc3a3);
	float H_7zap8e1 = C_0d0 - H_oyi9a6.y;
	vec2 H_xyuwls1 = vec2(H_oyi9a6.x, H_7zap8e1);
	vec2 H_9nxy171 = H_x1he8s * H_xyuwls1;
	vec3 H_01tnys = vec3(H_9nxy171.x, H_9nxy171.y, vNormalTs4);
	vec3 vNormalTs5 = normalize(H_01tnys);
	float vTmp4 = dot(vGeometricNormalWs, C_ypnorl1);
	vec3 H_e1we2j1 = vec3(vTmp4);
	vec3 H_b501kh1 = H_e1we2j1 * vGeometricNormalWs;
	vec3 vTmp5 = C_ypnorl1 - H_b501kh1;
	float flLen2 = length(vTmp5);
	bool H_0a6b4q = flLen2 < C_1ea05;
	vec3 ternary1 = H_0a6b4q ? C_ypnorl1 : vTmp5;
	vec3 vVectorWs3 = ternary1 * vNormalTs5.xxx;
	vec3 H_cj933d1 = _L * vNormalTs5.yyy;
	vec3 vVectorWs4 = H_cj933d1 + vVectorWs3;
	vec3 H_ksvde2 = vGeometricNormalWs * vNormalTs5.zzz;
	vec3 vVectorWs5 = H_ksvde2 + vVectorWs4;
	vec4 vNormalTexel0_Z = texture(g_tNormal0, mainIn.member9.xy);
	vec4 vNormalTexel1_Z = texture(g_tNormal1, mainIn.member9.zw);
	vec4 vNormalTexel2_Z = texture(g_tNormal2, H_lykagc);
	vec4 vNormalTexel3_Z = texture(g_tNormal3, H_9xv0dz);
	vec3 H_2o4535 = vec3(vNormalTexel0_Z.w, vNormalTexel0_Z.y, C_1d0);
	float vNormalTexel0_Z1 = dot(g_vNormalTransform0U, H_2o4535);
	float vNormalTexel0_Z2 = dot(g_vNormalTransform0V, H_2o4535);
	vec2 H_x8mozd = vec2(vNormalTexel0_Z1, vNormalTexel0_Z2);
	vec3 H_8kqcqv1 = vec3(vNormalTexel1_Z.w, vNormalTexel1_Z.y, C_1d0);
	float vNormalTexel1_Z1 = dot(g_vNormalTransform1U, H_8kqcqv1);
	float vNormalTexel1_Z2 = dot(g_vNormalTransform1V, H_8kqcqv1);
	vec2 H_l7civv1 = vec2(vNormalTexel1_Z1, vNormalTexel1_Z2);
	vec3 H_elmlni1 = vec3(vNormalTexel2_Z.w, vNormalTexel2_Z.y, C_1d0);
	float vNormalTexel2_Z1 = dot(g_vNormalTransform2U, H_elmlni1);
	float vNormalTexel2_Z2 = dot(g_vNormalTransform2V, H_elmlni1);
	vec2 H_xtsshf1 = vec2(vNormalTexel2_Z1, vNormalTexel2_Z2);
	vec3 H_w7em0c = vec3(vNormalTexel3_Z.w, vNormalTexel3_Z.y, C_1d0);
	float vNormalTexel3_Z1 = dot(g_vNormalTransform3U, H_w7em0c);
	float vNormalTexel3_Z2 = dot(g_vNormalTransform3V, H_w7em0c);
	vec2 H_p1jojd1 = vec2(vNormalTexel3_Z1, vNormalTexel3_Z2);
	vec2 H_8dv0b11 = H_x8mozd * H_z5x9xm;
	vec2 H_rpz509 = H_fomviv1 * H_l7civv1;
	vec2 H_08w2431 = H_8dv0b11 + H_rpz509;
	vec2 H_jn7fwn1 = H_ltjhbf1 * H_xtsshf1;
	vec2 H_yv2r3s = H_08w2431 + H_jn7fwn1;
	vec2 H_7alrmm = H_7nal2n1 * H_p1jojd1;
	vec2 vBlendedNormal_Z = H_7alrmm + H_yv2r3s;
	vec2 H_5tniqj1 = C_vec2p2d0p * vBlendedNormal_Z;
	vec2 H_pddg7k1 = C_vec2pa1d0p + H_5tniqj1;
	float vNormalTs6 = dot(H_pddg7k1, H_pddg7k1);
	float param5 = C_1d0 - vNormalTs6;
	float misc3a4 = clamp(param5, C_0d0, C_1d0);
	float vNormalTs7 = sqrt(misc3a4);
	float H_65s3nf = C_0d0 - H_pddg7k1.y;
	vec2 H_boebdz = vec2(H_pddg7k1.x, H_65s3nf);
	vec2 H_44u3r8 = H_boebdz * H_x1he8s;
	vec3 H_jfdl031 = vec3(H_44u3r8.x, H_44u3r8.y, vNormalTs7);
	vec3 vNormalTs8 = normalize(H_jfdl031);
	float vTmp6 = dot(vGeometricNormalWs, C_1fua5g);
	vec3 H_w95rbr = vec3(vTmp6);
	vec3 H_p2zu1f1 = H_w95rbr * vGeometricNormalWs;
	vec3 vTmp7 = C_1fua5g - H_p2zu1f1;
	float flLen3 = length(vTmp7);
	bool H_z3hv2o1 = flLen3 < C_1ea05;
	vec3 _L1 = H_z3hv2o1 ? C_1fua5g : vTmp7;
	vec3 vVectorWs6 = ternary1 * vNormalTs8.xxx;
	vec3 H_6cxhsr1 = _L1 * vNormalTs8.yyy;
	vec3 vVectorWs7 = H_6cxhsr1 + vVectorWs6;
	vec3 H_3eqcp5 = vGeometricNormalWs * vNormalTs8.zzz;
	vec3 vVectorWs8 = H_3eqcp5 + vVectorWs7;
	vec3 vNormalWs = mix(vVectorWs2, vVectorWs5, misc3a);
	vec3 vNormalWs1 = mix(vNormalWs, vVectorWs8, misc3a1);
	vec3 H_r81ng61 = mainIn.member0.xyz - g_vCameraPositionWs;
	vec3 H_nz2b9m1 = normalize(H_r81ng61);
	vec3 H_h2yv59 = C_vec3p0d0p - H_nz2b9m1;
	vec3 vReflect = reflect(H_h2yv59, vNormalWs1);
	float flSpecular = dot(g_vGlobalLightSpecularDir, vReflect);
	float misc3a5 = clamp(flSpecular, C_0d0, C_1d0);
	float flSpecular1 = pow(misc3a5, g_flGlobalLightSpecularExp);
	float flSpecular2 = H_lvzeez * flSpecular1;
	vec3 H_s6408y = vec3(flSpecular2);
	vec3 flSpecularRGB = H_s6408y * g_vGlobalLightSpecularColor;
	float misc3a6 = clamp(g_flGlobalLightSpecularIndependence, C_0d0, C_1d0);
	vec3 H_b18fci1 = vec3(misc3a6);
	float H_bxozn2 = C_1d0 - misc3a6;
	vec3 H_j3vgqr = vec3(H_bxozn2);
	vec3 H_f7jpm41 = H_j3vgqr * flSpecularRGB;
	vec3 H_c6k4ww1 = H_f7jpm41 + H_k0k8in;
	vec3 H_j03jbn = C_vec3p0d0p - g_vGlobalLightDir;
	float flNDotL = dot(H_j03jbn, vNormalWs1);
	float misc3a7 = clamp(flNDotL, C_0d0, C_1d0);
	float product = g_matShadowWorldToTexture[0].x * mainIn.member0.x;
	float product1 = g_matShadowWorldToTexture[1].x * mainIn.member0.y;
	float dotProduct = product + product1;
	float product2 = g_matShadowWorldToTexture[2].x * mainIn.member0.z;
	float dotProduct1 = dotProduct + product2;
	float dotProduct2 = dotProduct1 + g_matShadowWorldToTexture[3].x;
	float product3 = g_matShadowWorldToTexture[0].y * mainIn.member0.x;
	float product4 = g_matShadowWorldToTexture[1].y * mainIn.member0.y;
	float dotProduct3 = product3 + product4;
	float product5 = g_matShadowWorldToTexture[2].y * mainIn.member0.z;
	float dotProduct4 = dotProduct3 + product5;
	float dotProduct5 = dotProduct4 + g_matShadowWorldToTexture[3].y;
	float product6 = g_matShadowWorldToTexture[0].z * mainIn.member0.x;
	float product7 = g_matShadowWorldToTexture[1].z * mainIn.member0.y;
	float dotProduct6 = product6 + product7;
	float product8 = g_matShadowWorldToTexture[2].z * mainIn.member0.z;
	float dotProduct7 = dotProduct6 + product8;
	float dotProduct8 = dotProduct7 + g_matShadowWorldToTexture[3].z;
	float product9 = g_matShadowWorldToTexture[0].w * mainIn.member0.x;
	float producta = g_matShadowWorldToTexture[1].w * mainIn.member0.y;
	float dotProduct9 = product9 + producta;
	float productb = g_matShadowWorldToTexture[2].w * mainIn.member0.z;
	float dotProducta = dotProduct9 + productb;
	float dotProductb = dotProducta + g_matShadowWorldToTexture[3].w;
	vec3 H_16wbh81 = vec3(dotProductb);
	vec3 H_mo5dbs1 = vec3(dotProduct2, dotProduct5, dotProduct8);
	vec3 H_qdsg5k1 = H_mo5dbs1 / H_16wbh81;
	float param6 = C_0d0 - H_qdsg5k1.z;
	float misc3a8 = clamp(param6, C_0d0, C_1d0);
	float H_60ojyb = C_0d0 - g_vInvShadowDepthTextureSize.x;
	vec2 H_t5te6f = vec2(H_60ojyb);
	vec2 H_ep5c3j1 = H_qdsg5k1.xy + g_vInvShadowDepthTextureSize.xx;
	vec3 H_aq5cht1 = vec3(H_ep5c3j1.x, H_ep5c3j1.y, misc3a8);
	float H_8b94yh = textureLod(g_tShadowDepthTexture, H_aq5cht1, C_0d0);
	vec2 H_pv0in9 = vec2(H_60ojyb, g_vInvShadowDepthTextureSize.x);
	vec2 H_he48ts = H_pv0in9 + H_qdsg5k1.xy;
	vec3 H_q6ky1l1 = vec3(H_he48ts.x, H_he48ts.y, misc3a8);
	float H_sq74hi1 = textureLod(g_tShadowDepthTexture, H_q6ky1l1, C_0d0);
	vec2 H_t32u4i1 = vec2(g_vInvShadowDepthTextureSize.x, H_60ojyb);
	vec2 H_3zubtq = H_qdsg5k1.xy + H_t32u4i1;
	vec3 H_2x31kr = vec3(H_3zubtq.x, H_3zubtq.y, misc3a8);
	float H_qcjbim = textureLod(g_tShadowDepthTexture, H_2x31kr, C_0d0);
	vec2 H_r37y1w = H_qdsg5k1.xy + H_t5te6f;
	vec3 H_e67apn = vec3(H_r37y1w.x, H_r37y1w.y, misc3a8);
	float H_4efq4j1 = textureLod(g_tShadowDepthTexture, H_e67apn, C_0d0);
	vec4 H_u39m8j1 = vec4(H_8b94yh, H_sq74hi1, H_qcjbim, H_4efq4j1);
	float flSum = dot(H_u39m8j1, C_wt9i7t);
	vec2 H_e9rh661 = vec2(g_vInvShadowDepthTextureSize.x, C_0d0);
	vec2 H_85dk7x = H_e9rh661 + H_qdsg5k1.xy;
	vec3 H_mpwjbp1 = vec3(H_85dk7x.x, H_85dk7x.y, misc3a8);
	float H_4x2i5b = textureLod(g_tShadowDepthTexture, H_mpwjbp1, C_0d0);
	vec2 H_na4vhz = vec2(H_60ojyb, C_0d0);
	vec2 H_iybrli = H_na4vhz + H_qdsg5k1.xy;
	vec3 H_im0ohl1 = vec3(H_iybrli.x, H_iybrli.y, misc3a8);
	float H_75dyok = textureLod(g_tShadowDepthTexture, H_im0ohl1, C_0d0);
	vec2 H_23b4ob1 = C_a1z03r;
	H_23b4ob1.y = H_60ojyb;
	vec2 H_wcm3cs = H_23b4ob1 + H_qdsg5k1.xy;
	vec3 H_255y8p = vec3(H_wcm3cs.x, H_wcm3cs.y, misc3a8);
	float H_imm58f1 = textureLod(g_tShadowDepthTexture, H_255y8p, C_0d0);
	vec2 H_23b4ob1r = C_a1z03r;
	H_23b4ob1r.y = g_vInvShadowDepthTextureSize.x;
	vec2 H_omz8p81 = H_23b4ob1r + H_qdsg5k1.xy;
	vec3 H_2d5bb91 = vec3(H_omz8p81.x, H_omz8p81.y, misc3a8);
	float H_msbb8r1 = textureLod(g_tShadowDepthTexture, H_2d5bb91, C_0d0);
	vec4 H_d2l9rh = vec4(H_4x2i5b, H_75dyok, H_imm58f1, H_msbb8r1);
	float flSum1 = dot(H_d2l9rh, C_a1xzaw1);
	float flSum2 = flSum + flSum1;
	vec3 H_cdkbbq1 = vec3(H_qdsg5k1.x, H_qdsg5k1.y, misc3a8);
	float flSum3 = textureLod(g_tShadowDepthTexture, H_cdkbbq1, C_0d0);
	float H_xchcee1 = flSum3 * C_0d205993;
	float flSum4 = H_xchcee1 + flSum2;
	vec3 H_k9xsqt1 = vec3(flSum4);
	float flDirectionalAmbientShadow = mix(C_1d0, flSum4, g_flGlobalLightAmbientShadowAmount);
	float flDirectOcclusionFactor = pow(C_1d0, C_1d85);
	float flDirectOcclusionFactor1 = mix(C_0d45, C_1d0, flDirectOcclusionFactor);
	float flIndirectOcclusionFactor = pow(C_1d0, C_2d1);
	vec3 H_fx1uua = vec3(g_flGlobalLightAmbientScale1);
	vec3 vDirectionalAmbientColor = H_fx1uua * g_vGlobalLightAmbientColor1;
	float H_wecyty = vNormalWs1.z * C_0d5;
	float H_b76gog = C_0d5 + H_wecyty;
	vec3 vShadowAmbientColor = mix(g_vGlobalLightAmbientColor3, g_vGlobalLightAmbientColor2, H_b76gog);
	vec3 H_s7noda1 = vec3(g_flGlobalLightAmbientScale2);
	vec3 vShadowAmbientColor1 = H_s7noda1 * vShadowAmbientColor;
	float flLuminance = dot(vDirectionalAmbientColor, C_kfumqy1);
	vec3 H_t1lelu1 = vec3(flLuminance);
	float flLuminance1 = dot(vShadowAmbientColor1, C_kfumqy1);
	vec3 H_chpant1 = vec3(flLuminance1);
	vec3 vDirectionalAmbientColor1 = mix(vDirectionalAmbientColor, H_t1lelu1, H_w78ji6);
	vec3 vShadowAmbientColor2 = mix(vShadowAmbientColor1, H_chpant1, H_w78ji6);
	float H_5ni0h8 = flSum4 * misc3a7;
	float H_eu0fwd = H_5ni0h8 * flDirectOcclusionFactor1;
	vec3 H_zj2f3v = vec3(H_eu0fwd);
	vec3 vDirectLight = H_zj2f3v * g_vGlobalLightColor;
	float vDirectionalAmbientLight = dot(g_vGlobalLightAmbientDir, vNormalWs1);
	float misc3a9 = clamp(vDirectionalAmbientLight, C_0d0, C_1d0);
	float H_agjthh = flDirectionalAmbientShadow * misc3a9;
	float H_exurdj1 = H_agjthh * flIndirectOcclusionFactor;
	vec3 H_9dd4fr = vec3(H_exurdj1);
	vec3 vDirectionalAmbientLight1 = H_9dd4fr * vDirectionalAmbientColor1;
	float H_s8n6i3 = C_1d0 - H_5ni0h8;
	float H_ndlp0x1 = H_s8n6i3 * flIndirectOcclusionFactor;
	vec3 H_nrqypn = vec3(H_ndlp0x1);
	vec3 vShadowAmbientLight = H_nrqypn * vShadowAmbientColor2;
	vec3 H_8w78gv1 = vDirectLight + vDirectionalAmbientLight1;
	vec3 vLighting = H_8w78gv1 + vShadowAmbientLight;
	vec3 H_3bayh5 = H_c6k4ww1 * vLighting;
	vec3 H_bcfwoi = vec3(g_flGlobalLightSpecularScale);
	vec3 H_knhpna = H_bcfwoi * flSpecularRGB;
	vec3 H_9ve3jd = H_b18fci1 * H_knhpna;
	vec3 H_reysx41 = H_9ve3jd * H_k9xsqt1;
	vec3 H_ip61ve1 = H_3bayh5 + H_reysx41;
	vec4 H_0y7wz = vec4(mainIn.member0.x, mainIn.member0.y, mainIn.member0.z, C_1d0);
	float flClipPlaneDist = dot(g_vClipPlane0, H_0y7wz);
	float param7 = flClipPlaneDist * g_flInvFogRange;
	float misc3aa = clamp(param7, C_0d0, C_1d0);
	vec4 H_xyd9rk = vec4(H_ip61ve1.x, H_ip61ve1.y, H_ip61ve1.z, misc3aa);
	PS_OUTPUT_gl_vDiffuse = H_xyd9rk;
	PS_OUTPUT_gl_flDepth = mainIn.member0.wwww;
}
