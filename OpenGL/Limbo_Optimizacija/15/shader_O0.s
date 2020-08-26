	.text
	.section	.AMDGPU.config
	.long	45096
	.long	259
	.long	165608
	.long	4096
	.long	45100
	.long	0
	.long	165580
	.long	16386
	.long	165584
	.long	61559
	.long	4
	.long	0
	.long	8
	.long	1
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s28, SCRATCH_RSRC_DWORD0
	s_mov_b32 s29, SCRATCH_RSRC_DWORD1
	s_mov_b32 s30, -1
	s_mov_b32 s31, 0x31c16000
	s_mov_b32 s0, exec_lo
                                        ; implicit-def: $vcc_hi
                                        ; implicit-def: $vcc_hi
	s_wqm_b32 exec_lo, exec_lo
	s_movk_i32 s1, 0x8000
	s_mov_b32 s8, s3
	s_mov_b32 s9, s1
	v_mov_b32_e32 v0, v2
	v_mov_b32_e32 v1, v3
                                        ; kill: def $vgpr4_vgpr5 killed $vgpr0_vgpr1 killed $exec
	v_mov_b32_e32 v2, v0
                                        ; kill: def $vgpr1 killed $vgpr1 killed $vgpr0_vgpr1 killed $exec
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v0, v2, attr0.x
	s_mov_b32 m0, s5
	v_interp_p2_f32_e32 v0, v1, attr0.x
	s_mov_b32 m0, s5
	v_interp_p1_f32_e32 v2, v2, attr0.y
	s_mov_b32 m0, s5
	v_interp_p2_f32_e32 v2, v1, attr0.y
	s_load_dwordx8 s[12:19], s[8:9], 0x440
	s_load_dwordx4 s[20:23], s[8:9], 0x470
	v_mov_b32_e32 v4, v0
	v_mov_b32_e32 v5, v2
	v_mov_b32_e32 v7, v5
	v_mov_b32_e32 v6, v4
	s_waitcnt lgkmcnt(0)
	image_sample v[8:11], v[6:7], s[12:19], s[20:23] dmask:0xf dim:SQ_RSRC_IMG_2D
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v11
	v_mov_b32_e32 v1, v10
	v_mov_b32_e32 v2, v8
                                        ; kill: def $vgpr9 killed $vgpr9 killed $vgpr8_vgpr9_vgpr10_vgpr11 killed $exec
	s_load_dwordx8 s[12:19], s[8:9], 0x400
	s_load_dwordx4 s[20:23], s[8:9], 0x430
	s_and_b32 exec_lo, exec_lo, s0
	s_waitcnt lgkmcnt(0)
	image_sample v[10:13], v[4:5], s[12:19], s[20:23] dmask:0xf dim:SQ_RSRC_IMG_2D
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v3, v13
	v_mov_b32_e32 v8, v12
	v_mov_b32_e32 v15, v10
                                        ; kill: def $vgpr11 killed $vgpr11 killed $vgpr10_vgpr11_vgpr12_vgpr13 killed $exec
	s_mov_b32 s0, 0x31016fac
	s_mov_b32 s1, 32
	s_mov_b32 s3, 0x8000
	s_mov_b32 s20, s2
	s_mov_b32 s21, s3
	s_mov_b32 s22, s1
	s_mov_b32 s23, s0
	s_buffer_load_dword s0, s[20:23], 0x10
	s_buffer_load_dword s1, s[20:23], 0x14
	s_buffer_load_dword s2, s[20:23], 0x18
	s_buffer_load_dword s3, s[20:23], 0x1c
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v10, s1, v9
	v_fmac_f32_e32 v10, s0, v2
	v_fmac_f32_e32 v10, s2, v1
	v_fmac_f32_e32 v10, s3, v0
	s_buffer_load_dword s5, s[20:23], 0x0
	s_buffer_load_dword s7, s[20:23], 0x4
	s_buffer_load_dword s10, s[20:23], 0x8
	s_buffer_load_dword s11, s[20:23], 0xc
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v12, s7, v9
	v_fmac_f32_e32 v12, s5, v2
	v_fmac_f32_e32 v12, s10, v1
	v_fmac_f32_e32 v12, s11, v0
	v_sub_f32_e32 v10, v10, v12
	s_mov_b32 s24, 1.0
	v_min_f32_e64 v10, s24, |v10|
	v_sub_f32_e32 v12, s24, v10
	v_mul_f32_e32 v13, s1, v11
	v_fmac_f32_e32 v13, s0, v15
	v_fmac_f32_e32 v13, s2, v8
	v_fmac_f32_e32 v13, s3, v3
	v_mul_f32_e32 v16, s7, v11
	v_fmac_f32_e32 v16, s5, v15
	v_fmac_f32_e32 v16, s10, v8
	v_fmac_f32_e32 v16, s11, v3
	v_sub_f32_e32 v13, v13, v16
	v_min_f32_e64 v13, s24, |v13|
	v_sub_f32_e32 v16, s24, v13
	v_max_f32_e32 v17, v2, v9
	v_max_f32_e32 v17, v17, v1
	v_mul_f32_e32 v10, v10, v17
	v_mov_b32_e32 v17, v10
	v_fmac_f32_e32 v17, v12, v2
	v_mov_b32_e32 v2, v10
	v_fmac_f32_e32 v2, v12, v9
	v_mov_b32_e32 v9, v10
	v_fmac_f32_e32 v9, v12, v1
	v_fmac_f32_e32 v10, v12, v0
	v_max_f32_e32 v0, v15, v11
	v_max_f32_e32 v0, v0, v8
	v_mul_f32_e32 v0, v13, v0
	v_mov_b32_e32 v1, v0
	v_fmac_f32_e32 v1, v16, v15
	v_mov_b32_e32 v12, v0
	v_fmac_f32_e32 v12, v16, v11
	v_mov_b32_e32 v11, v0
	v_fmac_f32_e32 v11, v16, v8
	v_fmac_f32_e32 v0, v16, v3
	v_mul_f32_e32 v1, s5, v1
	v_mul_f32_e32 v3, s7, v12
	v_mul_f32_e32 v8, s10, v11
	v_mul_f32_e32 v0, s11, v0
	v_fmac_f32_e32 v1, s0, v17
	v_fmac_f32_e32 v3, s1, v2
	v_fmac_f32_e32 v8, s2, v9
	v_fmac_f32_e32 v0, s3, v10
                                        ; implicit-def: $sgpr0
                                        ; implicit-def: $sgpr1
                                        ; implicit-def: $sgpr2
                                        ; implicit-def: $sgpr3
	buffer_store_dword v0, off, s[28:31], s6 offset:4 ; 4-byte Folded Spill
	v_mov_b32_e32 v0, v1
	v_mov_b32_e32 v1, v3
	v_mov_b32_e32 v2, v8
	buffer_load_dword v3, off, s[28:31], s6 offset:4 ; 4-byte Folded Reload
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v4, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v5, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v6, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v7, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v8, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v9, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v10, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v11, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v12, s5
                                        ; implicit-def: $sgpr5
	v_mov_b32_e32 v13, s5
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0x0
	; return to shader part epilog
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 596
; NumSgprs: 34
; NumVgprs: 18
; ScratchSize: 8
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 34
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
