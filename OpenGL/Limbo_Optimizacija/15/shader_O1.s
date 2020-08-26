	.text
	.section	.AMDGPU.config
	.long	45096
	.long	195
	.long	165608
	.long	0
	.long	45100
	.long	0
	.long	165580
	.long	16386
	.long	165584
	.long	61559
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
	s_mov_b32 s16, exec_lo
                                        ; implicit-def: $vcc_hi
	s_wqm_b32 exec_lo, exec_lo
	s_mov_b32 s6, s3
	s_mov_b32 s20, s2
	s_movk_i32 s7, 0x8000
	s_load_dwordx8 s[8:15], s[6:7], 0x440
	s_load_dwordx4 s[0:3], s[6:7], 0x470
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v4, v2, attr0.x
	v_interp_p1_f32_e32 v5, v2, attr0.y
	v_interp_p2_f32_e32 v4, v3, attr0.x
	v_interp_p2_f32_e32 v5, v3, attr0.y
	s_and_b32 exec_lo, exec_lo, s16
	s_waitcnt lgkmcnt(0)
	image_sample v[0:3], v[4:5], s[8:15], s[0:3] dmask:0xf dim:SQ_RSRC_IMG_2D
	v_nop
	s_load_dwordx8 s[12:19], s[6:7], 0x400
	s_load_dwordx4 s[24:27], s[6:7], 0x430
	s_mov_b32 s23, 0x31016fac
	s_mov_b32 s22, 32
	s_mov_b32 s21, 0x8000
	s_buffer_load_dwordx4 s[0:3], s[20:23], 0x10
	s_buffer_load_dwordx4 s[8:11], s[20:23], 0x0
	s_waitcnt lgkmcnt(0)
	image_sample v[4:7], v[4:5], s[12:19], s[24:27] dmask:0xf dim:SQ_RSRC_IMG_2D
	s_waitcnt vmcnt(1)
	v_mul_f32_e32 v8, s1, v1
	v_mul_f32_e32 v9, s9, v1
	v_max3_f32 v10, v0, v1, v2
	v_fmac_f32_e32 v8, s0, v0
	v_fmac_f32_e32 v9, s8, v0
	v_fmac_f32_e32 v8, s2, v2
	v_fmac_f32_e32 v9, s10, v2
	v_fmac_f32_e32 v8, s3, v3
	v_fmac_f32_e32 v9, s11, v3
	v_sub_f32_e32 v8, v8, v9
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v9, s1, v5
	v_mul_f32_e32 v11, s9, v5
	v_max3_f32 v12, v4, v5, v6
	v_min_f32_e64 v8, |v8|, 1.0
	v_fmac_f32_e32 v9, s0, v4
	v_fmac_f32_e32 v11, s8, v4
	v_sub_f32_e32 v13, 1.0, v8
	v_fmac_f32_e32 v9, s2, v6
	v_fmac_f32_e32 v11, s10, v6
	v_mul_f32_e32 v8, v8, v10
	v_fmac_f32_e32 v9, s3, v7
	v_fmac_f32_e32 v11, s11, v7
	v_fma_f32 v10, v13, v0, v8
	v_fma_f32 v15, v13, v1, v8
	v_fma_f32 v16, v13, v2, v8
	v_fmac_f32_e32 v8, v13, v3
	v_sub_f32_e32 v0, v9, v11
	v_min_f32_e64 v3, |v0|, 1.0
	v_sub_f32_e32 v1, 1.0, v3
	v_mul_f32_e32 v3, v3, v12
	v_fma_f32 v0, v1, v4, v3
	v_fma_f32 v2, v1, v5, v3
	v_fma_f32 v4, v1, v6, v3
	v_fmac_f32_e32 v3, v1, v7
	v_mul_f32_e32 v0, s8, v0
	v_mul_f32_e32 v1, s9, v2
	v_mul_f32_e32 v2, s10, v4
	v_mul_f32_e32 v3, s11, v3
	v_fmac_f32_e32 v0, s0, v10
	v_fmac_f32_e32 v1, s1, v15
	v_fmac_f32_e32 v2, s2, v16
	v_fmac_f32_e32 v3, s3, v8
	; return to shader part epilog
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 356
; NumSgprs: 30
; NumVgprs: 17
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 3
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 30
; NumVGPRsForWavesPerEU: 26
; Occupancy: 20
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 0
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn----gfx1010"
