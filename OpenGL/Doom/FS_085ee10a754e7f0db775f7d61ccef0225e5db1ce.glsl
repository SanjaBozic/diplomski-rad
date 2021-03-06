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

uniform vec4 _fa_freqHigh [5];
uniform vec4 _fa_freqLow [20];
uniform decalparms1_ubo { vec4 decalparms1[4096]; };
uniform decalparms2_ubo { vec4 decalparms2[4096]; };
uniform decalparms3_ubo { vec4 decalparms3[4096]; };
uniform lightparms1_ubo { vec4 lightparms1[4096]; };
uniform lightparms2_ubo { vec4 lightparms2[4096]; };
uniform lightparms3_ubo { vec4 lightparms3[4096]; };
uniform shadowsparmsubo_ubo { vec4 shadowsparmsubo[4095]; };
uniform sampler2D samp_viewdepthmap;
uniform sampler2D samp_sparediffusemap;
uniform sampler2D samp_sparebumpmap;
uniform sampler2D samp_sparepowermap;
uniform sampler2D samp_decalsatlasmap;
uniform samplerCubeArray samp_envprobesmaparray;
uniform sampler2D samp_lightsatlasmap;
uniform sampler2DShadow samp_shadowatlasdepthcomparemap;
uniform sampler2D samp_scenemip0;
uniform sampler2D samp_scenemip1;
uniform sampler2D samp_scenemip2;
uniform sampler2D samp_scenemip3;
uniform sampler2D samp_scenemip4;
struct clusternumlights_t {
	int offset ;
	int numItems ;
};
struct decal_t {
	vec4 projS ;
	vec4 projT ;
	vec4 projR ;
	uvec2 albedoScaleBias ;
	uvec2 specScaleBias ;
	uvec2 normalScaleBias ;
	uint opacity ;
	uint decalParms ;
	uint albedo ;
	uint emissive ;
	uint specOverride ;
	uint decalParms2 ;
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

in vec4 vofi_TexCoord0;
in vec4 vofi_TexCoord4;
in vec4 vofi_TexCoord1;
in vec4 vofi_TexCoord2;
in vec4 vofi_TexCoord3;
in vec4 vofi_TexCoord8;
in vec4 vofi_TexCoord9;
in vec4 vofi_TexCoord10;
in vec4 vofi_TexCoord5;
in vec4 gl_FragCoord;

out vec4 out_FragColor0;

float dot3 ( vec3 a, vec3 b ) { return dot( a, b ); }
float dot3 ( vec3 a, vec4 b ) { return dot( a, b.xyz ); }
float dot3 ( vec4 a, vec3 b ) { return dot( a.xyz, b ); }
float dot3 ( vec4 a, vec4 b ) { return dot( a.xyz, b.xyz ); }
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
vec4 MatrixMul ( vec3 pos, mat4x4 mat ) {
	return vec4( ( pos.x * mat[0].x + ( pos.y * mat[0].y + ( pos.z * mat[0].z + mat[0].w ) ) ),
	( pos.x * mat[1].x + ( pos.y * mat[1].y + ( pos.z * mat[1].z + mat[1].w ) ) ),
	( pos.x * mat[2].x + ( pos.y * mat[2].y + ( pos.z * mat[2].z + mat[2].w ) ) ),
	( pos.x * mat[3].x + ( pos.y * mat[3].y + ( pos.z * mat[3].z + mat[3].w ) ) ) );
}
vec3 MatrixMul ( vec3 pos, mat3x4 mat ) {
	return vec3( ( pos.x * mat[0].x + ( pos.y * mat[0].y + ( pos.z * mat[0].z + mat[0].w ) ) ),
	( pos.x * mat[1].x + ( pos.y * mat[1].y + ( pos.z * mat[1].z + mat[1].w ) ) ),
	( pos.x * mat[2].x + ( pos.y * mat[2].y + ( pos.z * mat[2].z + mat[2].w ) ) ) );
}
vec4 MatrixMul ( vec3 pos, vec4 matX, vec4 matY, vec4 matZ, vec4 matW ) {
	return vec4( ( pos.x * matX.x + ( pos.y * matX.y + ( pos.z * matX.z + matX.w ) ) ),
	( pos.x * matY.x + ( pos.y * matY.y + ( pos.z * matY.z + matY.w ) ) ),
	( pos.x * matZ.x + ( pos.y * matZ.y + ( pos.z * matZ.z + matZ.w ) ) ),
	( pos.x * matW.x + ( pos.y * matW.y + ( pos.z * matW.z + matW.w ) ) ) );
}
vec3 MatrixMul ( vec3 pos, vec4 matX, vec4 matY, vec4 matZ ) {
	return vec3( ( pos.x * matX.x + ( pos.y * matX.y + ( pos.z * matX.z + matX.w ) ) ),
	( pos.x * matY.x + ( pos.y * matY.y + ( pos.z * matY.z + matY.w ) ) ),
	( pos.x * matZ.x + ( pos.y * matZ.y + ( pos.z * matZ.z + matZ.w ) ) ) );
}
vec4 MatrixMul ( mat4x4 m, vec4 v ) {
	return m * v;
}
vec4 MatrixMul ( vec4 v, mat4x4 m ) {
	return v * m;
}
vec3 MatrixMul ( mat3x3 m, vec3 v ) {
	return m * v;
}
vec3 MatrixMul ( vec3 v, mat3x3 m ) {
	return v * m;
}
vec2 MatrixMul ( mat2x2 m, vec2 v ) {
	return m * v;
}
vec2 MatrixMul ( vec2 v, mat2x2 m ) {
	return v * m;
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
vec4 unpackUintR8G8B8A8 ( uint value ) {
	return vec4( ( value >> 24 ) & 0xFF, ( value >> 16 ) & 0xFF, ( value >> 8 ) & 0xFF, value & 0xFF );
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
vec4 tex2DDeGamma ( sampler2D image, vec2 texcoord ) {
	vec4 color = tex2D( image, texcoord );
	color = DeGamma( color );
	return color;
}
vec4 texPhys ( sampler2D image, vec2 texcoord ) { return tex2D( image, texcoord ); }
vec4 texPhys ( sampler2D image, vec2 texcoord, vec2 dx, vec2 dy ) { return tex2D( image, texcoord, dx, dy ); }
float tex2Ddepth ( sampler2D image, vec2 texcoord ) { return tex2Dlod( image, vec4( texcoord, 0.0, 0.0 ) ).x; }
float shadow2Ddepth ( sampler2DShadow image, vec3 texcoord ) { return textureLod( image, texcoord, 0 ).x; }
float GetFragmentDepth ( vec4 fragmentPos ) { return fragmentPos.z; }
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
vec3 environmentBRDF ( float NdotV, float smoothness, vec3 f0 ) {
	const float t1 = 0.095 + smoothness * ( 0.6 + 4.19 * smoothness );
	const float t2 = NdotV + 0.025;
	const float t3 = 9.5 * smoothness * NdotV;
	const float a0 = t1 * t2 * ApproxExp2( 1 - 14 * NdotV );
	const float a1 = 0.4 + 0.6 * (1 - ApproxExp2( -t3 ) );
	return mix( vec3( a0 ), vec3( a1 ), f0.xyz );
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
			inputs.albedo = sampleDiffuse.xyz;
			inputs.specular = sampleSpecular.xyz;
			inputs.colorMask.xyz= sampleColorMask.xyz;
			inputs.lightmap.xyz = sampleLightmap.xyz;
			inputs.smoothness = sampleLightmap.w;
			inputs.normal = sampleNormal.wyz;
			{
				float edge = 1.0;
				{
					float interpolatedDepth = GetFragmentDepth( gl_FragCoord );
					vec2 screenTC = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
					float depth = tex2Ddepth( samp_viewdepthmap, screenTC );
					float dstDepth = 1.0 / ( 1.0 - depth );
					float srcDepth = 1.0 / ( 1.0 - interpolatedDepth );
					edge = saturate( ( dstDepth - srcDepth ) * 0.05 );
				};
				vec2 tc = vofi_TexCoord0.xy * _fa_freqHigh[1 ].xy;
				vec4 albedo = tex2DDeGamma( samp_sparediffusemap, tc );
				vec4 specular = vec4( 0.002 );
				vec4 normal1 = tex2D( samp_sparebumpmap, tc.xy + vec2( _fa_freqLow[1 ].x * _fa_freqHigh[1 ].z, 0.0 ) );
				vec4 normal2 = tex2D( samp_sparebumpmap, tc.xy - vec2( 0.0, _fa_freqLow[1 ].x * _fa_freqHigh[1 ].w ) * vec2( 0.75 ) );
				vec4 finalNormal = normal1 * normal2;
				float smoothness = tex2DDeGamma( samp_sparepowermap, tc ).x;
				smoothness = mix( 1.0, smoothness, edge );
				inputs.albedo = _fa_freqHigh[2 ].xyz * albedo.xyz;
				inputs.alpha = _fa_freqHigh[2 ].w * albedo.w * edge;
				inputs.specular = specular.xyz;
				inputs.smoothness = smoothness;
				inputs.normal = finalNormal.xyz;
			};
			{
				uint skipStaticModel = _fa_freqHigh[3 ].x > 0 ? ( 1 << 3 ) : 0;
				uint clusterOffset;
				{
					{
						float NUM_CLUSTERS_X = 16;
						float NUM_CLUSTERS_Y = 8;
						float NUM_CLUSTERS_Z = 24;
						vec3 clusterCoordinate;
						clusterCoordinate.xy = screenPosToTexcoord( inputs.fragCoord.xy, _fa_freqHigh[4 ] ) * _fa_freqLow[2 ].zw;
						clusterCoordinate.xy = floor( clusterCoordinate.xy * vec2( NUM_CLUSTERS_X, NUM_CLUSTERS_Y ) );
						float curr_z = GetLinearDepth( inputs.fragCoord.z, _fa_freqLow[3 ], 1.0, false );
						float slice = log2( max( 1.0, curr_z / _fa_freqLow[4 ].z ) ) * _fa_freqLow[4 ].w;
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
						{
							vec3 posDDX = dFdx( inputs.position.xyz );
							vec3 posDDY = dFdy( inputs.position.xyz );
							decalsMin = ( skipStaticModel == 0 && _fa_freqHigh[3 ].y == 0.0 ) ? decalsMax : decalsMin;
							for ( uint d = decalsMin; d < decalsMax; ) {
								uint temp = clusterlightsid[ d ].x;
								uint divergentId = ( ( ( temp ) >> 12 ) & 0x00000FFF );
								uint decal_id;
								{
									decal_id = divergentId; if ( decal_id >= divergentId ) {
										++d;
									}
								};
								{ decal_t decal;
									{
										int decalParms1Size = 2;
										int decalParms2Size = 2;
										int decalParms3Size = 2;
										decal.projS = decalparms1[ decalParms1Size * ( decal_id ) + 0 ];
										decal.projT = decalparms1[ decalParms1Size * ( decal_id ) + 1 ];
										decal.projR = decalparms2[ decalParms2Size * ( decal_id ) + 0 ];
										decal.albedoScaleBias.x = asuint( decalparms2[ decalParms2Size * ( decal_id ) + 1 ].x );
										decal.albedoScaleBias.y = asuint( decalparms2[ decalParms2Size * ( decal_id ) + 1 ].y );
										decal.specScaleBias.x = asuint( decalparms2[ decalParms2Size * ( decal_id ) + 1 ].z );
										decal.specScaleBias.y = asuint( decalparms2[ decalParms2Size * ( decal_id ) + 1 ].w );
										decal.normalScaleBias.x = asuint( decalparms3[ decalParms3Size * ( decal_id ) + 0 ].x );
										decal.normalScaleBias.y = asuint( decalparms3[ decalParms3Size * ( decal_id ) + 0 ].y );
										decal.opacity = asuint( decalparms3[ decalParms3Size * ( decal_id ) + 0 ].z );
										decal.decalParms = asuint( decalparms3[ decalParms3Size * ( decal_id ) + 0 ].w );
										decal.albedo = asuint( decalparms3[ decalParms3Size * ( decal_id ) + 1 ].x );
										decal.emissive = asuint( decalparms3[ decalParms3Size * ( decal_id ) + 1 ].y );
										decal.specOverride = asuint( decalparms3[ decalParms3Size * ( decal_id ) + 1 ].z );
										decal.decalParms2 = asuint( decalparms3[ decalParms3Size * ( decal_id ) + 1 ].w );
									};
									vec4 projS = decal.projS;
									vec4 projR = decal.projR;
									vec4 projT = decal.projT;
									vec3 projTC = vec3(
									( inputs.position.x * projS.x + ( inputs.position.y * projS.y + ( inputs.position.z * projS.z + projS.w ) ) ),
									( inputs.position.x * projT.x + ( inputs.position.y * projT.y + ( inputs.position.z * projT.z + projT.w ) ) ),
									( inputs.position.x * projR.x + ( inputs.position.y * projR.y + ( inputs.position.z * projR.z + projR.w ) ) )
									);
									float clip_min = 1.0 / 255.0; if ( fmin3( projTC.x, projTC.y, projTC.z ) <= clip_min || fmax3( projTC.x, projTC.y, projTC.z ) >= 1.0 - clip_min ) {
										continue;
									}
									uint decalParms2 = decal.decalParms2; if ( ( skipStaticModel != 0 && ( decalParms2 & ( 1 << 9 ) ) != 0 ) || ( skipStaticModel == 0 && ( decalParms2 & ( 1 << 10 ) ) != 0 ) ) {
										continue;
									}
									vec2 uvDDX = vec2( dot( posDDX, projS.xyz ), dot( posDDX, projT.xyz ) );
									vec2 uvDDY = vec2( dot( posDDY, projS.xyz ), dot( posDDY, projT.xyz ) );
									float decalAlpha = 1.0;
									vec3 decalNormal = vec3( 0.5, 0.5, 1.0 );
									vec3 decalNormalTS = vec3( 0, 0, 1 );
									uint decalParms = decal.decalParms;
									{
										vec4 normalScaleBias = unpackR15G15B15A15( decal.normalScaleBias.xy );
										vec2 normalUVDDX = uvDDX * normalScaleBias.xy;
										vec2 normalUVDDY = uvDDY * normalScaleBias.xy;
										vec4 temp = texPhys( samp_decalsatlasmap, projTC.xy * normalScaleBias.xy + normalScaleBias.zw, normalUVDDX, normalUVDDY );
										decalNormal = temp.xyz;
										decalAlpha = temp.w;
										decalNormalTS = decalNormal.xyz * 2.0 - vec3( 1.0 ); if ( decalAlpha <= 4 * clip_min ) {
											continue;
										}
										decalNormal.xyz = decalNormalTS;
										decalNormal.xyz = ( ( decalParms2 & ( 1 << 7 ) ) != 0 ) ? vec3(-decalNormal.x,-decalNormal.y,decalNormal.z) : decalNormal.xyz;
									}
									uint packed_albedo = decal.albedo;
									float z_soft_scale = 1.0 + ( unpackUintR8G8B8A8( packed_albedo ).w ) * ( 16.0 / 255.0 );
									float emissive_blending_time = unpackR8G8B8A8( decalParms ).z;
									vec3 decalAlbedo = unpackR8G8B8A8( packed_albedo ).xyz;
									decalAlpha *= saturate( z_soft_scale - z_soft_scale * abs( projTC.z * 2.0 - 1.0 ) );
									float emissiveMask = decalAlpha; if ( ( decalParms & ( 1 << 0 ) ) != 0 ) {
										vec3 albedoTint = decalAlbedo.xyz;
										decalAlbedo = vec3( 0 );
										vec4 albedoScaleBias = unpackR15G15B15A15( decal.albedoScaleBias.xy );
										vec2 albedoUVDDX = uvDDX * albedoScaleBias.xy;
										vec2 albedoUVDDY = uvDDY * albedoScaleBias.xy;
										vec4 temp = texPhys( samp_decalsatlasmap, projTC.xy * albedoScaleBias.xy + albedoScaleBias.zw, albedoUVDDX, albedoUVDDY );
										temp *= temp;
										decalAlbedo = temp.xyz;
										emissiveMask = temp.w;
										decalAlbedo.xyz *= albedoTint.xyz;
									}
									vec3 vertexNormal = normalize( vec3( inputs.invTS[0].z, inputs.invTS[1].z, inputs.invTS[2].z ) );
									float angleWeight = saturate( dot( vertexNormal.xyz, normalize( projR.xyz ) ) ).x;
									{
										uint packed_emissive = decal.emissive;
										vec4 emissive_parms = unpackR8G8B8A8( packed_emissive );
										inputs.emissive.xyz += angleWeight * decalAlbedo.xyz * (( emissive_parms.xyz * ( emissiveMask * emissive_parms.w * 16.0 ) ) * emissive_blending_time);
									}
									uint specOverride = decal.specOverride;
									vec4 decalSpecular = unpackR8G8B8A8( specOverride ); if ( ( decalParms & ( 1 << 1 ) ) != 0 ) {
										vec4 specScaleBias = unpackR15G15B15A15( decal.specScaleBias.xy );
										vec2 specUVDDX = uvDDX * specScaleBias.xy;
										vec2 specUVDDY = uvDDY * specScaleBias.xy;
										decalSpecular = texPhys( samp_decalsatlasmap, projTC.xy * specScaleBias.xy + specScaleBias.zw, specUVDDX, specUVDDY );
										decalSpecular *= decalSpecular;
									} if ( ( decalParms & ( 1 << 5 ) ) != 0 ) {
										float blending_time = unpackR8G8B8A8( decalParms ).x;
										float threshold_softness = unpackUintR8G8B8A8( decalParms ).y;
										float center_attenuation = saturate( dot( projTC.xy + decalNormalTS.xy - 0.5 , projTC.xy + decalNormalTS.xy - 0.5) );
										float threshold_alpha = fastSqrtNR0( saturate( threshold_softness * ( blending_time - center_attenuation ) ) );
										decalAlpha = min( decalAlpha, threshold_alpha );
									}
									float alpha_mask = decalAlpha * angleWeight;
									uint packed_opacity = decal.opacity;
									vec4 opacity = unpackR8G8B8A8( packed_opacity ) * alpha_mask;
									inputs.alpha = max( inputs.alpha, opacity.x );
									inputs.albedo_packed = packR10G10B10( mix( unpackR10G10B10( inputs.albedo_packed ), decalAlbedo.xyz, opacity.xxx ) );
									inputs.specular_packed = packR10G10B10( mix( unpackR10G10B10( inputs.specular_packed ), decalSpecular.xyz, opacity.yyy ) );
									{
										{
											vec3 projNormal = vertexNormal;
											projS.xyz += projNormal * dot( projS.xyz, projNormal );
											projT.xyz += projNormal * dot( projT.xyz, projNormal );
											decalNormal = decalNormal.x * normalize( projS.xyz ) + decalNormal.y * normalize( projT.xyz ) + decalNormal.z * projNormal;
										} if ( ( decalParms2 & ( 1 << 8 ) ) != 0 ) {
											vec3 decalBlend = mix( vertexNormal, decalNormal.xyz, opacity.www );
											float normalProj = dot( decalBlend, vertexNormal );
											decalNormal.xyz = ( inputs.normal * normalProj ) + ( decalBlend - normalProj * vertexNormal ) * dot( inputs.normal, vertexNormal );
										} else if ( ( decalParms2 & ( 1 << 6 ) ) != 0 ) {
											decalNormal.xyz = mix( mix( inputs.normal.xyz, vertexNormal, alpha_mask ), decalNormal.xyz, opacity.www );
										} else {
											decalNormal.xyz = mix( inputs.normal.xyz, decalNormal.xyz, opacity.www );
										}
										inputs.normal = normalize( decalNormal );
									}
									{
										float Na = saturate( length( decalNormal.xyz ) );
										if ( Na < 1.0 ) {
											float roughness = 1.0 - decalSpecular.w;
											float Na2 = Na * Na;
											float k = ( 3.0 * Na - Na * Na2 ) / ( 1.0 - Na2 );
											float variance = 1.0 / ( 2.0 * k );
											decalSpecular.w = 1.0 - fastSqrtNR0( roughness * roughness + variance );
										}
									}
									inputs.smoothness = mix( inputs.smoothness, decalSpecular.w, opacity.z );
								};
							}
						};
						vec3 ambient = vec3( 0 );
						{
							vec3 shc0 = vec3( vofi_TexCoord8.x, vofi_TexCoord8.y, vofi_TexCoord8.z );
							vec3 shc1 = vec3( vofi_TexCoord8.w, vofi_TexCoord9.x, vofi_TexCoord9.y );
							vec3 shc2 = vec3( vofi_TexCoord9.z, vofi_TexCoord9.w, vofi_TexCoord10.x );
							vec3 shc3 = vec3( vofi_TexCoord10.y, vofi_TexCoord10.z, vofi_TexCoord10.w );
							vec3 indirectDiffuse = ( ( shc0 - inputs.normal.y * shc1 ) + inputs.normal.z * shc2 ) - inputs.normal.x * shc3;
							ambient.xyz += max ( indirectDiffuse.xyz * vec3( 1 ) * saturate( _fa_freqLow[5 ].x ), vec3( 0 ) );
						};
						ambient += inputs.emissive;
						inputs.smoothness = dot( inputs.emissive.xyz, vec3( 1 ) ) > 0.0 ? -inputs.smoothness : inputs.smoothness;
						ambient = mix( GetLuma( ambient.xyz ).xxx, ambient.xyz, _fa_freqLow[6 ].www );
						inputs.ambient_lighting = ambient;
						inputs.diffuse_lighting_packed = packRGBE( ambient );
						float probes_dst_alpha = 1.0;
						for ( uint probeIdx = probesMin; probeIdx < probesMax; ) {
							uint temp = clusterlightsid[ probeIdx ].x;
							uint divergentProbeId = ( ( ( temp ) >> 24 ) & 0x00000FFF );
							uint probe_id;
							{
								probe_id = divergentProbeId; if ( probe_id >= divergentProbeId ) {
									++probeIdx;
								}
							};
							{ light_t lightParms;
								{
									int lightParms1Size = 4;
									int lightParms2Size = 4;
									int lightParms3Size = 3;
									lightParms.pos = lightparms1[ lightParms1Size * ( probe_id ) + 0 ].xyz;
									lightParms.lightParms = asuint( lightparms1[ lightParms1Size * ( probe_id ) + 0 ].w );
									lightParms.posShadow = lightparms1[ lightParms1Size * ( probe_id ) + 1 ];
									lightParms.falloffR = lightparms1[ lightParms1Size * ( probe_id ) + 2 ];
									lightParms.projS = lightparms2[ lightParms2Size * ( probe_id ) + 0 ];
									lightParms.projT = lightparms2[ lightParms2Size * ( probe_id ) + 1 ];
									lightParms.projQ = lightparms2[ lightParms2Size * ( probe_id ) + 2 ];
									lightParms.scaleBias.x = asuint( lightparms1[ lightParms1Size * ( probe_id ) + 3 ].x );
									lightParms.scaleBias.y = asuint( lightparms1[ lightParms1Size * ( probe_id ) + 3 ].y );
									lightParms.scaleBias.z = asuint( lightparms1[ lightParms1Size * ( probe_id ) + 3 ].z );
									lightParms.scaleBias.w = asuint( lightparms1[ lightParms1Size * ( probe_id ) + 3 ].w );
									lightParms.boxMin = lightparms3[ lightParms3Size * ( probe_id ) + 0 ];
									lightParms.boxMax = lightparms3[ lightParms3Size * ( probe_id ) + 1 ];
									lightParms.areaPlane = lightparms3[ lightParms3Size * ( probe_id ) + 2 ];
									lightParms.lightParms2 = asuint( lightparms2[ lightParms2Size * ( probe_id ) + 3 ].x );
									lightParms.colorPacked = asuint( lightparms2[ lightParms2Size * ( probe_id ) + 3 ].y );
									lightParms.specMultiplier = lightparms2[ lightParms2Size * ( probe_id ) + 3 ].z;
									lightParms.shadowBleedReduce = lightparms2[ lightParms2Size * ( probe_id ) + 3 ].w;
								};
								vec3 projTC = vec3( ( inputs.position.x * lightParms.projS.x + ( inputs.position.y * lightParms.projS.y + ( inputs.position.z * lightParms.projS.z + lightParms.projS.w ) ) ),
								( inputs.position.x * lightParms.projT.x + ( inputs.position.y * lightParms.projT.y + ( inputs.position.z * lightParms.projT.z + lightParms.projT.w ) ) ),
								( inputs.position.x * lightParms.projQ.x + ( inputs.position.y * lightParms.projQ.y + ( inputs.position.z * lightParms.projQ.z + lightParms.projQ.w ) ) ) );
								projTC.xy /= projTC.z;
								projTC.z = inputs.position.x * lightParms.falloffR.x + ( inputs.position.y * lightParms.falloffR.y + ( inputs.position.z * lightParms.falloffR.z + lightParms.falloffR.w ) );
								float clip_min = 1.0 / 255.0; if ( fmin3( projTC.x, projTC.y, projTC.z ) <= clip_min || fmax3( projTC.x, projTC.y, projTC.z ) >= 1.0 - clip_min ) {
									continue;
								}
								uint light_parms = lightParms.lightParms;
								vec3 light_color = unpackRGBE( lightParms.colorPacked );
								float light_spec_multiplier = lightParms.specMultiplier;
								vec3 light_position = lightParms.pos;
								float light_probe_innerfalloff = unpackR8G8B8A8( light_parms ).y;
								vec3 norm_pos_cube = projTC.xyz * 2.0 - vec3( 1.0 );
								vec3 norm_pos_sphere = norm_pos_cube * sqrt( vec3( 1.0 ) - norm_pos_cube.yzx * norm_pos_cube.yzx * 0.5 - norm_pos_cube.zxy * norm_pos_cube.zxy * 0.5 + ( norm_pos_cube.yzx * norm_pos_cube.yzx * norm_pos_cube.zxy * norm_pos_cube.zxy / 3.0 ) );
								float light_attenuation = saturate( 1 - ( length( norm_pos_sphere.xyz ) - light_probe_innerfalloff ) / ( 1.0 - light_probe_innerfalloff + 1e-6 ) );
								light_attenuation *= light_attenuation;
								light_attenuation *= lightParms.boxMin.w * probes_dst_alpha;
								probes_dst_alpha *= ( 1 - light_attenuation ); if( light_attenuation <= clip_min * 4 ) {
									continue;
								}
								vec3 light_color_final = light_color;
								light_color_final = mix( GetLuma( light_color_final.xyz ).xxx, light_color_final.xyz, _fa_freqLow[6 ].www );
								{
									float light_probe_id = unpackUintR8G8B8A8( light_parms ).z;
									vec3 diffEnvProbe = vec3( 0 );
									vec3 specEnvProbe = vec3( 0 );
									vec3 normal = inputs.normal.xyz;
									normal.x = dot( lightParms.posShadow.xyzw.xy, inputs.normal.xy );
									normal.y = dot( lightParms.posShadow.xyzw.zw, inputs.normal.xy );
									vec3 R = reflect( -inputs.view, inputs.normal );
									vec3 bmax = ( lightParms.boxMax.xyz.xyz - inputs.position.xyz ) / R;
									vec3 bmin = ( lightParms.boxMin.xyz.xyz - inputs.position.xyz ) / R;
									vec3 bminmax = max( bmax, bmin );
									float intersection_dist = fmin3( bminmax.x, bminmax.y, bminmax.z) ;
									vec3 intersection_pos = inputs.position.xyz + R.xyz * intersection_dist;
									vec3 LRtmp = normalize( intersection_pos - light_position );
									vec3 LR = LRtmp.xyz;
									LR.x = dot( lightParms.posShadow.xyzw.xy, LRtmp.xy );
									LR.y = dot( lightParms.posShadow.xyzw.zw, LRtmp.xy );
									float num_mips = 6;
									float mip_level = num_mips - num_mips * abs( inputs.smoothness );
									specEnvProbe = texCUBEARRAYlod( samp_envprobesmaparray, vec4( LR.xyz, light_probe_id ), mip_level ).xyz;
									float NdotV = saturate( dot( inputs.view.xyz, inputs.normal ) );
									vec3 envBRDF = environmentBRDF( NdotV, abs( inputs.smoothness ), unpackR10G10B10( inputs.specular_packed ) );
									specEnvProbe *= envBRDF * light_spec_multiplier;
									diffEnvProbe = mix( GetLuma( diffEnvProbe.xyz ).xxx, diffEnvProbe.xyz, _fa_freqLow[6 ].www );
									specEnvProbe = mix( GetLuma( specEnvProbe.xyz ).xxx, specEnvProbe.xyz, _fa_freqLow[6 ].www );
									inputs.specular_lighting_packed = packRGBE( specEnvProbe * light_color_final * saturate( light_attenuation ) + unpackRGBE( inputs.specular_lighting_packed ) );
								}; if( probes_dst_alpha <= clip_min * 4 ) {
									break;
								}
							};
						}
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
										float normal_bias_scale = 0.5;
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
											float fraction = ( 1.0 - max( shadowTC.x, shadowTC.y ) ) * _fa_freqLow[7 ].w;
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
														vec2 uv = shadowTC.xy * _fa_freqLow[8 ].xy;
														vec2 shadowMapSizeInv = _fa_freqLow[8 ].zw;
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
								light_color_final = mix( GetLuma( light_color_final.xyz ).xxx, light_color_final.xyz, _fa_freqLow[6 ].www );
								{
									{
										vec3 light_vector = normalize( light_position.xyz - inputs.position.xyz );
										float NdotL = dot( inputs.normal.xyz, light_vector.xyz );
										float signNdotL = sign( NdotL );
										light_vector = signNdotL >= 0 ? light_vector : reflect( light_vector, inputs.normal.xyz);
										vec3 specAlbedo = signNdotL >= 0 ? vec3( 1 ) : inputs.albedo;
										NdotL = mix( saturate( dot( inputs.normal.xyz, light_vector.xyz ) ), saturate( NdotL ), inputs.alpha );
										inputs.diffuse_lighting_packed = packRGBE( light_color_final * NdotL + unpackRGBE( inputs.diffuse_lighting_packed ) );
										vec3 spec = specBRDF( inputs.normal, inputs.view, light_vector, unpackR10G10B10( inputs.specular_packed ), inputs.smoothness );
										inputs.specular_lighting_packed = packRGBE( light_color_final * NdotL * spec.xyz * light_spec_multiplier * specAlbedo + unpackRGBE( inputs.specular_lighting_packed ) );
									};
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
				float fogScale = inputs.alpha;
				float interpolatedDepth = GetFragmentDepth( gl_FragCoord );
				vec2 screenTC = screenPosToTexcoord( gl_FragCoord.xy, _fa_freqHigh[0 ] );
				float depth = tex2Ddepth( samp_viewdepthmap, screenTC );
				vec4 playerFalloff = vec4( _fa_freqLow[9 ].xyz + vec3( 1000, 0, 0 ), 1000.0 );
				vec3 falloff = ( playerFalloff.xyz - gl_FragCoord.xyz );
				float falloff_DOT = dot3( falloff, falloff );
				falloff_DOT = sqrt( falloff_DOT );
				falloff_DOT = clamp( 1.0 - falloff_DOT / playerFalloff.w, 0.0, 1.0 );
				float finalFalloff = saturate( falloff_DOT );
				float surf_ior = 0.9;
				float refr_len = mix( 3.0, 0.0, finalFalloff );
				vec3 refraction_vec = normalize( refract( inputs.normal, -inputs.view, surf_ior ) );
				vec4 refr_tc = MatrixMul( inputs.position.xyz + refraction_vec * refr_len, mat4x4( _fa_freqLow[10 ], _fa_freqLow[11 ], _fa_freqLow[12 ], _fa_freqLow[13 ] ) );
				refr_tc.xy /= refr_tc.w;
				float smoothness = min( ( inputs.smoothness ), 0.9999 );
				float blend_ratio = fract( smoothness * ( 5.0 - 1.0 ) );
				vec3 refraction = vec3( 0 ); if ( smoothness > ( 5.0 - 1.1 ) / ( 5.0 - 1.0 ) ) {
					refraction = tex2Dlod( samp_scenemip0, vec4( refr_tc.xy, 0, 0 ) ).xyz;
				}
				else if ( smoothness > ( 5.0 - 2.0 ) / ( 5.0 - 1.0 ) ) {
					refraction = mix( tex2Dlod( samp_scenemip1, vec4( refr_tc.xy, 0, 0 ) ).xyz, tex2Dlod( samp_scenemip0, vec4( refr_tc.xy, 0, 0 ) ).xyz, blend_ratio );
				}
				else if ( smoothness > ( 5.0 - 3.0 ) / ( 5.0 - 1.0 ) ) {
					refraction = mix( tex2Dlod( samp_scenemip2, vec4( refr_tc.xy, 0, 0 ) ).xyz, tex2Dlod( samp_scenemip1, vec4( refr_tc.xy, 0, 0 ) ).xyz, blend_ratio );
				}
				else if ( smoothness > ( 5.0 - 4.0 ) / ( 5.0 - 1.0 ) ) {
					refraction = mix( tex2Dlod( samp_scenemip3, vec4( refr_tc.xy, 0, 0 ) ).xyz, tex2Dlod( samp_scenemip2, vec4( refr_tc.xy, 0, 0 ) ).xyz, blend_ratio );
				}
				else {
					refraction = mix( tex2Dlod( samp_scenemip4, vec4( refr_tc.xy, 0, 0 ) ).xyz, tex2Dlod( samp_scenemip3, vec4( refr_tc.xy, 0, 0 ) ).xyz, blend_ratio );
				}
				inputs.output_lighting.xyz = mix( inputs.albedo * refraction.xyz, inputs.diffuse_lighting, inputs.alpha ) + inputs.specular_lighting;
				fogScale = 0.666;
				vec3 fogColor;
				float fogAmount;
				{
					float FLT_EPSILON = 0.0001;
					vec3 fogLightInscatterScaledColor = _fa_freqLow[14 ].xyz * _fa_freqLow[15 ].x;
					vec3 heightFogColor = mix( fogLightInscatterScaledColor, _fa_freqLow[16 ].xyz, vofi_TexCoord5.z );
					fogAmount = saturate( vofi_TexCoord5.y + vofi_TexCoord5.x );
					float fogSafeAmount = max( fogAmount, FLT_EPSILON );
					float fogSelection = max( 0.0, ( fogSafeAmount - vofi_TexCoord5.x ) / fogSafeAmount );
					fogColor = mix( _fa_freqLow[17 ].xyz, heightFogColor, fogSelection );
					fogAmount = 1.0 - fogAmount;
				};
				inputs.output_lighting.xyz.xyz = mix( fogColor * vec3( _fa_freqLow[18 ].x ) * fogScale, inputs.output_lighting.xyz.xyz, fogAmount );
			};
			out_FragColor0 = vec4( inputs.output_lighting.xyz, inputs.alpha );
			out_FragColor0.xyz += _fa_freqLow[19 ].xyz;
		};
		{
			out_FragColor0.a = 1.0;
		};
	}
}