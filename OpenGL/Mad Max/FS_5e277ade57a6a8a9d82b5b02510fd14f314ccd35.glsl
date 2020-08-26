#version 460 core
// ps_5_0
// Checksum: 91823d86_af039cb5_48ee2dab_1696ba50
// Name: fxaa

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3, r4, r5;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


uvec4 movc(in uvec4 src0, in uvec4 src1, in uvec4 src2)
{
	return mix(src2, src1, bvec4(src0));
}

uvec3 movc(in uvec3 src0, in uvec3 src1, in uvec3 src2)
{
	return mix(src2, src1, bvec3(src0));
}

uvec2 movc(in uvec2 src0, in uvec2 src1, in uvec2 src2)
{
	return mix(src2, src1, bvec2(src0));
}

uint movc(in uint src0, in uint src1, in uint src2)
{
	return mix(src2, src1, bool(src0));
}

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0 = (textureLod(resourceSamplerPair_0_ps, v1.v.xy, float(0.00000000f)));
	r1.x = ((textureLodOffset(resourceSamplerPair_0_ps, v1.v.xy, float(0.00000000f), ivec2(0, 1))).wxyz).x;
	r1.y = ((textureLodOffset(resourceSamplerPair_0_ps, v1.v.xy, float(0.00000000f), ivec2(1, 0))).xwyz).y;
	r1.z = ((textureLodOffset(resourceSamplerPair_0_ps, v1.v.xy, float(0.00000000f), ivec2(0, -1))).xywz).z;
	r1.w = ((textureLodOffset(resourceSamplerPair_0_ps, v1.v.xy, float(0.00000000f), ivec2(-1, 0)))).w;
	r2.x = max(r0.w, r1.x);
	r2.y = min(r0.w, r1.x);
	r2.x = max(r1.y, r2.x);
	r2.y = min(r1.y, r2.y);
	r2.z = max(r1.w, r1.z);
	r2.w = min(r1.w, r1.z);
	r2.x = max(r2.x, r2.z);
	r2.y = min(r2.y, r2.w);
	r2.z = r2.x * float(0.165999994f);
	r2.x = -r2.y + r2.x;
	r2.y = max(r2.z, float(0.0833000019f));
	r2.y = intBitsToFloat(r2.x >= r2.y ? int(0xffffffff) : int(0x00000000));
	if (floatBitsToUint(r2.y) != uint(0))
	{
		r2.y = ((textureLodOffset(resourceSamplerPair_0_ps, v1.v.xy, float(0.00000000f), ivec2(-1, -1))).xwyz).y;
		r2.z = ((textureLodOffset(resourceSamplerPair_0_ps, v1.v.xy, float(0.00000000f), ivec2(1, 1))).xywz).z;
		r2.w = ((textureLodOffset(resourceSamplerPair_0_ps, v1.v.xy, float(0.00000000f), ivec2(1, -1)))).w;
		r3.x = ((textureLodOffset(resourceSamplerPair_0_ps, v1.v.xy, float(0.00000000f), ivec2(-1, 1))).wxyz).x;
		r3.yz = r1.xy + r1.zw;
		r2.x = float(1.00000000f) / r2.x;
		r3.w = r3.z + r3.y;
		r3.y = fma(r0.w, float(-2.00000000f), r3.y);
		r3.z = fma(r0.w, float(-2.00000000f), r3.z);
		r4.x = r2.z + r2.w;
		r2.w = r2.w + r2.y;
		r4.y = fma(r1.y, float(-2.00000000f), r4.x);
		r2.w = fma(r1.z, float(-2.00000000f), r2.w);
		r2.y = r2.y + r3.x;
		r2.z = r2.z + r3.x;
		r3.x = fma(abs(r3.y), float(2.00000000f), abs(r4.y));
		r2.w = fma(abs(r3.z), float(2.00000000f), abs(r2.w));
		r3.y = fma(r1.w, float(-2.00000000f), r2.y);
		r2.z = fma(r1.x, float(-2.00000000f), r2.z);
		r3.x = r3.x + abs(r3.y);
		r2.z = r2.w + abs(r2.z);
		r2.y = r4.x + r2.y;
		r2.z = intBitsToFloat(r3.x >= r2.z ? int(0xffffffff) : int(0x00000000));
		r2.y = fma(r3.w, float(2.00000000f), r2.y);
		r1.xz = uintBitsToFloat(movc(floatBitsToUint(r2.zz), floatBitsToUint(r1.xz), floatBitsToUint(r1.yw)));
		r1.y = uintBitsToFloat(movc(floatBitsToUint(r2.z), floatBitsToUint(idx_uniforms0_ps.cb0[8].w), floatBitsToUint(idx_uniforms0_ps.cb0[8].z)));
		r1.w = fma(r2.y, float(0.0833333358f), -r0.w);
		r2.yw = -r0.ww + r1.zx;
		r1.xz = r0.ww + r1.xz;
		r3.x = intBitsToFloat(abs(r2.y) >= abs(r2.w) ? int(0xffffffff) : int(0x00000000));
		r2.y = max(abs(r2.w), abs(r2.y));
		r1.y = uintBitsToFloat(movc(floatBitsToUint(r3.x), floatBitsToUint(-1.f * r1.y), floatBitsToUint(r1.y)));
		r1.w = saturate(r2.x * abs(r1.w));
		r2.x = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(idx_uniforms0_ps.cb0[8].z));
		r2.w = uintBitsToFloat(movc(floatBitsToUint(r2.z), uint(0x00000000), floatBitsToUint(idx_uniforms0_ps.cb0[8].w)));
		r3.yz = fma(r1.yy, vec2(0.500000000f, 0.500000000f), v1.v.xy);
		r3.y = uintBitsToFloat(movc(floatBitsToUint(r2.z), floatBitsToUint(v1.v.x), floatBitsToUint(r3.y)));
		r3.z = uintBitsToFloat(movc(floatBitsToUint(r2.z), floatBitsToUint(r3.z), floatBitsToUint(v1.v.y)));
		r4.xy = -r2.xw + r3.yz;
		r5.xy = r2.xw + r3.yz;
		r3.y = fma(r1.w, float(-2.00000000f), float(3.00000000f));
		r3.z = ((textureLod(resourceSamplerPair_0_ps, r4.xy, float(0.00000000f))).xywz).z;
		r1.w = r1.w * r1.w;
		r3.w = ((textureLod(resourceSamplerPair_0_ps, r5.xy, float(0.00000000f)))).w;
		r1.x = uintBitsToFloat(movc(floatBitsToUint(r3.x), floatBitsToUint(r1.z), floatBitsToUint(r1.x)));
		r1.z = r2.y * float(0.250000000f);
		r2.y = fma(-r1.x, float(0.500000000f), r0.w);
		r1.w = r1.w * r3.y;
		r2.y = intBitsToFloat(r2.y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
		r3.x = fma(-r1.x, float(0.500000000f), r3.z);
		r3.y = fma(-r1.x, float(0.500000000f), r3.w);
		r3.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(abs(r3.xy), r1.zz))));
		r4.zw = -r2.xw + r4.xy;
		r4.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.x), floatBitsToUint(r4.z)));
		r4.z = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.y), floatBitsToUint(r4.w)));
		r4.yw = uintBitsToFloat(~floatBitsToUint(r3.zw));
		r4.y = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r4.y));
		r4.w = r2.x + r5.x;
		r5.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.x), floatBitsToUint(r4.w)));
		r4.w = r2.w + r5.y;
		r5.z = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.y), floatBitsToUint(r4.w)));
		if (floatBitsToUint(r4.y) != uint(0))
		{
			if (floatBitsToUint(r3.z) == uint(0))
			{
				r3.x = ((textureLod(resourceSamplerPair_0_ps, r4.xz, float(0.00000000f))).wxyz).x;
			}
			if (floatBitsToUint(r3.w) == uint(0))
			{
				r3.y = ((textureLod(resourceSamplerPair_0_ps, r5.xz, float(0.00000000f))).xwyz).y;
			}
			r4.y = fma(-r1.x, float(0.500000000f), r3.x);
			r3.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r3.x), floatBitsToUint(r4.y)));
			r3.z = fma(-r1.x, float(0.500000000f), r3.y);
			r3.y = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r3.y), floatBitsToUint(r3.z)));
			r3.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(abs(r3.xy), r1.zz))));
			r4.y = -r2.x + r4.x;
			r4.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.x), floatBitsToUint(r4.y)));
			r4.y = -r2.w + r4.z;
			r4.z = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.z), floatBitsToUint(r4.y)));
			r4.yw = uintBitsToFloat(~floatBitsToUint(r3.zw));
			r4.y = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r4.y));
			r4.w = r2.x + r5.x;
			r5.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.x), floatBitsToUint(r4.w)));
			r4.w = r2.w + r5.z;
			r5.z = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.z), floatBitsToUint(r4.w)));
			if (floatBitsToUint(r4.y) != uint(0))
			{
				if (floatBitsToUint(r3.z) == uint(0))
				{
					r3.x = ((textureLod(resourceSamplerPair_0_ps, r4.xz, float(0.00000000f))).wxyz).x;
				}
				if (floatBitsToUint(r3.w) == uint(0))
				{
					r3.y = ((textureLod(resourceSamplerPair_0_ps, r5.xz, float(0.00000000f))).xwyz).y;
				}
				r4.y = fma(-r1.x, float(0.500000000f), r3.x);
				r3.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r3.x), floatBitsToUint(r4.y)));
				r3.z = fma(-r1.x, float(0.500000000f), r3.y);
				r3.y = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r3.y), floatBitsToUint(r3.z)));
				r3.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(abs(r3.xy), r1.zz))));
				r4.y = -r2.x + r4.x;
				r4.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.x), floatBitsToUint(r4.y)));
				r4.y = -r2.w + r4.z;
				r4.z = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.z), floatBitsToUint(r4.y)));
				r4.yw = uintBitsToFloat(~floatBitsToUint(r3.zw));
				r4.y = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r4.y));
				r4.w = r2.x + r5.x;
				r5.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.x), floatBitsToUint(r4.w)));
				r4.w = r2.w + r5.z;
				r5.z = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.z), floatBitsToUint(r4.w)));
				if (floatBitsToUint(r4.y) != uint(0))
				{
					if (floatBitsToUint(r3.z) == uint(0))
					{
						r3.x = ((textureLod(resourceSamplerPair_0_ps, r4.xz, float(0.00000000f))).wxyz).x;
					}
					if (floatBitsToUint(r3.w) == uint(0))
					{
						r3.y = ((textureLod(resourceSamplerPair_0_ps, r5.xz, float(0.00000000f))).xwyz).y;
					}
					r4.y = fma(-r1.x, float(0.500000000f), r3.x);
					r3.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r3.x), floatBitsToUint(r4.y)));
					r3.z = fma(-r1.x, float(0.500000000f), r3.y);
					r3.y = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r3.y), floatBitsToUint(r3.z)));
					r3.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(abs(r3.xy), r1.zz))));
					r4.y = -r2.x + r4.x;
					r4.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.x), floatBitsToUint(r4.y)));
					r4.y = -r2.w + r4.z;
					r4.z = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.z), floatBitsToUint(r4.y)));
					r4.yw = uintBitsToFloat(~floatBitsToUint(r3.zw));
					r4.y = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r4.y));
					r4.w = r2.x + r5.x;
					r5.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.x), floatBitsToUint(r4.w)));
					r4.w = r2.w + r5.z;
					r5.z = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.z), floatBitsToUint(r4.w)));
					if (floatBitsToUint(r4.y) != uint(0))
					{
						if (floatBitsToUint(r3.z) == uint(0))
						{
							r3.x = ((textureLod(resourceSamplerPair_0_ps, r4.xz, float(0.00000000f))).wxyz).x;
						}
						if (floatBitsToUint(r3.w) == uint(0))
						{
							r3.y = ((textureLod(resourceSamplerPair_0_ps, r5.xz, float(0.00000000f))).xwyz).y;
						}
						r4.y = fma(-r1.x, float(0.500000000f), r3.x);
						r3.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r3.x), floatBitsToUint(r4.y)));
						r3.z = fma(-r1.x, float(0.500000000f), r3.y);
						r3.y = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r3.y), floatBitsToUint(r3.z)));
						r3.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(abs(r3.xy), r1.zz))));
						r4.y = fma(-r2.x, float(1.50000000f), r4.x);
						r4.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.x), floatBitsToUint(r4.y)));
						r4.y = fma(-r2.w, float(1.50000000f), r4.z);
						r4.z = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.z), floatBitsToUint(r4.y)));
						r4.yw = uintBitsToFloat(~floatBitsToUint(r3.zw));
						r4.y = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r4.y));
						r4.w = fma(r2.x, float(1.50000000f), r5.x);
						r5.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.x), floatBitsToUint(r4.w)));
						r4.w = fma(r2.w, float(1.50000000f), r5.z);
						r5.z = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.z), floatBitsToUint(r4.w)));
						if (floatBitsToUint(r4.y) != uint(0))
						{
							if (floatBitsToUint(r3.z) == uint(0))
							{
								r3.x = ((textureLod(resourceSamplerPair_0_ps, r4.xz, float(0.00000000f))).wxyz).x;
							}
							if (floatBitsToUint(r3.w) == uint(0))
							{
								r3.y = ((textureLod(resourceSamplerPair_0_ps, r5.xz, float(0.00000000f))).xwyz).y;
							}
							r4.y = fma(-r1.x, float(0.500000000f), r3.x);
							r3.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r3.x), floatBitsToUint(r4.y)));
							r3.z = fma(-r1.x, float(0.500000000f), r3.y);
							r3.y = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r3.y), floatBitsToUint(r3.z)));
							r3.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(abs(r3.xy), r1.zz))));
							r4.y = fma(-r2.x, float(2.00000000f), r4.x);
							r4.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.x), floatBitsToUint(r4.y)));
							r4.y = fma(-r2.w, float(2.00000000f), r4.z);
							r4.z = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.z), floatBitsToUint(r4.y)));
							r4.yw = uintBitsToFloat(~floatBitsToUint(r3.zw));
							r4.y = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r4.y));
							r4.w = fma(r2.x, float(2.00000000f), r5.x);
							r5.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.x), floatBitsToUint(r4.w)));
							r4.w = fma(r2.w, float(2.00000000f), r5.z);
							r5.z = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.z), floatBitsToUint(r4.w)));
							if (floatBitsToUint(r4.y) != uint(0))
							{
								if (floatBitsToUint(r3.z) == uint(0))
								{
									r3.x = ((textureLod(resourceSamplerPair_0_ps, r4.xz, float(0.00000000f))).wxyz).x;
								}
								if (floatBitsToUint(r3.w) == uint(0))
								{
									r3.y = ((textureLod(resourceSamplerPair_0_ps, r5.xz, float(0.00000000f))).xwyz).y;
								}
								r4.y = fma(-r1.x, float(0.500000000f), r3.x);
								r3.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r3.x), floatBitsToUint(r4.y)));
								r3.z = fma(-r1.x, float(0.500000000f), r3.y);
								r3.y = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r3.y), floatBitsToUint(r3.z)));
								r3.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(abs(r3.xy), r1.zz))));
								r4.y = fma(-r2.x, float(2.00000000f), r4.x);
								r4.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.x), floatBitsToUint(r4.y)));
								r4.y = fma(-r2.w, float(2.00000000f), r4.z);
								r4.z = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.z), floatBitsToUint(r4.y)));
								r4.yw = uintBitsToFloat(~floatBitsToUint(r3.zw));
								r4.y = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r4.y));
								r4.w = fma(r2.x, float(2.00000000f), r5.x);
								r5.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.x), floatBitsToUint(r4.w)));
								r4.w = fma(r2.w, float(2.00000000f), r5.z);
								r5.z = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.z), floatBitsToUint(r4.w)));
								if (floatBitsToUint(r4.y) != uint(0))
								{
									if (floatBitsToUint(r3.z) == uint(0))
									{
										r3.x = ((textureLod(resourceSamplerPair_0_ps, r4.xz, float(0.00000000f))).wxyz).x;
									}
									if (floatBitsToUint(r3.w) == uint(0))
									{
										r3.y = ((textureLod(resourceSamplerPair_0_ps, r5.xz, float(0.00000000f))).xwyz).y;
									}
									r4.y = fma(-r1.x, float(0.500000000f), r3.x);
									r3.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r3.x), floatBitsToUint(r4.y)));
									r3.z = fma(-r1.x, float(0.500000000f), r3.y);
									r3.y = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r3.y), floatBitsToUint(r3.z)));
									r3.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(abs(r3.xy), r1.zz))));
									r4.y = fma(-r2.x, float(2.00000000f), r4.x);
									r4.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.x), floatBitsToUint(r4.y)));
									r4.y = fma(-r2.w, float(2.00000000f), r4.z);
									r4.z = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.z), floatBitsToUint(r4.y)));
									r4.yw = uintBitsToFloat(~floatBitsToUint(r3.zw));
									r4.y = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r4.y));
									r4.w = fma(r2.x, float(2.00000000f), r5.x);
									r5.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.x), floatBitsToUint(r4.w)));
									r4.w = fma(r2.w, float(2.00000000f), r5.z);
									r5.z = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.z), floatBitsToUint(r4.w)));
									if (floatBitsToUint(r4.y) != uint(0))
									{
										if (floatBitsToUint(r3.z) == uint(0))
										{
											r3.x = ((textureLod(resourceSamplerPair_0_ps, r4.xz, float(0.00000000f))).wxyz).x;
										}
										if (floatBitsToUint(r3.w) == uint(0))
										{
											r3.y = ((textureLod(resourceSamplerPair_0_ps, r5.xz, float(0.00000000f))).xwyz).y;
										}
										r4.y = fma(-r1.x, float(0.500000000f), r3.x);
										r3.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r3.x), floatBitsToUint(r4.y)));
										r3.z = fma(-r1.x, float(0.500000000f), r3.y);
										r3.y = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r3.y), floatBitsToUint(r3.z)));
										r3.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(abs(r3.xy), r1.zz))));
										r4.y = fma(-r2.x, float(2.00000000f), r4.x);
										r4.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.x), floatBitsToUint(r4.y)));
										r4.y = fma(-r2.w, float(2.00000000f), r4.z);
										r4.z = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.z), floatBitsToUint(r4.y)));
										r4.yw = uintBitsToFloat(~floatBitsToUint(r3.zw));
										r4.y = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r4.y));
										r4.w = fma(r2.x, float(2.00000000f), r5.x);
										r5.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.x), floatBitsToUint(r4.w)));
										r4.w = fma(r2.w, float(2.00000000f), r5.z);
										r5.z = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.z), floatBitsToUint(r4.w)));
										if (floatBitsToUint(r4.y) != uint(0))
										{
											if (floatBitsToUint(r3.z) == uint(0))
											{
												r3.x = ((textureLod(resourceSamplerPair_0_ps, r4.xz, float(0.00000000f))).wxyz).x;
											}
											if (floatBitsToUint(r3.w) == uint(0))
											{
												r3.y = ((textureLod(resourceSamplerPair_0_ps, r5.xz, float(0.00000000f))).xwyz).y;
											}
											r4.y = fma(-r1.x, float(0.500000000f), r3.x);
											r3.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r3.x), floatBitsToUint(r4.y)));
											r3.z = fma(-r1.x, float(0.500000000f), r3.y);
											r3.y = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r3.y), floatBitsToUint(r3.z)));
											r3.zw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(abs(r3.xy), r1.zz))));
											r4.y = fma(-r2.x, float(4.00000000f), r4.x);
											r4.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.x), floatBitsToUint(r4.y)));
											r4.y = fma(-r2.w, float(4.00000000f), r4.z);
											r4.z = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r4.z), floatBitsToUint(r4.y)));
											r4.yw = uintBitsToFloat(~floatBitsToUint(r3.zw));
											r4.y = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r4.y));
											r4.w = fma(r2.x, float(4.00000000f), r5.x);
											r5.x = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.x), floatBitsToUint(r4.w)));
											r4.w = fma(r2.w, float(4.00000000f), r5.z);
											r5.z = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r5.z), floatBitsToUint(r4.w)));
											if (floatBitsToUint(r4.y) != uint(0))
											{
												if (floatBitsToUint(r3.z) == uint(0))
												{
													r3.x = ((textureLod(resourceSamplerPair_0_ps, r4.xz, float(0.00000000f))).wxyz).x;
												}
												if (floatBitsToUint(r3.w) == uint(0))
												{
													r3.y = ((textureLod(resourceSamplerPair_0_ps, r5.xz, float(0.00000000f))).xwyz).y;
												}
												r4.y = fma(-r1.x, float(0.500000000f), r3.x);
												r3.x = uintBitsToFloat(movc(floatBitsToUint(r3.z), floatBitsToUint(r3.x), floatBitsToUint(r4.y)));
												r1.x = fma(-r1.x, float(0.500000000f), r3.y);
												r3.y = uintBitsToFloat(movc(floatBitsToUint(r3.w), floatBitsToUint(r3.y), floatBitsToUint(r1.x)));
												r1.xz = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(greaterThanEqual(abs(r3.xy), r1.zz))));
												r3.z = fma(-r2.x, float(8.00000000f), r4.x);
												r4.x = uintBitsToFloat(movc(floatBitsToUint(r1.x), floatBitsToUint(r4.x), floatBitsToUint(r3.z)));
												r3.z = fma(-r2.w, float(8.00000000f), r4.z);
												r4.z = uintBitsToFloat(movc(floatBitsToUint(r1.x), floatBitsToUint(r4.z), floatBitsToUint(r3.z)));
												r1.x = fma(r2.x, float(8.00000000f), r5.x);
												r5.x = uintBitsToFloat(movc(floatBitsToUint(r1.z), floatBitsToUint(r5.x), floatBitsToUint(r1.x)));
												r1.x = fma(r2.w, float(8.00000000f), r5.z);
												r5.z = uintBitsToFloat(movc(floatBitsToUint(r1.z), floatBitsToUint(r5.z), floatBitsToUint(r1.x)));
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		r1.x = -r4.x + v1.v.x;
		r1.z = r5.x + -v1.v.x;
		r2.x = -r4.z + v1.v.y;
		r1.x = uintBitsToFloat(movc(floatBitsToUint(r2.z), floatBitsToUint(r1.x), floatBitsToUint(r2.x)));
		r2.x = r5.z + -v1.v.y;
		r1.z = uintBitsToFloat(movc(floatBitsToUint(r2.z), floatBitsToUint(r1.z), floatBitsToUint(r2.x)));
		r2.xw = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(lessThan(r3.xy, vec2(0.00000000f, 0.00000000f)))));
		r3.x = r1.x + r1.z;
		r2.xy = intBitsToFloat(mix ( ivec2(0x00000000),ivec2(0xffffffff),bvec2(notEqual(floatBitsToInt(r2.xw), floatBitsToInt(r2.yy)))));
		r2.w = float(1.00000000f) / r3.x;
		r3.x = intBitsToFloat(r1.x < r1.z ? int(0xffffffff) : int(0x00000000));
		r1.x = min(r1.z, r1.x);
		r1.z = uintBitsToFloat(movc(floatBitsToUint(r3.x), floatBitsToUint(r2.x), floatBitsToUint(r2.y)));
		r1.w = r1.w * r1.w;
		r1.x = fma(r1.x, -r2.w, float(0.500000000f));
		r1.w = r1.w * float(0.750000000f);
		r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
		r1.x = max(r1.w, r1.x);
		r1.xy = fma(r1.xx, r1.yy, v1.v.xy);
		r2.x = uintBitsToFloat(movc(floatBitsToUint(r2.z), floatBitsToUint(v1.v.x), floatBitsToUint(r1.x)));
		r2.y = uintBitsToFloat(movc(floatBitsToUint(r2.z), floatBitsToUint(r1.y), floatBitsToUint(v1.v.y)));
		r0.xyz = ((textureLod(resourceSamplerPair_0_ps, r2.xy, float(0.00000000f)))).xyz;
	}
	o0 = r0;
	return;
}

