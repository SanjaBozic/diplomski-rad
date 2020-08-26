#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout( binding = 0 ) uniform sampler2D g_tSsaoBuffer;
layout(std140, binding = 0 ) uniform _Globals_ {
	vec4 g_vInvSsaoTextureSize;
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
uniform sampler2D g_tSsao;
layout(location=0) in vec2 PS_INPUT_gl_vTexCoord;
layout(location=1) in vec3 PS_INPUT_gl_vCameraToFarPlaneDirWs;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const float C_2d0 = 2.0;
const float C_1d0 = 1.0;
const float C_0d0 = 0.0;
const float C_a1d0 = -1.0;
const float C_a2d0 = -2.0;
const vec2 C_86o5yl1 = vec2(0.996109, 0.00389105);
const float C_255d0 = 255.0;
const float C_0d0625 = 0.0625;
const float C_16d0 = 16.0;
const vec2 C_vec2pa8d0p = vec2(-8.0);
const vec2 C_vec2p7d0p = vec2(7.0);
const vec2 C_a1z03r = vec2(0.0, 0.0);
const float C_0d035 = 0.035;
const float C_a0d7 = -0.7;
const float C_0d3 = 0.3;
void main()
{
	vec2 H_cgzgnu = vec2(C_2d0);
	vec2 H_na1d5e = vec2(C_1d0);
	vec2 H_aogyom = vec2(C_0d0);
	vec2 H_iuplru = vec2(C_a1d0);
	vec2 H_122ahf1 = vec2(C_a2d0);
	vec4 vCenterSample = texture(g_tSsaoBuffer, PS_INPUT_gl_vTexCoord);
	float misc2a = dot(vCenterSample.yz, C_86o5yl1);
	float H_tdkfgl = vCenterSample.w * C_255d0;
	float H_xjaava1 = H_tdkfgl * C_0d0625;
	float H_tagvs31 = floor(H_xjaava1);
	float H_2o8u3p = H_tagvs31 * C_16d0;
	float H_hwtic51 = H_tdkfgl - H_2o8u3p;
	vec2 H_0qg7mh1 = vec2(H_tagvs31, H_hwtic51);
	vec2 H_37biwr1 = H_0qg7mh1 + C_vec2pa8d0p;
	vec2 H_hdpj5y = H_37biwr1 / C_vec2p7d0p;
	float H_nnsgxt1 = H_hdpj5y.x * H_hdpj5y.x;
	float H_vr4apb = C_1d0 - H_nnsgxt1;
	float H_d04nhp = H_hdpj5y.y * H_hdpj5y.y;
	float H_1l0cvg1 = H_vr4apb - H_d04nhp;
	float H_n8lf2c = max(C_0d0, H_1l0cvg1);
	float H_icbd5g = sqrt(H_n8lf2c);
	vec3 H_xhq9f5 = vec3(H_hdpj5y.x, H_hdpj5y.y, H_icbd5g);
	vec2 H_23b4ob1 = C_a1z03r;
	H_23b4ob1.y = g_vInvSsaoTextureSize.y;
	vec2 H_5vbl6i1 = H_122ahf1 * H_23b4ob1;
	vec2 vUv = H_5vbl6i1 + PS_INPUT_gl_vTexCoord;
	vec4 vLocalSample = texture(g_tSsaoBuffer, vUv);
	float misc2a1 = dot(vLocalSample.yz, C_86o5yl1);
	float flDistanceDelta = misc2a1 - misc2a;
	float H_p1cz3k = C_255d0 * vLocalSample.w;
	float H_zl8we41 = C_0d0625 * H_p1cz3k;
	float H_qmjeaa1 = floor(H_zl8we41);
	float H_x2ju12 = C_16d0 * H_qmjeaa1;
	float H_gigmyk = H_p1cz3k - H_x2ju12;
	vec2 H_yxz3cl = vec2(H_qmjeaa1, H_gigmyk);
	vec2 H_7tnfye1 = C_vec2pa8d0p + H_yxz3cl;
	vec2 H_snk6sj = H_7tnfye1 / C_vec2p7d0p;
	float H_t30k711 = H_snk6sj.x * H_snk6sj.x;
	float H_h080rs = C_1d0 - H_t30k711;
	float H_zz9u6 = H_snk6sj.y * H_snk6sj.y;
	float H_ncdzmc = H_h080rs - H_zz9u6;
	float H_qwuu88 = max(C_0d0, H_ncdzmc);
	float H_5nqwkv1 = sqrt(H_qwuu88);
	vec3 H_kxa05q = vec3(H_snk6sj.x, H_snk6sj.y, H_5nqwkv1);
	bool H_8jj29i = flDistanceDelta < C_0d0;
	float flDistanceDelta1 = C_0d0 - flDistanceDelta;
	float select = H_8jj29i ? flDistanceDelta1 : flDistanceDelta;
	float H_vsssn = misc2a1 * C_0d035;
	float param = select / H_vsssn;
	float misc3a = clamp(param, C_0d0, C_1d0);
	float flWeight = C_1d0 - misc3a;
	float flNormalAng = dot(H_kxa05q, H_xhq9f5);
	float H_50t1cd = flNormalAng + C_a0d7;
	float param1 = H_50t1cd / C_0d3;
	float misc3a1 = clamp(param1, C_0d0, C_1d0);
	float flWeight1 = flWeight * misc3a1;
	float H_dc6hsk1 = flWeight1 * vLocalSample.x;
	vec2 H_tnugv9 = H_23b4ob1 * H_iuplru;
	vec2 vUv1 = H_tnugv9 + PS_INPUT_gl_vTexCoord;
	vec4 vLocalSample1 = texture(g_tSsaoBuffer, vUv1);
	float misc2a2 = dot(vLocalSample1.yz, C_86o5yl1);
	float flDistanceDelta2 = misc2a2 - misc2a;
	float H_ycfode = C_255d0 * vLocalSample1.w;
	float H_b1j9bg = C_0d0625 * H_ycfode;
	float H_ovcuyg1 = floor(H_b1j9bg);
	float H_l87dj8 = C_16d0 * H_ovcuyg1;
	float H_llczc7 = H_ycfode - H_l87dj8;
	vec2 H_n71ys91 = vec2(H_ovcuyg1, H_llczc7);
	vec2 H_a0ny3a1 = C_vec2pa8d0p + H_n71ys91;
	vec2 H_jpizt7 = H_a0ny3a1 / C_vec2p7d0p;
	float H_jvd0di1 = H_jpizt7.x * H_jpizt7.x;
	float H_g0pz7j1 = C_1d0 - H_jvd0di1;
	float H_1rp3kn1 = H_jpizt7.y * H_jpizt7.y;
	float H_p3gexq1 = H_g0pz7j1 - H_1rp3kn1;
	float H_yrsj5v = max(C_0d0, H_p3gexq1);
	float H_484u9q = sqrt(H_yrsj5v);
	vec3 H_cn8iqw = vec3(H_jpizt7.x, H_jpizt7.y, H_484u9q);
	bool H_6zrha1 = flDistanceDelta2 < C_0d0;
	float flDistanceDelta3 = C_0d0 - flDistanceDelta2;
	float select1 = H_6zrha1 ? flDistanceDelta3 : flDistanceDelta2;
	float H_i0fqtb = C_0d035 * misc2a2;
	float param2 = select1 / H_i0fqtb;
	float misc3a2 = clamp(param2, C_0d0, C_1d0);
	float flWeight2 = C_1d0 - misc3a2;
	float flNormalAng1 = dot(H_cn8iqw, H_xhq9f5);
	float H_kg1c4 = C_a0d7 + flNormalAng1;
	float param3 = H_kg1c4 / C_0d3;
	float misc3a3 = clamp(param3, C_0d0, C_1d0);
	float flWeight3 = flWeight2 * misc3a3;
	float H_2i5k4u = flWeight3 * vLocalSample1.x;
	float flTotalWeights = flWeight1 + flWeight3;
	float flAccum = H_2i5k4u + H_dc6hsk1;
	vec2 H_ui3pk31 = H_23b4ob1 * H_aogyom;
	vec2 vUv2 = H_ui3pk31 + PS_INPUT_gl_vTexCoord;
	vec4 vLocalSample2 = texture(g_tSsaoBuffer, vUv2);
	float flTotalWeights1 = C_1d0 + flTotalWeights;
	float flAccum1 = flAccum + vLocalSample2.x;
	vec2 H_00ulia1 = H_23b4ob1 * H_na1d5e;
	vec2 vUv3 = H_00ulia1 + PS_INPUT_gl_vTexCoord;
	vec4 vLocalSample3 = texture(g_tSsaoBuffer, vUv3);
	float misc2a3 = dot(vLocalSample3.yz, C_86o5yl1);
	float flDistanceDelta4 = misc2a3 - misc2a;
	float H_8l9f3p = C_255d0 * vLocalSample3.w;
	float H_j3ipnq = C_0d0625 * H_8l9f3p;
	float H_cc1ag51 = floor(H_j3ipnq);
	float H_ilost61 = C_16d0 * H_cc1ag51;
	float H_s0sw0n1 = H_8l9f3p - H_ilost61;
	vec2 H_9mvrve1 = vec2(H_cc1ag51, H_s0sw0n1);
	vec2 H_g77n1v = C_vec2pa8d0p + H_9mvrve1;
	vec2 H_8b1f2e = H_g77n1v / C_vec2p7d0p;
	float H_3ju45u = H_8b1f2e.x * H_8b1f2e.x;
	float H_o5mp201 = C_1d0 - H_3ju45u;
	float H_xfjnmh = H_8b1f2e.y * H_8b1f2e.y;
	float H_p7xz1t = H_o5mp201 - H_xfjnmh;
	float H_7bc2iq = max(C_0d0, H_p7xz1t);
	float H_lm7wun = sqrt(H_7bc2iq);
	vec3 H_dm2l8i = vec3(H_8b1f2e.x, H_8b1f2e.y, H_lm7wun);
	bool H_oj2d6z = flDistanceDelta4 < C_0d0;
	float flDistanceDelta5 = C_0d0 - flDistanceDelta4;
	float select2 = H_oj2d6z ? flDistanceDelta5 : flDistanceDelta4;
	float H_hp0q3c = C_0d035 * misc2a3;
	float param4 = select2 / H_hp0q3c;
	float misc3a4 = clamp(param4, C_0d0, C_1d0);
	float flWeight4 = C_1d0 - misc3a4;
	float flNormalAng2 = dot(H_dm2l8i, H_xhq9f5);
	float H_hjuay = C_a0d7 + flNormalAng2;
	float param5 = H_hjuay / C_0d3;
	float misc3a5 = clamp(param5, C_0d0, C_1d0);
	float flWeight5 = flWeight4 * misc3a5;
	float H_ut4ne9 = flWeight5 * vLocalSample3.x;
	float flTotalWeights2 = flTotalWeights1 + flWeight5;
	float flAccum2 = H_ut4ne9 + flAccum1;
	vec2 H_6tz5hi = H_23b4ob1 * H_cgzgnu;
	vec2 vUv4 = H_6tz5hi + PS_INPUT_gl_vTexCoord;
	vec4 vLocalSample4 = texture(g_tSsaoBuffer, vUv4);
	float misc2a4 = dot(vLocalSample4.yz, C_86o5yl1);
	float flDistanceDelta6 = misc2a4 - misc2a;
	float H_dg8ky9 = C_255d0 * vLocalSample4.w;
	float H_93kzc11 = C_0d0625 * H_dg8ky9;
	float H_l6by2i1 = floor(H_93kzc11);
	float H_0d7yg11 = C_16d0 * H_l6by2i1;
	float H_he1mvo = H_dg8ky9 - H_0d7yg11;
	vec2 H_jt7ttu = vec2(H_l6by2i1, H_he1mvo);
	vec2 H_8epgx11 = C_vec2pa8d0p + H_jt7ttu;
	vec2 H_ogpfze = H_8epgx11 / C_vec2p7d0p;
	float H_h8ejbo1 = H_ogpfze.x * H_ogpfze.x;
	float H_5jxnz2 = C_1d0 - H_h8ejbo1;
	float H_3s8zo = H_ogpfze.y * H_ogpfze.y;
	float H_g82be31 = H_5jxnz2 - H_3s8zo;
	float H_vo0m31 = max(C_0d0, H_g82be31);
	float H_nf3cfu = sqrt(H_vo0m31);
	vec3 H_ax2k97 = vec3(H_ogpfze.x, H_ogpfze.y, H_nf3cfu);
	bool H_yrf51x1 = flDistanceDelta6 < C_0d0;
	float flDistanceDelta7 = C_0d0 - flDistanceDelta6;
	float select3 = H_yrf51x1 ? flDistanceDelta7 : flDistanceDelta6;
	float H_ouss5a = C_0d035 * misc2a4;
	float param6 = select3 / H_ouss5a;
	float misc3a6 = clamp(param6, C_0d0, C_1d0);
	float flWeight6 = C_1d0 - misc3a6;
	float flNormalAng3 = dot(H_ax2k97, H_xhq9f5);
	float H_iu8bo = C_a0d7 + flNormalAng3;
	float param7 = H_iu8bo / C_0d3;
	float misc3a7 = clamp(param7, C_0d0, C_1d0);
	float flWeight7 = flWeight6 * misc3a7;
	float H_l7u7tx1 = flWeight7 * vLocalSample4.x;
	float flTotalWeights3 = flTotalWeights2 + flWeight7;
	float flAccum3 = H_l7u7tx1 + flAccum2;
	float H_84hlbx1 = flAccum3 / flTotalWeights3;
	vec4 H_p64zdi = vec4(H_84hlbx1, vCenterSample.y, vCenterSample.z, vCenterSample.w);
	PS_OUTPUT_gl_vColor = H_p64zdi;
}