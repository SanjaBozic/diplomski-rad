	.text
	.section	.AMDGPU.config
	.long	45608
	.long	321
	.long	165608
	.long	8192
	.long	4
	.long	18
	.long	8
	.long	17
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s40, SCRATCH_RSRC_DWORD0
	s_mov_b32 s41, SCRATCH_RSRC_DWORD1
	s_mov_b32 s42, -1
	s_mov_b32 s43, 0x31c16000
                                        ; implicit-def: $vcc_hi
	s_mov_b32 exec_lo, -1
                                        ; implicit-def: $vcc_hi
	s_mov_b32 s16, s28
	s_mov_b32 s17, s29
	s_mov_b32 s18, s30
	s_mov_b32 s19, s31
	s_mov_b32 s32, s24
	s_mov_b32 s33, s25
	s_mov_b32 s34, s26
	s_mov_b32 s35, s27
	s_mov_b32 s36, s20
	s_mov_b32 s37, s21
	s_mov_b32 s38, s22
	s_mov_b32 s39, s23
	s_mov_b32 s0, 0xf000000
	s_and_b32 s0, s3, s0
	s_mov_b32 s1, 0
	s_cmp_lg_u32 s0, s1
	buffer_store_dword v11, off, s[40:43], s5 offset:4 ; 4-byte Folded Spill
	buffer_store_dword v10, off, s[40:43], s5 offset:8 ; 4-byte Folded Spill
	buffer_store_dword v9, off, s[40:43], s5 offset:12 ; 4-byte Folded Spill
	buffer_store_dword v0, off, s[40:43], s5 offset:16 ; 4-byte Folded Spill
	v_writelane_b32 v13, s12, 0
	v_writelane_b32 v13, s10, 1
	v_writelane_b32 v13, s3, 2
	v_writelane_b32 v13, s2, 3
	v_writelane_b32 v13, s16, 4
	v_writelane_b32 v13, s17, 5
	v_writelane_b32 v13, s18, 6
	v_writelane_b32 v13, s19, 7
	v_writelane_b32 v13, s32, 8
	v_writelane_b32 v13, s33, 9
	v_writelane_b32 v13, s34, 10
	v_writelane_b32 v13, s35, 11
	v_writelane_b32 v13, s36, 12
	v_writelane_b32 v13, s37, 13
	v_writelane_b32 v13, s38, 14
	v_writelane_b32 v13, s39, 15
	s_cbranch_scc1 BB0_2
; %bb.1:                                ; %if5020
	v_readlane_b32 s0, v13, 3
	s_bfe_u32 s1, s0, 0x9000c
	s_mov_b32 s2, 10
	s_lshr_b32 s2, s0, s2
	s_mov_b32 s3, 0x1ff000
	s_and_b32 s2, s2, s3
	s_or_b32 s1, s2, s1
	s_mov_b32 m0, s1
	s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
BB0_2:                                  ; %endif5020
	v_readlane_b32 s0, v13, 2
	s_bfe_u32 s1, s0, 0x80008
	s_mov_b32 s2, 0
	s_mov_b32 s3, -1
	v_mbcnt_lo_u32_b32_e64 v0, s3, s2
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s2, exec_lo
	s_and_b32 s1, s2, s1
	buffer_store_dword v0, off, s[40:43], s5 offset:20 ; 4-byte Folded Spill
	v_writelane_b32 v13, s2, 16
	s_mov_b32 exec_lo, s1
	; mask branch BB0_4
	s_cbranch_execz BB0_4
BB0_3:                                  ; %if6001
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v0, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v1, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v2, s0
	buffer_load_dword v3, off, s[40:43], s5 offset:16 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	exp prim v3, off, off, off done
BB0_4:                                  ; %endif6001
	v_readlane_b32 s0, v13, 16
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_movk_i32 s1, 0xff
	v_readlane_b32 s2, v13, 2
	s_and_b32 s1, s2, s1
	buffer_load_dword v0, off, s[40:43], s5 offset:20 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s3, exec_lo
	s_and_b32 s1, s3, s1
	v_writelane_b32 v13, s3, 17
	s_mov_b32 exec_lo, s1
	; mask branch BB0_7
	s_cbranch_execz BB0_7
BB0_5:                                  ; %if11500
	s_mov_b32 s0, 0
	buffer_load_dword v0, off, s[40:43], s5 offset:8 ; 4-byte Folded Reload
	v_readlane_b32 s8, v13, 8
	v_readlane_b32 s9, v13, 9
	v_readlane_b32 s10, v13, 10
	v_readlane_b32 s11, v13, 11
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xyzw v[1:4], v0, s[8:11], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v5, v1
	v_mov_b32_e32 v6, v2
	v_mov_b32_e32 v7, v3
                                        ; kill: def $vgpr4 killed $vgpr4 killed $vgpr1_vgpr2_vgpr3_vgpr4 killed $exec
	s_mov_b32 s1, 1
	v_readlane_b32 s2, v13, 0
	s_and_b32 s1, s2, s1
	s_cmp_eq_u32 s1, s0
	v_mov_b32_e32 v1, v5
	v_mov_b32_e32 v2, v6
	v_mov_b32_e32 v3, v7
	v_mov_b32_e32 v8, v4
	buffer_store_dword v5, off, s[40:43], s5 offset:24 ; 4-byte Folded Spill
	buffer_store_dword v6, off, s[40:43], s5 offset:28 ; 4-byte Folded Spill
	buffer_store_dword v7, off, s[40:43], s5 offset:32 ; 4-byte Folded Spill
	buffer_store_dword v4, off, s[40:43], s5 offset:36 ; 4-byte Folded Spill
	buffer_store_dword v1, off, s[40:43], s5 offset:40 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[40:43], s5 offset:44 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[40:43], s5 offset:48 ; 4-byte Folded Spill
	buffer_store_dword v8, off, s[40:43], s5 offset:52 ; 4-byte Folded Spill
	s_cbranch_scc1 BB0_8
; %bb.6:                                ; %if6502
	s_mov_b32 s0, 0
	buffer_load_dword v0, off, s[40:43], s5 offset:24 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_max_f32_e32 v1, s0, v0
	s_mov_b32 s1, 1.0
	v_min_f32_e32 v1, s1, v1
	buffer_load_dword v2, off, s[40:43], s5 offset:28 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_max_f32_e32 v3, s0, v2
	v_min_f32_e32 v3, s1, v3
	buffer_load_dword v4, off, s[40:43], s5 offset:32 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_max_f32_e32 v5, s0, v4
	v_min_f32_e32 v5, s1, v5
	buffer_load_dword v6, off, s[40:43], s5 offset:36 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_max_f32_e32 v7, s0, v6
	v_min_f32_e32 v7, s1, v7
	buffer_store_dword v1, off, s[40:43], s5 offset:40 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[40:43], s5 offset:44 ; 4-byte Folded Spill
	buffer_store_dword v5, off, s[40:43], s5 offset:48 ; 4-byte Folded Spill
	buffer_store_dword v7, off, s[40:43], s5 offset:52 ; 4-byte Folded Spill
	s_branch BB0_8
BB0_7:                                  ; %Flow
	v_readlane_b32 s0, v13, 17
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_branch BB0_9
BB0_8:                                  ; %endif6502
	buffer_load_dword v0, off, s[40:43], s5 offset:48 ; 4-byte Folded Reload
	buffer_load_dword v1, off, s[40:43], s5 offset:44 ; 4-byte Folded Reload
	buffer_load_dword v2, off, s[40:43], s5 offset:40 ; 4-byte Folded Reload
	s_mov_b32 s0, 0
	buffer_load_dword v3, off, s[40:43], s5 offset:12 ; 4-byte Folded Reload
	v_readlane_b32 s8, v13, 12
	v_readlane_b32 s9, v13, 13
	v_readlane_b32 s10, v13, 14
	v_readlane_b32 s11, v13, 15
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xyzw v[4:7], v3, s[8:11], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v8, v4
	v_mov_b32_e32 v9, v5
	v_mov_b32_e32 v10, v6
                                        ; kill: def $vgpr7 killed $vgpr7 killed $vgpr4_vgpr5_vgpr6_vgpr7 killed $exec
	buffer_load_dword v4, off, s[40:43], s5 offset:4 ; 4-byte Folded Reload
	v_readlane_b32 s12, v13, 4
	v_readlane_b32 s13, v13, 5
	v_readlane_b32 s14, v13, 6
	v_readlane_b32 s15, v13, 7
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_x v5, v4, s[12:15], s0 idxen
	v_nop
	s_mov_b32 s0, 0x31016fac
	s_mov_b32 s1, 64
	s_mov_b32 s2, 0x8000
	v_readlane_b32 s3, v13, 1
	s_mov_b32 s16, s3
	s_mov_b32 s17, s2
	s_mov_b32 s18, s1
	s_mov_b32 s19, s0
	s_buffer_load_dword s0, s[16:19], 0x0
	s_buffer_load_dword s1, s[16:19], 0x4
	s_buffer_load_dword s2, s[16:19], 0x8
	s_buffer_load_dword s4, s[16:19], 0xc
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v6, s0, v8
	v_mul_f32_e32 v11, s1, v8
	v_mul_f32_e32 v12, s2, v8
	v_mul_f32_e32 v8, s4, v8
	s_buffer_load_dword s0, s[16:19], 0x10
	s_buffer_load_dword s1, s[16:19], 0x14
	s_buffer_load_dword s2, s[16:19], 0x18
	s_buffer_load_dword s4, s[16:19], 0x1c
	s_waitcnt lgkmcnt(0)
	v_fmac_f32_e32 v6, s0, v9
	v_fmac_f32_e32 v11, s1, v9
	v_fmac_f32_e32 v12, s2, v9
	v_fmac_f32_e32 v8, s4, v9
	s_buffer_load_dword s0, s[16:19], 0x20
	s_buffer_load_dword s1, s[16:19], 0x24
	s_buffer_load_dword s2, s[16:19], 0x28
	s_buffer_load_dword s4, s[16:19], 0x2c
	s_waitcnt lgkmcnt(0)
	v_fmac_f32_e32 v6, s0, v10
	v_fmac_f32_e32 v11, s1, v10
	v_fmac_f32_e32 v12, s2, v10
	v_fmac_f32_e32 v8, s4, v10
	s_buffer_load_dword s0, s[16:19], 0x30
	s_buffer_load_dword s1, s[16:19], 0x34
	s_buffer_load_dword s2, s[16:19], 0x38
	s_buffer_load_dword s4, s[16:19], 0x3c
	s_waitcnt lgkmcnt(0)
	v_fmac_f32_e32 v6, s0, v7
	v_fmac_f32_e32 v11, s1, v7
	v_fmac_f32_e32 v12, s2, v7
	v_fmac_f32_e32 v8, s4, v7
	exp pos0 v6, v11, v12, v8 vm
                                        ; implicit-def: $sgpr0
	s_waitcnt expcnt(0)
	v_mov_b32_e32 v6, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v7, s0
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v8, s0
	s_waitcnt vmcnt(0)
	exp pos1 v5, off, off, off done
	s_waitcnt expcnt(0)
	buffer_load_dword v5, off, s[40:43], s5 offset:52 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	exp param0 v2, v1, v0, v5
	s_branch BB0_7
BB0_9:                                  ; %endif6002
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 1332
; NumSgprs: 46
; NumVgprs: 14
; ScratchSize: 56
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 5
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 46
; NumVGPRsForWavesPerEU: 14
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
