#version 330 core
// LunarGOO output
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout(std140, binding = 0 ) uniform _Globals_ {
	vec4 g_vInvTextureDim;
} ;
layout( binding = 0 ) uniform sampler2D g_tInputTexture;
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
layout(location=0) in vec2 PS_INPUT_gl_vTexCoord;
layout(location=0) out vec4 PS_OUTPUT_gl_vColor;
const float C_0d0 = 0.0;
const ivec2 C_1s6y7w1 = ivec2(0, -1);
const ivec2 C_h7x911 = ivec2(-1, 0);
const ivec2 C_ivec2p0p = ivec2(0);
const ivec2 C_ivec2p1ca0p = ivec2(1, 0);
const ivec2 C_ivec2p0ca1p = ivec2(0, 1);
const float C_1d96321 = 1.96321;
const float C_0d25 = 0.25;
const float C_0d0833333 = 0.0833333;
const vec3 C_vec3p0d2p = vec3(0.2);
const float C_a0d25 = -0.25;
const float C_1d33333 = 1.33333;
const float C_0d666667 = 0.666667;
const ivec2 C_ivec2pa1p = ivec2(-1);
const ivec2 C_cd2kfw = ivec2(1, -1);
const ivec2 C_wk45l6 = ivec2(-1, 1);
const ivec2 C_ivec2p1p = ivec2(1);
const float C_a0d5 = -0.5;
const float C_0d5 = 0.5;
const float C_a1d0 = -1.0;
const vec2 C_a1z03r = vec2(0.0, 0.0);
const vec2 C_vec2pa2d5p = vec2(-2.5);
const vec2 C_vec2p2d5p = vec2(2.5);
const vec2 C_vec2p4d0p = vec2(4.0);
const int C_0 = 0;
const bool C_false = false;
const int C_1 = 1;
const vec4 C_xx1m2m1 = vec4(0.0, 0.0, 0.0, 1.0);
void main()
{
	int i;
	bool doneP;
	bool doneN;
	float lumaEndP;
	float lumaEndN;
	vec2 posP;
	vec2 posN;
	float lumaEndN1;
	float lumaEndP1;
	float lumaEndP2;
	float lumaEndN2;
	vec3 earlyretval;
	vec2 H_z8if2n1;
	H_z8if2n1.x = g_vInvTextureDim.x;
	vec2 vScreenUv = g_vInvTextureDim.xy * gl_FragCoord.xy;
	vec4 rgbN = textureLodOffset(g_tInputTexture, vScreenUv, C_0d0, C_1s6y7w1);
	vec4 rgbW = textureLodOffset(g_tInputTexture, vScreenUv, C_0d0, C_h7x911);
	vec4 rgbM = textureLodOffset(g_tInputTexture, vScreenUv, C_0d0, C_ivec2p0p);
	vec4 rgbE = textureLodOffset(g_tInputTexture, vScreenUv, C_0d0, C_ivec2p1ca0p);
	vec4 rgbS = textureLodOffset(g_tInputTexture, vScreenUv, C_0d0, C_ivec2p0ca1p);
	float H_90z8am = rgbN.y * C_1d96321;
	float H_9u5tb31 = H_90z8am + rgbN.x;
	float H_e40m2y = C_1d96321 * rgbW.y;
	float H_oco8391 = H_e40m2y + rgbW.x;
	float H_gg6prs1 = C_1d96321 * rgbM.y;
	float H_xfyo5r1 = H_gg6prs1 + rgbM.x;
	float H_cftb601 = C_1d96321 * rgbE.y;
	float H_j1rp641 = H_cftb601 + rgbE.x;
	float H_ac1xjl1 = C_1d96321 * rgbS.y;
	float H_frcefa = H_ac1xjl1 + rgbS.x;
	float rangeMin = min(H_9u5tb31, H_oco8391);
	float rangeMin1 = min(H_frcefa, H_j1rp641);
	float rangeMin2 = min(rangeMin, rangeMin1);
	float rangeMin3 = min(H_xfyo5r1, rangeMin2);
	float rangeMax = max(H_9u5tb31, H_oco8391);
	float rangeMax1 = max(H_frcefa, H_j1rp641);
	float rangeMax2 = max(rangeMax, rangeMax1);
	float rangeMax3 = max(H_xfyo5r1, rangeMax2);
	float range = rangeMax3 - rangeMin3;
	float H_u355m01 = rangeMax3 * C_0d25;
	float misc2a = max(C_0d0833333, H_u355m01);
	bool H_3odbw61 = range < misc2a;
	if (H_3odbw61) {
		earlyretval = rgbM.xyz;
	} else {
		vec3 H_zon8hb1 = rgbN.xyz + rgbW.xyz;
		vec3 H_6fyda41 = H_zon8hb1 + rgbE.xyz;
		vec3 H_vzdq941 = H_6fyda41 + rgbS.xyz;
		vec3 H_vmj5ra = H_vzdq941 + rgbM.xyz;
		vec3 rgbL = H_vmj5ra * C_vec3p0d2p;
		float H_d4newk1 = H_9u5tb31 + H_oco8391;
		float H_kqe2kt = H_d4newk1 + H_j1rp641;
		float H_9g4wby1 = H_frcefa + H_kqe2kt;
		float lumaL = C_0d25 * H_9g4wby1;
		float H_cu287y1 = lumaL - H_xfyo5r1;
		float rangeL = abs(H_cu287y1);
		float H_qbfvjk = rangeL / range;
		float H_thdefy1 = H_qbfvjk + C_a0d25;
		float blendL = max(C_0d0, H_thdefy1);
		float blendL1 = blendL * C_1d33333;
		float blendL2 = min(C_0d666667, blendL1);
		vec3 H_mi71yp = vec3(blendL2);
		vec4 rgbNW = textureLodOffset(g_tInputTexture, vScreenUv, C_0d0, C_ivec2pa1p);
		vec4 rgbNE = textureLodOffset(g_tInputTexture, vScreenUv, C_0d0, C_cd2kfw);
		vec4 rgbSW = textureLodOffset(g_tInputTexture, vScreenUv, C_0d0, C_wk45l6);
		vec4 rgbSE = textureLodOffset(g_tInputTexture, vScreenUv, C_0d0, C_ivec2p1p);
		float H_4811gq1 = C_1d96321 * rgbNW.y;
		float H_uqp8l6 = H_4811gq1 + rgbNW.x;
		float H_urr13h = C_1d96321 * rgbNE.y;
		float H_o8cv4p1 = H_urr13h + rgbNE.x;
		float H_995r9n1 = C_1d96321 * rgbSW.y;
		float H_fdq4oz = H_995r9n1 + rgbSW.x;
		float H_fyqedp1 = C_1d96321 * rgbSE.y;
		float H_aibcet1 = H_fyqedp1 + rgbSE.x;
		float H_t4xnke = C_0d25 * H_uqp8l6;
		float H_jrgvfd = H_9u5tb31 * C_a0d5;
		float H_941ta = H_jrgvfd + H_t4xnke;
		float H_iy0l6o1 = C_0d25 * H_o8cv4p1;
		float H_xfwsgd = H_941ta + H_iy0l6o1;
		float edgeVert = abs(H_xfwsgd);
		float H_jhxwgq = H_oco8391 * C_0d5;
		float H_qeyinc1 = H_xfyo5r1 * C_a1d0;
		float H_jab0hg1 = H_jhxwgq + H_qeyinc1;
		float H_zk268k1 = C_0d5 * H_j1rp641;
		float H_arytmt1 = H_jab0hg1 + H_zk268k1;
		float edgeVert1 = abs(H_arytmt1);
		float H_bnakiq1 = edgeVert + edgeVert1;
		float H_v7hev21 = C_0d25 * H_fdq4oz;
		float H_p23lbh = C_a0d5 * H_frcefa;
		float H_alt26 = H_p23lbh + H_v7hev21;
		float H_0088st1 = C_0d25 * H_aibcet1;
		float H_78mqma1 = H_0088st1 + H_alt26;
		float edgeVert2 = abs(H_78mqma1);
		float edgeVert3 = H_bnakiq1 + edgeVert2;
		float H_4qe18y = C_a0d5 * H_oco8391;
		float H_6pabhj1 = H_4qe18y + H_t4xnke;
		float H_fherqy = H_6pabhj1 + H_v7hev21;
		float edgeHorz = abs(H_fherqy);
		float H_89ejb5 = C_0d5 * H_9u5tb31;
		float H_tkebly1 = H_89ejb5 + H_qeyinc1;
		float H_431ryz = C_0d5 * H_frcefa;
		float H_z86gaa1 = H_431ryz + H_tkebly1;
		float edgeHorz1 = abs(H_z86gaa1);
		float H_v4r5k = edgeHorz + edgeHorz1;
		float H_ocw8ax1 = C_a0d5 * H_j1rp641;
		float H_9wm7nc = H_iy0l6o1 + H_ocw8ax1;
		float H_zxfl1t1 = H_0088st1 + H_9wm7nc;
		float edgeHorz2 = abs(H_zxfl1t1);
		float edgeHorz3 = H_v4r5k + edgeHorz2;
		bool horzSpan = edgeHorz3 >= edgeVert3;
		float H_2p88nb = horzSpan ? g_vInvTextureDim.y : g_vInvTextureDim.x;
		float lengthSign = C_0d0 - H_2p88nb;
		float lumaN = horzSpan ? H_9u5tb31 : H_oco8391;
		float lumaS = horzSpan ? H_frcefa : H_j1rp641;
		float H_6hhomb1 = lumaN - H_xfyo5r1;
		float gradientN = abs(H_6hhomb1);
		float H_xqy9y01 = lumaS - H_xfyo5r1;
		float gradientS = abs(H_xqy9y01);
		bool pairN = gradientN >= gradientS;
		float lumaS1 = pairN ? lumaN : lumaS;
		float lumaN1 = H_xfyo5r1 + lumaS1;
		float lumaN2 = C_0d5 * lumaN1;
		float gradientN1 = pairN ? gradientN : gradientS;
		float lengthSign1 = pairN ? lengthSign : H_2p88nb;
		float posN1 = C_0d5 * lengthSign1;
		float select = horzSpan ? C_0d0 : posN1;
		float H_3h02kr1 = select + vScreenUv.x;
		float select1 = horzSpan ? posN1 : C_0d0;
		float H_1qm3xt1 = select1 + vScreenUv.y;
		vec2 H_4xuvfc = vec2(H_3h02kr1, H_1qm3xt1);
		float gradientN2 = C_0d25 * gradientN1;
		vec2 H_ktq2a7 = H_z8if2n1;
		H_ktq2a7.y = C_0d0;
		vec2 H_23b4ob1 = C_a1z03r;
		H_23b4ob1.y = g_vInvTextureDim.y;
		vec2 select2 = horzSpan ? H_ktq2a7 : H_23b4ob1;
		vec2 H_vt0emq = select2 * C_vec2pa2d5p;
		vec2 posN2 = H_4xuvfc + H_vt0emq;
		vec2 H_eb0zkh1 = select2 * C_vec2p2d5p;
		vec2 posP1 = H_4xuvfc + H_eb0zkh1;
		vec2 offNP = select2 * C_vec2p4d0p;
		i = C_0;
		doneP = C_false;
		doneN = C_false;
		lumaEndP = lumaN2;
		lumaEndN = lumaN2;
		posP = posP1;
		posN = posN2;
		lumaEndP2 = lumaEndP;
		lumaEndN2 = lumaEndN;
		while (i <= C_1) {
			lumaEndN1 = lumaEndN;
			if (! doneN) {
				vec4 txt = textureGrad(g_tInputTexture, posN, offNP, offNP);
				float H_gbzt2f1 = C_1d96321 * txt.y;
				float H_1qewlt1 = H_gbzt2f1 + txt.x;
				lumaEndN1 = H_1qewlt1;
			}
			lumaEndP1 = lumaEndP;
			if (! doneP) {
				vec4 txt1 = textureGrad(g_tInputTexture, posP, offNP, offNP);
				float H_d328fb1 = C_1d96321 * txt1.y;
				float H_ggxcuk1 = H_d328fb1 + txt1.x;
				lumaEndP1 = H_ggxcuk1;
			}
			float H_wokh4w1 = lumaEndN1 - lumaN2;
			float doneN1 = abs(H_wokh4w1);
			bool H_vtyfv6 = doneN1 >= gradientN2;
			bool doneN2 = doneN || H_vtyfv6;
			float H_y7ikdy = lumaEndP1 - lumaN2;
			float doneP1 = abs(H_y7ikdy);
			bool H_tq2hlw = doneP1 >= gradientN2;
			bool doneP2 = doneP || H_tq2hlw;
			bool H_fnhx1e = doneN2 && doneP2;
			if (H_fnhx1e) {
				lumaEndP2 = lumaEndP1;
				lumaEndN2 = lumaEndN1;
				break;
			}
			vec2 posN3 = posN - offNP;
			vec2 select3 = doneN2 ? posN : posN3;
			vec2 posP2 = offNP + posP;
			vec2 select4 = doneP2 ? posP : posP2;
			int H_o3goq3 = C_1 + i;
			i = H_o3goq3;
			doneP = doneP2;
			doneN = doneN2;
			lumaEndP = lumaEndP1;
			lumaEndN = lumaEndN1;
			posP = select4;
			posN = select3;
			lumaEndP2 = lumaEndP;
			lumaEndN2 = lumaEndN;
		}
		float dstN = vScreenUv.x - posN.x;
		float dstN1 = vScreenUv.y - posN.y;
		float select5 = horzSpan ? dstN : dstN1;
		float dstP = posP.x - vScreenUv.x;
		float dstP1 = posP.y - vScreenUv.y;
		float select6 = horzSpan ? dstP : dstP1;
		bool directionN = select5 < select6;
		float lumaEndN3 = directionN ? lumaEndN2 : lumaEndP2;
		float H_k70s9b1 = H_xfyo5r1 - lumaN2;
		bool H_pk8ak21 = H_k70s9b1 < C_0d0;
		float H_y08oey = lumaEndN3 - lumaN2;
		bool H_8veqgm = H_y08oey < C_0d0;
		bool tmp = H_pk8ak21 ^^ H_8veqgm;
		float lengthSign2 = tmp ? lengthSign1 : C_0d0;
		float spanLength = select5 + select6;
		float dstN2 = directionN ? select5 : select6;
		float H_8dxktp = C_a1d0 / spanLength;
		float H_8mzjks1 = H_8dxktp * dstN2;
		float H_gfo0kc1 = C_0d5 + H_8mzjks1;
		float subPixelOffset = H_gfo0kc1 * lengthSign2;
		float rgbF = horzSpan ? C_0d0 : subPixelOffset;
		float H_0sn088 = rgbF + vScreenUv.x;
		float subPixelOffset1 = horzSpan ? subPixelOffset : C_0d0;
		float H_m8mlr3 = subPixelOffset1 + vScreenUv.y;
		vec2 H_i4g1d61 = vec2(H_0sn088, H_m8mlr3);
		vec4 txt2 = textureLod(g_tInputTexture, H_i4g1d61, C_0d0);
		float H_fzqbmr = C_0d0 - blendL2;
		vec3 H_qfeq2t1 = vec3(H_fzqbmr);
		vec3 H_vhq97c = H_qfeq2t1 * txt2.xyz;
		vec3 H_aikimw1 = H_mi71yp * rgbL;
		vec3 H_rjasg5 = H_aikimw1 + txt2.xyz;
		vec3 H_oirak1 = H_rjasg5 + H_vhq97c;
		earlyretval = H_oirak1;
	}
	vec4 H_rwwpo7 = C_xx1m2m1;
	H_rwwpo7.xyz = earlyretval.xyz;
	PS_OUTPUT_gl_vColor = H_rwwpo7;
}