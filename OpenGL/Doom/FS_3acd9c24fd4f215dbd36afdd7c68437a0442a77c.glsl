#version 430 core
#extension GL_ARB_shader_clock : enable
void clip( float v ) { if ( v < 0.0 ) { discard; } }
void clip( vec2 v ) { if ( any( lessThan( v, vec2( 0.0 ) ) ) ) { discard; } }
void clip( vec3 v ) { if ( any( lessThan( v, vec3( 0.0 ) ) ) ) { discard; } }
void clip( vec4 v ) { if ( any( lessThan( v, vec4( 0.0 ) ) ) ) { discard; } }

float saturate( float v ) { return clamp( v, 0.0, 1.0 ); }
vec2 saturate( vec2 v ) { return clamp( v, 0.0, 1.0 ); }
vec3 saturate( vec3 v ) { return clamp( v, 0.0, 1.0 ); }
vec4 saturate( vec4 v ) { return clamp( v, 0.0, 1.0 ); }

vec4 tex2D( sampler2D image, vec2 texcoord ) { return texture( image, texcoord.xy ); }
vec4 tex2D( sampler2DShadow image, vec3 texcoord ) { return vec4( texture( image, texcoord.xyz ) ); }
vec4 tex2DARRAY( sampler2DArray image, vec3 texcoord ) { return texture( image, texcoord.xyz ); }

vec4 tex2D( sampler2D image, vec2 texcoord, vec2 dx, vec2 dy ) { return textureGrad( image, texcoord.xy, dx, dy ); }
vec4 tex2D( sampler2DShadow image, vec3 texcoord, vec2 dx, vec2 dy ) { return vec4( textureGrad( image, texcoord.xyz, dx, dy ) ); }
vec4 tex2DARRAY( sampler2DArray image, vec3 texcoord, vec2 dx, vec2 dy ) { return textureGrad( image, texcoord.xyz, dx, dy ); }

vec4 texCUBE( samplerCube image, vec3 texcoord ) { return texture( image, texcoord.xyz ); }
vec4 texCUBE( samplerCubeShadow image, vec4 texcoord ) { return vec4( texture( image, texcoord.xyzw ) ); }
vec4 texCUBEARRAY( samplerCubeArray image, vec4 texcoord ) { return texture( image, texcoord.xyzw ); }

vec4 tex1Dproj( sampler1D image, vec2 texcoord ) { return textureProj( image, texcoord ); }
vec4 tex2Dproj( sampler2D image, vec3 texcoord ) { return textureProj( image, texcoord ); }
vec4 tex3Dproj( sampler3D image, vec4 texcoord ) { return textureProj( image, texcoord ); }

vec4 tex1Dbias( sampler1D image, vec4 texcoord ) { return texture( image, texcoord.x, texcoord.w ); }
vec4 tex2Dbias( sampler2D image, vec4 texcoord ) { return texture( image, texcoord.xy, texcoord.w ); }
vec4 tex2DARRAYbias( sampler2DArray image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 tex3Dbias( sampler3D image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEbias( samplerCube image, vec4 texcoord ) { return texture( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEARRAYbias( samplerCubeArray image, vec4 texcoord, float bias ) { return texture( image, texcoord.xyzw, bias); }

vec4 tex1Dlod( sampler1D image, vec4 texcoord ) { return textureLod( image, texcoord.x, texcoord.w ); }
vec4 tex2Dlod( sampler2D image, vec4 texcoord ) { return textureLod( image, texcoord.xy, texcoord.w ); }
vec4 tex2DARRAYlod( sampler2DArray image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 tex3Dlod( sampler3D image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBElod( samplerCube image, vec4 texcoord ) { return textureLod( image, texcoord.xyz, texcoord.w ); }
vec4 texCUBEARRAYlod( samplerCubeArray image, vec4 texcoord, float lod ) { return textureLod( image, texcoord.xyzw, lod ); }

vec4 tex2DGatherRed( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 0 ); }
vec4 tex2DGatherGreen( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 1 ); }
vec4 tex2DGatherBlue( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 2 ); }
vec4 tex2DGatherAlpha( sampler2D image, vec2 texcoord ) { return textureGather( image, texcoord, 3 ); }

vec4 tex2DGatherOffsetRed( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 0 ); }
vec4 tex2DGatherOffsetGreen( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 1 ); }
vec4 tex2DGatherOffsetBlue( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 2 ); }
vec4 tex2DGatherOffsetAlpha( sampler2D image, vec2 texcoord, const ivec2 v0 ) { return textureGatherOffset( image, texcoord, v0, 3 ); }

#define tex2DGatherOffsetsRed( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 0 )
#define tex2DGatherOffsetsGreen( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 1 )
#define tex2DGatherOffsetsBlue( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 2 )
#define tex2DGatherOffsetsAlpha( image, texcoord, v0, v1, v2, v3 ) textureGatherOffsets( image, texcoord, ivec2[]( v0, v1, v2, v3 ), 3 )

uniform vec4 _fa_freqHigh [28];
uniform vec4 _fa_freqLow [14];
uniform lightparms1_ubo { vec4 lightparms1[4096]; };
uniform lightparms2_ubo { vec4 lightparms2[4096]; };
uniform lightparms3_ubo { vec4 lightparms3[4096]; };
uniform shadowsparmsubo_ubo { vec4 shadowsparmsubo[4095]; };
uniform sampler2D samp_vmtrpagetablemap;
uniform sampler2D samp_vmtrphysicalmappingsmap;
uniform sampler2DArray samp_vmtrphysicalpagesmaparray0;
uniform sampler2D samp_vmtrphysicalpagesmap3;
uniform sampler2D samp_woundtexture;
uniform sampler2D samp_lightsatlasmap;
uniform sampler2DShadow samp_shadowatlasdepthcomparemap;
uniform sampler2D samp_echodithermap;
uniform sampler2D samp_magnificationclouds;
struct clusternumlights_t {
	int offset ;
	int numItems ;
};
struct light_t {
	vec3 pos ;
	uint lightParms ;
	vec4 posShadow ;
	vec4 falloffR ;
	vec4 projS ;
	vec4 projT ;
	vec4 projQ ;
	uvec4 scaleBias ;
	vec4 boxMin ;
	vec4 boxMax ;
	vec4 areaPlane ;
	uint lightParms2 ;
	uint colorPacked ;
	float specMultiplier ;
	float shadowBleedReduce ;
};
struct shadowparms_t {
	vec4 shadowLightS ;
	vec4 shadowLightT ;
	vec4 shadowLightR ;
	vec4 shadowLightQ ;
	vec4 shadowAtlasScaleBias ;
};
layout( std430 ) buffer clusternumlights_b {
	restrict readonly clusternumlights_t clusternumlights[ ];
};
layout( std430 ) buffer clusterlightsid_b {
	restrict readonly uint clusterlightsid[ ];
};
layout( binding = 0, r32f ) uniform image2D ib_feedbackbuffer ;

in vec4 vofi_TexCoord0;
in vec4 vofi_TexCoord4;
in vec4 vofi_TexCoord1;
in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord3;
in vec4 vofi_TexCoord7;
in vec4 vofi_TexCoord6;
in vec4 vofi_TexCoord8;
in vec4 vofi_TexCoord9;
in vec4 vofi_TexCoord10;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;
out vec4 out_FragColor1;
out vec4 out_FragColor2;

float dot2 ( vec2 a, vec2 b ) { return dot( a, b ); }
float asfloat ( uint x ) { return uintBitsToFloat( x ); }
float asfloat ( int x ) { return intBitsToFloat( x ); }
uint asuint ( float x ) { return floatBitsToUint( x ); }
int asint ( float x ) { return floatBitsToInt( x ); }
vec2 asfloat ( uvec2 x ) { return uintBitsToFloat( x ); }
vec2 asfloat ( ivec2 x ) { return intBitsToFloat( x ); }
uvec2 asuint ( vec2 x ) { return floatBitsToUint( x ); }
ivec2 asint ( vec2 x ) { return floatBitsToInt( x ); }
vec3 asfloat ( uvec3 x ) { return uintBitsToFloat( x ); }
vec3 asfloat ( ivec3 x ) { return intBitsToFloat( x ); }
uvec3 asuint ( vec3 x ) { return floatBitsToUint( x ); }
ivec3 asint ( vec3 x ) { return floatBitsToInt( x ); }
vec4 asfloat ( uvec4 x ) { return uintBitsToFloat( x ); }
vec4 asfloat ( ivec4 x ) { return intBitsToFloat( x ); }
uvec4 asuint ( vec4 x ) { return floatBitsToUint( x ); }
ivec4 asint ( vec4 x ) { return floatBitsToInt( x ); }
float fmax3 ( float f1, float f2, float f3 ) { return max( f1, max( f2, f3 ) ); }
float fmin3 ( float f1, float f2, float f3 ) { return min( f1, min( f2, f3 ) ); }
uint getCubeMapFaceID ( float x, float y, float z ) { if ( abs( z ) >= abs( x ) && abs( z ) >= abs( y ) ) return ( z < 0 ) ? 5 : 4; if ( abs( y ) >= abs( x ) ) return ( y < 0 ) ? 3 : 2;
	return ( x < 0 ) ? 1 : 0;
}
float SRGBlinear ( float value ) { if ( value <= 0.04045 ) {
		return ( value / 12.92 );
	} else {
		return pow( ( value / 1.055 ) + 0.0521327, 2.4 );
	}
}
vec3 SRGBlinear ( vec3 sRGB ) {
	vec3 outLinear;
	outLinear.r = SRGBlinear( sRGB.r );
	outLinear.g = SRGBlinear( sRGB.g );
	outLinear.b = SRGBlinear( sRGB.b );
	return outLinear;
}
vec4 SRGBlinear ( vec4 sRGBA ) {
	vec4 outLinear = vec4( SRGBlinear( sRGBA.rgb ), 1 );
	outLinear.a = SRGBlinear( sRGBA.a );
	return outLinear;
}
float DeGamma ( float value ) {
	return SRGBlinear( value );
}
vec4 DeGamma ( vec4 color ) {
	return SRGBlinear( color );
}
vec3 DeGamma ( vec3 color ) {
	return SRGBlinear( color );
}
float ApproxLog2 ( float f ) {
	return ( float( asuint( f ) ) / ( 1 << 23 ) - 127 );
}
float ApproxExp2 ( float f ) {
	return asfloat( uint( ( f + 127 ) * ( 1 << 23 ) ) );
}
float ApproxPow ( float fBase, float fPower ) {
	return asfloat( uint( fPower * float( asuint( fBase ) ) - ( fPower - 1 ) * 127 * ( 1 << 23 ) ) );
}
float sqrtIEEEIntApproximation ( float inX, int inSqrtConst ) {
	int x = asint(inX);
	x = inSqrtConst + (x >> 1);
	return asfloat(x);
}
float fastSqrtNR0 ( float inX ) {
	return sqrtIEEEIntApproximation( inX, 0x1FBD1DF5 );
}
uint packR8G8B8A8 ( vec4 value ) {
	value = saturate( value );
	return ( ( ( uint( value.x * 255.0 ) ) << 24 ) | ( ( uint( value.y * 255.0 ) ) << 16 ) | ( ( uint( value.z * 255.0 ) ) << 8 ) | ( uint( value.w * 255.0 ) ) );
}
vec4 unpackR8G8B8A8 ( uint value ) {
	return vec4( ( value >> 24 ) & 0xFF, ( value >> 16 ) & 0xFF, ( value >> 8 ) & 0xFF, value & 0xFF ) / 255.0;
}
uint packR10G10B10 ( vec3 value ) {
	value = saturate( value );
	return ( ( uint( value.x * 1023.0 ) << 20 ) | ( uint( value.y * 1023.0 ) << 10 ) | ( uint( value.z * 1023.0 ) ) );
}
vec3 unpackR10G10B10 ( uint value ) {
	return vec3( ( value >> 20 ) & 0x3FF, ( value >> 10 ) & 0x3FF, ( value ) & 0x3FF ) / 1023.0;
}
vec4 unpackR15G15B15A15 ( uvec2 value ) {
	return vec4( ( value.x >> 16 ) & 0xFFFF, value.x & 0xFFFF, ( value.y >> 16 ) & 0xFFFF, value.y & 0xFFFF ) * ( 1.0 / 32767.0 );
}
uint packRGBE ( vec3 value ) {
	const float sharedExp = ceil( ApproxLog2( max( max( value.r, value.g ), value.b ) ) );
	return packR8G8B8A8( saturate( vec4( value / ApproxExp2( sharedExp ), ( sharedExp + 128.0 ) / 255.0 ) ) );
}
vec3 unpackRGBE ( uint value ) {
	const vec4 rgbe = unpackR8G8B8A8( value );
	return rgbe.rgb * ApproxExp2( rgbe.a * 255.0 - 128.0 );
}
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale ) { return ( pos * bias_scale.zw + bias_scale.xy ); }
vec2 screenPosToTexcoord ( vec2 pos, vec4 bias_scale, vec4 resolution_scale ) { return ( ( pos * bias_scale.zw + bias_scale.xy ) * resolution_scale.xy ); }
vec4 texPhys ( sampler2D image, vec2 texcoord ) { return tex2D( image, texcoord ); }
vec4 texPhys ( sampler2D image, vec2 texcoord, vec2 dx, vec2 dy ) { return tex2D( image, texcoord, dx, dy ); }
vec4 tex2DArray ( sampler2DArray image, float slice, vec2 texcoord ) { return tex2DARRAY( image, vec3( texcoord, slice ) ); }
vec4 tex2DArrayGrad ( sampler2DArray image, float slice, vec2 texcoord, vec2 dx, vec2 dy ) { return tex2DARRAY( image, vec3( texcoord, slice ), dx, dy ); }
vec4 texPhysArray ( sampler2DArray image, float slice, vec2 texcoord ) { return tex2DArray( image, slice, texcoord ); }
vec4 texPhysArray ( sampler2DArray image, float slice, vec2 texcoord, vec2 dx, vec2 dy ) { return tex2DArrayGrad( image, slice, texcoord, dx, dy ); }
float shadow2Ddepth ( sampler2DShadow image, vec3 texcoord ) { return textureLod( image, texcoord, 0 ).x; }
float GetLuma ( vec3 c ) {
	return dot( c, vec3( 0.2126, 0.7152, 0.0722 ) );
}
vec3 fresnelSchlick ( vec3 f0, float costheta ) {
	const float baked_spec_occl = saturate( 50.0 * dot( f0, vec3( 0.3333 ) ) );
	return saturate( f0 + ( baked_spec_occl - f0 ) * ApproxPow( saturate( 1.0 - costheta ), 5.0 ) );
}
vec3 specBRDF ( vec3 N, vec3 V, vec3 L, vec3 f0, float smoothness ) {
	const vec3 H = normalize( V + L );
	float m = ( 1 - smoothness * 0.8 );
	m *= m;
	m *= m;
	float m2 = m * m;
	float NdotH = saturate( dot( N, H ) );
	float spec = (NdotH * NdotH) * (m2 - 1) + 1;
	spec = m2 / ( spec * spec + 1e-8 );
	float Gv = saturate( dot( N, V ) ) * (1.0 - m) + m;
	float Gl = saturate( dot( N, L ) ) * (1.0 - m) + m;
	spec /= ( 4.0 * Gv * Gl + 1e-8 );
	return fresnelSchlick( f0, dot( L, H ) ) * spec;
}
struct lightingInput_t {
	vec3 albedo;
	vec3 colorMask;
	vec3 specular;
	float smoothness;
	float maskSSS;
	float thickness;
	vec3 normal;
	vec3 normalTS;
	vec3 normalSSS;
	vec3 lightmap;
	vec3 emissive;
	float alpha;
	float ssdoDiffuseMul;
	vec3 view;
	vec3 position;
	vec4 texCoords;
	vec4 fragCoord;
	mat3x3 invTS;
	vec3 ambient_lighting;
	vec3 diffuse_lighting;
	vec3 specular_lighting;
	vec3 output_lighting;
	uint albedo_packed;
	uint specular_packed;
	uint diffuse_lighting_packed;
	uint specular_lighting_packed;
	uint normal_packed;
	uvec4 ticksDecals;
	uvec4 ticksProbes;
	uvec4 ticksLights;
};
float GetLinearDepth ( float ndcZ, vec4 projectionMatrixZ, float rcpFarZ, bool bFirstPersonArmsRescale ) {
	float linearZ = projectionMatrixZ.w / ( ndcZ + projectionMatrixZ.z );
	if ( bFirstPersonArmsRescale ) {
		linearZ *= linearZ < 1.0 ? 10.0 : 1.0;
	}
	return linearZ * rcpFarZ;
}
vec3 ReconstructNormal ( vec3 normalTS, bool isFrontFacing ) {
	vec3 N = normalTS.xyz * 2.0 - 1.0;
	N.z = sqrt( saturate( 1 - N.x * N.x - N.y * N.y ) );
	if ( isFrontFacing == false ) {
		N.z = -N.z;
	}
	return N;
}
vec3 TransformNormal ( vec3 normal, mat3x3 mat ) {
	return normalize( vec3( dot( normal.xyz, mat[0].xyz), dot( normal.xyz, mat[1].xyz), dot( normal.xyz, mat[2].xyz) ) );
}
vec3 GetWorldSpaceNormal ( vec3 normalTS, mat3x3 invTS, bool isFrontFacing ) {
	const vec3 N = ReconstructNormal( normalTS.xyz, isFrontFacing );
	return TransformNormal( N, invTS );
}
vec2 OctWrap ( vec2 v ) {
	return ( 1.0 - abs( v.yx ) ) * vec2( ( v.x >= 0.0 ? 1.0 : -1.0 ), ( v.y >= 0.0 ? 1.0 : -1.0 ) );
}
vec2 NormalOctEncode ( vec3 n, bool compress_range ) {
	n /= ( abs( n.x ) + abs( n.y ) + abs( n.z ) );
	n.xy = n.z >= 0.0 ? n.xy : OctWrap( n.xy );
	if ( compress_range ) {
		n.xy = n.xy * 0.5 + 0.5;
	}
	return n.xy;
}
float SmoothnessEncode ( float s ) {
	const float s1 = fastSqrtNR0( abs( s ) );
	return ( s > 0 ? s1 : -s1 ) * 0.5 + 0.5;
}
layout(early_fragment_tests) in ;
void main() {
	{
		{
			lightingInput_t inputs = lightingInput_t( vec3(0,0,0), vec3(0,0,0), vec3(0,0,0), 0, 0, 0, vec3(0,0,0), vec3(0,0,1), vec3(0,0,1), vec3(0,0,0), vec3(0,0,0), 1, 1, vec3(0,0,0), vec3(0,0,0), vec4(0,0,0,0), vec4(0,0,0,0), mat3x3( vec3(1,0,0), vec3(0,1,0), vec3(0,0,1) ), vec3(0,0,0), vec3(0,0,0), vec3(0,0,0), vec3(0,0,0), 0, 0, 0, 0, 0, uvec4(0,0,0,0), uvec4(0,0,0,0), uvec4(0,0,0,0) );
			inputs.texCoords = vofi_TexCoord0;
			inputs.fragCoord = gl_FragCoord;
			inputs.position = _fa_freqLow[0 ].xyz + vofi_TexCoord4.xyz;
			inputs.view = normalize( -vofi_TexCoord4.xyz );
			inputs.invTS = mat3x3( vofi_TexCoord1.xyz, vofi_TexCoord2.xyz, vofi_TexCoord3.xyz );
			uint feedback = 0;
			vec4 sampleLightmap = vec4( 0 );
			vec4 sampleColorMask = vec4( 0 );
			vec4 sampleDiffuse = vec4( 0 );
			vec4 sampleSpecular = vec4( 0 );
			vec4 sampleNormal = vec4( 0 );
			{
				{
					vec2 texCoords = inputs.texCoords.xy;
					vec2 texCoordsLOD = inputs.texCoords.xy; if ( _fa_freqHigh[0 ].x > 0 ) {
						texCoords.xy = fract( inputs.texCoords.xy ) * _fa_freqHigh[1 ].xy + _fa_freqHigh[1 ].zw;
						texCoordsLOD = inputs.texCoords.xy * _fa_freqHigh[1 ].xy;
					}
					float anisoLOD;
					float sampleLOD;
					{
						float widthInTexels = _fa_freqLow[1 ].z;
						float maxAnisoLog2 = _fa_freqHigh[2 ].z;
						vec2 texelCoords = texCoordsLOD.xy * widthInTexels;
						vec2 dx = dFdx( texelCoords );
						vec2 dy = dFdy( texelCoords );
						float px = dot2( dx, dx );
						float py = dot2( dy, dy );
						float maxLod = 0.5 * log2( max( px, py ) );
						float minLod = 0.5 * log2( min( px, py ) );
						anisoLOD = maxLod - min( maxAnisoLog2, maxLod - minLod );
					};
					{
						sampleLOD = anisoLOD;
					};
					{
						float widthInPages = _fa_freqLow[1 ].y;
						float feedbackBias = _fa_freqHigh[2 ].y;
						uvec2 feedbackPageUV = uvec2( texCoords.xy * widthInPages );
						uint feedbackLOD = uint( min( _fa_freqHigh[2 ].w, max( 0.0, anisoLOD ) + feedbackBias ) );
						uint feedbackPageSource = uint( _fa_freqLow[1 ].x );
						feedback = feedbackPageUV.x & 0xff;
						feedback |= ( feedbackPageUV.y & 0xff ) << 8;
						feedback |= feedbackPageUV.x >> 8 << 16;
						feedback |= feedbackPageUV.y >> 8 << 24;
						feedback |= feedbackLOD << 19;
						feedback |= feedbackPageSource << 27;
					};
					sampleLOD += 0.0;
					{
						vec3 physCoords;
						if ( _fa_freqLow[2 ].y != 0.0 ) {
							float trilinearFraction = fract( sampleLOD );
							bool twoSamples;
							float sampleLOD1, sampleLOD2;
							{
								float triStart = 0.5 - 0.25 / 2.0;
								float triEnd = 0.5 + 0.25 / 2.0;
								if ( trilinearFraction <= triStart ) {
									twoSamples = false;
									sampleLOD1 = sampleLOD - 0.5;
									sampleLOD2 = 0.0;
								} else if ( trilinearFraction >= triEnd ) {
									twoSamples = false;
									sampleLOD1 = sampleLOD + 0.5;
									sampleLOD2 = 0.0;
								} else {
									twoSamples = true;
									sampleLOD1 = sampleLOD - 0.5;
									sampleLOD2 = sampleLOD + 0.5;
								}
							};
							{
								vec4 virtCoordsLod = vec4( texCoords.xy.x, texCoords.xy.y, 0, sampleLOD1 );
								vec2 physPage = tex2Dlod( samp_vmtrpagetablemap, virtCoordsLod ).xy;
								vec4 xform = tex2D( samp_vmtrphysicalmappingsmap, physPage );
								physCoords.x = texCoords.xy.x * xform.x + xform.z;
								physCoords.y = texCoords.xy.y * ( xform.x * _fa_freqLow[3 ].x ) + xform.w;
								physCoords.z = xform.y;
							};
							{
								vec2 dx = dFdx( texCoordsLOD.xy ) * physCoords.z;
								vec2 dy = dFdy( texCoordsLOD.xy ) * physCoords.z;
								sampleDiffuse = texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy );
								sampleSpecular = texPhysArray( samp_vmtrphysicalpagesmaparray0, 1.0, physCoords.xy, dx, dy );
								sampleLightmap = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy );
								sampleColorMask = texPhys( samp_vmtrphysicalpagesmap3, physCoords.xy, dx, dy );
								sampleNormal = vec4( 0.0 );
								float cover = sampleLightmap.z;
								float power = DeGamma( sampleLightmap.w );
								sampleNormal.y = sampleSpecular.w;
								sampleNormal.w = sampleDiffuse.w;
								sampleSpecular.w = cover;
								sampleLightmap.w = power;
							};
							if ( twoSamples ) {
								vec4 sampleSpecular2, sampleDiffuse2, samplePower2, sampleColorMask2, sampleLightmap2;
								{
									vec4 virtCoordsLod = vec4( texCoords.xy.x, texCoords.xy.y, 0, sampleLOD2 );
									vec2 physPage = tex2Dlod( samp_vmtrpagetablemap, virtCoordsLod ).xy;
									vec4 xform = tex2D( samp_vmtrphysicalmappingsmap, physPage );
									physCoords.x = texCoords.xy.x * xform.x + xform.z;
									physCoords.y = texCoords.xy.y * ( xform.x * _fa_freqLow[3 ].x ) + xform.w;
									physCoords.z = xform.y;
								};
								{
									vec2 dx = dFdx( texCoordsLOD.xy ) * physCoords.z;
									vec2 dy = dFdy( texCoordsLOD.xy ) * physCoords.z;
									sampleDiffuse2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy );
									sampleSpecular2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 1.0, physCoords.xy, dx, dy );
									sampleLightmap2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy );
									sampleColorMask2 = texPhys( samp_vmtrphysicalpagesmap3, physCoords.xy, dx, dy );
									samplePower2 = vec4( 0.0 );
									float cover = sampleLightmap2.z;
									float power = DeGamma( sampleLightmap2.w );
									samplePower2.y = sampleSpecular2.w;
									samplePower2.w = sampleDiffuse2.w;
									sampleSpecular2.w = cover;
									sampleLightmap2.w = power;
								};
								float lerpFactor = 0.0;
								{
									float triStart = 0.5 - 0.25 / 2.0;
									lerpFactor = saturate( ( trilinearFraction - triStart ) * ( 1.0 / 0.25 ) );
								};
								sampleSpecular = mix( sampleSpecular, sampleSpecular2, lerpFactor );
								sampleDiffuse = mix( sampleDiffuse, sampleDiffuse2, lerpFactor );
								sampleNormal = mix( sampleNormal, samplePower2, lerpFactor );
								sampleLightmap = mix( sampleLightmap, sampleLightmap2, lerpFactor );
								sampleColorMask = mix( sampleColorMask, sampleColorMask2, lerpFactor );
							}
						} else
						{
							{
								vec4 virtCoordsLod = vec4( texCoords.xy.x, texCoords.xy.y, 0, sampleLOD - 0.5 );
								vec2 physPage = tex2Dlod( samp_vmtrpagetablemap, virtCoordsLod ).xy;
								vec4 xform = tex2D( samp_vmtrphysicalmappingsmap, physPage );
								physCoords.x = texCoords.xy.x * xform.x + xform.z;
								physCoords.y = texCoords.xy.y * ( xform.x * _fa_freqLow[3 ].x ) + xform.w;
								physCoords.z = xform.y;
							};
							{
								vec2 dx = dFdx( texCoordsLOD.xy ) * physCoords.z;
								vec2 dy = dFdy( texCoordsLOD.xy ) * physCoords.z;
								sampleDiffuse = texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy );
								sampleSpecular = texPhysArray( samp_vmtrphysicalpagesmaparray0, 1.0, physCoords.xy, dx, dy );
								sampleLightmap = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy );
								sampleColorMask = texPhys( samp_vmtrphysicalpagesmap3, physCoords.xy, dx, dy );
								sampleNormal = vec4( 0.0 );
								float cover = sampleLightmap.z;
								float power = DeGamma( sampleLightmap.w );
								sampleNormal.y = sampleSpecular.w;
								sampleNormal.w = sampleDiffuse.w;
								sampleSpecular.w = cover;
								sampleLightmap.w = power;
							};
						}
					};
				};
			};
			{
				vec2 TEXTURE_RESOLUTION = vec2( 160.0, 120.0 );
				vec2 FRAMEBUFFER_PIXEL_SIZE = TEXTURE_RESOLUTION * _fa_freqHigh[3 ].zw;
				vec2 tc = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[3 ] ) * TEXTURE_RESOLUTION;
				float offsetMultiplier = floor( mod( tc.x + 0.25, 4.0 ) );
				float xOffset = offsetMultiplier * FRAMEBUFFER_PIXEL_SIZE.x;
				if ( fract( tc.x - xOffset ) < FRAMEBUFFER_PIXEL_SIZE.x && fract( tc.y ) < FRAMEBUFFER_PIXEL_SIZE.y ) {
					imageStore( ib_feedbackbuffer, ivec2( tc ), vec4( asfloat( feedback ), 0.0, 0.0, 0.0 ) );
				}
			};
			uint feedback2 = 0;
			vec4 sampleDiffuse2 = vec4( 0 );
			vec4 sampleSpecular2 = vec4( 0 );
			vec4 sampleNormal2 = vec4( 0 );
			vec4 sampleLightmap2 = vec4( 0 );
			vec4 sampleColorMask2 = vec4( 0 );
			{
				vec2 texCoords = inputs.texCoords.xy;
				vec2 texCoordsLOD = inputs.texCoords.xy; if ( _fa_freqHigh[0 ].x > 0 ) {
					texCoords.xy = fract( inputs.texCoords.xy ) * _fa_freqHigh[1 ].xy + _fa_freqHigh[1 ].zw;
					texCoordsLOD = inputs.texCoords.xy * _fa_freqHigh[1 ].xy;
				}
				float anisoLOD;
				float sampleLOD;
				{
					float widthInTexels = _fa_freqLow[1 ].z;
					float maxAnisoLog2 = _fa_freqHigh[2 ].z;
					vec2 texelCoords = texCoordsLOD.xy * widthInTexels;
					vec2 dx = dFdx( texelCoords );
					vec2 dy = dFdy( texelCoords );
					float px = dot2( dx, dx );
					float py = dot2( dy, dy );
					float maxLod = 0.5 * log2( max( px, py ) );
					float minLod = 0.5 * log2( min( px, py ) );
					anisoLOD = maxLod - min( maxAnisoLog2, maxLod - minLod );
				};
				{
					sampleLOD = anisoLOD;
				};
				{
					float widthInPages = _fa_freqLow[1 ].y;
					float feedbackBias = _fa_freqHigh[2 ].y;
					uvec2 feedbackPageUV = uvec2( texCoords.xy * widthInPages );
					uint feedbackLOD = uint( min( _fa_freqHigh[2 ].w, max( 0.0, anisoLOD ) + feedbackBias ) );
					uint feedbackPageSource = uint( _fa_freqLow[1 ].x );
					feedback2 = feedbackPageUV.x & 0xff;
					feedback2 |= ( feedbackPageUV.y & 0xff ) << 8;
					feedback2 |= feedbackPageUV.x >> 8 << 16;
					feedback2 |= feedbackPageUV.y >> 8 << 24;
					feedback2 |= feedbackLOD << 19;
					feedback2 |= feedbackPageSource << 27;
				};
				sampleLOD += _fa_freqHigh[4 ].x;
				{
					vec3 physCoords;
					if ( _fa_freqLow[2 ].y != 0.0 ) {
						float trilinearFraction = fract( sampleLOD );
						bool twoSamples;
						float sampleLOD1, sampleLOD2;
						{
							float triStart = 0.5 - 0.25 / 2.0;
							float triEnd = 0.5 + 0.25 / 2.0;
							if ( trilinearFraction <= triStart ) {
								twoSamples = false;
								sampleLOD1 = sampleLOD - 0.5;
								sampleLOD2 = 0.0;
							} else if ( trilinearFraction >= triEnd ) {
								twoSamples = false;
								sampleLOD1 = sampleLOD + 0.5;
								sampleLOD2 = 0.0;
							} else {
								twoSamples = true;
								sampleLOD1 = sampleLOD - 0.5;
								sampleLOD2 = sampleLOD + 0.5;
							}
						};
						{
							vec4 virtCoordsLod = vec4( texCoords.xy.x, texCoords.xy.y, 0, sampleLOD1 );
							vec2 physPage = tex2Dlod( samp_vmtrpagetablemap, virtCoordsLod ).xy;
							vec4 xform = tex2D( samp_vmtrphysicalmappingsmap, physPage );
							physCoords.x = texCoords.xy.x * xform.x + xform.z;
							physCoords.y = texCoords.xy.y * ( xform.x * _fa_freqLow[3 ].x ) + xform.w;
							physCoords.z = xform.y;
						};
						{
							vec2 dx = dFdx( texCoordsLOD.xy ) * physCoords.z;
							vec2 dy = dFdy( texCoordsLOD.xy ) * physCoords.z;
							sampleDiffuse2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy );
							sampleSpecular2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 1.0, physCoords.xy, dx, dy );
							sampleLightmap2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy );
							sampleColorMask2 = texPhys( samp_vmtrphysicalpagesmap3, physCoords.xy, dx, dy );
							sampleNormal2 = vec4( 0.0 );
							float cover = sampleLightmap2.z;
							float power = DeGamma( sampleLightmap2.w );
							sampleNormal2.y = sampleSpecular2.w;
							sampleNormal2.w = sampleDiffuse2.w;
							sampleSpecular2.w = cover;
							sampleLightmap2.w = power;
						};
						if ( twoSamples ) {
							vec4 sampleSpecular2, sampleDiffuse2, samplePower2, sampleColorMask2, sampleLightmap2;
							{
								vec4 virtCoordsLod = vec4( texCoords.xy.x, texCoords.xy.y, 0, sampleLOD2 );
								vec2 physPage = tex2Dlod( samp_vmtrpagetablemap, virtCoordsLod ).xy;
								vec4 xform = tex2D( samp_vmtrphysicalmappingsmap, physPage );
								physCoords.x = texCoords.xy.x * xform.x + xform.z;
								physCoords.y = texCoords.xy.y * ( xform.x * _fa_freqLow[3 ].x ) + xform.w;
								physCoords.z = xform.y;
							};
							{
								vec2 dx = dFdx( texCoordsLOD.xy ) * physCoords.z;
								vec2 dy = dFdy( texCoordsLOD.xy ) * physCoords.z;
								sampleDiffuse2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy );
								sampleSpecular2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 1.0, physCoords.xy, dx, dy );
								sampleLightmap2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy );
								sampleColorMask2 = texPhys( samp_vmtrphysicalpagesmap3, physCoords.xy, dx, dy );
								samplePower2 = vec4( 0.0 );
								float cover = sampleLightmap2.z;
								float power = DeGamma( sampleLightmap2.w );
								samplePower2.y = sampleSpecular2.w;
								samplePower2.w = sampleDiffuse2.w;
								sampleSpecular2.w = cover;
								sampleLightmap2.w = power;
							};
							float lerpFactor = 0.0;
							{
								float triStart = 0.5 - 0.25 / 2.0;
								lerpFactor = saturate( ( trilinearFraction - triStart ) * ( 1.0 / 0.25 ) );
							};
							sampleSpecular2 = mix( sampleSpecular2, sampleSpecular2, lerpFactor );
							sampleDiffuse2 = mix( sampleDiffuse2, sampleDiffuse2, lerpFactor );
							sampleNormal2 = mix( sampleNormal2, samplePower2, lerpFactor );
							sampleLightmap2 = mix( sampleLightmap2, sampleLightmap2, lerpFactor );
							sampleColorMask2 = mix( sampleColorMask2, sampleColorMask2, lerpFactor );
						}
					} else
					{
						{
							vec4 virtCoordsLod = vec4( texCoords.xy.x, texCoords.xy.y, 0, sampleLOD - 0.5 );
							vec2 physPage = tex2Dlod( samp_vmtrpagetablemap, virtCoordsLod ).xy;
							vec4 xform = tex2D( samp_vmtrphysicalmappingsmap, physPage );
							physCoords.x = texCoords.xy.x * xform.x + xform.z;
							physCoords.y = texCoords.xy.y * ( xform.x * _fa_freqLow[3 ].x ) + xform.w;
							physCoords.z = xform.y;
						};
						{
							vec2 dx = dFdx( texCoordsLOD.xy ) * physCoords.z;
							vec2 dy = dFdy( texCoordsLOD.xy ) * physCoords.z;
							sampleDiffuse2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 0.0, physCoords.xy, dx, dy );
							sampleSpecular2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 1.0, physCoords.xy, dx, dy );
							sampleLightmap2 = texPhysArray( samp_vmtrphysicalpagesmaparray0, 2.0, physCoords.xy, dx, dy );
							sampleColorMask2 = texPhys( samp_vmtrphysicalpagesmap3, physCoords.xy, dx, dy );
							sampleNormal2 = vec4( 0.0 );
							float cover = sampleLightmap2.z;
							float power = DeGamma( sampleLightmap2.w );
							sampleNormal2.y = sampleSpecular2.w;
							sampleNormal2.w = sampleDiffuse2.w;
							sampleSpecular2.w = cover;
							sampleLightmap2.w = power;
						};
					}
				};
			};
			inputs.normalSSS = sampleNormal2.wyz;
			inputs.maskSSS = saturate( sampleLightmap.y * _fa_freqHigh[5 ].x );
			inputs.thickness = _fa_freqHigh[6 ].x > 0 ? sampleSpecular.x : 0.0;
			sampleSpecular.xyz = _fa_freqHigh[6 ].x > 0 ? vec3( sampleSpecular.y ) : sampleSpecular.xyz;
			inputs.ssdoDiffuseMul = saturate( ( 1.0 - inputs.maskSSS ) * _fa_freqHigh[7 ].x );
			inputs.emissive = vec3( _fa_freqHigh[8 ].x * sampleLightmap.x * sampleLightmap.x * _fa_freqHigh[9 ].x ) * _fa_freqHigh[10 ].xyz * _fa_freqHigh[11 ].xyz;
			inputs.albedo = sampleDiffuse.xyz;
			inputs.specular = sampleSpecular.xyz;
			inputs.colorMask.xyz= sampleColorMask.xyz;
			inputs.lightmap.xyz = sampleLightmap.xyz;
			inputs.smoothness = sampleLightmap.w;
			inputs.normal = sampleNormal.wyz;
			{
				{
					vec4 woundMap = tex2D( samp_woundtexture, vofi_TexCoord7.xy );
					woundMap.xyz -= vec3( 0.5 );
					{
						float woundMask = saturate( ( ( 1.0 - saturate( vofi_TexCoord6.x * 0.5 ) ) - ( 1.0 - woundMap.w ) ) * 3.0 );
						vec3 diffuseBloodLerp = mix( inputs.albedo.xyz.xyz, _fa_freqHigh[12 ].xyz, vec3( woundMask ) );
						inputs.albedo.xyz.xyz *= mix( vec3( 1.0 ), _fa_freqHigh[13 ].xyz, vec3( woundMask ) );
						inputs.albedo.xyz.xyz = mix( inputs.albedo.xyz.xyz, diffuseBloodLerp, vec3( 0.5 ) );
						inputs.specular.xyz = mix( inputs.specular.xyz, vec3( 0.02 ), woundMask );
						inputs.smoothness = mix( inputs.smoothness, 0.65, woundMask );
						inputs.normal.xy += mix( woundMap.xy * vec2( woundMask ), vec2( 0.0 ), vec2( _fa_freqHigh[13 ].w ) );
					};
				};
			};
			{
				uint skipStaticModel = _fa_freqHigh[14 ].x > 0 ? ( 1 << 3 ) : 0;
				uint clusterOffset;
				{
					{
						float NUM_CLUSTERS_X = 16;
						float NUM_CLUSTERS_Y = 8;
						float NUM_CLUSTERS_Z = 24;
						vec3 clusterCoordinate;
						clusterCoordinate.xy = screenPosToTexcoord( inputs.fragCoord.xy, _fa_freqHigh[3 ] ) * _fa_freqLow[4 ].zw;
						clusterCoordinate.xy = floor( clusterCoordinate.xy * vec2( NUM_CLUSTERS_X, NUM_CLUSTERS_Y ) );
						float curr_z = GetLinearDepth( inputs.fragCoord.z, _fa_freqLow[5 ], 1.0, false );
						float slice = log2( max( 1.0, curr_z / _fa_freqLow[6 ].z ) ) * _fa_freqLow[6 ].w;
						clusterCoordinate.z = min( NUM_CLUSTERS_Z - 1, floor( slice ) );
						clusterOffset = uint( clusterCoordinate.x + clusterCoordinate.y * NUM_CLUSTERS_X + clusterCoordinate.z * NUM_CLUSTERS_X * NUM_CLUSTERS_Y );
					}
				};
				{
					{
						inputs.albedo_packed = packR10G10B10( inputs.albedo.xyz );
						inputs.specular_packed = packR10G10B10( inputs.specular.xyz );
						uint lightsMin = 0;
						uint lightsMax = 0;
						uint decalsMin = 0;
						uint decalsMax = 0;
						uint probesMin = 0;
						uint probesMax = 0;
						{
							{
								int MAX_LIGHTS_PER_CLUSTER = 256;
								clusternumlights_t cluster = clusternumlights[ clusterOffset ];
								int dataOffset = cluster.offset & ( ~ ( cluster.offset >> 31 ) );
								int numItems = cluster.numItems & ( ~ ( cluster.numItems >> 31 ) );
								lightsMin = ( dataOffset >> 16 ) * MAX_LIGHTS_PER_CLUSTER;
								lightsMax = lightsMin + ( ( numItems ) & 0x000000FF );
								decalsMin = lightsMin;
								decalsMax = decalsMin + ( ( ( numItems ) >> 8 ) & 0x000000FF );
								probesMin = lightsMin;
								probesMax = probesMin + ( ( ( numItems ) >> 16 ) & 0x000000FF );
							}
						};
						bool isFrontFacing = true;
						inputs.normalTS = ReconstructNormal( inputs.normal.xyz, isFrontFacing );
						inputs.normal = GetWorldSpaceNormal( inputs.normal, inputs.invTS, isFrontFacing );
						inputs.normalSSS = GetWorldSpaceNormal( inputs.normalSSS, inputs.invTS, isFrontFacing );
						vec3 ambient = vec3( 0 );
						{
							vec3 shc0 = vec3( vofi_TexCoord8.x, vofi_TexCoord8.y, vofi_TexCoord8.z );
							vec3 shc1 = vec3( vofi_TexCoord8.w, vofi_TexCoord9.x, vofi_TexCoord9.y );
							vec3 shc2 = vec3( vofi_TexCoord9.z, vofi_TexCoord9.w, vofi_TexCoord10.x );
							vec3 shc3 = vec3( vofi_TexCoord10.y, vofi_TexCoord10.z, vofi_TexCoord10.w );
							vec3 indirectDiffuse = ( ( shc0 - inputs.normal.y * shc1 ) + inputs.normal.z * shc2 ) - inputs.normal.x * shc3;
							ambient.xyz += max ( indirectDiffuse.xyz * vec3( 1 ) * saturate( _fa_freqLow[7 ].x ), vec3( 0 ) );
						};
						vec3 ambientSSS = vec3( 0 );
						{
							vec3 shc0 = vec3( vofi_TexCoord8.x, vofi_TexCoord8.y, vofi_TexCoord8.z );
							vec3 shc1 = vec3( vofi_TexCoord8.w, vofi_TexCoord9.x, vofi_TexCoord9.y );
							vec3 shc2 = vec3( vofi_TexCoord9.z, vofi_TexCoord9.w, vofi_TexCoord10.x );
							vec3 shc3 = vec3( vofi_TexCoord10.y, vofi_TexCoord10.z, vofi_TexCoord10.w );
							vec3 indirectDiffuse = ( ( shc0 - inputs.normalSSS.y * shc1 ) + inputs.normalSSS.z * shc2 ) - inputs.normalSSS.x * shc3;
							ambientSSS.xyz += max ( indirectDiffuse.xyz * vec3( 1 ) * saturate( _fa_freqLow[7 ].x ), vec3( 0 ) );
						};
						ambient = ( mix( ambient, ambientSSS, vec3( inputs.maskSSS ) ) );
						ambient += inputs.emissive;
						inputs.smoothness = dot( inputs.emissive.xyz, vec3( 1 ) ) > 0.0 ? -inputs.smoothness : inputs.smoothness;
						ambient = mix( GetLuma( ambient.xyz ).xxx, ambient.xyz, _fa_freqLow[8 ].www );
						inputs.ambient_lighting = ambient;
						inputs.diffuse_lighting_packed = packRGBE( ambient );
						for ( uint lightIdx = lightsMin; lightIdx < lightsMax; ) {
							uint temp = clusterlightsid[ lightIdx ].x;
							uint divergentLightId = ( ( temp ) & 0x00000FFF );
							uint light_id;
							{
								light_id = divergentLightId; if ( light_id >= divergentLightId ) {
									++lightIdx;
								}
							};
							{ light_t lightParms;
								{
									int lightParms1Size = 4;
									int lightParms2Size = 4;
									int lightParms3Size = 3;
									lightParms.pos = lightparms1[ lightParms1Size * ( light_id ) + 0 ].xyz;
									lightParms.lightParms = asuint( lightparms1[ lightParms1Size * ( light_id ) + 0 ].w );
									lightParms.posShadow = lightparms1[ lightParms1Size * ( light_id ) + 1 ];
									lightParms.falloffR = lightparms1[ lightParms1Size * ( light_id ) + 2 ];
									lightParms.projS = lightparms2[ lightParms2Size * ( light_id ) + 0 ];
									lightParms.projT = lightparms2[ lightParms2Size * ( light_id ) + 1 ];
									lightParms.projQ = lightparms2[ lightParms2Size * ( light_id ) + 2 ];
									lightParms.scaleBias.x = asuint( lightparms1[ lightParms1Size * ( light_id ) + 3 ].x );
									lightParms.scaleBias.y = asuint( lightparms1[ lightParms1Size * ( light_id ) + 3 ].y );
									lightParms.scaleBias.z = asuint( lightparms1[ lightParms1Size * ( light_id ) + 3 ].z );
									lightParms.scaleBias.w = asuint( lightparms1[ lightParms1Size * ( light_id ) + 3 ].w );
									lightParms.boxMin = lightparms3[ lightParms3Size * ( light_id ) + 0 ];
									lightParms.boxMax = lightparms3[ lightParms3Size * ( light_id ) + 1 ];
									lightParms.areaPlane = lightparms3[ lightParms3Size * ( light_id ) + 2 ];
									lightParms.lightParms2 = asuint( lightparms2[ lightParms2Size * ( light_id ) + 3 ].x );
									lightParms.colorPacked = asuint( lightparms2[ lightParms2Size * ( light_id ) + 3 ].y );
									lightParms.specMultiplier = lightparms2[ lightParms2Size * ( light_id ) + 3 ].z;
									lightParms.shadowBleedReduce = lightparms2[ lightParms2Size * ( light_id ) + 3 ].w;
								};
								float clip_min = 1.0 / 255.0;
								vec3 projTC = vec3( ( inputs.position.x * lightParms.projS.x + ( inputs.position.y * lightParms.projS.y + ( inputs.position.z * lightParms.projS.z + lightParms.projS.w ) ) ),
								( inputs.position.x * lightParms.projT.x + ( inputs.position.y * lightParms.projT.y + ( inputs.position.z * lightParms.projT.z + lightParms.projT.w ) ) ),
								( inputs.position.x * lightParms.projQ.x + ( inputs.position.y * lightParms.projQ.y + ( inputs.position.z * lightParms.projQ.z + lightParms.projQ.w ) ) ) );
								projTC.xy /= projTC.z;
								projTC.z = inputs.position.x * lightParms.falloffR.x + ( inputs.position.y * lightParms.falloffR.y + ( inputs.position.z * lightParms.falloffR.z + lightParms.falloffR.w ) );
								uint light_parms = lightParms.lightParms;
								uint light_flags = skipStaticModel;
								light_flags |= uint( ( 1 << 6 ) ); if ( fmin3( projTC.x, projTC.y, projTC.z ) <= clip_min || fmax3( projTC.x, projTC.y, projTC.z ) >= 1.0 - clip_min || ( light_parms & light_flags ) != 0 ) {
									continue;
								}
								vec3 light_position = lightParms.pos;
								{
									vec3 light_vector = ( light_position.xyz - inputs.position.xyz );
									float NdotL = saturate( dot( inputs.normal.xyz, light_vector.xyz ) );
								}
								float light_attenuation;
								{
									vec4 falloffScaleBias = unpackR15G15B15A15( lightParms.scaleBias.xy );
									vec4 projFilterScaleBias = unpackR15G15B15A15( lightParms.scaleBias.zw );
									float projFilter = tex2Dlod( samp_lightsatlasmap, vec4( projTC.xy * projFilterScaleBias.xy + projFilterScaleBias.zw, 0, 0 ) ).x;
									float falloff = tex2Dlod( samp_lightsatlasmap, vec4( vec2( projTC.z , 0.5 ) * falloffScaleBias.xy + falloffScaleBias.zw, 0, 0 ) ).x;
									light_attenuation = ( falloff * falloff ) * ( projFilter * projFilter ); if ( light_attenuation <= clip_min / 256.0 ) {
										continue;
									}
								}
								float shadow = 1.0; if ( ( light_parms & ( 1 << 2 ) ) != 0 ) {
									{
										float normal_bias_scale = 0.1;
										vec3 pos = inputs.position.xyz + inputs.normal.xyz * normal_bias_scale;
										uint idx = 0; if ( ( light_parms & ( ( 0 << 0 ) | ( 1 << 0 ) | ( 2 << 0 ) | ( 3 << 0 ) ) ) == ( 0 << 0 ) ) {
											vec3 light_dir = pos - lightParms.posShadow.xyz;
											idx = getCubeMapFaceID( light_dir.x, light_dir.y, light_dir.z );
										} else if ( ( light_parms & ( ( 0 << 0 ) | ( 1 << 0 ) | ( 2 << 0 ) | ( 3 << 0 ) ) ) == ( 2 << 0 ) ) {
											float border = 1.0; shadowparms_t shadow_parms;
											{
												int shadowParmSize = 5;
												shadow_parms.shadowLightS = shadowsparmsubo[ shadowParmSize * ( (light_parms >> 22 ) ) + 0 ];
												shadow_parms.shadowLightT = shadowsparmsubo[ shadowParmSize * ( (light_parms >> 22 ) ) + 1 ];
												shadow_parms.shadowLightR = shadowsparmsubo[ shadowParmSize * ( (light_parms >> 22 ) ) + 2 ];
												shadow_parms.shadowLightQ = shadowsparmsubo[ shadowParmSize * ( (light_parms >> 22 ) ) + 3 ];
												shadow_parms.shadowAtlasScaleBias = shadowsparmsubo[ shadowParmSize * ( (light_parms >> 22 ) ) + 4 ];
											};
											vec2 shadowTC = vec2( dot( pos.xyz, shadow_parms.shadowLightS.xyz ) + shadow_parms.shadowLightS.w, dot( pos.xyz, shadow_parms.shadowLightT.xyz ) + shadow_parms.shadowLightT.w );
											shadowTC = abs( shadowTC * 2 - 1 ); if ( shadowTC.x >= border || shadowTC.y >= border )
											{
												idx = 1; shadowparms_t shadow_parms;
												{
													int shadowParmSize = 5;
													shadow_parms.shadowLightS = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + 1 ) + 0 ];
													shadow_parms.shadowLightT = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + 1 ) + 1 ];
													shadow_parms.shadowLightR = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + 1 ) + 2 ];
													shadow_parms.shadowLightQ = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + 1 ) + 3 ];
													shadow_parms.shadowAtlasScaleBias = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + 1 ) + 4 ];
												};
												shadowTC = vec2( dot( pos.xyz, shadow_parms.shadowLightS.xyz ) + shadow_parms.shadowLightS.w, dot( pos.xyz, shadow_parms.shadowLightT.xyz ) + shadow_parms.shadowLightT.w );
												shadowTC = abs( shadowTC * 2 - 1 ); if ( shadowTC.x >= border || shadowTC.y >= border ) {
													idx = 2; shadowparms_t shadow_parms;
													{
														int shadowParmSize = 5;
														shadow_parms.shadowLightS = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + 2 ) + 0 ];
														shadow_parms.shadowLightT = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + 2 ) + 1 ];
														shadow_parms.shadowLightR = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + 2 ) + 2 ];
														shadow_parms.shadowLightQ = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + 2 ) + 3 ];
														shadow_parms.shadowAtlasScaleBias = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + 2 ) + 4 ];
													};
													shadowTC = vec2( dot( pos.xyz, shadow_parms.shadowLightS.xyz ) + shadow_parms.shadowLightS.w, dot( pos.xyz, shadow_parms.shadowLightT.xyz ) + shadow_parms.shadowLightT.w );
													shadowTC = abs( shadowTC * 2 - 1 );
												}
											}
											float fraction = ( 1.0 - max( shadowTC.x, shadowTC.y ) ) * _fa_freqLow[9 ].w;
											vec2 screenNoise = fract( gl_FragCoord.xy * 0.5 );
											screenNoise.x = fract( screenNoise.x * 0.5 + screenNoise.y );
											idx += screenNoise.x > fraction ? 1 : 0;
										} shadowparms_t shadow_parms;
										{
											int shadowParmSize = 5;
											shadow_parms.shadowLightS = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + idx ) + 0 ];
											shadow_parms.shadowLightT = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + idx ) + 1 ];
											shadow_parms.shadowLightR = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + idx ) + 2 ];
											shadow_parms.shadowLightQ = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + idx ) + 3 ];
											shadow_parms.shadowAtlasScaleBias = shadowsparmsubo[ shadowParmSize * ( ( light_parms >> 22 ) + idx ) + 4 ];
										};
										vec4 shadowTC = vec4( pos.x * shadow_parms.shadowLightS.x + ( pos.y * shadow_parms.shadowLightS.y + ( pos.z * shadow_parms.shadowLightS.z + shadow_parms.shadowLightS.w ) ),
										pos.x * shadow_parms.shadowLightT.x + ( pos.y * shadow_parms.shadowLightT.y + ( pos.z * shadow_parms.shadowLightT.z + shadow_parms.shadowLightT.w ) ),
										pos.x * shadow_parms.shadowLightR.x + ( pos.y * shadow_parms.shadowLightR.y + ( pos.z * shadow_parms.shadowLightR.z + shadow_parms.shadowLightR.w ) ),
										pos.x * shadow_parms.shadowLightQ.x + ( pos.y * shadow_parms.shadowLightQ.y + ( pos.z * shadow_parms.shadowLightQ.z + shadow_parms.shadowLightQ.w ) ) );
										shadowTC.xyz = shadowTC.xyz / shadowTC.w; if ( shadowTC.x > 0.0 && shadowTC.x < 1.0 && shadowTC.y > 0. && shadowTC.y < 1.) {
											shadowTC.xy = shadowTC.xy * shadow_parms.shadowAtlasScaleBias.xy + shadow_parms.shadowAtlasScaleBias.zw;
											{
												{
													if ( false ) {
														shadow = shadow2Ddepth( samp_shadowatlasdepthcomparemap, shadowTC.xyz );
													}
													else {
														vec2 uv = shadowTC.xy * _fa_freqLow[10 ].xy;
														vec2 shadowMapSizeInv = _fa_freqLow[10 ].zw;
														vec2 base_uv = vec2( floor(uv.x + 0.5), floor(uv.y + 0.5) );
														float s = ( uv.x + 0.5 - base_uv.x );
														float t = ( uv.y + 0.5 - base_uv.y );
														base_uv -= vec2(0.5, 0.5);
														base_uv *= shadowMapSizeInv;
														float uw0 = (4.0 - 3.0 * s) ;
														float uw1 = 7.0;
														float uw2 = (1.0 + 3.0 * s);
														float u0 = ((3.0 - 2.0 * s) / uw0 - 2.0) ;
														float u1 = ((3.0 + s) / uw1 );
														float u2 = (s / uw2 + 2.0);
														{
															float vw0 = ((4.0 - 3.0 * t));
															float v0 = ((3.0 - 2.0 * t) / vw0 - 2.0);
															float s0 = uw0 * vw0 * shadow2Ddepth( samp_shadowatlasdepthcomparemap, vec3( (base_uv + vec2( u0, v0 ) * shadowMapSizeInv), shadowTC.z ) );
															float s1 = uw1 * vw0 * shadow2Ddepth( samp_shadowatlasdepthcomparemap, vec3( (base_uv + vec2( u1, v0 ) * shadowMapSizeInv), shadowTC.z ) );
															float s2 = uw2 * vw0 * shadow2Ddepth( samp_shadowatlasdepthcomparemap, vec3( (base_uv + vec2( u2, v0 ) * shadowMapSizeInv), shadowTC.z ) );
															shadow = s0 + s1 + s2;
														}
														{
															float vw1 = 7.0;
															float v1 = ((3.0 + t) / vw1);
															float s0 = uw0 * vw1 * shadow2Ddepth( samp_shadowatlasdepthcomparemap, vec3( (base_uv + vec2( u0, v1 ) * shadowMapSizeInv), shadowTC.z ) );
															float s1 = uw1 * vw1 * shadow2Ddepth( samp_shadowatlasdepthcomparemap, vec3( (base_uv + vec2( u1, v1 ) * shadowMapSizeInv), shadowTC.z ) );
															float s2 = uw2 * vw1 * shadow2Ddepth( samp_shadowatlasdepthcomparemap, vec3( (base_uv + vec2( u2, v1 ) * shadowMapSizeInv), shadowTC.z ) );
															shadow += s0 + s1 + s2;
														}
														{
															float vw2 = (1.0 + 3.0 * t);
															float v2 = (t / vw2 + 2.0);
															float s0 = uw0 * vw2 * shadow2Ddepth( samp_shadowatlasdepthcomparemap, vec3( (base_uv + vec2( u0, v2 ) * shadowMapSizeInv), shadowTC.z ) );
															float s1 = uw1 * vw2 * shadow2Ddepth( samp_shadowatlasdepthcomparemap, vec3( (base_uv + vec2( u1, v2 ) * shadowMapSizeInv), shadowTC.z ) );
															float s2 = uw2 * vw2 * shadow2Ddepth( samp_shadowatlasdepthcomparemap, vec3( (base_uv + vec2( u2, v2 ) * shadowMapSizeInv), shadowTC.z ) );
															shadow += s0 + s1 + s2;
														}
														shadow /= 144.0;
													}
												}
											};
										} else {
											shadow = ( light_parms & ( ( 0 << 0 ) | ( 1 << 0 ) | ( 2 << 0 ) | ( 3 << 0 ) ) ) == ( 2 << 0 ) ? 1.0 : 0.0;
										}
									};
									float shadow_fade = float( ( light_parms >> 16 ) & 0x3F ) / 63.0;
									shadow = saturate( shadow * shadow_fade + 1.0 - shadow_fade );
								}
								vec3 light_color = unpackRGBE( lightParms.colorPacked ) * shadow * light_attenuation;
								float light_spec_multiplier = lightParms.specMultiplier; if ( (light_parms & ( ( 1 << 4 ) | ( 2 << 4 ) | ( 3 << 4 ) ) ) != 0 ) {
									vec4 areaLightPlane = lightParms.areaPlane;
									vec4 areaLightPlaneU = lightParms.boxMin;
									vec4 areaLightPlaneV = lightParms.boxMax;
									float projToOrigin = dot(inputs.position, areaLightPlane.xyz) + areaLightPlane.w; if(projToOrigin<0) {
										continue;
									}
									float falloffDistance = length(areaLightPlane.xyz);
									float falloff = saturate(projToOrigin);
									light_color *= falloff*falloff;
									projToOrigin /= falloffDistance;
									areaLightPlane /= falloffDistance;
									vec3 mirrorDir = reflect(-inputs.view, inputs.normal); if( dot(mirrorDir, areaLightPlane.xyz) > 0) {
										mirrorDir = reflect(mirrorDir, areaLightPlane.xyz);
									}
									float projToPlane = dot(mirrorDir, areaLightPlane.xyz);
									float projLength = projToOrigin / projToPlane;
									vec3 hitPos = inputs.position - mirrorDir * projLength;
									vec3 hitDir = hitPos - light_position;
									float u = dot(hitDir, areaLightPlaneU.xyz);
									float v = dot(hitDir, areaLightPlaneV.xyz);
									float lenCircle = length(vec2(u,v));
									float lenRect = max(abs(u),abs(v));
									float len = (light_parms & ( ( 1 << 4 ) | ( 2 << 4 ) | ( 3 << 4 ) ) ) == ( 2 << 4 ) ? lenCircle : lenRect;
									if ( (light_parms & ( ( 1 << 4 ) | ( 2 << 4 ) | ( 3 << 4 ) ) ) == ( 3 << 4 ) ) {
										projTC.xy = saturate( vec2( u, v ) );
									}
									len = min(1., len)/len;
									u *= len * areaLightPlaneU.w;
									v *= len * areaLightPlaneV.w;
									hitDir = areaLightPlaneU.xyz * u + areaLightPlaneV.xyz * v;
									light_position += hitDir;
								}
								vec3 light_color_final = light_color;
								light_color_final = mix( GetLuma( light_color_final.xyz ).xxx, light_color_final.xyz, _fa_freqLow[8 ].www );
								{
									vec3 light_vector = normalize( light_position.xyz - inputs.position.xyz );
									float NdotL = saturate( dot( inputs.normal.xyz, light_vector.xyz ) );
									vec3 spec = specBRDF( inputs.normal, inputs.view, light_vector, unpackR10G10B10( inputs.specular_packed ), abs( inputs.smoothness ) );
									inputs.specular_lighting_packed = packRGBE( spec.xyz * light_spec_multiplier * light_color_final * NdotL + unpackRGBE( inputs.specular_lighting_packed ) );
									vec3 diffuse_light_color = ( light_parms & ( 1 << 8 ) ) > 0 ? vec3( 0 ) : light_color_final;
									vec3 normalR = mix( inputs.normal, inputs.normalSSS, _fa_freqHigh[15 ].xxx );
									vec3 normalG = mix( inputs.normal, inputs.normalSSS, _fa_freqHigh[15 ].yyy );
									vec3 normalB = mix( inputs.normal, inputs.normalSSS, _fa_freqHigh[15 ].zzz );
									vec3 bssrdf = saturate( vec3( dot( normalR, light_vector ), dot( normalG, light_vector ), dot( normalB, light_vector ) ) );
									bssrdf += saturate( _fa_freqHigh[16 ].xyz * ( pow( saturate( dot( inputs.view.xyz, -light_vector.xyz ) ), _fa_freqHigh[16 ].w ) ) * inputs.thickness );
									bssrdf = mix( NdotL.xxx, bssrdf, inputs.maskSSS.xxx );
									inputs.diffuse_lighting_packed = packRGBE( diffuse_light_color * bssrdf + unpackRGBE( inputs.diffuse_lighting_packed ) );
								};
							};
						}
						inputs.diffuse_lighting = unpackRGBE( inputs.diffuse_lighting_packed ) * unpackR10G10B10( inputs.albedo_packed );
						inputs.specular_lighting = unpackRGBE( inputs.specular_lighting_packed );
						inputs.output_lighting = inputs.diffuse_lighting + inputs.specular_lighting;
					};
				}
			} ;
			{
				{ if ( _fa_freqHigh[17 ].x > 0 ) {
						vec2 resolution = abs( vec2( 1.0, 1.0 ) / _fa_freqHigh[18 ].zw );
						vec2 screenTexCoord = screenPosToTexcoord( gl_FragCoord.xy*1.5, _fa_freqHigh[3 ] ) * ( resolution / 32.0 );
						vec4 dither = tex2Dlod( samp_echodithermap, vec4( screenTexCoord * vec2( 0.7 ), 0.0, 0.0 ) );
						float fresnel = 1.0 - dot( inputs.normal.xyz, normalize( -vofi_TexCoord4.xyz ) );
						float magnitude = 1.0;
						float pulsefrequency = _fa_freqHigh[19 ].x; if ( _fa_freqHigh[17 ].y >= _fa_freqHigh[19 ].z ) {
							pulsefrequency = _fa_freqHigh[19 ].y;
						}
						float width = mix( _fa_freqHigh[20 ].x, _fa_freqHigh[20 ].y, _fa_freqHigh[17 ].y );
						float zValue = ( vofi_TexCoord4.xyz.z ) * width;
						float pulse = sin( zValue + _fa_freqLow[11 ].x * pulsefrequency ) * magnitude + magnitude;
						float power = _fa_freqHigh[20 ].z;
						pulse = pow( pulse, power );
						pulse *= fresnel;
						float edgeGlow = pow( fresnel, 4.0 );
						vec3 finalPulse = saturate( dither.x * ( fresnel ) + edgeGlow ) * _fa_freqHigh[21 ].xyz * 2.0;
						finalPulse /= _fa_freqHigh[22 ].xyz;
						vec3 finalPulseColor = finalPulse * pulse;
						float saturation = ( _fa_freqLow[12 ].x == 0 ) ? 1.0 : 0.7;
						float blendScale = ( _fa_freqLow[12 ].x == 0 ) ? 1.0 : 0.5;
						inputs.diffuse_lighting.xyz.xyz.xyz += max( vec3( 0 ) , mix( GetLuma( finalPulseColor ).xxx, finalPulseColor, saturation.xxx ) ) * blendScale;
					}
				};
				{ if ( _fa_freqHigh[23 ].w > 0.0 ) {
						vec4 noise = tex2Dlod( samp_magnificationclouds, vec4( vofi_TexCoord0.xy * vec2( 7.0 ) + vec2( 0.0, _fa_freqLow[11 ].x * 3.0 ), 0.0, 0.0 ) );
						noise = DeGamma( noise );
						float fade = 1.0 - _fa_freqHigh[23 ].w * _fa_freqHigh[23 ].w;
						inputs.diffuse_lighting.xyz.xyz.xyz += mix( inputs.diffuse_lighting.xyz.xyz.xyz, _fa_freqHigh[23 ].xyz * noise.z * noise.z * 20.0, _fa_freqHigh[23 ].w );
					}
				};
				{ if ( _fa_freqHigh[24 ].w > 0 ) {
						vec2 resolution = abs( vec2( 1.0, 1.0 ) / _fa_freqHigh[18 ].zw );
						vec2 screenTexCoord = screenPosToTexcoord( gl_FragCoord.xy*1.5, _fa_freqHigh[3 ] ) * ( resolution / 32.0 );
						vec4 clouds = tex2Dlod( samp_magnificationclouds, vec4( screenTexCoord * vec2( 0.02, 0.01 ) + vec2( 0.0, _fa_freqLow[11 ].x * 2.0 * _fa_freqHigh[24 ].w ), 0.0, 0.0 ) );
						vec4 clouds2 = tex2Dlod( samp_magnificationclouds, vec4( screenTexCoord * vec2( 0.01, 0.01 ) + vec2( 0.0, _fa_freqLow[11 ].x * 3.0 * _fa_freqHigh[24 ].w ), 0.0, 0.0 ) );
						clouds.xyz *= clouds.xyz * clouds.xyz;
						clouds2.xyz *= clouds2.xyz * clouds2.xyz;
						float fresnel = 1.0 - dot( inputs.normal.xyz, normalize( -vofi_TexCoord4.xyz ) );
						float inverse = 1.0 - fresnel;
						float width = mix( _fa_freqHigh[20 ].x, _fa_freqHigh[20 ].y, _fa_freqHigh[17 ].y );
						float zValue = ( vofi_TexCoord4.xyz.z + _fa_freqLow[0 ].z ) * width;
						fresnel *= fresnel * fresnel * fresnel;
						vec3 finalPulse = ( clouds2.xxx * vec3( inverse * inverse * inverse ) * _fa_freqHigh[24 ].xyz ) * 3.0;
						finalPulse += saturate( clouds.xxx * vec3( fresnel ) ) * _fa_freqHigh[24 ].xyz * 3.0;
						inputs.diffuse_lighting.xyz.xyz.xyz += finalPulse;
					}
				};
				float intensity = inputs.lightmap.x * inputs.lightmap.x;
				float timeInterval = _fa_freqHigh[25 ].x;
				float power = _fa_freqHigh[25 ].y;
				float scale = step( 0.001, intensity ) * max( 0.0, power * ( timeInterval + ( intensity - 1 ) ) );
				inputs.diffuse_lighting.xyz.xyz += vec3( _fa_freqHigh[8 ].x * scale ) * _fa_freqHigh[11 ].xyz;
				{ if ( _fa_freqHigh[26 ].x < 1.0 ) {
						vec2 texcoord = gl_FragCoord.xy * ( 0.00390625 );
						float dither = tex2Dlod( samp_magnificationclouds, vec4( vofi_TexCoord0.xy * _fa_freqHigh[27 ].xy, 0.0, 0.0 ) ).x;
						dither = saturate( abs( clamp( _fa_freqHigh[26 ].x - dither * 0.5 - 0.1, -1.0, 0.0 ) ) );
						dither *= 600.0;
						inputs.diffuse_lighting.xyz.xyz += vec3( dither ) * vec3( 1.0, 0.01, 0.0 );
					}
				};
			};
			{
				out_FragColor0.xyz = inputs.diffuse_lighting.xyz + inputs.specular_lighting.xyz;
				out_FragColor1.xy = NormalOctEncode( inputs.normal.xyz, false );
				out_FragColor2 = vec4( fastSqrtNR0( inputs.specular.x ), fastSqrtNR0( inputs.specular.y ), fastSqrtNR0( inputs.specular.z ), SmoothnessEncode( inputs.smoothness ) );
			};
			out_FragColor0.xyz += _fa_freqLow[13 ].xyz;
		};
	}
}