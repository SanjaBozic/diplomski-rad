	.text
	.section	.AMDGPU.config
	.long	45096
	.long	67
	.long	165608
	.long	0
	.long	45100
	.long	0
	.long	165580
	.long	17152
	.long	165584
	.long	62327
	.long	4
	.long	0
	.long	8
	.long	0
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s0, s2
	s_mov_b32 s6, s3
	s_mov_b32 s3, 0x31016fac
	s_mov_b32 s2, 64
	s_mov_b32 s1, 0x8000
	v_cvt_i32_f32_e32 v0, v13
	s_mov_b32 m0, s5
	v_cvt_i32_f32_e32 v1, v12
	s_movk_i32 s7, 0x8000
	s_buffer_load_dwordx4 s[0:3], s[0:3], 0x0
	v_mov_b32_e32 v14, v16
	v_interp_mov_f32_e32 v2, p0, attr0.x
                                        ; implicit-def: $vcc_hi
	s_load_dwordx4 s[8:11], s[6:7], 0x410
	s_waitcnt lgkmcnt(0)
	v_add_nc_u32_e32 v0, s1, v0
	v_mul_lo_u32 v2, v2, s3
	v_add_nc_u32_e32 v1, s0, v1
	v_mul_lo_u32 v0, v0, s2
	v_add3_u32 v0, v1, v0, v2
	buffer_load_format_xyzw v[0:3], v0, s[8:11], 0 idxen
	s_waitcnt vmcnt(0)
	; return to shader part epilog
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 116
; NumSgprs: 14
; NumVgprs: 17
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 14
; NumVGPRsForWavesPerEU: 26
; Occupancy: 20
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 0
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn----gfx1010"
