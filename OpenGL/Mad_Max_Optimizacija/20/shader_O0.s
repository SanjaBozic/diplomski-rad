	.text
	.section	.AMDGPU.config
	.long	45608
	.long	323
	.long	165608
	.long	4096
	.long	4
	.long	17
	.long	8
	.long	5
	.text
	.globl	main                    ; -- Begin function main
	.p2align	8
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %main_body
	s_mov_b32 s36, SCRATCH_RSRC_DWORD0
	s_mov_b32 s37, SCRATCH_RSRC_DWORD1
	s_mov_b32 s38, -1
	s_mov_b32 s39, 0x31c16000
                                        ; implicit-def: $vcc_hi
	s_mov_b32 exec_lo, -1
                                        ; implicit-def: $vcc_hi
	s_mov_b32 s12, s28
	s_mov_b32 s13, s29
	s_mov_b32 s14, s30
	s_mov_b32 s15, s31
	s_mov_b32 s16, s24
	s_mov_b32 s17, s25
	s_mov_b32 s18, s26
	s_mov_b32 s19, s27
	s_mov_b32 s32, s20
	s_mov_b32 s33, s21
	s_mov_b32 s34, s22
	s_mov_b32 s35, s23
	s_mov_b32 s0, 0xf000000
	s_and_b32 s0, s3, s0
	s_mov_b32 s1, 0
	s_cmp_lg_u32 s0, s1
	buffer_store_dword v11, off, s[36:39], s5 offset:4 ; 4-byte Folded Spill
	buffer_store_dword v10, off, s[36:39], s5 offset:8 ; 4-byte Folded Spill
	buffer_store_dword v9, off, s[36:39], s5 offset:12 ; 4-byte Folded Spill
	buffer_store_dword v0, off, s[36:39], s5 offset:16 ; 4-byte Folded Spill
	v_writelane_b32 v25, s10, 0
	v_writelane_b32 v25, s3, 1
	v_writelane_b32 v25, s2, 2
	v_writelane_b32 v25, s12, 3
	v_writelane_b32 v25, s13, 4
	v_writelane_b32 v25, s14, 5
	v_writelane_b32 v25, s15, 6
	v_writelane_b32 v25, s16, 7
	v_writelane_b32 v25, s17, 8
	v_writelane_b32 v25, s18, 9
	v_writelane_b32 v25, s19, 10
	v_writelane_b32 v25, s32, 11
	v_writelane_b32 v25, s33, 12
	v_writelane_b32 v25, s34, 13
	v_writelane_b32 v25, s35, 14
	s_cbranch_scc1 BB0_2
; %bb.1:                                ; %if5020
	v_readlane_b32 s0, v25, 2
	s_bfe_u32 s1, s0, 0x9000c
	s_mov_b32 s2, 10
	s_lshr_b32 s2, s0, s2
	s_mov_b32 s3, 0x1ff000
	s_and_b32 s2, s2, s3
	s_or_b32 s1, s2, s1
	s_mov_b32 m0, s1
	s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
BB0_2:                                  ; %endif5020
	v_readlane_b32 s0, v25, 1
	s_bfe_u32 s1, s0, 0x80008
	s_mov_b32 s2, 0
	s_mov_b32 s3, -1
	v_mbcnt_lo_u32_b32_e64 v0, s3, s2
	v_mbcnt_hi_u32_b32_e64 v0, s3, v0
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s2, exec_lo
	s_and_b32 s1, s2, s1
	buffer_store_dword v0, off, s[36:39], s5 offset:20 ; 4-byte Folded Spill
	v_writelane_b32 v25, s2, 15
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
	buffer_load_dword v3, off, s[36:39], s5 offset:16 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	exp prim v3, off, off, off done
BB0_4:                                  ; %endif6001
	v_readlane_b32 s0, v25, 15
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_movk_i32 s1, 0xff
	v_readlane_b32 s2, v25, 1
	s_and_b32 s1, s2, s1
	buffer_load_dword v0, off, s[36:39], s5 offset:20 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_cmp_gt_u32_e64 s1, s1, v0
	s_mov_b32 s3, exec_lo
	s_and_b32 s1, s3, s1
	v_writelane_b32 v25, s3, 16
	s_mov_b32 exec_lo, s1
	; mask branch BB0_6
	s_cbranch_execz BB0_6
BB0_5:                                  ; %if11500
	s_mov_b32 s0, 0
	buffer_load_dword v0, off, s[36:39], s5 offset:12 ; 4-byte Folded Reload
	v_readlane_b32 s8, v25, 11
	v_readlane_b32 s9, v25, 12
	v_readlane_b32 s10, v25, 13
	v_readlane_b32 s11, v25, 14
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
	buffer_load_dword v1, off, s[36:39], s5 offset:8 ; 4-byte Folded Reload
	v_readlane_b32 s12, v25, 7
	v_readlane_b32 s13, v25, 8
	v_readlane_b32 s14, v25, 9
	v_readlane_b32 s15, v25, 10
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_xy v[2:3], v1, s[12:15], s0 idxen
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v8, v2
                                        ; kill: def $vgpr3 killed $vgpr3 killed $vgpr2_vgpr3 killed $exec
	buffer_load_dword v2, off, s[36:39], s5 offset:4 ; 4-byte Folded Reload
	v_readlane_b32 s16, v25, 3
	v_readlane_b32 s17, v25, 4
	v_readlane_b32 s18, v25, 5
	v_readlane_b32 s19, v25, 6
	s_waitcnt vmcnt(0)
	s_nop 0
	s_nop 0
	s_nop 0
	s_nop 0
	buffer_load_format_x v9, v2, s[16:19], s0 idxen
	s_mov_b32 s1, 0x3e800000
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v9, s1, v9
	v_trunc_f32_e32 v9, v9
	s_mov_b32 s1, 0
	v_max_f32_e32 v9, s1, v9
	s_mov_b32 s1, 0x40e00000
	v_min_f32_e32 v9, s1, v9
	v_cvt_i32_f32_e32 v9, v9
	s_mov_b32 s1, 4
                                        ; implicit-def: $sgpr2
	v_lshlrev_b32_e32 v10, s1, v9
	s_mov_b32 s2, 6
                                        ; implicit-def: $sgpr3
	v_lshlrev_b32_e32 v9, s2, v9
	s_mov_b32 s2, 0x31016fac
	s_movk_i32 s3, 0x280
	s_mov_b32 s4, 0x8000
	v_readlane_b32 s6, v25, 0
	s_mov_b32 s20, s6
	s_mov_b32 s21, s4
	s_mov_b32 s22, s3
	s_mov_b32 s23, s2
	v_mov_b32_e32 v11, s1
	v_or_b32_e32 v11, v9, v11
	buffer_load_dword v11, v11, s[20:23], s0 offen offset:4
	s_mov_b32 s1, 20
	v_mov_b32_e32 v12, s1
	v_or_b32_e32 v12, v9, v12
	buffer_load_dword v12, v12, s[20:23], s0 offen offset:4
	v_mov_b32_e32 v13, v9
	buffer_load_dword v13, v13, s[20:23], s0 offen
	v_mov_b32_e32 v14, v9
	buffer_load_dword v14, v14, s[20:23], s0 offen offset:4
	v_mov_b32_e32 v15, v9
	buffer_load_dword v15, v15, s[20:23], s0 offen offset:12
	v_mov_b32_e32 v16, v9
	buffer_load_dword v16, v16, s[20:23], s0 offen offset:16
	v_mov_b32_e32 v17, v9
	buffer_load_dword v17, v17, s[20:23], s0 offen offset:20
	v_mov_b32_e32 v18, v9
	buffer_load_dword v18, v18, s[20:23], s0 offen offset:28
	v_mov_b32_e32 v19, v9
	buffer_load_dword v19, v19, s[20:23], s0 offen offset:32
	v_mov_b32_e32 v20, v9
	buffer_load_dword v20, v20, s[20:23], s0 offen offset:36
	v_mov_b32_e32 v21, v9
	buffer_load_dword v21, v21, s[20:23], s0 offen offset:44
	v_mov_b32_e32 v22, v9
	buffer_load_dword v22, v22, s[20:23], s0 offen offset:48
	v_mov_b32_e32 v23, v9
	buffer_load_dword v23, v23, s[20:23], s0 offen offset:52
	v_mov_b32_e32 v24, v9
	buffer_load_dword v24, v24, s[20:23], s0 offen offset:60
	s_waitcnt vmcnt(8)
	v_mul_f32_e32 v16, v16, v6
	s_waitcnt vmcnt(7)
	v_mul_f32_e32 v17, v17, v6
	v_mul_f32_e32 v12, v12, v6
	s_waitcnt vmcnt(6)
	v_mul_f32_e32 v6, v18, v6
	v_fmac_f32_e32 v16, v13, v5
	v_fmac_f32_e32 v17, v14, v5
	v_fmac_f32_e32 v12, v11, v5
	v_fmac_f32_e32 v6, v15, v5
	s_mov_b32 s1, 36
	v_mov_b32_e32 v5, s1
	v_or_b32_e32 v5, v9, v5
	buffer_load_dword v5, v5, s[20:23], s0 offen offset:4
	s_waitcnt vmcnt(6)
	v_fmac_f32_e32 v16, v19, v7
	s_waitcnt vmcnt(5)
	v_fmac_f32_e32 v17, v20, v7
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v12, v5, v7
	v_fmac_f32_e32 v6, v21, v7
	s_mov_b32 s1, 52
	v_mov_b32_e32 v5, s1
	v_or_b32_e32 v5, v9, v5
	buffer_load_dword v5, v5, s[20:23], s0 offen offset:4
	v_fmac_f32_e32 v16, v22, v4
	v_fmac_f32_e32 v17, v23, v4
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v12, v5, v4
	v_fmac_f32_e32 v6, v24, v4
	v_mov_b32_e32 v4, v10
	buffer_load_dword v4, v4, s[20:23], s0 offen offset:512
	v_mov_b32_e32 v5, v10
	buffer_load_dword v5, v5, s[20:23], s0 offen offset:516
	v_mov_b32_e32 v7, v10
	buffer_load_dword v7, v7, s[20:23], s0 offen offset:520
	buffer_load_dword v9, v10, s[20:23], s0 offen offset:524
	s_waitcnt vmcnt(1)
	v_fmac_f32_e32 v4, v8, v7
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v5, v3, v9
	exp pos0 v16, v17, v12, v6 done vm
                                        ; implicit-def: $sgpr0
	v_mov_b32_e32 v3, s0
                                        ; implicit-def: $sgpr0
	s_waitcnt expcnt(0)
	v_mov_b32_e32 v6, s0
	exp param0 v4, v5, v3, v6
BB0_6:                                  ; %endif6002
	v_readlane_b32 s0, v25, 16
	s_waitcnt expcnt(0)
	s_or_b32 exec_lo, exec_lo, s0
	s_endpgm
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 1248
; NumSgprs: 42
; NumVgprs: 26
; ScratchSize: 24
; MemoryBound: 0
; FloatMode: 192
; IeeeMode: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 5
; VGPRBlocks: 3
; NumSGPRsForWavesPerEU: 42
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
